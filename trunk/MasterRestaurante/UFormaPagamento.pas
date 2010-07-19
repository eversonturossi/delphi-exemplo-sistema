unit UFormaPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvExControls, JvGradientHeaderPanel, ExtCtrls, StdCtrls,
  JvExStdCtrls, JvEdit, JvValidateEdit;

type
  TFormaPagamentoForm = class(TForm)
    Panel2: TPanel;
    JvGradientHeaderPanel1: TJvGradientHeaderPanel;
    SBPrincipal: TStatusBar;
    Panel1: TPanel;
    Label4: TLabel;
    EditTotal: TJvValidateEdit;
    Shape4: TShape;
    Label1: TLabel;
    Shape1: TShape;
    JvValidateEdit1: TJvValidateEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormaPagamentoForm: TFormaPagamentoForm;

implementation

{$R *.dfm}

procedure TFormaPagamentoForm.FormShow(Sender: TObject);
begin
  Caption := 'MasterRestaurante - Formas de Pagamento';
end;

end.
