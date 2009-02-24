unit UCadUnidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, ExtCtrls, ComCtrls, Mask, DBCtrls, Grids, DBGrids, DB,
  rxToolEdit, RXDBCtrl;

type
  TCadUnidadeForm = class(TForm)
    AbaSuperior: TPageControl;
    tsConsulta: TTabSheet;
    tsManutencao: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BTPesquisar: THTMLButton;
    CBPesquisar: TComboBox;
    EditPesquisar: TEdit;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    BTInserir: THTMLButton;
    BTAlterar: THTMLButton;
    BTSair: THTMLButton;
    Panel4: TPanel;
    Label5: TLabel;
    DBText1: TDBText;
    Label3: TLabel;
    DBEditNome: TDBEdit;
    Panel3: TPanel;
    BTGravar: THTMLButton;
    BTCancelar: THTMLButton;
    BTExcluir: THTMLButton;
    Label28: TLabel;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    Label6: TLabel;
    CBTipo: TComboBox;
    CBTipoGrava: TComboBox;
    Label7: TLabel;
    procedure BTInserirClick(Sender: TObject);
    procedure BTAlterarClick(Sender: TObject);
    procedure BTSairClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure CBPesquisarChange(Sender: TObject);
    procedure EditPesquisarChange(Sender: TObject);
    procedure BTPesquisarClick(Sender: TObject);
    procedure BTGravarClick(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure BTExcluirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure tsConsultaShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tsManutencaoShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadUnidadeForm: TCadUnidadeForm;
  UnidadeID : Integer;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TCadUnidadeForm.BTAlterarClick(Sender: TObject);
begin
  AbaSuperior.ActivePage := tsManutencao;
  DBEditNome.SetFocus;
end;

procedure TCadUnidadeForm.BTCancelarClick(Sender: TObject);
begin
  BancoDeDados.qryCadUnidade.Cancel;
  BancoDeDados.qryCsUnidade.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadUnidadeForm.BTExcluirClick(Sender: TObject);
begin
  try
    BancoDeDados.qryCadUnidade.Delete;
  except on E: EDatabaseError do
      if (Pos('violates foreign key',e.message) > 0) then
        MessageDlg('Não foi possivel excluir este registros.'+#13+
          'Foram localizados lançamentos feitos para este registro.',mtWarning,[mbOK],0);
  end;
  BancoDeDados.qryCsUnidade.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadUnidadeForm.BTGravarClick(Sender: TObject);
begin
  if not(BancoDeDados.qryCadUnidade.state in [dsInsert,dsEdit]) then
     BancoDeDados.qryCadUnidade.Edit;
     showmessage(inttostr(CBTipo.ItemIndex));
  BancoDeDados.qryCadUnidadetipo.value := CBTipo.ItemIndex;
  BancoDeDados.qryCadUnidade.ApplyUpdates;
  AbaSuperior.ActivePage := tsConsulta;
end;

procedure TCadUnidadeForm.BTInserirClick(Sender: TObject);
begin
  if not (BancoDeDados.qryCadUnidade.Active) then
    BancoDeDados.qryCadUnidade.Open;
  BancoDeDados.qryCadUnidade.Append;
  AbaSuperior.ActivePage := tsManutencao;
  DBEditNome.SetFocus;
end;

procedure TCadUnidadeForm.BTPesquisarClick(Sender: TObject);
var
  Campo : ShortString;
begin
  case (CBPesquisar.ItemIndex) of
    0: Campo := 'idunidade';
    1: Campo := 'descricao';
    2: Campo := 'abreviacao';
    3: Campo := 'tipo';
  end;
  with BancodeDados.qryCsUnidade do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from cadUnidade');
      if (CBPesquisar.ItemIndex in [0]) then
        begin
          if (EditPesquisar.Text <> '') then
            SQL.Add(' where '+Campo+' = '+EditPesquisar.Text);
        end
      else
        if (CBPesquisar.ItemIndex in [3]) then
          begin
             if (EditPesquisar.Text <> '') then
                begin
                 SQL.Add(' where '+Campo+' = '+EditPesquisar.Text);
                 SQL.Add(' and tipo = '+IntToStr(CBTipo.ItemIndex));
                end;
          end
        else
          SQL.Add('where '+Campo+' ilike '+''''+EditPesquisar.Text+'%'+'''');
      SQL.Add('order by '+Campo);
      Open;
    end;
end;

procedure TCadUnidadeForm.BTSairClick(Sender: TObject);
begin
  Close;
end;

procedure TCadUnidadeForm.CBPesquisarChange(Sender: TObject);
begin
  EditPesquisar.Clear;
  EditPesquisar.SetFocus;
  if (CBPesquisar.ItemIndex in [3]) then
    CBTipo.Enabled := True
  else
    CBTipo.Enabled := False;
end;

procedure TCadUnidadeForm.DBGrid1DblClick(Sender: TObject);
begin
  BTAlterarClick(Self);
end;

procedure TCadUnidadeForm.EditPesquisarChange(Sender: TObject);
begin
  BTPesquisarClick(Self);
end;

procedure TCadUnidadeForm.FormCreate(Sender: TObject);
begin
  AbaSuperior.ActivePage := tsConsulta;
end;

procedure TCadUnidadeForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    begin
      Key := #0;
      Perform(WM_NEXTDLGCTL,0,0);
    end;
  if (key = #27) then
    begin
      key := #0;
      Close;
    end;
end;

procedure TCadUnidadeForm.tsConsultaShow(Sender: TObject);
begin
  BTPesquisarClick(Self);
  EditPesquisar.SetFocus;
end;

procedure TCadUnidadeForm.tsManutencaoShow(Sender: TObject);
begin
  if not (BancodeDados.qryCadUnidade.State in [dsInsert]) then
    with BancoDeDados.qryCadUnidade do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from cadunidade where idunidade = '+
            IntToStr(BancoDeDados.qryCsUnidadeidunidade.Value));
        Open;
        Edit;
      end;
end;

end.
