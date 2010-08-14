unit UConsGradeItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, StdCtrls, DB, DBCtrls, Printers,
  ExtCtrls, Mask, Buttons;

type
  TFConsultaGradeItem = class(TForm)
    StatusBar1: TStatusBar;
    G_Grade: TGroupBox;
    DBGrid: TDBGrid;
    dsGrade: TDataSource;
    LProduto: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultaGradeItem: TFConsultaGradeItem;

implementation

uses UDM, UBarsa;

{$R *.dfm}

procedure TFConsultaGradeItem.FormShow(Sender: TObject);
begin
     LProduto.Caption:=StrZero(DM.TConsultaItenOrcCODPRODUTO.AsInteger,5)+'-'+DM.TConsultaItenOrcDESCRICAO.Value;
end;

procedure TFConsultaGradeItem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_Escape
     then Close;
end;

procedure TFConsultaGradeItem.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FConsultaGradeItem,key);
end;

procedure TFConsultaGradeItem.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if not odd(DM.TConsultaOrcGrade.RecNo)
    then begin
         if not (gdselected in state)
         then begin
              DBGrid.Canvas.Brush.Color := $00F0F0F0;
              DBGrid.Canvas.FillRect(Rect);
              DBGrid.DefaultDrawDataCell(rect, Column.Field, State);
              end;
         end;
end;

end.
