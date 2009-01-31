unit UCadLocalizacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, ExtCtrls, ComCtrls, Mask, DBCtrls, Grids, DBGrids, DB,
  rxToolEdit, RXDBCtrl, Buttons;

type
  TCadLocalizacaoForm = class(TForm)
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
    Panel3: TPanel;
    BTGravar: THTMLButton;
    BTCancelar: THTMLButton;
    BTExcluir: THTMLButton;
    Label28: TLabel;
    DBEditCorredor: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    CHApenasAtivos: TCheckBox;
    DBDateEdit1: TDBDateEdit;
    DBEditProduto: TDBEdit;
    BTProduto: TSpeedButton;
    DBText2: TDBText;
    DBEditUnidadeEstoque: TDBEdit;
    BTUnidadeEstoque: TSpeedButton;
    DBText3: TDBText;
    Label4: TLabel;
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
    procedure BTProdutoClick(Sender: TObject);
    procedure DBEditProdutoDblClick(Sender: TObject);
    procedure BTUnidadeEstoqueClick(Sender: TObject);
    procedure DBEditUnidadeEstoqueDblClick(Sender: TObject);
    procedure DBEditProdutoExit(Sender: TObject);
    procedure DBEditUnidadeEstoqueExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadLocalizacaoForm: TCadLocalizacaoForm;

implementation
uses Base, UFuncoes, UCsProduto, UCsUnidadeEstoque, UCadProduto;
{$R *.dfm}

procedure TCadLocalizacaoForm.BTAlterarClick(Sender: TObject);
begin
  AbaSuperior.ActivePage := tsManutencao;
  DBEditCorredor.SetFocus;
end;

procedure TCadLocalizacaoForm.BTCancelarClick(Sender: TObject);
begin
  BancoDeDados.qryCadLocalizacao.Cancel;
  BancoDeDados.qryCsLocalizacao.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadLocalizacaoForm.BTExcluirClick(Sender: TObject);
begin
  try
    BancoDeDados.qryCadLocalizacao.Delete;
  except on E: EDatabaseError do
      if (Pos('violates foreign key',e.message) > 0) then
        MessageDlg('Não foi possivel excluir este registros.'+#13+
          'Foram localizados lançamentos feitos para este registro.',mtWarning,[mbOK],0);
  end;
  BancoDeDados.qryCsLocalizacao.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadLocalizacaoForm.BTGravarClick(Sender: TObject);
begin
  BancoDeDados.qryCadLocalizacao.ApplyUpdates;
  AbaSuperior.ActivePage := tsConsulta;
end;

procedure TCadLocalizacaoForm.BTProdutoClick(Sender: TObject);
begin
  try
    if not Assigned(CsProdutoForm) then
      CsProdutoForm := TCsProdutoForm.Create(Application);
    if (CsProdutoForm.ShowModal = mrOk) then
      BancodeDados.qryCadLocalizacaoidproduto.Value := BancodeDados.qryCsProdutoIDPRODUTO.Value;
    DBEditProduto.SetFocus;
  finally
    CsProdutoForm.Release;
    CsProdutoForm := nil;
  end;
end;

procedure TCadLocalizacaoForm.BTInserirClick(Sender: TObject);
begin
  if not (BancoDeDados.qryCadLocalizacao.Active) then
    BancoDeDados.qryCadLocalizacao.Open;
  BancoDeDados.qryCadLocalizacao.Append;
  if (BancoDeDados.qryCadProdutoidproduto.Value > 0) then
    BancoDeDados.qryCadLocalizacaoidproduto.Value := BancoDeDados.qryCadProdutoidproduto.Value;
  AbaSuperior.ActivePage := tsManutencao;
  DBEditProduto.SetFocus;
end;

procedure TCadLocalizacaoForm.BTPesquisarClick(Sender: TObject);
var
  Campo : ShortString;
begin
  case (CBPesquisar.ItemIndex) of
    0: Campo := 'idlocalizacao';
    1: Campo := 'idproduto';
    2: Campo := 'idproduto';
    3: Campo := 'corredor';
    4: Campo := 'estante';
    5: Campo := 'prateleira';
    6: Campo := 'bandeja';
  end;
  with BancodeDados.qryCsLocalizacao do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from cadlocalizacao');
      if (CBPesquisar.ItemIndex in [0,1]) then
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
        if (CBPesquisar.ItemIndex in [2]) then
          begin
            if (EditPesquisar.Text <> '') then
              SQL.Add(' where exists(select idproduto from cadproduto where '+
                  'nome ilike '+''''+EditPesquisar.Text+'%'+'''');
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

procedure TCadLocalizacaoForm.BTSairClick(Sender: TObject);
begin
  Close;
end;

procedure TCadLocalizacaoForm.CBPesquisarChange(Sender: TObject);
begin
  EditPesquisar.Clear;
  EditPesquisar.SetFocus;
end;

procedure TCadLocalizacaoForm.DBEditProdutoDblClick(Sender: TObject);
begin
  BTProdutoClick(Self);
end;

procedure TCadLocalizacaoForm.DBEditProdutoExit(Sender: TObject);
begin
  if (BancoDeDados.qryCadLocalizacaoidproduto.Value > 0) then
    begin
      with BancodeDados.qryCsProduto do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from cadproduto');
          SQL.Add('where idproduto = '+IntToStr(BancoDeDados.qryCadprodutoidproduto.Value));
          Open;
        end;
    end;
end;

procedure TCadLocalizacaoForm.DBEditUnidadeEstoqueDblClick(Sender: TObject);
begin
  BTUnidadeEstoqueClick(Self);
end;

procedure TCadLocalizacaoForm.DBEditUnidadeEstoqueExit(Sender: TObject);
begin
  if (BancoDeDados.qryCadLocalizacaoidunidadeestoque.Value > 0) then
    begin
      with BancodeDados.qryCsUnidadeEstoque do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from cadunidade_estoque');
          SQL.Add('where idunidadeestoque = '+IntToStr(BancoDeDados.qryCadUnidadeEstoqueIDUNIDADEESTOQUE.Value));
          Open;
        end;
    end;
end;

procedure TCadLocalizacaoForm.DBGrid1DblClick(Sender: TObject);
begin
  BTAlterarClick(Self);
end;

procedure TCadLocalizacaoForm.EditPesquisarChange(Sender: TObject);
begin
  BTPesquisarClick(Self);
end;

procedure TCadLocalizacaoForm.FormCreate(Sender: TObject);
begin
  AbaSuperior.ActivePage := tsConsulta;
  CHApenasAtivos.Checked := True;
end;

procedure TCadLocalizacaoForm.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TCadLocalizacaoForm.BTUnidadeEstoqueClick(Sender: TObject);
begin
  try
    if not Assigned(CsUnidadeEstoqueForm) then
      CsUnidadeEstoqueForm := TCsUnidadeEstoqueForm.Create(Application);
    if (CsUnidadeEstoqueForm.ShowModal = mrOk) then
      BancodeDados.qryCadLocalizacaoidunidadeestoque.Value := BancodeDados.qryCsUnidadeEstoqueIDUNIDADEESTOQUE.Value;
    DBEditUnidadeEstoque.SetFocus;
  finally
    CsUnidadeEstoqueForm.Release;
    CsUnidadeEstoqueForm := nil;
  end;
end;

procedure TCadLocalizacaoForm.tsConsultaShow(Sender: TObject);
begin
  BTPesquisarClick(Self);
  EditPesquisar.SetFocus;
end;

procedure TCadLocalizacaoForm.tsManutencaoShow(Sender: TObject);
begin
  if not (BancodeDados.qryCadLocalizacao.State in [dsInsert]) then
    with BancoDeDados.qryCadLocalizacao do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from cadLocalizacao where idLocalizacao = '+
            IntToStr(BancoDeDados.qryCsLocalizacaoidlocalizacao.Value));
        Open;
        Edit;
      end;
end;

end.
