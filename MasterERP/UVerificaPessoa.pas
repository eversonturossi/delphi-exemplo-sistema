unit UVerificaPessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvExControls, JvGradientHeaderPanel, ExtCtrls, StdCtrls,
  Grids, DBGrids, FMTBcd, DB, SqlExpr, Provider, DBClient;

type
  TVerificaPessoaForm = class(TForm)
    Panel1: TPanel;
    JvGradientHeaderPanel1: TJvGradientHeaderPanel;
    SBPrincipal: TStatusBar;
    Panel2: TPanel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    EditValor: TEdit;
    DSPessoa: TDataSource;
    CDSPessoa: TClientDataSet;
    DSPPessoa: TDataSetProvider;
    qryPessoa: TSQLQuery;
    CDSPessoaPESSOA_ID: TIntegerField;
    CDSPessoaNOME_RAZAO: TStringField;
    CDSPessoacalc_utlizado: TStringField;
    procedure CDSPessoaCalcFields(DataSet: TDataSet);
    procedure EditValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure EditValorChange(Sender: TObject);
  private
    { Private declarations }
    FPessoaID : Integer;
    FPessoaNome : ShortString;
  public
    { Public declarations }
  published
    { Published declarations }
    property PessoaID: Integer read FPessoaID write FPessoaID;
    property PessoaNome: ShortString read FPessoaNome write FPessoaNome;
  end;

var
  VerificaPessoaForm: TVerificaPessoaForm;

implementation
uses Base;
{$R *.dfm}

procedure TVerificaPessoaForm.CDSPessoaCalcFields(DataSet: TDataSet);
var
  Temp : ShortString;
  i : Integer;

  function VerificaPessoa(Tabela : ShortString ; PessoaID : Integer): Boolean;
  begin
    with BancoDados.qryAuxiliar do
      begin
        Close;
        SQL.Text := 'select pessoa_id from ' + Tabela + ' where pessoa_id = ' +
          IntToStr(PessoaID);
        Open;
      end;
    Result := (not (BancoDados.qryAuxiliar.IsEmpty));
  end;
begin
  Temp := '';

  if (VerificaPessoa('EMPRESA', CDSPessoaPESSOA_ID.Value)) then
    Temp := Temp + 'EMPRESA' + ' | ';
  if (VerificaPessoa('CLIENTE', CDSPessoaPESSOA_ID.Value)) then
    Temp := Temp + 'CLIENTE' + ' | ';
  if (VerificaPessoa('FORNECEDOR', CDSPessoaPESSOA_ID.Value)) then
    Temp := Temp + 'FORNECEDOR' + ' | ';
  if (VerificaPessoa('TRANSPORTADORA', CDSPessoaPESSOA_ID.Value)) then
    Temp := Temp + 'TRANSPORTADORA' + ' | ';

  CDSPessoacalc_utlizado.Value := Copy(Temp, 1, Length(Temp) - 2);
end;

procedure TVerificaPessoaForm.EditValorChange(Sender: TObject);
begin
  CDSPessoa.Close;
  qryPessoa.SQL.Text := 'select * from pessoa';

  if (EditValor.Text <> '') then
    qryPessoa.SQL.Add(' where Upper(nome_razao) like ' + QuotedStr(EditValor.Text + '%'));

  CDSPessoa.Open;
  CDSPessoa.First;
end;

procedure TVerificaPessoaForm.EditValorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 13) then
    begin
      Key := 0;
      if not (CDSPessoa.IsEmpty) then
        begin
          FPessoaID := CDSPessoaPESSOA_ID.Value;
          FPessoaNome := CDSPessoaNOME_RAZAO.Value;
        end
      else
        FPessoaNome := EditValor.Text;
      ModalResult := mrOk;
    end
  else if (Key = 27) then
    begin
      Key := 0;
      FPessoaID := 0;
      FPessoaNome := '';
      ModalResult := mrCancel;
    end
  else if (Key = 38) then
    begin
      Key := 0;
      CDSPessoa.Prior;
    end
  else if (Key = 40) then
    begin
      Key := 0;
      CDSPessoa.Next;
    end;
end;

procedure TVerificaPessoaForm.FormShow(Sender: TObject);
begin
  EditValor.SetFocus;
  EditValorChange(Sender);
end;

end.
