unit USupervisaoUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TSupervisaoUsuarioForm = class(TForm)
    Label4: TLabel;
    EditLogin: TEdit;
    Label5: TLabel;
    EditSenha: TEdit;
    Panel1: TPanel;
    BTConfirmar: TSpeedButton;
    BTCancelar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure EditLoginKeyPress(Sender: TObject; var Key: Char);
    procedure EditSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure BTConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SupervisaoUsuarioForm: TSupervisaoUsuarioForm;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TSupervisaoUsuarioForm.BTCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSupervisaoUsuarioForm.BTConfirmarClick(Sender: TObject);
begin
  if not (EditLogin.Text <> '') then
    Mensagem('Informe um Login.', mtWarning,[mbOk],mrOK,0)
  else
    if not (EditSenha.Text <> '') then
      Mensagem('Informe uma Senha.', mtWarning,[mbOk],mrOK,0)
    else
      ModalResult := mrOk;
end;

procedure TSupervisaoUsuarioForm.EditLoginKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TSupervisaoUsuarioForm.EditSenhaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
    begin
      if not (EditSenha.Text <> '') then
        begin
          Mensagem('Informe uma Senha.', mtWarning,[mbOk],mrOK,0);
          EditSenha.SetFocus;
        end
      else
        BTConfirmarClick(Sender);
    end;
end;

procedure TSupervisaoUsuarioForm.FormShow(Sender: TObject);
begin
  EditLogin.SetFocus;
  BTConfirmar.Glyph.LoadFromFile(BancoDados.imgOk);
  BTCancelar.Glyph.LoadFromFile(BancoDados.imgCancelar1);
end;

end.
