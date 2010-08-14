unit UAjudaPDV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, Mylabel;

type
  TFAjudaPDV = class(TForm)
    Shape1: TShape;
    myLabel3d31: TmyLabel3d;
    Shape2: TShape;
    myLabel3d1: TmyLabel3d;
    Bevel2: TBevel;
    myLabel3d2: TmyLabel3d;
    Bevel3: TBevel;
    myLabel3d4: TmyLabel3d;
    myLabel3d3: TmyLabel3d;
    Bevel4: TBevel;
    myLabel3d6: TmyLabel3d;
    myLabel3d5: TmyLabel3d;
    myLabel3d7: TmyLabel3d;
    Bevel5: TBevel;
    myLabel3d8: TmyLabel3d;
    myLabel3d9: TmyLabel3d;
    Bevel6: TBevel;
    myLabel3d10: TmyLabel3d;
    myLabel3d11: TmyLabel3d;
    Bevel7: TBevel;
    myLabel3d12: TmyLabel3d;
    myLabel3d13: TmyLabel3d;
    Bevel8: TBevel;
    myLabel3d14: TmyLabel3d;
    myLabel3d15: TmyLabel3d;
    Bevel9: TBevel;
    myLabel3d16: TmyLabel3d;
    myLabel3d17: TmyLabel3d;
    Bevel10: TBevel;
    myLabel3d18: TmyLabel3d;
    myLabel3d19: TmyLabel3d;
    Bevel11: TBevel;
    myLabel3d20: TmyLabel3d;
    myLabel3d21: TmyLabel3d;
    Bevel12: TBevel;
    myLabel3d22: TmyLabel3d;
    myLabel3d23: TmyLabel3d;
    Bevel13: TBevel;
    myLabel3d24: TmyLabel3d;
    Bevel14: TBevel;
    myLabel3d25: TmyLabel3d;
    myLabel3d26: TmyLabel3d;
    Bevel15: TBevel;
    myLabel3d27: TmyLabel3d;
    myLabel3d28: TmyLabel3d;
    Bevel16: TBevel;
    myLabel3d29: TmyLabel3d;
    myLabel3d30: TmyLabel3d;
    myLabel3d33: TmyLabel3d;
    Bevel17: TBevel;
    myLabel3d35: TmyLabel3d;
    Bevel1: TBevel;
    myLabel3d36: TmyLabel3d;
    myLabel3d37: TmyLabel3d;
    myLabel3d34: TmyLabel3d;
    myLabel3d32: TmyLabel3d;
    Bevel18: TBevel;
    myLabel3d38: TmyLabel3d;
    myLabel3d39: TmyLabel3d;
    Bevel19: TBevel;
    myLabel3d40: TmyLabel3d;
    myLabel3d41: TmyLabel3d;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAjudaPDV: TFAjudaPDV;

implementation

{$R *.dfm}

procedure TFAjudaPDV.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_Escape
     then Close;
end;

end.
