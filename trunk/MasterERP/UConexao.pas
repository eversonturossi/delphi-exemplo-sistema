unit UConexao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles;

type
  TConexaoForm = class(TForm)
    EditServidor: TEdit;
    EditDB: TEdit;
    EditLogin: TEdit;
    EditSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ODBancoDados: TOpenDialog;
    BTOk: TSpeedButton;
    BTTestar: TSpeedButton;
    BTLimpar: TSpeedButton;
    BTCancelar: TSpeedButton;
    BTBancoDados: TSpeedButton;
    procedure BTBancoDadosClick(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure BTOkClick(Sender: TObject);
  private
    { Private declarations }
    ArquivoIni : TIniFile;
    path, BancoDados : String;
  public
    { Public declarations }
  end;

var
  ConexaoForm: TConexaoForm;

implementation
uses ULogin, UFuncoes, Base64, Base;
{$R *.dfm}

procedure TConexaoForm.BTBancoDadosClick(Sender: TObject);
begin
  ODBancoDados.Filter := 'FDB files|*.fdb|All files|*.*';
  if (ODBancoDados.Execute) then
    begin
      EditDB.Text := ExtractFileName(ODBancoDados.FileName);
      BancoDados := ODBancoDados.FileName;
    end;
end;

procedure TConexaoForm.BTCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TConexaoForm.BTOkClick(Sender: TObject);
begin
  try
    Path := UFuncoes.RCopy(Application.ExeName, '\');
    ArquivoIni := TIniFile.Create(Path + 'MasterERP.ini');
    ArquivoIni.WriteString('Conexao', 'Login', EditLogin.Text);
    ArquivoIni.WriteString('Conexao', 'Snh', Base64EncodeStr(EditSenha.Text));
    ArquivoIni.WriteString('Conexao', 'DataBase', EditServidor.Text + ':' + BancoDados);
    ArquivoIni.WriteString('Geral', 'Cidade', '');

    if FileExists(path + 'MasterERP.ini') then
      begin
        MessageDlg('Arquivo criado com Sucesso.', mtInformation, [mbOK], 0);
        ModalResult := mrOk;
      end;
  except
    Raise Exception.Create('Erro durante ao criar Arquivo de Parametros!');
  end;
end;

end.
