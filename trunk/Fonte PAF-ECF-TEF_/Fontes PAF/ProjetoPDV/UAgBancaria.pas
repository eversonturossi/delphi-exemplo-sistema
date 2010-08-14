unit UAgBancaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, ComCtrls, Buttons, ToolWin, Mask, DBCtrls,
  ExtCtrls, Grids, DBGrids;

type
  TFAgBancaria = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar2: TToolBar;
    EProcuraNome: TEdit;
    DSAgBancaria: TDataSource;
    DBGrid: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure DBGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure EProcuraNomeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EProcuraNomeExit(Sender: TObject);
    procedure EProcuraNomeEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    vConsulta : Boolean;
  end;

var
  FAgBancaria: TFAgBancaria;

implementation

uses UBarsa, dmsyndAC;

{$R *.dfm}

procedure TFAgBancaria.FormShow(Sender: TObject);
begin
     DM.TAgBancaria.Open;
     DBGrid.SetFocus;
end;

procedure TFAgBancaria.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FAgBancaria,Key);
end;

procedure TFAgBancaria.FormDestroy(Sender: TObject);
begin
     DM.TAgBancaria.Close;
end;

procedure TFAgBancaria.DBGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if DM.TAgBancaria.State=DsBrowse
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

procedure TFAgBancaria.DBGridKeyPress(Sender: TObject; var Key: Char);
begin
     if (key=#13) and (vConsulta)
     then begin
          if (DM.TAgBancaria.State=DSBrowse)and(not DM.TAgBancaria.IsEmpty)
          then ModalResult:=MrOk;
          end;
end;

procedure TFAgBancaria.EProcuraNomeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     DM.TAgBancaria.FindNearest([EProcuraNome.text]);
     if key=40  // seta para baixo
     then DBGrid.SetFocus;
end;

procedure TFAgBancaria.EProcuraNomeExit(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=clSilver;
end;

procedure TFAgBancaria.EProcuraNomeEnter(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=$0080FFFF;
end;

procedure TFAgBancaria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_Escape
     then Close;
end;

end.
