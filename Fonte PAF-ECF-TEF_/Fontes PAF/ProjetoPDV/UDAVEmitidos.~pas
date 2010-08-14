unit UDAVEmitidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TFDAVEmitidos = class(TForm)
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
    procedure GerarArquivoDAVEmitidos;
    procedure ConsultaDAVPeriodo(xDataI, xDataF : TDate);
  public
    { Public declarations }
  end;

var
  FDAVEmitidos: TFDAVEmitidos;

implementation

uses UMenuFiscal, dmsyndAC, UBarsa, UAssinaDigital, checkout;

{$R *.dfm}

procedure TFDAVEmitidos.ConsultaDAVPeriodo(xDataI, xDataF : TDate);
begin
     Identificacao_Estabelecimento_Usuario_PAF;
     With DM
     do begin
        TDAVEmitidos.Close;
        TDAVEmitidos.Params[0].AsDate:=xDataI;
        TDAVEmitidos.Params[1].AsDate:=xDataF;
        TDAVEmitidos.Params[2].AsString:=sNum_Serie_ECF;
        TDAVEmitidos.IndexFieldNames:='DATA';
        TDAVEmitidos.Open;
        end;
end;

procedure TFDAVEmitidos.GerarArquivoDAVEmitidos;
var
   nNumRegistros : Integer;
   Data_DAV, nTotal_DAV : ShortString;
begin
     AssignFile(f,localarq);
     Rewrite(f); //abre o arquivo para escrita

     //Registro Tipo D1 - Identificação do Estabelecimento usuário do PAF-ECF
     Writeln(f,'D1'+
               sCNPJ+
               sInsc_Est+
               sInsc_Muni+
               sRazao_Social);

     //Registro Tipo D2 - Relação dos DAV Emitidos
     nNumRegistros:=0;
     With DM
     do begin
        TDAVEmitidos.First;
        While not TDAVEmitidos.Eof
        do begin
           Inc(nNumRegistros);

           Data_DAV:=FormatDateTime( 'yyyy/mm/dd', TDAVEmitidosDATA.AsDateTime );
           Data_DAV:=RemoveCaractesresEspeciais(Data_DAV);

           nTotal_DAV:=formatcurr('0.00',TDAVEmitidosTOTAL.AsFloat);
           FormatoNum(nTotal_DAV,8);

           Writeln(f,'D2'+
                     sCNPJ+
                     Espaco(TDAVEmitidosNUM_FABRICACAO_ECF.AsString,20)+
                     Espaco(TDAVEmitidosMF_ADICIONAL.Value,1)+
                     Espaco(TDAVEmitidosTIPO_ECF.AsString,7)+
                     Espaco(TDAVEmitidosMARCA_ECF.AsString,20)+
                     Espaco(TDAVEmitidosMODELO_ECF.AsString,20)+
                     StrZero(TDAVEmitidosNUMERO_CUPOM.AsInteger,6)+
                     StrZero(TDAVEmitidosCOD_DAV.AsInteger,13)+
                     Data_DAV+
                     Espaco('PEDIDO',30)+
                     nTotal_DAV+
                     StrZero(TDAVEmitidosNUM_CCF_CUPOM.AsInteger,6));

           TDAVEmitidos.Next;
           end;
        end;

     //Registro Tipo D9 - Totalização do Arquivo
     Writeln(f,'D9'+
               sCNPJ+
               sInsc_Est+
               StrZero(nNumRegistros,6));
     Closefile(f); //fecha o handle de arquivo

     //Registro Tipo EAD - Assinatura Digital
     GerarEADArquivo(localarq);
end;

procedure TFDAVEmitidos.FormActivate(Sender: TObject);
begin
     ConsultaDAVPeriodo(FMenuFiscal.EDataI.Date,FMenuFiscal.EDataF.Date);
     if DM.TDAVEmitidos.RecordCount > 0
     then begin
           rce.Lines.Add('DAV Emitidos no Período: '+DateToStr(FMenuFiscal.EDataI.Date)+' a '+DateToStr(FMenuFiscal.EDataF.Date));
           rce.Lines.Add('------------------------------------------------');
           rce.Lines.Add('Nº do DAV  Dt.Emissão Título do DAV  Vlr. Total');
           With DM
           do begin
              TDAVEmitidos.First;
              While not TDAVEmitidos.Eof
              do begin
                 rce.Lines.Add(StrZero(TDAVEmitidosCOD_DAV.AsInteger,10)+Space(1)+
                               DateToStr(TDAVEmitidosDATA.AsDateTime)+Space(1)+
                               Center('PEDIDO',12)+Space(1)+
                               CasaDecimal(TDAVEmitidosTOTAL.AsCurrency,12));
                 TDAVEmitidos.Next;
                 end;
              end;
           rce.Lines.Add('------------------------------------------------');
        end
    else Informa('Não há movimento de DAV neste Período!');       
end;

procedure TFDAVEmitidos.BtnCancelarClick(Sender: TObject);
begin
     Close;
end;

procedure TFDAVEmitidos.BtnImprimirClick(Sender: TObject);
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

procedure TFDAVEmitidos.btnSalvarClick(Sender: TObject);
begin
    dtarq    := RetornaDataString(DateToStr(Now));
    localarq := 'C:\Apgef\PAF\'+'DAVEmitidos'+dtarq+'.txt';
    GerarArquivoDAVEmitidos;
    Informa('Arquivo Gerado e Salvo em: '+localarq);
end;

end.
