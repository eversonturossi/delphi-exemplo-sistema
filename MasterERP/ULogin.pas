unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, JPEG, JvExControls,
  JvGradientHeaderPanel;

type
  TLoginForm = class(TForm)
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel1: TPanel;
    JvGradientHeaderPanel1: TJvGradientHeaderPanel;
    Panel8: TPanel;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    EditLogin: TEdit;
    EditSenha: TEdit;
    Panel3: TPanel;
    BTCancelar: TBitBtn;
    BTOk: TBitBtn;
    PEmpresa: TPanel;
    Label1: TLabel;
    CBEmpresa: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure BTOkClick(Sender: TObject);
    procedure EditLoginKeyPress(Sender: TObject; var Key: Char);
    procedure EditSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginForm: TLoginForm;

implementation
uses Base, UPrincipal, Base64, UFuncoes;
{$R *.dfm}

procedure TLoginForm.BTCancelarClick(Sender: TObject);
begin
  Logado := False;
  Close;
end;

procedure TLoginForm.BTOkClick(Sender: TObject);
var
  temp : ShortString;
begin
  if not (EditLogin.Text <> '') then
    Mensagem('Informe um Login.', mtWarning,[mbOk],mrOK,0)
  else
    if not (EditSenha.Text <> '') then
      Mensagem('Informe uma Senha.', mtWarning,[mbOk],mrOK,0)
    else
      begin
        temp := Base64EncodeStr(EditSenha.Text);
        with BancoDados.qryLogin do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select * from usuario where Upper(login) = ' +
              QuotedStr(EditLogin.Text) + ' and senha = ' +
              QuotedStr(EditSenha.Text) + ' and Ativo = 1');
            Open;
          end;

        if not (BancoDados.qryLogin.IsEmpty) then
          begin
            BancoDados.CDSEmpresa.Close;
            BancoDados.qryEmpresa.SQL.Text := 'select * from empresa';

            if (PEmpresa.Visible) then
              BancoDados.qryEmpresa.SQL.Add(' where empresa_id = ' + Copy(CBEmpresa.Text, 1, 10));

            BancoDados.CDSEmpresa.Open;
            BancoDados.CDSEmpresa.First;

            BancoDados.EmpresaID := BancoDados.CDSEmpresaEMPRESA_ID.Value;
            BancoDados.EmpresaNomeRazao := BancoDados.CDSEmpresacalc_pessoa_nome.Value;
            BancoDados.Filial := BancoDados.CDSEmpresaFILIAL.Value;

            Logado := True;

            Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, BancoDados.Tabela,
              'Logando no Sistema: ' + IntToStr(BancoDados.qryLoginUSUARIO_ID.Value) +
              '/' + BancoDados.qryLoginLOGIN.Value + '.');
          end
        else
          Mensagem('Usuário não Encontrado.', mtWarning,[mbOk],mrOK,0);
        Close;
      end;
end;

procedure TLoginForm.EditLoginKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    begin
      if not (EditLogin.Text <> '') then
        begin
          Mensagem('Informe um Login.', mtWarning,[mbOk],mrOK,0);
          EditLogin.SetFocus;
        end
      else
        EditSenha.SetFocus;
    end;
end;

procedure TLoginForm.EditSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    begin
      if not (EditSenha.Text <> '') then
        begin
          Mensagem('Informe uma Senha.', mtWarning,[mbOk],mrOK,0);
          EditSenha.SetFocus;
        end
      else
        BTOkClick(Sender);
    end;
end;

procedure TLoginForm.FormCreate(Sender: TObject);
begin
  PEmpresa.Visible := (Parametro(BancoDados.qryAuxiliar, 2, 'NAO') = 'SIM');

  if (PEmpresa.Visible) then
    begin
      Height := 420;

      BancoDados.CDSEmpresa.Close;
      BancoDados.qryEmpresa.SQL.Text := 'select * from empresa where pessoa_id' +
        'in(select pessoa_id where pessoa where ativo = 1)';
      BancoDados.CDSEmpresa.Open;
      BancoDados.CDSEmpresa.First;

      CBEmpresa.Items.Clear;
      while not BancoDados.CDSEmpresa.Eof do
        begin
          CBEmpresa.Items.Add(FormatFloat('0000000000', BancoDados.CDSEmpresaEMPRESA_ID.Value) +
            ' - ' + BancoDados.CDSEmpresacalc_pessoa_nome.Value);
          BancoDados.CDSEmpresa.Next;
        end;
    end
  else
    Height := 360;
end;

procedure TLoginForm.FormShow(Sender: TObject);
begin
  EditLogin.SetFocus;
end;

end.
