unit UCadastroProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastroPadrao, FMTBcd, ActnList, AppEvnts, DB, SqlExpr, Provider,
  DBClient, StdCtrls, DBCtrls, Buttons, JvExControls, JvGradientHeaderPanel,
  ExtCtrls, ComCtrls, Mask;

type
  TCadastroProdutoForm = class(TCadastroPadraoForm)
    Label8: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEditNome: TDBEdit;
    Label4: TLabel;
    DBEditLogin: TDBEdit;
    CDSCadastroPRODUTO_ID: TIntegerField;
    CDSCadastroATIVO: TSmallintField;
    CDSCadastroDATA_CADASTRO: TSQLTimeStampField;
    CDSCadastroDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSCadastroDESCRICAO: TStringField;
    CDSCadastroDESCRICAO_REDUZIDA: TStringField;
    CDSCadastroREFERENCIA: TStringField;
    CDSCadastroUNIDADE_ID: TIntegerField;
    CDSCadastroPRECO: TFloatField;
    Label5: TLabel;
    DBEditReferencia: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBLCUnidade: TDBLookupComboBox;
    Label9: TLabel;
    DBLCGrupoProduto: TDBLookupComboBox;
    Label10: TLabel;
    DBLCSubGrupoProduto: TDBLookupComboBox;
    CDSCadastroPRODUTO_GRUPO_ID: TIntegerField;
    CDSCadastroPRODUTO_SUBGRUPO_ID: TIntegerField;
    procedure RemoveAcento(Sender: TObject);
    procedure CDSCadastroAfterInsert(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure DBLCGrupoProdutoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroProdutoForm: TCadastroProdutoForm;

implementation
uses Base, UFuncoes;
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
