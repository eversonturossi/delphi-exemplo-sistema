unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, JPEG;

type
  TLoginForm = class(TForm)
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    EditLogin: TEdit;
    EditSenha: TEdit;
    Panel3: TPanel;
    BTCancelar: TBitBtn;
    BTOk: TBitBtn;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure BTOkClick(Sender: TObject);
    procedure EditLoginKeyPress(Sender: TObject; var Key: Char);
    procedure EditSenhaKeyPress(Sender: TObject; var Key: Char);
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
            SQL.Add('select * from vendedor where Upper(login) = ' +
              QuotedStr(EditLogin.Text) + ' and senha = ' +
              QuotedStr(EditSenha.Text) + ' and Ativo = 1');
            Open;
          end;

        with BancoDados.qryVendedorFuncao do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select * from vendedor_funcao where vendedor_funcao_id = ' +
              IntToStr(BancoDados.qryLoginVENDEDOR_FUNCAO_ID.Value));
            Open;
          end;

        if not (BancoDados.qryVendedorFuncaoABREVIACAO.Value = 'OP_CX') then
          begin
            Logado := False;
            Mensagem('O Vendedor informado não tem Permissão de Operação de Caixa!', mtWarning,[mbOk],mrOK,0);
          end
        else
          begin
            if not (BancoDados.qryLogin.IsEmpty) then
              Logado := True
            else
              Mensagem('Usuário não Encontrado.', mtWarning,[mbOk],mrOK,0);
          end;
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
  Image1.Picture.LoadFromFile(BancoDados.imgLogin);
  BTOk.Glyph.LoadFromFile(BancoDados.imgOkLogin);
  BTCancelar.Glyph.LoadFromFile(BancoDados.imgCancelarLogin);
end;

procedure TLoginForm.FormShow(Sender: TObject);
begin
  EditLogin.SetFocus;
end;

end.
