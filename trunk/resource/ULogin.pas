unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, htmlbtns, ExtCtrls, IniFiles;

type
  TLoginForm = class(TForm)
    Image2: TImage;
    Image1: TImage;
    Panel1: TPanel;
    BTCancelar: THTMLButton;
    BitBtn1: THTMLButton;
    Label1: TLabel;
    Label2: TLabel;
    Image4: TImage;
    EditLogin: TEdit;
    EditSenha: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BTCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Tentativa : Integer;
    ArquivoIni: TIniFile;
    path : String;
    procedure CarregarArquivoConfiguracao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginForm: TLoginForm;
  UsuarioId : Integer;
  DataSistema : TDateTime;

implementation
uses Base, UPrincipal, Base64, UFuncoes, UConexao;

{$R *.dfm}
procedure TLoginForm.CarregarArquivoConfiguracao;
begin
  Path := UFuncoes.RCopy(Application.ExeName, '\');
  if FileExists(Path+'MasterSoft.ini') then
    begin
      ArquivoIni := TIniFile.Create(Path+'MasterSoft.ini');
      BancodeDados.Conexao.HostName := ArquivoIni.ReadString('Conexao', 'Host', BancodeDados.Conexao.HostName);
      BancodeDados.Conexao.User := ArquivoIni.ReadString('Conexao', 'Login', BancodeDados.Conexao.User);
      BancodeDados.Conexao.Password := Base64DecodeStr(ArquivoIni.ReadString('Conexao', 'Snh', BancodeDados.Conexao.Password));
      BancodeDados.Conexao.Database := ArquivoIni.ReadString('Conexao', 'DataBase', BancodeDados.Conexao.Database);
    end;
end;
procedure TLoginForm.BitBtn1Click(Sender: TObject);
begin
  inc(Tentativa);
  with BancoDeDados.qryCsLogin do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from cadusuario where login = '+QuotedStr(EditLogin.Text));
      //SQL.Add(' and senha = '+QuotedStr(Base64EncodeStr(EditSenha.Text)));
      SQL.Add(' and senha = '+QuotedStr(EditSenha.Text));
      Open;
    end;

    if not (BancoDeDados.qryCsLogin.IsEmpty) then
      begin
        try
          if not Assigned(PrincipalForm) then
            PrincipalForm := TPrincipalForm.Create(Application);
          PrincipalForm.ShowModal;
        finally
          PrincipalForm.Release;
          PrincipalForm := nil;
        end;
        LoginForm.Hide;
      end
    else
      if (Tentativa > 3) then
        begin
          MessageDlg('Excedeu o número máximo de Tentativas.', mtWarning, [mbOK], 0);
          Close;
        end
      else
        begin
          MessageDlg('Login e/ou Senha incorretos', mtWarning, [mbOK], 0);
          EditSenha.Clear;
          EditLogin.Clear;
          EditLogin.SetFocus;
        end;
end;

procedure TLoginForm.BTCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TLoginForm.FormCreate(Sender: TObject);
begin
  DataSistema := Now;
  Path := UFuncoes.RCopy(Application.ExeName, '\');
  if FileExists(Path+'MasterSoft.ini') then
    begin
      ArquivoIni := TIniFile.Create(Path+'MasterSoft.ini');
      BancodeDados.Conexao.HostName := ArquivoIni.ReadString('Conexao', 'Host', BancodeDados.Conexao.HostName);
      BancodeDados.Conexao.User := ArquivoIni.ReadString('Conexao', 'Login', BancodeDados.Conexao.User);
      BancodeDados.Conexao.Password := Base64DecodeStr(ArquivoIni.ReadString('Conexao', 'Snh', BancodeDados.Conexao.Password));
      BancodeDados.Conexao.Database := ArquivoIni.ReadString('Conexao', 'DataBase', BancodeDados.Conexao.Database);
      try
          BancodeDados.Conexao.Connect;
      except
        Raise Exception.Create('Erro durante a conexão com o Banco de Dados, verifique sua conexão!');
      end;
    end
  else
    begin
      try
        if not Assigned(ConexaoForm) then
          ConexaoForm := TConexaoForm.Create(Application);
        if (ConexaoForm.ShowModal = mrOk) then
          begin
            if not(BancodeDados.Conexao.Connected) then
              begin
                ArquivoIni := TIniFile.Create(Path+'MasterSoft.ini');
                BancodeDados.Conexao.HostName := ArquivoIni.ReadString('Conexao', 'Host', BancodeDados.Conexao.HostName);
                BancodeDados.Conexao.User := ArquivoIni.ReadString('Conexao', 'Login', BancodeDados.Conexao.User);
                BancodeDados.Conexao.Password := Base64DecodeStr(ArquivoIni.ReadString('Conexao', 'Snh', BancodeDados.Conexao.Password));
                BancodeDados.Conexao.Database := ArquivoIni.ReadString('Conexao', 'DataBase', BancodeDados.Conexao.Database);
                try
                  BancodeDados.Conexao.Connect;
                except
                  Raise Exception.Create('Erro durante a conexão com o Banco de Dados, verifique sua conexão!');
                end;
              end;
          end
        else
            Application.Terminate;
      finally
        ConexaoForm.Free;
        ConexaoForm := nil;
      end;
    end;
end;

procedure TLoginForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    begin
      Key := #0;
      Perform(WM_NEXTDLGCTL,0,0);
    end;
  if (key = #27) then
    begin
      key := #0;
      Close;
    end;
end;

procedure TLoginForm.FormShow(Sender: TObject);
begin
  Tentativa := 0;
end;

end.
