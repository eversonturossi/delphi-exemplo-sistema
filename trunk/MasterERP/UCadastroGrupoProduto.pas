unit UCadastroGrupoProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastroPadrao, FMTBcd, ActnList, AppEvnts, DB, SqlExpr, Provider,
  DBClient, StdCtrls, DBCtrls, Buttons, JvExControls, JvGradientHeaderPanel,
  ExtCtrls, ComCtrls, Mask;

type
  TCadastroGrupoProdutoForm = class(TCadastroPadraoForm)
    CDSCadastroPRODUTO_GRUPO_ID: TIntegerField;
    CDSCadastroATIVO: TSmallintField;
    CDSCadastroDATA_CADASTRO: TSQLTimeStampField;
    CDSCadastroDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSCadastroDESCRICAO: TStringField;
    Label8: TLabel;
    DBEditCodigo: TDBEdit;
    Label3: TLabel;
    DBEditDescricao: TDBEdit;
    procedure RemoveAcento(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaHint;
  public
    { Public declarations }
  end;

var
  CadastroGrupoProdutoForm: TCadastroGrupoProdutoForm;

implementation
uses UFuncoes;
{$R *.dfm}

procedure TCadastroGrupoProdutoForm.CarregaHint;
begin
  DBEditCodigo.Hint := 'Código de Identificação do Grupo de Produtos';
  DBEditDescricao.Hint := 'Descrição do Grupo de Produtos';
  DBCAtivo.Hint := 'Informe se o Cadastro está Ativo/Inativo';
  BTSalvar.Hint := 'Salvar Registro';
  BTCancelar.Hint := 'Cancelar Alterações';
  BTExcluir.Hint := 'Excluir Registro';
  BTSair.Hint := 'Sair da Tela de Cadastro';
end;

procedure TCadastroGrupoProdutoForm.RemoveAcento(Sender: TObject);
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

procedure TCadastroGrupoProdutoForm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then
    begin
      key := #0;
      Perform(WM_NextDlgCtl,0,0);
    end;

  inherited; //Herança
end;

procedure TCadastroGrupoProdutoForm.FormShow(Sender: TObject);
var
  Padrao : TCadastroPadraoForm;
begin
  inherited; //Herança

  if (Padrao.UtilizaMaiuscula) then
    DBEditDescricao.CharCase := ecUpperCase;

  CarregaHint;
end;

end.
