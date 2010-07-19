unit UAjudaAtalhos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls;

type
  TAjudaAtalhosForm = class(TForm)
    Memo: TMemo;
    Panel1: TPanel;
    BTFechar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure BTFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AjudaAtalhosForm: TAjudaAtalhosForm;

implementation
uses Base;
{$R *.dfm}

procedure TAjudaAtalhosForm.BTFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TAjudaAtalhosForm.FormShow(Sender: TObject);
begin
  BTFechar.Glyph.LoadFromFile(BancoDados.imgFechar);
end;

end.
