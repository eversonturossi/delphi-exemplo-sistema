unit UConfigBD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, RxGIF, Mask, ShellApi, jpeg,
  ComCtrls;

type
  TFConfigBD = class(TForm)
    GIP: TGroupBox;
    BTOk: TBitBtn;
    BTCancela: TBitBtn;
    Image2: TImage;
    EIP_Local: TMaskEdit;
    Label1: TLabel;
    E_EnderecoLocal: TEdit;
    Label2: TLabel;
    GRemoto: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    EIP_Remoto: TMaskEdit;
    E_EnderecoRemoto: TEdit;
    Label5: TLabel;
    EPDV: TEdit;
    BTBusca: TSpeedButton;
    Open: TOpenDialog;
    Open1: TOpenDialog;
    SpeedButton1: TSpeedButton;
    SB: TStatusBar;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BTCancelaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTOkClick(Sender: TObject);
    procedure EIP_LocalEnter(Sender: TObject);
    procedure EIP_RemotoEnter(Sender: TObject);
    procedure E_EnderecoLocalEnter(Sender: TObject);
    procedure E_EnderecoRemotoEnter(Sender: TObject);
    procedure EIP_LocalExit(Sender: TObject);
    procedure E_EnderecoLocalExit(Sender: TObject);
    procedure EIP_RemotoExit(Sender: TObject);
    procedure E_EnderecoRemotoExit(Sender: TObject);
    procedure BTBuscaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConfigBD: TFConfigBD;

implementation

uses UBarsa, lite_frmprincipal, checkout;

{$R *.dfm}

procedure TFConfigBD.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FConfigBD,Key);
end;

procedure TFConfigBD.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_Escape
     then BTCancelaClick(Sender);
end;

procedure TFConfigBD.BTCancelaClick(Sender: TObject);
begin
     Close;
end;

procedure TFConfigBD.FormShow(Sender: TObject);
begin
     FrmPrincipal.Ler_configuracao(IP_Local,IP_Remoto,Url_Local,Url_Remoto,PDV);
     EIP_Local.Text:=IP_Local;
     EIP_Remoto.Text:=IP_Remoto;
     E_EnderecoLocal.Text:=Url_Local;
     E_EnderecoRemoto.Text:=Url_Remoto;
     EPDV.Text:=PDV;
     EIp_Local.SetFocus;;
end;

procedure TFConfigBD.BTOkClick(Sender: TObject);
begin
     if Trim(EPDV.Text)=''
     then begin
          Retorna_Informacao_Impressora;
          EPDV.Text:=sNum_Caixa;
          end;

     FrmPrincipal.Gravar_Configuracao(EIp_Local.text,E_EnderecoLocal.Text,EIp_Remoto.text,E_EnderecoRemoto.Text,EPDV.Text);

     Informa('Configuração efetuada com sucesso! O Sistema será reiniciado!!');
     Application.Terminate;
     ShellExecute(0,Nil,PChar(GetCurrentDir+'\PDV.EXE'),'', Nil, SW_SHOWNORMAL);
end;

procedure TFConfigBD.EIP_LocalEnter(Sender: TObject);
begin
     if (Sender is TMaskEdit) then
     TMaskEdit(Sender).Color:=$0080FFFF;
end;

procedure TFConfigBD.EIP_RemotoEnter(Sender: TObject);
begin
     if (Sender is TMaskEdit) then
     TMaskEdit(Sender).Color:=$0080FFFF;
end;

procedure TFConfigBD.E_EnderecoLocalEnter(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=$0080FFFF;
end;

procedure TFConfigBD.E_EnderecoRemotoEnter(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=$0080FFFF;
end;

procedure TFConfigBD.EIP_LocalExit(Sender: TObject);
begin
     if (Sender is TMaskEdit) then
     TMaskEdit(Sender).Color:=clWhite;
end;

procedure TFConfigBD.E_EnderecoLocalExit(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=clWhite;
end;

procedure TFConfigBD.EIP_RemotoExit(Sender: TObject);
begin
     if (Sender is TMaskEdit) then
     TMaskEdit(Sender).Color:=clWhite;
end;

procedure TFConfigBD.E_EnderecoRemotoExit(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=clWhite;
end;

procedure TFConfigBD.BTBuscaClick(Sender: TObject);
begin
     Open.Execute;
     if Open.FileName<>''
     then E_EnderecoLocal.text:=Open.FileName;
end;

procedure TFConfigBD.SpeedButton1Click(Sender: TObject);
begin
     Open1.Execute;
     if Open1.FileName<>''
     then E_EnderecoRemoto.text:=Open1.FileName;
end;

end.
