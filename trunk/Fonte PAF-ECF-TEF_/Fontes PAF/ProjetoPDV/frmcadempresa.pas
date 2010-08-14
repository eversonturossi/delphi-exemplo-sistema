unit frmcadempresa;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBCtrls, DBTables, DB, StdCtrls, Mask, ExtCtrls,
  TabNotBk, Buttons, Grids, Tabs, Menus, ComCtrls;

type
  TFEmpresa = class(TForm)
    Caderno_parametros: TTabbedNotebook;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    BTSalvar: TBitBtn;
    btn_sair: TBitBtn;
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
    dsCadEmpresa: TDataSource;
    Label8: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTSalvarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit14KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmpresa: TFEmpresa;

implementation

{$R *.DFM}

uses dmsyndAC, UBarsa;

procedure TFEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if DM.TEmpresa.State in [dsInsert,dsEdit]
     then begin
          DM.TEmpresa.Cancel;
          DM.TEmpresa.CancelUpdates;
          end;
     DM.TEmpresa.Close;
end;

procedure TFEmpresa.BTSalvarClick(Sender: TObject);
begin
     if Confirma('Confirma a Alteração dos dados?')=mrYes
     then begin
          DM.TEmpresa.Edit;
          DM.TEmpresa.Post;
          DM.TEmpresa.ApplyUpdates(0);
          DM.TEmpresa.Refresh;
          Close;
          end;
end;

procedure TFEmpresa.btn_sairClick(Sender: TObject);
begin
     close;
end;

procedure TFEmpresa.FormShow(Sender: TObject);
begin
     DM.TEmpresa.Open;
     if DM.TEmpresa.IsEmpty
     then DM.TEmpresa.Append;
     DBEdit1.SetFocus;
end;

procedure TFEmpresa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=Vk_F10
     then BTSalvarClick(Sender);

     if Key=VK_Escape
     then btn_sairclick(Sender);
end;

procedure TFEmpresa.DBEdit1Enter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure TFEmpresa.DBEdit1Exit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure TFEmpresa.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FEmpresa,Key);
end;

procedure TFEmpresa.DBEdit14KeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then BTSalvarClick(Sender);
end;

end.

