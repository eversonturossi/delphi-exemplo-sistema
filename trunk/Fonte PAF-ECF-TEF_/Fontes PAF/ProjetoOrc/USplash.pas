unit USplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, GIFImage, jpeg, StdCtrls, Mylabel, ComCtrls;

type
  TFSplash = class(TForm)
    Panel1: TPanel;
    Timer1: TTimer;
    Image2: TImage;
    myLabel3d1: TmyLabel3d;
    LVersao: TmyLabel3d;
    pb: TProgressBar;
    Image1: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSplash: TFSplash;

implementation

uses UBarsa;

{$R *.dfm}

procedure TFSplash.Timer1Timer(Sender: TObject);
begin
     Close;
end;

procedure TFSplash.FormActivate(Sender: TObject);
begin
     LVersao.Caption:='Versão e Build: '+GetVersaoArq;

     repaint;
     pb.Position := 10;  pb.Position := 20;
     sleep(500);
     pb.Position := 30;  pb.Position := 40;
     sleep(500);
     pb.Position := 50;  pb.Position := 60;
     sleep(500);
     pb.Position := 70;  pb.Position := 80;
     sleep(500);
     pb.Position := 90;  pb.Position := 100;
end;

end.
