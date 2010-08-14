unit USelecionaPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFClassificaPreco = class(TForm)
    RBPrecoVista: TRadioButton;
    RBPrecoPrazo: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClassificaPreco: TFClassificaPreco;

implementation

uses checkout, frmconsultaprodutospdv;

{$R *.dfm}

procedure TFClassificaPreco.FormShow(Sender: TObject);
begin
     if sPrecoTabela='V'
     then RBPrecoVista.Checked:=True
     else RBPrecoPrazo.Checked:=True;
end;

procedure TFClassificaPreco.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then Close;
end;

procedure TFClassificaPreco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if RBPrecoVista.Checked
     then sPrecoTabela:='V'
     else sPrecoTabela:='P';

     FrmCheckOut.LTabela.Caption:=sPrecoTabela;

     if FPesquisaProdutos<>Nil
     then FPesquisaProdutos.SelecionaColuna(Nil);
end;

procedure TFClassificaPreco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_Escape
     then Close;
end;

end.
