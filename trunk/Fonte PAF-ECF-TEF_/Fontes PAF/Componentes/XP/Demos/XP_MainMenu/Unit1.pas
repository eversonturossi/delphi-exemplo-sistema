unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, XP_MainMenu, ImgList, StdCtrls, Buttons, ToolWin,
  ComCtrls, MenuBar, XP_MenuBar, ActnList, StdActns, XP_Button, XP_Tree,
  XP_Edit, XP_ListBox;



type
  TForm1 = class(TForm)
    ImageList1: TImageList;
    ImageList2: TImageList;
    tfXPButton1: TtfXPButton;
    ttfXPMainMenu1: ttfXPMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    Save3: TMenuItem;
    SaveAs1: TMenuItem;
    SaveAll1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Edit1: TMenuItem;
    cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Delete1: TMenuItem;
    N2: TMenuItem;
    SelectAll1: TMenuItem;
    InvertSelection1: TMenuItem;
    Help1: TMenuItem;
    Help2: TMenuItem;
    N3: TMenuItem;
    ContactUs1: TMenuItem;
    OurHomepage1: TMenuItem;
    N4: TMenuItem;
    About1: TMenuItem;
    CoolBar1: TCoolBar;
    tfXPMenuBar1: TtfXPMenuBar;
    procedure FormCreate(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure MenuItemCheckClick(Sender: TObject);
    procedure Open2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}




procedure TForm1.FormCreate(Sender: TObject);
var item : TMenuItem;
begin

end;

procedure TForm1.Save1Click(Sender: TObject);
begin
  ShowMessage('save selected');
end;

procedure TForm1.MenuItemCheckClick(Sender: TObject);
begin
  (Sender As TMenuItem).checked:=Not (Sender As TMenuItem).Checked;
end;

procedure TForm1.Open2Click(Sender: TObject);
begin
 (sender as tmenuItem).checked:=not  (sender as tmenuItem).checked;
end;

end.
