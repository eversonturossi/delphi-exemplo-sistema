unit UCadMovimentoCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, ExtCtrls, ComCtrls, Mask, DBCtrls, Grids, DBGrids, DB,
  rxToolEdit, RXDBCtrl, rxCurrEdit, Buttons;

type
  TCadMovimentoCaixaForm = class(TForm)
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
    GroupBox1: TGroupBox;
    DatDe: TDateEdit;
    Label4: TLabel;
    Label6: TLabel;
    DatAte: TDateEdit;
    Label7: TLabel;
    CBPeriodo: TComboBox;
    DBEditCliente: TDBEdit;
    BTCliente: TSpeedButton;
    DBText2: TDBText;
    Label9: TLabel;
    Label22: TLabel;
    Shape1: TShape;
    Label8: TLabel;
    DLBContaOrigem: TDBLookupComboBox;
    Label10: TLabel;
    DBLContaDestino: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label13: TLabel;
    Shape2: TShape;
    DBEditSaldo: TDBText;
    GroupBox3: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    Label14: TLabel;
    SpeedButton1: TSpeedButton;
    GroupBox4: TGroupBox;
    DBText4: TDBText;
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
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadMovimentoCaixaForm: TCadMovimentoCaixaForm;
  MovimentoCaixaID : Integer;
implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TCadMovimentoCaixaForm.BTAlterarClick(Sender: TObject);
begin
  AbaSuperior.ActivePage := tsManutencao;
  DBEditNome.SetFocus;
end;

procedure TCadMovimentoCaixaForm.BTCancelarClick(Sender: TObject);
begin
  BancoDeDados.qryCadMovimentoCaixa.Cancel;
  BancoDeDados.qryCsMovimentoCaixa.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadMovimentoCaixaForm.BTExcluirClick(Sender: TObject);
begin
  try
    BancoDeDados.qryCadMovimentoCaixa.Delete;
  except on E: EDatabaseError do
      if (Pos('violates foreign key',e.message) > 0) then
        MessageDlg('Não foi possivel excluir este registros.'+#13+
          'Foram localizados lançamentos feitos para este registro.',mtWarning,[mbOK],0);
  end;
  BancoDeDados.qryCsMovimentoCaixa.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadMovimentoCaixaForm.BTGravarClick(Sender: TObject);
begin
  BancoDeDados.qryCadMovimentoCaixa.Post;
  AbaSuperior.ActivePage := tsConsulta;
end;

procedure TCadMovimentoCaixaForm.BTInserirClick(Sender: TObject);
begin
  if not (BancoDeDados.qryCadMovimentoCaixa.Active) then
    BancoDeDados.qryCadMovimentoCaixa.Open;
  BancoDeDados.qryCadMovimentoCaixa.Append;
  AbaSuperior.ActivePage := tsManutencao;
  DBEditNome.SetFocus;
end;

procedure TCadMovimentoCaixaForm.BTPesquisarClick(Sender: TObject);
var
  Campo : ShortString;
begin
  case (CBPesquisar.ItemIndex) of
    0: Campo := 'idmovimento_caixa';
    1: Campo := 'historico';
  end;
  with BancodeDados.qryCsMovimentoCaixa do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from lanmovimento_caixa');
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

procedure TCadMovimentoCaixaForm.BTSairClick(Sender: TObject);
begin
  Close;
end;

procedure TCadMovimentoCaixaForm.CBPesquisarChange(Sender: TObject);
begin
  EditPesquisar.Clear;
  EditPesquisar.SetFocus;
end;

procedure TCadMovimentoCaixaForm.DBGrid1DblClick(Sender: TObject);
begin
  BTAlterarClick(Self);
end;

procedure TCadMovimentoCaixaForm.EditPesquisarChange(Sender: TObject);
begin
  BTPesquisarClick(Self);
end;

procedure TCadMovimentoCaixaForm.FormCreate(Sender: TObject);
begin
  AbaSuperior.ActivePage := tsConsulta;
  CHApenasAtivos.Checked := True;
end;

procedure TCadMovimentoCaixaForm.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TCadMovimentoCaixaForm.FormShow(Sender: TObject);
begin
  AbreTabela(BancoDeDados.DSqryCsContaContabil, 'cadconta_contabil');
end;

procedure TCadMovimentoCaixaForm.tsConsultaShow(Sender: TObject);
begin
  BTPesquisarClick(Self);
  EditPesquisar.SetFocus;
end;

procedure TCadMovimentoCaixaForm.tsManutencaoShow(Sender: TObject);
begin
  if not (BancodeDados.qryCadMovimentoCaixa.State in [dsInsert]) then
    with BancoDeDados.qryCadMovimentoCaixa do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from lanmovimento_caixa where idmovimento_caixa = '+
            IntToStr(BancoDeDados.qryCsMovimentoCaixaidmovimento_caixa.Value));
        Open;
        Edit;
      end;
  if (BancoDeDados.qrycadmovimentocaixa then
  
end;

end.
