unit UTelaLimte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFTelaLimite = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BTOk: TBitBtn;
    LLimite: TLabel;
    LReceber: TLabel;
    LTotal: TLabel;
    LExcedido: TLabel;
    procedure BTOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTelaLimite: TFTelaLimite;

implementation
uses UBarsa, UPesqClienteBalcao;
{$R *.dfm}

procedure TFTelaLimite.BTOkClick(Sender: TObject);
begin
     Close;
end;

procedure TFTelaLimite.FormShow(Sender: TObject);
begin
      LLimite.Caption:=CasaDecimal(FPesqClienteBalcao.vLimiteCredito,12);
      LReceber.Caption:=CasaDecimal(FPesqClienteBalcao.vVencidas+FPesqClienteBalcao.vVencer,12);
      LTotal.Caption:=CasaDecimal(FPesqClienteBalcao.vTotalProdutos,12);
      LExcedido.Caption:=
      CasaDecimal((FPesqClienteBalcao.vTotalProdutos+FPesqClienteBalcao.vVencer+FPesqClienteBalcao.vVencidas)-FPesqClienteBalcao.vLimiteCredito,12);
      BTOk.SetFocus;
end;

end.
