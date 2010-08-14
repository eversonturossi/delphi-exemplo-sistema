unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, XP_Button, Buttons, ComCtrls, ToolWin, ImgList, StdCtrls,
  JvCheckBox;

type
  TForm1 = class(TForm)
    FileMenu: TPopupMenu;
    Open1: TMenuItem;
    Save1: TMenuItem;
    PageSetup1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    ImageList1: TImageList;
    CoolBar1: TCoolBar;
    ToolBar2: TToolBar;
    ToolBar1: TToolBar;
    tfXPButton6: TtfXPButton;
    tfXPButton5: TtfXPButton;
    tfXPButton4: TtfXPButton;
    tfXPButton3: TtfXPButton;
    tfXPButton2: TtfXPButton;
    tfXPButton1: TtfXPButton;
    tfXPButton7: TtfXPButton;
    tfXPButton8: TtfXPButton;
    tfXPButton9: TtfXPButton;
    EditMenu: TPopupMenu;
    Edit1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Delete1: TMenuItem;
    N2: TMenuItem;
    SelectAll1: TMenuItem;
    InvertSelection1: TMenuItem;
    ViewMenu: TPopupMenu;
    Window11: TMenuItem;
    Window21: TMenuItem;
    Window31: TMenuItem;
    tfXPButton10: TtfXPButton;
    HelpMenu: TPopupMenu;
    Help1: TMenuItem;
    N3: TMenuItem;
    Homepage1: TMenuItem;
    EmailUs1: TMenuItem;
    About1: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

end.
