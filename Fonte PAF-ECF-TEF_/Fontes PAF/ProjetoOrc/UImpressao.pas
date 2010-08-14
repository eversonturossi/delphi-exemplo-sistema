unit UImpressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons;

type
  TFTipoImpressao = class(TForm)
    StatusBar1: TStatusBar;
    Image1: TImage;
    BtImpressora: TBitBtn;
    BtVideo: TBitBtn;
    procedure BtSairClick(Sender: TObject);
    procedure BtImpressoraClick(Sender: TObject);
    procedure BtVideoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTipoImpressao: TFTipoImpressao;

implementation

uses UOrcamento, URelatorios;

{$R *.dfm}

procedure TFTipoImpressao.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TFTipoImpressao.BtImpressoraClick(Sender: TObject);
begin
     FOrcamentos.Imprimi(0);
     Close;
end;

procedure TFTipoImpressao.BtVideoClick(Sender: TObject);
begin
     FOrcamentos.Imprimi(1);
     {FRelatorios := TFRelatorios.Create(Self);
     FRelatorios.ShowModal;
     FreeAndNil(FRelatorios);}
     Close;
end;

procedure TFTipoImpressao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_F2
     then BtImpressoraClick(Sender)
     else if Key=VK_F3
     then BtVideoClick(Sender)
     else if Key=VK_Escape
     then Close;
end;

end.
