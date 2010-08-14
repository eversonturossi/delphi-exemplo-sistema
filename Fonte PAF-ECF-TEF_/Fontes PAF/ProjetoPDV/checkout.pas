unit checkout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, Grids, DBGrids, DB, DBTables,
  RXCtrls, Mask,DBCtrls, RxGIF, Mylabel, DBXPress,
  EasyTEFDiscado, TiposTefDiscado, rxToolEdit, rxCurrEdit;

type
  Tfrmcheckout = class(TForm)
    editCodigo: TEdit;
    dsPDV: TDataSource;
    V: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RxLabel3: TRxLabel;
    Label4: TLabel;
    RxLabel21: TRxLabel;
    RxLabel16: TRxLabel;
    Label9: TLabel;
    LUsuario: TLabel;
    Label6: TLabel;
    Image1: TImage;
    Timer1: TTimer;
    LData_hORA: TLabel;
    Label7: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    ImageOF: TImage;
    ImageON: TImage;
    Timer2: TTimer;
    Panel1: TPanel;
    PItens: TPanel;
    RxCupom: TRxLabel;
    RxNumCupom: TRxLabel;
    Image3: TImage;
    EasyTEFDiscado: TEasyTEFDiscado;
    TFoco: TTimer;
    Panel2: TPanel;
    editSUBTOTAL: TCurrencyEdit;
    DBGridDescAcresc: TDBGrid;
    dsDescAcresc: TDataSource;
    DBGrid: TDBGrid;
    Panel3: TPanel;
    ed_unitario: TCurrencyEdit;
    Panel4: TPanel;
    ed_quantidade: TCurrencyEdit;
    PMensagem: TPanel;
    EFocuAuxiliar: TEdit;
    LTabela: TmyLabel3d;
    ENomeProduto: TmyLabel3d;
    TFechaTela: TTimer;
    procedure BitBtn4Click(Sender: TObject);
    procedure editCodigoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure editCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure editCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_quantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure ed_quantidadeExit(Sender: TObject);
    procedure ed_unitarioEnter(Sender: TObject);
    procedure editSUBTOTALEnter(Sender: TObject);
    procedure EditNomeProdutoEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure editCodigoChange(Sender: TObject);
    procedure editCodigoEnter(Sender: TObject);
    procedure ed_quantidadeEnter(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EasyTEFDiscadoGerarIdentificador(var identificacao: Integer);
    procedure EasyTEFDiscadoEncerrarCupomFiscal(Sender: TObject);
    procedure EasyTEFDiscadoFecharRelatorioGerencial(
      var operacaoECFOk: Boolean);
    procedure EasyTEFDiscadoImpressoraTemPapel(var operacaoECFOk: Boolean);
    procedure EasyTEFDiscadoImprimirLeituraX(var operacaoECFOk: Boolean);
    procedure EasyTEFDiscadoImprimirRelatorioGerencial(
      imagemCupomTef: TStrings; var impressaoOk: Boolean);
    procedure TFocoTimer(Sender: TObject);
    procedure EFocuAuxiliarEnter(Sender: TObject);
    procedure TFechaTelaTimer(Sender: TObject);
  private
    { Private declarations }
    vAchouProduto, Cupom_Ainda_Nao_Cancelado : Boolean;
    Num_Cupom_Cancelar : Integer;
    procedure Mostra(xMensagem:String);
    procedure Libera;
    procedure SomaItens;
    Function Verifica_produto : Boolean;
    function Consulta_Grade_Produto(xCodProduto : Integer):Boolean;
    function Consulta_Produto_Na_Grade : Boolean;
    procedure ExcluiItem;
    function Consulta_Cupom_Local : Boolean;
    procedure Cancela_Cupom_na_base_Local;
    procedure Cancela_Cupom_na_base_Remoto;
    procedure Cancela_Cupom_Fiscal;
    procedure Retorna_NUMCCF_Cupom;
    procedure Verifica_Leitura_Z_Pendente;
    procedure Consulta_Informacao_TEF_Banco;
    procedure AtivaComponenteTEF_Abertura;
    procedure Atualiza_Totalizadores_Parciais;
    procedure AtualizaArquivosLocais;
  public
    { Public declarations }
    vAtivaComponente_TEF_Abertura : Boolean;
    procedure ImprimiDAV(Sender: TObject);
  end;

var
  frmcheckout: Tfrmcheckout;
  nNumero_Cupom,  Int_Casas_Decimais, nItem_Cupom, nAbriu_Cupom,
  vCod_DAV, nCodigo_Reducao, nCodClienteDAV, nNumero_CCF_Cupom, nFlagDAV,
  nNumFlagDAV, vCod_DAV_Cancelado : Integer;
  nQuantidade,nSubTotal,vTotal,preco_venda,nValorItem,nDesconto_DAV : currency;
  sNumero_serie, sEmpresa, str_proximoCupom, Str_Codigo, Str_Descricao,
  Str_Aliquota, Str_Tipo_de_Quantidade, Str_Quantidade, Str_Valor_Unitario,
  Str_Tipo_de_Desconto, Str_Valor_do_Desconto, sQuantidade, sPrecoTabela,
  Str_Informacao, sTipo_ECF, sMarca_ECF, sModelo_ECF, sNum_Serie_ECF,
  sMF_Adicional, sVersao_SB, sNum_Caixa, sCod_Nacional_ECF, GrandeTotal, VendaBruta,
  sVendaBrutaDiaria, sCRZ, sCRO, sCST, sCliente_DAV, sData_HoraSB : String;
  nBuscou_DAV, nBuscou_Descricao, nBuscou_Codigo, nBuscando_DAV, Grava_Reducao : Boolean;

  //Variaveis para o cancelamento TEF
  nValorTotal : Currency;//Valor do Cartão
  sNome_Rede, sNum_Trans_NSU : String;
  dData_Trans, dHora_Trans : TDate;

  //Variaveis dos contadores de doc. emitidos
  COO, GNF, GRG, CDC, CCF : Integer;

  procedure Retorna_Informacao_Impressora;
  procedure Pega_NumSerie_Impressora;
  procedure GerarMovtoECF60M;
  procedure GerarITMovtoECF60A;
  procedure GerarITMovtoECF60A_Somente_Totalizadores;
  procedure GeraRelatorioTipo60M_e_60A(nGera60M, nGera60A : Integer; sFlag : String);
  function ObterContadoresImpressora: Boolean;
  function GravaDadosDocECF(fDenomina: String): Boolean;
  procedure NumeroCNIEE;
  procedure Imprimi_LeituraX;
  procedure Imprimi_LeituraX_Arquivo;
  procedure Retorna_VendaBrutaDiaria;
  procedure Retorna_GrandeTotal;
  procedure Atualiza_GrandeTotal;
  procedure Retorna_CRZ_CRO;
  procedure Verifica_E_Grava_Dados_UltimaReducaoZ(Flag : Integer);
  function GrandeTotal_NumeroSerie : Boolean;

implementation

uses dmsyndAC, UPAF_ECF, frmcancelaItem, frmconsultaprodutospdv, frmconfigimpfisc,
     frmprodutos1, u_fechamento_venda_TEF, frmsangriasuprimento, UBarsa,
     UAjudaPDV, lite_frmprincipal, UBuscaPreVenda, USelecionaPreco,
     UPesqClienteBalcao, UAlteraIten, DBClient, SqlExpr, UMenuFiscal,
     UComprovanteNaoFiscal, UDescAcresc_Item, UMsg, UConsulta_Grade;

{$R *.dfm}

function GrandeTotal_NumeroSerie : Boolean;
begin
     Result:=True;

     Retorna_GrandeTotal;
     Pega_NumSerie_Impressora;
     
     if retorno_imp_fiscal = 1
     then begin
          LeIniCrypt(SDir_Arq_PAF,'ECF','Grande Total',sCrypt_GrandeTotal,SNome_Arq_PAF);
          if ((Trim(GrandeTotal))<>(Trim(sCrypt_GrandeTotal)))
          then begin
               Result:=False;
               Informa('O Totalizador Geral do ECF, não coincide com o totalizador deste '+
                       'aplicativo. Contate o suporte técnico para regularizar esta cópia.');
               frmPrincipal.ChamaLiberacaoECF(True);//Ativa em modo de recompor G.T
               end;

          LeIniCrypt(SDir_Arq_PAF,'ECF','Numero Serie',sCrypt_NumSerie,SNome_Arq_PAF);
          if ((Trim(sNum_Serie_ECF))<>(Trim(sCrypt_NumSerie)))
          then begin
               Result:=False;
               Informa('Este ECF não esta autorizado a rodar com o este Aplicativo! Contate '+
                       'o suporte técnico do PAF-ECF para regularizar esta Cópia!'); 
               frmPrincipal.ChamaLiberacaoECF(False);//Ativa em modo de ativar novamente o ECF
               end;
          end;
end;

procedure Retorna_CRZ_CRO;
var
 ArqTXT         : TextFile;
 iCont          : integer;
 iPosTwoDot     : Integer;
 iTam           : Integer;
 linha,
 sGrandeTotalM  : String;
begin
     if FileExists('C:\Retorno.txt')
     then DeleteFile('C:\Retorno.txt');

     Sleep(1000);

     if s_ImpFiscal = 'ECF Daruma'
     then Retorno_imp_fiscal := Daruma_FI_RelatorioTipo60Mestre()
     else if s_ImpFiscal = 'ECF Bematech'
     then Retorno_imp_fiscal := Bematech_FI_RelatorioTipo60Mestre()
     else if s_ImpFiscal = 'ECF Elgin'
     then Retorno_imp_fiscal := Elgin_RegistrosTipo60()
     else if s_ImpFiscal = 'ECF Sweda'
     then Retorno_imp_fiscal := ECF_RelatorioTipo60Mestre();

     Analisa_iRetorno();

     if Retorno_imp_fiscal = 1
     then begin
           iCont      := 1;
           if FileExists('C:\RETORNO.txt')
           then begin
               Try
                AssignFile(ArqTXT,'C:\RETORNO.TXT');
                Reset(ArqTXT); {Abre o arquivo texto}
                While true
                do begin
                    while not eof (ArqTXT)
                    do begin
                        Readln(ArqTXT,linha);
                        iPosTwoDot  := Pos(':',linha);
                        iTam        := Length(linha);

                        if iCont = 9 then // Extrai o Contador de Redução.
                         begin
                          sCRZ  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
                          sCRZ  := RetiraArgumento(' ',sCRZ);
                         end
                        else if iCont = 10 then // Extrai o Reinício de Operação
                         begin
                          sCRO  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
                          sCRO  := RetiraArgumento(' ',sCRO);
                         end
                        else if iCont = 11 then // Extrai o Valor da Venda Bruta
                         begin
                          sVendaBrutaDiaria := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
                          sVendaBrutaDiaria := RetiraArgumento(' ',sVendaBrutaDiaria);
                          sVendaBrutaDiaria := RetiraArgumento('.',sVendaBrutaDiaria);
                         end
                        else if iCont = 12 then // Extrai o Grande Total
                         begin
                          sGrandeTotalM  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
                          sGrandeTotalM  := RetiraArgumento(' ',sGrandeTotalM);
                          sGrandeTotalM  := RetiraArgumento('.',sGrandeTotalM);
                         end;
                         Inc(iCont);
                       end;
                   break;
                 end;
             finally
              CloseFile(ArqTXT);
             end;

          if FileExists('C:\Retorno.txt')
          then DeleteFile('C:\Retorno.txt');
        end;
    end;
end;

procedure Retorna_VendaBrutaDiaria;
var
   iConta : Integer;
begin
     SetLength(VendaBruta,18);
     if s_ImpFiscal = 'ECF Daruma'
     then Retorno_imp_Fiscal := Daruma_FI_VendaBruta( VendaBruta )
     else if s_ImpFiscal = 'ECF Bematech'
     then begin
          for iConta := 1 to 18 do VendaBruta := VendaBruta + ' ';
          Retorno_imp_Fiscal := Bematech_FI_VendaBruta( VendaBruta );
          end
     else if s_ImpFiscal = 'ECF Elgin'
     then begin
          for iConta := 1 to 18 do VendaBruta := VendaBruta + ' ';
          Retorno_imp_Fiscal := Elgin_GrandeTotal( VendaBruta );
          end
     else if s_ImpFiscal = 'ECF Sweda'
     then begin
          for iConta := 1 to 18 do VendaBruta := VendaBruta + ' ';
          Retorno_imp_Fiscal := ECF_VendaBruta( Pchar( VendaBruta ) );
          end;

     Analisa_iRetorno();
     Retorno_Impressora();
end;

procedure Retorna_GrandeTotal;
var
   iConta : Integer;
begin
     SetLength(GrandeTotal,18);
     if s_ImpFiscal = 'ECF Daruma'
     then Retorno_imp_Fiscal := Daruma_FI_GrandeTotal( GrandeTotal )
     else if s_ImpFiscal = 'ECF Bematech'
     then begin
          for iConta := 1 to 18 do GrandeTotal := GrandeTotal + ' ';
          Retorno_imp_Fiscal := Bematech_FI_GrandeTotal( GrandeTotal );
          end
     else if s_ImpFiscal = 'ECF Elgin'
     then begin
          for iConta := 1 to 18 do GrandeTotal := GrandeTotal + ' ';
          Retorno_imp_Fiscal := Elgin_GrandeTotal( GrandeTotal );
          end
     else if s_ImpFiscal = 'ECF Sweda'
     then begin
          for iConta := 1 to 18 do GrandeTotal := GrandeTotal + ' ';
          Retorno_imp_Fiscal := ECF_GrandeTotal( Pchar( GrandeTotal ) );
          end;

     Analisa_iRetorno();
     //Retorno_Impressora();
end;

procedure Atualiza_GrandeTotal;
begin
     Retorna_GrandeTotal;
     if retorno_imp_fiscal = 1
     then GravaIniCrypt(SDir_Arq_PAF,'ECF','Grande Total',GrandeTotal,SNome_Arq_PAF);
end;

procedure Imprimi_LeituraX;
begin
      if s_ImpFiscal = 'ECF Daruma'
      then Retorno_imp_Fiscal := Daruma_FI_LeituraX()
      else if s_ImpFiscal = 'ECF Bematech'
      then Retorno_imp_Fiscal := Bematech_FI_LeituraX()
      else if s_ImpFiscal = 'ECF Elgin'
      then Retorno_imp_Fiscal := Elgin_LeituraX()
      else if s_ImpFiscal = 'ECF Sweda'
      then Retorno_imp_Fiscal := ECF_LeituraX();

      Analisa_iRetorno();
      Retorno_Impressora();
end;

procedure Imprimi_LeituraX_Arquivo;
begin
      if s_ImpFiscal = 'ECF Daruma'
      then Retorno_imp_Fiscal := Daruma_FI_LeituraXSerial()
      else if s_ImpFiscal = 'ECF Bematech'
      then Retorno_imp_Fiscal := Bematech_FI_LeituraXSerial()
      else if s_ImpFiscal = 'ECF Elgin'
      then Retorno_imp_Fiscal := Elgin_LeituraXSerial()
      else if s_ImpFiscal = 'ECF Sweda'
      then Retorno_imp_Fiscal := ECF_LeituraXSerial();

      Analisa_iRetorno();
      Retorno_Impressora();
end;

procedure NumeroCNIEE;
var
   Tipo, Marca, Modelo, Versao : ShortString;
begin
      Tipo:=Alltrim(PChar(sTipo_ECF));
      Marca:=Alltrim(PChar(sMarca_ECF));
      Modelo:=Alltrim(PChar(sModelo_ECF));
      Versao:=Alltrim(PChar(sVersao_SB));

      With DM.QPesquisaBaseLocal
      do begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT COD_MC,COD_MD,COD_VR,TIPO,MARCA,MODELO,VERSAO FROM CNI_ECF');
         Sql.Add('WHERE MARCA LIKE :PMARCA AND TIPO= :PTIPO AND MODELO= :PMODELO AND VERSAO= :PVERSAO');
         ParamByName('PMARCA').AsString:=Marca;
         ParamByName('PTIPO').AsString:=Tipo;
         ParamByName('PMODELO').AsString:=Modelo;
         ParamByName('PVERSAO').AsString:=Versao;
         Open;
         if not IsEmpty
         then sCod_Nacional_ECF:=FieldByName('COD_MC').AsString+
                                 FieldByName('COD_MD').AsString+
                                 FieldByName('COD_VR').AsString
         else sCod_Nacional_ECF:='000000';//Não encontrou o Código
         end;
end;

procedure Retorna_Informacao_Impressora;
var
   MFAdicional : Char;
   Str_Indice, Str_Valor, dataUsuario, dataSWBasico, HoraSW,
   Data, Hora  : String;
   Int_Tamanho, iConta : Integer;
begin
   sTipo_ECF:='';sMarca_ECF:='';sModelo_ECF:='';
   sNum_Serie_ECF:='';sMF_Adicional:='';sVersao_SB:='';sCod_Nacional_ECF:='';

   if s_ImpFiscal = 'ECF Daruma'
   then begin
        //Retorna Data/Hora Software Basico
        Int_Tamanho := 14 + 1;
        Str_Indice := '85';
        setlength( Str_valor, Int_Tamanho);
        retorno_imp_fiscal:=Daruma_FIMFD_RetornaInformacao( Str_Indice, Str_Valor );
        sData_HoraSB:=Str_Valor;

        //Retorna Nº de Fabricação do ECF
        Int_Tamanho := 20 + 1;
        Str_Indice := '78';
        setlength( Str_valor, Int_Tamanho);
        retorno_imp_fiscal:=Daruma_FIMFD_RetornaInformacao( Str_Indice, Str_Valor );
        sNum_Serie_ECF:=Str_Valor;
        sMF_Adicional:=Copy(sNum_Serie_ECF,21,1);

        //Retorna o Tipo do ECF
        Int_Tamanho := 7 + 1;
        Str_Indice := '79';
        setlength( Str_valor, Int_Tamanho);
        retorno_imp_fiscal:=Daruma_FIMFD_RetornaInformacao( Str_Indice, Str_Valor );
        sTipo_ECF:=Str_Valor;

        //Retorna a Marca ECF
        Int_Tamanho := 20 + 1;
        Str_Indice := '80';
        setlength( Str_valor, Int_Tamanho);
        retorno_imp_fiscal:=Daruma_FIMFD_RetornaInformacao( Str_Indice, Str_Valor );
        sMarca_ECF:=Str_Valor;

        //Retorna o Modelo ECF
        Int_Tamanho := 20 + 1;
        Str_Indice := '81';
        setlength( Str_valor, Int_Tamanho);
        retorno_imp_fiscal:=Daruma_FIMFD_RetornaInformacao( Str_Indice, Str_Valor );
        sModelo_ECF:=Str_Valor;

        //Retorna Versao Software Básico do ECF Gravada na MF
        SetLength(sVersao_SB,10);  
        retorno_imp_fiscal := Daruma_FI_RetornarVersaoDLL( sVersao_SB );

        //Retorna Numero do Caixa (Sequência do ECF)
        SetLength (sNum_Caixa,4);
        retorno_imp_fiscal := Daruma_FI_NumeroCaixa(sNum_Caixa);

        //Código Modelo Nacional
        SetLength (sCod_Nacional_ECF,6);
        retorno_imp_fiscal := Daruma_FIMFD_CodigoModeloFiscal(sCod_Nacional_ECF);
        end
   else if s_ImpFiscal = 'ECF Bematech'
   then begin
        //Retorna Nº de Fabricação do ECF
        for iConta := 1 to 20 do sNum_Serie_ECF := sNum_Serie_ECF + ' ';
        retorno_imp_fiscal := Bematech_FI_NumeroSerieMFD( sNum_Serie_ECF );

        //Retorna MF adicional da impressora
        SetLength( dataUsuario, 20 );
        SetLength( dataSWBasico, 20 );
        MFAdicional := ' ';
        retorno_imp_fiscal := Bematech_FI_DataHoraGravacaoUsuarioSWBasicoMFAdicional
                                    ( dataUsuario, dataSWBasico, MFAdicional );
        sMF_Adicional:=MFAdicional;
        sData_HoraSB:=dataSWBasico;

        //Retorna a marca, o modelo e o tipo da impressora.
        for iConta := 1 to 15 do sMarca_ECF  := sMarca_ECF  + ' ';
        for iConta := 1 to 20 do sModelo_ECF := sModelo_ECF + ' ';
        for iConta := 1 to 7  do sTipo_ECF   := sTipo_ECF   + ' ';
        retorno_imp_fiscal := Bematech_FI_MarcaModeloTipoImpressoraMFD( sMarca_ECF, sModelo_ECF, sTipo_ECF );

        //Retorna Versao Software Básico do ECF Gravada na MF
        for iConta := 1 to 9 do sVersao_SB := sVersao_SB + ' ';
        retorno_imp_fiscal := Bematech_FI_VersaoDll( sVersao_SB );

        //Retorna Numero do Caixa (Sequência do ECF)
        for iConta := 1 to 4 do sNum_Caixa := sNum_Caixa + ' ';
        retorno_imp_fiscal := Bematech_FI_NumeroCaixa( sNum_Caixa );

        //Codigo Modelo Nacional
        NumeroCNIEE;
        end
   else if s_ImpFiscal = 'ECF Elgin'
   then begin
        //Retorna Nº de Fabricação do ECF
        for iConta := 1 to 20 do sNum_Serie_ECF := sNum_Serie_ECF + ' ';
        retorno_imp_fiscal := Elgin_NumeroSerie(sNum_Serie_ECF);

        //Retorna a marca, o modelo e o tipo da impressora.
        for iConta := 1 to 15 do sMarca_ECF  := sMarca_ECF  + ' ';
        for iConta := 1 to 20 do sModelo_ECF := sModelo_ECF + ' ';
        for iConta := 1 to 7  do sTipo_ECF   := sTipo_ECF   + ' ';
        retorno_imp_fiscal := Elgin_MarcaModeloTipoImpressoraMFD( sMarca_ECF, sModelo_ECF, sTipo_ECF );

        //Retorna MF adicional da impressora
        // ????????????????????????????????? Não existe esta função

        //Retorna Versao Software Básico do ECF Gravada na MF
        for iConta := 1 to 9 do sVersao_SB := sVersao_SB + ' ';
        retorno_imp_fiscal := Elgin_VersaoFirmware( sVersao_SB );

        //Retorna Numero do Caixa (Sequência do ECF)
        for iConta := 1 to 4 do sNum_Caixa := sNum_Caixa + ' ';
        retorno_imp_fiscal := Elgin_NumeroCaixa( sNum_Caixa );

        //Retorna data/hora Software basico                   
        for iConta := 1 to 6 do Data := Data + ' '; 
        for iConta := 1 to 6 do Hora := Hora + ' ';
        retorno_imp_fiscal := Elgin_DataHoraSoftwareBasico( DataSWBasico, HoraSW );
        sData_HoraSB:=dataSWBasico+HoraSW;

        //Código Modelo Nacional
        sCod_Nacional_ECF := StringOfChar(' ',6);
        retorno_imp_fiscal := Elgin_LeCodigoNacionalIdentificacaoECF( sCod_Nacional_ECF );
        end
   else if s_ImpFiscal = 'ECF Sweda'
   then begin
        //Retorna Nº de Fabricação do ECF
        for iConta := 1 to 20 do sNum_Serie_ECF := sNum_Serie_ECF + ' ';
        retorno_imp_fiscal := ECF_NumeroSerieMFD( Pchar(sNum_Serie_ECF) );

        //Retorna a marca, o modelo e o tipo da impressora.
        for iConta := 1 to 15 do sMarca_ECF  := sMarca_ECF  + ' ';
        for iConta := 1 to 20 do sModelo_ECF := sModelo_ECF + ' ';
        for iConta := 1 to 7  do sTipo_ECF   := sTipo_ECF   + ' ';
        retorno_imp_fiscal := ECF_MarcaModeloTipoImpressoraMFD( Pchar(sMarca_ECF), PChar(sModelo_ECF), PChar(sTipo_ECF) );

        //Retorna MF adicional da impressora
        SetLength(dataUsuario, 20 );
        SetLength(dataSWBasico, 20 );
        SetLength(sMF_Adicional, 5 );
        retorno_imp_fiscal := ECF_DataHoraGravacaoUsuarioSWBasicoMFAdicional
                                (Pchar(dataUsuario),PChar(dataSWBasico),PChar(sMF_Adicional));
        sData_HoraSB:=dataSWBasico;                        

        //Retorna Versao Software Básico do ECF Gravada na MF
        for iConta := 1 to 9 do sVersao_SB := sVersao_SB + ' ';
        retorno_imp_fiscal := ECF_VersaoDLL( Pchar(sVersao_SB) );

        //Retorna Numero do Caixa (Sequência do ECF)
        for iConta := 1 to 4 do sNum_Caixa := sNum_Caixa + ' ';
        retorno_imp_fiscal := ECF_NumeroCaixa( PChar(sNum_Caixa) );

        //Codigo Modelo Nacional
        NumeroCNIEE;
        end;

    Analisa_iRetorno();
    //Retorno_Impressora();
end;

procedure TfrmCheckOut.Verifica_Leitura_Z_Pendente;
var
   iFlag, iRetorno : Integer;
   sFlag : String;
begin
     //Retorna se a ReduçãoZ está pendente.
     //1(um) para ReduçãoZ Pendente e 0(zero) para ReduçãoZ já executada.

     iFlag:=0;
     SetLength (sFlag,2);

     if s_ImpFiscal = 'ECF Daruma'
     then begin
          Retorno_imp_Fiscal := Daruma_FI_VerificaZPendente( sFlag );
          iRetorno:=StrToInt(sFlag);
          end
     else if s_ImpFiscal = 'ECF Bematech'
     then begin
          Retorno_imp_Fiscal := Bematech_FI_VerificaReducaoZAutomatica( iFlag );
          iRetorno:=iFlag;
          end
     else if s_ImpFiscal = 'ECF Elgin'
     then begin
          Retorno_imp_Fiscal := Elgin_VerificaZPendente( iFlag );
          iRetorno:=iFlag;
          end
     else if s_ImpFiscal = 'ECF Sweda'
     then begin
          Retorno_imp_Fiscal := ECF_VerificaZPendente( Pchar( sFlag ) );
          iRetorno:=StrToInt(sFlag);
          end;

     if iRetorno = 1
     then Informa('Existe Redução Z Pendente na Impressora Fiscal!!!');
end;

procedure TfrmCheckOut.Cancela_Cupom_Fiscal;
begin
     if s_ImpFiscal = 'ECF Daruma'
     then begin
          Retorno_imp_Fiscal:= Daruma_FI_CancelaCupom();
          end
     else if s_ImpFiscal = 'ECF Bematech'
     then begin
          Retorno_imp_Fiscal := Bematech_FI_EstornoNaoFiscalVinculadoMFD( pchar( '' ), pchar( '' ), pchar( '' ) );
          Retorno_imp_Fiscal := Bematech_FI_FechaComprovanteNaoFiscalVinculado;
          Retorno_imp_Fiscal := Bematech_FI_CancelaCupom();
          end
     else if s_ImpFiscal = 'ECF Elgin'
     then begin
          Retorno_imp_Fiscal := Elgin_EstornoNaoFiscalVinculadoMFD( Pchar( '' ), Pchar( '' ), Pchar( '' ) );
          Retorno_imp_Fiscal := Elgin_FechaComprovanteNaoFiscalVinculado;
          Retorno_imp_Fiscal := Elgin_CancelaCupom();
          end
     else if s_ImpFiscal = 'ECF Sweda'
     then begin
          Retorno_imp_Fiscal := ECF_EstornoNaoFiscalVinculadoMFD(Pchar( '' ),Pchar( '' ),Pchar( '' ));
          Retorno_imp_Fiscal := ECF_FechaComprovanteNaoFiscalVinculado;
          Retorno_imp_Fiscal := ECF_CancelaCupom();
          end;
     Analisa_iRetorno();
end;

procedure TfrmCheckOut.Retorna_NUMCCF_Cupom;
var
   Str_Indice, Str_Valor : String;
   Int_Tamanho, iConta : Integer;
begin
   nNumero_CCF_Cupom:=0;
   if s_ImpFiscal = 'ECF Daruma'
   then begin
        Int_Tamanho := 6 + 1;
        Str_Indice := '30';
        setlength( Str_valor, Int_Tamanho);

        retorno_imp_fiscal:=Daruma_FIMFD_RetornaInformacao( Str_Indice, Str_Valor );
        end
    else if s_ImpFiscal = 'ECF Bematech'
    then begin
         for iConta := 1 to 6 do Str_Valor := Str_Valor + ' ';
         retorno_imp_fiscal := Bematech_FI_ContadorCupomFiscalMFD( Str_Valor );
         end
    else if s_ImpFiscal = 'ECF Elgin'
    then begin
         for iConta := 1 to 6 do Str_Valor := Str_Valor + ' ';
         retorno_imp_fiscal := Elgin_ContadorCupomFiscalMFD( Str_Valor );
         end
    else if s_ImpFiscal = 'ECF Sweda'
    then begin
         for iConta := 1 to 6 do Str_Valor := Str_Valor + ' ';
         retorno_imp_fiscal := ECF_ContadorCupomFiscalMFD( Pchar( Str_Valor ) );
         end;
    nNumero_CCF_Cupom:=StrToInt(Str_Valor)+1;

    Analisa_iRetorno();
    //Retorno_Impressora();
end;

procedure Pega_NumSerie_Impressora;
var
   iConta, int_Tamanho : Integer;
   Str_Indice, Str_Valor : String;
begin
     if s_ImpFiscal = 'ECF Daruma'
     then begin
          SetLength (sNumero_serie,15);
          retorno_imp_fiscal:= Daruma_FI_NumeroSerie(sNumero_serie);

          //Retorna Nº de Fabricação do ECF
          Int_Tamanho := 20 + 1;
          Str_Indice := '78';
          setlength( Str_valor, Int_Tamanho);
          retorno_imp_fiscal:=Daruma_FIMFD_RetornaInformacao( Str_Indice, Str_Valor );
          sNum_Serie_ECF:=Str_Valor;
          end
     else if s_ImpFiscal = 'ECF Bematech'
     then begin
          for iConta := 1 to 15 do sNumero_Serie := sNumero_Serie + ' ';
          retorno_imp_fiscal := Bematech_FI_NumeroSerieMFD( sNumero_Serie );
          end
     else if s_ImpFiscal = 'ECF Elgin'
     then begin
          for iConta := 1 to 20 do sNumero_Serie := sNumero_Serie + ' ';
          retorno_imp_fiscal := Elgin_NumeroSerie(sNumero_Serie);
          end
     else if s_ImpFiscal = 'ECF Sweda'
     then begin
          for iConta := 1 to 15 do sNumero_Serie := sNumero_Serie + ' ';
          retorno_imp_fiscal := ECF_NumeroSerie(PChar(sNumero_serie));
          end;
     //Analisa_iRetorno();     
end;

procedure TfrmCheckOut.AtivaComponenteTEF_Abertura;
var
   Gerenciador_Estava_Ativo : Boolean;
begin
     if FrmPrincipal.Tef_Utilizado='Discado'
     then begin
          Mostra('Verificando transações TEF pendente. Aguarde!');

          if FrmPrincipal.Gerenciador_Padrao='Banrisul'
          then EasyTEFDiscado.gerenciador:=tgBanrisul
          else if FrmPrincipal.Gerenciador_Padrao='Gerenciador Padrão'
          then EasyTEFDiscado.gerenciador:=tgGerenciadorPadrao
          else if FrmPrincipal.Gerenciador_Padrao='Hipercard'
          then EasyTEFDiscado.gerenciador:=tgHipercard
          else if FrmPrincipal.Gerenciador_Padrao='PayGo'
          then EasyTEFDiscado.gerenciador:=tgPayGo
          else if FrmPrincipal.Gerenciador_Padrao='TecBan'
          then EasyTEFDiscado.gerenciador:=tgTecBan;

          Gerenciador_Estava_Ativo:=EasyTEFDiscado.gerenciadorAtivo;
          EasyTEFDiscado.autoAtivarGerenciador:=True;
          EasyTEFDiscado.autoVerificarTEF:=True;

          if not Gerenciador_Estava_Ativo
          then TFoco.Enabled:=True;

          vAtivaComponente_TEF_Abertura:=False;

          Libera;
          end;
end;          

//Esta rotina irei homologar na prõxima versão do sistema com multiplos cartões
procedure TfrmCheckOut.Consulta_Informacao_TEF_Banco;
var
   Num_Cupom_Consulta : Integer;
begin
     With DM.QPesquisaBaseLocal
     do begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT MAX(NUMERO_CUPOM),NUMERO_ECF FROM VENDA');
        Sql.Add('WHERE NUMERO_ECF=:PNUMERO_ECF');
        Sql.add('GROUP BY NUMERO_ECF');
        ParamByName('PNUMERO_ECF').AsString:=Trim(sNumero_serie);
        Open;
        end;
        if not DM.QPesquisaBaseLocal.IsEmpty
        then begin
              Num_Cupom_Consulta:=DM.QPesquisaBaseLocal.FieldByName('MAX').AsInteger;
              With DM.QPesquisaBaseLocal
              do begin
                 Close;
                 Sql.Clear;
                 Sql.Add('SELECT CODIGO,NUMERO_CUPOM,NUMERO_ECF,CARTAO,NOME_REDE_TEF,'+
                         'NUM_TRANS_NSU_TEF,DATA_TRANS_TEF,HORA_TRANS_TEF FROM VENDA');
                 Sql.Add('WHERE NUMERO_CUPOM=:PNUMERO_CUPOM');
                 Sql.Add('AND NUMERO_ECF=:PNUMERO_ECF');
                 ParamByName('PNUMERO_CUPOM').AsInteger:=Num_Cupom_Consulta;
                 ParamByName('PNUMERO_ECF').AsString:=Trim(sNumero_serie);
                 Open;

                 DM.TVendaLocal.Close;
                 DM.TVendaLocal.Params[0].AsInteger:=DM.QPesquisaBaseLocal.FieldByName('CODIGO').AsInteger;
                 DM.TVendaLocal.Open;
                 if DM.TVendaLocalCUPOM_CANCELADO.AsString='N'
                 then begin
                      nValorTotal:=FieldByName('CARTAO').Value;
                      sNome_Rede:=FieldByName('NOME_REDE_TEF').Value;
                      sNum_Trans_NSU:=FieldByName('NUM_TRANS_NSU_TEF').Value;
                      dData_Trans:=FieldByName('DATA_TRANS_TEF').AsDateTime;
                      dHora_Trans:=FieldByName('HORA_TRANS_TEF').AsDateTime;
                      end
                 else begin//O Ultimo cupom já foi cancelado
                      sNum_Trans_NSU:='';
                      nValorTotal:=0;
                      sNome_Rede:='';
                      dData_Trans:=0;
                      dHora_Trans:=0;
                      end;
                 end;
        end;
end;

function TfrmCheckOut.Consulta_Cupom_Local : Boolean;
begin
     Result:=True;
     With DM.QPesquisaBaseLocal//Cancela da Base Local
     do begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT MAX(NUMERO_CUPOM),NUMERO_ECF FROM VENDA');
        Sql.Add('WHERE NUMERO_ECF=:PNUMERO_ECF');
        Sql.add('GROUP BY NUMERO_ECF');
        ParamByName('PNUMERO_ECF').AsString:=Trim(sNumero_serie);
        Open;
        end;
        if not DM.QPesquisaBaseLocal.IsEmpty
        then begin
              Num_Cupom_Cancelar:=DM.QPesquisaBaseLocal.FieldByName('MAX').AsInteger;
              With DM.QPesquisaBaseLocal
              do begin
                 Close;
                 Sql.Clear;
                 Sql.Add('SELECT CODIGO,NUMERO_CUPOM,NUMERO_ECF FROM VENDA');
                 Sql.Add('WHERE NUMERO_CUPOM=:PNUMERO_CUPOM');
                 Sql.Add('AND NUMERO_ECF=:PNUMERO_ECF');
                 ParamByName('PNUMERO_CUPOM').AsInteger:=Num_Cupom_Cancelar;
                 ParamByName('PNUMERO_ECF').AsString:=Trim(sNumero_serie);
                 Open;
                 end;
        DM.TVendaLocal.Close;
        DM.TVendaLocal.Params[0].AsInteger:=DM.QPesquisaBaseLocal.FieldByName('CODIGO').AsInteger;
        DM.TVendaLocal.Open;
        if DM.TVendaLocal.RecordCount > 0
        then begin
              if DM.TVendaLocalCOD_DAV.AsInteger > 0
              then begin
                   if ServidorRemoto='OF'
                   then Result:=False
                   else Result:=True;
                   end
              else Result:=True;
              end
        else Result:=True;
      end;
end;

procedure TfrmCheckOut.Cancela_Cupom_na_base_Local;
begin
     Try
      if DM.TVendaLocalCUPOM_CANCELADO.AsString='N'
      then begin
           TD.TransactionId := 1;
           TD.IsolationLevel := xilREADCOMMITTED;
           if not DM.SQLConnectionLocal.InTransaction
           then DM.SQLConnectionLocal.StartTransaction(TD);

           DM.TVendaLocal.Edit;
           DM.TVendaLocalCUPOM_CANCELADO.AsString:='S';
           DM.TVendaLocal.Post;
           DM.TVendaLocal.ApplyUpdates(-1);
           vCod_DAV_Cancelado:=DM.TVendaLocalCOD_DAV.Value;
           Cupom_Ainda_Nao_Cancelado:=True;
           end
      else begin
           Cupom_Ainda_Nao_Cancelado:=False;
           Informa('O Último Cupom Fiscal já foi Cancelado no banco de dados Local!');
           end;
     if (FrmPrincipal.BaixaEstoque='S')and(Cupom_Ainda_Nao_Cancelado=True)
     then begin
          DM.TItemVendaLocal.First;
          While not DM.TItemVendaLocal.Eof
          do begin
              DM.TBaixaEstoqueLocal.Close;
              DM.TBaixaEstoqueLocal.Params[0].AsInteger:=DM.TItemVendaLocalCOD_PRODUTO.AsInteger;
              DM.TBaixaEstoqueLocal.Open;
              if not DM.TBaixaEstoqueLocal.IsEmpty
              then begin
                   DM.TBaixaEstoqueLocal.Edit;
                   DM.TBaixaEstoqueLocalQTDE.AsFloat:=DM.TBaixaEstoqueLocalQTDE.AsFloat+DM.TItemVendaLocalQUANTIDADE.AsFloat;
                   DM.TBaixaEstoqueLocal.Post;
                   DM.TBaixaEstoqueLocal.ApplyUpdates(-1);
                   end;
              DM.TItemVendaLocal.Next;
              end;
          //Retorna quantidades para grade
          With DM.QPesquisaBaseLocal
          do begin
             Close;
             Sql.Clear;
             Sql.Add('SELECT COD_GRADE,COD_VENDA,QTDE FROM VENDA_GRADE');
             Sql.Add('WHERE COD_VENDA=:PCODVENDA');
             ParamByName('PCODVENDA').AsInteger:=DM.TVendaLocalCODIGO.AsInteger;
             Open;
             While not Eof
             do begin
                DM.TBaixaGradeLocal.Close;
                DM.TBaixaGradeLocal.Params[0].AsInteger:=FieldByName('COD_GRADE').Value;
                DM.TBaixaGradeLocal.Open;
                DM.TBaixaGradeLocal.Edit;
                DM.TBaixaGradeLocalQTDE.AsCurrency:=DM.TBaixaGradeLocalQTDE.AsCurrency + FieldByName('QTDE').Value;
                DM.TBaixaGradeLocal.Post;
                DM.TBaixaGradeLocal.ApplyUpdates(-1);
                Next;
                end;
             end;
         end;

       if DM.SQLConnectionLocal.InTransaction
       then DM.SQLConnectionLocal.Commit(TD);
    Except
       on E: exception
       do begin
          if DM.SQLConnectionLocal.InTransaction
          then DM.SQLConnectionLocal.RollBack(TD);

          InformaError('Não possivél cancelar no Banco de dados Local!');
          InformaError('Erro Interno: '+Uppercase(E.Message));
          raise;
          end;
      end;
end;

procedure TfrmCheckOut.Cancela_Cupom_na_base_Remoto;
var
   sImprimiu_Atraves_DAV : Boolean;
begin
      With DM.QPesquisaBaseRemota
      do begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT CODVENDA,NUMERO_CUPOM,NUMERO_ECF FROM VENDA');
         Sql.Add('WHERE NUMERO_CUPOM=:PNUMERO_CUPOM');
         Sql.Add('AND NUMERO_ECF=:PNUMERO_ECF');
         ParamByName('PNUMERO_CUPOM').AsInteger:=Num_Cupom_Cancelar;
         ParamByName('PNUMERO_ECF').AsString:=Trim(sNumero_serie);
         Open;
         end;
      if not DM.QPesquisaBaseRemota.IsEmpty
      then begin
          Try
            DM.TVenda.Close;
            DM.TVenda.Params[0].AsInteger:=DM.QPesquisaBaseRemota.FieldByName('CODVENDA').AsInteger;
            DM.TVenda.Open;
            if DM.TVendaCANCELADO.AsString='N'
            then begin
                 TD.TransactionId := 1;
                 TD.IsolationLevel := xilREADCOMMITTED;
                 if not DM.SQLConnectionRetaguarda.InTransaction
                 then DM.SQLConnectionRetaguarda.StartTransaction(TD);

                 if DM.TVendaIMPRIMIU_COO_ATRAVES_DAV.Value<>'S'
                 then sImprimiu_Atraves_DAV:=False
                 else sImprimiu_Atraves_DAV:=True;

                 if not sImprimiu_Atraves_DAV
                 then begin
                      DM.TVenda.Edit;
                      DM.TVendaCANCELADO.AsString:='S';
                      DM.TVenda.Post;

                      if (FrmPrincipal.BaixaEstoque='S')
                      then begin
                           DM.TItemVenda.First;
                           While not DM.TItemVenda.Eof
                           do begin
                               DM.TProduto.Close;
                               DM.TProduto.Params[0].AsInteger:=DM.TItemVendaCODPRODUTO.AsInteger;
                               DM.TProduto.Open;
                               if not DM.TProduto.IsEmpty
                               then begin
                                    DM.TProduto.Edit;
                                    DM.TProdutoQTDE.AsFloat:=DM.TProdutoQTDE.AsFloat+DM.TItemVendaQTDE.AsFloat;
                                    DM.TProduto.Post;
                                    DM.TProduto.ApplyUpdates(-1);
                                    end;
                               DM.TItemVenda.Edit;
                               DM.TItemVendaCANCELADO.AsString:='S';
                               DM.TItemVenda.Post;
                               DM.TItemVenda.Next;
                               end;
                           //Retorna quantidades para grade
                           With DM.QPesquisa
                           do begin
                              Close;
                              Sql.Clear;
                              Sql.Add('SELECT COD_GRADE,COD_VENDA,QTDE FROM VENDA_GRADE');
                              Sql.Add('WHERE COD_VENDA=:PCODVENDA');
                              ParamByName('PCODVENDA').AsInteger:=DM.TVendaCODVENDA.AsInteger;
                              Open;
                              While not Eof
                              do begin
                                 DM.TBaixaGrade.Close;
                                 DM.TBaixaGrade.Params[0].AsInteger:=FieldByName('COD_GRADE').Value;
                                 DM.TBaixaGrade.Open;
                                 DM.TBaixaGrade.Edit;
                                 DM.TBaixaGradeQTDE.AsCurrency:=DM.TBaixaGradeQTDE.AsCurrency + FieldByName('QTDE').Value;
                                 DM.TBaixaGrade.Post;
                                 DM.TBaixaGrade.ApplyUpdates(-1);
                                 Next;
                                 end;
                              end;
                           end
                      else begin
                           DM.TItemVenda.First;
                           While not DM.TItemVenda.Eof
                           do begin
                              DM.TItemVenda.Edit;
                              DM.TItemVendaCANCELADO.AsString:='S';
                              DM.TItemVenda.Post;
                              DM.TItemVenda.Next;
                              end;
                           end;
                      end
                 else if DM.TVendaIMPRIMIU_COO_ATRAVES_DAV.Value='S'
                 then begin
                      DM.TVenda.Edit;
                      DM.TVendaNUMERO_ECF.Clear;
                      DM.TVendaNUMERO_CUPOM.Clear;
                      DM.TVendaNUM_CCF_CUPOM.Clear;
                      DM.TVendaCOD_OPERADOR_PDV.Clear;
                      DM.TVendaPDV.Clear;
                      DM.TVendaCODIGO_VENDA_PDV.Clear;
                      DM.TVendaIMPRIMIU_COO_ATRAVES_DAV.Clear;
                      DM.TVenda.Post;
                      end;
                 DM.TVenda.ApplyUpdates(-1);

                 if vCod_DAV_Cancelado > 0
                 then begin
                      DM.TOrcDAV.Close;
                      DM.TOrcDAV.Params[0].AsInteger:=vCod_DAV_Cancelado;
                      DM.TOrcDAV.Open;
                      if DM.TOrcDAV.RecordCount > 0
                      then begin
                           DM.TOrcDAV.Edit;
                           DM.TOrcDAVSITUACAO.Value:='A';
                           DM.TOrcDAVNUMERO_CUPOM.Clear;
                           DM.TOrcDAVNUMERO_SERIE_ECF.Clear;
                           DM.TOrcDAVNUMERO_CAIXA.Clear;
                           DM.TOrcDAV.Post;
                           DM.TOrcDAV.ApplyUpdates(-1);
                           end;
                      end;

                 if not sImprimiu_Atraves_DAV
                 then begin
                       With DM.QCancelaFinanceiro
                       do begin
                          Close;
                          Sql.Clear;
                          Sql.Add('SELECT CODIGO,CODVENDA FROM RECEBER');
                          Sql.Add('WHERE CODVENDA=:PCODVENDA');
                          ParamByName('PCODVENDA').AsInteger:=DM.TVendaCODVENDA.AsInteger;
                          Open;
                          if not IsEmpty
                          then begin
                               While not Eof
                               do begin
                                  DM.TReceber.Close;
                                  DM.TReceber.Params[0].AsInteger:=FieldByName('CODIGO').Value;
                                  DM.TReceber.Open;
                                  DM.TReceber.Delete;
                                  DM.TReceber.ApplyUpdates(-1);
                                  Next;
                                  end;
                               end;
                          end;

                       With DM.QCancelaFinanceiro
                       do begin
                          Close;
                          Sql.Clear;
                          Sql.Add('SELECT CODIGO,CODVENDA FROM CLICHEQUEABAIXAR');
                          Sql.Add('WHERE CODVENDA=:PCODVENDA');
                          ParamByName('PCODVENDA').AsInteger:=DM.TVendaCODVENDA.AsInteger;
                          Open;
                          if not IsEmpty
                          then begin
                               While not Eof
                               do begin
                                  DM.TChequeBaixar.Close;
                                  DM.TChequeBaixar.Params[0].AsInteger:=FieldByName('CODIGO').Value;
                                  DM.TChequeBaixar.Open;
                                  DM.TChequeBaixar.Delete;
                                  DM.TChequeBaixar.ApplyUpdates(-1);
                                  Next;
                                  end;
                               end;
                          end;

                       With DM.QCancelaFinanceiro
                       do begin
                          Close;
                          Sql.Clear;
                          Sql.Add('SELECT CODIGO,CODVENDA FROM CAIXA');
                          Sql.Add('WHERE CODVENDA=:PCODVENDA');
                          ParamByName('PCODVENDA').AsInteger:=DM.TVendaCODVENDA.AsInteger;
                          Open;
                          if not IsEmpty
                          then begin
                               While not Eof
                               do begin
                                  DM.TCaixa.Close;
                                  DM.TCaixa.Params[0].AsInteger:=FieldByName('CODIGO').Value;
                                  DM.TCaixa.Open;
                                  DM.TCaixa.Delete;
                                  DM.TCaixa.ApplyUpdates(-1);
                                  Next;
                                  end;
                               end;
                          end;     
                    end;
                 Cupom_Ainda_Nao_Cancelado:=True;
                 end
            else begin
                 Cupom_Ainda_Nao_Cancelado:=False;
                 Informa('O Último Cupom Fiscal já foi Cancelado no Banco de dados Remoto!');
                 end;

             if DM.SQLConnectionRetaguarda.InTransaction
             then DM.SQLConnectionRetaguarda.Commit(TD);
          Except
             on E: exception
             do begin
                if DM.SQLConnectionRetaguarda.InTransaction
                then DM.SQLConnectionRetaguarda.RollBack(TD);

                InformaError('Não possivél cancelar no Banco de dados Remoto!');
                InformaError('Erro Interno: '+Uppercase(E.Message));
                raise;
                end;
          end;
     end;
end;

procedure TfrmCheckOut.ImprimiDAV(Sender: TObject);
var
   Iten : Integer;
begin
      AC;
      Try
        DM.TBuscaItemDAV.First;
        While not DM.TBuscaItemDAV.Eof
        do begin
           nBuscou_Codigo:=False;
           nBuscando_DAV:=True;
           ed_Unitario.Value:=DM.TBuscaItemDAVPRECO.AsCurrency;
           ed_quantidade.Value:=DM.TBuscaItemDAVQTDE.AsCurrency;
           editCodigo.Text:=IntToStr(DM.TBuscaItemDAVCODPRODUTO.AsInteger);

           if DM.TBuscaGradeDAV.RecordCount > 0
           then begin
                While not DM.TBuscaGradeDAV.Eof
                do begin
                    if DM.TPDVGrade.Active=False
                    then begin
                         DM.TPDVGrade.CreateDataSet;
                         DM.TPDVGrade.Open;
                         end;
                    if DM.TPDV.Active
                    then begin
                         DM.TPDV.Last;
                         Iten:=DM.TPDVITEN.Value + 1;
                         end
                    else Iten:=1;
                    DM.TPDVGrade.Append;
                    DM.TPDVGradeITEN.Value:=Iten;
                    DM.TPDVGradeCOD_PRODUTO.Value:=DM.TBuscaGradeDAVCOD_PRODUTO.Value;
                    DM.TPDVGradeCOD_GRADE.Value:=DM.TBuscaGradeDAVCOD_GRADE.Value;
                    DM.TPDVGradeQTDE.Value:=DM.TBuscaGradeDAVQTDE.AsFloat;
                    DM.TPDVGradeCOD_COR.Value:=DM.TBuscaGradeDAVCOD_COR.Value;
                    DM.TPDVGradeCOD_TAMANHO.Value:=DM.TBuscaGradeDAVCOD_TAMANHO.Value;
                    DM.TPDVGrade.Post;

                    DM.TBuscaGradeDAV.Next
                    end;
                 end;

           DM.TBuscaItemDAV.Next;

           editCodigoExit(Sender);

           editCodigo.Refresh;
           ed_quantidade.Refresh;
           ed_Unitario.Refresh;

           Application.ProcessMessages;
           end;
      Except
         on E: exception
         do begin
            DC;
            nBuscou_DAV:=False;
            FBuscaDAV.Close;
            FBuscaDAV.Visible:=True;
            Informa('Não foi possivél imprimir este cupom!');
            InformaError('Erro Apresentado: '+Uppercase(E.Message));
            Raise;
            end;
         end;
      nBuscando_DAV:=False;
      DC;
end;

procedure TfrmCheckOut.SomaItens;
begin
     nSubTotal:=0;
     DM.TPDV.DisableControls;
     DM.TPDV.First;
     While not DM.TPDV.Eof
     do begin
        if DM.TPDVCANCELADO.AsString<>'S'
        then nSubTotal:=nSubTotal+DM.TPDVVL_TOTAL.Value;
        DM.TPDV.Next;
        end;
     DM.TPDV.EnableControls;   
end;

Function Tfrmcheckout.Consulta_Grade_Produto(xCodProduto : Integer):Boolean;
begin
     DM.TPesqGradeProd.Close;
     DM.TPesqGradeProd.Params[0].AsInteger:=xCodProduto;
     DM.TPesqGradeProd.Open;
     if DM.TPesqGradeProd.RecordCount > 0
     then begin
          Try
             if FConsultaGrade=Nil
             then Application.CreateForm(TFConsultaGrade,FConsultaGrade);
             FConsultaGrade.LDescricao.Caption:=StrZero(DM.TPesqGradeProdCOD_PRODUTO.Value,6)+'-'+DM.TPesqGradeProdDESCRICAO.Value;
             FConsultaGrade.ShowModal;
             if FConsultaGrade.ModalResult=mrOk
             then Result:=True
             else Result:=False;
          Finally
             FConsultaGrade.Release;
             FConsultaGrade:=nil;
             end;
          end
     else Result:=True;     
     DM.TPesqGradeProd.Close;
end;

function Tfrmcheckout.Consulta_Produto_Na_Grade : Boolean;
var
   Iten : Integer;
begin
    With DM.QPesquisa
    do begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT CODIGO,COD_PRODUTO,COD_BARRA,COD_COR,COD_TAMANHO,QTDE FROM ESTOQUE_GRADE');
       Sql.Add('WHERE COD_BARRA = :PCODBARRA');
       ParamByName('PCODBARRA').AsString:=editCodigo.Text;
       Open;
       if not IsEmpty
       then begin
            if FrmPrincipal.BaixaEstoque='S'
            then begin
                 if (FieldByName('QTDE').Value < ed_quantidade.Value)
                 then begin
                      Result:=False;
                      Informa('Quantidade não disponivél na grade!');
                      Exit
                      end;
                 end;
            
            Result:=True;
            editCodigo.Text:=StrZero(FieldByName('COD_PRODUTO').AsInteger,6);
            if DM.TPDVGrade.Active=False
            then begin
                 DM.TPDVGrade.CreateDataSet;
                 DM.TPDVGrade.Open;
                 end;
            if DM.TPDV.Active
            then begin
                 DM.TPDV.Last;
                 Iten:=DM.TPDVITEN.Value + 1;
                 end
            else Iten:=1;     
            DM.TPDVGrade.Append;
            DM.TPDVGradeITEN.Value:=Iten;
            DM.TPDVGradeCOD_PRODUTO.Value:=FieldByName('COD_PRODUTO').Value;
            DM.TPDVGradeCOD_GRADE.Value:=FieldByName('CODIGO').Value;
            DM.TPDVGradeQTDE.Value:=ed_quantidade.Value;
            DM.TPDVGradeCOD_COR.Value:=FieldByName('COD_COR').Value;
            DM.TPDVGradeCOD_TAMANHO.Value:=FieldByName('COD_TAMANHO').Value;
            DM.TPDVGrade.Post;
            end
       else begin
            Result := True;//Consulta_Grade_Produto(StrToInt(editCodigo.Text));
            end;
       end;
end;

Function Tfrmcheckout.verifica_produto : Boolean;
var
   vBalanca, vProssegue : Boolean;
   vCodigo : String;
   vQtde : Double;
   vPosicao_I_Cod, vPosicao_F_Cod, vPosicao_I_Valor, vPosicao_F_Valor : Integer;
begin
      Result:=False;
      vTotal:=0;

      if FrmPrincipal.Usa_Grade='S'
      then begin
           if not nBuscando_DAV
           then begin
                if Consulta_Produto_Na_Grade
                then vProssegue:=True
                else vProssegue:=False
                end
           else vProssegue:=True;
           end
      else vProssegue:=True;

      if vProssegue
      then begin
            if (Length(EditCodigo.text)>=10) and (Copy(EditCodigo.Text,1,1)= '2')  // produto pesado
            then vBalanca:=true
            else vBalanca:=false;

            if vBalanca
            then begin
                 vPosicao_I_Cod:=StrToInt(FrmPrincipal.Ler_CodProduto_Pos_I);
                 vPosicao_F_Cod:=StrToInt(FrmPrincipal.Ler_CodProduto_Pos_F);

                 vPosicao_I_Valor:=StrToInt(FrmPrincipal.Ler_Valor_Pos_I);
                 vPosicao_F_Valor:=StrToInt(FrmPrincipal.Ler_Valor_Pos_F);

                 vCodigo := Copy(EditCodigo.Text,vPosicao_I_Cod,vPosicao_F_Cod);
                 end
            else vCodigo := EditCodigo.Text;

          Try
            With DM.QPesquisa
            do begin
               Close;
               Sql.Clear;
               if ServidorRemoto='ON'
               then Sql.Add('SELECT CODIGO,CODBARRA,DESCRICAO,PRECOVENDA,PRECOPRAZO,INATIVO,COD_ST FROM ESTOQUE')
               else Sql.Add('SELECT CODIGO,CODBARRA,DESCRICAO,PRECOVENDA,PRECOPRAZO,INATIVO,CST FROM ESTOQUE');
               if vBalanca
               then begin
                    if FrmPrincipal.Ler_Campo_Balanca='0'
                    then begin
                         Sql.Add('WHERE CODIGO=:PCODBALANCA');//Lê Código de barras, produto pesado
                         ParamByName('PCODBALANCA').AsInteger:=StrToInt(vCodigo);
                         end
                    else if FrmPrincipal.Ler_Campo_Balanca='1'
                    then begin
                         Sql.Add('WHERE CODBARRA=:PCODBALANCA');//Lê Código de barras, produto pesado
                         ParamByName('PCODBALANCA').AsString:=vCodigo;
                         end;
                    end
               else begin
                    if (FrmPrincipal.Padrao_Busca='0')or(nBuscou_Descricao=True)
                    then begin
                          if (Length(EditCodigo.text)>=8)//Lê Código de Barras,produto normal EAN 13
                          then begin
                               Sql.Add('WHERE CODBARRA=:PCODBARRA');
                               ParamByName('PCODBARRA').AsString:=vCodigo;
                               end
                          else begin
                               Sql.Add('WHERE CODIGO=:PCODIGO');//Lê código interno
                               ParamByName('PCODIGO').AsInteger:=StrToInt(vCodigo);
                               end;
                         end
                    else if FrmPrincipal.Padrao_Busca='1'
                    then begin
                         Sql.Add('WHERE CODBARRA=:PCODBARRA');
                         ParamByName('PCODBARRA').AsString:=vCodigo;
                         end;
                    end;

               Sql.Add('AND INATIVO=:PINATIVO');
               ParamByName('PINATIVO').AsString:='N';
               Open;
               if not IsEmpty
               then begin
                    vAchouProduto:=True;
                    vTabelaProduto.Close;
                    vTabelaProduto.Params[0].AsInteger:=FieldByName('CODIGO').Value;
                    vTabelaProduto.Open;
                    if FrmPrincipal.Vende_Estoque_Neg='N'
                    then begin
                         if not nBuscando_DAV
                         then begin
                              if vTabelaProduto.FieldByName('QTDE').AsFloat <= 0
                              then begin
                                   Informa('Quantidade não Disponível no Estoque!');
                                   vAchouProduto:=False;
                                   Exit;
                                   end;
                              end;
                         end;

                    //Busca o CST do Produto
                    if ServidorRemoto='ON'
                    then begin
                         Try
                          With DM.QPesquisaBaseRemota
                          do begin
                             Close;
                             Sql.Clear;
                             Sql.Add('SELECT CODIGO,COD_ST FROM SITUACAO_TRIBUTARIA');
                             Sql.Add('WHERE CODIGO=:PCODIGO');
                             ParamByName('PCODIGO').AsString:=DM.QPesquisa.FieldByName('COD_ST').Value;
                             Open;
                             if not IsEmpty
                             then sCST:=FieldByName('COD_ST').AsString
                             else sCST:='';
                             end
                         Except
                            sCST:='';
                          end;
                        end
                   else begin//Servidor OffLine
                        sCST:=DM.QPesquisa.FieldByName('CST').AsString;
                        end;

                    if nBuscou_Descricao=False
                    then begin
                         if nBuscando_DAV
                         then nBuscou_Codigo:=False
                         else nBuscou_Codigo:=True;

                         if sPrecoTabela='V'
                         then preco_aplicado:=vTabelaProduto.FieldByName('PRECOVENDA').AsFloat
                         else preco_aplicado:=vTabelaProduto.FieldByName('PRECOPRAZO').AsFloat;
                         end
                    else begin
                         if sPrecoTabela='V'
                         then preco_aplicado:=DM.TPesqProdutoPRECOVENDA.AsFloat
                         else preco_aplicado:=DM.TPesqProdutoPRECOPRAZO.AsFloat;
                         end;

                    if preco_aplicado<=0
                    then begin
                         Try
                            if FAlteraIten=Nil
                            then Application.CreateForm(TFAlteraIten,FAlteraIten);
                            FAlteraIten.LProduto.Caption:=StrZero(DM.QPesquisa.FieldByName('CODIGO').AsInteger,6)+'-'+
                                                                  DM.QPesquisa.FieldByName('DESCRICAO').AsString;
                            FAlteraIten.ShowModal;
                         Finally
                            FAlteraIten.Release;
                            FAlteraIten:=Nil;
                            end;
                         end;

                    if preco_aplicado<=0
                    then begin
                         Informa('Valor do Produto Inválido!');
                         vAchouProduto:=False;
                         Exit;
                         end;

                    DM.T_Tributacao.Open;
                    DM.T_Tributacao.Refresh;
                    if DM.T_Tributacao.Locate('CODIGO',vTabelaProduto.FieldByName('CODALIQUOTA').AsInteger,[])
                    then begin
                         if (DM.T_TributacaoCODIGOCUPOM.Value='')
                         then begin
                              Informa('Aliquota do produto '+StrZero(vTabelaProduto.FieldByName('CODIGO').AsInteger,6)+'-'+vTabelaProduto.FieldByName('DESCRICAO').AsString+' não programada no ECF, este item não será vendido!');
                              vAchouProduto:=False;
                              Exit;
                              end;
                         end
                    else begin
                         Informa('Aliquota do produto '+StrZero(vTabelaProduto.FieldByName('CODIGO').AsInteger,6)+'-'+vTabelaProduto.FieldByName('DESCRICAO').AsString+' não programada no ECF, este item não será vendido!');
                         vAchouProduto:=False;
                         Exit;
                         end;
                    end
               else vAchouProduto:=False;
               end;
            Except
              InformaError('Consulta Inválida!');
              vAchouProduto:=False;
              EditCodigo.Clear;
              EditCodigo.SetFocus;
              Raise;
              end;

            if (vCodigo='') or (vAchouProduto=False)
            then begin
                 MessageBeep( 32 );
                 Informa('Produto não cadastrado!');
                 ENomeProduto.Caption:='PRODUTO NÃO CADASTRADO!';
                 EditCodigo.Clear;
                 EditCodigo.SetFocus;
                 exit;
                 end;

            if vBalanca
            then begin
                 //vTotal := StrToFloat(Copy(EditCodigo.Text,8,3)+','+Copy(EditCodigo.Text,11,2));
                 vTotal := StrToFloat(Copy(EditCodigo.Text,vPosicao_I_Valor, vPosicao_F_Valor)+','+Copy(EditCodigo.Text,11,2));
                 vQtde := vTotal / Preco_aplicado;
                 Ed_quantidade.Value := vQtde;
                 end;

          Result:=True;
          end//If vProssegue
     else begin
          editCodigo.Clear;
          editCodigo.SetFocus;
          end;
end;

procedure Tfrmcheckout.Mostra(xMensagem:String);
begin
     AC;
     PMensagem.Caption:=xMensagem;
     PMensagem.Visible:=True;
     PMensagem.repaint;
end;

procedure Tfrmcheckout.Libera;
begin
     DC;
     PMensagem.Visible:=False;
end;

procedure Tfrmcheckout.BitBtn4Click(Sender: TObject);
begin
     Close;
end;

procedure Tfrmcheckout.editCodigoExit(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=clWhite;

     //Cancela o foco e força novamente a entrada
     ActiveControl := nil;
     PostMessage(editCodigo.Handle, WM_SETFOCUS, 0, 0);
     editCodigo.SetFocus;

     if Trim(Editcodigo.Text)<> ''
     then begin
          Application.Processmessages;//para considerar algo que aconteça no dbgrid durante a entrada nesta procedure
          preco_aplicado:=0;
          if Verifica_Produto
          then begin
                if (vAchouProduto=False)
                then begin
                     EditCodigo.text:='';
                     EditCodigo.setfocus;
                     end
                else begin
                     if DM.TPDV.Active=False
                     then begin
                          DM.TPDV.CreateDataSet;
                          DM.TPDV.Open;
                          end;

                     Timer2.Enabled:=False;
                     ENomeProduto.Left:=3;
                     PItens.Visible:=True;
                     FrmCheckOut.Refresh;
                     ENomeProduto.Caption:=vTabelaProduto.FieldByName('DESCRICAO').AsString;

                     if nBuscou_DAV=False
                     then begin
                          ed_unitario.Value:=Preco_Aplicado;
                          sQuantidade:=(formatfloat('#####0.000',ed_quantidade.Value));
                          end
                     else begin
                          if (nBuscou_Descricao=False)and(nBuscou_Codigo=False)
                          then Preco_Aplicado:=ed_Unitario.Value//Buscou Produto da Pré-Venda
                          else if (nBuscou_Descricao=True)or(nBuscou_Codigo=True)//Buscou Produto em Pesquisa
                          then ed_Unitario.Value:=Preco_Aplicado;
                          sQuantidade:=(Formatfloat('#####0.000',ed_quantidade.Value));
                          end;

                     if (nAbriu_Cupom = 0)
                     then begin
                          DM.TPDV.EnableControls;
                        Try
                          //--- Pega o numero de serie do ecf
                          Mostra('Lendo informações da IF. Aguarde um Momento!');

                          Pega_NumSerie_Impressora;

                          //Aqui eu verifico toda vez o numero série da impressora no arquivo C:\Apgef\Local\TotalizadoresEcf.xml, para não ter problema, quando há troca de ECF
                          if retorno_imp_fiscal = 1
                          then if sNumero_serie <> DM.TTotalizadores_ECFNUM_SERIE.Value
                          then begin
                               Mostra('Atualizando Totalizadores Parciais. Aguarde!');
                               Repaint;
                               DM.TTotalizadores_ECF.Destroy;
                               if not FileExists('C:\Apgef\Local\TotalizadoresEcf.xml')
                               then begin
                                    DeleteFile('C:\Apgef\Local\TotalizadoresEcf.xml');
                                    Atualiza_Totalizadores_Parciais;
                                    end;
                               end;

                          nNumero_Cupom:=0;
                          if retorno_imp_fiscal = 1 //Impressora Respondendo
                          then begin
                               Retorna_NUMCCF_Cupom;
                               Retorna_Informacao_Impressora;
                               end;

                          SetLength (Str_proximoCupom,6);
                          if s_ImpFiscal = 'ECF Daruma'
                          then begin
                               retorno_imp_fiscal:= Daruma_FI_NumeroCupom(Str_proximoCupom);
                               nNumero_Cupom:=(StrToInt(str_proximoCupom));
                               end
                          else if s_ImpFiscal = 'ECF Bematech'
                          then begin
                               retorno_imp_fiscal:= Bematech_FI_NumeroCupom(Str_proximoCupom);
                               nNumero_Cupom:=(StrToInt(str_proximoCupom)+1);
                               end
                          else if s_ImpFiscal = 'ECF Elgin'
                          then begin
                               retorno_imp_fiscal:= Elgin_NumeroCupom(Str_proximoCupom);
                               nNumero_Cupom:=(StrToInt(str_proximoCupom)+1);
                               end
                          else if s_ImpFiscal = 'ECF Sweda'
                          then begin
                               retorno_imp_fiscal:= ECF_NumeroCupom(Pchar(Str_proximoCupom));
                               nNumero_Cupom:=(StrToInt(str_proximoCupom)+1);
                               end;

                          RXCupom.Caption:='CUPOM FISCAL:';
                          RXNumCupom.Caption:=StrZero(nNumero_Cupom,6);
                        Except
                          Application.ProcessMessages;
                          InformaError('Não foi possivél estabelecer a comunicação com a impressora, verifique'+#13+
                                       'se sua impressora esta ligada e devidamente instalada, caso o problema'+#13+
                                       'persistir, entre em contato com o suporte técnico.'+#13+#13+
                                       'O Cupom será abortado!');

                          Analisa_iRetorno();
                          Retorno_Impressora();

                          Libera;
                          FormShow(Sender);
                          Exit;
                          end;
                        end;

                   if GrandeTotal_NumeroSerie = True
                   then begin
                        Try
                          DM.TPDV.Append;
                          DM.TPDVCODPRODUTO.Value:=vTabelaProduto.FieldByName('CODIGO').AsInteger;
                          DM.TPDVDESCRICAO.Value:=vTabelaProduto.FieldByName('DESCRICAO').AsString;
                          DM.TPDVMED.Value:=vTabelaProduto.FieldByName('MED').AsString;
                          DM.TPDVQTDE.Value:=StrToFloat(sQuantidade);
                          DM.TPDVVL_UNITARIO.Value:=Preco_Aplicado;
                          DM.TPDVVL_TOTAL.Value:=(Preco_Aplicado*ed_quantidade.Value);
                          DM.TPDVST.Value:=DM.T_TributacaoCODIGOCUPOM.AsString;
                          DM.TPDVALIQUOTA.Value:=DM.T_TributacaoALIQUOTA.AsFloat;
                          DM.TPDVCANCELADO.AsString:='N';
                          DM.TPDVNUMERO_CUPOM.Value:=nNumero_Cupom;
                          DM.TPDVNUMERO_ECF.Value:=sNumero_serie;
                          DM.TPDVTABELA.AsString:=sPrecoTabela;
                          if (not vTabelaProduto.FieldByName('PRECOVENDA').IsNull)or(vTabelaProduto.FieldByName('PRECOVENDA').Value<>'')
                          then DM.TPDVP_VISTA.Value:=vTabelaProduto.FieldByName('PRECOVENDA').Value;
                          if (not vTabelaProduto.FieldByName('DESCONTOMAX').IsNull)or(vTabelaProduto.FieldByName('DESCONTOMAX').Value<>'')
                          then DM.TPDVPERC_DESC.Value:=vTabelaProduto.FieldByName('DESCONTOMAX').Value
                          else DM.TPDVPERC_DESC.Value:=0;
                          if not (vTabelaProduto.FieldByName('IPI').IsNull)or(vTabelaProduto.FieldByName('IPI').Value<>'')
                          then DM.TPDVPERC_IPI.Value:=vTabelaProduto.FieldByName('IPI').Value
                          else DM.TPDVPERC_IPI.Value:=0;
                          DM.TPDVNUM_CCF_CUPOM.Value:=nNumero_CCF_Cupom;
                          DM.TPDVNUM_FABRICAO_ECF.Value:=sNum_Serie_ECF;
                          DM.TPDVMF_ADICIONAL.Value:=sMF_Adicional;
                          DM.TPDVTIPO_ECF.Value:=sTipo_ECF;
                          DM.TPDVMARCA_ECF.Value:=sMarca_ECF;
                          DM.TPDVMODELO_ECF.Value:=sModelo_ECF;
                          DM.TPDVCST.Value:=sCST;

                          if nBuscou_DAV
                          then begin
                               DM.TPDVBUSCOU_DAV.Value:=nBuscou_DAV;
                               DM.TPDVCOD_DAV.Value:=vCod_DAV;
                               DM.TPDVCODCLIENTE_DAV.Value:=nCodClienteDAV;
                               DM.TPDVCLIENTE_DAV.Value:=sCliente_DAV;
                               DM.TPDVDESCONTO_DAV.Value:=nDesconto_DAV;
                               DM.TPDVFLAG_DAV.Value:=nFlagDAV;
                               DM.TPDVNUM_FLAG_DAV.Value:=nNumFlagDAV;
                               end;

                          DM.TPDV.Post;

                          nSubTotal:=(nSubTotal+DM.TPDVVL_TOTAL.Value);
                          editSUBTOTAL.Value:=nSubTotal;

                          Libera;
                      Except
                          Libera;
                          Informa('Não Foi possível lançar este item para venda!');
                          Raise;
                          end;

                       // Rotinas para impressao do cupom concumitante
                       if (nAbriu_Cupom = 0)
                       then begin
                            Mostra('Abrindo o Cupom Fiscal. Aguarde um Momento!!');
                            sEmpresa:='';
                            if s_ImpFiscal = 'ECF Daruma'
                            then retorno_imp_fiscal:= Daruma_FI_AbreCupom( pchar( sEmpresa ) )
                            else if s_ImpFiscal = 'ECF Bematech'
                            then retorno_imp_fiscal:= Bematech_FI_AbreCupom( pchar( sEmpresa ) )
                            else if s_ImpFiscal = 'ECF Elgin'
                            then retorno_imp_fiscal:= Elgin_AbreCupom( pchar( sEmpresa ) )
                            else if s_ImpFiscal = 'ECF Sweda'
                            then retorno_imp_fiscal:= ECF_AbreCupom( pchar( '' ) );

                            Libera;

                            Analisa_iRetorno();

                            if retorno_imp_fiscal = 1
                            then nAbriu_Cupom:=1
                            else begin
                                 FormShow(Sender);
                                 Exit;
                                 end;
                            end;

                       if (nAbriu_Cupom = 1)
                       then begin
                            Str_Codigo := '';
                            Str_Descricao:='';
                            Str_Aliquota:='';
                            Str_Tipo_de_Quantidade:='';
                            Str_Quantidade:='';
                            Int_Casas_Decimais:=0;
                            Str_Valor_Unitario:='';
                            Str_Tipo_de_Desconto:='';
                            Str_Valor_do_Desconto:='';

                            Str_Codigo := Trim(StrZero(vTabelaProduto.FieldByName('CODIGO').AsInteger,13));
                            Str_Descricao := Trim(Espaco(vTabelaProduto.FieldByName('DESCRICAO').AsString,29));

                            if ((DM.T_tributacaoCODIGOCUPOM.Value='II')or
                                (DM.T_tributacaoCODIGOCUPOM.Value='NN')or
                                (DM.T_tributacaoCODIGOCUPOM.Value='FF'))
                            then Str_Aliquota := Trim(DM.T_TributacaoCODIGOCUPOM.AsString)
                            else Str_aliquota:=Trim(formatfloat('00.00',DM.T_TributacaoALIQUOTA.AsFloat));

                            Str_Tipo_de_Quantidade :=Trim('F');// I para inteiro e F para fracionária
                            Str_Quantidade := Trim(FormatFloat('##,###0.000',DM.TPDVQTDE.AsFloat));
                            Int_Casas_Decimais :=2;
                            preco_venda:=DM.TPDVVL_UNITARIO.AsFloat;
                            Str_Valor_Unitario:=Trim(formatfloat('###,###,##0.00',preco_venda));

                            if s_ImpFiscal = 'ECF Daruma'
                            then begin
                                 Str_Tipo_de_Desconto := Trim('$');
                                 Str_Valor_do_Desconto := Trim('0,00');
                                 end
                            else if s_ImpFiscal = 'ECF Bematech'
                            then begin
                                 Str_Tipo_de_Desconto := Trim('%');
                                 Str_Valor_do_Desconto := Trim('0000');
                                 end
                            else if s_ImpFiscal = 'ECF Elgin'
                            then begin
                                 Str_Tipo_de_Desconto := Trim('%');
                                 Str_Valor_do_Desconto := Trim('0000');
                                 end
                            else if s_ImpFiscal = 'ECF Sweda'
                            then begin
                                 Str_Tipo_de_Desconto := Trim('%');
                                 Str_Valor_do_Desconto := Trim('0000');
                                 end;

                          Mostra('Lançando o Item na IF. Aguarde um momento!!!');

                          if s_ImpFiscal = 'ECF Daruma'
                          then Retorno_imp_Fiscal := Daruma_FI_VendeItem(pchar( Str_Codigo ), pchar( Str_Descricao ), pchar( Str_Aliquota ), pchar( Str_Tipo_de_Quantidade ), pchar( Str_Quantidade ), Int_Casas_Decimais, pchar( Str_Valor_Unitario ), pchar( Str_Tipo_de_Desconto ), pchar( Str_Valor_do_Desconto ) )
                          else if s_ImpFiscal = 'ECF Bematech'
                          then Retorno_imp_Fiscal := Bematech_FI_VendeItem(pchar( Str_Codigo ), pchar( Str_Descricao ), pchar( Str_Aliquota ), pchar( Str_Tipo_de_Quantidade ), pchar( Str_Quantidade ), Int_Casas_Decimais, pchar( Str_Valor_Unitario ), pchar( Str_Tipo_de_Desconto ), pchar( Str_Valor_do_Desconto ) )
                          else if s_ImpFiscal = 'ECF Elgin'
                          then Retorno_imp_Fiscal := Elgin_VendeItem(pchar( Str_Codigo ), pchar( Str_Descricao ), pchar( Str_Aliquota ), pchar( Str_Tipo_de_Quantidade ), pchar( Str_Quantidade ), Int_Casas_Decimais, pchar( Str_Valor_Unitario ), pchar( Str_Tipo_de_Desconto ), pchar( Str_Valor_do_Desconto ) )
                          else if s_ImpFiscal = 'ECF Sweda'
                          then Retorno_imp_Fiscal := ECF_VendeItem(pchar( Str_Codigo ), pchar( Str_Descricao ), pchar( Str_Aliquota ), pchar( Str_Tipo_de_Quantidade ), pchar( Str_Quantidade ), Int_Casas_Decimais, pchar( Str_Valor_Unitario ), pchar( Str_Tipo_de_Desconto ), pchar( Str_Valor_do_Desconto ) );

                          Libera;
                          Analisa_iRetorno();

                          if retorno_imp_fiscal <> 1
                          then begin
                               ExcluiItem;
                               if DM.TPDV.IsEmpty
                               then begin
                                    Verifica_Leitura_Z_Pendente;
                                    FormShow(Sender);
                                    end;
                               Retorno_Impressora();
                               end
                          else Atualiza_GrandeTotal;

                          end;
                       Preco_Aplicado:=0;
                       EditCodigo.text:='';
                       Ed_quantidade.value:=1;
                       EditCodigo.SetFocus;
                   end;//IF Function GrandeTotal_NumSerie
               end;
           end;//If Verifica_Produto    
     end;
end;

procedure TfrmCheckOut.ExcluiItem;
begin
     DM.TPDV.Delete;
     SomaItens;
     editSUBTOTAL.Value:=nSubTotal;
end;

procedure Tfrmcheckout.FormShow(Sender: TObject);
begin
    if FrmPrincipal.ResolucaoPadrao
    then begin
         Top := 0;
         Left := 0;
         Width := Screen.Width;
         Height := Screen.Height;
         end
    else begin
         Height:=598;
         end;

    DM.TPDV.Close;
    DM.TPDVGrade.Close;
    DM.TDescAcresc.Close;

    if ServidorRemoto='OF'
    then ImageOF.Visible:=True
    else if ServidorRemoto='ON'
    then ImageON.Visible:=True;

    ENomeProduto.Caption:='CAIXA LIVRE';
    Timer2.Enabled:=True;
    PItens.Visible:=False;
    RXCupom.Caption:='';
    RXNumCupom.Caption:='';
    RxLabel21.Caption:=s_Empresa;
    LUsuario.Caption:=s_usuario+Space(2)+'PDV: '+FrmPrincipal.PDVLocal;
    editcodigo.Text:='';
    editsubtotal.Text:='';
    nItem_Cupom:=0;
    nAbriu_Cupom:=0;
    nSubTotal:=0;
    Preco_Aplicado:=0;
    fechou:='NAO';
    ed_Unitario.Value:=0;
    ed_quantidade.Value:=1;
    LData_Hora.Caption:='';
    nBuscou_Descricao:=False;
    nBuscou_Codigo:=False;
    Gravou_RelGerencial_BD:=False;

    vCod_DAV:=0;
    nCodClienteDAV:=0;
    sCliente_DAV:='';
    nDesconto_DAV:=0;
    nBuscou_DAV:=False;
    nBuscando_DAV:=False;
    nFlagDAV:=0;
    nNumFlagDAV:=0;

    LTabela.Caption:=sPrecoTabela;
    nValorTotal:=0;
    sNome_Rede:='';
    sNum_Trans_NSU:='';
    dData_Trans:=0;
    dHora_Trans:=0;
    DBGrid.Height:=255;
    editCodigo.SetFocus;

    frmCheckOut.Refresh;
end;

procedure Tfrmcheckout.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if nAbriu_Cupom = 1
     then begin
          Informa ('Nao pode sair do programa com cupom fiscal aberto. Feche a venda antes de sair');
          editcodigo.SetFocus;
          end
     else begin
          if FFechamentoVenda_tef<>Nil
          then begin
               FFechamentoVenda_tef.Release;
               FFechamentoVenda_tef:=Nil;
               end;
          DM.TPDV.Close;
          Try
           if FileExists('C:\Apgef\Local\Itens.xml')
           then DeleteFile('C:\Apgef\Local\Itens.xml');
          except
           Informa('NÃO FOI POSSÍVEL ATUALIZAR O ARQUIVO LOCAL, SERÁ RECOMENDADO REINICAR ESTA MÁQUINA!');
           end;
       end;
end;

procedure Tfrmcheckout.editCodigoKeyPress(Sender: TObject; var Key: Char);
begin
     if key='*'
     then begin
          Try
            if StrToFloat(editCodigo.Text) > 0
            then begin
                 ed_quantidade.Value:=StrToFloat(editCodigo.Text);
                 editCodigo.Text:='';
                 key:=#0;
                 end
            else begin
                 Informa('Quantidade Inválida!');
                 editCodigo.Clear;
                 key:=#0;
                 end;
            editCodigo.SetFocus;
          Except
            Informa('Quantidade Inválida!');
            editCodigo.Clear;
            editCodigo.SetFocus;
            key:=#0;
            end;
          end;


      if key=#13
      then begin
           key:=#0;
           perform(wm_nextdlgctl,0,0);
           end;
end;

procedure Tfrmcheckout.editCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   Int_Confirma : Integer;
begin
       if Key=VK_F1
       then begin
            Try
               if FAjudaPDV=Nil
               then Application.CreateForm(TFAjudaPDV,FAjudaPDV);
               FAjudaPDV.ShowModal;
            Finally
               FAjudaPDV.Release;
               FAjudaPDV:=Nil;
               end;
            end;

//##############################################################################

       if Key=VK_F2
       then begin
            if nAbriu_Cupom = 1
            then begin
                 Try
                    if FDescAcresc_Item=Nil
                    then Application.CreateForm(TFDescAcresc_Item,FDescAcresc_Item);
                    FDescAcresc_Item.ShowModal; 
                 Finally
                    FDescAcresc_Item.Release;
                    FDescAcresc_Item:=Nil;
                    end;
                 end
            else Informa('Abra o cupom fiscal, e lance o item!');     
            end;


//##############################################################################

     if Key= VK_F10
     then begin
          if nAbriu_Cupom = 0
          then begin
                int_Confirma:= Application.MessageBox ('Tem certeza que deseja tirar a Leitura X?' , 'PDV',mb_YesNo+mb_DefButton2+mb_IconQuestion);
                if (int_Confirma = 6)
                then begin
                      FrmPrincipal.VerificaPermissaoUsuario('PE_LEITURA_X');

                      if vLiberado
                      then begin
                            Mostra('Emitindo a Leitura X. Aguarde um Momento!');

                            //BlockInput(true);

                            Imprimi_LeituraX;

                            //BlockInput(false);

                            Libera;
                            end;
                      end;
                  end    
              else Informa('Não é permitido Emitir Leitura X com o Cupom Fiscal Aberto!');
          end;

//##############################################################################

     if Key= VK_F11
     then begin
          if nAbriu_Cupom = 0
          then begin
                int_Confirma:= Application.MessageBox ('Tem Certeza que Deseja Efetuar a Redução Z? Você poderá usar a impressora somente a partir da 00:00 hora do dia seguinte!' , 'PDV',mb_YesNo+mb_DefButton2+mb_IconQuestion);
                if (int_Confirma = 6)
                then begin
                      FrmPrincipal.VerificaPermissaoUsuario('PE_REDUCAO_Z');

                      if vLiberado
                      then begin
                            Mostra('Emitindo a Redução Z. Aguarde um momento!!!');

                            TFoco.Enabled:=False;

                            //BlockInput(true);
                            if s_ImpFiscal = 'ECF Daruma'
                            then Retorno_imp_Fiscal:=Daruma_FI_ReducaoZ('','')
                            else if s_ImpFiscal = 'ECF Bematech'
                            then Retorno_imp_Fiscal:=Bematech_FI_ReducaoZ('','')
                            else if s_ImpFiscal = 'ECF Elgin'
                            then Retorno_imp_Fiscal:=Elgin_ReducaoZ('','')
                            else if s_ImpFiscal = 'ECF Sweda'
                            then Retorno_imp_Fiscal:=ECF_ReducaoZ('','');
                            //BlockInput(false);

                            Application.ProcessMessages;

                            Sleep(1000);

                            Analisa_iRetorno();
                            Retorno_Impressora();

                            Libera;

                            TFoco.Enabled:=True;

                            if (Retorno_imp_Fiscal = 1)
                            then begin
                                 if ECF_Respondendo = 0
                                 then begin
                                      Verifica_E_Grava_Dados_UltimaReducaoZ(0);
                                      Sleep(1000);
                                      GerarArquivoMovimentoECF(StrToDate(sDataMovtoReducaoZ),StrToDate(sDataMovtoReducaoZ),1);
                                      end
                                 else Informa('O Ecf não responde, portando não foi gravado a Redução Z em Banco de Dados!');
                                 Libera;
                                 end
                            else Avisando('Não foi possivél armazenar esta redução Z no banco de dados do Sistema. '+
                                          'Antes de abrir um novo movimento no dia seguinte, informe ao suporte técnico '+
                                          'esta mensagem!');

                            end;
                      end;
                 end
              else Informa('Não é permitido Emitir Redução Z com o Cupom Fiscal Aberto!');
          end;

//##############################################################################

     if Key = VK_F7
     then begin
          if nAbriu_Cupom = 0
          then begin
                FrmPrincipal.VerificaPermissaoUsuario('PE_SUPRIMENTO_SANGRIA');

                if vLiberado
                then begin
                    Try
                       if fsangriasuprimento=Nil
                       then Application.createform(tfsangriasuprimento, fsangriasuprimento);
                       fsangriasuprimento.showmodal;
                    Finally
                       fsangriasuprimento.Release;
                       fsangriasuprimento:=Nil;
                       end;
                    end;
               end
          else Informa('Não é permitido fazer Sangrias/Suprimento de Caixa com o Cupom Fiscal Aberto!');     
          end;

//##############################################################################

     if key = VK_F8
     then begin
          int_Confirma:= Application.MessageBox ('Tem certeza que deseja cancelar o último cupom fiscal emitido?' , 'PDV',mb_YesNo+mb_DefButton2+mb_IconQuestion);
          if (int_Confirma = 6)
          then begin
               FrmPrincipal.VerificaPermissaoUsuario('PE_CANCELA_CUPOM');

               Pega_NumSerie_Impressora;

               if Consulta_Cupom_Local
               then begin
                     if vLiberado
                     then begin
                           Mostra('Cancelando um Último COO fiscal emitido. Aguarde!');

                           Cancela_Cupom_Fiscal;

                           //Cancelamento Personalizado de Transação TEF, não é obrigatório
                           {if FrmPrincipal.Tef_Utilizado='Discado'
                           then begin
                                if Retorno_imp_Fiscal = 1
                                then begin
                                     if DM.TPDV.IsEmpty
                                     then Consulta_Informacao_TEF_Banco;

                                     if sNum_Trans_NSU<>''
                                     then EasyTEFDiscado.cancelarVenda(nValorTotal,sNome_Rede,sNum_Trans_NSU,dData_Trans,dHora_Trans);
                                     end;
                                end;}

                           Analisa_iRetorno();
                           Retorno_Impressora();

                           if DM.TPDV.IsEmpty
                           then begin
                                if ECF_Respondendo = 0 //Esta repondendo
                                then begin
                                     Cancela_Cupom_na_base_Local;
                                     if (ServidorRemoto='ON')and(Cupom_Ainda_Nao_Cancelado)
                                     then Cancela_Cupom_na_base_Remoto;
                                     end
                                else Informa('O Sistema não fez verificação de cancelamento no Banco de dados, '+
                                             'porque o ECF não esta respondendo!');     
                                end;

                           ENomeProduto.Caption:='';
                           editSUBTOTAL.value:=0;
                           ed_unitario.Value:=0;
                           nItem_Cupom:=0;
                           nAbriu_Cupom:=0;
                           nSubTotal:=0;
                           fechou:='NAO';

                           FormShow(Sender);

                           Try
                              if FileExists('C:\Apgef\Local\Itens.xml')
                              then DeleteFile('C:\Apgef\Local\Itens.xml');

                              if FileExists('C:\Apgef\Local\DescAcresc.xml')
                              then DeleteFile('C:\Apgef\Local\DescAcresc.xml');

                              if FileExists('C:\Apgef\Local\ItensGrade.xml')
                              then DeleteFile('C:\Apgef\Local\ItensGrade.xml');
                           Except
                              Informa('NÃO FOI POSSÍVEL ATUALIZAR O ARQUIVO LOCAL, SERÁ RECOMENDADO REINICAR ESTA MÁQUINA!');
                              end;

                           Libera;
                           EditCodigo.SetFocus;
                           end;
                      end//If Consulta_Cupom_Local
                   else Informa('Este cupom não pode ser cancelado, porque se refere a impressão de um DAV, e o servidor remoto '+
                                'se encontra indisponivél no momento, tente cancelar mais tarde, ou chame o suporte técnico do sistema.');

                 end;
          end;

//##############################################################################

     if key = VK_ESCAPE
     then begin
          if nAbriu_Cupom = 1
          then begin
               Informa('Não pode sair do programa com um cupom em aberto!');
               Editcodigo.SetFocus;
               end
          else Close;
          end;

//##############################################################################

     if key = VK_F4
     then begin
          if FrmPrincipal.Gaveta='S'
          then begin
                FrmPrincipal.VerificaPermissaoUsuario('PE_ABRE_GAVETA');

                if vLiberado
                then begin
                      Mostra('Abrindo a Gaveta. Aguarde um momento!');

                      if s_ImpFiscal = 'ECF Daruma'
                      then Retorno_imp_Fiscal := Daruma_FI_AcionaGaveta()
                      else if s_ImpFiscal = 'ECF Bematech'
                      then Retorno_imp_Fiscal := Bematech_FI_AcionaGaveta()
                      else if s_ImpFiscal = 'ECF Elgin'
                      then Retorno_imp_Fiscal := Elgin_AcionaGaveta()
                      else if s_ImpFiscal = 'ECF Sweda'
                      then Retorno_imp_Fiscal := ECF_AcionaGaveta();

                      Analisa_iRetorno();
                      Retorno_Impressora();

                      Libera;
                      end;
                 end;     
          end;

//##############################################################################

     if key = VK_F3
     then begin
          if nAbriu_Cupom = 0
          then begin
               Informa('Não pode iniciar fechamento de venda sem itens vendidos!');
               EditCodigo.SetFocus;
               end
          else begin
               if (nsubtotal = 0)
               then begin
                    Informa('Não pode iniciar fechamento de venda sem itens vendidos!');
                    EditCodigo.SetFocus;
                    end
               else begin
                     Try
                        if FFechamentoVenda_Tef=Nil
                        then Application.Createform(TFFechamentovenda_tef, FFechamentovenda_tef);
                        ffechamentovenda_tef.vAtivarComponenteTEF_Fechamento:=True;
                        FFechamentoVenda_tef.showmodal;
                        if fechou = 'SIM'
                        then begin
                             nItem_Cupom:=0;
                             nAbriu_Cupom:=0;
                             nSubTotal:=0;
                             fechou:='NAO';
                             Editcodigo.SetFocus;
                             end;
                     Except On E:Exception
                     do begin
                        Application.MessageBox( Pchar(
                        'ERRO  : "'+ E.Message +'" ;' +#13+#13+
                        'A VENDA AINDA NÃO FOI FECHADA'),
                        'Não foi possível acessar a tela de fechamento da venda', MB_Ok);
                     end;
                   end;
               end;
           end;
       end;

//##############################################################################

     if key = VK_F12
     then begin
          FrmPrincipal.VerificaPermissaoUsuario('PE_CAD_PRODUTO');

          if vLiberado
          then begin
                Try
                  if FCadProdutos=Nil
                  then application.createform(tfcadprodutos, fcadprodutos);
                  fcadprodutos.showmodal;
                Finally
                  fcadprodutos.Release;
                  fcadprodutos:=Nil;
                  end;
               end;   
          end;

//##############################################################################

     if key = VK_F5
     then begin
          EditCodigo.text:='';
          Tipo_ConsultaProd:='Check-out';
          Try
             if fpesquisaprodutos=Nil
             then application.createform(tfpesquisaprodutos, fpesquisaprodutos);
             fpesquisaprodutos.showmodal;
          Finally
             fpesquisaprodutos.Release;
             fpesquisaprodutos:=Nil;
             end;
          if Trim(EditCodigo.Text)<> ''
          then EditCodigoexit(sender)
          else editCodigo.SetFocus;
          end;

//##############################################################################

     if key = VK_F6
     then begin
          if nAbriu_Cupom = 0
          then begin
               Informa('Não é permitido cancelar Itens sem que esteja um cupom fiscal aberto!');
               Editcodigo.SetFocus;
               end
          else begin
               Tipo_ConsultaProd:='Check-out';
               FrmPrincipal.VerificaPermissaoUsuario('PE_CANCELA_ITEM');

               if vLiberado
               then begin
                     Try
                        if Fcancelaitem=Nil
                        then application.createform(tfcancelaitem, fcancelaitem);
                        fcancelaitem.showmodal;
                     Finally
                        fcancelaitem.Release;
                        fcancelaitem:=Nil;
                        end;
                    end;    
                end;
          end;
          
//##############################################################################

     if (Shift = [ssAlt])//Busca DAV
     then begin
           if Key=66//B
           then begin
                if ServidorRemoto='ON'
                then begin
                      if FrmPrincipal.Busca_Pre_Venda='S'
                      then begin
                            if nAbriu_Cupom = 0
                            then begin
                                  Try
                                     if FBuscaDAV=Nil
                                     then Application.CreateForm(TFBuscaDAV,FBuscaDAV);
                                     FBuscaDAV.vConsulta:=True;
                                     FBuscaDAV.ShowModal;
                                     FBuscaDAV.vConsulta:=False;
                                  Finally
                                     FBuscaDAV.Release;
                                     FBuscaDAV:=Nil;
                                     end;
                                 end
                            else begin
                                 Informa('Não pode Buscar DAV com o Cupom aberto!');
                                 editCodigo.SetFocus;
                                 end;
                             end;
                          end
                   else begin
                       Informa('O Servidor Remoto não esta ativo! Tente mais Tarde!!!');
                       editCodigo.SetFocus;
                       end;
                  end;     
           end;

//##############################################################################

     if (Shift = [ssAlt])//Classifica Coluna de Preço
     then begin
           if Key=80//P
           then begin
                 Try
                    if FClassificaPreco=Nil
                    then Application.CreateForm(TFClassificaPreco,FClassificaPreco);
                    FClassificaPreco.ShowModal;
                 Finally
                    FClassificaPreco.Release;
                    FClassificaPreco:=nil;
                    end;
                end;   
           end;

//##############################################################################

     if Key=VK_F9
     then begin
          FrmPrincipal.VerificaPermissaoUsuario('PE_ALTERA_CLIENTE');

          if vLiberado
          then begin
                Try
                   if FPesqClienteBalcao=Nil
                   then Application.CreateForm(TFPesqClienteBalcao,FPesqClienteBalcao);
                   FPesqClienteBalcao.vConsulta:=True;
                   FPesqClienteBalcao.ShowModal;
                   FPesqClienteBalcao.vConsulta:=False;
                Finally
                   FPesqClienteBalcao.Release;
                   FPesqClienteBalcao:=Nil;
                   end;
               end;    
          end;

//##############################################################################

     if (Shift = [ssAlt])//Adminstrações TEF
     then begin
           if Key=70//F
           then begin
                if nAbriu_Cupom = 0
                then begin
                     if FrmPrincipal.Tef_Utilizado='Discado'
                     then begin
                          EasyTEFDiscado.imprimirComprovante := True;
                          EasyTEFDiscado.fazerRequisicaoAdministrativa;
                          end
                     else Informa('O Sistema não esta configurado para trabalhar com TEF!');
                     end
                else Informa('Para acessar o as Funções Administrativa TEF, o Cupom Fiscal '+
                             'deve estar fechado!');
                end;
           end;
           
//##############################################################################

     if (Shift = [ssAlt])//Menu Fiscal
     then begin
           if Key=77//M
           then begin
                if nAbriu_Cupom = 0
                then begin
                      Try
                         if FMenuFiscal=Nil
                         then Application.CreateForm(TFMenuFiscal,FMenuFiscal);
                         FMenuFiscal.ShowModal;
                      Finally
                         FMenuFiscal.Release;
                         FMenuFiscal:=Nil;
                         end;
                      end
                else Informa('Não pode acessar o Menu Fiscal com o Cupom Fiscal Aberto!');         
                end;
           end;

//##############################################################################

     if (Shift = [ssAlt])//Comprovante Não Fiscal
     then begin
           if Key=67//C
           then begin
                if nAbriu_Cupom = 0
                then begin
                      Try
                         if FEmiteDoctoNaoFiscal=Nil
                         then Application.CreateForm(TFEmiteDoctoNaoFiscal,FEmiteDoctoNaoFiscal);
                         FEmiteDoctoNaoFiscal.ShowModal;
                      Finally
                         FEmiteDoctoNaoFiscal.Release;
                         FEmiteDoctoNaoFiscal:=Nil;
                         end;
                      end
                else Informa('O Cupom Fiscal não pode esta Aberto!');
                end;
           end;

//##############################################################################

     if (Shift = [ssAlt])
     then begin
          if (Key=68)//D
          then ChamaCalculadora;
          end;

//##############################################################################
end;

procedure Tfrmcheckout.ed_quantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key=#13
     then begin
          key:=#0;
          perform(wm_nextdlgctl,0,0);
          end;
end;

procedure Tfrmcheckout.ed_quantidadeExit(Sender: TObject);
begin
     if (Sender is TCurrencyEdit) then
     TCurrencyEdit(Sender).Color:=clWhite;

     if ed_quantidade.Value = 0
     then ed_quantidade.Value := 1;
     editcodigo.SetFocus;
end;

procedure Tfrmcheckout.ed_unitarioEnter(Sender: TObject);
begin
     Application.ProcessMessages;
     EditCodigo.SetFocus;
end;

procedure Tfrmcheckout.editSUBTOTALEnter(Sender: TObject);
begin
     EditCodigo.SetFocus;
end;

procedure Tfrmcheckout.EditNomeProdutoEnter(Sender: TObject);
begin
editcodigo.SetFocus;
end;

procedure Tfrmcheckout.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_F4) and (ssAlt in Shift) then
   begin
      Key := 0;
   end;
end;

procedure Tfrmcheckout.Timer1Timer(Sender: TObject);
begin
     LData_Hora.Caption:=DM.TEmpresaCidade.Value+', '+DataExtenso(Date)+', '+TimeToStr(Time);

     if ServidorRemoto='ON'
     then begin
          ImageOF.Visible:=False;
          ImageON.Visible:=True;
          end
     else begin
          ImageOF.Visible:=True;
          ImageON.Visible:=False;
          end;

     if not editCodigo.Focused
     then editCodigo.SetFocus;
end;

procedure Tfrmcheckout.editCodigoChange(Sender: TObject);
begin
     if (EditCodigo.Text>='A') and (EditCodigo.Text<='Z')
     then begin
          tipo_consultaProd:='Check-out';
          Try
              if FPesquisaProdutos=Nil
              then Application.Createform(TFPesquisaProdutos,FPesquisaProdutos);
              FPesquisaprodutos.vConsultando:=True;
              FPesquisaprodutos.EPesquisa.text:=EditCodigo.Text;
              FPesquisaprodutos.Showmodal;
              FPesquisaprodutos.vConsultando:=False;
              if FPesquisaProdutos.ModalResult=mrOk
              then begin
                   nBuscou_Descricao:=True;
                   Editcodigo.Text:=StrZero(DM.TPesqProdutoCODIGO.AsInteger,6);
                   EditCodigoexit(sender);
                   nBuscou_Descricao:=False;

                   if (Sender is TEdit) then
                   TEdit(Sender).Color:=$0080FFFF;

                   EditCodigo.SetFocus;
                   end
              else begin
                   EditCodigo.Clear;
                   EditCodigo.SetFocus;
                   end;
          Finally
              FPesquisaProdutos.Release;
              FPesquisaProdutos:=Nil;
              end;
        end;
end;

procedure Tfrmcheckout.editCodigoEnter(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=$0080FFFF;
end;

procedure Tfrmcheckout.ed_quantidadeEnter(Sender: TObject);
begin
     EditCodigo.SetFocus;
end;

procedure Tfrmcheckout.Timer2Timer(Sender: TObject);
begin
     ENomeProduto.Left:=ENomeProduto.Left-4;
     if ENomeProduto.Left < 0-ENomeProduto.Width
     then ENomeProduto.Left:= 450;
end;

procedure Tfrmcheckout.FormCreate(Sender: TObject);
begin
     TFechaTela.Enabled:=False;

     if not DirectoryExists('C:\Apgef\Local')
     then ForceDirectories('C:\Apgef\Local');

     Atualiza_Totalizadores_Parciais;

     if FrmPrincipal.Padrao_Preco='VISTA'
     then sPrecoTabela:='V'
     else sPrecoTabela:='P';
end;

procedure Tfrmcheckout.FormDestroy(Sender: TObject);
begin
     Libera;
end;

procedure Tfrmcheckout.FormActivate(Sender: TObject);
begin
    Try
      if FrmPrincipal.Dir_PDV<>''
      then Image3.Picture.LoadFromFile(FrmPrincipal.Dir_PDV);
    Except
      Informa('Figura não Encontrada!, Será Necessário uma nova Configuração.');
      end;

    AtualizaArquivosLocais; 

    if vAtivaComponente_TEF_Abertura
    then AtivaComponenteTEF_Abertura;
end;

procedure Tfrmcheckout.AtualizaArquivosLocais;
begin
    if FileExists('C:\Apgef\Local\Itens.xml')
    then begin
          DM.TPDV.Open;
          DM.TPDV.LoadFromFile(DM.TPDV.FileName);
          DM.TPDV.Last;

          if FileExists('C:\Apgef\Local\ItensGrade.xml')
          then begin
               DM.TPDVGrade.Open;
               DM.TPDVGrade.LoadFromFile(DM.TPDVGrade.FileName);
               DM.TPDVGrade.Last;
               end;

          if FileExists('C:\Apgef\Local\DescAcresc.xml')
          then begin
               DM.TDescAcresc.Open;
               DM.TDescAcresc.LoadFromFile(DM.TDescAcresc.FileName);
               DM.TDescAcresc.Last;
               end;

          Pega_NumSerie_Impressora;
          if retorno_imp_fiscal = 1
          then begin
               Retorna_NUMCCF_Cupom;
               Retorna_Informacao_Impressora;
               end;

          Application.ProcessMessages;

          nNumero_Cupom:=DM.TPDVNUMERO_CUPOM.Value;

          RXCupom.Caption:='CUPOM FISCAL:';
          RxNumCupom.Caption:=StrZero(DM.TPDVNUMERO_CUPOM.Value,6);

          if DM.TPDVBUSCOU_DAV.Value=True
          then begin
               nBuscou_DAV:=DM.TPDVBUSCOU_DAV.Value;
               vCod_DAV:=DM.TPDVCOD_DAV.Value;
               nCodClienteDAV:=DM.TPDVCODCLIENTE_DAV.Value;
               sCliente_DAV:=DM.TPDVCLIENTE_DAV.Value;
               nDesconto_DAV:=DM.TPDVDESCONTO_DAV.AsFloat;
               nFlagDAV:=DM.TPDVFLAG_DAV.Value;
               nNumFlagDAV:=DM.TPDVNUM_FLAG_DAV.Value;
               end;

          ENomeProduto.Caption:='AGUARDANDO O PRÓXIMO ITEM!';
          PItens.Visible:=True;
          SomaItens;
          EditSubTotal.Value:=nSubTotal;
          nAbriu_Cupom:=1;

          if not DM.TDescAcresc.IsEmpty
          then begin
               DBGrid.Height:=204;
               DM.TDescAcresc.First;
               While not DM.TDescAcresc.Eof
               do begin
                  if DM.TDescAcrescDESC_ACRESC.Value='D'
                  then nSubTotal:=nSubTotal - DM.TDescAcrescVALOR.Value
                  else nSubTotal:=nSubTotal + DM.TDescAcrescVALOR.Value;
                  DM.TDescAcresc.Next;
                  end;
               editSUBTOTAL.Value:=nSubTotal;
               end;

          end;
end;

procedure Tfrmcheckout.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     if DM.TPDVCANCELADO.Value='S'
     then begin
          DBGrid.Canvas.Font.Color :=clRed;
          end;
     DBGrid.Canvas.FillRect(Rect);
     DBGrid.DefaultDrawColumnCell(Rect, DataCol, Column,State);

     if not odd(DM.TPDV.RecNo)
     then begin
          if not (gdselected in state)
          then begin
               DBGrid.Canvas.Brush.Color := $00F0F0F0;
               DBGrid.Canvas.FillRect(Rect);
               DBGrid.DefaultDrawDataCell(rect, Column.Field, State);
               end;
          end;
end;

procedure Tfrmcheckout.EasyTEFDiscadoGerarIdentificador(
  var identificacao: Integer);
begin
     Randomize;
     identificacao := Random(999999);
end;

procedure Tfrmcheckout.EasyTEFDiscadoEncerrarCupomFiscal(Sender: TObject);
begin
     if s_ImpFiscal = 'ECF Bematech'
     then begin
          Bematech_FI_FechaComprovanteNaoFiscalVinculado;
          Bematech_FI_EstornoNaoFiscalVinculadoMFD( pchar( '' ), pchar( '' ), pchar( '' ) );
          Bematech_FI_FechaComprovanteNaoFiscalVinculado;
          Bematech_FI_CancelaCupom;
          end
     else if s_ImpFiscal = 'ECF Daruma'
     then begin
          Daruma_FI_FechaComprovanteNaoFiscalVinculado;
          Daruma_FI_CancelaCupom;
          end
     else if s_ImpFiscal = 'ECF Elgin'
     then begin
          Elgin_FechaComprovanteNaoFiscalVinculado;
          Elgin_EstornoNaoFiscalVinculadoMFD( Pchar( '' ), Pchar( '' ), Pchar( '' ) );
          Elgin_FechaComprovanteNaoFiscalVinculado;
          Elgin_CancelaCupom;
          end
     else if s_ImpFiscal = 'ECF Sweda'
     then begin
          ECF_FechaComprovanteNaoFiscalVinculado;
          ECF_EstornoNaoFiscalVinculadoMFD(Pchar( '' ),Pchar( '' ),Pchar( '' ));
          ECF_FechaComprovanteNaoFiscalVinculado;
          ECF_CancelaCupom;
          end;
    FormShow(Sender);
end;

procedure Tfrmcheckout.EasyTEFDiscadoFecharRelatorioGerencial(
  var operacaoECFOk: Boolean);
begin
    if s_ImpFiscal = 'ECF Bematech'
    then operacaoECFOk := Bematech_FI_FechaRelatorioGerencial = Retorno_imp_Fiscal
    else if s_ImpFiscal = 'ECF Daruma'
    then operacaoECFOk := Daruma_FI_FechaRelatorioGerencial = Retorno_imp_Fiscal
    else if s_ImpFiscal = 'ECF Elgin'
    then operacaoECFOk := Elgin_FechaRelatorioGerencial = Retorno_imp_Fiscal
    else if s_ImpFiscal = 'ECF Sweda'
    then operacaoECFOk := ECF_FechaRelatorioGerencial = Retorno_imp_Fiscal;
end;

procedure Tfrmcheckout.EasyTEFDiscadoImpressoraTemPapel(
  var operacaoECFOk: Boolean);
var
   a, s1, s2: Integer;
begin
   a := 0; s1 := 0; s2 := 0;
   if s_ImpFiscal = 'ECF Bematech'
   then begin
        Bematech_FI_VerificaEstadoImpressora(a, s1, s2);
        operacaoECFOk := not (s1 >= 128); // fim de papel
        end
   else if s_ImpFiscal = 'ECF Daruma'
   then begin
        Daruma_FI_VerificaEstadoImpressora(a, s1, s2);
        operacaoECFOk := not (s1 >= 128); // fim de papel
        end
   else if s_ImpFiscal = 'ECF Elgin'
   then begin
        Elgin_VerificaEstadoImpressora(a, s1, s2);
        operacaoECFOk := not (s1 >= 128); // fim de papel
        end
   else if s_ImpFiscal = 'ECF Sweda'
   then begin
        ECF_VerificaEstadoImpressora(a, s1, s2);
        operacaoECFOk := not (s1 >= 128); // fim de papel
        end;
end;

procedure Tfrmcheckout.EasyTEFDiscadoImprimirLeituraX(
  var operacaoECFOk: Boolean);
begin
     if s_ImpFiscal = 'ECF Bematech'
     then operacaoECFOk := Bematech_FI_LeituraX = retorno_imp_fiscal
     else if s_ImpFiscal = 'ECF Daruma'
     then operacaoECFOk := Daruma_FI_LeituraX = retorno_imp_fiscal
     else if s_ImpFiscal = 'ECF Elgin'
     then operacaoECFOk := Elgin_LeituraX = retorno_imp_fiscal
     else if s_ImpFiscal = 'ECF Sweda'
     then operacaoECFOk := ECF_LeituraX = retorno_imp_fiscal;
end;

procedure Tfrmcheckout.EasyTEFDiscadoImprimirRelatorioGerencial(
  imagemCupomTef: TStrings; var impressaoOk: Boolean);
begin
    if s_ImpFiscal = 'ECF Bematech'
    then impressaoOk := Bematech_FI_RelatorioGerencial(imagemCupomTef.GetText) = Retorno_imp_Fiscal
    else if s_ImpFiscal = 'ECF Daruma'
    then impressaoOk := Daruma_FI_RelatorioGerencial(imagemCupomTef.GetText) = Retorno_imp_Fiscal
    else if s_ImpFiscal = 'ECF Elgin'
    then impressaoOk := Elgin_RelatorioGerencial(imagemCupomTef.GetText) = Retorno_imp_Fiscal
    else if s_ImpFiscal = 'ECF Sweda'
    then impressaoOk := ECF_RelatorioGerencial(imagemCupomTef.GetText) = Retorno_imp_Fiscal;

    if impressaoOk
    then begin
         if not Gravou_RelGerencial_BD
         then begin
              GravaDadosDocECF('RG');//Relatório Gerencial - Sigla Padrão PAF-ECF
              Gravou_RelGerencial_BD:=True;
              end;
         end
    else Gravou_RelGerencial_BD:=False;
end;

procedure GeraRelatorioTipo60M_e_60A(nGera60M, nGera60A : Integer; sFlag : String);
begin
     if s_ImpFiscal = 'ECF Daruma'
     then begin
          if nGera60M=1
          then begin
               Retorno_imp_fiscal := Daruma_FI_RelatorioTipo60Mestre();
               Sleep(1000);
               if Retorno_imp_fiscal = 1
               then GerarMovtoECF60M;
               end;
          if nGera60A=1
          then begin
               Retorno_imp_fiscal := Daruma_FI_RelatorioTipo60Analitico();
               Sleep(1000);
               if Retorno_imp_fiscal = 1
               then begin
                    if sFlag='1'
                    then GerarITMovtoECF60A
                    else if sFlag='2'
                    then GerarITMovtoECF60A_Somente_Totalizadores;
                    end;
               end;
          end
     else if s_ImpFiscal = 'ECF Bematech'
     then begin
          if nGera60M=1
          then begin
               Retorno_imp_fiscal := Bematech_FI_RelatorioTipo60Mestre();
               Sleep(1000);
               if Retorno_imp_fiscal = 1
               then GerarMovtoECF60M;
               end;
          if nGera60A=1
          then begin
               Retorno_imp_fiscal := Bematech_FI_RelatorioTipo60AnaliticoMFD();
               Sleep(1000);
               if Retorno_imp_fiscal = 1
               then begin
                    if sFlag='1'
                    then GerarITMovtoECF60A
                    else if sFlag='2'
                    then GerarITMovtoECF60A_Somente_Totalizadores;
                    end;
               end;
          end
    else if s_ImpFiscal = 'ECF Elgin'
    then begin
         if nGera60M=1
         then begin
              Retorno_imp_fiscal := Elgin_RegistrosTipo60();
              Sleep(1000);
              if Retorno_imp_fiscal = 1
              then GerarMovtoECF60M;
              end;
         if nGera60A=1
         then begin
              Retorno_imp_fiscal := Elgin_RelatorioTipo60AnaliticoMFD();
              Sleep(1000);
              if Retorno_imp_fiscal = 1
              then begin
                   if sFlag='1'
                   then GerarITMovtoECF60A
                   else if sFlag='2'
                   then GerarITMovtoECF60A_Somente_Totalizadores;
                   end;
              end;
         end
    else if s_ImpFiscal = 'ECF Sweda'
    then begin
         if nGera60M=1
         then begin
              Retorno_imp_fiscal := ECF_RelatorioTipo60Mestre();
              Sleep(1000);
              if Retorno_imp_fiscal = 1
              then GerarMovtoECF60M;
              end;
         if nGera60A=1
         then begin
              Retorno_imp_fiscal := ECF_RelatorioTipo60AnaliticoMFD();
              Sleep(1000);
              if Retorno_imp_fiscal = 1
              then begin
                   if sFlag='1'
                   then GerarITMovtoECF60A
                   else if sFlag='2'
                   then GerarITMovtoECF60A_Somente_Totalizadores;
                   end;
              end;
         end;
     Analisa_iRetorno();    
end;

procedure Verifica_E_Grava_Dados_UltimaReducaoZ(Flag : Integer);
begin
     FrmPrincipal.TVerifUltimaReducao.Enabled:=False;
    Try
     FMSG := TFMSG.Create(nil);
     if Flag=1
     then FMSG.PMensagem.Caption := 'Aguarde um Momento! Verificando informações da Ultima Redução Z.'
     else FMSG.PMensagem.Caption := 'Gravando em Banco de Dados a Redução Z. Aguarde um momento.';
     FMSG.Show;
     FMsg.Repaint;
     AC1;
     if FileExists('C:\Retorno.txt')
     then begin
          DeleteFile('C:\Retorno.txt');
          Sleep(1000);
          end;

    GeraRelatorioTipo60M_e_60A(1,1,'1');

    if ServidorRemoto='ON'
    then begin
         Try
           if not DM.TReducoes_Local.IsEmpty
           then CopiaRegistroTabela(DM.TReducoes_Local,DM.TReducoes_Remoto,nCodigo_Reducao);
         Except
         on E: exception
         do begin
            InformaError('Erro ao Gravar Na Tabela de "REDUÇÕES NO BANCO REMOTO".'+#13+#13+
                         'Mensagem Interna: '+E.Message);
            end;
            end;
         end;
    finally
       DC;
       FreeAndNil(FMSG);
       end;
    Application.ProcessMessages;   
end;

procedure GerarMovtoECF60M;
var
 ArqTXT         : TextFile;
 iCont          : integer;
 iPosTwoDot     : Integer;
 iTam           : Integer;
 linha,
 sDtEmissao,
 sDtMovimento,
 sHoraEmissao,
 sNumeroSerie,
 sNumeroEquip,
 sMFAdicional,
 sModelo,
 sCRZ,
 sCOOI,
 sCOOF,
 sCRO,
 sVendaBruta,
 sGrandeTotal   : String;
begin
 iCont      := 1;

 sDtEmissao   := DateToStr(now);
 sHoraEmissao := TimeToStr(now);
 if FileExists('C:\RETORNO.txt')
 then begin
     Try
      AssignFile(ArqTXT,'C:\RETORNO.TXT');
      Reset(ArqTXT); {Abre o arquivo texto}
      While true
      do begin
          while not eof (ArqTXT)
          do begin
              Readln(ArqTXT,linha);
              iPosTwoDot  := Pos(':',linha);
              iTam        := Length(linha);

              if iCont = 3 then // Extrai a Data de Emissão
               begin
                sDtMovimento  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
                sDtMovimento  := RetiraArgumento(' ',sDtMovimento);
                sDataMovtoReducaoZ:=sDtMovimento;
               end
              else if iCont = 4 then // Extrai o Número de Série da Impressora
               begin
                sNumeroSerie  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
                sNumeroSerie  := RetiraArgumento(' ',sNumeroSerie);
                sMFAdicional  := Copy(sNumeroSerie,length(sNumeroSerie)-1,1);
                //if IsInteger(sMFAdicional) then sMFAdicional := ' ';              {comentei isso daqui !!}
                if sMFAdicional = '' then sMFAdicional := ' ';
                //gSerial       := sNumeroSerie;
                //gMFAdicional  := sMFAdicional;
               end
              else if iCont = 5 then // Extrai o Número do equipamento
               begin
                sNumeroEquip  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
                sNumeroEquip  := RetiraArgumento(' ',sNumeroEquip);
               end
              else if iCont = 6 then // Extrai o Modelo do documento fiscal
               begin
                sModelo  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
                sModelo  := RetiraArgumento(' ',sModelo);
               end
              else if iCont = 7 then // Extrai o COO Inicial
               begin
                sCOOI  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
                sCOOI  := RetiraArgumento(' ',sCOOI);
               end
              else if iCont = 8 then // Extrai o COO Final
               begin
                sCOOF  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
                sCOOF  := RetiraArgumento(' ',sCOOF);
               end
              else if iCont = 9 then // Extrai o Contador de Redução.
               begin
                sCRZ  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
                sCRZ  := RetiraArgumento(' ',sCRZ);
               end
              else if iCont = 10 then // Extrai o Reinício de Operação
               begin
                sCRO  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
                sCRO  := RetiraArgumento(' ',sCRO);
               end
              else if iCont = 11 then // Extrai o Valor da Venda Bruta
               begin
                sVendaBruta  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
                sVendaBruta  := RetiraArgumento(' ',sVendaBruta);
                sVendaBruta  := RetiraArgumento('.',sVendaBruta);
               end
              else if iCont = 12 then // Extrai o Grande Total
               begin
                sGrandeTotal  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
                sGrandeTotal  := RetiraArgumento(' ',sGrandeTotal);
                sGrandeTotal  := RetiraArgumento('.',sGrandeTotal);
               end;
               Inc(iCont);
             end;
         break;
       end;
   finally
    CloseFile(ArqTXT);
   end;

   //Faço a leitura no arquivo criptografado para verificar se as informações
   //da redução Z, se refere ao mesmo ECF liberado pelo sistema.
   LeIniCrypt(SDir_Arq_PAF,'ECF','Numero ECF',sCrypt_NumECF,SNome_Arq_PAF);
   Grava_Reducao:=False;
   With DM.QPesquisaBaseLocal
   do begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT DATA_MOVIMENTO,NRO_SERIE_EQP,VALOR_VENDA_GERAL FROM REDUCOES');
      Sql.Add('WHERE DATA_MOVIMENTO=:PDATA');
      Sql.Add('AND NRO_SERIE_EQP=:PNUMSERIE');
      Sql.Add('AND VALOR_VENDA_GERAL=:PGRANDETOTAL');
      ParamByName('PDATA').AsDate:=StrToDate(sDtMovimento);
      ParamByName('PNUMSERIE').AsString:=sCrypt_NumECF;
      ParamByName('PGRANDETOTAL').AsFloat:=StrtoFloat(sGrandeTotal);
      open;
      if IsEmpty
      then begin
           Grava_Reducao:=True;
           Try
             DM.TReducoes_Local.Close;
             DM.TReducoes_Local.Params[0].AsInteger:=-1;
             DM.TReducoes_Local.Open;
             DM.TReducoes_Local.Append;
             DM.TReducoes_LocalDATA_HORA.AsDateTime:=Now;
             DM.TReducoes_LocalDATA_MOVIMENTO.AsDateTime:=StrToDate(sDtMovimento);
             DM.TReducoes_LocalNRO_SERIE_EQP.AsString:=sNumeroserie;
             DM.TReducoes_LocalNR_ORDEM_EQP.AsString:=sNumeroEquip;
             DM.TReducoes_LocalMODELO_DOC.AsString:=sModelo;
             DM.TReducoes_LocalNRO_CONTADOR_INICIO.AsInteger:=StrToInt(sCOOI);
             DM.TReducoes_LocalNRO_CONTADOR_FIM.AsInteger:=StrToInt(sCOOF);
             DM.TReducoes_LocalNR_CONTADOR_Z.AsInteger:=StrToInt(sCRZ);
             DM.TReducoes_LocalCONTADOR_REINICIO.AsInteger:=StrToInt(sCRO);
             DM.TReducoes_LocalVALOR_VENDA_BRUTA.AsCurrency:=StrToFloat(sVendaBruta);
             DM.TReducoes_LocalVALOR_VENDA_GERAL.AsCurrency:=StrToFloat(sGrandeTotal);
             DM.TReducoes_Local.Post;
             DM.TReducoes_Local.ApplyUpdates(-1);
             nCodigo_Reducao:=DM.TReducoes_LocalCODIGO.AsInteger;
           Except
             on E: exception
             do begin
                InformaError('Erro ao Gravar Na Tabela de "REDUÇÕES NO BANCO LOCAL".'+#13+#13+
                             'Mensagem Interna: '+E.Message);
                end;
             end;
          end;
      end;     

   if FileExists('C:\Retorno.txt')then
      DeleteFile('C:\Retorno.txt');
  end;
end;

procedure GerarITMovtoECF60A;
var
 ArqTXT     : TextFile;
 linha      : String;
 iPos       : Integer;
 iPosTwoDot : Integer;
 iTam, iCont: Integer;
 iSequencia : Integer;
 ContAliq   : Integer;
 DadosTXT   : string;
 sql,
 sDescricao,
 sAliquota,
 sPosi_Aliquota,
 sValorAl   : String;
begin
 ContAliq       := 1;
 iSequencia     := 1;
 sDescricao     := '';
 sAliquota      := '';
 sPosi_Aliquota := '';
 sValorAl       := '0';
 iCont          := 1;
 DadosTXT       := '';

 if Grava_Reducao
 then begin
      DM.TReducoes_Local.Close;
      DM.TReducoes_Local.Params[0].AsInteger:=nCodigo_Reducao;
      DM.TReducoes_Local.Open;
      end;

  {Manipula arquivo gerado !!}
 Try
  AssignFile(ArqTXT,'C:\RETORNO.TXT');
  Reset(ArqTXT);
  while true do
   begin
    while not eof (ArqTXT) do
     begin
      Readln(ArqTXT,linha);
      iPosTwoDot  := Pos(':',linha);
      iTam        := Length(linha);

      if iCont > 4 then
       begin
        iPos       := -1;
        sDescricao :=  Copy(linha, 1, iPosTwoDot);
        sDescricao := RetiraArgumento('.',sDescricao);
        sDescricao := RetiraArgumento(':',sDescricao);

        if (Pos('Cancelamento ICMS',sDescricao)  > 0) or (Pos('Cancelamentos',sDescricao)  > 0)then
         begin
          sDescricao := 'CAN-T';
          sAliquota  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
          sAliquota  := RetiraArgumento(' ',sAliquota);
          sAliquota  := RetiraArgumento('.',sAliquota);

          if Grava_Reducao
          then begin
               DM.TReducoes_Local.Edit;
               DM.TReducoes_LocalVALOR_CANCELAMENTOS.AsCurrency:=StrToFloat(sAliquota);
               DM.TReducoes_Local.Post;
               DM.TReducoes_Local.ApplyUpdates(-1);
               end
         end else

        if Pos('Cancelamento ISSQN',sDescricao) > 0 then
         begin
          sDescricao := 'CAN-S';
          sAliquota  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
          sAliquota  := RetiraArgumento(' ',sAliquota);
          sAliquota  := RetiraArgumento('.',sAliquota);

          if Grava_Reducao
          then begin
               DM.TReducoes_Local.Edit;
               DM.TReducoes_LocalVALOR_CANCELAMENTOS.AsCurrency:=
                    DM.TReducoes_LocalVALOR_CANCELAMENTOS.AsCurrency + StrToFloat(sAliquota);
               DM.TReducoes_Local.Post;
               DM.TReducoes_Local.ApplyUpdates(-1);
               end
         end else

        if (Pos('Desconto ICMS',sDescricao) > 0) or (Pos('Descontos',sDescricao) > 0) then
         begin
          sDescricao := 'DT';
          sAliquota  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
          sAliquota  := RetiraArgumento(' ',sAliquota);
          sAliquota  := RetiraArgumento('.',sAliquota);

          if Grava_Reducao
          then begin
               DM.TReducoes_Local.Edit;
               DM.TReducoes_LocalVALOR_DESCONTOS.AsCurrency:=StrToFloat(sAliquota);
               DM.TReducoes_Local.Post;
               DM.TReducoes_Local.ApplyUpdates(-1);
               end
         end else

        if Pos('Desconto ISSQN',sDescricao) > 0 then
         begin
          sDescricao := 'DS';
          sAliquota  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
          sAliquota  := RetiraArgumento(' ',sAliquota);
          sAliquota  := RetiraArgumento('.',sAliquota);

          if Grava_Reducao
          then begin
               DM.TReducoes_Local.Edit;
               DM.TReducoes_LocalVALOR_DESCONTOS.AsCurrency:=
                  DM.TReducoes_LocalVALOR_DESCONTOS.AsCurrency + StrToFloat(sAliquota);
               DM.TReducoes_Local.Post;
               DM.TReducoes_Local.ApplyUpdates(-1);
               end
         end else

        if Pos('Substituicao Tributaria ICMS',sDescricao) > 0 then
         begin
          sDescricao := 'F';
          sAliquota  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
          sAliquota  := RetiraArgumento(' ',sAliquota);
          sAliquota  := RetiraArgumento('.',sAliquota);

          if Grava_Reducao
          then begin
               DM.TReducoes_Local.Edit;
               DM.TReducoes_LocalVALOR_SUBST_TRIB.AsCurrency:=StrToFloat(sAliquota);
               DM.TReducoes_Local.Post;
               DM.TReducoes_Local.ApplyUpdates(-1);
               end
         end else

        if Pos('Substituicao Tributaria ISSQN',sDescricao) > 0 then
         begin
          sDescricao := 'FS';
          sAliquota  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
          sAliquota  := RetiraArgumento(' ',sAliquota);
          sAliquota  := RetiraArgumento('.',sAliquota);

          if Grava_Reducao
          then begin
              DM.TReducoes_Local.Edit;
              DM.TReducoes_LocalVALOR_SUBST_TRIB.AsCurrency:=
                DM.TReducoes_LocalVALOR_SUBST_TRIB.AsCurrency + StrToFloat(sAliquota);
              DM.TReducoes_Local.Post;
              DM.TReducoes_Local.ApplyUpdates(-1);
              end
         end else

        if Pos('Isencao ICMS',sDescricao) > 0 then
         begin
          sDescricao := 'I';
          sAliquota  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
          sAliquota  := RetiraArgumento(' ',sAliquota);
          sAliquota  := RetiraArgumento('.',sAliquota);

          if Grava_Reducao
          then begin
               DM.TReducoes_Local.Edit;
               DM.TReducoes_LocalVALOR_ISENTO.AsCurrency:=StrToFloat(sAliquota);
               DM.TReducoes_Local.Post;
               DM.TReducoes_Local.ApplyUpdates(-1);
               end
         end else

        if Pos('Isencao ISSQN',sDescricao) > 0 then
         begin
          sDescricao := 'IS';
          sAliquota  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
          sAliquota  := RetiraArgumento(' ',sAliquota);
          sAliquota  := RetiraArgumento('.',sAliquota);

          if Grava_Reducao
          then begin
               DM.TReducoes_Local.Edit;
               DM.TReducoes_LocalVALOR_ISENTO.AsCurrency:=
                  DM.TReducoes_LocalVALOR_ISENTO.AsCurrency + StrToFloat(sAliquota);
               DM.TReducoes_Local.Post;
               DM.TReducoes_Local.ApplyUpdates(-1);
               end
         end else

        if Pos('Nao Incidencia ICMS',sDescricao) > 0 then
         begin
          sDescricao := 'N';
          sAliquota  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
          sAliquota  := RetiraArgumento(' ',sAliquota);
          sAliquota  := RetiraArgumento('.',sAliquota);

          if Grava_Reducao
          then begin
               DM.TReducoes_Local.Edit;
               DM.TReducoes_LocalVALOR_NAO_INCIDENCIA.AsCurrency:=StrToFloat(sAliquota);
               DM.TReducoes_Local.Post;
               DM.TReducoes_Local.ApplyUpdates(-1);
               end
         end else

        if Pos('Nao Incidencia ISSQN',sDescricao) > 0 then
         begin
          sDescricao := 'NS';
          sAliquota  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
          sAliquota  := RetiraArgumento(' ',sAliquota);
          sAliquota  := RetiraArgumento('.',sAliquota);

          if Grava_Reducao
          then begin
               DM.TReducoes_Local.Edit;
               DM.TReducoes_LocalVALOR_NAO_INCIDENCIA.AsCurrency:=
                 DM.TReducoes_LocalVALOR_NAO_INCIDENCIA.AsCurrency + StrToFloat(sAliquota);
               DM.TReducoes_Local.Post;
               DM.TReducoes_Local.ApplyUpdates(-1);
               end
         end else
        // alíquotas !!
         begin
          sAliquota :=  Copy(linha, 1, iPosTwoDot);
          sAliquota := RetiraArgumento('.',sAliquota);
          sAliquota := RetiraArgumento(':',sAliquota);
          sAliquota := Copy(sAliquota,1,4);
          sValorAl  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
          sValorAl  := RetiraArgumento('.',sValorAl);
          sValorAl  := RetiraArgumento(' ',sValorAl);
          sPosi_Aliquota := sAliquota;
          sPosi_Aliquota := IntToStr(ContAliq)+'T'+sPosi_Aliquota;
          sPosi_Aliquota := RetiraArgumento(' ',sPosi_Aliquota);
          sAliquota := RetiraArgumento(' ',sAliquota);

          if Grava_Reducao
          then begin
               With DM.TReducoes_Local
               do begin
                  Edit;
                  Fields.FieldByName('POSI_ALIQUOTA0' + IntToStr(ContAliq)).AsString:=sPosi_Aliquota;
                  Fields.FieldByName('ALIQUOTA0' + IntToStr(ContAliq)).AsString:=sAliquota;
                  Fields.FieldByName('VALOR_TPARCIAL0' + IntToStr(ContAliq)).AsFloat:=StrtoFloat(sValorAl);
                  Post;
                  ApplyUpdates(-1);
                  end;
             end;
          Inc(ContAliq);
         end;
        Inc(iSequencia);
       end;
      Inc(iCont);
     end;
     break;
   end;
 finally
  CloseFile(ArqTXT);
 end;
end;

procedure Tfrmcheckout.TFocoTimer(Sender: TObject);
begin
     TFoco.Enabled:=False;
     ForceForegroundWindow(frmcheckout.Handle);//Força o focu no formulario
end;

procedure GerarITMovtoECF60A_Somente_Totalizadores;
var
 ArqTXT     : TextFile;
 linha      : String;
 iPos       : Integer;
 iPosTwoDot : Integer;
 iTam, iCont: Integer;
 iSequencia : Integer;
 ContAliq   : Integer;
 DadosTXT   : string;
 sql,
 sSerieImp,
 sDescricao,
 sAliquota,
 sValorAl   : String;
begin
 ContAliq       := 1;
 iSequencia     := 1;
 sSerieImp      := '';
 sDescricao     := '';
 sAliquota      := '';
 sValorAl       := '0';
 iCont          := 1;
 DadosTXT       := '';

 DM.TTotalizadores_ECF.Close;
 DM.TTotalizadores_ECF.CreateDataSet;
 
  {Manipula arquivo gerado !!}
 Try
  AssignFile(ArqTXT,'C:\RETORNO.TXT');
  Reset(ArqTXT); {Abre o arquivo texto}
  while true do
   begin
    while not eof (ArqTXT) do
     begin
      Readln(ArqTXT,linha);
      iPosTwoDot  := Pos(':',linha);
      iTam        := Length(linha);

      if iCont = 4
      then begin
           iPos       := -1;
           sSerieImp := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
           sSerieImp := RetiraArgumento('.',sSerieImp);
           sSerieImp := RetiraArgumento(':',sSerieImp);
           sSerieImp := RetiraArgumento(' ',sSerieImp);
           end;
      if iCont > 6 then
       begin
        iPos       := -1;
        sDescricao :=  Copy(linha, 1, iPosTwoDot);
        sDescricao := RetiraArgumento('.',sDescricao);
        sDescricao := RetiraArgumento(':',sDescricao);

        if Pos('Substituicao Tributaria ICMS',sDescricao) > 0
        then begin
             sDescricao := 'F';
             sAliquota  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
             sAliquota  := RetiraArgumento(' ',sAliquota);
             sAliquota  := RetiraArgumento('.',sAliquota);
        end else if Pos('Substituicao Tributaria ISSQN',sDescricao) > 0
        then begin
             sDescricao := 'FS';
             sAliquota  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
             sAliquota  := RetiraArgumento(' ',sAliquota);
             sAliquota  := RetiraArgumento('.',sAliquota);
        end else if Pos('Isencao ICMS',sDescricao) > 0
        then begin
             sDescricao := 'I';
             sAliquota  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
             sAliquota  := RetiraArgumento(' ',sAliquota);
             sAliquota  := RetiraArgumento('.',sAliquota);
        end else if Pos('Isencao ISSQN',sDescricao) > 0
        then begin
             sDescricao := 'IS';
             sAliquota  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
             sAliquota  := RetiraArgumento(' ',sAliquota);
             sAliquota  := RetiraArgumento('.',sAliquota);
        end else if Pos('Nao Incidencia ICMS',sDescricao) > 0
        then begin
             sDescricao := 'N';
             sAliquota  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
             sAliquota  := RetiraArgumento(' ',sAliquota);
             sAliquota  := RetiraArgumento('.',sAliquota);
        end else if Pos('Nao Incidencia ISSQN',sDescricao) > 0
        then begin
             sDescricao := 'NS';
             sAliquota  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
             sAliquota  := RetiraArgumento(' ',sAliquota);
             sAliquota  := RetiraArgumento('.',sAliquota);
             end
        else begin // alíquotas !!
             sAliquota := Copy(linha, 1, iPosTwoDot);
             sAliquota := RetiraArgumento('.',sAliquota);
             sAliquota := RetiraArgumento(':',sAliquota);
             sAliquota := Copy(sAliquota,1,4);

             //sValorAl  := Copy(linha,iPosTwoDot+1,(iTam - iPosTwoDot));
             sValorAl  := Copy(linha,1,iPosTwoDot);
             sValorAl  := RetiraArgumento('.',sValorAl);
             sValorAl  := RetiraArgumento(':',sValorAl);
             sValorAl  := RetiraArgumento(' ',sValorAl);
             sAliquota := IntToStr(ContAliq)+'T'+sAliquota;
             sAliquota := RetiraArgumento(' ',sAliquota);

          DM.TTotalizadores_ECF.Append;
          DM.TTotalizadores_ECFALIQUOTA.Value:=sAliquota;
          if sValorAl='F'
          then DM.TTotalizadores_ECFVALOR.Value:='FF'
          else if sValorAl='I'
          then DM.TTotalizadores_ECFVALOR.Value:='II'
          else if sValorAl='N'
          then DM.TTotalizadores_ECFVALOR.Value:='NN'
          else DM.TTotalizadores_ECFVALOR.Value:=sValorAl;
          DM.TTotalizadores_ECFNUM_SERIE.Value:=sSerieImp;
          DM.TTotalizadores_ECF.Post;

          Inc(ContAliq);
         end;
        Inc(iSequencia);
       end;
      Inc(iCont);
     end;
     break;
   end;
 finally
  CloseFile(ArqTXT);
 end;

 if FileExists('C:\Retorno.txt')then
    DeleteFile('C:\Retorno.txt');

end;

procedure TfrmCheckout.Atualiza_Totalizadores_Parciais;
begin
     if not FileExists('C:\Apgef\Local\TotalizadoresEcf.xml')
     then begin
          if FileExists('C:\Retorno.txt')then
             DeleteFile('C:\Retorno.txt');

          GeraRelatorioTipo60M_e_60A(0,1,'2');//Gera somente o relatório 60A - Analitico
          end
     else begin
          DM.TTotalizadores_ECF.Open;
          DM.TTotalizadores_ECF.LoadFromFile(DM.TTotalizadores_ECF.FileName);
          DM.TTotalizadores_ECF.Last;
          end;
end;

function GravaDadosDocECF(fDenomina: String): Boolean;
begin
    Result := true;
    // obtem contadores
    COO:=0; GNF:=0; GRG:=0; CDC:=0; CCF:=0;
    ObterContadoresImpressora;
    Retorna_Informacao_Impressora;
    Try
      if COO > 0
      then begin
           DM.TDocEmitidos.Close;
           DM.TDocEmitidos.Params[0].AsInteger:=-1;
           DM.TDocEmitidos.Open;
           DM.TDocEmitidos.Append;
           DM.TDocEmitidosCOO.AsInteger:=COO;
           if fDenomina<>'RV'//Registro de venda
           then DM.TDocEmitidosGNF.AsInteger:=GNF
           else DM.TDocEmitidosGNF.AsInteger:=0;
           if fDenomina='RG'//Relatório Gerencial
           then DM.TDocEmitidosGRG.AsInteger:=GRG
           else DM.TDocEmitidosGRG.AsInteger:=0;
           if fDenomina='CC'//Comprovande de crédito ou débito
           then DM.TDocEmitidosCDC.AsInteger:=CDC
           else DM.TDocEmitidosCDC.AsInteger:=0;
           DM.TDocEmitidosDENOMINACAO.AsString:=fDenomina;
           DM.TDocEmitidosDATA_EMISSAO.AsDateTime:=Now;
           DM.TDocEmitidosHORA_EMISSAO.AsDateTime:=Now;
           DM.TDocEmitidosCAIXA.AsString:=sNum_Caixa;
           DM.TDocEmitidosNUM_SERIE_ECF.AsString:=sNum_Serie_ECF;
           DM.TDocEmitidos.Post;
           DM.TDocEmitidos.ApplyUpdates(-1);
           Imprimiu_Comprovante_nao_fiscal:=True;
           end;
    Except
      Result := false;
    end;
end;

function ObterContadoresImpressora: Boolean;
var aux : string;
begin
  Result := true;
  try
    if s_ImpFiscal = 'ECF Bematech'
    then begin
         // COO
         aux := Space(6);
         Retorno_imp_Fiscal := Bematech_FI_NumeroCupom(aux);
         Analisa_iRetorno();
         if Retorno_imp_Fiscal = 1
         then COO := StrToInt(aux);
         // GNF
         aux := Space(6);
         Retorno_imp_Fiscal := Bematech_FI_NumeroOperacoesNaoFiscais(aux);
         Analisa_iRetorno();
         if Retorno_imp_Fiscal = 1
         then GNF := StrToInt(aux);
         // GRG
         aux := Space(6);
         Retorno_imp_Fiscal := Bematech_FI_ContadorRelatoriosGerenciaisMFD(aux);
         Analisa_iRetorno();
         if Retorno_imp_Fiscal = 1
         then GRG := StrToInt(aux);
         // CDC
         aux := Space(4);
         Retorno_imp_Fiscal := Bematech_FI_ContadorComprovantesCreditoMFD(aux);
         Analisa_iRetorno();
         if Retorno_imp_Fiscal = 1
         then CDC := StrToInt(aux);
         // CCF
         aux := Space(6);
         Retorno_imp_Fiscal := Bematech_FI_ContadorCupomFiscalMFD(aux);
         Analisa_iRetorno();
         if Retorno_imp_Fiscal = 1
         then CCF := StrToInt(aux);
    end
    else if s_ImpFiscal = 'ECF Daruma'
    then begin
         // Outros
         aux := Space(66);
         Retorno_imp_Fiscal := Daruma_FIMFD_RetornaInformacao('21',aux);
         if Retorno_imp_Fiscal = 1
         then begin
              COO := StrToInt(Copy(aux,01,6));
              GNF := StrToInt(Copy(aux,13,6));
              CCF := StrToInt(Copy(aux,25,6));
              GRG := StrToInt(Copy(aux,43,6));
              end;
         // CDC
         aux := Space(4);
         Retorno_imp_Fiscal := Daruma_FIMFD_RetornaInformacao('45',aux);
         if Retorno_imp_Fiscal = 1
         then CDC := StrToInt(aux);
    end
    else if s_ImpFiscal = 'ECF Sweda'
    then begin
         // COO
         aux := Space(6);
         Retorno_imp_Fiscal := ECF_NumeroCupom(Pchar(aux));
         Analisa_iRetorno();
         if Retorno_imp_Fiscal = 1
         then COO := StrToInt(aux);
         // GNF
         aux := Space(6);
         Retorno_imp_Fiscal := ECF_NumeroOperacoesNaoFiscais(Pchar(aux));
         Analisa_iRetorno();
         if Retorno_imp_Fiscal = 1
         then GNF := StrToInt(aux);
         // GRG
         aux := Space(6);
         Retorno_imp_Fiscal := ECF_ContadorRelatoriosGerenciaisMFD(Pchar(aux));
         Analisa_iRetorno();
         if Retorno_imp_Fiscal = 1
         then GRG := StrToInt(aux);
         // CDC
         aux := Space(4);
         Retorno_imp_Fiscal := ECF_ContadorComprovantesCreditoMFD(Pchar(aux));
         Analisa_iRetorno();
         if Retorno_imp_Fiscal = 1
         then CDC := StrToInt(aux);
         // CCF
         aux := Space(6);
         Retorno_imp_Fiscal := ECF_ContadorCupomFiscalMFD(Pchar(aux));
         Analisa_iRetorno();
         if Retorno_imp_Fiscal = 1
         then CCF := StrToInt(aux);
    end
    else if s_ImpFiscal = 'ECF Elgin'
    then begin
         // COO
         aux := Space(6);
         Retorno_imp_Fiscal := Elgin_NumeroCupom(aux);
         Analisa_iRetorno();
         if Retorno_imp_Fiscal = 1
         then COO := StrToInt(aux);
         // GNF
         aux := Space(6);
         Retorno_imp_Fiscal := Elgin_NumeroOperacoesNaoFiscais(aux);
         Analisa_iRetorno();
         if Retorno_imp_Fiscal = 1
         then GNF := StrToInt(aux);
         // GRG
         aux := Space(6);
         Retorno_imp_Fiscal := Elgin_ContadorRelatoriosGerenciaisMFD(aux);
         Analisa_iRetorno();
         if Retorno_imp_Fiscal = 1
         then GRG := StrToInt(aux);
         // CDC
         aux := Space(4);
         Retorno_imp_Fiscal := Elgin_ContadorComprovantesCreditoMFD(aux);
         Analisa_iRetorno();
         if Retorno_imp_Fiscal = 1
         then CDC := StrToInt(aux);
         // CCF
         aux := Space(6);
         Retorno_imp_Fiscal := Elgin_ContadorCupomFiscalMFD(aux);
         Analisa_iRetorno();
         if Retorno_imp_Fiscal = 1
         then CCF := StrToInt(aux);
        end;
  except
    Result := false;
    MessageDlg('Erro ao capturar contadores!!!', mtWarning, [mbOK], 0);
  end;
end;

procedure Tfrmcheckout.EFocuAuxiliarEnter(Sender: TObject);
begin
     editCodigo.SetFocus;
     //editCodigo.Update;
end;

procedure Tfrmcheckout.TFechaTelaTimer(Sender: TObject);
begin
     Close;
end;

end.

