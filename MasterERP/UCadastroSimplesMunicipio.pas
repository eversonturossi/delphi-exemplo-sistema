unit UCadastroSimplesMunicipio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastroSimplesPadrao, FMTBcd, ActnList, Menus, DB, SqlExpr,
  Provider, DBClient, Buttons, Grids, DBGrids, JvExControls,
  JvGradientHeaderPanel, ExtCtrls, ComCtrls, StdCtrls;

type
  TCadastroSimplesMunicipioForm = class(TCadastroSimplesPadraoForm)
    CDSCadastroMUNICIPIO_ID: TIntegerField;
    CDSCadastroNOME: TStringField;
    CDSCadastroUF: TStringField;
    CDSCadastroUF_ID: TIntegerField;
    EditCidade: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    CBUF: TComboBox;
    CDSUF: TClientDataSet;
    DSPUF: TDataSetProvider;
    qryUF: TSQLQuery;
    CDSUFUF: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBUFSelect(Sender: TObject);
    procedure EditCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure CDSCadastroBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroSimplesMunicipioForm: TCadastroSimplesMunicipioForm;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TCadastroSimplesMunicipioForm.CBUFSelect(Sender: TObject);
begin
  CDSCadastro.Close;
  qryCadastro.SQL.Text := 'select * from municipio where Upper(nome) like ' +
    QuotedStr(RetornaMaiuscula(EditCidade.Text) + '%');
  if (CBUF.Text <> '') then
        qryCadastro.SQL.Text := qryCadastro.SQL.Text + ' and uf = ' + QuotedStr(CDSCadastroUF.Value);
  CDSCadastro.Open;
  CDSCadastro.First;
end;

procedure TCadastroSimplesMunicipioForm.CDSCadastroBeforePost(
  DataSet: TDataSet);
var
  temp : String;
begin
  temp := RetornaSemAcento(CDSCadastroNOME.Value);
  CDSCadastroNOME.Value := temp;
  with BancoDados.qryAuxiliar do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select municipio_id from ' + BancoDados.Tabela + ' where Upper(nome) = ' +
        QuotedStr(RetornaMaiuscula(CDSCadastroNOME.Value));

      if (CBUF.Text <> '') then
        SQL.Text := SQL.Text + ' and uf = ' + QuotedStr(CDSCadastroUF.Value);
      Open;
    end;
  if not (BancoDados.qryAuxiliar.IsEmpty) then
    begin
      Mensagem('Registro já Existente!', mtInformation,[mbOk],mrOK,0);
      Abort;
    end
  else
    begin
      with BancoDados.qryAuxiliar do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'select municipio_id from ' + BancoDados.Tabela + ' where municipio_id = ' +
            IntToStr(CDSCadastroMUNICIPIO_ID.Value);
          Open;
        end;
      if not (BancoDados.qryAuxiliar.IsEmpty) then
        begin
          Mensagem('Código já Existente!', mtInformation,[mbOk],mrOK,0);
          Abort;
        end
      else
        BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
    end;
end;

procedure TCadastroSimplesMunicipioForm.EditCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
    CBUFSelect(Sender);
end;

procedure TCadastroSimplesMunicipioForm.FormCreate(Sender: TObject);
begin
  BancoDados.Tabela := 'MUNICIPIO';
  inherited; //Herança
end;

procedure TCadastroSimplesMunicipioForm.FormShow(Sender: TObject);
begin
  inherited; //Herança

  Caption := 'MasterSoft - Cadastro de Municípios (Código de Identificação do IBGE)';
  CDSUF.Close;
  qryUF.SQL.Text := 'select uf from municipio group by uf';
  CDSUF.Open;
  CDSUF.First;
  CBUF.Items.Clear;
  while not CDSUF.Eof do
    begin
      CBUF.Items.Add(CDSUFUF.Value);
      CDSUF.Next;
    end;
  CDSCadastro.Close;
  qryCadastro.SQL.Text := 'select * from municipio';
  CDSCadastro.Open;
  CDSCadastro.First;
  EditCidade.SetFocus;
end;

end.
