unit UMeiosPgtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TFMeiosPgtos = class(TForm)
    Label4: TLabel;
    Panel1: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    BtnImprimir: TSpeedButton;
    BtnCancelar: TSpeedButton;
    btnSalvar: TSpeedButton;
    rce: TRichEdit;
    procedure FormActivate(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    dtarq, localarq : string;
    procedure ConsultaMeiosPgtos(xDataI, xDataF : TDate);
  public
    { Public declarations }
  end;

var
  FMeiosPgtos: TFMeiosPgtos;

implementation

uses UMenuFiscal, dmsyndAC, UBarsa, UAssinaDigital, checkout, DateUtils,
  SqlExpr;

{$R *.dfm}

procedure TFMeiosPgtos.ConsultaMeiosPgtos(xDataI, xDataF : TDate);
begin
    With DM
    do begin
       TConsultaMeiosPgtos.Close;
       TConsultaMeiosPgtos.Params[0].AsDate:=xDataI;
       TConsultaMeiosPgtos.Params[1].AsDate:=xDataF;
       TConsultaMeiosPgtos.Params[2].AsString:=sNumero_serie;
       TConsultaMeiosPgtos.IndexFieldNames:='DATA';
       TConsultaMeiosPgtos.Open;
       end;
end;

procedure TFMeiosPgtos.FormActivate(Sender: TObject);
begin
     ConsultaMeiosPgtos(FMenuFiscal.EDataI.Date,FMenuFiscal.EDataF.Date);
     if DM.TConsultaMeiosPgtos.RecordCount > 0
     then begin
           rce.Lines.Add('MEIOS DE PAGAMENTO em: '+DateToStr(FMenuFiscal.EDataI.Date)+' a '+DateToStr(FMenuFiscal.EDataF.Date));
           rce.Lines.Add('------------------------------------------------');
           rce.Lines.Add('Meio de Pgto. Tipo Doc. Vl.Acumul.  Dt.Acumul.');
           With DM
           do begin
              TConsultaMeiosPgtos.First;
              While not TConsultaMeiosPgtos.Eof
              do begin
                 rce.Lines.Add(Espaco(TConsultaMeiosPgtosDESCR_PGTO.Value,14)+Space(1)+
                               Center('C.Fiscal',8)+Space(1)+
                               CasaDecimal(TConsultaMeiosPgtosTOTAL.AsFloat,12)+Space(2)+
                               DateToStr(TConsultaMeiosPgtosDATA.AsDateTime));
                 TConsultaMeiosPgtos.Next;
                 end;
              end;
          rce.Lines.Add('------------------------------------------------');
          rce.Lines.Add('');
          rce.Lines.Add('< Soma individual de cada meio de pagamento >');
          With DM.QPesquisaBaseLocal
          do begin
             Close;
             Sql.Clear;
             Sql.Add('SELECT MEIOS_PGTOS.DESCR_PGTO,SUM(MEIOS_PGTOS.VALOR) FROM MEIOS_PGTOS');
             Sql.Add('LEFT OUTER JOIN VENDA ON MEIOS_PGTOS.COD_VENDA = VENDA.CODIGO');
             Sql.Add('WHERE VENDA.DATA BETWEEN :PDATAI AND :PDATAF');
             Sql.Add('AND VENDA.NUMERO_ECF=:PNUMSERIE');
             Sql.Add('GROUP BY MEIOS_PGTOS.DESCR_PGTO');
             ParamByName('PDATAI').AsDate:=FMenuFiscal.EDataI.Date;
             ParamByName('PDATAF').AsDate:=FMenuFiscal.EDataF.Date;
             ParamByName('PNUMSERIE').AsString:=sNumero_serie;
             Open;
             While not Eof
             do begin
                rce.Lines.Add(Espaco(FieldByName('DESCR_PGTO').Value,14)+Space(2)+
                              CasaDecimal(FieldByName('SUM').AsFloat,12));
                Next;
                end;
             end;
        end
    else Informa('Não há movimento de DAV neste Período!');
end;

procedure TFMeiosPgtos.BtnCancelarClick(Sender: TObject);
begin
     Close;
end;

procedure TFMeiosPgtos.BtnImprimirClick(Sender: TObject);
var
 i:integer;
begin
 AbreRelGerencial;
 for i := 0 to rce.Lines.Count - 1 do
  begin
   ImprimiRelGerencial(rce.Lines.Strings[i]+chr(10)+chr(13));
  end;
 FechaRelGerencial;
end;

procedure TFMeiosPgtos.btnSalvarClick(Sender: TObject);
var
 lsLinhas : TStrings;
 I        : integer;
 dtarq    : string;
 localarq : string;
begin
 dtarq    := RetornaDataString(DateToStr(Now));
 localarq := ('C:\Apgef\PAF\'+'MeiosdePagamento'+dtarq+'.txt');
 try
  lsLinhas := TStringList.Create;
  for i := 0 to rce.Lines.Count -1 do lsLinhas.Add(rce.Lines.Strings[i]);
  lsLinhas.SaveToFile(localarq);
 finally
  FreeAndNil(lsLinhas);
 end;
 GerarEADArquivo(localarq);
 Informa('Arquivo Gerado e Salvo em: '+localarq);
end;

end.
