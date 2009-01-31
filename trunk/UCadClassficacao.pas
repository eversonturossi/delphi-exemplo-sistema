unit UCadClassficacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, ExtCtrls, ComCtrls, Mask, DBCtrls, Grids, DBGrids, DB,
  rxToolEdit, RXDBCtrl;

type
  TCadClassificacaoForm = class(TForm)
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
    DBCheckBox2: TDBCheckBox;
    Label3: TLabel;
    DBEditNome: TDBEdit;
    Panel3: TPanel;
    BTGravar: THTMLButton;
    BTCancelar: THTMLButton;
    BTExcluir: THTMLButton;
    Label28: TLabel;
    DBDateEdit1: TDBDateEdit;
    CHApenasAtivos: TCheckBox;
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
    procedure tsManutencaoShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadClassificacaoForm: TCadClassificacaoForm;
  ClassificacaoID : Integer;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TCadClassificacaoForm.BTAlterarClick(Sender: TObject);
begin
  AbaSuperior.ActivePage := tsManutencao;
  DBEditNome.SetFocus;
end;

procedure TCadClassificacaoForm.BTCancelarClick(Sender: TObject);
begin
  BancoDeDados.qryCadClassificacao.Cancel;
  BancoDeDados.qryCsGrupo.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadClassificacaoForm.BTExcluirClick(Sender: TObject);
begin
  try
    BancoDeDados.qryCadClassificacao.Delete;
  except on E: EDatabaseError do
      if (Pos('violates foreign key',e.message) > 0) then
        MessageDlg('Não foi possivel excluir este registros.'+#13+
          'Foram localizados lançamentos feitos para este registro.',mtWarning,[mbOK],0);
  end;
  BancoDeDados.qryCsClassificacao.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadClassificacaoForm.BTGravarClick(Sender: TObject);
begin
  BancoDeDados.qryCadClassificacao.ApplyUpdates;
  AbaSuperior.ActivePage := tsConsulta;
end;

procedure TCadClassificacaoForm.BTInserirClick(Sender: TObject);
begin
  if not (BancoDeDados.qryCadClassificacao.Active) then
    BancoDeDados.qryCadClassificacao.Open;
  BancoDeDados.qryCadClassificacao.Append;
  AbaSuperior.ActivePage := tsManutencao;
  DBEditNome.SetFocus;
end;

procedure TCadClassificacaoForm.BTPesquisarClick(Sender: TObject);
var
  Campo : ShortString;
begin
  case (CBPesquisar.ItemIndex) of
    0: Campo := 'idclassificacao';
    1: Campo := 'descricao';
  end;
  with BancodeDados.qryCsClassificacao do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from cadclassificacao');
      if (CBPesquisar.ItemIndex in [0]) then
        begin
          if (EditPesquisar.Text <> '') then
              if (TestaInteiro(EditPesquisar.Text)) then
                SQL.Add(' where '+Campo+' = '+EditPesquisar.Text)
              else
                begin
                  MessageDlg('Para este filtro, são permitidos apenas números.',mtWarning,[mbOK],0);
                  EditPesquisar.SetFocus;
                  Abort;
                end;
        end
      else
        SQL.Add('where '+Campo+' ilike '+''''+EditPesquisar.Text+'%'+'''');
      if (CHApenasAtivos.Checked) then
        if (Pos('where',SQL.Text) > 0) then
          SQL.Add(' and ativo = '+QuotedStr('TRUE'))
        else
          SQL.Add(' where ativo = '+QuotedStr('TRUE'));
      SQL.Add('order by '+Campo);
      Open;
    end;
end;

procedure TCadClassificacaoForm.BTSairClick(Sender: TObject);
begin
  Close;
end;

procedure TCadClassificacaoForm.CBPesquisarChange(Sender: TObject);
begin
  EditPesquisar.Clear;
  EditPesquisar.SetFocus;
end;

procedure TCadClassificacaoForm.DBGrid1DblClick(Sender: TObject);
begin
  BTAlterarClick(Self);
end;

procedure TCadClassificacaoForm.EditPesquisarChange(Sender: TObject);
begin
  BTPesquisarClick(Self);
end;

procedure TCadClassificacaoForm.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TCadClassificacaoForm.FormShow(Sender: TObject);
begin
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
  CHApenasAtivos.Checked := True;
  BTPesquisarClick(Self);
end;

procedure TCadClassificacaoForm.tsConsultaShow(Sender: TObject);
begin
  BTPesquisarClick(Self);
  EditPesquisar.SetFocus;
end;

procedure TCadClassificacaoForm.tsManutencaoShow(Sender: TObject);
begin
  if not (BancodeDados.qryCadClassificacao.State in [dsInsert]) then
    with BancoDeDados.qryCadClassificacao do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from cadclassificacao where idclassificacao = '+
            IntToStr(BancoDeDados.qryCsClassificacaoidclassificacao.Value));
        Open;
        Edit;
      end;
end;

end.
