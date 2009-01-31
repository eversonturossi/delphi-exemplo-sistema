unit DlgTipoCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, ExtCtrls, jpeg;

type
  TDlgTipoClienteForm = class(TForm)
    Image4: TImage;
    Panel1: TPanel;
    BTCancelar: THTMLButton;
    BitBtn1: THTMLButton;
    CBTipoCliente: TComboBox;
    Label1: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DlgTipoClienteForm: TDlgTipoClienteForm;

implementation

{$R *.dfm}

procedure TDlgTipoClienteForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (CBTipoCliente.ItemIndex in [0]) then
    CanClose := True;
end;

procedure TDlgTipoClienteForm.FormShow(Sender: TObject);
begin
  CBTipoCliente.SetFocus;
end;

end.
