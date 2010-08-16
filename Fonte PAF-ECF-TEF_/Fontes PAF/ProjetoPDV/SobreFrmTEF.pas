unit SobreFrmTEF;

interface

{$I ..\common\DelphiVer.inc}

uses
  Windows, Messages, SysUtils,
  {$IFDEF DELPHI_6_UP}
  Variants,
  {$ENDIF}
  Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ShellAPI;

type
  TSobreFormTEF = class(TForm)
    Image: TImage;
    lblVersao: TLabel;
    lblEasyTEFTeam: TLabel;
    lblSite: TLabel;
    procedure lblSiteClick(Sender: TObject);
    procedure ImageClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SobreFormTEF: TSobreFormTEF;

implementation

{$R *.dfm}

procedure TSobreFormTEF.lblSiteClick(Sender: TObject);
begin
  ShellExecute(0, 'open', 'http://www.easytef.com.br', nil, nil, SW_SHOWNORMAL)
end;

procedure TSobreFormTEF.ImageClick(Sender: TObject);
begin
  Close;
end;

procedure TSobreFormTEF.FormShow(Sender: TObject);
begin
{$IFDEF DELPHI_6_UP}
  Self.Color := clAqua;
  Self.TransparentColorValue := clAqua;
  Self.TransparentColor := True;
{$ENDIF}
end;

end.
