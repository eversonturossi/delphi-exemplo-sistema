unit UAcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, Registry, ExtCtrls, IniFiles;

type
  TFAcesso = class(TForm)
    Panel1: TPanel;
    ESenhaControle: TEdit;
    BTOk: TBitBtn;
    BtCancela: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    PCodigo: TPanel;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure BtCancelaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BTOkClick(Sender: TObject);
    procedure ESenhaControleChange(Sender: TObject);
    procedure ESenhaControleKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
      vMeuCodigo, vSenha : Integer;
  end;

var
  FAcesso: TFAcesso;

implementation
uses lite_frmprincipal, UBarsa;
{$R *.DFM}

procedure TFAcesso.FormShow(Sender: TObject);
var
   Dia, Mes, Ano, Hora, Min, Seg, Cs : Word;
   vDias, vHoras : Integer;
begin
     DecodeDate(Date, Ano, Mes, Dia);
     DecodeTime(Time, hora, min, seg, Cs);
     vDias:=(Dia)+(Mes)+(Ano);
     vHoras:=(Hora)+(Min)+(Seg)+(Cs);
     vMeuCodigo:=vDias*vHoras;
     PCodigo.Caption:=IntToStr(vMeuCodigo);

     ESenhaControle.Clear;
     BTOk.Enabled:=False;
     ESenhaControle.Clear;
     ESenhaControle.SetFocus;
end;

procedure TFAcesso.BtCancelaClick(Sender: TObject);
begin
     Application.Terminate;
end;

procedure TFAcesso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key=VK_Escape)
     then BTCancelaClick(Sender);
end;

procedure TFAcesso.BTOkClick(Sender: TObject);
var
   vSenhaDigitada, vNumSerieHD : String;
begin
     vSenha:=(vMeuCodigo + 922591005) ;
     vSenhaDigitada:=Trim(ESenhaControle.text);
     vNumSerieHD := SerialNum('C');
     if (vSenhaDigitada=IntToStr(vSenha))
     then begin
          //GravaIniCrypt('Serial','SerieHD',vNumSerieHD);
          Informa('O SISTEMA FOI LIBERADO, ACESSE-O NOVAMENTE!');
          Application.Terminate;
          end
       else begin
            ShowMessage('A SENHA DIGITADA NÃO CONFERE!'+#13+#13
                       +'CONFIRME A DIGITAÇÃO OU CONSULTE O SUPORTE TÉCNICO'+#13+#13
                       +'PELOS FONES: (82)3481-2873 ou 9622-7982 OU '+#13+#13
                       +'PELO E-MAIL: cbssolucoes@yahoo.com.br OU'+#13+#13
                       +'PELO MSN: cbdasilvafilho@hotmail.com'+#13+#13
                       +'ARAPIRACA - AL');
            ESenhaControle.SetFocus;
       end;
end;

procedure TFAcesso.ESenhaControleChange(Sender: TObject);
begin
     if ESenhaControle.text<>''
     then BTOk.Enabled:=True
     else BTOk.Enabled:=False;
end;

procedure TFAcesso.ESenhaControleKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then BTOkClick(Sender);
end;

end.
