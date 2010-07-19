unit UCadastroSimplesContatoTipo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastroSimplesPadrao, FMTBcd, ActnList, Menus, DB, SqlExpr,
  Provider, DBClient, Buttons, Grids, DBGrids, JvExControls,
  JvGradientHeaderPanel, ExtCtrls, ComCtrls;

type
  TCadastroSimplesContatoTipoForm = class(TCadastroSimplesPadraoForm)
    CDSCadastroCONTATO_TIPO_ID: TIntegerField;
    CDSCadastroDESCRICAO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CDSCadastroBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroSimplesContatoTipoForm: TCadastroSimplesContatoTipoForm;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TCadastroSimplesContatoTipoForm.CDSCadastroBeforePost(
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

procedure TCadastroSimplesContatoTipoForm.FormCreate(Sender: TObject);
begin
  BancoDados.Tabela := 'CONTATO_TIPO';
  inherited; //Herança
end;

procedure TCadastroSimplesContatoTipoForm.FormShow(Sender: TObject);
begin
  inherited; //Herança

  Caption := 'MasterSoft - Cadastro de Tipos de Contatos';
  CDSCadastro.Close;
  qryCadastro.SQL.Text := 'select * from contato_tipo';
  CDSCadastro.Open;
end;

end.
