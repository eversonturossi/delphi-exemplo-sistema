unit UCadastroProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastroPadrao, FMTBcd, ActnList, AppEvnts, DB, SqlExpr, Provider,
  DBClient, StdCtrls, DBCtrls, Buttons, JvExControls, JvGradientHeaderPanel,
  ExtCtrls, ComCtrls, Mask, Grids, DBGrids, Menus;

type
  TCadastroProdutoForm = class(TCadastroPadraoForm)
    CDSCadastroPRODUTO_ID: TIntegerField;
    CDSCadastroATIVO: TSmallintField;
    CDSCadastroDATA_CADASTRO: TSQLTimeStampField;
    CDSCadastroDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSCadastroDESCRICAO: TStringField;
    CDSCadastroDESCRICAO_REDUZIDA: TStringField;
    CDSCadastroREFERENCIA: TStringField;
    CDSCadastroUNIDADE_ID: TIntegerField;
    CDSCadastroPRECO: TFloatField;
    CDSCadastroPRODUTO_GRUPO_ID: TIntegerField;
    CDSCadastroPRODUTO_SUBGRUPO_ID: TIntegerField;
    PCPrincipal: TPageControl;
    TSCadastro: TTabSheet;
    Label8: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    DBEditNome: TDBEdit;
    DBEditLogin: TDBEdit;
    DBEditReferencia: TDBEdit;
    DBLCUnidade: TDBLookupComboBox;
    DBLCGrupoProduto: TDBLookupComboBox;
    DBLCSubGrupoProduto: TDBLookupComboBox;
    TSFornecedorBarras: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label6: TLabel;
    Label11: TLabel;
    PopupMenu1: TPopupMenu;
    AdicionarFornecedor1: TMenuItem;
    ExcluirFornecedor1: TMenuItem;
    procedure RemoveAcento(Sender: TObject);
    procedure CDSCadastroAfterInsert(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure DBLCGrupoProdutoClick(Sender: TObject);
    procedure AdicionarFornecedor1Click(Sender: TObject);
    procedure ExcluirFornecedor1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroProdutoForm: TCadastroProdutoForm;

implementation
uses Base, UFuncoes, UPesquisaFornecedor, UPesquisaPadrao;
{$R *.dfm}

procedure TCadastroProdutoForm.RemoveAcento(Sender: TObject);
var
  Temp : ShortString;
begin
  if ((Sender as TDBEdit).Text <> '') then
    begin
      Temp := CDSCadastro.FieldByName((Sender as TDBEdit).DataField).Value;
      if not (CDSCadastro.State in[dsEdit, dsInsert]) then
        CDSCadastro.Edit;
      CDSCadastro.FieldByName((Sender as TDBEdit).DataField).Value := RetornaSemAcento(Temp);
    end;
end;

procedure TCadastroProdutoForm.AdicionarFornecedor1Click(Sender: TObject);
var
  Padrao : TPesquisaPadraoForm;
begin
  try
    BancoDados.CDSProdutoFornecedor.DisableControls;
    if not Assigned(PesquisaFornecedorForm) then
      PesquisaFornecedorForm := TPesquisaFornecedorForm.Create(Application);
    PesquisaFornecedorForm.Tabela := 'FORNECEDOR';
    if (PesquisaFornecedorForm.ShowModal = mrOk) then
      begin
        BancoDados.CDSProdutoFornecedor.Append;
        BancoDados.CDSProdutoFornecedorFORNECEDOR_ID.Value := Padrao.ID;
        BancoDados.CDSProdutoFornecedorPRODUTO_ID.Value := CDSCadastroPRODUTO_ID.Value;
        BancoDados.CDSProdutoFornecedor.Post;
      end;
  finally
    PesquisaFornecedorForm.Free;
    PesquisaFornecedorForm := nil;
    BancoDados.CDSProdutoFornecedor.EnableControls;
  end;
end;

procedure TCadastroProdutoForm.CDSCadastroAfterInsert(DataSet: TDataSet);
begin
  inherited; //Herança

  CDSCadastro.FieldByName('ATIVO').Value := 1;
  CDSCadastro.FieldByName('DATA_CADASTRO').Value := Now;
  CDSCadastro.FieldByName('DATA_ULTIMA_ALTERACAO').Value := Now;
end;

procedure TCadastroProdutoForm.DBLCGrupoProdutoClick(Sender: TObject);
begin
  if (DBLCGrupoProduto.KeyValue > 0) then
    begin
      BancoDados.CDSSubGrupoProduto.Close;
      BancoDados.qrySubGrupoProduto.SQL.Text := 'select * from produto_subgrupo' +
        ' where ativo = 1 and produto_grupo_id = ' + IntToStr(DBLCGrupoProduto.KeyValue);
      BancoDados.CDSSubGrupoProduto.Open;
    end;
  DBLCSubGrupoProduto.Enabled := not (BancoDados.CDSSubGrupoProduto.IsEmpty);
end;

procedure TCadastroProdutoForm.ExcluirFornecedor1Click(Sender: TObject);
begin
  BancoDados.CDSProdutoFornecedor.Delete;
end;

procedure TCadastroProdutoForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    begin
      key := #0;
      Perform(WM_NextDlgCtl,0,0);
    end;

  inherited; //Herança
end;

procedure TCadastroProdutoForm.FormShow(Sender: TObject);
var
  Padrao : TCadastroPadraoForm;
begin
  BancoDados.CDSUnidade.Close;
  BancoDados.qryUnidade.SQL.Text := 'select * from unidade where ativo = 1';
  BancoDados.CDSUnidade.Open;

  inherited; //Herança

  if (Padrao.UtilizaMaiuscula) then
    begin
      DBEditNome.CharCase := ecUpperCase;
      DBEditLogin.CharCase := ecUpperCase;
      DBEditReferencia.CharCase := ecUpperCase;
    end;

  BancoDados.CDSGrupoProduto.Close;
  BancoDados.qryGrupoProduto.SQL.Text := 'select * from produto_grupo where ativo = 1';
  BancoDados.CDSGrupoProduto.Open;

  if (DBLCGrupoProduto.KeyValue > 0) then
    begin
      BancoDados.CDSSubGrupoProduto.Close;
      BancoDados.qrySubGrupoProduto.SQL.Text := 'select * from produto_subgrupo' +
        ' where ativo = 1 and produto_grupo_id = ' + IntToStr(DBLCGrupoProduto.KeyValue);
      BancoDados.CDSSubGrupoProduto.Open;

      DBLCSubGrupoProduto.Enabled := True;
    end
  else
    DBLCSubGrupoProduto.Enabled := False;
end;

end.
