unit UAjuda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvExControls, JvGradientHeaderPanel, ExtCtrls, Buttons,
  StdCtrls;

type
  TAjudaForm = class(TForm)
    SBPrincipal: TStatusBar;
    Panel2: TPanel;
    JvGradientHeaderPanel1: TJvGradientHeaderPanel;
    Panel1: TPanel;
    MAjuda: TMemo;
    Panel3: TPanel;
    BTConformar: TSpeedButton;
    procedure BTConformarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AjudaForm: TAjudaForm;

implementation

{$R *.dfm}

procedure TAjudaForm.BTConformarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;
end.
