unit UMenuFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask,  Buttons, CommCtrl,
  rxToolEdit;

type
  TFMenuFiscal = class(TForm)
    Bevel1: TBevel;
    RGFaixaDados: TRadioGroup;
    GCRZ_COO: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    ECOO_CRZI: TEdit;
    ECOO_CRZF: TEdit;
    GPeriodo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EDataI: TDateEdit;
    EDataF: TDateEdit;
    BtLX: TBitBtn;
    BtLMFC: TBitBtn;
    BtLMFS: TBitBtn;
    BtEspelhoMFD: TBitBtn;
    BtArqMFD: TBitBtn;
    BtTabProd: TBitBtn;
    BtEstoque: TBitBtn;
    BtMovtoECF: TBitBtn;
    BtMeiosPagto: TBitBtn;
    BtPAF_ECF: TBitBtn;
    BtFechar: TBitBtn;
    Label7: TLabel;
    RGSaida: TRadioGroup;
    BtTabIndiceTecnico: TBitBtn;
    BtVendasPeriodo: TBitBtn;
    BtDAVEmitidos: TBitBtn;
    Panel1: TPanel;
    EArquivo: TEdit;
    procedure BtFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtDAVEmitidosClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtEstoqueClick(Sender: TObject);
    procedure BtTabProdClick(Sender: TObject);
    procedure BtPAF_ECFClick(Sender: TObject);
    procedure BtMovtoECFClick(Sender: TObject);
    procedure BtMeiosPagtoClick(Sender: TObject);
    procedure BtLXClick(Sender: TObject);
    procedure RGFaixaDadosClick(Sender: TObject);
    procedure BtLMFCClick(Sender: TObject);
    procedure BtLMFSClick(Sender: TObject);
    procedure BtEspelhoMFDClick(Sender: TObject);
    procedure ECOO_CRZIExit(Sender: TObject);
    procedure ECOO_CRZFExit(Sender: TObject);
    procedure BtArqMFDClick(Sender: TObject);
    procedure BtTabIndiceTecnicoClick(Sender: TObject);
    procedure BtVendasPeriodoClick(Sender: TObject);
  private
    { Private declarations }
    sNomeArqLMF : String;
    procedure GeraArqEstoque;
    procedure GeraTabProdutos;
    procedure Leitura_Memoria_Fiscal( sFlag : String);
  public
    { Public declarations }
    procedure CopiaArq(sOldArq, sNewArq : String; iFlag : Integer);
  end;

var
  FMenuFiscal: TFMenuFiscal;
  F: TextFile;
  sCNPJ, sInsc_Est, sInsc_Muni, sRazao_Social, sEndereco : String;//Identificação usuária do PAF
  procedure AbreRelGerencial;
  procedure ImprimiRelGerencial( sTexto : String);
  procedure FechaRelGerencial;
  procedure Identificacao_Estabelecimento_Usuario_PAF;
  procedure GerarArquivoMovimentoECF(xDataI, xDataF : TDate; iFlag : Integer);

implementation

uses UPAF_ECF, UBarsa, dmsyndAC, UAssinaDigital, UIdentificaoPAF,
     UDAVEmitidos, checkout, UMsg, UMeiosPgtos, Math, UnitBemaMFD,
     UVendasPeriodo;

{$R *.dfm}

procedure TFMenuFiscal.CopiaArq(sOldArq, sNewArq : String; iFlag : Integer);
begin
     Sleep(1000);

     CopyDir('C:\'+sOldArq,'C:\Apgef\PAF\');

     Sleep(1000);

     if FileExists('C:\Apgef\PAF\'+sNewArq)
     then DeleteFile('C:\Apgef\PAF\'+sNewArq);

     Sleep(1000);

     if iFlag = 0
     then RenameFile('C:\Apgef\PAF\'+sOldArq,'C:\Apgef\PAF\'+sNewArq);
end;

procedure TFMenuFiscal.Leitura_Memoria_Fiscal( sFlag : String);
var
  S_DataI, S_DataF, S_ReducaoI, S_ReducaoF: String;
begin
      if FileExists('C:\Retorno.txt')
      then DeleteFile('C:\Retorno.txt');

      S_DataI:=DateToStr(EDataI.Date);
      S_DataF:=DateToStr(EDataF.Date);
      S_ReducaoI:=ECOO_CRZI.Text;
      S_ReducaoF:=ECOO_CRZF.Text;

      if s_ImpFiscal = 'ECF Daruma'
      then begin
           retorno_imp_fiscal:=Daruma_Registry_MFD_LeituraMFCompleta(sFlag);
           if RGFaixaDados.ItemIndex=0
           then begin
                if RGSaida.ItemIndex=0
                then retorno_imp_fiscal:=Daruma_FI_LeituraMemoriaFiscalData
                                       (Pchar(S_DataI),Pchar(S_DataF))
                else if RGSaida.ItemIndex=1
                then retorno_imp_fiscal:=Daruma_FI_LeituraMemoriaFiscalSerialData
                                       (Pchar(S_DataI),Pchar(S_DataF))
                end
           else if RGFaixaDados.ItemIndex=1
           then begin
                if RGSaida.ItemIndex=0
                then retorno_imp_fiscal:=Daruma_FI_LeituraMemoriaFiscalReducao
                                       (Pchar(S_ReducaoI),Pchar(S_ReducaoF))
                else if RGSaida.ItemIndex=1
                then retorno_imp_fiscal:=Daruma_FI_LeituraMemoriaFiscalSerialReducao
                                       (Pchar(S_ReducaoI),Pchar(S_ReducaoF))

                end
           else if RGFaixaDados.ItemIndex=2
           then Informa('Este tipo de intervalo não é suportado neste comando!');
           end
      else if s_ImpFiscal = 'ECF Bematech'
      then begin
           if RGFaixaDados.ItemIndex=0
           then begin
                if RGSaida.ItemIndex=0
                then retorno_imp_fiscal:=Bematech_FI_LeituraMemoriaFiscalDataMFD
                                       (Pchar(S_DataI),Pchar(S_DataF),Pchar(sFlag))
                else if RGSaida.ItemIndex=1
                then retorno_imp_fiscal:=Bematech_FI_LeituraMemoriaFiscalSerialDataMFD
                                       (Pchar(S_DataI),Pchar(S_DataF),Pchar(sFlag))
                end
           else if RGFaixaDados.ItemIndex=1
           then begin
                if RGSaida.ItemIndex=0
                then retorno_imp_fiscal:=Bematech_FI_LeituraMemoriaFiscalReducaoMFD
                                       (Pchar(S_ReducaoI),Pchar(S_ReducaoF),Pchar(sFlag))
                else if RGSaida.ItemIndex=1
                then retorno_imp_fiscal:=Bematech_FI_LeituraMemoriaFiscalSerialReducaoMFD
                                       (Pchar(S_ReducaoI),Pchar(S_ReducaoF),Pchar(sFlag))

                end
           else if RGFaixaDados.ItemIndex=2
           then Informa('Este tipo de intervalo não é suportado neste comando!');
           end
      else if s_ImpFiscal = 'ECF Elgin'
      then begin
           if RGFaixaDados.ItemIndex=0
           then begin
                if RGSaida.ItemIndex=0
                then retorno_imp_fiscal:=Elgin_LeituraMemoriaFiscalData
                                       (Pchar(S_DataI),Pchar(S_DataF),Pchar(sFlag))
                else if RGSaida.ItemIndex=1
                then retorno_imp_fiscal:=Elgin_LeituraMemoriaFiscalSerialData
                                       (Pchar(S_DataI),Pchar(S_DataF),Pchar(sFlag))
                end
           else if RGFaixaDados.ItemIndex=1
           then begin
                if RGSaida.ItemIndex=0
                then retorno_imp_fiscal:=Elgin_LeituraMemoriaFiscalReducao
                                       (Pchar(S_ReducaoI),Pchar(S_ReducaoF),Pchar(sFlag))
                else if RGSaida.ItemIndex=1
                then retorno_imp_fiscal:=Elgin_LeituraMemoriaFiscalSerialReducao
                                       (Pchar(S_ReducaoI),Pchar(S_ReducaoF),Pchar(sFlag))

                end
           else if RGFaixaDados.ItemIndex=2
           then Informa('Este tipo de intervalo não é suportado neste comando!');
           end
      else if s_ImpFiscal = 'ECF Sweda'
      then begin
           if RGFaixaDados.ItemIndex=0
           then begin
                if RGSaida.ItemIndex=0
                then retorno_imp_fiscal:=ECF_LeituraMemoriaFiscalDataMFD
                                       (Pchar(S_DataI),Pchar(S_DataF),Pchar(sFlag))
                else if RGSaida.ItemIndex=1
                then retorno_imp_fiscal:=ECF_LeituraMemoriaFiscalSerialDataMFD
                                       (Pchar(S_DataI),Pchar(S_DataF),Pchar(sFlag))
                end
           else if RGFaixaDados.ItemIndex=1
           then begin
                if RGSaida.ItemIndex=0
                then retorno_imp_fiscal:=ECF_LeituraMemoriaFiscalReducaoMFD
                                       (Pchar(S_ReducaoI),Pchar(S_ReducaoF),Pchar(sFlag))
                else if RGSaida.ItemIndex=1
                then retorno_imp_fiscal:=ECF_LeituraMemoriaFiscalSerialReducaoMFD
                                       (Pchar(S_ReducaoI),Pchar(S_ReducaoF),Pchar(sFlag))
                end
           else if RGFaixaDados.ItemIndex=2
           then Informa('Este tipo de intervalo não é suportado neste comando!');
           end;

   if FileExists('C:\Retorno.txt')
   then begin
        CopiaArq('Retorno.txt',sNomeArqLMF,0);

        EArquivo.Text:='C:\Apgef\PAF\'+sNomeArqLMF;

        GerarEADArquivo(EArquivo.Text);
        Informa('Arquivo salvo com sucesso!');
        end;
end;

procedure AbreRelGerencial;
begin
    if s_ImpFiscal = 'ECF Bematech'
    then begin
         //Na bematech não é necessário comando para abertura, ao enviar primeira linha
         //será aberto o gerencial
         end
    else if s_ImpFiscal = 'ECF Daruma'
    then Retorno_imp_Fiscal:=Daruma_FI_AbreRelatorioGerencial()
    else if s_ImpFiscal = 'ECF Elgin'
    then Retorno_imp_Fiscal:=Elgin_AbreRelatorioGerencial()
    else if s_ImpFiscal = 'ECF Sweda'
    then Retorno_imp_Fiscal:=ECF_AbreRelatorioGerencial();
end;

procedure ImprimiRelGerencial( sTexto : String);
begin
    if s_ImpFiscal = 'ECF Bematech'
    then Retorno_imp_Fiscal:=Bematech_FI_UsaComprovanteNaoFiscalVinculadoTEF( pchar( sTexto ) )
    else if s_ImpFiscal = 'ECF Daruma'
    then Retorno_imp_Fiscal:=Daruma_FI_UsaComprovanteNaoFiscalVinculado( pchar( sTexto) )
    else if s_ImpFiscal = 'ECF Elgin'
    then Retorno_imp_Fiscal:=Elgin_UsaComprovanteNaoFiscalVinculado( pchar( sTexto ) )
    else if s_ImpFiscal = 'ECF Sweda'
    then Retorno_imp_Fiscal:=ECF_UsaComprovanteNaoFiscalVinculado( pchar( sTexto ) );
    Application.ProcessMessages;
end;

procedure FechaRelGerencial;
begin
    if s_ImpFiscal = 'ECF Bematech'
    then Retorno_imp_Fiscal:=Bematech_FI_FechaRelatorioGerencial()
    else if s_ImpFiscal = 'ECF Daruma'
    then Retorno_imp_Fiscal:=Daruma_FI_FechaRelatorioGerencial()
    else if s_ImpFiscal = 'ECF Elgin'
    then Retorno_imp_Fiscal:=Elgin_FechaRelatorioGerencial()
    else if s_ImpFiscal = 'ECF Sweda'
    then Retorno_imp_Fiscal:=ECF_FechaRelatorioGerencial();

    if Retorno_imp_Fiscal = 1
    then GravaDadosDocECF('RG');
end;


procedure TFMenuFiscal.BtFecharClick(Sender: TObject);
begin
     if Confirma('Tem certeza que deseja fechar o Menu Fiscal?')=mrYes
     then Close;
end;

procedure TFMenuFiscal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_F10
     then BtFecharClick(Sender);
end;

procedure TFMenuFiscal.FormShow(Sender: TObject);
begin
     Try
       FMSG := TFMSG.Create(nil);
       FMSG.PMensagem.Caption := 'Obtendo informações do ECF. Aguarde!!';
       FMSG.Show;
       FMsg.Repaint;

       Retorna_Informacao_Impressora;//Retorna todas as informações da Impressora
       Pega_NumSerie_Impressora;//Retorna somente o Nº de série;
       Identificacao_Estabelecimento_Usuario_PAF;//Retorna as informaçoes do Estabelecimento usuario
     Finally
       FreeAndNil(FMSG);
       end;

     EDataI.Date:=Date;
     EDataF.Date:=Date;
end;

procedure Identificacao_Estabelecimento_Usuario_PAF;
begin
     DM.TEmpresa.Open;
     DM.TEmpresa.Refresh;
     
     sCNPJ:=Espaco(RemoveCaractesresEspeciais(DM.TEmpresaCNPJ.AsString),14);
     sInsc_Est:=Espaco(RemoveCaractesresEspeciais(DM.TEmpresaINSC_ESTADUAL.AsString),14);
     sInsc_Muni:=Espaco(RemoveCaractesresEspeciais(DM.TEmpresaINSC_MUNICIPAL.AsString),14);
     sRazao_Social:=Espaco(DM.TEmpresaRAZAO_SOCIAL.AsString,50);
     sEndereco:=DM.TEmpresaENDERECO.AsString;
end;

procedure TFMenuFiscal.GeraArqEstoque;
var
   nNumRegistros : Integer;
   Data_Estoque, nQtde_Estoque : ShortString;
begin
     AssignFile(f,EArquivo.Text);
     Rewrite(f); //abre o arquivo para escrita

     //Registro Tipo E1 - Identificação do Estabelecimento usuário do PAF-ECF
     Writeln(f,'E1'+
               sCNPJ+
               sInsc_Est+
               sInsc_Muni+
               sRazao_Social);

     //Registro Tipo E2 - Relação das Mercadorias em Estoque
     nNumRegistros:=0;
     With DM
     do begin
        TPesqProduto.Close;
        TPesqProduto.IndexFieldNames:='CODIGO';
        TPesqProduto.Open;
        TPesqProduto.First;
        While not TPesqProduto.Eof
        do begin
           Inc(nNumRegistros);

           Data_Estoque:=FormatDateTime( 'yyyy/mm/dd', TPesqProdutoDATAULTVENDA.AsDateTime );
           Data_Estoque:=RemoveCaractesresEspeciais(Data_Estoque);

           nQtde_Estoque:=formatcurr('0.00',TPesqProdutoQTDE.AsFloat);
           FormatoNum(nQtde_Estoque,9);

           Writeln(f,'E2'+
                    sCNPJ+
                    StrZero(TPesqProdutoCODIGO.AsInteger,14)+
                    Espaco(TPesqProdutoDESCRICAO.AsString,50)+
                    Espaco(TPesqProdutoMED.AsString,6)+
                    nQtde_Estoque+
                    Data_Estoque);

           TPesqProduto.Next;
           end;
        end;
                
     //Registro Tipo E9 - Totalização do Arquivo
     Writeln(f,'E9'+
               sCNPJ+
               sInsc_Est+
               StrZero(nNumRegistros,6));
     Closefile(f); //fecha o handle de arquivo

     //Registro Tipo EAD - Assinatura Digital
     GerarEADArquivo(EArquivo.Text);

end;

procedure TFMenuFiscal.GeraTabProdutos;
var
   nNumRegistros : Integer;
   nAliquota, nValor_Unit : ShortString;
   sCod_Trib : String;
begin
     AssignFile(f,EArquivo.Text);
     Rewrite(f); //abre o arquivo para escrita

     //Registro Tipo P1 - Identificação do Estabelecimento usuário do PAF-ECF
     Writeln(f,'P1'+
               sCNPJ+
               sInsc_Est+
               sInsc_Muni+
               sRazao_Social);

     //Registro Tipo P2 - Relação das Mercadorias
     nNumRegistros:=0;
     With DM
     do begin
        TPesqProduto.Close;
        TPesqProduto.IndexFieldNames:='CODIGO';
        TPesqProduto.Open;
        TPesqProduto.First;
        While not TPesqProduto.Eof
        do begin
           Inc(nNumRegistros);

           nAliquota:=formatcurr('0.00',TPesqProdutoALIQUOTA.AsFloat);
           FormatoNum(nAliquota,4);
           nValor_Unit:=formatcurr('0.00',TPesqProdutoPRECOVENDA.AsFloat);
           FormatoNum(nValor_Unit,12);

           if TPesqProdutoCODIGOCUPOM.Value='FF'//Substituição Tributária
           then sCod_Trib:='F'
           else if TPesqProdutoCODIGOCUPOM.Value='II'//Isento
           then sCod_Trib:='I'
           else if TPesqProdutoCODIGOCUPOM.Value='NN'//Não Incidência
           then sCod_Trib:='N'
           else sCod_Trib:='T';//Tributado pelo ICMS

           Writeln(f,'P2'+
                    sCNPJ+
                    StrZero(TPesqProdutoCODIGO.AsInteger,14)+
                    Espaco(TPesqProdutoDESCRICAO.AsString,50)+
                    Espaco(TPesqProdutoMED.AsString,6)+
                    Espaco('A',1)+
                    Espaco('T',1)+
                    Espaco(sCod_Trib,1)+
                    nAliquota+
                    nValor_Unit);

           TPesqProduto.Next;
           end;
        end;

     //Registro Tipo P9 - Totalização do Arquivo
     Writeln(f,'P9'+
               sCNPJ+
               sInsc_Est+
               StrZero(nNumRegistros,6));
     Closefile(f); //fecha o handle de arquivo

     //Registro Tipo EAD - Assinatura Digital
     GerarEADArquivo(EArquivo.Text);
end;               

procedure TFMenuFiscal.BtDAVEmitidosClick(Sender: TObject);
begin
     if Confirma('Consultar DAV Emitidos?')=mrYes
     then begin
          Try
             if FDAVEmitidos=Nil
             then Application.CreateForm(TFDAVEmitidos,FDAVEmitidos);
             FDAVEmitidos.ShowModal;
          Finally
             FDAVEmitidos.Release;
             FDAVEmitidos:=Nil;
             end;
          end;
end;

procedure TFMenuFiscal.FormActivate(Sender: TObject);
begin
     if (Length(EDataI.text) < 10)
     then begin
          MessageDlg('A data do seu computador tem que ser alterada ' + #10#13 +
                     'para 4(quatro) digitos  no ano! ' + #10#13 +
                     'Nas Configurações Regionais, clique em personalizar, ' + #10#13 +
                     'Opção Data, Configure estilo de data abreviada para dd/MM/aaaa', MtInformation, [MbOk], 0);

          WinExec('rundll32.exe shell32.dll,Control_RunDLL intl.cpl,,4', SW_Show);
          Close;
          end;
end;

procedure TFMenuFiscal.FormDestroy(Sender: TObject);
begin
     DM.TEmpresa.Close;
     DM.TPesqProduto.Close;
end;

procedure TFMenuFiscal.BtEstoqueClick(Sender: TObject);
begin
     if Confirma('Gerar Arquivo do Estoque?')=mrYes
     then begin
          EArquivo.Clear;
          RGSaida.ItemIndex:=1;
          EArquivo.Text:='C:\Apgef\PAF\Estoque.txt';
          GeraArqEstoque;
          Informa('Arquivo Gerado com Sucesso!');
          end;
end;

procedure TFMenuFiscal.BtTabProdClick(Sender: TObject);
begin
     if Confirma('Gerar Arquivo da Tab.Produtos?')=mrYes
     then begin
          EArquivo.Clear;
          RGSaida.ItemIndex:=1;
          EArquivo.Text:='C:\Apgef\PAF\TabelaProdutos.txt';
          GeraTabProdutos;
          Informa('Arquivo Gerado com Sucesso!');
          end;
end;

procedure TFMenuFiscal.BtPAF_ECFClick(Sender: TObject);
begin
     EArquivo.Clear;
     Try
        if FIdentificaoPAF=Nil
        then Application.CreateForm(TFIdentificaoPAF,FIdentificaoPAF);
        FIdentificaoPAF.ShowModal;
     Finally
        FIdentificaoPAF.Release;
        FIdentificaoPAF:=Nil;
        end;
end;

procedure TFMenuFiscal.BtMovtoECFClick(Sender: TObject);
begin
     if Confirma('Gerar o movimento por ECF?')=mrYes
     then begin
          EArquivo.Clear;
          RGSaida.ItemIndex:=1;
          GerarArquivoMovimentoECF(EDataI.Date,EDataF.Date,0);
          end;
end;

//Flag = 0 Gera o Arquivo de Movimento através do Menu Fiscal
//Flag = 1 Gera o Arquivo de Movimento através da emissão da Redução Z no Final do dia 
procedure GerarArquivoMovimentoECF(xDataI, xDataF : TDate; iFlag : Integer);
var
 Lista          : TStrings;
 sNomeArq,localarquivo,sNome_do_Arquivo,
 {variáveis do R01}
 sDataSWB, sHoraSWB  : string;
 iCont, i, iNumero_Usuario                                                      : Integer;
 SCNPJDesenv, sIEDesenv, sIMDesenv, sEmpresaDesenv, sAplicativo, sVersaoApl,
 sMD5Desenv, sVersaoReq                                                          : string;
 sDataInicial, sDataFinal                                                        : string;
 {Variáveis do R02}
 sCRZ, sCRO, sCOO, sDtMovimento, sDtEmissao, sHrEmissao,
 sVlVendaBruta, sParISSQN, sDtEmissaoReducao, sHoraEmissaoReducao                : string;
 { Variáveis do R03}
 sTotParcial, sVlTotParcial                                                      : string;
 {Variáveis do R04}
 SvCancel, sIndicadCancel,
 sVlTotBruto, sVlDesconto, sVlAcrescimo, sVlTotLiquido, sNmCliente, sCPF         : string;
 {Variáveis do R05}
 sNuItem, sCDProduto, sProduto, sQtdItem, sUnidade, sVlUnitario, sDescItem,
 sAcresItem, sVlTotalLiquido, sQtdCancel, sVlCancel, sTot_Parcial         : string;
 {variaveis R06}
 sGNF,
 sGRG, sCDC, Denominacao,
 DtFinalarq, HrFinalarq                                                          : string;
 {Variáveis do R07}
 sCCF, sMeioPagto                                                                : string;
 sNumeroCNIEE                                                                    : string;
 sDataMovtoECF, dataSW                                                           : TDate;
 nDia,nMes,nAno                                                                  : String;
 ApliDescAcresc                                                                  : String;
begin
 try
   if iFlag = 0
   then begin
        FMSG := TFMSG.Create(nil);
        FMSG.PMensagem.Caption := 'Gerando Dados Sobre Movimento da ECF. Aguarde!!';
        FMSG.Show;
        FMsg.Repaint;
        end
   else if iFlag = 1
   then begin
        Retorna_Informacao_Impressora;//Retorna todas as informações da Impressora
        Pega_NumSerie_Impressora;//Retorna somente o Nº de série;
        Identificacao_Estabelecimento_Usuario_PAF;//Retorna as informaçoes do Estabelecimento usuario
        end;
  AC1;

 lista        := TStringList.Create;
 iNumero_Usuario:= 1;
 sCRZ           := '';
 sCRO           := '';
 sCOO           := '';
 sDtMovimento   := '';
 sDtEmissao     := '';
 sHrEmissao     := '';
 sVlVendaBruta  := '';
 sParISSQN      := '';
//
 sTotParcial    := '';
 sVlTotParcial  := '';
//
 sVlTotBruto    := '';
 sVlDesconto    := '';
 sVlAcrescimo   := '';
 sVlTotLiquido  := '';
 sNmCliente     := '';
 sCPF           := '';
//
 sNuItem        := '';
 sCDProduto     := '';
 sProduto       := '';
 sQtdItem       := '';
 sUnidade       := '';
 sVlUnitario    := '';
 sDescItem      := '';
 sAcresItem     := '';
 sVlTotalLiquido:= '';
 sQtdCancel     := '';
 sVlCancel      := '';
 sTot_Parcial   := '';
 //
 sCCF           := '';
 sMeioPagto     := '';
 sDataSWB       := '';
 sHoraSWB       := '';
 //
 sDataInicial   := RetornaDataString(DateToStr(xDataI));
 sDataFinal     := RetornaDataString(DateToStr(xDataF));

  if iFlag = 0
  then FMSG.Update;

  Try
    sDataSWB:=RetornaDataString(sDataSWB);
    sDataSWB:=Copy(sData_HoraSB,1,8);

    nDia:=Copy(sDataSWB,1,2);
    nMes:=Copy(sDataSWB,3,2);
    nAno:=Pchar(Copy(sDataSWB,5,4));
    dataSW:=StrToDate(nDia+'/'+nMes+'/'+nAno);
    sDataSWB:=RetornaDataString(DateToStr(dataSW));
  Except
    sDataSWB:=RetiraArgumento(' ',sDataSWB);
    sDataSWB:=FormatDateTime('yyyymmdd',Date);
    end;

  Try
    sHoraSWB:=Copy(sData_HoraSB,9,6);
  Except
    sHoraSWB:=RetiraArgumento(' ',sHoraSWB);
    sHoraSWB:=FormatDateTime('HHMMSS',Time);
    end;


  //sDataHoraSWB := RetiraArgumento(' ',sDataHoraSWB);
  //if sDataHoraSWB = '' then sDataHoraSWB := DateToStr(Now);
  
//##################REGISTRO TIPO R1 - IDENTIFICAÇÃO DO USUÁRIO, DO PAF-ECF E DA
//##################EMPRESA DESENVOLVEDORA E DADOS DO ARQUIVO###################

  DM.TRegistro.Open;
  DM.TRegistro.Refresh;
  SCNPJDesenv    := Espaco(RemoveCaractesresEspeciais(DM.TRegistroCNPJ.AsString),14);
  sIEDesenv      := RemoveCaractesresEspeciais(DM.TRegistroINSC_ESTADUAL.AsString);
  sIMDesenv      := RemoveCaractesresEspeciais(DM.TRegistroINSC_MUNICIPAL.AsString);
  sIEDesenv      := StrZero(StrToInt(sIEDesenv),14);
  sIMDesenv      := StrZero(StrToInt(sIMDesenv),14); 

  sEmpresaDesenv := Espaco(DM.TRegistroRAZAO_EMPRESA.AsString,40);
  sAplicativo    := Espaco(DM.TRegistroNOME_COMERCIAL.AsString,40);
  sVersaoApl     := RemoveCaractesresEspeciais(DM.TRegistroVERSAO.AsString);
  sMD5Desenv     := Espaco(DM.TRegistroCOD_AUTENTICACAO.AsString,32);
  sVersaoReq     := Espaco(RemoveCaractesresEspeciais(DM.TRegistroVERSAO_ER_PAF_ECF.AsString),04);
  sVersaoApl     := StrZero(StrToInt(sVersaoApl),10);
  //
  sNum_Serie_ECF := Espaco(sNum_Serie_ECF,20);
  sMF_Adicional  := Espaco(sMF_Adicional,01);
  sTipo_ECF      := Espaco(sTipo_ECF,07);
  sMarca_ECF     := Espaco(sMarca_ECF,20);
  sModelo_ECF    := Espaco(sModelo_ECF,20);
  sVersao_SB     := RemoveCaractesresEspeciais(sVersao_SB);
  sDataSWB       := Espaco(sDataSWB,8);
  sHoraSWB       := Espaco(sHoraSWB,6);
  iNumero_Usuario:= StrToInt(sNum_Caixa);
  sCNPJ          := Espaco(RemoveCaractesresEspeciais(sCNPJ),14);
  sInsc_Est      := Espaco(RemoveCaractesresEspeciais(sInsc_Est),14);
  sVersao_SB     := StrZero(StrToInt(sVersao_SB),10);
  //
  iCont          := 1;

  while length(sVersao_SB) < 06
  do sVersao_SB := sVersao_SB+'0';

  sMarca_ECF  := Espaco(sMarca_ECF,20);
  sModelo_ECF := Espaco(sModelo_ECF,20);
  sTipo_ECF   := Espaco(sTipo_ECF,7);

  Lista.Add('R01'+sNum_Serie_ECF+sMF_Adicional+sTipo_ECF+sMarca_ECF+sModelo_ECF+
            sVersao_SB+sDataSWB+sHoraSWB+StrZero(iNumero_Usuario,3)+sCNPJ+sInsc_Est+SCNPJDesenv+
            sIEDesenv+sIMDesenv+sEmpresaDesenv+sAplicativo+sVersaoApl+sMD5Desenv+
            sDataInicial+sDataFinal+sVersaoReq);

//##################REGISTRO TIPO R2 - RELAÇÃO DE REDUÇÕES Z####################
  With DM
  do begin
     TConsultaReducoes.Close;
     TConsultaReducoes.Params[0].AsDate:=xDataI;
     TConsultaReducoes.Params[1].AsDate:=xDataF;
     TConsultaReducoes.Params[2].AsString:=sNumero_serie;
     TConsultaReducoes.IndexFieldNames:='DATA_MOVIMENTO';
     TConsultaReducoes.Open;
     while not TConsultaReducoes.Eof
     do begin
        sDtEmissaoReducao:=DateToStr(TConsultaReducoesDATA_HORA.AsDateTime);
        sHoraEmissaoReducao:=TimeToStr(TConsultaReducoesDATA_HORA.AsDateTime);

        iNumero_Usuario:= StrToInt(TConsultaReducoesNR_ORDEM_EQP.AsString);
        sCRZ           := AjustaInteiro(TConsultaReducoesNR_CONTADOR_Z.AsString,06);
        sCOO           := AjustaInteiro(TConsultaReducoesNRO_CONTADOR_INICIO.AsString,06);
        sCRO           := AjustaInteiro(TConsultaReducoesCONTADOR_REINICIO.AsString,06);
        sDtMovimento   := RetornaDataString(TConsultaReducoesDATA_MOVIMENTO.AsString);
        sDtEmissao     := RetornaDataString(sDtEmissaoReducao);
        sHrEmissao     := FormatDateTime('HHMMSS',StrToTime(sHoraEmissaoReducao));
        sVlVendaBruta  := AjustaNumerico(TConsultaReducoesVALOR_VENDA_BRUTA.AsFloat,14);
        sParISSQN      := 'N';
        Inc(iCont);

        Lista.Add('R02'+Espaco(sNum_Serie_ECF,20)+sMF_Adicional+sModelo_ECF+
                  StrZero(iNumero_Usuario,2)+sCRZ+sCOO+sCRO+sDtMovimento+sDtEmissao+sHrEmissao+sVlVendaBruta+sParISSQN);

        TConsultaReducoes.Next;
        end;
   end;

//##################REGISTRO TIPO R3 - DETALHE DA REDUÇÕES Z####################

  With DM
  do begin
     TConsultaReducoes.First;
     while not TConsultaReducoes.Eof
     do begin
        sNum_Serie_ECF := Espaco(sNum_Serie_ECF,20);
        sMF_Adicional  := Espaco(sMF_Adicional,01);
        sModelo_ECF    := Espaco(sModelo_ECF,20);
        sCRZ           := AjustaInteiro(TConsultaReducoesNR_CONTADOR_Z.AsString,06);

        if TConsultaReducoesVALOR_CANCELAMENTOS.AsFloat > 0
        then begin
             sTotParcial    := Espaco('Can-T',07);
             sVlTotParcial  := AjustaNumerico(TConsultaReducoesVALOR_CANCELAMENTOS.AsCurrency,13);
             Lista.Add('R03'+sNum_Serie_ECF+sMF_Adicional+sModelo_ECF+StrZero(iNumero_Usuario,2)+sCRZ+sTotParcial+sVlTotParcial);
             Inc(iCont);
             end;
        if TConsultaReducoesVALOR_DESCONTOS.AsFloat > 0
        then begin
             sTotParcial    := Espaco('DT',07);
             sVlTotParcial  := AjustaNumerico(TConsultaReducoesVALOR_DESCONTOS.AsCurrency,13);
             Lista.Add('R03'+sNum_Serie_ECF+sMF_Adicional+sModelo_ECF+StrZero(iNumero_Usuario,2)+sCRZ+sTotParcial+sVlTotParcial);
             Inc(iCont);
             end;
        if TConsultaReducoesVALOR_DESCONTOS.AsFloat > 0
        then begin
             sTotParcial    := Espaco('DT',07);
             sVlTotParcial  := AjustaNumerico(TConsultaReducoesVALOR_DESCONTOS.AsCurrency,13);
             Lista.Add('R03'+sNum_Serie_ECF+sMF_Adicional+sModelo_ECF+StrZero(iNumero_Usuario,2)+sCRZ+sTotParcial+sVlTotParcial);
             Inc(iCont);
             end;
        if TConsultaReducoesVALOR_SUBST_TRIB.AsFloat > 0
        then begin
             sTotParcial    := Espaco('F1',07);
             sVlTotParcial  := AjustaNumerico(TConsultaReducoesVALOR_SUBST_TRIB.AsCurrency,13);
             Lista.Add('R03'+sNum_Serie_ECF+sMF_Adicional+sModelo_ECF+StrZero(iNumero_Usuario,2)+sCRZ+sTotParcial+sVlTotParcial);
             Inc(iCont);
             end;
        if TConsultaReducoesVALOR_ISENTO.AsFloat > 0
        then begin
             sTotParcial    := Espaco('I1',07);
             sVlTotParcial  := AjustaNumerico(TConsultaReducoesVALOR_ISENTO.AsCurrency,13);
             Lista.Add('R03'+sNum_Serie_ECF+sMF_Adicional+sModelo_ECF+StrZero(iNumero_Usuario,2)+sCRZ+sTotParcial+sVlTotParcial);
             Inc(iCont);
             end;
        if TConsultaReducoesVALOR_NAO_INCIDENCIA.AsFloat > 0
        then begin
             sTotParcial    := Espaco('N1',07);
             sVlTotParcial  := AjustaNumerico(TConsultaReducoesVALOR_NAO_INCIDENCIA.AsCurrency,13);
             Lista.Add('R03'+sNum_Serie_ECF+sMF_Adicional+sModelo_ECF+StrZero(iNumero_Usuario,2)+sCRZ+sTotParcial+sVlTotParcial);
             Inc(iCont);
             end;

        for i := 1 to 10 //Contador para 10 aliquotas cadastradas no ECF
        do begin
           With TConsultaReducoes
           do begin
              if (Fields.FieldByName('POSI_ALIQUOTA0' + IntToStr(i)).AsString <> '') and
                 (Fields.FieldByName('VALOR_TPARCIAL0' + IntToStr(i)).asFloat > 0)
              then begin
                   sTotParcial    := Espaco(Fields.FieldByName('POSI_ALIQUOTA0' + IntToStr(i)).AsString,07);
                   sVlTotParcial  := AjustaNumerico(Fields.FieldByName('VALOR_TPARCIAL0' + IntToStr(i)).AsFloat,13);
                   Lista.Add('R03'+sNum_Serie_ECF+sMF_Adicional+sModelo_ECF+StrZero(iNumero_Usuario,2)+sCRZ+sTotParcial+sVlTotParcial);
                   Inc(iCont);
                   end;
              end;
           end;

        TConsultaReducoes.Next;
       end;
     end; 

//##################REGISTRO TIPO R4 - CUPOM FISCAL DE VENDA A CONSUMIDOR#######

   With DM
   do begin
      TConsultaVendas.Close;
      TConsultaVendas.Params[0].AsDate:=xDataI;
      TConsultaVendas.Params[1].AsDate:=xDataF;
      TConsultaVendas.Params[2].AsString:=sNum_Serie_ECF;
      TConsultaVendas.IndexFieldNames:='DATA';
      TConsultaVendas.Open;
      while not TConsultaVendas.Eof
      do begin
         sCRZ           := StrZero(TConsultaVendasNUM_CCF_CUPOM.AsInteger,06);
         sCOO           := StrZero(TConsultaVendasNUMERO_CUPOM.AsInteger,06);
         sDtEmissao     := RetornaDataString(TConsultaVendasDATA.AsString);
         if TConsultaVendasCUPOM_CANCELADO.Value='N'
         then begin
              sVlTotBruto    := AjustaNumerico(TConsultaVendasSUBTOTAL.AsCurrency,14);
              sVlTotLiquido  := AjustaNumerico(TConsultaVendasTOTAL.AsCurrency,14);
              end
         else begin
              sVlTotBruto    := AjustaNumerico(0,14);
              sVlTotLiquido  := AjustaNumerico(0,14);
              end;
         sIndicadCancel := Espaco(TConsultaVendasCUPOM_CANCELADO.Value,1);
         sVlDesconto    := AjustaNumerico(TConsultaVendasDESCONTO.AsCurrency,13);
         sVlAcrescimo   := AjustaNumerico(TConsultaVendasACRESCIMO.AsCurrency,13);
         SvCancel       := AjustaNumerico(0,13);
         ApliDescAcresc:='';
         if TConsultaVendasACRESCIMO.AsFloat > 0
         then ApliDescAcresc:='A'
         else if TConsultaVendasDESCONTO.AsFloat > 0
         then ApliDescAcresc:='D';
         sNmCliente     := Espaco(TConsultaVendasNOME.AsString,40);
         if TConsultaVendasCPF.IsNull then sCPF := RemoveCaractesresEspeciais(TConsultaVendasCGC.AsString)
         else sCPF := RemoveCaractesresEspeciais(TConsultaVendasCPF.AsString);
         sCPF := RetiraArgumento(' ',sCPF);
         if sCPF=''
         then sCPF:='0';
         sCPF:=AjustaInteiro((sCPF),14);
         Inc(iCont);
         //
         //
         Lista.Add('R04'+Espaco(sNum_Serie_ECF,20)+sMF_Adicional+sModelo_ECF+
                   StrZero(iNumero_Usuario,2)+sCRZ+sCOO+sDtEmissao+sVlTotBruto+
                   sVlDesconto+'V'+sVlAcrescimo+'V'+sVlTotLiquido+sIndicadCancel+
                   SvCancel+' '+sNmCliente+sCPF);

        TConsultaVendas.Next;
       end;
     end;

//##################REGISTRO TIPO R5 - DETALHE DO CUPOM FISCAL##################

   With DM
   do begin
      TConsultaItenVendas.Close;
      TConsultaItenVendas.Params[0].AsDate:=xDataI;
      TConsultaItenVendas.Params[1].AsDate:=xDataF;
      TConsultaItenVendas.Params[2].AsString:=sNumero_serie;
      TConsultaItenVendas.IndexFieldNames:='DATA';
      TConsultaItenVendas.Open;
      while not TConsultaItenVendas.Eof
      do begin
         sCOO            := StrZero(TConsultaItenVendasNUMERO_CUPOM.AsInteger,06);
         sCRZ            := StrZero(TConsultaItenVendasNUM_CCF_CUPOM.AsInteger,06);
         sNuItem         := StrZero(TConsultaItenVendasITEM.AsInteger,03);
         sCDProduto      := Espaco(IntToStr(TConsultaItenVendasCOD_PRODUTO.AsInteger),14);
         sProduto        := Espaco(TConsultaItenVendasDESCRICAO.AsString,100);
         sQtdItem        := StrZero(TConsultaItenVendasQUANTIDADE.AsInteger,07);
         sUnidade        := Espaco(TConsultaItenVendasUNIDADE.AsString,03);
         sVlUnitario     := AjustaNumerico(TConsultaItenVendasVL_UNITARIO.AsCurrency,08);
         sVlTotalLiquido := AjustaNumerico(TConsultaItenVendasVL_TOTAL.AsCurrency,14);
         sDescItem       := AjustaNumerico(0,08);
         sAcresItem      := AjustaNumerico(0,08);
         sQtdCancel      := AjustaInteiro('0',07);
         sVlCancel       := AjustaInteiro('0',13);
         sVlAcrescimo    := AjustaInteiro('0',13);
         sIndicadCancel  := Espaco(TConsultaItenVendasCUPOM_CANCELADO.Value,1);
         sTotParcial     := Espaco(TConsultaItenVendasCOD_TOTALIZADOR_PARCIAL.AsString,7);
         Inc(iCont);
         //
         //
         Lista.Add('R05'+Espaco(sNum_Serie_ECF,20)+sMF_Adicional+sModelo_ECF+
                        StrZero(iNumero_Usuario,2)+sCOO+sCRZ+sNuItem+sCDProduto+
                        sProduto+sQtdItem+sUnidade+sVlUnitario+sDescItem+
                        sAcresItem+sVlTotalLiquido+sTotParcial+sIndicadCancel+
                        sQtdCancel+sVlCancel+sVlAcrescimo+'T'+'T'+'3'+'2');

         TConsultaItenVendas.Next;
         end;
      end;

//##################REGISTRO TIPO R6 - DEMAIS DOCUMENTOS EMITIDOS PELO ECF######

    With DM
    do begin
       TConsultaDocEmitidos.Close;
       TConsultaDocEmitidos.Params[0].AsDate:=xDataI;
       TConsultaDocEmitidos.Params[1].AsDate:=xDataF;
       TConsultaDocEmitidos.Params[2].AsString:=sNum_Serie_ECF;
       TConsultaDocEmitidos.IndexFieldNames:='DATA_EMISSAO';
       TConsultaDocEmitidos.Open;
       while not TConsultaDocEmitidos.Eof
       do begin
          sCOO        := '';
          sGNF        := '';
          sGRG        := '';
          sCDC        := '';
          Denominacao := '';
            //
          sCOO        := StrZero(TConsultaDocEmitidosCOO.AsInteger,6);
          sGNF        := StrZero(TConsultaDocEmitidosGNF.AsInteger,6);
          sGRG        := StrZero(TConsultaDocEmitidosGRG.AsInteger,6);
          sCDC        := StrZero(TConsultaDocEmitidosCDC.AsInteger,4);
          Denominacao := Espaco(TConsultaDocEmitidosDENOMINACAO.AsString,2);
          DtFinalarq  := RetornaDataString(TConsultaDocEmitidosDATA_EMISSAO.AsString);
          HrFinalarq  := FormatDateTime('HHMMSS',TConsultaDocEmitidosHORA_EMISSAO.AsDateTime);

          Lista.Add('R06'+Espaco(sNum_Serie_ECF,20)+sMF_Adicional+sModelo_ECF+
                    StrZero(iNumero_Usuario,2)+sCOO+sGNF+sGRG+sCDC+Denominacao+
                    DtFinalarq+HrFinalarq);

          TConsultaDocEmitidos.Next;
          end;
        end;

//##################REGISTRO TIPO R7 - DETALHE DO CUPOM FISCAL E DO DOCUMENTO NÃO FISCAL - MEIO DE PAGAMENTO

   With DM
   do begin
      TMeiosPgtosR7.Close;
      TMeiosPgtosR7.Params[0].AsDate:=xDataI;
      TMeiosPgtosR7.Params[1].AsDate:=xDataF;
      TMeiosPgtosR7.Params[2].AsString:=sNumero_serie;
      TMeiosPgtosR7.IndexFieldNames:='DATA';
      TMeiosPgtosR7.Open;
      While not TMeiosPgtosR7.Eof
      do begin
         sCOO            := StrZero(TMeiosPgtosR7NUMERO_CUPOM.AsInteger,6);
         sCCF            := StrZero(TMeiosPgtosR7NUM_CCF_CUPOM.AsInteger,6);
         sGNF            := StrZero(TMeiosPgtosR7CONTADOR_GNF.AsInteger,6);
         sMeioPagto      := Espaco(TMeiosPgtosR7DESCR_PGTO.AsString,15);
         sVlTotalLiquido := AjustaNumerico(TMeiosPgtosR7VALOR.AsCurrency,13);
         Inc(iCont);

   Lista.Add('R07'+Espaco(sNum_Serie_ECF,20)+sMF_Adicional+sModelo_ECF+
             StrZero(iNumero_Usuario,2)+sCOO+sCCF+sCRZ+sMeioPagto+
             sVlTotalLiquido+'N'+AjustaNumerico(0,13));

   TMeiosPgtosR7.Next;
   end;
  end;

 localarquivo:='C:\Apgef\PAF\';

 if iFlag=0
 then sDataMovtoECF:=Now
 else sDataMovtoECF:=StrToDate(sDataMovtoReducaoZ);

 sNomeArq := NomedoArquivo_MovtoECF(sCod_Nacional_ECF,sNum_Serie_ECF,sDataMovtoECF);
 sNome_do_Arquivo:=localarquivo+sNomeArq;
 if iFlag = 0
 then begin
      Informa('Arquivo Criado na pasta: '+localarquivo);
      FMenuFiscal.EArquivo.Text:=(sNome_do_Arquivo);
      end;
 Lista.SaveToFile(sNome_do_Arquivo);
 GerarEADArquivo(sNome_do_Arquivo);

finally
  if iFlag = 0
  then FreeAndNil(FMSG);
  DC;
  end;
end;

procedure TFMenuFiscal.BtMeiosPagtoClick(Sender: TObject);
begin
     EArquivo.Clear;
     Try
        if FMeiosPgtos=Nil
        then Application.CreateForm(TFMeiosPgtos,FMeiosPgtos);
        FMeiosPgtos.ShowModal;
     Finally
        FMeiosPgtos.Release;
        FMeiosPgtos:=Nil;
        end;
end;

procedure TFMenuFiscal.BtLXClick(Sender: TObject);
begin
     if Confirma('Imprimir a Leitura X?')=mrYes
     then begin
          EArquivo.Clear;
          if RGSaida.ItemIndex=0
          then Imprimi_LeituraX
          else if RGSaida.ItemIndex=1
          then begin
               AC1;

               if FileExists('C:\Retorno.txt')
               then DeleteFile('C:\Retorno.txt');

               Imprimi_LeituraX_Arquivo;

               CopiaArq('Retorno.txt','LX.txt',0);

               EArquivo.Text:='C:\Apgef\PAF\LX.txt';

               GerarEADArquivo(EArquivo.Text);

               DC;

               Update;
               Informa('Arquivo Gerado e salvo com sucesso!');
               end;
          end;
end;

procedure TFMenuFiscal.RGFaixaDadosClick(Sender: TObject);
begin
     if RGFaixaDados.ItemIndex=0
     then GPeriodo.Visible:=True
     else begin
          GPeriodo.Visible:=False;
          if RGFaixaDados.ItemIndex=1
          then GCRZ_COO.Caption:='CRZ'
          else if RGFaixaDados.ItemIndex=2
          then GCRZ_COO.Caption:='COO';
          ECOO_CRZI.Clear;
          ECOO_CRZF.Clear;
          end;
end;

procedure TFMenuFiscal.BtLMFCClick(Sender: TObject);
begin
     if Confirma('Imprmir a Leitura da Memória Fiscal Completa?')=mrYes
     then begin
          EArquivo.Clear;
          AC1;
          sNomeArqLMF:='LMFC.txt';
          Try
            if s_ImpFiscal = 'ECF Daruma'
            then Leitura_Memoria_Fiscal('1')
            else if s_ImpFiscal = 'ECF Bematech'
            then Leitura_Memoria_Fiscal('c')
            else if s_ImpFiscal = 'ECF Elgin'
            then Leitura_Memoria_Fiscal('c')
            else if s_ImpFiscal = 'ECF Sweda'
            then Leitura_Memoria_Fiscal('C');
          Except
            Informa('Função não Suportada pelo Modelo do ECF');
            end;
          Update;
          DC;
          end;
end;

procedure TFMenuFiscal.BtLMFSClick(Sender: TObject);
begin
     if Confirma('Imprmir a Leitura da Memória Fiscal Simplificada?')=mrYes
     then begin
          EArquivo.Clear;
          Ac1;
          sNomeArqLMF:='LMFS.txt';
          Try
            if s_ImpFiscal = 'ECF Daruma'
            then Leitura_Memoria_Fiscal('0')
            else if s_ImpFiscal = 'ECF Bematech'
            then Leitura_Memoria_Fiscal('s')
            else if s_ImpFiscal = 'ECF Elgin'
            then Leitura_Memoria_Fiscal('s')
            else if s_ImpFiscal = 'ECF Sweda'
            then Leitura_Memoria_Fiscal('S');
          Except
            Informa('Função não Suportada pelo Modelo do ECF');
            end;
          DC;
          end;
end;

procedure TFMenuFiscal.BtEspelhoMFDClick(Sender: TObject);
var
  S_DataI, S_DataF, S_COOI, S_COOF, S_NomeArq : String;
begin
     if Confirma('Gerar o Espelho MFD do ECF?')=mrYes
     then begin
          EArquivo.Clear;
          RGSaida.ItemIndex:=1;
         Try
          FMSG := TFMSG.Create(nil);
          FMSG.PMensagem.Caption := 'Gerando Espelho MFD do ECF. Aguarde!!';
          FMSG.Show;
          FMsg.Repaint;

          if FileExists('C:\Retorno.txt')
          then DeleteFile('C:\Retorno.txt');
          
          S_NomeArq:='RETORNO.TXT';
          S_DataI:=FormatDateTime('dd/MM/yy',EDataI.Date);
          S_DataF:=FormatDateTime('dd/MM/yy',EDataF.Date);
          S_COOI:=ECOO_CRZI.Text;
          S_COOF:=ECOO_CRZF.Text;

          AC1;

          Try
            if s_ImpFiscal = 'ECF Daruma'
            then begin
                 If RGFaixaDados.ItemIndex=0
                 then retorno_imp_fiscal := Daruma_FIMFD_DownloadDaMFD(PChar(S_DataI),Pchar(S_DataF))
                 else If RGFaixaDados.ItemIndex=2
                 then retorno_imp_fiscal := Daruma_FIMFD_DownloadDaMFD(PChar(S_COOI),Pchar(S_COOF))
                 else If RGFaixaDados.ItemIndex=1
                 then Informa('Este tipo de intervalo não é suportado neste comando!');
                 end
            else if s_ImpFiscal = 'ECF Bematech'
            then begin
                 If RGFaixaDados.ItemIndex=0
                 then retorno_imp_fiscal := Bematech_FI_DownloadMFD(PChar(S_NomeArq),PChar('1'),PChar(S_DataI),Pchar(S_DataF),Pchar(''))
                 else If RGFaixaDados.ItemIndex=2
                 then retorno_imp_fiscal := Bematech_FI_DownloadMFD(PChar(S_NomeArq),PChar('2'),PChar(S_COOI),Pchar(S_COOF),PChar(sNum_Caixa))
                 else If RGFaixaDados.ItemIndex=1
                 then Informa('Este tipo de intervalo não é suportado neste comando!');
                 end
            else if s_ImpFiscal = 'ECF Elgin'
            then begin
                 If RGFaixaDados.ItemIndex=0
                 then retorno_imp_fiscal := Elgin_DownloadMFD(PChar(S_NomeArq),PChar('1'),PChar(S_DataI),Pchar(S_DataF),Pchar(''))
                 else If RGFaixaDados.ItemIndex=2
                 then retorno_imp_fiscal := Elgin_DownloadMFD(PChar(S_NomeArq),PChar('2'),PChar(S_COOI),Pchar(S_COOF),PChar(sNum_Caixa))
                 else If RGFaixaDados.ItemIndex=1
                 then Informa('Este tipo de intervalo não é suportado neste comando!');
                 end
            else if s_ImpFiscal = 'ECF Sweda'
            then begin
                 If RGFaixaDados.ItemIndex=0
                 then retorno_imp_fiscal := ECF_DownloadMFD(PChar(S_NomeArq),PChar('1'),PChar(S_DataI),Pchar(S_DataF),Pchar(''))
                 else If RGFaixaDados.ItemIndex=2
                 then retorno_imp_fiscal := ECF_DownloadMFD(PChar(S_NomeArq),PChar('2'),PChar(S_COOI),Pchar(S_COOF),PChar(sNum_Caixa))
                 else If RGFaixaDados.ItemIndex=1
                 then Informa('Este tipo de intervalo não é suportado neste comando!');
                 end;

          Application.ProcessMessages;

          Analisa_iRetorno();
          Retorno_Impressora();

          Except
            FMenuFiscal.Cursor:=crDefault;
            InformaError('Função não Suportada pelo Modelo de ECF utilizado!');
            end;

        Repaint;
        DC;
        Application.ProcessMessages;

        if FileExists('C:\Retorno.txt')
        then begin
             CopiaArq('Retorno.txt','EspelhoMFD.txt',0);
             EArquivo.Text:='C:\Apgef\PAF\EspelhoMFD.txt';
             GerarEADArquivo(EArquivo.Text);
             Informa('Arquivo Gerado e salvo com sucesso!');
             end;

       Finally
           FreeAndNil(FMSG);
           end;
       Repaint;
       end;
end;

procedure TFMenuFiscal.ECOO_CRZIExit(Sender: TObject);
begin
     ECOO_CRZI.Text:=FormatFloat('######000000',StrToFloat(ECOO_CRZI.Text));
end;

procedure TFMenuFiscal.ECOO_CRZFExit(Sender: TObject);
begin
     ECOO_CRZF.Text:=FormatFloat('######000000',StrToFloat(ECOO_CRZF.Text));
end;

procedure TFMenuFiscal.BtArqMFDClick(Sender: TObject);
var
  S_DataI, S_DataF, S_COOI, S_COOF, S_NomeArqAssinar,
  S_DirDestino : string;
  cArqMFD      : string;
  cTipo        : string;
  cUsuario     : string;
  cCMD         : string;
  cArqTXT      : string;
  cFormato     : string;
  cTipoDownload: string;
  cLinha       : string;
  cDataInicial : string;
  cDataFinal   : string;

  cArqTemp     : TextFile;
  cArqTempTXT  : TextFile;

  Texto : TStringList;
begin
     if Confirma('Gerar o Arquivo MFD')=mrYes
     then begin
          EArquivo.Clear;
          RGSaida.ItemIndex:=1;
         Try
          FMSG := TFMSG.Create(nil);
          FMSG.PMensagem.Caption := 'Gerando Espelho MFD do ECF. Aguarde!!';
          FMSG.LMensagem2.Caption :='Este processo pode demorar alguns minutos. Nunca Desligue a impressora!!';
          FMSG.Show;
          FMsg.Repaint;

          S_DirDestino:='C:\Apgef\PAF\CTP1704\';

          if not DirectoryExists(S_DirDestino)
          then ForceDirectories(S_DirDestino);

          Apaga_todos_arquivos_diretorio(S_DirDestino+'*.*');

          cUsuario := '1';
          S_DataI:=RetiraArgumento('/',DateToStr(EDataI.Date));
          S_DataF:=RetiraArgumento('/',DateToStr(EDataF.Date));
          S_COOI:=ECOO_CRZI.Text;
          S_COOF:=ECOO_CRZF.Text;

          AC1;
        Try
          if s_ImpFiscal = 'ECF Daruma'
          then begin
               S_NomeArqAssinar:='ATOCOTEPE_DARUMA.TXT.';

               {Configura o diretório onde serão gerados os arquivos}
               retorno_imp_fiscal := Daruma_Registry_AlterarRegistry('AtoCotepe', 'Path', 'C:\Apgef\PAF\CTP1704\');
               {Configura sinal sonoro a cada arquivo gerado}
               retorno_imp_fiscal := Daruma_Registry_AlterarRegistry('AtoCotepe', 'Beep', '1');

               Repaint;

               if RGFaixaDados.ItemIndex=0
               then retorno_imp_fiscal:= Daruma_FIMFD_GerarAtoCotepePafData(S_DataI, S_DataF)
               else if RGFaixaDados.ItemIndex=2
               then retorno_imp_fiscal:= Daruma_FIMFD_GerarAtoCotepePafCOO(S_COOI, S_COOF)
               else if RGFaixaDados.ItemIndex=1
               then Informa('Este tipo de intervalo não é suportado neste comando!');
               end
          else if s_ImpFiscal = 'ECF Bematech'
          then begin
               cArqMFD  := 'Download.MFD';
               cCMD     := '2';
               S_NomeArqAssinar  := 'ATOCOTEPE_BEMATECH.TXT.';

               if RGFaixaDados.ItemIndex=0//Por Faixa de data
               then begin
                    cTipo    := '1';
                    retorno_imp_fiscal := Bematech_FI_DownloadMFD( pchar( cArqMFD ),
                                                                   pchar( cTipo ),
                                                                   pchar( S_DataI ),
                                                                   pchar( S_DataF ),
                                                                   pchar( cUsuario ) );

                    // Função que executa a geração do arquivo no layout do Ato Cotepe 17/04
                    // para o PAF-ECF, por intervalo de datas previamente capturadas.
                    retorno_imp_fiscal := BemaDLL.BemaGeraRegistrosTipoE( pchar( cArqMFD ),
                                             pchar( S_NomeArqAssinar ),
                                             pchar( S_DataI ),
                                             pchar( S_DataF ),
                                             pchar( sRazao_Social ),
                                             pchar( sEndereco ),
                                             '',
                                             pchar( cCMD ),
                                             '',
                                             '',
                                             '',
                                             '',
                                             '',
                                             '',
                                             '',
                                             '',
                                             '',
                                             '',
                                             '',
                                             '',
                                             '');
                    DeleteFile( 'Download.MFD' );
                    end
               else if RGFaixaDados.ItemIndex=2//Por Faixa de COO
               then begin
                    cTipo    := '2';
                    retorno_imp_fiscal := Bematech_FI_DownloadMFD( pchar( cArqMFD ),
                                                                   pchar( cTipo ),
                                                                   pchar( S_COOI),
                                                                   pchar( S_COOF),
                                                                   pchar( cUsuario ) );
                    cArqTXT       := 'Espelho.TXT';
                    cFormato      := '0';
                    cTipoDownload := '0';

                    retorno_imp_fiscal := BemaDLL.BemaGeraTxtPorCOO( pchar( cArqMFD ),
                                                            cArqTXT,
                                                            strtoint( cUsuario ),
                                                            strtoint( S_COOI ),
                                                            strtoint( S_COOF ) );

                     // Abre o arquivo Espelho.TXT com a imagem dos cupons capturados.

                     AssignFile( cArqTemp, 'Espelho.TXT' );
                     Reset( cArqTemp );

                     // Cria o arquivo EspelhoTMP.TXT para guardar a imagens dos cupons
                     // capturados, retirando as linhas em branco.

                     AssignFile( cArqTempTXT, 'EspelhoTMP.TXT' );
                     Rewrite( cArqTempTXT );

                     cLinha := '';
                     while not EOF( cArqTemp )
                     do begin
                        Readln( cArqTemp, cLinha );
                        if ( cLinha <> '' )
                        then begin
                             Writeln( cArqTempTXT, cLinha );
                             end;
                        end;

                     CloseFile( cArqTemp );
                     CloseFile( cArqTempTXT );

                     // Cria um objeto do tipo TStringList.

                     Texto := TStringList.Create;
                     Texto.LoadFromFile( 'EspelhoTMP.TXT' );

                     // Copia as informações de data inicial e final, dentro do objeto Texto.

                     cDataInicial := copy( Texto.Strings[ 7 ], 1, 10 );
                     if ( BemaDLL.MP2100 = true )
                     then cDataFinal   := copy( Texto.Strings[ Texto.Count - 2 ], 20, 10 )
                     else cDataFinal   := copy( Texto.Strings[ Texto.Count - 3 ], 29, 10 );

                     // Função que executa a geração do arquivo no layout do Ato Cotepe 17/04
                     // para o PAF-ECF, por intervalo de datas previamente capturadas.
                     retorno_imp_fiscal :=  BemaDLL.BemaGeraRegistrosTipoE( pchar( cArqMFD ),
                                                                   pchar( S_NomeArqAssinar ),
                                                                   pchar( cDataInicial ),
                                                                   pchar( cDataFinal ),
                                                                   pchar( sRazao_Social ),
                                                                   pchar( sEndereco ),
                                                                   '',
                                                                   pchar( cCMD ),
                                                                   '',
                                                                   '',
                                                                   '',
                                                                   '',
                                                                   '',
                                                                   '',
                                                                   '',
                                                                   '',
                                                                   '',
                                                                   '',
                                                                   '',
                                                                   '',
                                                                   '');
                     DeleteFile( 'Download.MFD' );
                     DeleteFile( 'Espelho.TXT' );
                     DeleteFile( 'EspelhoTMP.TXT' );
                     end
               else if RGFaixaDados.ItemIndex=1
               then Informa('Este tipo de intervalo não é suportado neste comando!');
               end
          else if s_ImpFiscal = 'ECF Elgin'
          then begin
               cArqTXT:='C:\Download.MFD';
               S_NomeArqAssinar  := 'ATOCOTEPE_ELGIN.TXT.';
               If RGFaixaDados.ItemIndex=0
               then begin
                    retorno_imp_fiscal := Elgin_DownloadMFD(PChar(cArqTXT),PChar('1'),PChar(S_DataI),Pchar(S_DataF),Pchar(''));

                    retorno_imp_fiscal := Elgin_FormatoDadosMFD(pchar ( cArqTXT ), pchar( S_DirDestino+S_NomeArqAssinar ),
                                                                pchar( '0' ),pchar( '1' ), pchar( S_DataI ), pchar( S_DataF ), pchar( cUsuario ) );
                    DeleteFile( 'Download.MFD' );
                    end
               else If RGFaixaDados.ItemIndex=2
               then begin
                    retorno_imp_fiscal := Elgin_DownloadMFD(PChar(cArqTXT),PChar('2'),PChar(S_COOI),Pchar(S_COOF),PChar(sNum_Caixa));

                    retorno_imp_fiscal := Elgin_FormatoDadosMFD(pchar ( cArqTXT ), pchar( S_DirDestino+S_NomeArqAssinar ),
                                                                pchar( '0' ),pchar( '2' ), pchar( S_COOI ), pchar( S_COOF ), pchar( cUsuario ) );
                    DeleteFile( 'Download.MFD' );
                    end
               else If RGFaixaDados.ItemIndex=1
               then Informa('Este tipo de intervalo não é suportado neste comando!');
               end
          else if s_ImpFiscal = 'ECF Sweda'
          then begin
               S_NomeArqAssinar  := 'ATOCOTEPE_SWEDA.TXT.';
               If RGFaixaDados.ItemIndex=0
               then begin
                    retorno_imp_fiscal := ECF_ReproduzirMemoriaFiscalMFD(pchar('2'),
                                                                     pchar(S_DataI),
                                                                     pchar(S_DataF),
                                               pchar(S_DirDestino+S_NomeArqAssinar),
                                                      pchar(S_DirDestino+'mf.bin'));
                    end
               else if RGFaixaDados.ItemIndex=2
               then begin
                    //Obrigatório ter 7 digitos no COO para a função entender
                    S_COOI:=FormatFloat('#######00000000',StrToFloat(S_COOI));
                    S_COOF:=FormatFloat('#######00000000',StrToFloat(S_COOF));
                    retorno_imp_fiscal := ECF_ReproduzirMemoriaFiscalMFD(pchar('2'),
                                                                     pchar(S_COOI),
                                                                     pchar(S_COOF),
                                               pchar(S_DirDestino+S_NomeArqAssinar),
                                                      pchar(S_DirDestino+'mf.bin'));
                    end
               else if RGFaixaDados.ItemIndex=1
               then Informa('Este tipo de intervalo não é suportado neste comando!');
               end;

         Repaint;
         DC;
         Application.ProcessMessages;

         if retorno_imp_fiscal = 1
         then begin
              if FileExists(S_DirDestino+S_NomeArqAssinar)
              then begin
                   GerarEADArquivo(S_DirDestino+S_NomeArqAssinar);
                   EArquivo.Text:=S_DirDestino+S_NomeArqAssinar;
                   Informa('Arquivo gerado e criado com sucesso!!');
                   end
              else Informa('Não foi possivél encontrar o Arquivo '+S_DirDestino+S_NomeArqAssinar+
                           ' para fazer a assinatura Digital!!');
              end
         else Informa('Houve um problema ao Gerar o Arquivo MFD!');

         Analisa_iRetorno();
         Retorno_Impressora();

        Except
          Repaint;
          DC;
          InformaError('Função não Suportada pelo Modelo de ECF utilizado!');
          end;

         Finally
           FreeAndNil(FMSG);
           end;
       Repaint;
       end;
end;

procedure TFMenuFiscal.BtTabIndiceTecnicoClick(Sender: TObject);
begin
    Informa('Este Estabelecimento Comercializa Apenas Produto Final.');
end;

procedure TFMenuFiscal.BtVendasPeriodoClick(Sender: TObject);
begin
     EArquivo.Clear;
     FVendasPeriodo := TFVendasPeriodo.Create(Self);
     FVendasPeriodo.ShowModal;
     FreeAndNil(FVendasPeriodo); 
end;

end.
