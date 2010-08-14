unit UConfigECF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, XPMenu, ComCtrls;

type
  TFConfigECF = class(TForm)
    Bevel1: TBevel;
    BtFechar: TBitBtn;
    MainMenu1: TMainMenu;
    Programaes1: TMenuItem;
    InformaeseStatus1: TMenuItem;
    Arredondamento1: TMenuItem;
    runcamento1: TMenuItem;
    HorriodeVero1: TMenuItem;
    Alquotas1: TMenuItem;
    FormadePagamento1: TMenuItem;
    AlquotasCadastradas1: TMenuItem;
    FormasdePagamentos1: TMenuItem;
    XPMenu1: TXPMenu;
    GroupBox1: TGroupBox;
    MStatus: TMemo;
    SB: TStatusBar;
    EstadodaImpressora1: TMenuItem;
    SubTotal1: TMenuItem;
    CuponsCancelados1: TMenuItem;
    MapaResumo1: TMenuItem;
    Cancelamentos1: TMenuItem;
    Descontos1: TMenuItem;
    VersoFirmware1: TMenuItem;
    NumeroCupomFiscal1: TMenuItem;
    GTGrandeTotal1: TMenuItem;
    ContadordeComprovantesdeCrdito1: TMenuItem;
    VendaBrutaDiria1: TMenuItem;
    NmerodeRedues1: TMenuItem;
    DataeHoraImpressora1: TMenuItem;
    DatadaUltimaReduo1: TMenuItem;
    DatadoMovimento1: TMenuItem;
    MarcamodeloeTipodaImpressora1: TMenuItem;
    VersodaDLL1: TMenuItem;
    ClicheProprietrio1: TMenuItem;
    CGCIe1: TMenuItem;
    BtnImprimir: TSpeedButton;
    PImprimindo: TPanel;
    procedure BtFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Arredondamento1Click(Sender: TObject);
    procedure HorriodeVero1Click(Sender: TObject);
    procedure runcamento1Click(Sender: TObject);
    procedure Alquotas1Click(Sender: TObject);
    procedure FormadePagamento1Click(Sender: TObject);
    procedure AlquotasCadastradas1Click(Sender: TObject);
    procedure FormasdePagamentos1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EstadodaImpressora1Click(Sender: TObject);
    procedure SubTotal1Click(Sender: TObject);
    procedure GTGrandeTotal1Click(Sender: TObject);
    procedure VendaBrutaDiria1Click(Sender: TObject);
    procedure Descontos1Click(Sender: TObject);
    procedure Cancelamentos1Click(Sender: TObject);
    procedure CuponsCancelados1Click(Sender: TObject);
    procedure MapaResumo1Click(Sender: TObject);
    procedure VersoFirmware1Click(Sender: TObject);
    procedure VersodaDLL1Click(Sender: TObject);
    procedure NumeroCupomFiscal1Click(Sender: TObject);
    procedure ContadordeComprovantesdeCrdito1Click(Sender: TObject);
    procedure NmerodeRedues1Click(Sender: TObject);
    procedure DataeHoraImpressora1Click(Sender: TObject);
    procedure DatadaUltimaReduo1Click(Sender: TObject);
    procedure DatadoMovimento1Click(Sender: TObject);
    procedure MarcamodeloeTipodaImpressora1Click(Sender: TObject);
    procedure ClicheProprietrio1Click(Sender: TObject);
    procedure CGCIe1Click(Sender: TObject);
    procedure MStatusChange(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConfigECF: TFConfigECF;

implementation

uses UBarsa, UPAF_ECF, UProgramaAliquota, UProgramaFormaPgto,
     lite_frmprincipal, checkout, UMenuFiscal;

{$R *.dfm}

procedure TFConfigECF.BtFecharClick(Sender: TObject);
begin
Close;
end;

procedure TFConfigECF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_Escape
     then close;
end;

procedure TFConfigECF.Arredondamento1Click(Sender: TObject);
var
   int_confirma: integer;
begin
  int_Confirma:= Application.MessageBox ('Confirma o ajuste no arredondamento do ECF?' , 'PDV',mb_YesNo+mb_DefButton2+mb_IconQuestion);
  if (int_Confirma = 6)
  then begin
       AC;
       if s_ImpFiscal = 'ECF Daruma'
       then Retorno_imp_Fiscal := Daruma_FI_CfgCalcArredondamento('1')//Daruma_FI_ProgramaArredondamento()
       else if s_ImpFiscal = 'ECF Bematech'
       then Retorno_imp_Fiscal := bematech_FI_ProgramaArredondamento()
       else if s_ImpFiscal = 'ECF Elgin'
       then Retorno_imp_Fiscal := Elgin_ProgramaArredondamento()
       else if s_ImpFiscal = 'ECF Sweda'
       then Retorno_imp_Fiscal := ECF_ProgramaArredondamento();

       if Retorno_imp_Fiscal = 1
       then begin
            Informa('Arredondamento Programado com Sucesso. Este comando será executado '+
                    'após a redução Z');
            end
       else Informa('Não foi possivél programar o Arredondamento no ECF!');

       Analisa_iRetorno();
       Retorno_Impressora();
       DC;
       end;
end;

procedure TFConfigECF.HorriodeVero1Click(Sender: TObject);
var
   int_confirma: integer;
begin
     int_Confirma:= Application.MessageBox ('Confirma programação/Desprogramação do Horário de Verão?' , 'PDV',mb_YesNo+mb_DefButton2+mb_IconQuestion);
     if (int_Confirma = 6)
     then begin
          AC;
          if s_ImpFiscal = 'ECF Daruma'
          then Retorno_imp_Fiscal := Daruma_FI_ProgramaHorarioVerao()
          else if s_ImpFiscal = 'ECF Bematech'
          then Retorno_imp_Fiscal := bematech_FI_ProgramaHorarioVerao()
          else if s_ImpFiscal = 'ECF Elgin'
          then Retorno_imp_Fiscal := Elgin_ProgramaHorarioVerao()
          else if s_ImpFiscal = 'ECF Sweda'
          then Retorno_imp_Fiscal := ECF_ProgramaHorarioVerao();

          if Retorno_imp_Fiscal = 1
          then begin
               Informa('A Programação do horário de verão será realizada somente '+
                       'após uma redução Z');
               end
          else Informa('Não foi possivél programar o Horário de Verão no ECF!');     

          Analisa_iRetorno();
          Retorno_Impressora();
          DC;
          end;
end;

procedure TFConfigECF.runcamento1Click(Sender: TObject);
var
   int_confirma: integer;
begin
     int_Confirma:= Application.MessageBox ('Muda Impressora para Truncamento?' , 'PDV',mb_YesNo+mb_DefButton2+mb_IconQuestion);
     if (int_Confirma = 6)
     then begin
          AC;
          if s_ImpFiscal = 'ECF Daruma'
          then Retorno_imp_Fiscal := Daruma_FI_ProgramaTruncamento()
          else if s_ImpFiscal = 'ECF Bematech'
          then Retorno_imp_Fiscal := Bematech_FI_ProgramaTruncamento()
          else if s_ImpFiscal = 'ECF Elgin'
          then Retorno_imp_Fiscal := Elgin_ProgramaTruncamento()
          else if s_ImpFiscal = 'ECF Sweda'
          then Retorno_imp_Fiscal := ECF_ProgramaTruncamento();

          if Retorno_imp_Fiscal = 1
          then begin
               Informa('Truncamento Programado com Sucesso. Este comando será executado '+
                       'após a redução Z');
               end
          else Informa('Não foi possivél programar o Truncamento no ECF!');     

          Analisa_iRetorno();
          Retorno_Impressora();
          DC;
          end;
end;

procedure TFConfigECF.Alquotas1Click(Sender: TObject);
begin
     Try
        if FProgramaAliquota=Nil
        then Application.CreateForm(TFProgramaAliquota,FProgramaAliquota);
        FProgramaAliquota.ShowModal;
     Finally
        FProgramaAliquota.Release;
        FProgramaAliquota:=Nil;
        end;
end;

procedure TFConfigECF.FormadePagamento1Click(Sender: TObject);
begin
     Try
        if FProgramaFormaPgto=Nil
        then Application.CreateForm(TFProgramaFormaPgto,FProgramaFormaPgto);
        FProgramaFormaPgto.ShowModal;
     Finally
        FProgramaFormaPgto.Release;
        FProgramaFormaPgto:=Nil;
        end;
end;

procedure TFConfigECF.AlquotasCadastradas1Click(Sender: TObject);
var
   str_aliq: String;
begin
     AC;
     Setlength(str_aliq,79);

     if s_ImpFiscal = 'ECF Daruma'
     then Retorno_imp_Fiscal := Daruma_FI_RetornoAliquotas(Str_aliq)
     else if s_ImpFiscal = 'ECF Bematech'
     then Retorno_imp_Fiscal := Bematech_FI_RetornoAliquotas(Str_aliq)
     else if s_ImpFiscal = 'ECF Elgin'
     then Retorno_imp_Fiscal := Elgin_RetornoAliquotas(Str_aliq)
     else if s_ImpFiscal = 'ECF Sweda'
     then Retorno_imp_Fiscal := ECF_RetornoAliquotas(Pchar(Str_aliq));

     Analisa_iRetorno();
     Retorno_Impressora();

     MStatus.Lines.Text:=str_aliq;
     DC;
end;

procedure TFConfigECF.FormasdePagamentos1Click(Sender: TObject);
var
   iConta : Integer;
   Str_FormaPgto: String;
begin
     AC;
     Setlength(Str_FormaPgto,1027);

     if s_ImpFiscal = 'ECF Daruma'
     then Retorno_imp_Fiscal := Daruma_FI_VerificaFormasPagamentoEx(Str_FormaPgto)
     else if s_ImpFiscal = 'ECF Bematech'
     then begin
           for iConta := 1 to 3016 do Str_FormaPgto := Str_FormaPgto + ' ';
           Retorno_imp_Fiscal := Bematech_FI_VerificaFormasPagamento( Str_FormaPgto );
           end
     else if s_ImpFiscal = 'ECF Elgin'
     then begin
          for iConta := 1 to 3016 do Str_FormaPgto := Str_FormaPgto + ' ';
          Retorno_imp_Fiscal := Elgin_VerificaFormasPagamento( Str_FormaPgto );
          end
     else if s_ImpFiscal = 'ECF Sweda'
     then Retorno_imp_Fiscal := ECF_VerificaDescricaoFormasPagamento(Pchar(Str_FormaPgto));

     Analisa_iRetorno();
     Retorno_Impressora();

     MStatus.Lines.Text:=Str_FormaPgto;
     DC;
end;

procedure TFConfigECF.FormShow(Sender: TObject);
begin
     if not vSuporte
     then Programaes1.Visible:=False;

     SB.Panels[0].Text:='ECF Local: '+s_ImpFiscal;
end;

procedure TFConfigECF.EstadodaImpressora1Click(Sender: TObject);
var
   ACK: Integer;
   ST1: Integer;
   ST2: Integer;
begin
     ACK := 0; ST1 := 0; ST2 := 0;

     if s_ImpFiscal = 'ECF Daruma'
     then Retorno_imp_Fiscal := Daruma_FI_VerificaEstadoImpressora( ACK, ST1, ST2 )
     else if s_ImpFiscal = 'ECF Bematech'
     then Retorno_imp_Fiscal := Bematech_FI_VerificaEstadoImpressora( Ack, St1, St2 )
     else if s_ImpFiscal = 'ECF Elgin'
     then Retorno_imp_Fiscal := Elgin_VerificaEstadoImpressora( Ack, St1, St2 )
     else if s_ImpFiscal = 'ECF Sweda'
     then Retorno_imp_Fiscal := ECF_VerificaEstadoImpressora( Ack, St1, St2 ); 

     Analisa_iRetorno();
     Retorno_Impressora();

     MStatus.Lines.Text := (' ACK=' + IntToStr(ACK) + ' ST1=' + IntToStr(ST1) + ' ST2=' + InttoStr(ST2));
end;

procedure TFConfigECF.SubTotal1Click(Sender: TObject);
var
   iConta : Integer;
   SubTotal : String;
begin
     SetLength(SubTotal,14);
     if s_ImpFiscal = 'ECF Daruma'
     then Retorno_imp_Fiscal := Daruma_FI_Subtotal(SubTotal)
     else if s_ImpFiscal = 'ECF Bematech'
     then begin
          for iConta := 1 to 14 do SubTotal := SubTotal + ' ';
          Retorno_imp_Fiscal := Bematech_FI_SubTotal( SubTotal );
          end
     else if s_ImpFiscal = 'ECF Elgin'
     then begin
          for iConta := 1 to 14 do SubTotal := SubTotal + ' ';
          Retorno_imp_Fiscal := Elgin_SubTotal( SubTotal );
          end
     else if s_ImpFiscal = 'ECF Sweda'
     then begin
          for iConta := 1 to 14 do SubTotal := SubTotal + ' ';
          Retorno_imp_Fiscal := ECF_SubTotal( Pchar( SubTotal) );
          end;

     Analisa_iRetorno();
     Retorno_Impressora();

     MStatus.Lines.Text := 'R$: SubTotal do dia: '+CasaDecimal((StrToFloat(SubTotal)*0.01),14);
end;

procedure TFConfigECF.GTGrandeTotal1Click(Sender: TObject);
begin
     Retorna_GrandeTotal;

     MStatus.Lines.Text := 'R$: Grande Total: '+CasaDecimal((StrToFloat(GrandeTotal)*0.01),18);

end;

procedure TFConfigECF.VendaBrutaDiria1Click(Sender: TObject);
begin
     Retorna_VendaBrutaDiaria;
     MStatus.Lines.Text := 'R$: Venda Bruta Diária: '+CasaDecimal((StrToFloat(VendaBruta)*0.01),18);
end;

procedure TFConfigECF.Descontos1Click(Sender: TObject);
var
   iConta : Integer;
   Desconto : String;
begin
     SetLength(Desconto,14);
     if s_ImpFiscal = 'ECF Daruma'
     then Retorno_imp_Fiscal := Daruma_FI_Descontos(Desconto)
     else if s_ImpFiscal = 'ECF Bematech'
     then begin
          for iConta := 1 to 14 do Desconto := Desconto + ' ';
          Retorno_imp_Fiscal := Bematech_FI_Descontos( Desconto );
          end
     else if s_ImpFiscal = 'ECF Elgin'
     then begin
          for iConta := 1 to 14 do Desconto := Desconto + ' ';
          Retorno_imp_Fiscal := Elgin_Descontos( Desconto );
          end
     else if s_ImpFiscal = 'ECF Sweda'
     then begin
          for iConta := 1 to 14 do Desconto := Desconto + ' ';
          Retorno_imp_Fiscal := ECF_Descontos( Pchar( Desconto ) );
          end;

     Analisa_iRetorno();
     Retorno_Impressora();

     MStatus.Lines.Text := 'R$: Descontos: '+CasaDecimal((StrToFloat(Desconto)*0.01),14);
end;

procedure TFConfigECF.Cancelamentos1Click(Sender: TObject);
var
   iConta : Integer;
   Cancelamentos : String;
begin
     SetLength(Cancelamentos,14);
     if s_ImpFiscal = 'ECF Daruma'
     then Retorno_imp_Fiscal := Daruma_FI_Cancelamentos(Cancelamentos)
     else if s_ImpFiscal = 'ECF Bematech'
     then begin
          for iConta := 1 to 14 do Cancelamentos := Cancelamentos + ' ';
          Retorno_imp_Fiscal := Bematech_FI_Cancelamentos( Cancelamentos );
          end
     else if s_ImpFiscal = 'ECF Elgin'
     then begin
          for iConta := 1 to 14 do Cancelamentos := Cancelamentos + ' ';
          Retorno_imp_Fiscal := Elgin_Cancelamentos( Cancelamentos );
          end
     else if s_ImpFiscal = 'ECF Sweda'
     then begin
          for iConta := 1 to 14 do Cancelamentos := Cancelamentos + ' ';
          Retorno_imp_Fiscal := ECF_Cancelamentos( Pchar( Cancelamentos ) );
          end;

     Analisa_iRetorno();
     Retorno_Impressora();

     MStatus.Lines.Text := 'R$: Cancelamentos: '+CasaDecimal((StrToFloat(Cancelamentos)*0.01),14);
end;

procedure TFConfigECF.CuponsCancelados1Click(Sender: TObject);
var
   iConta : Integer;
   Cupons : String;
begin
     SetLength(Cupons,4);
     if s_ImpFiscal = 'ECF Daruma'
     then Retorno_imp_Fiscal := Daruma_FI_NumeroCuponsCancelados(Cupons)
     else if s_ImpFiscal = 'ECF Bematech'
     then begin
          for iConta := 1 to 4 do Cupons := Cupons + ' ';
          Retorno_imp_Fiscal := Bematech_FI_NumeroCuponsCancelados( Cupons );
          end
     else if s_ImpFiscal = 'ECF Elgin'
     then begin
          for iConta := 1 to 4 do Cupons := Cupons + ' ';
          Retorno_imp_Fiscal := Elgin_NumeroCuponsCancelados( Cupons );
          end
     else if s_ImpFiscal = 'ECF Sweda'
     then begin
          for iConta := 1 to 4 do Cupons := Cupons + ' ';
          Retorno_imp_Fiscal := ECF_NumeroCuponsCancelados( Pchar( Cupons ) );
          end;

     Analisa_iRetorno();
     Retorno_Impressora();

     MStatus.Lines.Text := 'Numero de Cupons Cancelados: '+Cupons;
end;

procedure TFConfigECF.MapaResumo1Click(Sender: TObject);
begin
     if FileExists('C:\Retorno.txt')
     then DeleteFile('C:\Retorno.txt');

     if s_ImpFiscal = 'ECF Daruma'
     then Retorno_imp_Fiscal := Daruma_FI_MapaResumo()  
     else if s_ImpFiscal = 'ECF Bematech'
     then Retorno_imp_Fiscal := Bematech_FI_MapaResumoMFD()
     else if s_ImpFiscal = 'ECF Elgin'
     then Retorno_imp_Fiscal := Elgin_MapaResumoMFD()
     else if s_ImpFiscal = 'ECF Sweda'
     then Retorno_imp_Fiscal := ECF_MapaResumoMFD();


     if Retorno_imp_Fiscal = 1
     then begin
          //WinExec('c:\windows\NOTEPAD.EXE C:\retorno.txt',SW_SHOWNORMAL);
          MStatus.Lines.LoadFromFile('C:\Retorno.txt');
          end
     else Informa('Não foi possivél gerar o Mapa Resumo!');     

     Analisa_iRetorno();
     Retorno_Impressora();
end;

procedure TFConfigECF.VersoFirmware1Click(Sender: TObject);
var
   iConta : Integer;
   VersaoFirmware : String;
begin
     SetLength(VersaoFirmware,4);
     if s_ImpFiscal = 'ECF Daruma'
     then Retorno_imp_Fiscal := Daruma_FI_VersaoFirmware(VersaoFirmware)
     else if s_ImpFiscal = 'ECF Bematech'
     then begin
          for iConta := 1 to 4 do VersaoFirmware := VersaoFirmware + ' ';
          Retorno_imp_Fiscal := Bematech_FI_VersaoFirmware( VersaoFirmware );
          end
     else if s_ImpFiscal = 'ECF Elgin'
     then begin
          for iConta := 1 to 4 do VersaoFirmware := VersaoFirmware + ' ';
          Retorno_imp_Fiscal := Elgin_VersaoFirmware( VersaoFirmware );
          end
     else if s_ImpFiscal = 'ECF Sweda'
     then begin
          for iConta := 1 to 4 do VersaoFirmware := VersaoFirmware + ' ';
          Retorno_imp_Fiscal := ECF_VersaoFirmware( Pchar(VersaoFirmware) );
          end;

     Analisa_iRetorno();
     Retorno_Impressora();

     MStatus.Lines.Text := 'Versão do Firmware: '+VersaoFirmware;

end;

procedure TFConfigECF.VersodaDLL1Click(Sender: TObject);
var
   iConta : Integer;
   cVersao : String;
begin
     SetLength(cVersao,10);
     if s_ImpFiscal = 'ECF Daruma'
     then Retorno_imp_Fiscal := Daruma_FI_RetornarVersaoDLL(cVersao)
     else if s_ImpFiscal = 'ECF Bematech'
     then begin
          for iConta := 1 to 9 do cVersao := cVersao + ' ';
          Retorno_imp_Fiscal := Bematech_FI_VersaoDll( cVersao );
          end
     else if s_ImpFiscal = 'ECF Elgin'
     then begin
          for iConta := 1 to 9 do cVersao := cVersao + ' ';
          Retorno_imp_Fiscal := Elgin_VersaoFirmware( cVersao );
          end
     else if s_ImpFiscal = 'ECF Sweda'
     then begin
          for iConta := 1 to 9 do cVersao := cVersao + ' ';
          Retorno_imp_Fiscal := ECF_VersaoDll( Pchar(cVersao) );
          end;

     Analisa_iRetorno();
     Retorno_Impressora();

     MStatus.Lines.Text := 'Versão da DLL: '+cVersao;

end;

procedure TFConfigECF.NumeroCupomFiscal1Click(Sender: TObject);
var
   iConta : Integer;
   NumeroCupom : String;
begin
     SetLength(NumeroCupom,6);
     if s_ImpFiscal = 'ECF Daruma'
     then Retorno_imp_Fiscal := Daruma_FI_NumeroCupom(NumeroCupom)
     else if s_ImpFiscal = 'ECF Bematech'
     then begin
          for iConta := 1 to 6 do NumeroCupom := NumeroCupom + ' ';
          Retorno_imp_Fiscal := Bematech_FI_NumeroCupom( NumeroCupom );
          end
     else if s_ImpFiscal = 'ECF Elgin'
     then begin
          for iConta := 1 to 6 do NumeroCupom := NumeroCupom + ' ';
          Retorno_imp_Fiscal := Elgin_NumeroCupom( NumeroCupom );
          end
     else if s_ImpFiscal = 'ECF Sweda'
     then begin
          for iConta := 1 to 6 do NumeroCupom := NumeroCupom + ' ';
          Retorno_imp_Fiscal := ECF_NumeroCupom( Pchar(NumeroCupom) );
          end;

     Analisa_iRetorno();
     Retorno_Impressora();

     MStatus.Lines.Text := 'Número do Cupom Fiscal: '+NumeroCupom;
end;

procedure TFConfigECF.ContadordeComprovantesdeCrdito1Click(
  Sender: TObject);
var
   iConta : Integer;
   Operacoes : String;
begin
     SetLength(Operacoes,6);
     if s_ImpFiscal = 'ECF Daruma'
     then Retorno_imp_Fiscal := Daruma_FI_NumeroOperacoesNaoFiscais(Operacoes)
     else if s_ImpFiscal = 'ECF Bematech'
     then begin
          for iConta := 1 to 6 do Operacoes := Operacoes + ' ';
          Retorno_imp_Fiscal := Bematech_FI_NumeroOperacoesNaoFiscais( Operacoes );
          end
     else if s_ImpFiscal = 'ECF Elgin'
     then begin
          for iConta := 1 to 6 do Operacoes := Operacoes + ' ';
          Retorno_imp_Fiscal := Elgin_NumeroOperacoesNaoFiscais( Operacoes );
          end
     else if s_ImpFiscal = 'ECF Sweda'
     then begin
          for iConta := 1 to 6 do Operacoes := Operacoes + ' ';
          Retorno_imp_Fiscal := ECF_NumeroOperacoesNaoFiscais( Pchar(Operacoes) );
          end;

     Analisa_iRetorno();
     Retorno_Impressora();

     MStatus.Lines.Text := 'Número de operações não fiscais: '+Operacoes;
end;

procedure TFConfigECF.NmerodeRedues1Click(Sender: TObject);
var
   iConta : Integer;
   Reducoes : String;
begin
     SetLength(Reducoes,4);
     if s_ImpFiscal = 'ECF Daruma'
     then Retorno_imp_Fiscal := Daruma_FI_NumeroReducoes(Reducoes)
     else if s_ImpFiscal = 'ECF Bematech'
     then begin
          for iConta := 1 to 4 do Reducoes := Reducoes + ' ';
          Retorno_imp_Fiscal := Bematech_FI_NumeroReducoes( Reducoes );
          end
     else if s_ImpFiscal = 'ECF Elgin'
     then begin
          for iConta := 1 to 4 do Reducoes := Reducoes + ' ';
          Retorno_imp_Fiscal := Elgin_NumeroReducoes( Reducoes );
          end
     else if s_ImpFiscal = 'ECF Sweda'
     then begin
          for iConta := 1 to 4 do Reducoes := Reducoes + ' ';
          Retorno_imp_Fiscal := ECF_NumeroReducoes( Pchar(Reducoes) );
          end;

     Analisa_iRetorno();
     Retorno_Impressora();

     MStatus.Lines.Text := 'Número de Reduções: '+Reducoes;
end;

procedure TFConfigECF.DataeHoraImpressora1Click(Sender: TObject);
begin
     VerificaDataHoraImpressora;
     MStatus.Lines.Text := 'Data e Hora da Impressora: '+DateToStr(nData_Impressora)+' - '+TimeToStr(nHora_Impressora);
end;

procedure TFConfigECF.DatadaUltimaReduo1Click(Sender: TObject);
var
   iConta : Integer;
   sData, sHora, nDia, nMes, nAno, nHora, nMin, nSeg : String;
   nData_Reducao : TDate;
   nHora_Reducao : TDateTime;
begin
     for iConta := 1 to 6 do sData := sData + ' ';
     for iConta := 1 to 6 do  sHora := sHora + ' ';

     if s_ImpFiscal = 'ECF Daruma'
     then Retorno_imp_Fiscal := Daruma_FI_DataHoraReducao( sData, sHora )
     else if s_ImpFiscal = 'ECF Bematech'
     then Retorno_imp_Fiscal := Bematech_FI_DataHoraReducao( sData, sHora )
     else if s_ImpFiscal = 'ECF Elgin'
     then Retorno_imp_Fiscal := Elgin_DataHoraReducao( sData, sHora )
     else if s_ImpFiscal = 'ECF Sweda'
     then Retorno_imp_Fiscal := ECF_DataHoraReducao( Pchar(sData), Pchar(sHora) ); 

     if Retorno_imp_Fiscal = 1
     then begin
          nDia:=Copy(sData,1,2);
          nMes:=Copy(sData,3,2);
          nAno:=Pchar(Copy(sData,5,4));
          nData_Reducao:=StrToDate(nDia+'/'+nMes+'/'+nAno);

          nHora:=Copy(sHora,1,2);
          nMin:=Copy(sHora,3,2);
          nSeg:=Copy(sHora,5,2);
          nHora_Reducao:=StrToTime(nHora+':'+nMin+':'+nSeg);
          end
     else Informa('Não foi possivél Identificar a data e hora da Ultima Redução');

     Analisa_iRetorno();
     Retorno_Impressora();

     MStatus.Lines.Text := 'Data e Hora da Ultima Redução: '+DateToStr(nData_Reducao)+' - '+TimeToStr(nHora_Reducao);
end;

procedure TFConfigECF.DatadoMovimento1Click(Sender: TObject);
var
   iConta : Integer;
   nDia, nMes, nAno : String;
   sData_Mov : String;
   nData_Movimento : TDate;
begin
     for iConta := 1 to 6 do sData_Mov := sData_Mov + ' ';

     if s_ImpFiscal = 'ECF Daruma'
     then Retorno_imp_Fiscal := Daruma_FI_DataMovimento( sData_Mov )
     else if s_ImpFiscal = 'ECF Bematech'
     then Retorno_imp_Fiscal := Bematech_FI_DataMovimento( sData_Mov )
     else if s_ImpFiscal = 'ECF Elgin'
     then Retorno_imp_Fiscal := Elgin_DataMovimento( sData_Mov )
     else if s_ImpFiscal = 'ECF Sweda'
     then Retorno_imp_Fiscal := ECF_DataMovimento( PChar(sData_Mov) );

     if Retorno_imp_Fiscal = 1
     then begin
          nDia:=Copy(sData_Mov,1,2);
          nMes:=Copy(sData_Mov,3,2);
          nAno:=Pchar(Copy(sData_Mov,5,4));
          nData_Movimento:=StrToDate(nDia+'/'+nMes+'/'+nAno);
          end
     else Informa('Não foi possivél Identificar a data do Movimento!');

     Analisa_iRetorno();
     Retorno_Impressora();

     MStatus.Lines.Text := 'Data do Movimento: '+DateToStr(nData_Movimento);

end;

procedure TFConfigECF.MarcamodeloeTipodaImpressora1Click(Sender: TObject);
begin
     Retorna_Informacao_Impressora;

     if retorno_imp_fiscal = 1
     then begin
          MStatus.Lines.Clear;
          MStatus.Lines.Add('Numero de Série: '+sNum_serie_ecf);
          MStatus.Lines.Add('Numero do Caixa: '+sNum_Caixa);
          MStatus.Lines.Add('Marca..........: '+sMarca_ECF);
          MStatus.Lines.Add('Modelo.........: '+sModelo_ECF);
          MStatus.Lines.Add('Tipo...........: '+sTipo_ECF);
          end
     else begin
          Informa('Não foi Possivél pegar o retorno da impressora!');

          Analisa_iRetorno();
          Retorno_Impressora();
          end;
end;

procedure TFConfigECF.ClicheProprietrio1Click(Sender: TObject);
var
   iConta : Integer;
   ClicheProprietario : String;
begin
     for iConta := 1 to 186 do ClicheProprietario := ClicheProprietario + ' ';

     if s_ImpFiscal = 'ECF Daruma'
     then begin
          SetLength(ClicheProprietario,400);
          Retorno_imp_Fiscal := Daruma_FI_ClicheProprietarioEx(ClicheProprietario)
          end
     else if s_ImpFiscal = 'ECF Bematech'
     then Retorno_imp_Fiscal := Bematech_FI_ClicheProprietario( ClicheProprietario )
     else if s_ImpFiscal = 'ECF Elgin'
     then Retorno_imp_Fiscal := Elgin_ClicheProprietario( ClicheProprietario )
     else if s_ImpFiscal = 'ECF Sweda'
     then begin
          SetLength(ClicheProprietario,400);
          Retorno_imp_Fiscal := ECF_ClicheProprietarioEx( Pchar(ClicheProprietario) );
          end;

     Analisa_iRetorno();
     Retorno_Impressora();

     MStatus.Lines.clear;
     MStatus.Lines.Add('Clichê do Proprietário');
     MStatus.Lines.Add(ClicheProprietario);
end;

procedure TFConfigECF.CGCIe1Click(Sender: TObject);
var
   iConta : Integer;
   CGC, IE : String;
begin
     for iConta := 1 to 18 do CGC := CGC + ' ';
     for iConta := 1 to 18 do IE  := IE  + ' ';

     if s_ImpFiscal = 'ECF Daruma'
     then Retorno_imp_Fiscal := Daruma_FI_CGC_IE(CGC, IE)  
     else if s_ImpFiscal = 'ECF Bematech'
     then Retorno_imp_Fiscal := Bematech_FI_CGC_IE( CGC, IE )
     else if s_ImpFiscal = 'ECF Elgin'
     then Retorno_imp_Fiscal := Elgin_CGC_IE( CGC, IE )
     else if s_ImpFiscal = 'ECF Sweda'
     then Retorno_imp_Fiscal := ECF_CGC_IE( Pchar(CGC), Pchar(IE) );

     Analisa_iRetorno();
     Retorno_Impressora();

     MStatus.Lines.clear;
     MStatus.Lines.Add('C.N.P.J: '+CGC);
     MStatus.Lines.Add('I.E....: '+IE);

end;

procedure TFConfigECF.MStatusChange(Sender: TObject);
begin
     if AllTrim(MStatus.Lines.Text)<>''
     then BtnImprimir.Enabled:=True
     else BtnImprimir.Enabled:=False;
end;

procedure TFConfigECF.BtnImprimirClick(Sender: TObject);
var
 i:integer;
begin
 PImprimindo.Visible:=True;
 PImprimindo.Repaint;
 
 AbreRelGerencial;
 ImprimiRelGerencial('       RETORNOS DA IMPRESSORA');
 for i := 0 to MStatus.Lines.Count - 1 do
  begin
   ImprimiRelGerencial(MStatus.Lines.Strings[i]+chr(10)+chr(13));
  end;
 FechaRelGerencial;

 PImprimindo.Visible:=False;
 PImprimindo.Repaint;
end;

end.
