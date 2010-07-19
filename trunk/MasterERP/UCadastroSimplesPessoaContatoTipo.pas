unit UCadastroSimplesPessoaContatoTipo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastroSimplesPadrao, FMTBcd, ActnList, Menus, DB, SqlExpr,
  Provider, DBClient, Buttons, Grids, DBGrids, JvExControls,
  JvGradientHeaderPanel, ExtCtrls, ComCtrls;

type
  TCadastroSimplesPessoaContatoTipoForm = class(TCadastroSimplesPadraoForm)
    CDSCadastroDESCRICAO: TStringField;
    CDSCadastroPESSOA_CONTATO_TIPO_ID: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CDSCadastroBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroSimplesPessoaContatoTipoForm: TCadastroSimplesPessoaContatoTipoForm;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TCadastroSimplesPessoaContatoTipoForm.CDSCadastroBeforePost(
  DataSet: TDataSet);
var
  temp : String;
begin
  temp := RetornaSemAcento(CDSCadastroDESCRICAO.Value);
  CDSCadastroDESCRICAO.Value := temp;
  with BancoDados.qryAuxiliar do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select * from ' + BancoDados.Tabela + ' where Upper(descricao) = ' +
        QuotedStr(RetornaMaiuscula(CDSCadastroDESCRICAO.Value));
      Open;
    end;
  if not (BancoDados.qryAuxiliar.IsEmpty) then
    begin
      Mensagem('Registro já Existente!', mtInformation,[mbOk],mrOK,0);
      Abort;
    end
  else
    BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TCadastroSimplesPessoaContatoTipoForm.FormCreate(Sender: TObject);
begin
  BancoDados.Tabela := 'PESSOA_CONTATO_TIPO';
  inherited; //Herança
end;

procedure TCadastroSimplesPessoaContatoTipoForm.FormShow(Sender: TObject);
begin
  inherited; //Herança

  Caption := 'MasterSoft - Cadastro de Tipos de Contatos';
  CDSCadastro.Close;
  qryCadastro.SQL.Text := 'select * from pessoa_contato_tipo';
  CDSCadastro.Open;
end;

end.
