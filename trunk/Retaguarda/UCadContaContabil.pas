unit UCadContaContabil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, ExtCtrls, ComCtrls, Mask, DBCtrls, Grids, DBGrids, DB,
  rxToolEdit, RXDBCtrl;

type
  TCadContaContabilForm = class(TForm)
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
    CHApenasAtivos: TCheckBox;
    DBDateEdit1: TDBDateEdit;
    CBTipoContaContabil: TComboBox;
    Label4: TLabel;
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
  CadContaContabilForm: TCadContaContabilForm;
  ContaContabilID : Integer;
implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TCadContaContabilForm.BTAlterarClick(Sender: TObject);
begin
  AbaSuperior.ActivePage := tsManutencao;
  DBEditNome.SetFocus;
end;

procedure TCadContaContabilForm.BTCancelarClick(Sender: TObject);
begin
  BancoDeDados.qryCadContaContabil.Cancel;
  BancoDeDados.qryCsContaContabil.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadContaContabilForm.BTExcluirClick(Sender: TObject);
begin
  try
    BancoDeDados.qryCadContaContabil.Delete;
  except on E: EDatabaseError do
      if (Pos('violates foreign key',e.message) > 0) then
        MessageDlg('Não foi possivel excluir este registros.'+#13+
          'Foram localizados lançamentos feitos para este registro.',mtWarning,[mbOK],0);
  end;
  BancoDeDados.qryCsContaContabil.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadContaContabilForm.BTGravarClick(Sender: TObject);
begin
  if not (BancoDeDados.qryCadContaContabil.State in [dsEdit, dsInsert]) then
    BancoDeDados.qryCadContaContabil.Edit;
  BancoDeDados.qryCadContaContabiltipo.Value := CBTipoContaContabil.ItemIndex;
  BancoDeDados.qryCadContaContabil.Post;
  AbaSuperior.ActivePage := tsConsulta;
end;

procedure TCadContaContabilForm.BTInserirClick(Sender: TObject);
begin
  CBTipoContaContabil.ItemIndex := -1;
  if not (BancoDeDados.qryCadContaContabil.Active) then
    BancoDeDados.qryCadContaContabil.Open;
  BancoDeDados.qryCadContaContabil.Append;
  AbaSuperior.ActivePage := tsManutencao;
  DBEditNome.SetFocus;
end;

procedure TCadContaContabilForm.BTPesquisarClick(Sender: TObject);
var
  Campo : ShortString;
begin
  case (CBPesquisar.ItemIndex) of
    0: Campo := 'idconta_contabil';
    1: Campo := 'descricao';
  end;
  with BancodeDados.qryCsContaContabil do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from cadconta_contabil');
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

procedure TCadContaContabilForm.BTSairClick(Sender: TObject);
begin
  Close;
end;

procedure TCadContaContabilForm.CBPesquisarChange(Sender: TObject);
begin
  EditPesquisar.Clear;
  EditPesquisar.SetFocus;
end;

procedure TCadContaContabilForm.DBGrid1DblClick(Sender: TObject);
begin
  BTAlterarClick(Self);
end;

procedure TCadContaContabilForm.EditPesquisarChange(Sender: TObject);
begin
  BTPesquisarClick(Self);
end;

procedure TCadContaContabilForm.FormCreate(Sender: TObject);
begin
  AbaSuperior.ActivePage := tsConsulta;
  CHApenasAtivos.Checked := True;
end;

procedure TCadContaContabilForm.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TCadContaContabilForm.tsConsultaShow(Sender: TObject);
begin
  BTPesquisarClick(Self);
  EditPesquisar.SetFocus;
end;

procedure TCadContaContabilForm.tsManutencaoShow(Sender: TObject);
begin
  if not (BancodeDados.qryCadContaContabil.State in [dsInsert]) then
    with BancoDeDados.qryCadContaContabil do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from cadconta_contabil where idconta_contabil = '+
            IntToStr(BancoDeDados.qryCsContaContabilidconta_contabil.Value));
        Open;
        Edit;
      end;
  if not (BancoDeDados.qryCadContaContabiltipo.IsNull) then
    CBTipoContaContabil.ItemIndex := BancoDeDados.qryCadContaContabiltipo.Value;
end;

end.
