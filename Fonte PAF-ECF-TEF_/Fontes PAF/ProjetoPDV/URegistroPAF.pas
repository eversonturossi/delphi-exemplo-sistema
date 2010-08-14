unit URegistroPAF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, StdCtrls, Mask, DBCtrls, Buttons;

type
  TFRegistroPAF = class(TForm)
    dsRegistro: TDataSource;
    GPaf: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    LStatus: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    btn_salvar: TBitBtn;
    BtSair: TBitBtn;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    SB: TStatusBar;
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btn_salvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegistroPAF: TFRegistroPAF;

implementation

uses dmsyndAC, UBarsa;

{$R *.dfm}

procedure TFRegistroPAF.DBEdit1Enter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure TFRegistroPAF.DBEdit1Exit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure TFRegistroPAF.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FRegistroPAF,Key);
end;

procedure TFRegistroPAF.BtSairClick(Sender: TObject);
begin
     if DM.TRegistro.State in [dsInsert,dsEdit]
     then begin
          DM.TRegistro.Cancel;
          DM.TRegistro.CancelUpdates;
          end;
     Close;
end;

procedure TFRegistroPAF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   sSenha_Suporte : String;
begin
     if Key=VK_Escape
     then BtSairClick(Sender);

     if Key=VK_F10
     then begin
          sSenha_Suporte:='922591';
          if PasswordInputBox('Informe a Senha do Suporte Técnico!','SENHA')=Uppercase(sSenha_Suporte)
          then begin
               GPaf.Enabled:=True;
               DBEdit1.SetFocus;
               end
          else Informa('Senha Inválida!');     
          end;
end;

procedure TFRegistroPAF.FormShow(Sender: TObject);
begin
     GPaf.Enabled:=False;
     DM.TRegistro.Open;
     if DM.TRegistro.RecordCount = 0
     then begin
          DM.TRegistro.Append;
          LStatus.Caption:='< Incluindo >';
          end
     else begin
          DM.TRegistro.Edit;
          LStatus.Caption:='< Alterando >';
          end;
end;

procedure TFRegistroPAF.FormDestroy(Sender: TObject);
begin
     DM.TRegistro.Close;
end;

procedure TFRegistroPAF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if CanClose = True
     then BtSairClick(Sender);
end;

procedure TFRegistroPAF.btn_salvarClick(Sender: TObject);
begin
     if Confirma('Confirma a Alteração/Inclusão?')=mrYes
     then begin
          if DM.TRegistro.State = dsInsert
          then begin
               DM.TRegistro.Post;
               DM.TRegistro.ApplyUpdates(-1);
               Close;
               end
          else begin
               DM.TRegistro.Edit;
               DM.TRegistro.Post;
               DM.TRegistro.ApplyUpdates(-1);
               Close;
               end;
          end;
end;

end.
