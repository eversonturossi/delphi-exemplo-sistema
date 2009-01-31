unit UConexao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, IniFiles, Buttons, StdCtrls, htmlbtns;

type
  TConexaoForm = class(TForm)
    Label1: TLabel;
    EdtServidor: TEdit;
    EdtDB: TEdit;
    EdtLogin: TEdit;
    EdtSenha: TEdit;
    BtnOk: THTMLButton;
    BtnTestar: THTMLButton;
    BtnLimpar: THTMLButton;
    BtnFechar: THTMLButton;
    Image2: TImage;
    Image1: TImage;
    Label5: TLabel;
    Image3: TImage;
    Label2: TLabel;
    Image4: TImage;
    Label3: TLabel;
    procedure BtnFecharClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnTestarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtServidorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtDBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtLoginKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    ArquivoIni : TIniFile;
    path : String;
    { Public declarations }
  end;

var
  ConexaoForm: TConexaoForm;

implementation
uses ULogin, UFuncoes, Base64, Base;
{$R *.dfm}

procedure TConexaoForm.BtnFecharClick(Sender: TObject);
begin
  BtnOk.ModalResult := mrNone;
  Close;
end;
procedure TConexaoForm.BtnOkClick(Sender: TObject);
begin
  try
    Path := UFuncoes.RCopy(Application.ExeName, '\');
    ArquivoIni := TIniFile.Create(Path+'MasterSoft.ini');
    ArquivoIni.WriteString('Conexao', 'Host', EdtServidor.Text);
    ArquivoIni.WriteString('Conexao', 'Login', EdtLogin.Text);
    ArquivoIni.WriteString('Conexao', 'Snh', Base64EncodeStr(EdtSenha.Text));
    ArquivoIni.WriteString('Conexao', 'DataBase', EdtDB.Text);
    if FileExists(path+'MasterSoft.ini') then
      begin
        MessageDlg('Arquivo criado com Sucesso.', mtInformation, [mbOK], 0);
        ModalResult := mrOk;
      end;
  except
    Raise Exception.Create('Erro durante ao criar Arquivo de Parametros!');
  end;
end;
procedure TConexaoForm.BtnTestarClick(Sender: TObject);
begin
  try
     BancodeDados.Conexao.HostName := EdtServidor.Text;
     BancodeDados.Conexao.Database := EdtDB.Text;
     BancodeDados.Conexao.User := EdtLogin.Text;
     BancodeDados.Conexao.Password := EdtSenha.Text;
     try
        BancodeDados.Conexao.Connect;
     except
        Raise Exception.Create('Erro durante a conexão com o Banco de Dados, verifique sua conexão!');
     end;
     if (BancodeDados.Conexao.Connected) then
      begin
        MessageDlg('Conexão realizada com sucesso.', mtInformation, [mbOK], 0);
        case Application.MessageBox('Deseja salvar as configurações?','Atenção',MB_YesNo+mb_DefButton2+mb_IconQuestion) of
          6:  BtnOkClick(Self);
          7:  Abort;
        end;
      end;
  finally
    BtnLimparClick(Self);
  end;
end;
procedure TConexaoForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if BancodeDados.Conexao.Connected = true then
      BancodeDados.Conexao.Disconnect;
end;

procedure TConexaoForm.BtnLimparClick(Sender: TObject);
begin
  EdtServidor.Clear;
  EdtLogin.Clear;
  EdtSenha.Clear;
  EdtDB.Clear;
  EdtServidor.SetFocus;
end;

procedure TConexaoForm.FormShow(Sender: TObject);
begin
  EdtServidor.SetFocus;
end;
procedure TConexaoForm.EdtServidorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_Return then
    EdtDB.SetFocus;
end;

procedure TConexaoForm.EdtDBKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_Return then
    EdtLogin.SetFocus;
end;

procedure TConexaoForm.EdtLoginKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_Return then
    EdtSenha.SetFocus;
end;

procedure TConexaoForm.EdtSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_Return then
    BtnOK.Click;
end;

end.
