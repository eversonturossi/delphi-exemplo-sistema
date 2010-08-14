unit UContabilista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ComCtrls, Buttons;

type
  TFContabilista = class(TForm)
    SB: TStatusBar;
    GContabilista: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsContabilista: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    btn_salvar: TBitBtn;
    BtSair: TBitBtn;
    LStatus: TLabel;
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContabilista: TFContabilista;

implementation

uses dmsyndAC, UBarsa;

{$R *.dfm}

procedure TFContabilista.DBEdit1Enter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure TFContabilista.DBEdit1Exit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure TFContabilista.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FContabilista,Key);
end;

procedure TFContabilista.BtSairClick(Sender: TObject);
begin
     if DM.TContabilista.State in [dsInsert,dsEdit]
     then begin
          DM.TContabilista.Cancel;
          DM.TContabilista.CancelUpdates;
          end;
     Close;
end;

procedure TFContabilista.FormKeyDown(Sender: TObject; var Key: Word;
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
               GContabilista.Enabled:=True;
               DBEdit3.SetFocus;
               end
          else Informa('Senha Inválida!');
          end;
end;

procedure TFContabilista.FormShow(Sender: TObject);
begin
     GContabilista.Enabled:=False;
     DM.TContabilista.Open;
     if DM.TContabilista.RecordCount = 0
     then begin
          DM.TContabilista.Append;
          LStatus.Caption:='< Incluindo >';
          end
     else begin
          DM.TContabilista.Edit;
          LStatus.Caption:='< Alterando >';
          end;
end;

procedure TFContabilista.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if CanClose = True
     then BtSairClick(Sender);
end;

procedure TFContabilista.FormDestroy(Sender: TObject);
begin
     DM.TContabilista.Close;
end;

procedure TFContabilista.btn_salvarClick(Sender: TObject);
begin
     if Confirma('Confirma a Alteração/Inclusão?')=mrYes
     then begin
          if DM.TContabilista.State = dsInsert
          then begin
               DM.TContabilista.Post;
               DM.TContabilista.ApplyUpdates(-1);
               Close;
               end
          else begin
               DM.TContabilista.Edit;
               DM.TContabilista.Post;
               DM.TContabilista.ApplyUpdates(-1);
               Close;
               end;
          end;
end;

end.
