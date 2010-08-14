unit u_inicializacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, ComCtrls, StdCtrls, Mylabel, RXCtrls, RxGIF,
  GIFImage;

type
  Tf_inicializacao = class(TForm)
    Panel1: TPanel;
    Timer1: TTimer;
    Panel2: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    Image3: TImage;
    Image2: TImage;
    pb: TProgressBar;
    myLabel3d1: TmyLabel3d;
    myLabel3d4: TmyLabel3d;
    Image4: TImage;
    Image5: TImage;
    myLabel3d2: TmyLabel3d;
    myLabel3d3: TmyLabel3d;
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_inicializacao: Tf_inicializacao;

implementation
{$R *.dfm}

procedure Tf_inicializacao.Timer1Timer(Sender: TObject);
begin
     Close;
end;

procedure Tf_inicializacao.FormActivate(Sender: TObject);
begin
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
