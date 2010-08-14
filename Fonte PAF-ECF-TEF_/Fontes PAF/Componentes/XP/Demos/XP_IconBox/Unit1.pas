// XP Icon Box Demo v1.0
//
// This demo shows the usage of the icon box,
// the select icon is returned ItemIndex
//
// ** NOTE **
// if your Windows is not installed in 'C:\winnt' you will need
// to change the paths below ..


unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,  XP_IconBox,  XP_Button, Buttons;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    cc: TStaticText;
    IcoBox: TtfXPIconBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure IcoboxClick(Sender: TObject);
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
begin
 IcoBox.LoadIcons('c:\winnt\system32\shell32.dll')
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 IcoBox.LoadIcons('c:\winnt\explorer.exe');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  IcoBox.LoadIcons('c:\winnt\system32\shell32.dll')
end;

procedure TForm1.IcoboxClick(Sender: TObject);
begin
  cc.Caption:=intToStr(IcoBox.ItemIndex);
end;

end.
