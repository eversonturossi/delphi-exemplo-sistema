unit UAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, RXCtrls;

type
  TFAjuda = class(TForm)
    Bevel1: TBevel;
    RxLabel1: TRxLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel8: TRxLabel;
    RxLabel9: TRxLabel;
    RxLabel10: TRxLabel;
    RxLabel11: TRxLabel;
    RxLabel2: TRxLabel;
    Bevel8: TBevel;
    RxLabel12: TRxLabel;
    RxLabel13: TRxLabel;
    Bevel9: TBevel;
    RxLabel14: TRxLabel;
    RxLabel15: TRxLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAjuda: TFAjuda;

implementation

{$R *.dfm}

procedure TFAjuda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_Escape
     then Close;
end;

end.
