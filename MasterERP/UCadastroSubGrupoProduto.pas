unit UCadastroSubGrupoProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastroPadrao, FMTBcd, ActnList, AppEvnts, DB, SqlExpr, Provider,
  DBClient, StdCtrls, DBCtrls, Buttons, JvExControls, JvGradientHeaderPanel,
  ExtCtrls, ComCtrls, Mask;

type
  TCadastroSubGrupoProdutoForm = class(TCadastroPadraoForm)
    Label8: TLabel;
    DBEditCodigo: TDBEdit;
    Label3: TLabel;
    DBEditDescricao: TDBEdit;
    CDSCadastroPRODUTO_SUBGRUPO_ID: TIntegerField;
    CDSCadastroATIVO: TSmallintField;
    CDSCadastroDATA_CADASTRO: TSQLTimeStampField;
    CDSCadastroDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSCadastroPRODUTO_GRUPO_ID: TIntegerField;
    CDSCadastroDESCRICAO: TStringField;
    Label7: TLabel;
    DBLCGrupo: TDBLookupComboBox;
    procedure RemoveAcento(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BTSalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaHint;
  public
    { Public declarations }
  end;

var
  CadastroSubGrupoProdutoForm: TCadastroSubGrupoProdutoForm;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TCadastroSubGrupoProdutoForm.CarregaHint;
begin
  DBEditCodigo.Hint := 'Código de Identificação do SubGrupo de Produtos';
  DBEditDescricao.Hint := 'Descrição do SubGrupo de Produtos';
  DBCAtivo.Hint := 'Informe se o Cadastro está Ativo/Inativo';
  BTSalvar.Hint := 'Salvar Registro';
  BTCancelar.Hint := 'Cancelar Alterações';
  BTExcluir.Hint := 'Excluir Registro';
  BTSair.Hint := 'Sair da Tela de Cadastro';
  DBLCGrupo.Hint := 'Grupo de Produtos';
end;

procedure TCadastroSubGrupoProdutoForm.RemoveAcento(Sender: TObject);
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

procedure TCadastroSubGrupoProdutoForm.BTSalvarClick(Sender: TObject);
begin
  if not (DBLCGrupo.KeyValue > 0) then
    begin
      Mensagem('Informe um Grupo!', mtWarning,[mbOk],mrOK,0);
      DBLCGrupo.SetFocus;
      Abort;
    end;

  inherited; //Herança
end;

procedure TCadastroSubGrupoProdutoForm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then
    begin
      key := #0;
      Perform(WM_NextDlgCtl,0,0);
    end;

  inherited; //Herança
end;

procedure TCadastroSubGrupoProdutoForm.FormShow(Sender: TObject);
var
  Padrao : TCadastroPadraoForm;
begin
  inherited; //Herança

  BancoDados.CDSGrupoProduto.Close;
  BancoDados.qryGrupoProduto.SQL.Text := 'select * from produto_grupo where ativo = 1';
  BancoDados.CDSGrupoProduto.Open;

  if (Padrao.UtilizaMaiuscula) then
    DBEditDescricao.CharCase := ecUpperCase;
end;

end.
