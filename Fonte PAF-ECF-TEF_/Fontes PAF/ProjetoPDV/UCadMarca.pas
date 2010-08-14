unit UCadMarca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, DBCtrls,
  ExtCtrls;

type
  TFCadMarca = class(TForm)
    Panel2: TPanel;
    BTincluir: TBitBtn;
    BTAlterar: TBitBtn;
    BTSair: TBitBtn;
    SB: TStatusBar;
    dsMarca: TDataSource;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    DBEdit_nome: TDBEdit;
    BTSalvar: TBitBtn;
    BTCancela: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BTincluirClick(Sender: TObject);
    procedure BTAlterarClick(Sender: TObject);
    procedure BTSalvarClick(Sender: TObject);
    procedure BTCancelaClick(Sender: TObject);
    procedure BTSairClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DBEdit_nomeEnter(Sender: TObject);
    procedure DBEdit_nomeExit(Sender: TObject);
    procedure DBEdit_nomeKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    vConsulta : Boolean;
  end;

var
  FCadMarca: TFCadMarca;

implementation

uses dmsyndAC, UBarsa;

{$R *.dfm}

procedure TFCadMarca.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FCadMarca,Key);
end;

procedure TFCadMarca.BTincluirClick(Sender: TObject);
begin
     PageControl.TabIndex:=1;
     DM.TMarca.Append;

     BTSalvar.Enabled:=True;
     BTCancela.Enabled:=True;
     BTIncluir.Enabled:=False;
     BTAlterar.Enabled:=False;
     BTSair.Enabled:=False;
     DBEdit_Nome.SetFocus;
end;

procedure TFCadMarca.BTAlterarClick(Sender: TObject);
begin
     PageControl.TabIndex:=1;
     DM.TMarca.Edit;

     BTSalvar.Enabled:=True;
     BTCancela.Enabled:=True;
     BTIncluir.Enabled:=False;
     BTAlterar.Enabled:=False;
     BTSair.Enabled:=False;
     DBEdit_Nome.SetFocus;
end;

procedure TFCadMarca.BTSalvarClick(Sender: TObject);
begin
     PageControl.TabIndex:=0;
     DM.TMarca.Edit;
     DM.TMarca.Post;
     DM.TMarca.ApplyUpdates(0);
     DM.TMarca.Refresh;

     BTSalvar.Enabled:=False;
     BTCancela.Enabled:=False;
     BTIncluir.Enabled:=True;
     BTAlterar.Enabled:=True;
     BTSair.Enabled:=True;
     DBGrid1.SetFocus;
end;

procedure TFCadMarca.BTCancelaClick(Sender: TObject);
begin
     PageControl.TabIndex:=0;
     DM.TMarca.Cancel;
     DM.TMarca.CancelUpdates;

     BTSalvar.Enabled:=False;
     BTCancela.Enabled:=False;
     BTIncluir.Enabled:=True;
     BTAlterar.Enabled:=True;
     BTSair.Enabled:=True;
     DBGrid1.SetFocus;
end;

procedure TFCadMarca.BTSairClick(Sender: TObject);
begin
     Close;
end;

procedure TFCadMarca.FormDestroy(Sender: TObject);
begin
     DM.TMarca.Close;
end;

procedure TFCadMarca.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (key >= 49) and (key <= 105)
     then begin
          SB.Panels[0].Text:=SB.Panels[0].text+CHR(key);
          DM.TMarca.FindNearest([SB.Panels[0].Text]);
          end
     else if key in [8,38,40] // BackSpace, UpArrow, DownArrow
     then SB.Panels[0].Text:='';
end;

procedure TFCadMarca.FormShow(Sender: TObject);
begin
     PageControl.TabIndex:=0;
     DM.TMarca.Open;
     DM.TMarca.IndexFieldNames:='NOME';
     DBGrid1.SetFocus;
end;

procedure TFCadMarca.DBEdit_nomeEnter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure TFCadMarca.DBEdit_nomeExit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure TFCadMarca.DBEdit_nomeKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then begin
          if DM.TMarca.State in [dsInsert,dsEdit]
          then BTSalvarClick(Sender);
          end;
end;

procedure TFCadMarca.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if (Key=#13)and(vConsulta)
     then ModalResult:=mrOk;
end;

procedure TFCadMarca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if PageControl.TabIndex=0
     then begin
          if Key=VK_Insert
          then BTIncluirClick(Sender)
          else if Key=VK_F2
          then BTAlterarClick(Sender)
          else if Key=VK_Escape
          then BTSairClick(Sender);
          end
     else begin
          if Key=VK_F10
          then BTSalvarClick(Sender)
          else if Key=VK_Escape
          then BTCancelaClick(Sender);
          end;
end;

end.
