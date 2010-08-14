unit UPAF_ECF;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, StdCtrls, Tabs,
     URetornoImpressora, SysUtils, ExtCtrls, DB, DBCtrls, Grids, Dialogs, Menus,
     Printers, dmsyndAC, UBarsa, Math, DBXPress, DBClient, idGlobal, UAssinaDigital;

var
  s_usuario, s_empresa, s_razaoSocial, fechou, tipo_consultaProd, s_ImpFiscal,
  S_Nome_Consumidor, S_Endereco, S_CPF_ou_CNPJ, sInscricao_Estadual,
  sMsgPDV, sMD5, S_RG_IE, S_Cidade, S_UF, S_Cep, Str_ErroExtendido, sDataMovtoReducaoZ : String;
  retorno_imp_fiscal, n_usuario, n_vinculo_vendedor, Int_ErroExtendido, ECF_Respondendo : Integer;
  vLiberado, RetornouErro, acessoOK, Gravou_RelGerencial_BD,
  Imprimiu_Comprovante_nao_fiscal : Boolean;
  preco_aplicado : Currency;

  //Variaves de Codificacao Impressora
  sNome_Arq_PAF, sDir_Arq_PAF : String;
  sCrypt_NumSerie, sCrypt_NumECF, sCrypt_GrandeTotal, sCrypt_ModeloECF : String;

  //Leituras nos arquivos criptografados
  {LeIniCrypt('ECF','Numero Serie',sCrypt_NumSerie,SNome_Arq_PAF);
   LeIniCrypt('ECF','Numero ECF',sCrypt_NumECF,SNome_Arq_PAF);
   LeIniCrypt('ECF','Grande Total',sCrypt_GrandeTotal,SNome_Arq_PAF);
   LeIniCrypt('ECF','Modelo ECF',sCrypt_ModeloECF,SNome_Arq_PAF);}

  TD: TTransactionDesc;
  vTabelaProduto: TClientDataSet;

  function NomedoArquivo_MovtoECF(CNIEE,numeroserie:string;DataMovto:TDate):String;
  procedure VerificaUltimaReducaoSalvaemBD;
  function RetornaDataMovtoECF(Data:string):string;
  procedure ErroExtendidoDaruma(iST : Integer);

//--- Declaração de Funções das DLLS de Impressoras Fiscais e Não fiscais

// Funções da BEMAFI32.DLL Padrão BEMATECH

// Funções de Inicialização

function Bematech_FI_AlteraSimboloMoeda( SimboloMoeda: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ProgramaAliquota( Aliquota: String; ICMS_ISS: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ProgramaHorarioVerao: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NomeiaDepartamento( Indice: Integer; Departamento: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NomeiaTotalizadorNaoSujeitoIcms( Indice: Integer; Totalizador: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ProgramaArredondamento: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ProgramaTruncamento: Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_ProgramaTruncamento';
function Bematech_FI_LinhasEntreCupons( Linhas: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EspacoEntreLinhas( Dots: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ForcaImpactoAgulhas( ForcaImpacto: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';

// Funções do Cupom Fiscal

function Bematech_FI_AbreCupom( CGC_CPF: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VendeItem( Codigo: String; Descricao: String; Aliquota: String; TipoQuantidade: String; Quantidade: String; CasasDecimais: Integer; ValorUnitario: String; TipoDesconto: String; Desconto: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VendeItemDepartamento( Codigo: String; Descricao: String; Aliquota: String; ValorUnitario: String; Quantidade: String; Acrescimo: String; Desconto: String; IndiceDepartamento: String; UnidadeMedida: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaItemAnterior: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaItemGenerico( NumeroItem: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaCupom: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechaCupomResumido( FormaPagamento: String; Mensagem: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechaCupom( FormaPagamento: String; AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String; ValorPago: String; Mensagem: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ResetaImpressora: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_IniciaFechamentoCupom( AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EfetuaFormaPagamento( FormaPagamento: String; ValorFormaPagamento: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EfetuaFormaPagamentoDescricaoForma( FormaPagamento: string; ValorFormaPagamento: string; DescricaoFormaPagto: string ): integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_TerminaFechamentoCupom( Mensagem: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EstornoFormasPagamento( FormaOrigem: String; FormaDestino: String; Valor: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_UsaUnidadeMedida( UnidadeMedida: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AumentaDescricaoItem( Descricao: String ): Integer; StdCall; External 'BEMAFI32.DLL';

// Funções dos Relatórios Fiscais

function Bematech_FI_LeituraX: Integer; StdCall; External 'BEMAFI32.DLL' ;
function Bematech_FI_ReducaoZ( Data: String; Hora: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RelatorioGerencial( Texto: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RelatorioGerencialTEF( Texto: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechaRelatorioGerencial: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalData( DataInicial: String; DataFinal: String ):Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalReducao( ReducaoInicial: String; ReducaoFinal: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalSerialData( DataInicial: String; DataFinal: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalSerialReducao( ReducaoInicial: String; ReducaoFinal: String ): Integer; StdCall; External 'BEMAFI32.DLL';

// Funções das Operações Não Fiscais

function Bematech_FI_RecebimentoNaoFiscal( IndiceTotalizador: String; Valor: String; FormaPagamento: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AbreComprovanteNaoFiscalVinculado( FormaPagamento: String; Valor: String; NumeroCupom: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_UsaComprovanteNaoFiscalVinculado( Texto: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_UsaComprovanteNaoFiscalVinculadoTEF( Texto: String ): Integer; StdCall; External 'BEMAFI32.DLL'
function Bematech_FI_FechaComprovanteNaoFiscalVinculado: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_Sangria( Valor: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_Suprimento( Valor: String; FormaPagamento: String ): Integer; StdCall; External 'BEMAFI32.DLL';

// Funções de Informações da Impressora

function Bematech_FI_NumeroSerie( NumeroSerie: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroSerieCriptografado( NumeroSerie: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroSerieDescriptografado( NumeroSerieCriptografado: String; NumeroSerieDescriptografado: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_SubTotal( SubTotal: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VendaBruta( VendaBruta: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroCupom( NumeroCupom: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraXSerial: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VersaoFirmware( VersaoFirmware: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CGC_IE( CGC: String; IE: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_GrandeTotal( GrandeTotal: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_Cancelamentos( ValorCancelamentos: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_Descontos( ValorDescontos: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroOperacoesNaoFiscais( NumeroOperacoes: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroCuponsCancelados( NumeroCancelamentos: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroIntervencoes( NumeroIntervencoes: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroReducoes( NumeroReducoes: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroSubstituicoesProprietario( NumeroSubstituicoes: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_UltimoItemVendido( NumeroItem: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ClicheProprietario( Cliche: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroCaixa( NumeroCaixa: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroLoja( NumeroLoja: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_SimboloMoeda( SimboloMoeda: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_MinutosLigada( Minutos: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_MinutosImprimindo( Minutos: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaModoOperacao( Modo: string ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaEpromConectada( Flag: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FlagsFiscais( Var Flag: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ValorPagoUltimoCupom( ValorCupom: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DataHoraImpressora( Data: String; Hora: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ContadoresTotalizadoresNaoFiscais( Contadores: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaTotalizadoresNaoFiscais( Totalizadores: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DataHoraReducao( Data: String; Hora: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DataMovimento( Data: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaTruncamento( Flag: string ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_Acrescimos( ValorAcrescimos: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ContadorBilhetePassagem( ContadorPassagem: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaAliquotasIss( Flag: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaFormasPagamento( Formas: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaRecebimentoNaoFiscal( Recebimentos: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaDepartamentos( Departamentos: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaTipoImpressora( Var TipoImpressora: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaTotalizadoresParciais( Totalizadores: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RetornoAliquotas( Aliquotas: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaEstadoImpressora( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DadosUltimaReducao( DadosReducao: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_MonitoramentoPapel( Var Linhas: Integer): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaIndiceAliquotasIss( Flag: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ValorFormaPagamento( FormaPagamento: String; Valor: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ValorTotalizadorNaoFiscal( Totalizador: String; Valor: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_TotalIcmsCupom( ValorIcms: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaReducaoZAutomatica ( Flag: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';

// Funções de Autenticação e Gaveta de Dinheiro

function Bematech_FI_Autenticacao:Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_Autenticacao';
function Bematech_FI_ProgramaCaracterAutenticacao( Parametros: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AcionaGaveta:Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_AcionaGaveta';
function Bematech_FI_VerificaEstadoGaveta( Var EstadoGaveta: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';

// Funções para a Impressora Restaurante

function Bematech_FIR_AbreCupomRestaurante( Mesa: String; CGC_CPF: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_RegistraVenda( Mesa: String; Codigo: String; Descricao: String; Aliquota: String; Quantidade: String; ValorUnitario: String; FlagAcrescimoDesconto: String; ValorAcrescimoDesconto: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_CancelaVenda( Mesa: String; Codigo: String; Descricao: String; Aliquota: String; Quantidade: String; ValorUnitario: String; FlagAcrescimoDesconto: String; ValorAcrescimoDesconto: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_ConferenciaMesa( Mesa: String; FlagAcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_AbreConferenciaMesa( Mesa: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_FechaConferenciaMesa( FlagAcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_TransferenciaMesa( MesaOrigem: String; MesaDestino: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_ContaDividida( NumeroCupons: String; ValorPago: String; CGC_CPF: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_FechaCupomContaDividida( NumeroCupons: String; FlagAcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String; FormasPagamento: String; ValorFormasPagamento: String; ValorPagoCliente: String; CGC_CPF: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_TransferenciaItem( MesaOrigem: String; Codigo: String; Descricao: String; Aliquota: String; Quantidade: String; ValorUnitario: String; FlagAcrescimoDesconto: String; ValorAcrescimoDesconto: String; MesaDestino: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_RelatorioMesasAbertas( TipoRelatorio: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_ImprimeCardapio: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_RelatorioMesasAbertasSerial: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_CardapioPelaSerial: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_RegistroVendaSerial( Mesa: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_VerificaMemoriaLivre( Bytes: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_FechaCupomRestaurante( FormaPagamento: String; FlagAcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String; ValorFormaPagto: String; Mensagem: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_FechaCupomResumidoRestaurante( FormaPagamento: String; Mensagem: String ): Integer; StdCall; External 'BEMAFI32.DLL';

// Função para a Impressora Bilhete de Passagem

function Bematech_FI_AbreBilhetePassagem( ImprimeValorFinal: string; ImprimeEnfatizado: string; Embarque: string; Destino: string; Linha: string; Prefixo: string; Agente: string; Agencia: string; Data: string; Hora: string; Poltrona: string; Plataforma: string ): Integer; StdCall; External 'BEMAFI32.DLL';

// Funções de Impressão de Cheques

function Bematech_FI_ProgramaMoedaSingular( MoedaSingular: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ProgramaMoedaPlural( MoedaPlural: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaImpressaoCheque: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaStatusCheque( Var StatusCheque: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ImprimeCheque( Banco: String; Valor: String; Favorecido: String; Cidade: String; Data: String; Mensagem: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_IncluiCidadeFavorecido( Cidade: String; Favorecido: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ImprimeCopiaCheque: Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_ImprimeCopiaCheque';

// Outras Funções

function Bematech_FI_AbrePortaSerial: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RetornoImpressora( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechaPortaSerial: Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_FechaPortaSerial';
function Bematech_FI_MapaResumo:Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_MapaResumo';
function Bematech_FI_AberturaDoDia( ValorCompra: string; FormaPagamento: string ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechamentoDoDia: Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_FechamentoDoDia';
function Bematech_FI_ImprimeConfiguracoesImpressora:Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_ImprimeConfiguracoesImpressora';
function Bematech_FI_ImprimeDepartamentos: Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_ImprimeDepartamentos';
function Bematech_FI_RelatorioTipo60Analitico: Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_RelatorioTipo60Analitico';
function Bematech_FI_RelatorioTipo60Mestre: Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_RelatorioTipo60Mestre';
function Bematech_FI_VerificaImpressoraLigada: Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_VerificaImpressoraLigada';
function Bematech_FI_ImpressaoCarne( Titulo, Percelas, Datas: string; Quantidade: integer; Texto, Cliente, RG_CPF, Cupom: string; Vias, Assina: integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_InfoBalanca( Porta: string; Modelo: integer; Peso, PrecoKilo, Total: string ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DadosSintegra( DataInicio: string; DataFinal: string ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_IniciaModoTEF: Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_IniciaModoTEF';
function Bematech_FI_FinalizaModoTEF: Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_FinalizaModoTEF';
function Bematech_FI_VersaoDll( Versao: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RegistrosTipo60: Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_RegistrosTipo60';
function Bematech_FI_LeArquivoRetorno( Retorno: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_GeraRegistrosCAT52MFD( cArquivo: String; cData: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_GeraRegistrosCAT52MFDEx( cArquivo: String; cData: String; cArqDestino: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DataHoraGravacaoUsuarioSWBasicoMFAdicional( dataUsuario, dataSoftwareBasico: String; var letraAdicional: char ): integer; stdcall; external 'BEMAFI32.DLL';

// Funções da Impressora Fiscal MFD

function Bematech_FI_AbreCupomMFD(CGC: string; Nome: string; Endereco : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaCupomMFD(CGC, Nome, Endereco: string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ProgramaFormaPagamentoMFD(FormaPagto, OperacaoTef: String) : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EfetuaFormaPagamentoMFD(FormaPagamento, ValorFormaPagamento, Parcelas, DescricaoFormaPagto: string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CupomAdicionalMFD(): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AcrescimoDescontoItemMFD (Item, AcrescimoDesconto,TipoAcrescimoDesconto, ValorAcrescimoDesconto: string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NomeiaRelatorioGerencialMFD (Indice, Descricao : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AutenticacaoMFD(Linhas, Texto : string) : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AbreComprovanteNaoFiscalVinculadoMFD(FormaPagamento, Valor, NumeroCupom, CGC, nome, Endereco : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ReimpressaoNaoFiscalVinculadoMFD() : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AbreRecebimentoNaoFiscalMFD(CGC, Nome, Endereco : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EfetuaRecebimentoNaoFiscalMFD(IndiceTotalizador, ValorRecebimento : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_IniciaFechamentoRecebimentoNaoFiscalMFD(AcrescimoDesconto,TipoAcrescimoDesconto, ValorAcrescimo, ValorDesconto : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechaRecebimentoNaoFiscalMFD(Mensagem : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaRecebimentoNaoFiscalMFD(CGC, Nome, Endereco : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AbreRelatorioGerencialMFD(Indice : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_UsaRelatorioGerencialMFD(Texto : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_UsaRelatorioGerencialMFDTEF(Texto : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_SegundaViaNaoFiscalVinculadoMFD(): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EstornoNaoFiscalVinculadoMFD(CGC, Nome, Endereco : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroSerieMFD(NumeroSerie : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VersaoFirmwareMFD(VersaoFirmware : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CNPJMFD(CNPJ : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_InscricaoEstadualMFD(InscricaoEstadual : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_InscricaoMunicipalMFD(InscricaoMunicipal : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_TempoOperacionalMFD(TempoOperacional : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_MinutosEmitindoDocumentosFiscaisMFD(Minutos : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ContadoresTotalizadoresNaoFiscaisMFD(Contadores : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaTotalizadoresNaoFiscaisMFD(Totalizadores : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaFormasPagamentoMFD(FormasPagamento : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaRecebimentoNaoFiscalMFD(Recebimentos : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaRelatorioGerencialMFD(Relatorios : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ContadorComprovantesCreditoMFD(Comprovantes : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ContadorOperacoesNaoFiscaisCanceladasMFD(OperacoesCanceladas : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ContadorRelatoriosGerenciaisMFD (Relatorios : String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ContadorCupomFiscalMFD(CuponsEmitidos : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ContadorFitaDetalheMFD(ContadorFita : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ComprovantesNaoFiscaisNaoEmitidosMFD(Comprovantes : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroSerieMemoriaMFD(NumeroSerieMFD : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_MarcaModeloTipoImpressoraMFD(Marca, Modelo, Tipo : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ReducoesRestantesMFD(Reducoes : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaTotalizadoresParciaisMFD(Totalizadores : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DadosUltimaReducaoMFD(DadosReducao : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalDataMFD(DataInicial, DataFinal, FlagLeitura : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalReducaoMFD(ReducaoInicial, ReducaoFinal, FlagLeitura : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalSerialDataMFD(DataInicial, DataFinal, FlagLeitura : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalSerialReducaoMFD(ReducaoInicial, ReducaoFinal, FlagLeitura : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraChequeMFD(CodigoCMC7 : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ImprimeChequeMFD(NumeroBanco, Valor, Favorecido, Cidade, Data, Mensagem, ImpressaoVerso, Linhas : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_HabilitaDesabilitaRetornoEstendidoMFD(FlagRetorno : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RetornoImpressoraMFD( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer; Var ST3: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AbreBilhetePassagemMFD(Embarque, Destino, Linha, Agencia, Data, Hora, Poltrona, Plataforma, TipoPassagem, RGCliente, NomeCliente, EnderecoCliente, UFDetino: string ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaAcrescimoDescontoItemMFD( cFlag, cItem: string ): integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_SubTotalizaCupomMFD: integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_SubTotalizaRecebimentoMFD: integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_TotalLivreMFD( cMemoriaLivre: string ): integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_TamanhoTotalMFD( cTamanhoMFD: string ): integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AcrescimoDescontoSubtotalRecebimentoMFD( cFlag, cTipo, cValor: string ): integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AcrescimoDescontoSubtotalMFD( cFlag, cTipo, cValor: string): integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaAcrescimoDescontoSubtotalMFD( cFlag: string): integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaAcrescimoDescontoSubtotalRecebimentoMFD( cFlag: string ): integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_TotalizaCupomMFD: integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_TotalizaRecebimentoMFD: integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_PercentualLivreMFD( cMemoriaLivre: string ): integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DataHoraUltimoDocumentoMFD( cDataHora: string ): integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_MapaResumoMFD:Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_MapaResumoMFD';
function Bematech_FI_RelatorioTipo60AnaliticoMFD: Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_RelatorioTipo60AnaliticoMFD';
function Bematech_FI_ValorFormaPagamentoMFD( FormaPagamento: String; Valor: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ValorTotalizadorNaoFiscalMFD( Totalizador: String; Valor: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaEstadoImpressoraMFD( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer; Var ST3: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_IniciaFechamentoCupomMFD( AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimo: String; ValorDesconto: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_TerminaFechamentoCupomCodigoBarrasMFD( cMensagem: String; cTipoCodigo: String; cCodigo: String; iAltura: Integer; iLargura: Integer; iPosicaoCaracteres: Integer; iFonte: Integer; iMargem: Integer; iCorrecaoErros: Integer; iColunas: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaItemNaoFiscalMFD( NumeroItem: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AcrescimoItemNaoFiscalMFD( NumeroItem: String; AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaAcrescimoNaoFiscalMFD( NumeroItem: String; AcrescimoDesconto: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ImprimeClicheMFD:Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_ImprimeClicheMFD';
function Bematech_FI_ImprimeInformacaoChequeMFD( Posicao: Integer; Linhas: Integer; Mensagem: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RelatorioSintegraMFD( iRelatorios : Integer;
                                          cArquivo    : String;
                                          cMes        : String;
                                          cAno        : String;
                                          cRazaoSocial: String;
                                          cEndereco   : String;
                                          cNumero     : String;
                                          cComplemento: String;
                                          cBairro     : String;
                                          cCidade     : String;
                                          cCEP        : String;
                                          cTelefone   : String;
                                          cFax        : String;
                                          cContato    : String ): Integer; StdCall; External 'BEMAFI32.DLL';

function Bematech_FI_GeraRelatorioSintegraMFD( iRelatorios : Integer;
                                              cArquivoOrigem : String;
                                              cArquivoDestino: String;
                                              cMes           : String;
                                              cAno           : String;
                                              cRazaoSocial   : String;
                                              cEndereco      : String;
                                              cNumero        : String;
                                              cComplemento   : String;
                                              cBairro        : String;
                                              cCidade        : String;
                                              cCEP           : String;
                                              cTelefone      : String;
                                              cFax           : String;
                                              cContato       : String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DownloadMF( Arquivo: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DownloadMFD( Arquivo: String; TipoDownload: String; ParametroInicial: String; ParametroFinal: String; UsuarioECF: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FormatoDadosMFD( ArquivoOrigem: String; ArquivoDestino: String; TipoFormato: String; TipoDownload: String; ParametroInicial: String; ParametroFinal: String; UsuarioECF: String ): Integer; StdCall; External 'BEMAFI32.DLL';

// Funções disponíveis somente na impressora fiscal MP-2000 TH FI versão 01.01.01 ou 01.00.02

function Bematech_FI_AtivaDesativaVendaUmaLinhaMFD( iFlag: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AtivaDesativaAlinhamentoEsquerdaMFD( iFlag: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AtivaDesativaCorteProximoMFD(): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AtivaDesativaTratamentoONOFFLineMFD( iFlag: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_StatusEstendidoMFD( Var iStatus: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaFlagCorteMFD( Var iStatus: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_TempoRestanteComprovanteMFD( cTempo: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_UFProprietarioMFD( cUF: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_GrandeTotalUltimaReducaoMFD( cGT: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DataMovimentoUltimaReducaoMFD( cData: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_SubTotalComprovanteNaoFiscalMFD( cSubTotal: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_InicioFimCOOsMFD( cCOOIni, cCOOFim: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_InicioFimGTsMFD( cGTIni, cGTFim: String ): Integer; StdCall; External 'BEMAFI32.DLL';

// Função para Configuração dos Códigos de Barras

function Bematech_FI_ConfiguraCodigoBarrasMFD( Altura: Integer; Largura: Integer; PosicaoCaracteres: Integer; Fonte: Integer; Margem: Integer): Integer; StdCall; External 'BEMAFI32.DLL';

// Funções para Impressão dos Códigos de Barras

function Bematech_FI_CodigoBarrasUPCAMFD( Codigo: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasUPCEMFD( Codigo: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasEAN13MFD( Codigo: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasEAN8MFD( Codigo: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasCODE39MFD( Codigo: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasCODE93MFD( Codigo: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasCODE128MFD( Codigo: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasITFMFD( Codigo: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasCODABARMFD( Codigo: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasISBNMFD( Codigo: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasMSIMFD( Codigo: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasPLESSEYMFD( Codigo: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasPDF417MFD( NivelCorrecaoErros: Integer; Altura: Integer; Largura: Integer; Colunas: Integer; Codigo: String ): Integer; StdCall; External 'BEMAFI32.DLL';

Procedure Analisa_iRetorno();
Procedure Retorno_Impressora;

{===============================================================================
********************************************************************************

                      DECLARAÇÃO DAS FUNÇÕES DA DARUMA32.DLL

********************************************************************************
===============================================================================}
{Declaracao da Dll Integradora Daruma32.dll}

// Métodos do Cupom Fiscal

function Daruma_FI_AbreCupom( CPF_ou_CNPJ: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VendeItem( Codigo: String; Descricao: String; Aliquota: String; Tipo_de_Quantidade: String; Quantidade: String; Casas_Decimais: Integer; Valor_Unitario: String; Tipo_de_Desconto: String; Valor_do_Desconto: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VendeItemDepartamento( Codigo: String; Descricao: String; Aliquota: String; Valor_Unitario: String; Quantidade: String; Valor_do_Desconto: String; Valor_do_Acrescimo: String; Indice_Departamento: String; Unidade_Medida: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VendeItemTresDecimais( Codigo: String; Descricao: String; Aliquota: String; Quantidade: String;  Valor_Unitario: String; Acrescimo_ou_Desconto: String; Percentual_Acrescimo_ou_Desconto : String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_FechaCupomResumido( Descricao_da_Forma_de_Pagamento: String; Mensagem_Promocional: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_IniciaFechamentoCupom( Acrescimo_ou_Desconto: String; Tipo_do_Acrescimo_ou_Desconto: String; Valor_do_Acrescimo_ou_Desconto: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_EfetuaFormaPagamento( Descricao_da_Forma_Pagamento: String; Valor_da_Forma_Pagamento: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_EfetuaFormaPagamentoDescricaoForma( Descricao_da_Forma_Pagamento: string; Valor_da_Forma_Pagamento: string; Texto_Livre: string ): integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_IdentificaConsumidor( Nome_do_Consumidor: String; Endereco: String; CPF_ou_CNPJ: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_TerminaFechamentoCupom( Mensagem_Promocional: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_FechaCupom( Forma_de_Pagamento: String; Acrescimo_ou_Desconto: String; Tipo_Acrescimo_ou_Desconto: String; Valor_Acrescimo_ou_Desconto: String; Valor_Pago: String; Mensagem_Promocional: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_CancelaItemAnterior: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_CancelaItemGenerico( Numero_Item: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_CancelaCupom: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_AumentaDescricaoItem( Descricao_Extendida: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_UsaUnidadeMedida( Unidade_Medida: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_EmitirCupomAdicional: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_EstornoFormasPagamento( Forma_de_Origem: String; Nova_Forma: String; Valor_Total_Pago: String ): Integer; StdCall; External 'Daruma32.dll';

// Métodos para Recebimentos e Relatórios

function Daruma_FI_AbreComprovanteNaoFiscalVinculado( Forma_de_Pagamento: String; Valor_Pago: String; Numero_do_Cupom: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_UsaComprovanteNaoFiscalVinculado( Texto_Livre: String ): Integer; StdCall; External 'Daruma32.dll'
function Daruma_FI_FechaComprovanteNaoFiscalVinculado: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RelatorioGerencial( Texto_Livre: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_AbreRelatorioGerencial: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_EnviarTextoCNF( Texto_Livre: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_FechaRelatorioGerencial: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RecebimentoNaoFiscal( Descricao_do_Totalizador: String; Valor_do_Recebimento: String; Forma_de_Pagamento: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_AbreRecebimentoNaoFiscal( Descricao_do_Totalizador: String; Acrescimo_ou_Desconto: String; Tipo_Acrescimo_ou_Desconto: String; Valor_Acrescimo_ou_Desconto: String; Valor_do_Recebimento: String; Texto_Livre: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_EfetuaFormaPagamentoNaoFiscal( Forma_de_Pagamento: String; Valor_da_Forma_Pagamento: String; Texto_Livre: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_Sangria( Valor_da_Sangria: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_Suprimento( Valor_do_Suprimento: String; Forma_de_Pagamento: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_FundoCaixa( Valor_do_Fundo_Caixa: String; Forma_de_Pagamento: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_LeituraX: Integer; StdCall; External 'Daruma32.dll' ;
function Daruma_FI_LeituraXSerial: Integer; StdCall; External 'Daruma32.dll' ;
function Daruma_FI_ReducaoZ( Data: String; Hora: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_ReducaoZAjustaDataHora( Data: String; Hora: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_LeituraMemoriaFiscalData( Data_Inicial: String; Data_Final: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_LeituraMemoriaFiscalReducao( Reducao_Inicial: String; Reducao_Final: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_LeituraMemoriaFiscalSerialData( Data_Inicial: String; Data_Final: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_LeituraMemoriaFiscalSerialReducao( Reducao_Inicial: String; Reducao_Final: String ): Integer; StdCall; External 'Daruma32.dll';

//Métodos para gerar o arquivo Atocotepe17/04 para o paf
function Daruma_FIMFD_GerarAtoCotepePafData(DataIni: string; DataFim: string): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIMFD_GerarAtoCotepePafCOO(COOIni: string; COOFim: string): Integer; StdCall; External 'Daruma32.dll';

// Métodos Gaveta, Autentica e Outras

function Daruma_FI_VerificaDocAutenticacao: Integer; StdCall; External 'Daruma32.dll'
function Daruma_FI_Autenticacao: Integer; StdCall; External 'Daruma32.dll' Name 'Daruma_FI_Autenticacao';
function Daruma_FI_AutenticacaoStr( Autenticacao_Str :string ): Integer; StdCall; External 'Daruma32.dll'
function Daruma_FI_VerificaEstadoGaveta( Var Estado_Gaveta: Integer ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VerificaEstadoGavetaStr( Estado_Gaveta: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_AcionaGaveta: Integer; StdCall; External 'Daruma32.dll'
function Daruma_FI_AbrePortaSerial: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_FechaPortaSerial: Integer; StdCall; External 'Daruma32.dll'
function Daruma_FI_AberturaDoDia( Valor_do_Suprimento: string; Forma_de_Pagamento: string ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_FechamentoDoDia: Integer; StdCall; External 'Daruma32.dll' Name 'Daruma_FI_FechamentoDoDia';
function Daruma_FI_ImprimeConfiguracoesImpressora: Integer; StdCall; External 'Daruma32.dll'
function Daruma_FI_RegistraNumeroSerie: Integer; StdCall; External 'Daruma32.dll' ;
function Daruma_FI_VerificaNumeroSerie: Integer; StdCall; External 'Daruma32.dll' ;
function Daruma_FI_RetornaSerialCriptografado( SerialCriptografado :string; NumeroSerial: string ): Integer; StdCall; External 'Daruma32.dll'
function Daruma_FI_ConfiguraHorarioVerao( DataEntrada: string; DataSaida: string ; controle: string): Integer; StdCall; External 'Daruma32.dll' ;

// Métodos Prog e Config

function Daruma_FI_ProgramaAliquota( Valor_Aliquota: String; Tipo_Aliquota: Integer ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_NomeiaTotalizadorNaoSujeitoIcms( Indice_do_Totalizador: Integer; Nome_do_Totalizador: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_ProgramaFormasPagamento( Descricao_das_Formas_Pagamento: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_ProgramaOperador( Nome_do_Operador: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_ProgramaArredondamento: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_ProgramaTruncamento: Integer; StdCall; External 'Daruma32.dll' Name 'Daruma_FI_ProgramaTruncamento';
function Daruma_FI_LinhasEntreCupons( Linhas_Entre_Cupons: Integer ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_EspacoEntreLinhas( Espaco_Entre_Linhas: Integer ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_ProgramaHorarioVerao: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_EqualizaFormasPgto: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_ProgramaVinculados( Vinculado: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_ProgFormasPagtoSemVincular( Descricao_da_Forma_Pagamento: String ): Integer; StdCall; External 'Daruma32.dll';

// Métodos de Configuração e Registry

function Daruma_FI_CfgFechaAutomaticoCupom( Flag: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_CfgRedZAutomatico( Flag: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_CfgImpEstGavVendas( Flag: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_CfgLeituraXAuto( Flag: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_CfgCalcArredondamento( Flag: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_CfgHorarioVerao( Flag: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_CfgSensorAut( Flag: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_CfgCupomAdicional( Flag: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_CfgPermMensPromCNF( Flag: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_CfgEspacamentoCupons( DistanciaCupons: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_CfgHoraMinReducaoZ( Hora_Min_para_ReducaoZ: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_CfgLimiarNearEnd( NumeroLinhas: String ): Integer; StdCall; External 'Daruma32.dll';

function Daruma_Registry_AlteraRegistry( Chave: String; ValorChave: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_Porta( Porta: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_Path( Path: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_Status( Status: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_StatusFuncao( StatusFuncao: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_Retorno( Retorno: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_ControlePorta( ControlePorta: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_ModoGaveta( ModoGaveta: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_Log( Log: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_NomeLog( NomeLog: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_Separador( Separador: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_SeparaMsgPromo( SeparaMsgPromo: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_ZAutomatica( ZAutomatica: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_XAutomatica( XAutomatica: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_VendeItemUmaLinha( VendeItemUmaLinha: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_Default: Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_RetornaValor( Produto: String; Chave: String; Valor: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_TerminalServer( TerminalServer: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_ErroExtendidoOk( ValorErro: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_AbrirDiaFiscal( AbrirDiaFiscal: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_VendaAutomatica( VendaAutomatica: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_IgnorarPoucoPapel( IgnorarPoucoPapel: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_ImprimeRegistry( Produto: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_TEF_NumeroLinhasImpressao( NumeroLinhasImpressao: String ): Integer; StdCall; External 'Daruma32.dll'
function Daruma_Registry_MFD_ArredondaValor( Valor: String ): Integer; StdCall; External 'Daruma32.dll'
function Daruma_Registry_MFD_ArredondaQuantidade( Quantidade: String ): Integer; StdCall; External 'Daruma32.dll'
function Daruma_Registry_MFD_ProgramarSinalSonoro( NomeChave: String; Valor: String ): Integer; StdCall; External 'Daruma32.dll'
function Daruma_Registry_MFD_LeituraMFCompleta( Valor: String ): Integer; StdCall; External 'Daruma32.dll'
function Daruma_Registry_MFDValorFinal( ValorFinal: String ): Integer; StdCall; External 'Daruma32.dll'
function Daruma_Registry_NumeroSerieNaoFormatado( Formatado: String ): Integer; StdCall; External 'Daruma32.dll'
function Daruma_Registry_CupomAdicionalDll( AdicionalDll: String ): Integer; StdCall; External 'Daruma32.dll'
function Daruma_Registry_CupomAdicionalDllConfig( ConfigAdicionalDll: String ): Integer; StdCall; External 'Daruma32.dll'
function Daruma_Registry_PCExpanionLogin( FlagLogin: String ): Integer; StdCall; External 'Daruma32.dll'
function Daruma_Registry_LogTamMaxMB( LogTamMaxMB: String ): Integer; StdCall; External 'Daruma32.dll'
function Daruma_Registry_AlterarRegistry( Nome_Produto: String; Nome_Chave: String; Valor_Chave: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_SintegraUF( UF: String ): Integer; StdCall; External 'Daruma32.dll'  

//function Daruma_Registry_MaxFechamentoAutomatico( MaxFechamentoAutomatico: String ): Integer; StdCall; External 'Daruma32.dll'

// Métodos de Informações e Status
function Daruma_FI_StatusCupomFiscal( StatusCupomFiscal: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_StatusRelatorioGerencial( StatusRelGerencial: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_StatusComprovanteNaoFiscalVinculado( StatusCNFV: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_StatusComprovanteNaoFiscalNaoVinculado( StatusCNFNV: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VerificaImpressoraLigada: Integer; StdCall; External 'Daruma32.dll'
function Daruma_FI_VerificaTotalizadoresParciais( Totalizadores: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VerificaModoOperacao( Modo: string ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VerificaTotalizadoresNaoFiscais( Totalizadores: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VerificaTotalizadoresNaoFiscaisEx( Totalizadores: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VerificaTruncamento( Flag: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VerificaAliquotasIss( Flag: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VerificaIndiceAliquotasIss( Flag: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VerificaRecebimentoNaoFiscal( Recebimentos: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VerificaTipoImpressora( Var TipoImpressora: Integer ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VerificaStatusCheque( StatusCheque: Integer ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VerificaModeloECF: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VerificaDescricaoFormasPagamento( Descricao: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VerificaXPendente( XPendente: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VerificaZPendente( ZPendente: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VerificaDiaAberto( DiaAberto: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VerificaHorarioVerao( HoraioVerao: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VerificaFormasPagamento( Formas: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VerificaFormasPagamentoEx( FormasEx: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VerificaEpromConectada( Flag: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornarVersaoDLL(Versao: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VerificaEstadoImpressora( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_ClicheProprietario( Cliche: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_ClicheProprietarioEx( ClicheEx: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_NumeroCaixa( NumeroCaixa: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_NumeroLoja( NumeroLoja: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_NumeroSerie( NumeroSerie: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VersaoFirmware( VersaoFirmware: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_CGC_IE( CGC: String; IE: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_LerAliquotasComIndice(AliquotasComIndice: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_NumeroCupom( NumeroCupom: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_COO(Inicial: String; Final: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_MinutosImprimindo( Minutos: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_MinutosLigada( Minutos: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_NumeroSubstituicoesProprietario( NumeroSubstituicoes: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_NumeroIntervencoes( NumeroIntervencoes: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_NumeroReducoes( NumeroReducoes: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_NumeroCuponsCancelados( NumeroCancelamentos: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_NumeroOperacoesNaoFiscais( NumeroOperacoes: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_DataHoraImpressora( Data: String; Hora: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_DataHoraReducao( Data: String; Hora: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_DataMovimento( Data: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_ContadoresTotalizadoresNaoFiscais( Contadores: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VendaBruta( VendaBruta: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_VendaBrutaAcumulada( VendaBrutaAcumulada: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_GrandeTotal( GrandeTotal: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_Descontos( ValorDescontos: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_Acrescimos( ValorAcrescimos: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_Cancelamentos( ValorCancelamentos: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_DadosUltimaReducao( DadosReducao: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_SubTotal( SubTotal: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_SaldoAPagar( SaldoAPagar: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_Troco( Troco: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornoAliquotas( Aliquotas: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_ValorPagoUltimoCupom( ValorCupom: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_ValorFormaPagamento( FormaPagamento: String; Valor: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_ValorTotalizadorNaoFiscal( Totalizador: String; Valor: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_UltimoItemVendido( NumeroItem: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_UltimaFormaPagamento( Descricao_da_Forma: String; Valor_da_Forma: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_TipoUltimoDocumento(TipoUltimoDoc: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_MapaResumo: Integer; StdCall; External 'Daruma32.dll' Name 'Daruma_FI_MapaResumo';
function Daruma_FI_RelatorioTipo60Analitico: Integer; StdCall; External 'Daruma32.dll' Name 'Daruma_FI_RelatorioTipo60Analitico';
function Daruma_FI_RelatorioTipo60Mestre: Integer; StdCall; External 'Daruma32.dll' Name 'Daruma_FI_RelatorioTipo60Mestre';
function Daruma_FI_FlagsFiscais( Var Flag: Integer ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_FlagsFiscaisStr(Flag: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_PalavraStatus( PalavraStatus: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_PalavraStatusBinario( PalavraStatusBinario: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_SimboloMoeda( SimboloMoeda: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornoImpressora( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornaErroExtendido( ErroExtendido: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornaAcrescimoNF( AcrescimoNF: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornaCFCancelados( CFCancelados: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornaCNFCancelados( CNFCancelados: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornaCLX(CLX: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornaCNFNV(CNFNV: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornaCNFV(CNFV: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornaDescricaoCNFV(CNFV: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornaCRO(CRO: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornaCRZ(CRZ: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornaCRZRestante( CRZRestante: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornaCancelamentoNF( CancelamentoNF: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornaDescontoNF( DescontoNF: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornaGNF( GNF: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornaTempoImprimindo( TempoImprimindo: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornaTempoLigado( TempoLigado: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornaTotalPagamentos( TotalPagamentos: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornaTroco( Troco: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornaValorComprovanteNaoFiscal( Indice_CNF: String; Informacao: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornaIndiceComprovanteNaoFiscal( DescricaoRegistrCNF: String; RefIndice: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornaRegistradoresNaoFiscais( RegistrNaoFiscais: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_RetornaRegistradoresFiscais( RegistrFiscais: String ): Integer; StdCall; External 'Daruma32.dll';

// Métodos para TEF
function Daruma_TEF_EsperarArquivo( Path_Resp_TEF: String; Tempo_Espera: String; Travar: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_TEF_ImprimirResposta( Path_Arquivo_Resp_TEF: string; Forma_de_Pagamento: string; Travar_Teclado: string ): Integer; StdCall; External 'Daruma32.dll'
function Daruma_TEF_ImprimirRespostaCartao( Path_Arquivo_Resp_TEF: string; Forma_de_Pagamento: string; Travar_Teclado: string; Valor_da_Forma_Pagamento: String ): Integer; StdCall; External 'Daruma32.dll'
function Daruma_TEF_FechaRelatorio: Integer; StdCall; External 'Daruma32.dll'
function Daruma_TEF_SetFocus( TituloJanela: String ): Integer; StdCall; External 'Daruma32.dll'
function Daruma_TEF_TravarTeclado( Travar: String ): Integer; StdCall; External 'Daruma32.dll'

// Métodos para FS2000
function Daruma_Registry_FS2000_CupomAdicional( CupomAdicional: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_FS2000_TempoEsperaCheque( TempodeEspera: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI2000_DescontoSobreItemVendido( NumeroItem: String; TipoDesconto: String; ValorDesconto: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI2000_AcrescimosICMSISS( AcrescICMS: String; AcrescISS: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI2000_CancelamentosICMSISS( CancelICMS: String; CancelISS: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI2000_DescontosICMSISS( DescICMS: String; DescISS: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI2000_LeituraInformacaoUltimosCNF( UltimosCNF: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI2000_LeituraInformacaoUltimoDoc( TipoUltimoDoc: String; ValorUltimoDoc: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI2000_VerificaRelatorioGerencial( Gerencial: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI2000_CriaRelatorioGerencial( NomeGerencial: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI2000_AbreRelatorioGerencial( Indice: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI2000_CancelamentoCNFV( COO_CNFV: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI2000_SegundaViaCNFVinculado: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI2000_StatusCheque( StatusCheque: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI2000_ImprimirCheque( Banco: String; Cidade: String; Data: String; Favorecido: String; Valor: String; PosicaoCheque: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI2000_ImprimirVersoCheque( VersoCheque: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI2000_LiberarCheque: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI2000_LeituraCodigoMICR( CodigoMICR: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI2000_CancelarCheque: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI2000_LeituraTabelaCheque( TabelaCheque: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI2000_CarregarCheque(): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI2000_CorrigirGeometriaCheque( NumeroBanco: String; GeometriaCheque: String ): Integer; StdCall; External 'Daruma32.dll';

// Metodos exclusivos para MFD
function Daruma_FIMFD_StatusCupomFiscal( StatusCupomFiscal_Mfd: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIMFD_ImprimeCodigoBarras( Tipo: String; Codigo: String; Largura: String; Altura: String; Posicao: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIMFD_RetornaInformacao( Indice: String; Valor: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIMFD_DownloadDaMFD(CoInicial: String; CoFinal: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIMFD_CasasDecimaisProgramada( Quantidade: String; Valor: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIMFD_IndicePrimeiroVinculado( Indice: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIMFD_TerminaFechamentoCupomCodigoBarras( Mensagem: String; Tipo: String ;Codigo: String ; Largura: String ; Altura: String ;Posicao: String  ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIMFD_SinalSonoro( NumeroBeeps: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIMFD_AbreRelatorioGerencial( NomeRelatorio: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIMFD_VerificaRelatoriosGerenciais( Relatorios: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIMFD_ProgramaRelatoriosGerenciais( NomeRelatorio: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIMFD_EmitirCupomAdicional(): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIMFD_AcionarGuilhotina: Integer; StdCall; External 'Daruma32.dll' ;
function Daruma_FIMFD_EqualizarVelocidade(Valor: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIMFD_AbreRecebimentoNaoFiscal(  CPF: String; Nome: String; Endereco:String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIMFD_RecebimentoNaoFiscal(  DescricaoTotalizador:String; AcresDesc:String; TipoAcresDesc:String; ValorAcresDesc:String; ValorRecebimento:String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIMFD_IniciaFechamentoNaoFiscal(  AcresDesc:String; TipoAcresDesc:String; ValorAcresDesc:String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIMFD_EfetuaFormaPagamentoNaoFiscal(  FormaPgto:String; Valor:String; Observacao:String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIMFD_TerminaFechamentoNaoFiscal( MsgPromo:String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIMFD_ProgramarGuilhotina( Separacao_entre_Documentos:String; Linhas_para_Acionamento_Guilhotina:String; Status_da_Guilhotina:String; Impressao_Antecipada_Cliche:String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIMFD_CodigoModeloFiscal( Codigo: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIMFD_DescontoAcrescimoItem(NumItemDescontoAcrescimo:String; DescAcres:String; TipoDescAcres:String; ValorDescAcres:String): Integer; StdCall; External 'Daruma32.dll';

///////////////////////////////////////////////////////////////Metodos para o Sintegra//////////////////////////////////////////////////////////////////
//Metodo de Alto Nivel
function Daruma_Sintegra_GerarRegistrosArq( DataInicio: String; DataFim: String; Municipio: String; Fax: String; CodIdConvenio: String; CodIdNatureza: String; CodIdFinalidade: String; Logradouro: String; Numero: String; Complemento: String; Bairro: String; CEP: String; NomeContato: String; Telefone: String): Integer; StdCall; External 'Daruma32.dll';

//Metodo de Médio Nível
function Daruma_Sintegra_GerarRegistro10( DataInicio: String; DataFim: String; Municipio: String; Fax: String; CodIdConvenio: String; CodIdNatureza: String; CodIdFinalidade: String; Retorno: String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Sintegra_GerarRegistro11( Logradouro: String; Numero: String; Complemento: String; Bairro: String; CEP: String; NomeContato: String; Telefone: String; Retorno: String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Sintegra_GerarRegistro60M( DataInicio: String; DataFim: String; Retorno: String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Sintegra_GerarRegistro60A( DataInicio: String; DataFim: String; Retorno: String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Sintegra_GerarRegistro60D( DataInicio: String; DataFim: String; Retorno: String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Sintegra_GerarRegistro60I( DataInicio: String; DataFim: String; Retorno: String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Sintegra_GerarRegistro60R( DataInicio: String; DataFim: String; Retorno: String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Sintegra_GerarRegistro90( Retorno: String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_SintegraSeparador( Separador: String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_SintegraPath( Path: String): Integer; StdCall; External 'Daruma32.dll';

//Metodo de Baixo Nivel
function Daruma_FIMFD_RetornarInfoDownloadMFD( TipoDownload: String; Data_ou_COOInicio: String; Data_ou_COOFim: String; Indice: String; Retorno: String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIMFD_RetornarInfoDownloadMFDArquivo( TipoDownload: String; Data_ou_COOInicio: String; Data_ou_COOFim: String; Indice: String): Integer; StdCall; External 'Daruma32.dll';

//Metodos Bilhete de Passagem
function Daruma_FIB_AbreBilhetePassagem (Origem: String; Destino: String; UF: String; Percurso:String; Prestadora:  String; Plataforma:String; Poltrona: String; Modalidade: String; Categoria:  String; DataEmbarque:  String; PassRg: String; PassNome: String; PassEndereco: String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIB_VendeItem  (Descricao: String; St: String; Valor:String;  DescontoAcrescimo: String; TipoDesconto: String; ValorDesconto: String) : Integer; StdCall; External 'Daruma32.dll';

// Metodos Para Registry TA1000
function Daruma_Registry_TA1000_Porta( Porta: String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_TA1000_LeStatusTransferencia(): Integer; StdCall; External 'Daruma32.dll';function Daruma_Registry_TA1000_PathProdutos( PathProdutos: String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_TA1000_PathUsuarios( PathUsuarios: String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_TA1000_NumeroItensEnviados( NumeroItensEnviados: String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_Registry_TA1000_PathRelatorios( PathRelatorios: String): Integer; StdCall; External 'Daruma32.dll';

// Metodos Para Produtos TA1000
function Daruma_TA1000_CadastrarProdutos(Descricao: String; Codigo: String; DecimaisPreco: String; DecimaisQuantidade: String; Preco: String; DescontoAcrescimo: String; ValorDescontoAcrescimo: String; UnidadeMedida: String;Aliquota: String; ProximoProduto: String; ProdutoAnterior: String; Estoque: String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_TA1000_LerProdutos( Indice: integer; Descricao: String; Codigo: String; DecimaisPreco: String; DecimaisQuantidade: String; Preco: String; DescontoAcrescimo: String; ValorDescontoAcrescimo: String; UnidadeMedida: String; Aliquota: String; ProximoProduto: String; ProdutoAnterior: String; Estoque: String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_TA1000_ConsultarProdutos( Descricao: String; Codigo: String; DecimaisPreco: String; DecimaisQuantidade: String; Preco: String; DescontoAcrescimo: String; ValorDescontoAcrescimo: String; UnidadeMedida: String; Aliquota: String; ProximoProduto: String; ProdutoAnterior: String; Estoque: String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_TA1000_AlterarProdutos(Codigo_Consultar: String; Descricao: String; Codigo: String; DecimaisPreco: String; DecimaisQuantidade: String; Preco: String; DescontoAcrescimo: String; ValorDescontoAcrescimo: String; UnidadeMedida: String; Aliquota: String; ProximoProduto: String; ProdutoAnterior: String; Estoque: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_TA1000_EliminarProdutos(Codigo: String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_TA1000_EnviarBancoProdutos(): Integer; StdCall; External 'Daruma32.dll';
function Daruma_TA1000_ReceberBancoProdutos(): Integer; StdCall; External 'Daruma32.dll';
function Daruma_TA1000_ReceberProdutosVendidos(): Integer; StdCall; External 'Daruma32.dll';
function Daruma_TA1000_ZerarProdutos(): Integer; StdCall; External 'Daruma32.dll';
function Daruma_TA1000_ZerarProdutosVendidos(): Integer; StdCall; External 'Daruma32.dll';

// Metodos Para Usuarios TA1000
function Daruma_TA1000_EnviarBancoUsuarios(): Integer; StdCall; External 'Daruma32.dll';
function Daruma_TA1000_ReceberBancoUsuarios(): Integer; StdCall; External 'Daruma32.dll';
function Daruma_TA1000_ZerarUsuarios(): Integer; StdCall; External 'Daruma32.dll';
function Daruma_TA1000_CadastrarUsuarios(Nome: String; CPF: String; CodigoConvenio: String; CodigoUsuario: String; UsuarioAnterior: String; ProximoUsuario: String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_TA1000_ConsultarUsuarios(Codigo_Consultar : String; Nome: String; CPF: String; CodigoConvenio: String; CodigoUsuario: String; UsuarioAnterior: String; ProximoUsuario: String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_TA1000_AlterarUsuarios(Codigo_Consultar : String; Nome: String; CPF: String; CodigoConvenio: String; CodigoUsuario: String; UsuarioAnterior: String; ProximoUsuario: String): Integer; StdCall; External 'Daruma32.dll';
function Daruma_TA1000_EliminarUsuarios(Codigo: String): Integer; StdCall; External 'Daruma32.dll';


// Metodos para Impressora Restaurante
function Daruma_FIR_ProgramaAliquota( Valor_Aliquota: String; Tipo_Aliquota: Integer ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_NomeiaTotalizadorNaoSujeitoIcms( Indice_do_Totalizador: Integer; Nome_do_Totalizador: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_ProgramaFormasPagamento( Descricao_das_Formas_Pagamento: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_ProgramaRelatorioGerencial( Titulo_Relatorio_Gerencial: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_ProgramaOperador( Nome_do_Operador: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_ProgramaArredondamento: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_ProgramaTruncamento: Integer; StdCall; External 'Daruma32.dll' Name 'Daruma_FI_ProgramaTruncamento';
function Daruma_FIR_LinhasEntreCupons( Linhas_Entre_Cupons: Integer ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_EspacoEntreLinhas( Espaco_Entre_Linhas: Integer ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_ProgramaHorarioVerao: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_EqualizaFormasPgto: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_ProgramaVinculados( Vinculado: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_ProgFormasPagtoSemVincular( Descricao_da_Forma_Pagamento: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_ProgramaMsgTaxaServico( Mensagem_da_Taxa_de_Servico: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_AdicionaProdutoCardapio( Codigo: String; Valor_Unitario: String; Aliquota: String; Descricao: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_CfgEspacamentoCupons( DistanciaCupons: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_CfgHoraMinReducaoZ( Hora_Min_para_ReducaoZ: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_CfgLimiarNearEnd( NumeroLinhas: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_CfgHorarioVerao( Flag: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_CfgLegProdutos( Flag: String ): Integer; StdCall; External 'Daruma32.dll';

function Daruma_FIR_AbreCupom( Numero_da_Mesa: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_AbreCupomRestaurante( Numero_da_Mesa: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_AbreCupomBalcao: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VendeItem( Mesa: String; Codigo: String; Descricao: String; Aliquota: String; Quantidade: String; Valor_Unitario: String; Acrescimo_ou_Desconto: String; Valor_do_Acrescimo_ou_Desconto: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VendeItemBalcao( Codigo: String; Quantidade: String; Acrescimo_ou_Desconto: String; Valor_do_Acrescimo_ou_Desconto: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RegistrarVenda( Numero_da_Mesa: String; Codigo: String; Quantidade: String; Acrescimo_ou_Desconto: String; Valor_do_Acrescimo_ou_Desconto: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RegistroVendaSerial( Numero_da_Mesa: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_FechaCupomRestauranteResumido( Descricao_da_Forma_de_Pagamento: String; Mensagem_Promocional: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_IniciaFechamentoCupom( Acrescimo_ou_Desconto: String; Tipo_do_Acrescimo_ou_Desconto: String; Valor_do_Acrescimo_ou_Desconto: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_IniciaFechamentoCupomComServico( Acrescimo_ou_Desconto: String; Tipo_do_Acrescimo_ou_Desconto: String; Valor_do_Acrescimo_ou_Desconto: String; Indicador_da_Operacao: String; Taxa_de_Servico: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_EfetuaFormaPagamento( Descricao_da_Forma_Pagamento: String; Valor_da_Forma_Pagamento: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_EfetuaFormaPagamentoDescricaoForma( Descricao_da_Forma_Pagamento: string; Valor_da_Forma_Pagamento: string; Texto_Livre: string ): integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_IdentificaConsumidor( Nome_do_Consumidor: String; Endereco: String; CPF_ou_CNPJ: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_FechaCupomResumido( Descricao_da_Forma_de_Pagamento: String; Mensagem_Promocional: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_TerminaFechamentoCupom( Mensagem_Promocional: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_TerminaFechamentoCupomID( Mensagem_Promocional: String; Nome_do_Cliente: String; Endereco_do_Cliente: String; Documento_do_Cliente: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_FechaCupomRestaurante( Forma_de_Pagamento: String; Acrescimo_ou_Desconto: String; Tipo_Acrescimo_ou_Desconto: String; Valor_Acrescimo_ou_Desconto: String; Valor_Pago: String; Mensagem_Promocional: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_CancelaItem( Mesa: String; Codigo: String; Descricao: String; Aliquota: String; Quantidade: String; Valor_Unitario: String; Acrescimo_ou_Desconto: String; Valor_do_Acrescimo_ou_Desconto: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_CancelaItemBalcao( Codigo_do_Item: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_CancelaCupom: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_CancelarVenda( Numero_da_Mesa: String; Codigo: String; Quantidade: String; Acrescimo_ou_Desconto: String; Valor_do_Acrescimo_ou_Desconto: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_TranferirVenda( Numero_da_Mesa_Origem: String; Numero_da_Mesa_Destino: String; Codigo: String; Quantidade: String; Acrescimo_ou_Desconto: String; Valor_do_Acrescimo_ou_Desconto: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_TransfereItem( Mesa_Origem: String; Mesa_Destino: String; Codigo: String; Descricao: String; Aliquota: String; Quantidade: String; Valor_Unitario: String; Acrescimo_ou_Desconto: String; Desconto_Percentual: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_TranferirMesa( Mesa_Origem: String; Mesa_Destino: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_ConferenciaMesa( Numero_da_Mesa: String; Mensagem_Promocional: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_LimparMesa( Numero_da_Mesa: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_ImprimePrimeiroCupomDividido( Numero_da_Mesa: String; Quantidade_Divisoria: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RestanteCupomDividido: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_AumentaDescricaoItem( Descricao_Extendida: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_UsaUnidadeMedida( Unidade_Medida: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_EmitirCupomAdicional: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_EstornoFormasPagamento( Forma_de_Origem: String; Nova_Forma: String; Valor_Total_Pago: String ): Integer; StdCall; External 'Daruma32.dll';

function Daruma_FIR_AbreComprovanteNaoFiscalVinculado( Forma_de_Pagamento: String; Valor_Pago: String; Numero_do_Cupom: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_UsaComprovanteNaoFiscalVinculado( Texto_Livre: String ): Integer; StdCall; External 'Daruma32.dll'
function Daruma_FIR_FechaComprovanteNaoFiscalVinculado: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RelatorioGerencial( Texto_Livre: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_AbreRelatorioGerencial: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_EnviarTextoCNF( Texto_Livre: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_FechaRelatorioGerencial: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RecebimentoNaoFiscal( Descricao_do_Totalizador: String; Valor_do_Recebimento: String; Forma_de_Pagamento: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_AbreRecebimentoNaoFiscal( Descricao_do_Totalizador: String; Acrescimo_ou_Desconto: String; Tipo_Acrescimo_ou_Desconto: String; Valor_Acrescimo_ou_Desconto: String; Valor_do_Recebimento: String; Texto_Livre: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_EfetuaFormaPagamentoNaoFiscal( Forma_de_Pagamento: String; Valor_da_Forma_Pagamento: String; Texto_Livre: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_Sangria( Valor_da_Sangria: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_Suprimento( Valor_do_Suprimento: String; Forma_de_Pagamento: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_FundoCaixa( Valor_do_Fundo_Caixa: String; Forma_de_Pagamento: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_LeituraX: Integer; StdCall; External 'Daruma32.dll' ;
function Daruma_FIR_ReducaoZ( Data: String; Hora: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_ReducaoZAjustaDataHora( Data: String; Hora: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RelatorioMesasAbertas: Integer; StdCall; External 'Daruma32.dll' ;
function Daruma_FIR_RelatorioMesasAbertasSerial: Integer; StdCall; External 'Daruma32.dll' ;
function Daruma_FIR_LeituraMemoriaFiscalData( Data_Inicial: String; Data_Final: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_LeituraMemoriaFiscalReducao( Reducao_Inicial: String; Reducao_Final: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_LeituraMemoriaFiscalSerialData( Data_Inicial: String; Data_Final: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_LeituraMemoriaFiscalSerialReducao( Reducao_Inicial: String; Reducao_Final: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_LeituraMemoriaTrabalho: Integer; StdCall; External 'Daruma32.dll' ;

function Daruma_FIR_StatusCupomFiscal( StatusCupomFiscal: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_StatusRelatorioGerencial( StatusRelGerencial: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_StatusComprovanteNaoFiscalVinculado( StatusCNFV: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_StatusComprovanteNaoFiscalNaoVinculado( StatusCNFNV: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VerificaImpressoraLigada: Integer; StdCall; External 'Daruma32.dll'
function Daruma_FIR_VerificaTotalizadoresParciais( Totalizadores: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VerificaModoOperacao( Modo: string ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VerificaTotalizadoresNaoFiscais( Totalizadores: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VerificaTotalizadoresNaoFiscaisEx( Totalizadores: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VerificaTruncamento( Flag: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VerificaAliquotasIss( Flag: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VerificaIndiceAliquotasIss( Flag: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VerificaRecebimentoNaoFiscal( Recebimentos: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VerificaTipoImpressora( Var TipoImpressora: Integer ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VerificaStatusCheque( StatusCheque: Integer ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VerificaModeloECF: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VerificaDescricaoFormasPagamento( Descricao: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VerificaXPendente( XPendente: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VerificaZPendente( ZPendente: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VerificaDiaAberto( DiaAberto: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VerificaHorarioVerao( HoraioVerao: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VerificaFormasPagamento( Formas: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VerificaFormasPagamentoEx( FormasEx: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VerificaEpromConectada( Flag: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VerificaEstadoImpressora( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer ): Integer; StdCall; External 'Daruma32.dll';

function Daruma_FIR_ClicheProprietario( Cliche: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_ClicheProprietarioEx( ClicheEx: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_NumeroCaixa( NumeroCaixa: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_NumeroLoja( NumeroLoja: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_NumeroSerie( NumeroSerie: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VersaoFirmware( VersaoFirmware: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_CGC_IE( CGC: String; IE: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_LerAliquotasComIndice(AliquotasComIndice: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_NumeroCupom( NumeroCupom: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_COO(Inicial: String; Final: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_MinutosLigada( Minutos: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_NumeroSubstituicoesProprietario( NumeroSubstituicoes: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_NumeroIntervencoes( NumeroIntervencoes: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_NumeroReducoes( NumeroReducoes: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_NumeroCuponsCancelados( NumeroCancelamentos: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_NumeroOperacoesNaoFiscais( NumeroOperacoes: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_DataHoraImpressora( Data: String; Hora: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_DataHoraReducao( Data: String; Hora: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_DataMovimento( Data: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_ContadoresTotalizadoresNaoFiscais( Contadores: String ): Integer; StdCall; External 'Daruma32.dll';

function Daruma_FIR_VendaBruta( VendaBruta: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_GrandeTotal( GrandeTotal: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_Descontos( ValorDescontos: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_Acrescimos( ValorAcrescimos: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_Cancelamentos( ValorCancelamentos: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_DadosUltimaReducao( DadosReducao: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_SubTotal( SubTotal: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornoAliquotas( Aliquotas: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_ValorPagoUltimoCupom( ValorCupom: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_ValorPagoUltimoCupomFormatado( ValorCupom: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_ValorFormaPagamento( FormaPagamento: String; Valor: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_ValorTotalizadorNaoFiscal( Totalizador: String; Valor: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_UltimoItemVendido( NumeroItem: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_UltimoItemVendidoValor( NumeroItem: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_UltimaFormaPagamento( Descricao_da_Forma: String; Valor_da_Forma: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_TipoUltimoDocumento(TipoUltimoDoc: String ): Integer; StdCall; External 'Daruma32.dll';

function Daruma_FIR_MapaResumo: Integer; StdCall; External 'Daruma32.dll' Name 'Daruma_FI_MapaResumo';
function Daruma_FIR_RelatorioTipo60Analitico: Integer; StdCall; External 'Daruma32.dll' Name 'Daruma_FI_RelatorioTipo60Analitico';
function Daruma_FIR_RelatorioTipo60Mestre: Integer; StdCall; External 'Daruma32.dll' Name 'Daruma_FI_RelatorioTipo60Mestre';
function Daruma_FIR_FlagsFiscais( Var Flag: Integer ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_PalavraStatus( PalavraStatus: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_PalavraStatusBinario( PalavraStatusBinario: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_SimboloMoeda( SimboloMoeda: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornoImpressora( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornaErroExtendido( ErroExtendido: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornaAcrescimoNF( AcrescimoNF: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornaCFCancelados( CFCancelados: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornaCNFCancelados( CNFCancelados: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornaCLX(CLX: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornaCNFNV(CNFNV: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornaCNFV(CNFV: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornaCRO(CRO: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornaCRZ(CRZ: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornaCRZRestante( CRZRestante: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornaCancelamentoNF( CancelamentoNF: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornaDescontoNF( DescontoNF: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornaGNF( GNF: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornaTempoImprimindo( TempoImprimindo: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornaTempoLigado( TempoLigado: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornaTotalPagamentos( TotalPagamentos: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornaTroco( Troco: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornaZeros( Zeros: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornaValorComprovanteNaoFiscal( Indice_CNF: String; Informacao: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornaIndiceComprovanteNaoFiscal( DescricaoRegistrCNF: String; RefIndice: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornaRegistradoresNaoFiscais( RegistrNaoFiscais: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_RetornaRegistradoresFiscais( RegistrFiscais: String ): Integer; StdCall; External 'Daruma32.dll';

function Daruma_FIR_VerificaDocAutenticacao: Integer; StdCall; External 'Daruma32.dll'
function Daruma_FIR_Autenticacao: Integer; StdCall; External 'Daruma32.dll' Name 'Daruma_FI_Autenticacao';
function Daruma_FIR_AutenticacaoStr( Autenticacao_Str :string ): Integer; StdCall; External 'Daruma32.dll'
function Daruma_FIR_VerificaEstadoGaveta( Var Estado_Gaveta: Integer ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_VerificaEstadoGavetaStr( Estado_Gaveta: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_AcionaGaveta: Integer; StdCall; External 'Daruma32.dll'
function Daruma_FIR_AbrePortaSerial: Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_FechaPortaSerial: Integer; StdCall; External 'Daruma32.dll'
function Daruma_FIR_AberturaDoDia( Valor_do_Suprimento: string; Forma_de_Pagamento: string ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FIR_FechamentoDoDia: Integer; StdCall; External 'Daruma32.dll' Name 'Daruma_FI_FechamentoDoDia';
function Daruma_FIR_ImprimeConfiguracoesImpressora: Integer; StdCall; External 'Daruma32.dll'
function Daruma_FIR_RegistraNumeroSerie: Integer; StdCall; External 'Daruma32.dll' ;
function Daruma_FIR_VerificaNumeroSerie: Integer; StdCall; External 'Daruma32.dll' ;
function Daruma_FIR_RetornaSerialCriptografado( SerialCriptografado :string; NumeroSerial: string ): Integer; StdCall; External 'Daruma32.dll'
function Daruma_FIR_ConfiguraHorarioVerao( DataEntrada: string; DataSaida: string ; controle: string): Integer; StdCall; External 'Daruma32.dll' ;
function Daruma_FIR_ZeraCardapio: Integer; StdCall; External 'Daruma32.dll'
function Daruma_FIR_ImprimeCardapio: Integer; StdCall; External 'Daruma32.dll'
function Daruma_FIR_CardapioSerial: Integer; StdCall; External 'Daruma32.dll'

{===============================================================================
********************************************************************************

                      DECLARAÇÃO DAS FUNÇÕES DA Elgin32.DLL

********************************************************************************
===============================================================================}
function Elgin_AberturaDoDia( ValorCompra: string; FormaPagamento: string ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AbreComprovanteNaoFiscalVinculado( FormaPagamento: String; Valor: String; NumeroCupom: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AbreComprovanteNaoFiscalVinculadoMFD(FormaPagamento, Valor, NumeroCupom, CGC, nome, Endereco : string): Integer; StdCall; External 'Elgin.DLL'
function Elgin_AbreCupom( CGC_CPF: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AbreCupomMFD(CGC: string; Nome: string; Endereco : string): Integer; StdCall; External 'Elgin.DLL'
function Elgin_AbrePortaSerial: Integer; StdCall; External 'Elgin.DLL';
function Elgin_AbreRecebimentoNaoFiscalMFD(CGC, Nome, Endereco : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AbreRelatorioGerencial(): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AbreRelatorioGerencialMFD(Indice : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AcionaGaveta:Integer; StdCall; External 'Elgin.DLL' 
function Elgin_AcrescimoDescontoItemMFD (Item, AcrescimoDesconto,TipoAcrescimoDesconto, ValorAcrescimoDesconto: string): Integer; StdCall; External 'Elgin.DLL' 
function Elgin_AcrescimoDescontoSubtotalMFD( cFlag, cTipo, cValor: string): integer; StdCall; External 'Elgin.DLL'
function Elgin_AcrescimoDescontoSubtotalRecebimentoMFD( cFlag, cTipo, cValor: string ): integer; StdCall; External 'Elgin.DLL';
function Elgin_AcrescimoItemNaoFiscalMFD(strNroItem:string; strAcrescDesc:string; strTipoAcrescDesc:string; strValor:string): integer; StdCall; External 'Elgin.DLL';
function Elgin_Acrescimos( ValorAcrescimos: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AlteraSimboloMoeda( SimboloMoeda: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AtivaDesativaVendaUmaLinhaMFD( iFlag: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_AumentaDescricaoItem( Descricao: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_Autenticacao:Integer; StdCall; External 'Elgin.DLL' 
function Elgin_CancelaAcrescimoDescontoItemMFD( cFlag, cItem: string ): integer; StdCall; External 'Elgin.DLL';
function Elgin_CancelaAcrescimoDescontoSubtotalMFD( cFlag: string): integer; StdCall; External 'Elgin.DLL'
function Elgin_CancelaAcrescimoDescontoSubtotalRecebimentoMFD( cFlag: string ): integer; StdCall; External 'Elgin.DLL';
function Elgin_CancelaAcrescimoNaoFiscalMFD(strNumeroItem: String; strAcrecDesc: String): Integer; StdCall; External 'Elgin.DLL';
function Elgin_CancelaCupom: Integer; StdCall; External 'Elgin.DLL';
function Elgin_CancelaCupomMFD(CGC, Nome, Endereco: string): Integer; StdCall; External 'Elgin.DLL' 
function Elgin_CancelaImpressaoCheque: Integer; StdCall; External 'Elgin.DLL';
function Elgin_CancelaItemAnterior: Integer; StdCall; External 'Elgin.DLL';
function Elgin_CancelaItemGenerico( NumeroItem: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_CancelaItemNaoFiscalMFD(strNroItem:string): integer; StdCall; External 'Elgin.DLL';
function Elgin_Cancelamentos( ValorCancelamentos: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_CancelaRecebimentoNaoFiscalMFD(CGC, Nome, Endereco : string): Integer; StdCall; External 'Elgin.DLL' 
function Elgin_CGC_IE( CGC: String; IE: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ClicheProprietario( Cliche: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_CNPJ_IE(CNPJ: string; IE: string):Integer;stdcall; External 'Elgin.DLL';
function Elgin_CNPJMFD(CNPJ : string): Integer; StdCall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasCODABARMFD(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasCODE128MFD(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasCODE39MFD(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasCODE93MFD(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasEAN13MFD(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasEAN8MFD(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasISBNMFD(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasITFMFD(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasMSIMFD(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasPLESSEYMFD(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasUPCAMFD(Codigo : String) :Integer; stdcall; External 'Elgin.DLL';
Function Elgin_CodigoBarrasUPCEMFD(Codigo : String) : Integer; stdcall; External 'Elgin.DLL';
function Elgin_ComprovantesNaoFiscaisNaoEmitidosMFD(Comprovantes : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ConfiguraCodigoBarrasMFD (Var Altura: Integer; var Largura: Integer; var pos: Integer; var Fonte: Integer; var Margem: Integer): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ContadorComprovantesCreditoMFD(Comprovantes : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ContadorCupomFiscalMFD(CuponsEmitidos : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ContadoresTotalizadoresNaoFiscais( Contadores: String ): Integer; StdCall; External 'Elgin.DLL'; 
function Elgin_ContadoresTotalizadoresNaoFiscaisMFD(Contadores : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ContadorFitaDetalheMFD(ContadorFita : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ContadorOperacoesNaoFiscaisCanceladasMFD(OperacoesCanceladas : string): Integer; StdCall; External 'Elgin.DLL'
function Elgin_ContadorRelatoriosGerenciaisMFD (Relatorios : String): Integer; StdCall; External 'Elgin.DLL';
function Elgin_CupomAdicionalMFD(): Integer; StdCall; External 'Elgin.DLL';
function Elgin_DadosSintegra( DataInicial: string; DataFinal: string ): integer; StdCall; External 'Elgin.DLL';
function Elgin_DadosUltimaReducao( DadosReducao: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_DadosUltimaReducaoMFD(DadosReducao : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_DataHoraImpressora( Data: String; Hora: String ): Integer; StdCall; External 'Elgin.DLL'; 
function Elgin_DataHoraReducao( Data: String; Hora: String ): Integer; StdCall; External 'Elgin.DLL'; 
function Elgin_DataHoraUltimoDocumentoMFD( cDataHora: string ): integer; StdCall; External 'Elgin.DLL';
function Elgin_DataMovimento( Data: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_DataMovimentoUltimaReducaoMFD( cDataMovimento: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_Descontos( ValorDescontos: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_DownloadMF( Arquivo: String ): Integer; StdCall; External 'Elgin.DLL' 
function Elgin_DownloadMFD( Arquivo: String; TipoDownload: String; ParametroInicial: String; ParametroFinal: String; UsuarioECF: String ): Integer; StdCall; External 'Elgin.DLL'
function Elgin_EfetuaFormaPagamento( FormaPagamento: String; ValorFormaPagamento: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_EfetuaFormaPagamentoDescricaoForma( FormaPagamento: string; ValorFormaPagamento: string; DescricaoFormaPagto: string ): integer; StdCall; External 'Elgin.DLL';
function Elgin_EfetuaFormaPagamentoMFD(FormaPagamento, ValorFormaPagamento, Parcelas, DescricaoFormaPagto: string): Integer; StdCall; External 'Elgin.DLL'
function Elgin_EfetuaRecebimentoNaoFiscalMFD(IndiceTotalizador, ValorRecebimento : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_EspacoEntreLinhas( Dots: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_EstornoFormasPagamento( FormaOrigem: String; FormaDestino: String; Valor: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_EstornoNaoFiscalVinculadoMFD(CGC, Nome, Endereco : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_FechaComprovanteNaoFiscalVinculado: Integer; StdCall; External 'Elgin.DLL';
function Elgin_FechaCupom( FormaPagamento: String; AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String; ValorPago: String; Mensagem: String): Integer; StdCall; External 'Elgin.DLL';
function Elgin_FechaCupomResumido( FormaPagamento: String; Mensagem: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_FechamentoDoDia: Integer; StdCall; External 'Elgin.DLL'
function Elgin_FechaPortaSerial: Integer; StdCall; External 'Elgin.DLL'
function Elgin_FechaRecebimentoNaoFiscalMFD(Mensagem : string): Integer; StdCall; External 'Elgin.DLL'
function Elgin_FechaRelatorioGerencial: Integer; StdCall; External 'Elgin.DLL';
function Elgin_FlagsFiscais( Var Flag: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_FlagsFiscaisStr(FlagFiscal: String): Integer; StdCall; External 'Elgin.DLL';
Function Elgin_FormatoDadosMFD(ArquivoOrigem: String;
                               ArquivoDestino: String;
                               TipoFormato: String;
                               TipoDownload: String;
                               ParametroInicial: String;
                               ParametroFinal: String;
                               UsuarioECF: String):  Integer; StdCall; External 'Elgin.DLL';
function Elgin_GrandeTotal( GrandeTotal: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_GrandeTotalUltimaReducaoMFD( cGT: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_HabilitaDesabilitaRetornoEstendidoMFD(FlagRetorno : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ImprimeCheque( Banco: String; Valor: String; Favorecido: String; Cidade: String; Data: String; Mensagem: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ImprimeChequeMFD(NumeroBanco, Valor, Favorecido, Cidade, Data, Mensagem, ImpressaoVerso, Linhas : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ImprimeConfiguracoesImpressora:Integer; StdCall; External 'Elgin.DLL'
function Elgin_ImprimeCopiaCheque: Integer; StdCall; External 'Elgin.DLL';
function Elgin_ImprimeDepartamentos: Integer; StdCall; External 'Elgin.DLL';
function Elgin_IncluiCidadeFavorecido( Cidade: String; Favorecido: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_IniciaFechamentoCupom( AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_IniciaFechamentoCupomMFD(AcrescimoDesconto,TipoAcrescimoDesconto, ValorAcrescimo, ValorDesconto : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_IniciaFechamentoRecebimentoNaoFiscalMFD(AcrescimoDesconto,TipoAcrescimoDesconto, ValorAcrescimo, ValorDesconto : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_InicioFimCOOsMFD( cCOOIni, cCOOFim: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_InicioFimGTsMFD( cGTInicial, cGTFinal: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_InscricaoEstadualMFD(InscricaoEstadual : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_InscricaoMunicipalMFD(InscricaoMunicipal : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeArquivoRetorno(sCupom: String): Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeIndicadores( var Indicador: Integer): Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeituraCheque(CodigoCMC7 : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeituraMemoriaFiscalData(DataInicial, DataFinal, FlagLeitura : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal, FlagLeitura : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeituraMemoriaFiscalSerialData(DataInicial, DataFinal, FlagLeitura : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeituraMemoriaFiscalSerialReducao(ReducaoInicial, ReducaoFinal, FlagLeitura : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeituraX: Integer; StdCall; External 'Elgin.DLL' ;
function Elgin_LeituraXSerial: Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeNomeRelatorioGerencial: Integer; StdCall; External 'Elgin.DLL';
function Elgin_LinhasEntreCupons( Linhas: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_MapaResumo:Integer; StdCall; External 'Elgin.DLL';
function Elgin_MapaResumoMFD:Integer; StdCall; External 'Elgin.DLL';
function Elgin_MarcaModeloTipoImpressoraMFD(Marca, Modelo, Tipo : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_MinutosEmitindoDocumentosFiscaisMFD(Minutos : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_MinutosImprimindo( Minutos: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_MinutosLigada( Minutos: String ): Integer; StdCall; External 'Elgin.DLL'; 
function Elgin_NomeiaDepartamento( Indice: Integer; Departamento: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NomeiaRelatorioGerencialMFD (Indice, Descricao : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NomeiaTotalizadorNaoSujeitoIcms( Indice: Integer; Totalizador: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroCaixa( NumeroCaixa: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroCupom( NumeroCupom: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroCuponsCancelados( NumeroCancelamentos: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroIntervencoes( NumeroIntervencoes: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroLoja( NumeroLoja: String ): Integer; StdCall; External 'Elgin.DLL'; 
function Elgin_NumeroOperacoesNaoFiscais( NumeroOperacoes: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroReducoes( NumeroReducoes: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroSerie( NumeroSerie: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroSerieMemoriaMFD(NumeroSerieMFD : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_NumeroSubstituicoesProprietario( NumeroSubstituicoes: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_PercentualLivreMFD( cMemoriaLivre: string ): integer; StdCall; External 'Elgin.DLL';
function Elgin_ProgramaAliquota( Aliquota: String; ICMS_ISS: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ProgramaArredondamento: Integer; StdCall; External 'Elgin.DLL';
function Elgin_ProgramaCaracterAutenticacao( Parametros: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ProgramaFormaPagamentoMFD(FormaPagto, OperacaoTef: String) : Integer; StdCall; External 'Elgin.DLL';
function Elgin_ProgramaHorarioVerao: Integer; StdCall; External 'Elgin.DLL';
function Elgin_ProgramaMoedaPlural( MoedaPlural: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ProgramaMoedaSingular( MoedaSingular: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ProgramaTruncamento: Integer; StdCall; External 'Elgin.DLL';
function Elgin_RecebimentoNaoFiscal( IndiceTotalizador: String; Valor: String; FormaPagamento: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ReducaoZ( Data: String; Hora: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ReducoesRestantesMFD(Reducoes : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_RegistrosTipo60: Integer; StdCall; External 'Elgin.DLL';
function Elgin_ReimpressaoNaoFiscalVinculadoMFD() : Integer; StdCall; External 'Elgin.DLL';
function Elgin_RelatorioGerencial( Texto: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_RelatorioSintegraMFD( iRelatorios: Integer;cArquivo: String; cMes: String; cAno: String; cRazaoSocial: String; cEndereco: String;cNumero: String; cComplemento: String; cBairro: String; cCidade: String; cCEP: String; cTelefone: String; cFax: String; cContato: String ): Integer; StdCall; External 'Elgin.DLL'
function Elgin_RelatorioTipo60Analitico: Integer; StdCall; External 'Elgin.DLL';
function Elgin_RelatorioTipo60AnaliticoMFD: Integer; StdCall; External 'Elgin.DLL';
function Elgin_RelatorioTipo60Mestre: Integer; StdCall; External 'Elgin.DLL';
function Elgin_ResetaImpressora: Integer; StdCall; External 'Elgin.DLL';
function Elgin_RetornoAliquotas( Aliquotas: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_RetornoImpressora( var i:integer; ErrorMsg:string):integer;StdCall; External 'Elgin.DLL';
function Elgin_Sangria( Valor: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_SegundaViaNaoFiscalVinculadoMFD(): Integer; StdCall; External 'Elgin.DLL';
function Elgin_SimboloMoeda( SimboloMoeda: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_StatusEstendidoMFD( Var iStatus: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_SubTotal( SubTotal: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_SubTotalComprovanteNaoFiscalMFD( cSubTotal: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_Suprimento( Valor: String; FormaPagamento: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_TamanhoTotalMFD( cTamanhoMFD: string ): integer; StdCall; External 'Elgin.DLL';
function Elgin_TempoOperacionalMFD(TempoOperacional : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_TerminaFechamentoCupom( Mensagem: String): Integer; StdCall; External 'Elgin.DLL';
function Elgin_TerminaFechamentoCupomCodigoBarrasMFD( cMensagem: string;cTipoCodigo: string;cCodigo: string;iAltura: integer;iLargura: integer;iPosicaoCaracteres: integer;iFonte: integer;iMargem: integer;iCorrecaoErros: integer;iColunas: integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_TotalDiaTroco( TotalDiaTroco: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_TotalDocTroco( TotalDocTroco: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_TotalLivreMFD( cMemoriaLivre: string ): integer; StdCall; External 'Elgin.DLL';
function Elgin_UltimoItemVendido( NumeroItem: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_UsaComprovanteNaoFiscalVinculado( Texto: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_UsaRelatorioGerencialMFD(Texto : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ValorFormaPagamento( FormaPagamento: String; Valor: String ): Integer; StdCall; External 'Elgin.DLL'; 
function Elgin_ValorFormaPagamentoMFD( FormaPagamento: String; Valor: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ValorPagoUltimoCupom( ValorCupom: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ValorTotalizadorNaoFiscal( Totalizador: String; Valor: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_ValorTotalizadorNaoFiscalMFD( Totalizador: String; Valor: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VendaBruta( VendaBruta: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VendaLiquida( VendaLiquida: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VendeItem( Codigo: String; Descricao: String; Aliquota: String; TipoQuantidade: String; Quantidade: String; CasasDecimais: Integer; ValorUnitario: String; TipoDesconto: String; Desconto: String): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VendeItemDepartamento( Codigo: String; Descricao: String; Aliquota: String; ValorUnitario: String; Quantidade: String; Acrescimo: String; Desconto: String; IndiceDepartamento: String; UnidadeMedida: String): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaAliquotasICMS( Flag: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaAliquotasIss( Flag: String ): Integer; StdCall; External 'Elgin.DLL'; 
function Elgin_VerificaDepartamentos( Departamentos: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaEstadoGaveta( Var EstadoGaveta: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaEstadoGavetaStr( EstadoGaveta: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaEstadoImpressora( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaEstadoImpressoraMFD( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer; Var ST3: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaEstadoImpressoraStr(ACK: String; ST1: String; ST2: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaFormasPagamento( Formas: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaFormasPagamentoMFD(FormasPagamento : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaImpressoraLigada: Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaIndiceAliquotasICMS( Flag: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaIndiceAliquotasIss( Flag: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaModoOperacao( Modo: string ): Integer; StdCall; External 'Elgin.DLL'; 
function Elgin_VerificaRecebimentoNaoFiscal( Recebimentos: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaRecebimentoNaoFiscalMFD(Recebimentos : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaRelatorioGerencialMFD(Relatorios : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaSensorPoucoPapelMFD( Flag: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaStatusCheque( Var StatusCheque: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaTipoImpressora( Var TipoImpressora: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaTipoImpressoraStr(TipoImpressora: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaTotalizadoresNaoFiscais( Totalizadores: String ): Integer; StdCall; External 'Elgin.DLL'; 
function Elgin_VerificaTotalizadoresNaoFiscaisMFD(Totalizadores : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaTotalizadoresParciais( Totalizadores: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaTotalizadoresParciaisMFD(Totalizadores : string): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaTruncamento( Flag: string ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VerificaZPendente( var Flag: Integer ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_VersaoFirmware( VersaoFirmware: String ): Integer; StdCall; External 'Elgin.DLL';
function Elgin_LeCodigoNacionalIdentificacaoECF(CNI:string): Integer; stdcall; External 'Elgin.DLL';
function Elgin_DataHoraSoftwareBasico( Data: String; Hora: String ): Integer; StdCall; External 'Elgin.DLL'; 

{===============================================================================
********************************************************************************
                                     SWEDA
                      DECLARAÇÃO DAS FUNÇÕES DA CONVECF.DLL

********************************************************************************
===============================================================================}

// Funções de Inicialização
function ECF_AlteraSimboloMoeda( SimboloMoeda: pchar ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ProgramaAliquota( Aliquota: pchar; ICMS_ISS: Integer ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ProgramaHorarioVerao: Integer;StdCall; External 'CONVECF.DLL';
function ECF_NomeiaDepartamento(Indice: Integer;Departamento: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_NomeiaTotalizadorNaoSujeitoIcms(Indice: Integer;Totalizador: pchar):Integer; StdCall; External 'CONVECF.DLL';
function ECF_ProgramaArredondamento: Integer;StdCall; External 'CONVECF.DLL';
function ECF_ProgramaTruncamento: Integer;StdCall; External 'CONVECF.DLL' Name 'ECF_ProgramaTruncamento';
function ECF_LinhasEntreCupons( Linhas: Integer ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_EspacoEntreLinhas( Dots: Integer ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ForcaImpactoAgulhas( ForcaImpacto: Integer ): Integer;StdCall; External 'CONVECF.DLL';

// Funções do Cupom Fiscal
function ECF_AbreCupom( CGC_CPF: pchar ): Integer; StdCall; External 'CONVECF.DLL';

function ECF_VendeItem(   Codigo: pchar;
                          Descricao: pchar;
                          Aliquota: pchar;
                          TipoQuantidade: pchar;
                          Quantidade: pchar;
                          CasasDecimais: Integer;
                          ValorUnitario: pchar;
                          TipoDesconto: pchar;
                          Desconto: pchar): Integer; StdCall; External 'CONVECF.DLL';

function ECF_VendeItemDepartamento(
                          Codigo: pchar;
                          Descricao: pchar;
                          Aliquota: pchar;
                          ValorUnitario: pchar;
                          Quantidade: pchar;
                          Acrescimo: pchar;
                          Desconto: pchar;
                          IndiceDepartamento: pchar;
                          UnidadeMedida: pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_CancelaItemAnterior: Integer;StdCall; External 'CONVECF.DLL';
function ECF_CancelaItemGenerico( NumeroItem: pchar ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_CancelaCupom: Integer; StdCall; External 'CONVECF.DLL';
function ECF_FechaCupomResumido( FormaPagamento: pchar; Mensagem: pchar ): Integer; StdCall; External 'CONVECF.DLL'; 
function ECF_FechaCupom(
                         FormaPagamento: pchar;
                         AcrescimoDesconto: pchar;
                         TipoAcrescimoDesconto: pchar;
                         ValorAcrescimoDesconto: pchar;
                         ValorPago: pchar; Mensagem: pchar): Integer;StdCall; External 'CONVECF.DLL';

function ECF_ResetaImpressora: Integer; StdCall; External 'CONVECF.DLL'; 
function ECF_IniciaFechamentoCupom( AcrescimoDesconto: pchar; TipoAcrescimoDesconto: pchar; ValorAcrescimoDesconto: pchar ): Integer;StdCall; External 'CONVECF.DLL'; 
function ECF_EfetuaFormaPagamento( FormaPagamento: pchar; ValorFormaPagamento: pchar ): Integer;StdCall; External 'CONVECF.DLL'; 
function ECF_EfetuaFormaPagamentoDescricaoForma( FormaPagamento: pchar; ValorFormaPagamento: pchar; DescricaoFormaPagto: pchar ): integer; StdCall; External 'CONVECF.DLL';
function ECF_TerminaFechamentoCupom( Mensagem: pchar): Integer; StdCall; External 'CONVECF.DLL'; 
function ECF_EstornoFormasPagamento( FormaOrigem: pchar; FormaDestino: pchar; Valor: pchar ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_UsaUnidadeMedida(UnidadeMedida: pchar ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_AumentaDescricaoItem( Descricao: pchar ): Integer;StdCall; External 'CONVECF.DLL'; 

// Funções dos Relatórios Fiscais 
function ECF_LeituraX: Integer; StdCall; External 'CONVECF.DLL' ; 
function ECF_ReducaoZ( Data: pchar; Hora: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_RelatorioGerencial( Texto: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_RelatorioGerencialTEF( Texto: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_FechaRelatorioGerencial: Integer; StdCall; External 'CONVECF.DLL';
function ECF_LeituraMemoriaFiscalData( DataInicial: pchar; DataFinal: pchar ): Integer; StdCall; External 'CONVECF.DLL'; 
function ECF_LeituraMemoriaFiscalReducao( ReducaoInicial: pchar; ReducaoFinal: pchar ): Integer; StdCall; External 'CONVECF.DLL'; 
function ECF_LeituraMemoriaFiscalSerialData( DataInicial: pchar; DataFinal: pchar ): Integer; StdCall; External 'CONVECF.DLL'; 
function ECF_LeituraMemoriaFiscalSerialReducao( ReducaoInicial: pchar; ReducaoFinal: pchar ): Integer; StdCall; External 'CONVECF.DLL';

// Funções das Operações Não Fiscais
function ECF_RecebimentoNaoFiscal( IndiceTotalizador: pchar; Valor: pchar; FormaPagamento: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_AbreComprovanteNaoFiscalVinculado( FormaPagamento: pchar; Valor: pchar; NumeroCupom: pchar ): Integer; StdCall; External 'CONVECF.DLL'; 
function ECF_UsaComprovanteNaoFiscalVinculado( Texto: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_UsaComprovanteNaoFiscalVinculadoTEF( Texto: pchar ): Integer; StdCall; External 'CONVECF.DLL' 
function ECF_FechaComprovanteNaoFiscalVinculado: Integer; StdCall; External 'CONVECF.DLL'; 
function ECF_Sangria( Valor: pchar ): Integer; StdCall; External 'CONVECF.DLL'; 
function ECF_Suprimento( Valor: pchar; FormaPagamento: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_AbreRelatorioGerencial: Integer;StdCall; External 'CONVECF.DLL'; 

// Funções de Informações da Impressora
function ECF_NumeroSerie( NumeroSerie: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_SubTotal( SubTotal: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_NumeroCupom( NumeroCupom: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_LeituraXSerial: Integer; StdCall; External 'CONVECF.DLL';
function ECF_VersaoFirmware( VersaoFirmware: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_CGC_IE( CGC: pchar; IE: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_GrandeTotal( GrandeTotal: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_Cancelamentos( ValorCancelamentos: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_Descontos( ValorDescontos: pchar ): Integer; StdCall; External 'CONVECF.DLL'; 
function ECF_NumeroOperacoesNaoFiscais( NumeroOperacoes: pchar ): Integer; StdCall; External 'CONVECF.DLL'; 
function ECF_NumeroCuponsCancelados( NumeroCancelamentos: pchar ): Integer; StdCall; External 'CONVECF.DLL'; 
function ECF_NumeroIntervencoes( NumeroIntervencoes: pchar ): Integer; StdCall; External 'CONVECF.DLL'; 
function ECF_NumeroReducoes( NumeroReducoes: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_NumeroSubstituicoesProprietario( NumeroSubstituicoes: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_UltimoItemVendido( NumeroItem: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ClicheProprietario( Cliche: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_NumeroCaixa( NumeroCaixa: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_NumeroLoja(   NumeroLoja: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_SimboloMoeda( SimboloMoeda: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_MinutosLigada( Minutos: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_MinutosImprimindo( Minutos: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_VerificaModoOperacao( Modo: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_VerificaEpromConectada( Flag: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_FlagsFiscais( Var Flag: Integer ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ValorPagoUltimoCupom( ValorCupom: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_DataHoraImpressora( Data: pchar; Hora: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ContadoresTotalizadoresNaoFiscais( Contadores: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_VerificaTotalizadoresNaoFiscais( Totalizadores: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_DataHoraReducao( Data: pchar; Hora: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_DataMovimento( Data: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_VerificaTruncamento( Flag: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_Acrescimos( ValorAcrescimos: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ContadorBilhetePassagem( ContadorPassagem: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_VerificaAliquotasIss( Flag: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_VerificaFormasPagamento( Formas: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_VerificaRecebimentoNaoFiscal( Recebimentos: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_VerificaDepartamentos( Departamentos: pchar ): Integer;StdCall; External 'CONVECF.DLL'; 
function ECF_VerificaTipoImpressora( Var TipoImpressora: Integer ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_VerificaTotalizadoresParciais( Totalizadores: pchar ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_RetornoAliquotas( Aliquotas: pchar ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_VerificaEstadoImpressora( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_DadosUltimaReducao( DadosReducao: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_MonitoramentoPapel( Var Linhas: Integer): Integer; StdCall; External 'CONVECF.DLL';
function ECF_VerificaIndiceAliquotasIss( Flag: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ValorFormaPagamento( FormaPagamento: pchar; Valor: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ValorTotalizadorNaoFiscal( Totalizador: pchar; Valor: pchar ): Integer; StdCall; External 'CONVECF.DLL';

// Funções de Autenticação e Gaveta de Dinheiro
function ECF_Autenticacao:Integer; StdCall; External 'CONVECF.DLL' Name 'ECF_Autenticacao';
function ECF_ProgramaCaracterAutenticacao( Parametros: pchar ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_AcionaGaveta:Integer; StdCall; External 'CONVECF.DLL' Name 'ECF_AcionaGaveta';
function ECF_VerificaEstadoGaveta( Var EstadoGaveta: Integer ): Integer; StdCall; External 'CONVECF.DLL';

// Funções de Impressão de Cheques
function ECF_ProgramaMoedaSingular(MoedaSingular: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ProgramaMoedaPlural( MoedaPlural: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_CancelaImpressaoCheque: Integer; StdCall; External 'CONVECF.DLL';
function ECF_VerificaStatusCheque(Var StatusCheque: Integer ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ImprimeCheque(
                           Banco: pchar;
                           Valor: pchar;
                           Favorecido: pchar;
                           Cidade: pchar;
                           Data: pchar; Mensagem: pchar ): Integer;StdCall; External 'CONVECF.DLL';

function ECF_IncluiCidadeFavorecido( Cidade: pchar; Favorecido: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ImprimeCopiaCheque: Integer; StdCall; External 'CONVECF.DLL' Name 'ECF_ImprimeCopiaCheque';

// Outras Funções
function ECF_AbrePortaSerial: Integer; StdCall; External 'CONVECF.DLL'; 
function ECF_RetornoImpressora( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_FechaPortaSerial: Integer;StdCall; External 'CONVECF.DLL' Name 'ECF_FechaPortaSerial';
function ECF_MapaResumo:Integer;StdCall; External 'CONVECF.DLL' Name 'ECF_MapaResumo';
function ECF_AberturaDoDia( ValorCompra: pchar; FormaPagamento: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_FechamentoDoDia: Integer; StdCall; External 'CONVECF.DLL' Name 'ECF_FechamentoDoDia'; 
function ECF_ImprimeConfiguracoesImpressora:Integer;StdCall; External 'CONVECF.DLL' Name 'ECF_ImprimeConfiguracoesImpressora';
function ECF_ImprimeDepartamentos: Integer;StdCall; External 'CONVECF.DLL' Name 'ECF_ImprimeDepartamentos';
function ECF_RelatorioTipo60Analitico: Integer;StdCall; External 'CONVECF.DLL' Name 'ECF_RelatorioTipo60Analitico';
function ECF_RelatorioTipo60Mestre: Integer;StdCall; External 'CONVECF.DLL' Name 'ECF_RelatorioTipo60Mestre'; 
function ECF_VerificaImpressoraLigada: Integer;StdCall; External 'CONVECF.DLL' Name 'ECF_VerificaImpressoraLigada';
function ECF_ImpressaoCarne(
                   Titulo, Percelas: pchar;
                   Datas, Quantidade: integer;
                   Texto, Cliente, RG_CPF, Cupom: pchar;
                   Vias, Assina: integer ): Integer; StdCall; External 'CONVECF.DLL';

function ECF_InfoBalanca( Porta: pchar; Modelo: integer; Peso, PrecoKilo, Total: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_DadosSintegra( DataInicio: pchar; DataFinal: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_IniciaModoTEF: Integer; StdCall; External 'CONVECF.DLL' Name 'ECF_IniciaModoTEF';
function ECF_FinalizaModoTEF: Integer; StdCall; External 'CONVECF.DLL' Name 'ECF_FinalizaModoTEF';
function ECF_VersaoDll( Versao: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_RegistrosTipo60: Integer; StdCall; External 'CONVECF.DLL' Name 'ECF_RegistrosTipo60';
function ECF_LeArquivoRetorno( Retorno: pchar ): Integer; StdCall; External 'CONVECF.DLL';

// Funções da Impressora Fiscal MFD 
function ECF_AbreCupomMFD(CGC: pchar;Nome: pchar;Endereco : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_CancelaCupomMFD(CGC, Nome,Endereco: pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ProgramaFormaPagamentoMFD(FormaPagto,OperacaoTef: pchar) : Integer;StdCall; External 'CONVECF.DLL';
function ECF_EfetuaFormaPagamentoMFD(FormaPagamento,ValorFormaPagamento,Parcelas,DescricaoFormaPagto: pchar): Integer;StdCall; External 'CONVECF.DLL'; 
function ECF_CupomAdicionalMFD(): Integer; StdCall; External 'CONVECF.DLL';
function ECF_AcrescimoDescontoItemMFD (Item,AcrescimoDesconto,TipoAcrescimoDesconto,ValorAcrescimoDesconto: pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_NomeiaRelatorioGerencialMFD (Indice, Descricao : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_AutenticacaoMFD(Linhas, Texto : pchar) : Integer;StdCall; External 'CONVECF.DLL';
function ECF_AbreComprovanteNaoFiscalVinculadoMFD(FormaPagamento,Valor,NumeroCupom,CGC,nome,Endereco : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ReimpressaoNaoFiscalVinculadoMFD() : Integer;StdCall; External 'CONVECF.DLL';
function ECF_AbreRecebimentoNaoFiscalMFD(CGC, Nome, Endereco : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_EfetuaRecebimentoNaoFiscalMFD(IndiceTotalizador,ValorRecebimento : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_IniciaFechamentoRecebimentoNaoFiscalMFD(AcrescimoDesconto,TipoAcrescimoDesconto,ValorAcrescimo,ValorDesconto : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_FechaRecebimentoNaoFiscalMFD(Mensagem : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_CancelaRecebimentoNaoFiscalMFD(CGC,Nome,Endereco : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_AbreRelatorioGerencialMFD(Indice : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_UsaRelatorioGerencialMFD(Texto : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_UsaRelatorioGerencialMFDTEF(Texto : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_SegundaViaNaoFiscalVinculadoMFD(): Integer;StdCall; External 'CONVECF.DLL';
function ECF_EstornoNaoFiscalVinculadoMFD(CGC,Nome,Endereco : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_NumeroSerieMFD(NumeroSerie : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_VersaoFirmwareMFD(VersaoFirmware : pchar): Integer;StdCall; External 'CONVECF.DLL'; 
function ECF_CNPJMFD(CNPJ : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_InscricaoEstadualMFD(InscricaoEstadual : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_InscricaoMunicipalMFD(InscricaoMunicipal : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_TempoOperacionalMFD(TempoOperacional : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_MinutosEmitindoDocumentosFiscaisMFD(Minutos : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ContadoresTotalizadoresNaoFiscaisMFD(Contadores : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_VerificaTotalizadoresNaoFiscaisMFD(Totalizadores : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_VerificaFormasPagamentoMFD(FormasPagamento : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_VerificaRecebimentoNaoFiscalMFD(Recebimentos : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_VerificaRelatorioGerencialMFD(Relatorios : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ContadorComprovantesCreditoMFD(Comprovantes : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ContadorOperacoesNaoFiscaisCanceladasMFD(OperacoesCanceladas : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ContadorRelatoriosGerenciaisMFD (Relatorios : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ContadorCupomFiscalMFD(CuponsEmitidos : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ContadorFitaDetalheMFD(ContadorFita : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ComprovantesNaoFiscaisNaoEmitidosMFD(Comprovantes : pchar):Integer;StdCall; External 'CONVECF.DLL';
function ECF_NumeroSerieMemoriaMFD(NumeroSerieMFD : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_MarcaModeloTipoImpressoraMFD(Marca,Modelo,Tipo : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ReducoesRestantesMFD(Reducoes : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_VerificaTotalizadoresParciaisMFD(Totalizadores : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_DadosUltimaReducaoMFD(DadosReducao : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_LeituraMemoriaFiscalDataMFD(DataInicial,DataFinal,FlagLeitura : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_LeituraMemoriaFiscalReducaoMFD(ReducaoInicial,ReducaoFinal,FlagLeitura : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_LeituraMemoriaFiscalSerialDataMFD(DataInicial,DataFinal,FlagLeitura : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_LeituraMemoriaFiscalSerialReducaoMFD(ReducaoInicial,ReducaoFinal,FlagLeitura : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_LeituraChequeMFD(CodigoCMC7 : pchar): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ImprimeChequeMFD(
                              NumeroBanco,
                              Valor,
                              Favorecido,
                              Cidade,
                              Data,
                              Mensagem,
                              ImpressaoVerso,
                              Linhas : pchar): Integer;StdCall; External 'CONVECF.DLL';

function ECF_HabilitaDesabilitaRetornoEstendidoMFD(FlagRetorno : pchar):Integer;StdCall; External 'CONVECF.DLL';
function ECF_RetornoImpressoraMFD(Var ACK: Integer;Var ST1: Integer;Var ST2: Integer;Var ST3: Integer ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_AbreBilhetePassagemMFD(
                      Embarque,
                      Destino,
                      Linha,
                      Agencia,
                      Data,
                      Hora,
                      Poltrona,
                      Plataforma,
                      TipoPassagem,
                      RGCliente,
                      NomeCliente,
                      EnderecoCliente,
                      UFDetino: pchar ): Integer;StdCall; External 'CONVECF.DLL';

function ECF_CancelaAcrescimoDescontoItemMFD( cFlag, cItem: pchar ): integer;StdCall; External 'CONVECF.DLL';
function ECF_SubTotalizaCupomMFD: integer; StdCall; External 'CONVECF.DLL';
function ECF_SubTotalizaRecebimentoMFD: integer; StdCall; External 'CONVECF.DLL';
function ECF_TotalLivreMFD( cMemoriaLivre: pchar ): integer; StdCall; External 'CONVECF.DLL';
function ECF_TamanhoTotalMFD( cTamanhoMFD: pchar ): integer;StdCall; External 'CONVECF.DLL';
function ECF_AcrescimoDescontoSubtotalRecebimentoMFD( cFlag, cTipo, cValor: pchar ): integer; StdCall; External 'CONVECF.DLL';
function ECF_AcrescimoDescontoSubtotalMFD( cFlag, cTipo, cValor: pchar): integer; StdCall; External 'CONVECF.DLL'; 
function ECF_CancelaAcrescimoDescontoSubtotalMFD(cFlag: pchar): integer; StdCall; External 'CONVECF.DLL';
function ECF_CancelaAcrescimoDescontoSubtotalRecebimentoMFD( cFlag: pchar ): integer; StdCall; External 'CONVECF.DLL';
function ECF_TotalizaCupomMFD: integer; StdCall; External 'CONVECF.DLL';
function ECF_TotalizaRecebimentoMFD: integer; StdCall; External 'CONVECF.DLL';
function ECF_PercentualLivreMFD( cMemoriaLivre: pchar ): integer; StdCall; External 'CONVECF.DLL';
function ECF_DataHoraUltimoDocumentoMFD( cDataHora: pchar ): integer; StdCall; External 'CONVECF.DLL';
function ECF_MapaResumoMFD:Integer; StdCall; External 'CONVECF.DLL' Name 'ECF_MapaResumoMFD';
function ECF_RelatorioTipo60AnaliticoMFD: Integer; StdCall; External 'CONVECF.DLL' Name 'ECF_RelatorioTipo60AnaliticoMFD'; 
function ECF_ValorFormaPagamentoMFD( FormaPagamento: pchar; Valor: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ValorTotalizadorNaoFiscalMFD( Totalizador: pchar; Valor: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_VerificaEstadoImpressoraMFD( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer; Var ST3: Integer ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_IniciaFechamentoCupomMFD( AcrescimoDesconto: pchar; TipoAcrescimoDesconto: pchar; ValorAcrescimo: pchar;ValorDesconto: pchar ): Integer;StdCall; External 'CONVECF.DLL'; 

function ECF_TerminaFechamentoCupomCodigoBarrasMFD(
                         cMensagem: pchar;
                         cTipoCodigo: pchar;
                         cCodigo: pchar;
                         iAltura: Integer;
                         iLargura: Integer;
                         iPosicaoCaracteres: Integer;
                         iFonte: Integer;
                         iMargem: Integer;
                         iCorrecaoErros: Integer;
                         iColunas: Integer ): Integer;StdCall; External 'CONVECF.DLL';

function ECF_CancelaItemNaoFiscalMFD( NumeroItem: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_AcrescimoItemNaoFiscalMFD( NumeroItem: pchar; AcrescimoDesconto: pchar; TipoAcrescimoDesconto: pchar;ValorAcrescimoDesconto: pchar ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_CancelaAcrescimoNaoFiscalMFD( NumeroItem: pchar; AcrescimoDesconto: pchar ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ImprimeClicheMFD:Integer; StdCall; External 'CONVECF.DLL' Name 'ECF_ImprimeClicheMFD';
function ECF_ImprimeInformacaoChequeMFD( Posicao: Integer; Linhas: Integer; Mensagem: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_RelatorioSintegraMFD(
              iRelatorios : Integer;
              cArquivo    : pchar;
              cMes        : pchar;
              cAno        : pchar;
              cRazaoSocial: pchar;
              cEndereco   : pchar;
              cNumero     : pchar;
              cComplemento: pchar;
              cBairro     : pchar;
              cCidade     : pchar;
              cCEP        : pchar;
              cTelefone   : pchar;
              cFax        : pchar;
              cContato    : pchar ): Integer; StdCall; External 'CONVECF.DLL';

function ECF_GeraRelatorioSintegraMFD (
              iRelatorios : Integer;
              cArquivoOrigem : pchar;
              cArquivoDestino: pchar;
              cMes           : pchar;
              cAno           : pchar;
              cRazaoSocial   : pchar;
              cEndereco      : pchar;
              cNumero        : pchar;
              cComplemento   : pchar;
              cBairro        : pchar;
              cCidade        : pchar;
              cCEP           : pchar;
              cTelefone      : pchar;
              cFax           : pchar;
              cContato       : pchar ): Integer; StdCall; External 'CONVECF.DLL';

function ECF_DownloadMF( Arquivo: pchar ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_DownloadMFD(
             Arquivo: pchar;
             TipoDownload: pchar;
             ParametroInicial: pchar;
             ParametroFinal: pchar;
             UsuarioECF: pchar ): Integer; StdCall; External 'CONVECF.DLL';

Function  ECF_ReproduzirMemoriaFiscalMFD(tipo: pchar;
                                         fxai: pchar;
                                        fxaf:  pchar;
                                          asc: pchar;
                                          bin: pchar): Integer; StdCall; External 'CONVECF.DLL'

function ECF_FormatoDadosMFD(
             ArquivoOrigem: pchar;
             ArquivoDestino: pchar;
             TipoFormato: pchar;
             TipoDownload: pchar;
             ParametroInicial: pchar;
             ParametroFinal: pchar;
             UsuarioECF: pchar ): Integer; StdCall; External 'CONVECF.DLL';

function ECF_AtivaDesativaVendaUmaLinhaMFD( iFlag: Integer ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_AtivaDesativaAlinhamentoEsquerdaMFD( iFlag: Integer ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_AtivaDesativaCorteProximoMFD(): Integer;StdCall; External 'CONVECF.DLL';
function ECF_AtivaDesativaTratamentoONOFFLineMFD( iFlag: Integer ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_StatusEstendidoMFD( Var iStatus: Integer ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_VerificaFlagCorteMFD( Var iStatus: Integer ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_TempoRestanteComprovanteMFD( cTempo: pchar ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_UFProprietarioMFD( cUF: pchar ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_GrandeTotalUltimaReducaoMFD( cGT: pchar ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_DataMovimentoUltimaReducaoMFD( cData: pchar ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_SubTotalComprovanteNaoFiscalMFD( cSubTotal: pchar ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_InicioFimCOOsMFD( cCOOIni, cCOOFim: pchar ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_InicioFimGTsMFD( cGTIni, cGTFim: pchar ): Integer;StdCall; External 'CONVECF.DLL';

// Novas Funções
Function ECF_VendeItemTresDecimais(codigo: pchar;
                                   nome: pchar;
                                   aliquota: pchar;
                                   quant: pchar;
                                   valor: pchar;
                                   tipoacrdesc: pchar;
                                   perc: pchar): Integer;
                           StdCall; External 'CONVECF.DLL';

Function ECF_IdentificaConsumidor( nomei: pchar; endi: pchar; cpfi: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__EmitirCupomAdicional(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__AbreRelatorioGerencial(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__EnviarTextoCNF(cTexto: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__AbreRecebimentoNaoFiscal( indice: pchar;
                                        tipoacredesc: pchar;
                                        tipovalor: pchar;
                                        acredesci: pchar;
                                        receb: pchar;
                                        texto: pchar): Integer;
                           StdCall; External 'CONVECF.DLL';

Function ECF__EfetuaFormaPagamentoNaoFiscal(legenda: pchar; valor: pchar; texto: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF__FundoCaixa(  valor: pchar;legenda: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__ReducaoZAjustaDataHora(cdata: pchar;chora: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__AutenticacaoStr(texto: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__ProgramaFormasPagamento(Modal: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__ProgramaOperador(oper: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__CfgFechaAutomaticoCupom(fac: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__CfgRedZAutomatico(zauto: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__CfgCupomAdicional(adicional: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__CfgEspacamentoCupons(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__CfgHoraMinReducaoZ(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__CfgLimiarNearEnd(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__CfgPermMensPromoCNF(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_Registry(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_Registry_AlteraRegistry(chave: pchar;valori: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_Registry_Path(path: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_Registry_PathMFD(path: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_Registry_ZAutomatica(zauto: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_Registry_Verao(verao: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_Registry_Log(log: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_Registry_AplMensagem1(apl: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_Registry_AplMensagem2(apl: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_Registry_Default(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_Registry_RetornaValor(ecf: pchar;chave: pchar; valor: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_StatusCupomFiscal(cupa: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_StatusRelatorioGerencial(rela: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_StatusComprovanteNaoFiscalVinculado(vinc: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_StatusComprovanteNaoFiscalNaoVinculado(nvinc: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_VerificaModeloEcf(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_VerificaHorarioVerao(verao: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_VerificaZPendente(zpen: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_VerificaXPendente(xpen: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_VerificaDiaAberto(diaa: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_VerificaDescricaoFormasPagamento(Formas:pchar):Integer;StdCall; External 'CONVECF.DLL';
Function ECF_VerificaFormasPagamentoEx(FPag: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_VerificaTotalizadoresNaoFiscaisEx(Recebimento: pchar):Integer;StdCall; External 'CONVECF.DLL';
Function ECF_ClicheProprietarioEx(ClicheProprietario: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_RegistraNumeroSerie(): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_VerificaNumeroSerie(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaSerialCriptografado(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_COO(COOi: pchar; COOf: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_LerAliquotasComIndice(taxas: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_VendaBruta(vbruta: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_UltimaFormaPagamento(nome: pchar; Valor: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_TipoUltimoDocumento(): Integer; StdCall; External 'CONVECF.DLL';
//Function ECF_PalavraStatus(status): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_PalavraStatusBinario(status: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaErroExtendido(status: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaAcrescimoNF(acnf: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaCFCancelados(cfc: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_RetornaCNFCancelados(nfc: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_RetornaCLX(clx: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_RetornaCNFNV(Recebimento: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_RetornaCNFV(Vinculado: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_RetornaCOO(COO: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_RetornaCRO(cro: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_RetornaCRZ(crz: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaCRZRestante(sRed: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaCancelamentoNF( cnf: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaDescontoNF( dnf: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaGNF(gnf: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaTempoImprimindo(MinImprim: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaTempoLigado(MinutosLigada: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaTotalPagamentos(FPag: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaTroco(troco: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaRegistradoresNaoFiscais(rnf: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaRegistradoresFiscais(rf: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaValorComprovanteNaoFiscal(indice: pchar; Valor: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_RetornaIndiceComprovanteNaoFiscal(nome:pchar;indice: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_CasasDecimaisProgramada( dval: pchar;dqt: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_TempoEsperaCheque(segundos: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_StatusCheque(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_ImprimirCheque(banco: pchar; cidade: pchar; cdata: pchar; nominal: pchar; valor: pchar; pos: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_ImprimirVersoCheque(texto: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_LiberarCheque(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_LeituraCodigoMICR(cmc7: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_CancelarCheque(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_ProgramarLeiauteCheque(banco: pchar;geometria: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_LeituraLeiautesCheques(): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_DescontoSobreItemVendido(item: pchar;tipodesc: pchar; valor: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_AcrescimosICMSISS(vaicms: pchar; vaiss: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_CancelamentosICMSISS(vcicms: pchar; vciss: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_DescontosICMSISS(vdicms: pchar; vdiss: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_LeituraInformacaoUltimoDoc(): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_LeituraInformacaoUltimosCNF(): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_VerificaRelatorioGerencialProgMFD(sRG: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_SegundaViaCNFV(): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_CancelamentoCNFV(ignorado: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_TEF_ImprimirRespostaCartao(path: pchar;forma: pchar;trava: pchar;valor: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_TEF_ImprimirResposta(path: pchar;forma: pchar;trava: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_TEF_FechaRelatorio(): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_TEF_EsperarArquivo(path: pchar;segundos: pchar;trava: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_TEF_TravarTeclado(trava: pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_ApagaTabelaNomesNaoFiscais(): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_ApagaTabelaNomesFormasdePagamento(): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_ApagaTabelaAliquotas(): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_ApagaTabelaNomesRelatoriosGerenciais(): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_ArquivoSintegra2004MFD( itipo: Integer;
                                    cArquivo: pchar;
                                    cMes: pchar;
                                    cAno: pchar;
                                    cMesf: pchar;
                                    cAnof: pchar;
                                    cRazaoSocial: pchar;
                                    cEndereco: pchar;
                                    cNumero: pchar;
                                    cComplemento: pchar;
                                    cBairro: pchar;
                                    cCidade: pchar;
                                    cUF: pchar;
                                    cCEP: pchar;
                                    cTelefone: pchar;
                                    cFax: pchar;
                                    cContato: pchar): Integer;StdCall; External 'CONVECF.DLL';

//Function ECF_LigaDesligaJanelas( impressora: pchar,resto: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function  ECF_EnviarLogotipoCliche  (path: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function  ECF_GravarLogotipoCliche  (): Integer;StdCall; External 'CONVECF.DLL';
Function  ECF_ExcluirLogotipoCliche (): Integer;StdCall; External 'CONVECF.DLL';
//Function  ECF_ProgramarParametrosDiversos(ecf: pchar,loja: pchar,extra: pchar,qt: pchar,iss: pchar): Integer;StdCall; External 'CONVECF.DLL';
//Function  ECF_ProgramarCliche (  razao: pchar,fantasia: pchar,endereco:  pchar): Integer;StdCall; External 'CONVECF.DLL';
Function  ECF_RetornaTipoEcf  (tipo: pchar): Integer; StdCall; External 'CONVECF.DLL';
//Function  ECF_TabelaMercadoriasServicos3404(destino: pchar,inicio: pchar,fim: pchar): Integer;StdCall; External 'CONVECF.DLL';
{Function  ECF_ProgramarTotalizadoresNaoTributados
                                  (f: pchar,
                                   i: pchar,
                                   n: pchar,
                                   fs: pchar,
                                   is: pchar,
                                   ns: pchar):Integer;
                           StdCall; External 'CONVECF.DLL';}

{Function  ECF_ReproduzirMemoriaFiscalMFD
                                  (tipo: pchar,
                                   fxai: pchar,
                                   fxaf:  pchar,
                                   asc: pchar,
                                  bin: pchar): Integer;
                           StdCall; External 'CONVECF.DLL';}

//Function ECF_TipoUltimoDocumento (tipo: pchar): Integer;StdCall; External 'CONVECF.DLL';
//Function ECF_GeraRegistrosCAT52MFD(pathbin:pchar, datas:pchar): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_CapturaDocunmentos(tipo, faixai,faixaf, arquivo, log: pchar):Integer;StdCall; External 'CONVECF.DLL';
Function ECF_ConfigurarECF(gui:pchar;velo:pchar;modo:pchar;beep: pchar): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_DataHoraGravacaoUsuarioSWBasicoMFAdicional(datusu: pchar;datsof: pchar;Adic: pchar) : Integer; StdCall; External 'CONVECF.DLL';
Function ECF_FlagsFiscais3MFD(Var Flag: Integer) : Integer; StdCall; External 'CONVECF.DLL';

//##############################Outras Funções de uso no sistema################

{Funcao de um dll do windows}
Function BlockInput(fbLookIt:Boolean):Integer; stdcall; external 'user32.dll';
{ Exemplos de Uso
  BlockInput(true);  ------> Trava Teclado e Mouse
  BlockInput(false); ------> Destrava Teclado e Mouse
}

const //Mensagens de retorno para função da Impressora Sweda
Mens_St1:Array[0..7] of String=('Número de Parâmetros do comando inválido',
                       'Cupom Fiscal Aberto',
                       'Comando inexistente',
                       'Irrelevante',
                       'Impressora em erro',
                       'Erro de relógio',
                       'Pouco papel',
                       'Fim de papel');

Mens_St2:Array[0..6] of String=('Comando não executado',
                                'CNPJ do Proprietário não cadastrado',
                                'Cancelamento não permitido',
                                'Alíquota não programada',
                                'Erro de memória',
                                'Memória Fiscal cheia',
                                'Tipo de parâmetro de comando inválido');


implementation

uses checkout, lite_frmprincipal, UMsg;

// **********************************************************************
// -------------------- Analisa a Variável Retorno_imp_Fiscal ------------------

//Função somente para impressora Elgin
function ObtemRetornoECF(var strMensagemErro: String): Boolean;
var
  iRetorno, iCodErro: Integer;
  strErroMsg: String;
  bSucesso: Boolean;
begin
  strErroMsg := StringofChar(' ', 1024);
  iRetorno := Elgin_RetornoImpressora(iCodErro, strErroMsg);
  strMensagemErro := 'Erro nº: ' + intToStr(iCodErro) + ' - ' + strErroMsg;

  If (iRetorno = 1) Then
    bSucesso := True
  Else
    bSucesso := False;

  ObtemRetornoECF := bSucesso;
End;

Procedure Analisa_iRetorno();
var
   strMensagem, strCirc: string;
begin
  ECF_Respondendo:=0;//0 - Repondendo    1 - Sem Reposta
  if (s_ImpFiscal = 'ECF Bematech')or(s_ImpFiscal = 'ECF Daruma')
  then begin
        if Retorno_imp_Fiscal = 0
        then Application.MessageBox( 'Erro de Comunicação !', 'Erro',MB_IconError + MB_OK)
        else If Retorno_imp_Fiscal = -1
        then Application.MessageBox( 'Erro de Execução na Função. Verifique!', 'Erro', MB_IconError + MB_OK)
        else if Retorno_imp_Fiscal = -2
        then Application.MessageBox( 'Parâmetro Inválido !', 'Erro',MB_IconError + MB_OK)
        else if Retorno_imp_Fiscal = -3
        then Application.MessageBox( 'Alíquota não programada !', 'Atenção',MB_IconInformation + MB_OK)
        else if Retorno_imp_Fiscal = -4
        then Application.MessageBox( 'Arquivo BemaFI32.INI não encontrado. Verifique!', 'Atenção',MB_IconInformation + MB_OK)
        else if Retorno_imp_Fiscal = -5
        then Application.MessageBox( 'Erro ao Abrir a Porta de Comunicação', 'Erro',MB_IconError + MB_OK)
        else if Retorno_imp_Fiscal = -6
        then Application.MessageBox( 'Impressora Desligada ou Desconectada', 'Atenção',MB_IconInformation + MB_OK)
        else if Retorno_imp_Fiscal = -7
        then Application.MessageBox( 'Banco Não Cadastrado no Arquivo BemaFI32.ini', 'Atenção',MB_IconInformation + MB_OK)
        else if Retorno_imp_Fiscal = -8
        then Application.MessageBox( 'Erro ao Criar ou Gravar no Arquivo Retorno.txt ou Status.txt', 'Erro', MB_IconError + MB_OK)
        else if Retorno_imp_Fiscal = -18
        then Application.MessageBox( 'Não foi possível abrir arquivo INTPOS.001 !', 'Atenção',MB_IconInformation + MB_OK)
        else if Retorno_imp_Fiscal = -19
        then Application.MessageBox( 'Parâmetro diferentes !', 'Atenção',MB_IconInformation + MB_OK)
        else if Retorno_imp_Fiscal = -20
        then Application.MessageBox( 'Transação cancelada pelo Operador !', 'Atenção',MB_IconInformation + MB_OK)
        else if Retorno_imp_Fiscal = -21
        then Application.MessageBox( 'A Transação não foi aprovada !', 'Atenção',MB_IconInformation + MB_OK)
        else if Retorno_imp_Fiscal = -22
        then Application.MessageBox( 'Não foi possível terminal a Impressão !', 'Atenção',MB_IconInformation + MB_OK)
        else if Retorno_imp_Fiscal = -23
        then Application.MessageBox( 'Não foi possível terminal a Operação !', 'Atenção',MB_IconInformation + MB_OK)
        else if Retorno_imp_Fiscal = -24
        then Application.MessageBox( 'Forma de pagamento não programada.', 'Atenção', MB_IconInformation + MB_OK)
        else if Retorno_imp_Fiscal = -25
        then Application.MessageBox( 'Totalizador não fiscal não programado.', 'Atenção',MB_IconInformation + MB_OK)
        else if Retorno_imp_Fiscal = -26
        then Application.MessageBox( 'Transação já Efetuada !', 'Atenção',MB_IconInformation + MB_OK)
        else if Retorno_imp_Fiscal = -28
        then Application.MessageBox( 'Não há Informações para serem Impressas !', 'Atenção',MB_IconInformation + MB_OK);
        end
   else if s_ImpFiscal = 'ECF Elgin'
   then begin
        if Retorno_imp_Fiscal <> 1
        then begin
              strMensagem := 'Erro não identificado';
              case Retorno_imp_Fiscal of
                    0: //strMensagem := 'Erro de comunicação';
              if (ObtemRetornoECF(strCirc))
              then strMensagem := strCirc
              else strMensagem := 'Erro na comunicação.';
                   -2: strMensagem := 'Erro Nº -2 - Parâmetro inválido';
                   -4: strMensagem := 'Erro Nº -4 - Arquivo ini não encontrado ou parâmetro inválido para o nome da porta';
                   -5: strMensagem := 'Erro Nº -5 - Erro ao abrir a porta de comunicação';
                   -27: strMensagem := 'Erro Nº -27 - Status da impressora diferente de 6,0,0,0 (Ack, St1, St2 e St3)';
              end;
              Application.MessageBox(  Pchar(strMensagem),'Erro',MB_IconError + MB_OK);
              end;
        end
   else if s_ImpFiscal = 'ECF Sweda'
   then begin
        if retorno_imp_fiscal = 0
        then Application.MessageBox('Comando não executado','Atenção',MB_IconInformation + MB_OK);  
        end;
end;

// ------------------- Analisa Retorno da Impressora --------------------

Procedure Retorno_Impressora;
Var
   iACK, iST1, iST2, iST3, indice : Integer;
   mensagem, bvalor : String;
Begin
  mensagem:='';
  iACK := 0; iST1 := 0; iST2 := 0; iST3 := 0; indice := 0;
  ECF_Respondendo:=0;//0 - Repondendo    1 - Sem Reposta

  if s_ImpFiscal = 'ECF Bematech'
  then Retorno_imp_Fiscal := Bematech_FI_RetornoImpressora( iACK, iST1, iST2 )
  else if s_ImpFiscal = 'ECF Daruma'
  then Retorno_imp_Fiscal := Daruma_FI_RetornoImpressora( iACK, iST1, iST2 )
  else if s_ImpFiscal = 'ECF Elgin'
  then Retorno_imp_Fiscal := Elgin_VerificaEstadoImpressora( iACK, iST1, iST2 )
  else if s_ImpFiscal = 'ECF Sweda'
  then Retorno_imp_Fiscal := ECF_RetornoImpressoraMFD( iACK, iST1, iST2, iST3 );

  if s_ImpFiscal <> 'ECF Sweda'
  then begin
        if FRetornoImpressora=Nil
        then Application.CreateForm(TFRetornoImpressora,FRetornoImpressora);

        RetornouErro:=False;

        With FRetornoImpressora
        do begin
            label4.Enabled  := false;
            label5.Enabled  := false;
            label6.Enabled  := false;
            label7.Enabled  := false;
            label8.Enabled  := false;
            label9.Enabled  := false;
            label10.Enabled := false;
            label11.Enabled := false;
            label12.Enabled := false;
            label13.Enabled := false;
            label14.Enabled := false;
            label15.Enabled := false;
            label16.Enabled := false;
            label17.Enabled := false;
            label18.Enabled := false;
            label19.Enabled := false;
            end;

        If iACK = 6 then
        BEGIN

          // Verifica ST1
          IF iST1 >= 128
          Then BEGIN
               iST1 := iST1 - 128; FRetornoImpressora.label4.Enabled  := True;
               RetornouErro:=True;
               END;
          IF iST1 >= 64
          Then BEGIN
               iST1 := iST1 - 64;  FRetornoImpressora.label5.Enabled  := True;
               RetornouErro:=True;
               END;
          IF iST1 >= 32
          Then BEGIN
               iST1 := iST1 - 32;  FRetornoImpressora.label6.Enabled  := True;
               RetornouErro:=True;
               END;
          IF iST1 >= 16
          Then BEGIN
               iST1 := iST1 - 16;  FRetornoImpressora.label7.Enabled  := True;
               RetornouErro:=True;
               END;
          IF iST1 >= 8
          Then BEGIN
               iST1 := iST1 - 8;   FRetornoImpressora.label8.Enabled  := True;
               RetornouErro:=True;
               END;
          IF iST1 >= 4
          Then BEGIN
               iST1 := iST1 - 4;   FRetornoImpressora.label9.Enabled  := True;
               RetornouErro:=True;
               END;
          IF iST1 >= 2
          Then BEGIN
               iST1 := iST1 - 2;   FRetornoImpressora.label10.Enabled := True;
               RetornouErro:=True;
               END;
          IF iST1 >= 1
          Then BEGIN
               iST1 := iST1 - 1;   FRetornoImpressora.label11.Enabled := True;
               RetornouErro:=True;
               END;

          // Verifica ST2
          IF iST2 >= 128
          Then BEGIN
               iST2 := iST2 - 128; FRetornoImpressora.label12.Enabled := True;
               RetornouErro:=True;
               END;
          IF iST2 >= 64
          Then BEGIN
               iST2 := iST2 - 64;  FRetornoImpressora.label13.Enabled := True;
               RetornouErro:=True;
               END;
          IF iST2 >= 32
          Then BEGIN
               iST2 := iST2 - 32;  FRetornoImpressora.label14.Enabled := True;
               RetornouErro:=True;
               END;
          IF iST2 >= 16
          Then BEGIN
               iST2 := iST2 - 16;  FRetornoImpressora.label15.Enabled := True;
               RetornouErro:=True;
               END;
          IF iST2 >= 8
          Then BEGIN
               iST2 := iST2 - 8;   FRetornoImpressora.label16.Enabled := True;
               RetornouErro:=True;
               END;
          IF iST2 >= 4
          Then BEGIN
               iST2 := iST2 - 4;   FRetornoImpressora.label17.Enabled := True;
               RetornouErro:=True;
               END;
          IF iST2 >= 2
          Then BEGIN
               iST2 := iST2 - 2;   FRetornoImpressora.label18.Enabled := True;
               RetornouErro:=True;
               END;
          IF iST2 >= 1
          Then BEGIN
               iST2 := iST2 - 1;   FRetornoImpressora.label19.Enabled := True;
               RetornouErro:=True;
               END;

          if RetornouErro
          then FRetornoImpressora.ShowModal;

          FRetornoImpressora.Release;
          FRetornoImpressora:=nil;

          //Mostra erro extendido na Impressora Daruma
          if s_ImpFiscal = 'ECF Daruma'
          then begin
               SetLength(Str_ErroExtendido,4);
               Int_ErroExtendido := Daruma_FI_RetornaErroExtendido ( Str_ErroExtendido );
               ErroExtendidoDaruma(StrToInt(Str_ErroExtendido));
               end;

        End;

        If iACK = 21 Then
        BEGIN
          Informa( 'Atenção!!!' + #13 + #10 +
                   'A Impressora retornou NAK. O programa será abortado.');
          Application.Terminate;
          Exit;
        End;
     end
    else if s_ImpFiscal = 'ECF Sweda'
    then begin
         RetornouErro:=False;

         if Retorno_imp_Fiscal = 0
         then Informa('Falha na Execução do comando');

         if iST1 > 0
         then begin
              try
                indice:=Strtoint(floattostr(log2(strtofloat(inttostr(iST1)))));
              except
                end;
              Informa(inttostr(iST1)+'-'+Mens_ST1[indice]);
          end;
         if iST2 > 0
         then begin
              try
                indice:=Strtoint(floattostr(log2(strtofloat(inttostr(iST2)))));
              except
              end;
              Informa(inttostr(iST2)+'-'+Mens_St2[indice]);

              bValor:= IntToBin(iST1);
              if bvalor[25]='1' then Informa('Fim de Papel');
              if bvalor[26]='1' then  Informa('Pouco Papel');
              if bvalor[27]='1' then Informa('Erro no relógio');
              if bvalor[29]='1' then Informa('Impressora em erro');
              if bvalor[30]='1' then Informa('Comando inexistente');
              if bvalor[31]='1' then Informa('Cupom fiscal aberto');

              bValor:= IntToBin(iST2);
              if bvalor[26]='1' then Informa('Memória fiscal Cheia');
              if bvalor[27]='1' then Informa('Erro RAM');
              if bvalor[28]='1' then Informa('Alíquota não Programada');
              if bvalor[29]='1' then Informa('Capacidade de alíquotas esgotadas');
              if bvalor[30]='1' then Informa('Cancelamento Não Permitido');
              if bvalor[31]='1' then Informa('CNPJ/IE não programado');
              if bvalor[32]='1' then Informa('Comando não executado');

              if (iST1 > 0) or (iST2 >0)
              then RetornouErro:=True;

          end;
          case iST3 of
                0:   mensagem:='COMANDO OK';
                1:   mensagem:='COMANDO INVÁLIDO';
                2:   mensagem:='ERRO DESCONHECIDO';
                3:   mensagem:='NÚMERO DE PARÂMETRO INVÁLIDO';
                4:   mensagem:='TIPO DE PARÂMETRO INVÁLIDO';
                5:   mensagem:='TODAS ALÍQUOTAS JÁ PROGRAMADAS';
                6:   mensagem:='TOTALIZADOR NÃO FISCAL JÁ PROGRAMADO';
                7:   mensagem:='CUPOM FISCAL ABERTO';
                8:   mensagem:='CUPOM FISCAL FECHADO';
                9:   mensagem:='ECF OCUPADO';
                10:  mensagem:='IMPRESSORA EM ERRO';
                11:   mensagem:='IMPRESSORA SEM PAPEL';
                12:   mensagem:='IMPRESSORA COM CABEÇA LEVANTADA';
                13:   mensagem:='IMPRESSORA OFF LINE';
                14:   mensagem:='ALÍQUOTA NÃO PROGRAMADA';
                15:   mensagem:='TERMINADOR DE STRING FALTANDO';
                16:   mensagem:='ACRÉSCIMO OU DESCONTO MAIOR QUE O TOTAL DO CUPOM FISCAL';
                17:   mensagem:='CUPOM FISCAL SEM ITEM VENDIDO';
                18:   mensagem:='COMANDO NÃO EFETIVADO';
                19:   mensagem:='SEM ESPAÇO PARA NOVAS FORMAS DE PAGAMENTO';
                20:   mensagem:='FORMA DE PAGAMENTO NÃO PROGRAMADA';
                21:   mensagem:='ÍNDICE MAIOR QUE NÚMERO DE FORMA DE PAGAMENTO';
                22:   mensagem:='FORMAS DE PAGAMENTO ENCERRADAS';
                23:   mensagem:='CUPOM NÃO TOTALIZADO';
                24:   mensagem:='COMANDO MAIOR QUE 7Fh (127d)';
                25:   mensagem:='CUPOM FISCAL ABERTO E SEM ÍTEM';
                26:   mensagem:='CANCELAMENTO NÃO IMEDIATAMENTE APÓS';
                27:   mensagem:='CANCELAMENTO JÁ EFETUADO';
                28:   mensagem:='COMPROVANTE DE CRÉDITO OU DÉBITO NÃO PERMITIDO OU JÁ EMITIDO';
                29:   mensagem:='MEIO DE PAGAMENTO NÃO PERMITE TEF';
                30:   mensagem:='SEM COMPROVANTE NÃO FISCAL ABERTO';
                31:   mensagem:='COMPROVANTE DE CRÉDITO OU DÉBITO JÁ ABERTO';
                32:   mensagem:='REIMPRESSÃO NÃO PERMITIDA';
                33:   mensagem:='COMPROVANTE NÃO FISCAL JÁ ABERTO';
                34:   mensagem:='TOTALIZADOR NÃO FISCAL NÃO PROGRAMADO';
                35:   mensagem:='CUPOM NÃO FISCAL SEM ÍTEM VENDIDO';
                36:   mensagem:='ACRÉSCIMO E DESCONTO MAIOR QUE TOTAL CNF';
                37:   mensagem:='MEIO DE PAGAMENTO NÃO INDICADO';
                38:   mensagem:='MEIO DE PAGAMENTO DIFERENTE DO TOTAL DO RECEBIMENTO';
                39:   mensagem:='NÃO PERMITIDO MAIS DE UMA SANGRIA OU SUPRIMENTO';
                40:   mensagem:='RELATÓRIO GERENCIAL JÁ PROGRAMADO';
                41:   mensagem:='RELATÓRIO GERENCIAL NÃO PROGRAMADO';
                42:   mensagem:='RELATÓRIO GERENCIAL NÃO PERMITIDO';
                43:   mensagem:='MFD NÃO INICIALIZADA';
                44:   mensagem:='MFD AUSENTE';
                45:   mensagem:='MFD SEM NÚMERO DE SÉRIE';
                46:   mensagem:='MFD JÁ INICIALIZADA';
                47:   mensagem:='MFD LOTADA';
                48:   mensagem:='CUPOM NÃO FISCAL ABERTO';
                49:   mensagem:='MEMÓRIA FISCAL DESCONECTADA';
                50:   mensagem:='MEMÓRIA FISCAL SEM NÚMERO DE SÉRIE DA MFD';
                51:   mensagem:='MEMÓRIA FISCAL LOTADA';
                52:   mensagem:='DATA INICIAL INVÁLIDA';
                53:   mensagem:='DATA FINAL INVÁLIDA';
                54:   mensagem:='CONTADOR DE REDUÇÃO Z INICIAL INVÁLIDO';
                55:   mensagem:='CONTADOR DE REDUÇÃO Z FINAL INVÁLIDO';
                56:   mensagem:='ERRO DE ALOCAÇÃO';
                57:   mensagem:='DADOS DO RTC INCORRETOS';
                58:   mensagem:='DATA ANTERIOR AO ÚLTIMO DOCUMENTO EMITIDO';
                59:   mensagem:='FORA DE INTERVENÇÃO TÉCNICA';
                60:   mensagem:='EM INTERVENÇÃO TÉCNICA';
                61:   mensagem:='ERRO NA MEMÓRIA DE TRABALHO';
                62:   mensagem:='JÁ HOUVE MOVIMENTO NO DIA';
                63:   mensagem:='BLOQUEIO POR RZ';
                64:   mensagem:='FORMA DE PAGAMENTO ABERTA';
                65:   mensagem:='AGUARDANDO PRIMEIRO PROPRIETÁRIO';
                66:   mensagem:='AGUARDANDO RZ';
                67:   mensagem:='ECF OU LOJA IGUAL A ZERO';
                68:   mensagem:='CUPOM ADICIONAL NÃO PERMITIDO';
                69:   mensagem:='DESCONTO MAIOR QUE TOTAL VENDIDO EM ICMS';
                70:   mensagem:='RECEBIMENTO NÃO FISCAL NULO NÃO PERMITIDO';
                71:   mensagem:='ACRÉSCIMO OU DESCONTO MAIOR QUE TOTAL NÃO FISCAL';
                72:   mensagem:='MEMÓRIA FISCAL LOTADA PARA NOVO CARTUCHO';
                73:   mensagem:='ERRO DE GRAVAÇÃO NA MF';
                74:   mensagem:='ERRO DE GRAVAÇÃO NA MFD';
                75:   mensagem:='DADOS DO RTC ANTERIORES AO ÚLTIMO DOC ARMAZENADO';
                76:   mensagem:='MEMÓRIA FISCAL SEM ESPAÇO PARA GRAVAR LEITURAS DA MFD';
                77:   mensagem:='MEMÓRIA FISCAL SEM ESPAÇO PARA GRAVAR VERSAO DO SB';
                78:   mensagem:='DESCRIÇÃO IGUAL A DEFAULT NÃO PERMITIDO';
                79:   mensagem:='EXTRAPOLADO NÚMERO DE REPETIÇÕES PERMITIDAS';
                80:   mensagem:='SEGUNDA VIA DO COMPROVANTE DE CRÉDITO OU DÉBITO NÃO PERMITIDO';
                81:   mensagem:='PARCELAMENTO FORA DA SEQUÊNCIA';
                82:   mensagem:='COMPROVANTE DE CRÉDITO OU DÉBITO ABERTO';
                83:   mensagem:='TEXTO COM SEQUÊNCIA DE ESC INVÁLIDA';
                84:   mensagem:='TEXTO COM SEQUÊNCIA DE ESC INCOMPLETA';
                85:   mensagem:='VENDA COM VALOR NULO';
                86:   mensagem:='ESTORNO DE VALOR NULO ';
                87:   mensagem:='FORMA DE PAGAMENTO DIFERENTE DO TOTAL DA SANGRIA';
                88:   mensagem:='REDUÇÃO NÃO PERMITIDA EM INTERVENÇÃO TÉCNICA';
                89:   mensagem:='AGUARDANDO RZ PARA ENTRADA EM INTERVENÇÃO TÉCNICA';
                90:   mensagem:='FORMA DE PAGAMENTO COM VALOR NULO NÃO PERMITIDO';
                91:   mensagem:='ACRÉSCIMO E DESCONTO MAIOR QUE VALOR DO ÍTEM';
                92:   mensagem:='AUTENTICAÇÃO NÃO PERMITIDA';
                93:   mensagem:='TIMEOUT NA VALIDAÇÃO';
                94:   mensagem:='COMANDO NÃO EXECUTADO EM IMPRESSORA BILHETE DE PASSAGEM';
                95:   mensagem:='COMANDO NÃO EXECUTADO EM IMPRESSORA DE CUPOM FISCAL';
                96:   mensagem:='CUPOM NÃO FISCAL FECHADO';
                97:   mensagem:='PARÂMETRO NÃO ASCII EM CAMPO ASCII';
                98:   mensagem:='PARÂMETRO NÃO ASCII NUMÉRICO EM CAMPO ASCII NUMÉRICO';
                99:   mensagem:='TIPO DE TRANSPORTE INVÁLIDO';
                100:  mensagem:='DATA E HORA INVÁLIDA';
                101:  mensagem:='SEM RELATÓRIO GERENCIAL OU COMPROVANTE DE CRÉDITO OU DÉBITO ABERTO';
                102:  mensagem:='NÚMERO DO TOTALIZADOR NÃO FISCAL INVÁLIDO';
                103:  mensagem:='PARÂMETRO DE ACRÉSCIMO OU DESCONTO INVÁLIDO';
                104:  mensagem:='ACRÉSCIMO OU DESCONTO EM SANGRIA OU SUPRIMENTO NÃO PERMITIDO';
                105:  mensagem:='NÚMERO DO RELATÓRIO GERENCIAL INVÁLIDO';
                106:  mensagem:='FORMA DE PAGAMENTO ORIGEM NÃO PROGRAMADA';
                107:  mensagem:='FORMA DE PAGAMENTO DESTINO NÃO PROGRAMADA';
                108:  mensagem:='ESTORNO MAIOR QUE FORMA PAGAMENTO';
                109:  mensagem:='CARACTER NUMÉRICO NA CODIFICAÇÃO GT NÃO PERMITIDO';
                110:  mensagem:='ERRO NA INICIALIZAÇÃO DA MF';
                111:  mensagem:='NOME DO TOTALIZADOR EM BRANCO NÃO PERMITIDO';
                112:  mensagem:='DATA E HORA ANTERIORES AO ÚLTIMO DOC ARMAZENADO';
                113:  mensagem:='PARÂMETRO DE ACRÉSCIMO OU DESCONTO INVÁLIDO';
                114:  mensagem:='ÍTEM ANTERIOR AOS TREZENTOS ÚLTIMOS';
                115:  mensagem:='ÍTEM NÃO EXISTE OU JÁ CANCELADO';
                116:  mensagem:='CÓDIGO COM ESPAÇOS NÃO PERMITIDO';
                117:  mensagem:='DESCRICAO SEM CARACTER ALFABÉTICO NÃO PERMITIDO';
                118:  mensagem:='ACRÉSCIMO MAIOR QUE VALOR DO ÍTEM';
                119:  mensagem:='DESCONTO MAIOR QUE VALOR DO ÍTEM';
                120:  mensagem:='DESCONTO EM ISS NÃO PERMITIDO';
                121:  mensagem:='ACRÉSCIMO EM ÍTEM JÁ EFETUADO';
                122:  mensagem:='DESCONTO EM ÍTEM JÁ EFETUADO';
                123:  mensagem:='ERRO NA MEMÓRIA FISCAL CHAMAR CREDENCIADO';
                124:  mensagem:='AGUARDANDO GRAVAÇÃO NA MEMÓRIA FISCAL';
                125:  mensagem:='CARACTER REPETIDO NA CODIFICAÇÃO DO GT';
                126:  mensagem:='VERSÃO JÁ GRAVADA NA MEMÓRIA FISCAL';
                127:  mensagem:='ESTOURO DE CAPACIDADE NO CHEQUE';
                128:  mensagem:='TIMEOUT NA LEITURA DO CHEQUE';
                129:  mensagem:='MÊS INVÁLIDO';
                130:  mensagem:='COORDENADA INVÁLIDA';
                131:  mensagem:='SOBREPOSIÇÃO DE TEXTO';
                132:  mensagem:='SOBREPOSIÇÃO DE TEXTO NO VALOR';
                133:  mensagem:='SOBREPOSIÇÃO DE TEXTO NO EXTENSO';
                134:  mensagem:='SOBREPOSIÇÃO DE TEXTO NO FAVORECIDO';
                135:  mensagem:='SOBREPOSIÇÃO DE TEXTO NA LOCALIDADE';
                136:  mensagem:='SOBREPOSIÇÃO DE TEXTO NO OPCIONAL';
                137:  mensagem:='SOBREPOSIÇÃO DE TEXTO NO DIA';
                138:  mensagem:='SOBREPOSIÇÃO DE TEXTO NO MÊS';
                139:  mensagem:='SOBREPOSIÇÃO DE TEXTO NO ANO';
                140:  mensagem:='USANDO MFD DE OUTRO ECF';
                141:  mensagem:='PRIMEIRO DADO DIFERENTE DE ESC OU 1C';
                142:  mensagem:='NÃO PERMITIDO ALTERAR SEM INTERVENÇÃO TÉCNICA';
                143:  mensagem:='DADOS DA ÚLTIMA RZ CORROMPIDOS';
                144:  mensagem:='COMANDO NÃO PERMITIDO NO MODO INICIALIZAÇÃO';
                145:  mensagem:='AGUARDANDO ACERTO DE RELÓGIO';
                146:  mensagem:='MFD JÁ INICIALIZADA PARA OUTRA MF';
                147:  mensagem:='AGUARDANDO ACERTO DO RELÓGIO OU DESBLOQUEIO PELO TECLADO';
                148:  mensagem:='VALOR FORMA DE PAGAMENTO MAIOR QUE MÁXIMO PERMITIDO';
                149:  mensagem:='RAZÃO SOCIAL EM BRANCO';
                150:  mensagem:='NOME DE FANTASIA EM BRANCO';
                151:  mensagem:='ENDEREÇO EM BRANCO';
                152:  mensagem:='ESTORNO DE CDC NÃO PERMITIDO';
                153:  mensagem:='DADOS DO PROPRIETÁRIO IGUAIS AO ATUAL';
                154:  mensagem:='ESTORNO DE FORMA DE PAGAMENTO NÃO PERMITIDO';
                155:  mensagem:=' DESCRIÇÃO FORMA DE PAGAMENTO IGUAL JÁ PROGRAMADA';
                156:  mensagem:='ACERTO DE HORÁRIO DE VERÃO SÓ IMEDIATAMENTE APÓS RZ';
                157:  mensagem:='IT NÃO PERMITIDA MF RESERVADA PARA RZ';
                158:  mensagem:='SENHA CNPJ INVÁLIDA';
                159:  mensagem:='TIMEOUT NA INICIALIZAÇÃO DA NOVA MF';
                160:  mensagem:='NÃO ENCONTRADO DADOS NA MFD';
                161:  mensagem:='SANGRIA OU SUPRIMENTO DEVEM SER ÚNICOS NO CNF';
                162:  mensagem:='ÍNDICE DA FORMA DE PAGAMENTO NULO NÃO PERMITIDO';
                163:  mensagem:='UF DESTINO INVÁLIDA';
                164:  mensagem:='TIPO DE TRANSPORTE INCOMPATÍVEL COM UF DESTINO';
                165:  mensagem:='DESCRIÇÃO DO PRIMEIRO ÍTEM DO BILHETE DE PASSAGEM DIFERENTE DE "TARIFA"';
                166:  mensagem:='AGUARDANDO IMPRESSÃO DE CHEQUE OU AUTENTICAÇÃO';
                167:  mensagem:='NÃO PERMITIDO PROGRAMAÇAO CNPJ IE COM ESPAÇOS EM BRANCO';
                168:  mensagem:='NÃO PERMITIDO PROGRAMAÇÃO UF COM ESPAÇOS EM BRANCO';
                169:  mensagem:='NÚMERO DE IMPRESSÕES DA FITA DETALHE NESTA INTERVENÇÃO TÉCNICA ESGOTADO';
                170:  mensagem:='CF JÁ SUBTOTALIZADO';
                171:  mensagem:='CUPOM NÃO SUBTOTALIZADO';
                172:  mensagem:='ACRÉSCIMO EM SUBTOTAL JÁ EFETUADO';
                173:  mensagem:='DESCONTO EM SUBTOTAL JÁ EFETUADO';
                174:  mensagem:='ACRÉSCIMO NULO NÃO PERMITIDO';
                175:  mensagem:='DESCONTO NULO NÃO PERMITIDO';
                176:  mensagem:='CANCELAMENTO DE ACRÉSCIMO OU DESCONTO EM SUBTOTAL NÃO PERMITIDO';
                177:  mensagem:='DATA INVÁLIDA';
                178:  mensagem:='VALOR DO CHEQUE NULO NÃO PERMITIDO';
                179:  mensagem:='VALOR DO CHEQUE INVÁLIDO';
                180:  mensagem:='CHEQUE SEM LOCALIDADE NÃO PERMITIDO';
                181:  mensagem:='CANCELAMENTO ACRÉSCIMO EM ÍTEM NÃO PERMITIDO';
                182:  mensagem:='CANCELAMENTO DESCONTO EM ÍTEM NÃO PERMITIDO';
                183:  mensagem:='NÚMERO MÁXIMO DE ÍTENS ATINGIDO';
                184:  mensagem:='NÚMERO DE ÍTEM NULO NÃO PERMITIDO';
                185:  mensagem:='MAIS QUE DUAS ALÍQUOTAS DIFERENTES NO BILHETE DE PASSAGEM NÃO PERMITIDO';
                186:  mensagem:='ACRÉSCIMO OU DESCONTO EM ITEM NÃO PERMITIDO';
                187:  mensagem:='CANCELAMENTO DE ACRÉSCIMO OU DESCONTO EM ITEM NÃO PERMITIDO';
                188:  mensagem:='CLICHE JÁ IMPRESSO';
                189:  mensagem:='TEXTO OPCIONAL DO CHEQUE EXCEDEU O MÁXIMO PERMITIDO';
                190:  mensagem:='IMPRESSÃO AUTOMÁTICA NO VERSO NÃO PERMITIDO NESTE EQUIPAMENTO';
                191:  mensagem:='TIMEOUT NA INSERÇÃO DO CHEQUE';
                192:  mensagem:='OVERFLOW NA CAPACIDADE DE TEXTO DO COMPROVANTE DE CRÉDITO OU DÉBITO';
                193:  mensagem:='PROGRAMAÇÃO DE ESPAÇOS ENTRE CUPONS MENOR QUE O MÍNIMO PERMITIDO';
                194:  mensagem:='EQUIPAMENTO NÃO POSSUI LEITOR DE CHEQUE';
                195:  mensagem:='PROGRAMAÇÃO DE ALÍQUOTA COM VALOR NULO NÃO PERMITIDO';
                196:  mensagem:='PARÂMETRO BAUD RATE INVÁLIDO';
                197:  mensagem:='CONFIGURAÇÃO PERMITIDA SOMENTE PELA PORTA DOS FISCO';
                198:  mensagem:='VALOR TOTAL DO ITEM EXCEDE 11 DÍGITOS';
                199:  mensagem:='PROGRAMAÇÃO DA MOEDA COM ESPAÇOS EM BRACO NÃO PERMITIDO';
                200:  mensagem:='CASAS DECIMAIS DEVEM SER PROGRAMADAS COM 2 OU 3';
                201:  mensagem:='NÃO PERMITE CADASTRAR USUÁRIOS DIFERENTES NA MESMA MFD';
                202:  mensagem:='IDENTIFICAÇÃO DO CONSUMIDOR NÃO PERMITIDA PARA SANGRIA OU SUPRIMENTO';
                203:  mensagem:='CASAS DECIMAIS EM QUANTIDADE MAIOR DO QUE A PERMITIDA';
                204:  mensagem:='CASAS DECIMAIS DO UNITÁRIO MAIOR DO QUE O PERMITIDA';
                205:  mensagem:='POSIÇÃO RESERVADA PARA ICMS';
                206:  mensagem:='POSIÇÃO RESERVADA PARA ISS';
                207:  mensagem:='TODAS AS ALÍQUOTAS COM A MESMA VINCULAÇÃO NÃO PERMITIDO';
                208:  mensagem:='DATA DE EMBARQUE ANTERIOR A DATA DE EMISSÃO';
                end;
         InformaError( inttostr(iST3)+'-'+mensagem);
         if Trim(Mensagem)<>''
         then ECF_Respondendo:=1;
         end;
end;

procedure ErroExtendidoDaruma(iST : Integer);
var
   Mensagem : String;
begin
     Mensagem:='';
     case iST of
          //00 : Mensagem:='IF em modo Manutenção. Foi ligada sem o Jumper de Operação';
          01 : Mensagem:='Método disponível somente em modo Manutenção';
          02 : Mensagem:='Erro durante a gravação da Memória Fiscal';
          03 : Mensagem:='Memória Fiscal esgotada';
          04 : Mensagem:='Erro no relógio interno da IF';
          05 : Mensagem:='Falha mecânica na IF';
          06 : Mensagem:='Erro durante a leitura da Memória Fiscal';
          07 : Mensagem:='Metodo permitido apenas em modo fiscal (IF sem jmper)';
          08 : Mensagem:='Relatório Gerêncial não aberto';
          10 : Mensagem:='Documento sendo emitido';
          11 : Mensagem:='Documento não foi aberto';
          12 : Mensagem:='Não existe documento a cancelar';
          13 : Mensagem:='Dígito não numérico não esperado, foi encontrado nos Parâmetros do Método';
          14 : Mensagem:='Não há mais memória disponível para esta operação/Não há nenhuma posição de méria disponível.';
          15 : Mensagem:='Item a cancelar não foi encontrado';
          16 : Mensagem:='Erro de sintaxe no método';
          17 : Mensagem:='"Estouro" de capacidade numérica (overflow)';
          18 : Mensagem:='Selecionado totalizador tributado com alíquota de imposto não definida';
          19 : Mensagem:='Memória Fiscal vazia';
          20 : Mensagem:='Não existem campos que requerem atualização';
          21 : Mensagem:='Detectado proximidade do final da bobina de papel';
          22 : Mensagem:='Cupom de Redução Z já foi emitido. IF inoperante até 0:00h do próximo dia';
          23 : Mensagem:='Redução Z do período anterior ainda pendente. IF inoperante';
          24 : Mensagem:='Valor de desconto ou acréscimo inválido (limitado a 100%)';
          25 : Mensagem:='Caráctere inválido foi encontrado nos Parâmetros do Métodos';
          26 : Mensagem:='Médoto não pode ser executado';
          27 : Mensagem:='Impressora fora de Linha/Nenhum periférico conectado a interface auxiliar';
          28 : Mensagem:='Foi encontrado um campo em zero';
          29 : Mensagem:='Documento anterior não foi Cupom Fiscal. Não pode emitir Cupom Adicional';
          30 : Mensagem:='Acumulador Não Fiscal selecionado não é válido ou não está disponível';
          31 : Mensagem:='Não pode autenticar. Excedeu 4 repetições ou não é permitida nesta fase';
          32 : Mensagem:='Cupom adicional inibido por configuração';
          35 : Mensagem:='Relógio Interno Inoperante';
          36 : Mensagem:='Versão do firmware gravada na Memória Fiscal não é a esperada';
          37 : Mensagem:='Alíquota de imposto informada já está carregada na memória';
          38 : Mensagem:='Forma de pagamento selecionada não é válida';
          39 : Mensagem:='Erro na seqüência de fechamento do Cupom Fiscal';
          40 : Mensagem:='IF em Jornada Fiscal. Alteração da configuração não é permitida';
          41 : Mensagem:='Data inválida. Data fornecida é inferior à última gravada na Memória Fiscal';
          42 : Mensagem:='Leitura X inicial ainda não foi emitida';
          43 : Mensagem:='Não pode emitir Comprovante Vinculado';
          44 : Mensagem:='Cupom de Orçamento não permitido para este estabelecimento(Mensagem do Aplicativo Não Programada)';
          45 : Mensagem:='Campo obrigatório em branco';
          48 : Mensagem:='Não pode estornar';
          49 : Mensagem:='Forma de pagamento indicada não encontrada';
          50 : Mensagem:='Fim da bobina de papel';
          51 : Mensagem:='Nenhum usuário cadastrado na MF';
          52 : Mensagem:='MF não instalada ou não inicializada';
          56 : Mensagem:='Documento já aberto';
          61 : Mensagem:='Queda de energia durante a emissão de Cupom Fiscal';
          75 : Mensagem:='Operação com ISS não permitida (se a sua impressora for uma FS600 ou FS2100T, então será preciso ter '+
                         ' uma inscrição municipal gravada em sua impressora para que seja possível programar/utilizar alíquota de serviço).';
          76 : Mensagem:='Desconto em ISS não permitido neste ECF (a programação deverá ser feita por meio de intervenção técnica e caso o Estado permita)';
          77 : Mensagem:='Acréscimo em IOF inibido';
          80 : Mensagem:='Periférico na interface auxiliar não pode ser reconhecido';
          81 : Mensagem:='Solicitado preenchimento de cheque de banco desconhecido';
          82 : Mensagem:='Solicitado transmissão de mensagem nula pela interface auxiliar';
          83 : Mensagem:='Extenso do cheque não cabe no espaço disponível';
          84 : Mensagem:='Erro na comunicação com a interface auxiliar';
          85 : Mensagem:='Erro no dígito verificador durante comunicação com a PertoCheck';
          86 : Mensagem:='Falha na carga de geometria de folha de cheque';
          87 : Mensagem:='Parâmetros do Método: invállido para o campo de data do cheque';
          90 : Mensagem:='Sequência de validação de número de série inválida';
          180 : Mensagem:='Mensagem do aplicativo não programada. (Esta mensagem não é opcional e sim uma exigência da legislação e deverá ser programada para '+
                          'que o ECF seja liberado para a emissão de documentos fiscais. Para programar a mensagem use os métodos:Daruma_Registry_AplMensagem1(Índice 36) e método:Daruma_Registry_AplMensagem2(Índice 37).';
          181 : Mensagem:='Não é possivel realizar Redução Z entre 00:00am e 02:00am (Meia Noite e Duas da Manhã) nesta versão de firmware da FS600 (está limitação existe nas versões 1.1 pra baixo.';
          182 : Mensagem:='Tampa aberta.';
          end;
    if AllTrim(Mensagem)<>''
    then begin
         InformaError( Mensagem );
         ECF_Respondendo:=1;
         end;
end;

function RetornaDataMovtoECF(Data:string):string;
var
 Dia,Mes,Ano:string;
begin
 Dia := Copy(Data,0,2);
 Mes := Copy(Data,4,2);
 Ano := Copy(Data,7,8);
 Result := Dia+Mes+Ano;
end;

function NomedoArquivo_MovtoECF(CNIEE,numeroserie:string;DataMovto:TDate):String;
var
 sNomeArq,
 sTipo,
 svalor    : string;
begin
 while Length(numeroserie) < 20 do numeroserie := '0'+numeroserie;
 // 14 ultimos digitos!!
 numeroserie := Copy(numeroserie,7,length(numeroserie)-1);
 sNomeArq := CNIEE+numeroserie;
 //
 while Length(sNomeArq) < 20 do sNomeArq := sNomeArq+'0';
 //
 sTipo    := RetornaDataMovtoECF(DateToStr(DataMovto));
 sNomeArq := sNomeArq+sTipo+'.txt';
 Result   := sNomeArq;
end;

procedure VerificaUltimaReducaoSalvaemBD;
begin
     if FrmPrincipal.Verifica_ReducaoZ_Pendente='S'
     then begin
          FrmPrincipal.TVerifUltimaReducao.Enabled:=False;
          Verifica_E_Grava_Dados_UltimaReducaoZ(1);
          end;
end;

end.

