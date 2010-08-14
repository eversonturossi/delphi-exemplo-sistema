unit UVendedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, ComCtrls, Buttons, ToolWin, DB, DBTables,
  Mask, DBCtrls, FMTBcd, SqlExpr;

type
  TFVendedor = class(TForm)
    SB: TStatusBar;
    PageControl1: TPageControl;
    TListar: TTabSheet;
    DBGrid: TDBGrid;
    ToolBar2: TToolBar;
    EProcuraNome: TEdit;
    DsVendedor: TDataSource;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure EProcuraNomeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EProcuraNomeEnter(Sender: TObject);
    procedure EProcuraNomeExit(Sender: TObject);
    procedure DBGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    vConsulta : Boolean;
  end;

var
  FVendedor: TFVendedor;

implementation
uses UBarsa, dmsyndAC;
{$R *.DFM}

procedure TFVendedor.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FVendedor,Key);
end;

procedure TFVendedor.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
     AllowChange := false;
end;

procedure TFVendedor.FormShow(Sender: TObject);
begin
     PageControl1.ActivePage:=TListar;
     DM.TVendedor.Close;
     DM.TVendedor.Params[0].AsString:='N';
     DM.TVendedor.Open;
     DBGrid.SetFocus;
end;

procedure TFVendedor.FormDestroy(Sender: TObject);
begin
     DM.TVendedor.Close;
end;

procedure TFVendedor.DBGridKeyPress(Sender: TObject; var Key: Char);
begin
     if (key=#13) and (vConsulta)
     then begin
          if (DM.TVendedor.State=DSBrowse)and(not DM.TVendedor.IsEmpty)
          then ModalResult:=MrOk;
          end;
end;

procedure TFVendedor.EProcuraNomeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     DM.TVendedor.FindNearest([EProcuraNome.text]);
     if key=40  // seta para baixo
     then DBGrid.SetFocus;
end;

procedure TFVendedor.EProcuraNomeEnter(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=$0080FFFF;
end;

procedure TFVendedor.EProcuraNomeExit(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=clSilver;
end;

procedure TFVendedor.DBGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if DM.TVendedor.State=DsBrowse
     then begin
          if (key >= 49) and (key <= 105)
          then begin
               EProcuraNome.Text:='';
               EProcuraNome.text := EProcuraNome.Text+Chr(key);
               EProcuraNome.SetFocus;
               EProcuraNome.Selstart:= Length(EProcuraNome.Text);
               end;
        end;
end;

end.
