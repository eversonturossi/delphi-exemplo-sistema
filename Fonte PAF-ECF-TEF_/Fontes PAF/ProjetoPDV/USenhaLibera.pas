unit USenhaLibera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RXCtrls, Mask,StdCtrls, Buttons,
  jpeg, rxToolEdit, rxCurrEdit;

type
  TFSenhaLibera = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label2: TLabel;
    ESenha: TEdit;
    Label1: TLabel;
    id_usuario: TCurrencyEdit;
    btOk: TBitBtn;
    btn_cancelar: TBitBtn;
    nome_usuario: TRxLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ESenhaEnter(Sender: TObject);
    procedure ESenhaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure id_usuarioExit(Sender: TObject);
    procedure id_usuarioEnter(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure ESenhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    vOpcao : String;
  end;

var
  FSenhaLibera: TFSenhaLibera;

implementation

uses UBarsa, dmsyndAC, UPAF_ECF, lite_frmprincipal;

{$R *.dfm}

procedure TFSenhaLibera.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_Escape
     then Close;
end;

procedure TFSenhaLibera.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FSenhaLibera,Key);
end;

procedure TFSenhaLibera.ESenhaEnter(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=$0080FFFF;
end;

procedure TFSenhaLibera.ESenhaExit(Sender: TObject);
begin
   if (Sender is TEdit) then
   TEdit(Sender).Color:=clWhite;

   With DM.QUsuario
   do begin
      Close;
      Sql.Clear;
      if ServidorRemoto='OF'
      then Sql.Add('SELECT * FROM USUARIOS')
      else Sql.Add('SELECT * FROM USUARIOS_PDV');
      Sql.Add('WHERE SENHA=:PSENHA');
      ParamByName('PSENHA').AsString:=ESenha.Text;
      Sql.Add('AND ID=:PID');
      ParamByName('PID').AsInteger:=StrToInt(id_usuario.text);
      Open;
      end;
   if (DM.QUsuario.IsEmpty)
   then begin
        Informa('Senha Inválida!');
        nome_usuario.Caption:='';
        Esenha.Text:='';
        btOk.Enabled:=False;
        id_usuario.setfocus;
        end
   else btOk.Enabled:=True;
end;

procedure TFSenhaLibera.FormShow(Sender: TObject);
begin
     vLiberado:=False;
     id_Usuario.SetFocus;
end;

procedure TFSenhaLibera.btn_cancelarClick(Sender: TObject);
begin
     Close;
end;

procedure TFSenhaLibera.id_usuarioExit(Sender: TObject);
begin
      if (Sender is TCurrencyEdit) then
      TCurrencyEdit(Sender).Color:=clWhite;

      With DM.QUsuario
      do begin
         Close;
         Sql.Clear;
         if ServidorRemoto='OF'
         then Sql.Add('SELECT * FROM USUARIOS')
         else Sql.Add('SELECT * FROM USUARIOS_PDV');
         Sql.Add('WHERE ID=:PID');
         ParamByName('PID').AsInteger:=StrToInt(id_usuario.text);
         Open;
         end;
      if (DM.QUsuario.IsEmpty)
      then begin
           Informa('Identificação Inválida!');
           id_Usuario.SetFocus;
           end
      else Nome_Usuario.Caption:=DM.QUsuarioNome.Value;
end;

procedure TFSenhaLibera.id_usuarioEnter(Sender: TObject);
begin
     if (Sender is TCurrencyEdit) then
     TCurrencyEdit(Sender).Color:=$0080FFFF;
end;

procedure TFSenhaLibera.btOkClick(Sender: TObject);
begin
     if DM.QUsuario.FieldByName(vOpcao).AsInteger=0
     then begin
          Informa('USUÁRIO SEM PERMISSÃO PARA A LIBERAÇÃO!');
          vLiberado:=False;
          id_Usuario.SetFocus;
          end
     else begin
          vLiberado:=True;
          Close;
          end;
end;

procedure TFSenhaLibera.ESenhaKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then begin
          if BTOk.Enabled
          then BTOK.SetFocus;
          end;
end;

end.
