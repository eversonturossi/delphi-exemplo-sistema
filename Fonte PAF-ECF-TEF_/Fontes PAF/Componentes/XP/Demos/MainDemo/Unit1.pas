unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, XP_MenuBar, XP_MainMenu, ToolWin, ImgList, StdCtrls,
  XP_Button, ExtCtrls, XP_Form, XP_Edit;

type
  TForm1 = class(TForm)
    ImageList1: TImageList;
    ttfXPMainMenu1: ttfXPMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    PrintSetup1: TMenuItem;
    Print1: TMenuItem;
    N2: TMenuItem;
    SaveAs1: TMenuItem;
    Save1: TMenuItem;
    Open1: TMenuItem;
    New1: TMenuItem;
    Edit1: TMenuItem;
    Paste1: TMenuItem;
    Copy1: TMenuItem;
    Cut1: TMenuItem;
    Window1: TMenuItem;
    Show1: TMenuItem;
    Hide1: TMenuItem;
    N6: TMenuItem;
    ArrangeAll1: TMenuItem;
    Cascade1: TMenuItem;
    Tile1: TMenuItem;
    NewWindow1: TMenuItem;
    Help1: TMenuItem;
    N3: TMenuItem;
    SelectAll1: TMenuItem;
    Help2: TMenuItem;
    N4: TMenuItem;
    EmailUs1: TMenuItem;
    OurHomepage1: TMenuItem;
    N5: TMenuItem;
    About1: TMenuItem;
    tfXPForm1: TtfXPForm;
    Panel1: TPanel;
    CoolBar1: TCoolBar;
    tfXPMenuBar1: TtfXPMenuBar;
    ToolBar1: TToolBar;
    tfXPButton1: TtfXPButton;
    tfXPButton2: TtfXPButton;
    tfXPButton3: TtfXPButton;
    tfXPButton4: TtfXPButton;
    tfXPButton5: TtfXPButton;
    tfXPButton6: TtfXPButton;
    tfXPButton7: TtfXPButton;
    tfXPButton8: TtfXPButton;
    tfXPButton9: TtfXPButton;
    Memo1: TMemo;
    tfXPEdit1: TtfXPEdit;
    procedure Exit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Exit1Click(Sender: TObject);
begin
 Close;
end;

end.
