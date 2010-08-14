unit Uestado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFESTADO = class(TForm)
    RGUF: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FESTADO: TFESTADO;

implementation
uses UBarsa;
{$R *.dfm}

procedure TFESTADO.FormShow(Sender: TObject);
begin
     RGUF.ItemIndex:=0;
end;

procedure TFESTADO.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then Close;
end;

procedure TFESTADO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_Escape
     then Close;
end;

end.
