unit UCartao_Deb_Cred;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFCartao_Deb_Cred = class(TForm)
    RBDebito: TRadioButton;
    RBCredito: TRadioButton;
    Bevel1: TBevel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCartao_Deb_Cred: TFCartao_Deb_Cred;

implementation

{$R *.dfm}

procedure TFCartao_Deb_Cred.FormShow(Sender: TObject);
begin
     RBCredito.Checked:=True;
     RBCredito.SetFocus;
end;

procedure TFCartao_Deb_Cred.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then ModalResult:=mrOk;
end;

end.
