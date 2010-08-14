{*******************************************************************************
  Autor......: EasyTEF Team - 15/05/2008

  Objetivo...: Implementação de componente de integração com os Gerenciadores
               das Redes da solução TEF Discado de acordo com seus respectivos
               manuais.

  Comentários: Algumas datas de criação dos métodos estão com a data original
               de quando foram comentadas. Como outros métodos não foram
               comentados originalmente, eles estão com datas mais recentes,
               mas não porque foram recém feitos, mas recém comentados.
*******************************************************************************}

unit EasyTEFDiscado;

interface

//{$DEFINE AVALIACAO}

{$I ..\common\DelphiVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Forms, Controls, IniFiles,
  {$IFDEF DELPHI_6_UP}
  Variants,
  {$ENDIF}
  Dialogs, Graphics, Registry, TiposTEFDiscado, ConstTEFDiscado, MsgFrmTEF,
  UtilsTEF, TypInfo;

type

  TMetodoConfNaoConf = procedure (nomeRede, numeroTransacaoNsu,
    finalizacao, documentoFiscalVinculado: string) of object;

  TEasyTEFDiscado = class(TComponent)
  private
    { Private declarations }
    arquivoRequisicaoGp: TextFile;
    comandoECF: string;
    Fgerenciador: TTipoGerenciador;
    FoperacaoTEFAtual: TTipoTef;
    FrequisicaoIniciada, FtransacaoAprovada: Boolean;

    FValorCampo000_000, FValorCampo001_000, FValorCampo002_000,
    FValorCampo003_000, FValorCampo004_000, FValorCampo005_000,
    FValorCampo006_000, FValorCampo007_000, FValorCampo008_000,
    FValorCampo009_000, FValorCampo010_000, FValorCampo011_000,
    FValorCampo012_000, FValorCampo013_000, FValorCampo014_000,
    FValorCampo015_000, FValorCampo016_000, FValorCampo017_000,
    FValorCampo018_000, FValorCampo022_000, FValorCampo023_000,
    FValorCampo024_000, FValorCampo025_000, FValorCampo026_000,
    FValorCampo027_000, FValorCampo028_000, FValorCampo030_000,
    FValorCampo031_000, FValorCampo032_000, FValorCampo033_000,
    FValorCampo034_000, FValorCampo035_000, FValorCampo036_000,
    FValorCampo037_000, FValorCampo038_000, FValorCampo039_000,
    FValorCampo040_000: string;

    FValorCampo019, FValorCampo020, FValorCampo021, FValorCampo029: Variant;
    Fidentificacao: Integer;
    FimprimirComprovante: Boolean;
    FOnAbrirComprovanteNaoFiscalVinculado: TOnAbrirComprovanteNaoFiscalVinculado;
    FOnEncerrarCupomFiscal, FOnFecharComprovanteNaoFiscalVinculado: TNotifyEvent;
    FOnFecharRelatorioGerencial: TOnOperacaoECFOk;
    FOnImpressoraTemPapel: TOnOperacaoECFOk;
    FOnImprimirRelatorioGerencial: TOnImprimirCupomECF;

    FOnIniciarFechamentoCupomFiscal: TOnTratamentoECFOk;
    FOnEfetuarFormaPagamento: TOnTratamentoECFOk;
    FOnEfetuarFormaPagamentoDescricaoForma: TOnTratamentoECFOk;

    FOnTerminarFechamentoCupom: TOnTratamentoECFOk;
    FOnUsarComprovanteNaoFiscalVinculado: TOnImprimirCupomECF;
    FOnSubTotalizarCupom: TOnTratamentoECFOk;
    FOnValorPersonalizadoReq: TOnValorPersonalizadoReq;

    countCartoes: Integer;
    janelaParaSetarFoco: string;
    imprimiuRelatorioGerencial: Boolean;
    indicePagamento: Integer;
    lendoConfirmacaoBackup: Boolean;
    listaComprovantesTEF: TList;
    listaValoresCartao: TStringList;
    listaTipoComprovante: array of array of Boolean;
    requisicaoEmMemoria: TStringList;
    FautoVerificarTEF: Boolean;
    FnumeroDeCartoes: Integer;
    FOnTerminarCancelamentoMultiplosCartoes: TNotifyEvent;
    FtimeOutGerenciador: Integer;
    FformMsgOperador: TFormMsgOperadorConfig;
    FOnGerarIdentificador: TOnGerarIdentificador;
    FOnGuilhotinar2aViaCupomTEF: TNotifyEvent;
    FautoAtivarGerenciador: Boolean;
    FOnImprimirLeituraX: TOnOperacaoECFOk;

    function  getValorCampo003_000: Double;
    function  getValorCampo008_000: TDate;
    function  getValorCampo018_000: Integer;
    function  getValorCampo022_000: TDate;
    function  getValorCampo023_000: TTime;
    function  getValorCampo024_000: TDate;
    function  getValorCampo028_000: Integer;
    procedure Setgerenciador(const Value: TTipoGerenciador);
    procedure SetoperacaoTEFAtual(const Value: TTipoTef);

    function  arquivoResposta: string;
    function  arquivoRequisicao: string;
    function  arquivoStatus: string;
    function  arquivoBackup: string;
    function  arquivoBackupIrrelevante: Boolean;
    procedure cancelarTransacao;
    procedure delay(MSecs: Cardinal);
    procedure escreverRequisicaoBackup;
    procedure excluirArquivoBackup;
    procedure excluirArquivoRequisicao;
    procedure excluirArquivoResposta;
    procedure excluirArquivoStatus;
    procedure excluirRespostas;
    function  executarGerenciador(gerenciador: string): Boolean; overload;
    procedure fecharECF(header: string = '');
    procedure finalizarRequisicao;
    procedure focarFormPrincipal;
    procedure iniciarVariaveis;
    function  lerConfirmacaoArquivoRespostaGp: Boolean;
    function  lerConfirmacaoBackup: Boolean;
    function  maisDeUmCartao: Boolean;
    {$IFDEF AVALIACAO}procedure mostrarMensagemAvaliacao;{$ENDIF}
    procedure mostrarMensagemOperador; overload;
    procedure mostrarMensagemOperador(msg: string); overload;

    procedure msgNaoConfirmacaoVendaImpressaoCupom(rede: string = '';
      nsu: string = ''; valor: string = '');

    function  getMultiplosCartoes: Boolean;
    function  pegarFormaDePagamento: string;
    function  podeComecarRequisicao: Boolean;
    procedure reiniciarContagemDeCartoes;
    procedure tratarInicioRequisicao;
    procedure tratarTransacaoComMultiplosCartoes(primeiroCartao,
      ultimoCartao: Boolean);
    procedure tratarVerificacoesIniciais;
    procedure verificarOwnerForm;
    procedure SetimprimirComprovante(const Value: Boolean);

    procedure SetOnAbrirComprovanteNaoFiscalVinculado(
      const Value: TOnAbrirComprovanteNaoFiscalVinculado);

    procedure SetOnEfetuarFormaPagamento(const Value: TOnTratamentoECFOk);

    procedure SetOnEfetuarFormaPagamentoDescricaoForma(
      const Value: TOnTratamentoECFOk);

    procedure SetOnImprimirRelatorioGerencial(const Value: TOnImprimirCupomECF);

    procedure SetOnIniciarFechamentoCupomFiscal(const Value: TOnTratamentoECFOk);

    procedure SetOnTerminarFechamentoCupom(const Value: TOnTratamentoECFOk);

    procedure SetOnImpressoraTemPapel(const Value: TOnOperacaoECFOk);

    procedure SetOnUsarComprovanteNaoFiscalVinculado(
      const Value: TOnImprimirCupomECF);

    procedure SetOnSubTotalizarCupom(const Value: TOnTratamentoECFOk);

    procedure SetOnEncerrarCupomFiscal(const Value: TNotifyEvent);

    procedure SetOnFecharComprovanteNaoFiscalVinculado(
      const Value: TNotifyEvent);

    procedure SetOnFecharRelatorioGerencial(
      const Value: TOnOperacaoECFOk);
      
    procedure SetOnValorPersonalizadoReq(
      const Value: TOnValorPersonalizadoReq);
    function getUsouCartaoCredito: Boolean;
    function getUsouCartaoDebito: Boolean;
    procedure SetautoVerificarTEF(const Value: Boolean);
    function  getTransacaoNegada: Boolean;
    procedure SetnumeroDeCartoes(const Value: Integer);
    procedure SetOnTerminarCancelamentoMultiplosCartoes(
      const Value: TNotifyEvent);
    procedure SettimeOutGerenciador(const Value: Integer);
    procedure SeTFormMsgOperadorConfig(const Value: TFormMsgOperadorConfig);
    procedure SetOnGerarIdentificador(const Value: TOnGerarIdentificador);
    procedure SetOnGuilhotinar2aViaCupomTEF(const Value: TNotifyEvent);
    procedure SetautoAtivarGerenciador(const Value: Boolean);
    procedure SetOnImprimirLeituraX(const Value: TOnOperacaoECFOk);

  protected
    { Protected declarations }
    procedure aguardarRetornoStatusGp(metodo: TMetodoConfNaoConf = nil);
    function  conferirIdentificacao(id: string): Boolean;
    function  dataGp(data: TDate): string;
    function  diretorioRequisicao: string;
    function  diretorioResposta: string;
    procedure escreverConfirmacaoBackup;
    procedure escreverValores(campo, valor: string);
    procedure executarGerenciador; overload;
    function  fecharRelatorioGerencial: Boolean;
    function  gerenciadorPadrao: Boolean;
    function  horaGp(hora: TTime): string;
    function  hiperCard: Boolean;

    procedure imprimirCupomECF(imagemCupomTEF: TStrings;
      var impressaoTEFOk: Boolean; primeiroCartao,
      ultimoCartao: Boolean); overload;

    procedure imprimirEmBloco(imagemCupomTEF: TStrings;
      var impressaoTEFOk: Boolean; relatorioGerencial: Boolean = False); virtual;

    procedure imprimirRelatorioGerencial(imagemCupomTEF: TStrings;
      var impressaoTEFOk: Boolean); overload;

    function  imprimirRelatorioGerencial(
      imagemCupomTEF: TStrings): Boolean; overload;

    function  impressoraTemPapel: Boolean;
    procedure iniciarRequisicao(tipoTransacao: TTipoTef);
    procedure iniciarTefDiscado;
    procedure inserirDadosIniciaisRequisicao(tipo: TTipoTef);
    function  lerArquivoRespostaGp: Boolean;
    procedure Loaded; override;
    function  ownerEhForm: Boolean;
    procedure pegarValorCampo(var v: string; linha: string);
    procedure processarRespostaGp(primeiroCartao: Boolean = True;
      ultimoCartao: Boolean = True);
    function  programaGerenciador: string;
    function  programaPayGo: string;
    procedure reiniciarPropriedades;
    function  tecBanBanrisul: Boolean;
    procedure tratarFimRequisicao;
    procedure tratarRespostaGp(primeiroCartao: Boolean = True;
      ultimoCartao: Boolean = True);
    procedure tratarTransacaoNaoAprovada;
    function  verificarGerenciadorAtivo: Boolean;
    function  verificarGerenciadorInstalado: Boolean;
    function  verificarStatusGp: Boolean;
    procedure verificarEmTempoDeDesign;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property  operacaoTEFAtual: TTipoTef read FoperacaoTEFAtual write SetoperacaoTEFAtual default ttNone;

    property  valorCampo000_000: string read FValorCampo000_000;
    property  valorCampo001_000: string read FValorCampo001_000;
    property  valorCampo002_000: string read FValorCampo002_000;
    property  valorCampo003_000: Double read getValorCampo003_000;
    property  valorCampo004_000: string read FValorCampo004_000;
    property  valorCampo005_000: string read FValorCampo005_000;
    property  valorCampo006_000: string read FValorCampo006_000;
    property  valorCampo007_000: string read FValorCampo007_000;
    property  valorCampo008_000: TDate read getValorCampo008_000;
    property  valorCampo009_000: string read FValorCampo009_000;
    property  valorCampo010_000: string read FValorCampo010_000;
    property  valorCampo011_000: string read FValorCampo011_000;
    property  valorCampo012_000: string read FValorCampo012_000;
    property  valorCampo013_000: string read FValorCampo013_000;
    property  valorCampo014_000: string read FValorCampo014_000;
    property  valorCampo015_000: string read FValorCampo015_000;
    property  valorCampo016_000: string read FValorCampo016_000;
    property  valorCampo017_000: string read FValorCampo017_000;
    property  valorCampo018_000: Integer read getValorCampo018_000;

    function  valorCampo019_000: Variant;
    function  valorCampo020_000: Variant;
    function  valorCampo021_000: Variant;

    property  valorCampo022_000: TDate read getValorCampo022_000;
    property  valorCampo023_000: TTime read getValorCampo023_000;
    property  valorCampo024_000: TDate read getValorCampo024_000;
    property  valorCampo025_000: string read FValorCampo025_000;
    property  valorCampo026_000: string read FValorCampo026_000;
    property  valorCampo027_000: string read FValorCampo027_000;
    property  valorCampo028_000: Integer read getValorCampo028_000;

    function  valorCampo029_000: Variant;

    property  valorCampo030_000: string read FValorCampo030_000;
    property  valorCampo031_000: string read FValorCampo031_000;
    property  valorCampo032_000: string read FValorCampo032_000;
    property  valorCampo033_000: string read FValorCampo033_000;
    property  valorCampo034_000: string read FValorCampo034_000;
    property  valorCampo035_000: string read FValorCampo035_000;
    property  valorCampo036_000: string read FValorCampo036_000;
    property  valorCampo037_000: string read FValorCampo037_000;
    property  valorCampo038_000: string read FValorCampo038_000;
    property  valorCampo039_000: string read FValorCampo039_000;
    property  valorCampo040_000: string read FValorCampo040_000;

    procedure cancelarVenda(valorTotal: Double; nomeRede,
      numeroTransacaoNsu: string; dataTransacao: TDate;
      horaTransacao: TTime; documentoFiscalVinculado: string = '';
      cmc7: string = ''; tipoPessoa: string = ''; documentoPessoa: string = '';
      dataCheque: TDateTime = 0; banco: string = ''; agencia: string = '';
      digitoControleAgencia: string = ''; contaCorrente: string = '';
      digitoControleContaCorrente: string = ''; numeroCheque: string = '';
      digitoControleNumeroCheque: string = ''); overload;

    procedure cancelarVenda; overload;

    procedure confirmacaoVendaImpressaoCupom(nomeRede,
      numeroTransacaoNsu, finalizacao: string;
      documentoFiscalVinculado: string = '');

    procedure consultarCheque(valorTotal: Double;
      documentoFiscalVinculado: string = ''; cmc7: string = '';
      tipoPessoa: string = ''; documentoPessoa: string = '';
      dataCheque: TDateTime = 0; banco: string = ''; agencia: string = '';
      digitoControleAgencia: string = ''; contaCorrente: string = '';
      digitoControleContaCorrente: string = ''; numeroCheque: string = '';
      digitoControleNumeroCheque: string = '');

    procedure fazerRequisicaoAdministrativa;
    function  gerenciadorInstalado: Boolean;
    function  gerenciadorAtivo: Boolean;
    function  imagemCupomTEF: TStringList;
    function  imprimirCupomECF(imagemCupomTEF: TStrings;
      primeiroCartao, ultimoCartao: Boolean): Boolean; overload;
    procedure imprimirCuponsECF;

    procedure naoConfirmacaoVendaImpressaoCupom(nomeRede,
      numeroTransacaoNsu, finalizacao: string;
      documentoFiscalVinculado: string = '');

    procedure pagarNoCartao(valorTotal: Double;
      moeda: Byte = 0; documentoFiscalVinculado: string = '';
      primeiroCartao: Boolean = True; ultimoCartao: Boolean = True);

    property  numeroDeCartoes: Integer read FnumeroDeCartoes write SetnumeroDeCartoes;

    procedure solicitarPagamentoContas(valorTotal: Double;
      cmc7: string = ''; tipoPessoa: string = ''; documentoPessoa: string = '';
      dataCheque: TDateTime = 0; banco: string = ''; agencia: string = '';
      digitoControleAgencia: string = ''; contaCorrente: string = '';
      digitoControleContaCorrente: string = ''; numeroCheque: string = '';
      digitoControleNumeroCheque: string = '';
      codigoBarrasLinhaDigitavel: string = '');

    property  transacaoAprovada: Boolean read FtransacaoAprovada;
    property  transacaoNegada: Boolean read getTransacaoNegada;
    procedure tratarConsultaCheque(imagemCupomTEF: TStrings;
      nomeRede, numeroTransacaoNsu, finalizacao, docFiscalVinculado: string);
    function  tratarCupomFiscal(metodo: TMetodoECF;
      params: array of string): string;
    function  tratarValorTotal(valor: Double): string;
    property  usouCartaoDebito: Boolean read getUsouCartaoDebito;
    property  usouCartaoCredito: Boolean read getUsouCartaoCredito;
    property  valoresCartoes: TStringList read listaValoresCartao;

  published
    { Published declarations }
    property autoVerificarTEF: Boolean read FautoVerificarTEF write SetautoVerificarTEF default True;
    property autoAtivarGerenciador: Boolean read FautoAtivarGerenciador write SetautoAtivarGerenciador default True;
    property formMsgOperador: TFormMsgOperadorConfig read FformMsgOperador write SeTFormMsgOperadorConfig;
    property gerenciador: TTipoGerenciador read Fgerenciador write Setgerenciador default tgGerenciadorPadrao;
    property imprimirComprovante: Boolean read FimprimirComprovante write SetimprimirComprovante default False;
    property multiplosCartoes: Boolean read getMultiplosCartoes;
    property timeOutGerenciador: Integer read FtimeOutGerenciador write SettimeOutGerenciador default 7;

    property OnAbrirComprovanteNaoFiscalVinculado: TOnAbrirComprovanteNaoFiscalVinculado read FOnAbrirComprovanteNaoFiscalVinculado write SetOnAbrirComprovanteNaoFiscalVinculado;
    property OnEfetuarFormaPagamento: TOnTratamentoECFOk read FOnEfetuarFormaPagamento write SetOnEfetuarFormaPagamento;
    property OnEfetuarFormaPagamentoDescricaoForma: TOnTratamentoECFOk read FOnEfetuarFormaPagamentoDescricaoForma write SetOnEfetuarFormaPagamentoDescricaoForma; 
    property OnEncerrarCupomFiscal: TNotifyEvent read FOnEncerrarCupomFiscal write SetOnEncerrarCupomFiscal;
    property OnFecharComprovanteNaoFiscalVinculado: TNotifyEvent read FOnFecharComprovanteNaoFiscalVinculado write SetOnFecharComprovanteNaoFiscalVinculado;
    property OnFecharRelatorioGerencial: TOnOperacaoECFOk read FOnFecharRelatorioGerencial write SetOnFecharRelatorioGerencial;
    property OnGerarIdentificador: TOnGerarIdentificador read FOnGerarIdentificador write SetOnGerarIdentificador;
    property OnGuilhotinar2aViaCupomTEF: TNotifyEvent read FOnGuilhotinar2aViaCupomTEF write SetOnGuilhotinar2aViaCupomTEF;
    property OnImpressoraTemPapel: TOnOperacaoECFOk read FOnImpressoraTemPapel write SetOnImpressoraTemPapel;
    property OnImprimirLeituraX: TOnOperacaoECFOk read FOnImprimirLeituraX write SetOnImprimirLeituraX;
    property OnImprimirRelatorioGerencial: TOnImprimirCupomECF read FOnImprimirRelatorioGerencial write SetOnImprimirRelatorioGerencial;
    property OnIniciarFechamentoCupomFiscal: TOnTratamentoECFOk read FOnIniciarFechamentoCupomFiscal write SetOnIniciarFechamentoCupomFiscal;
    property OnTerminarFechamentoCupom: TOnTratamentoECFOk read FOnTerminarFechamentoCupom write SetOnTerminarFechamentoCupom;
    property OnTerminarCancelamentoMultiplosCartoes: TNotifyEvent read FOnTerminarCancelamentoMultiplosCartoes write SetOnTerminarCancelamentoMultiplosCartoes;
    property OnUsarComprovanteNaoFiscalVinculado: TOnImprimirCupomECF read FOnUsarComprovanteNaoFiscalVinculado write SetOnUsarComprovanteNaoFiscalVinculado;
    property OnSubTotalizarCupom: TOnTratamentoECFOk read FOnSubTotalizarCupom write SetOnSubTotalizarCupom;
    property OnValorPersonalizadoReq: TOnValorPersonalizadoReq read FOnValorPersonalizadoReq write SetOnValorPersonalizadoReq;
  end;

implementation

{ TEasyTEFDiscado }

{*******************************************************************************
  Autor......: EasyTEF Team - 20/05/2008
  Objetivo...: Aguardar pela resposta do GP e, caso ele não responda, iniciar
               automaticamente o GP.
  Comentários:
  Alterações.:
*******************************************************************************}
procedure TEasyTEFDiscado.aguardarRetornoStatusGp(
  metodo: TMetodoConfNaoConf);
begin
  if not verificarStatusGp then begin
    executarGerenciador;
    if Assigned(metodo) then
      metodo(valorCampo010_000, valorCampo012_000,
        valorCampo027_000, valorCampo002_000);
  end;//if
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 20/05/2008
  Objetivo...: Método que retorno o path e o nome do arquivo de backup da
               resposta devolvida pelo GP.
  Comentários:
  Alterações.:
*******************************************************************************}
function TEasyTEFDiscado.arquivoBackup: string;
begin
  Result := ExtractFileDir(Application.ExeName);
  Result := Result + '\EasyTEFDiscado.ini';
end;

function TEasyTEFDiscado.arquivoRequisicao: string;
begin
  Result := diretorioRequisicao + NOME_ARQUIVO_REQ;
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 20/05/2008
  Objetivo...: Método que retorno o path e o nome do arquivo de resposta
               devolvido pelo GP.
  Comentários:
  Alterações.:
*******************************************************************************}
function TEasyTEFDiscado.arquivoResposta: string;
begin
  Result := diretorioResposta + NOME_ARQUIVO_REQ;
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 20/05/2008
  Objetivo...: Método que retorno o path e o nome do arquivo de status do
               processamento de requisição devolvido pelo GP.
  Comentários:
  Alterações.:
*******************************************************************************}
function TEasyTEFDiscado.arquivoStatus: string;
begin
  Result := diretorioResposta + NOME_ARQUIVO_RESP;
end;

procedure TEasyTEFDiscado.cancelarVenda(valorTotal: Double;
  nomeRede, numeroTransacaoNsu: string; dataTransacao: TDate;
  horaTransacao: TTime; documentoFiscalVinculado, cmc7, tipoPessoa,
  documentoPessoa: string; dataCheque: TDateTime; banco,
  agencia, digitoControleAgencia, contaCorrente,
  digitoControleContaCorrente, numeroCheque,
  digitoControleNumeroCheque: string);
begin
  if podeComecarRequisicao then begin
    tratarInicioRequisicao;
    try
      if verificarGerenciadorAtivo then begin
        inserirDadosIniciaisRequisicao(ttCancelamento);
        try
          escreverValores(CAMPO_VALOR_TOTAL, tratarValorTotal(valorTotal));
          if not (documentoFiscalVinculado = '') then
            escreverValores(CAMPO_DOCUMENTO_FISCAL, documentoFiscalVinculado);
          if not (cmc7 = '') then
            escreverValores(CAMPO_CMC7, cmc7);
          if not (tipoPessoa = '') then
            escreverValores(CAMPO_TIPO_PESSOA, tipoPessoa);
          if not (documentoPessoa = '') then
            escreverValores(CAMPO_DOCUMENTO_PESSOA, documentoPessoa);
          if not (dataCheque = 0) then
            escreverValores(CAMPO_DATA_CHEQUE, dataGp(dataCheque));
          escreverValores(CAMPO_NOME_REDE, nomeRede);
          escreverValores(CAMPO_NUMERO_TRANSACAO_NSU, numeroTransacaoNsu);
          escreverValores(CAMPO_DATA_TRANSACAO_COMPROVANTE, dataGp(dataTransacao));
          escreverValores(CAMPO_HORA_TRANSACAO_COMPROVANTE, horaGp(horaTransacao));
          if not (banco = '') then
            escreverValores(CAMPO_BANCO, banco);
          if not (agencia = '') then
            escreverValores(CAMPO_AGENCIA, agencia);
          if not (digitoControleAgencia = '') then
            escreverValores(CAMPO_AGENCIA_DC, digitoControleAgencia);
          if not (contaCorrente = '') then
            escreverValores(CAMPO_CONTA_CORRENTE, contaCorrente);
          if not (digitoControleContaCorrente = '') then
            escreverValores(CAMPO_CONTA_CORRENTE_DC, digitoControleContaCorrente);
          if not (numeroCheque = '') then
            escreverValores(CAMPO_NUMERO_CHEQUE, numeroCheque);
          if not (digitoControleNumeroCheque = '') then
            escreverValores(CAMPO_NUMERO_CHEQUE_DC, digitoControleNumeroCheque);

        finally
          finalizarRequisicao;
        end;//try..finally
        processarRespostaGp;
      end;//if
    finally
      tratarFimRequisicao;
    end;//try..finally
  end;//if
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 20/05/2008
  Objetivo...: Método utilizado para conferir a identificação passada para o
               componente com a identificação retornada pelo GP e utilizado
               para tomada de decisão caso as duas identificações estejam
               diferentes.
  Comentários:
  Alterações.:
*******************************************************************************}
function TEasyTEFDiscado.conferirIdentificacao(id: string): Boolean;
begin
  if isNumeric(id) and isNumeric(valorCampo001_000) then
    Result := StrToInt(id) = StrToInt(valorCampo001_000)
  else
    Result := id = valorCampo001_000;
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 09/01/2008
  Objetivo...: Notificar à rede de cartão de que a venda foi realizada e
               processada e o cupom da mesma foi impresso.
  Comentários:
  Alterações.:
*******************************************************************************}
procedure TEasyTEFDiscado.confirmacaoVendaImpressaoCupom(
  nomeRede, numeroTransacaoNsu, finalizacao,
  documentoFiscalVinculado: string);
var
  naoEstavaAtivo: Boolean;
begin
  naoEstavaAtivo := False;
  while not verificarGerenciadorAtivo do begin
    cancelarTransacao;
    delay(TIME_OUT_TEF);
    naoEstavaAtivo := True;
  end;//while

  if naoEstavaAtivo then
    delay(TIME_OUT_TEF);
    
  inserirDadosIniciaisRequisicao(ttConfirmacao);
  try
    if not (documentoFiscalVinculado = '') then
      escreverValores(CAMPO_DOCUMENTO_FISCAL, documentoFiscalVinculado);
    escreverValores(CAMPO_NOME_REDE, nomeRede);
    escreverValores(CAMPO_NUMERO_TRANSACAO_NSU, numeroTransacaoNsu);
    escreverValores(CAMPO_FINALIZACAO, finalizacao);
  finally
    finalizarRequisicao;
    if not maisDeUmCartao then
      excluirArquivoBackup;
  end;//try..finally
  aguardarRetornoStatusGp(confirmacaoVendaImpressaoCupom);
  if transacaoAprovada then begin
    excluirArquivoResposta;
  end;//if
end;

procedure TEasyTEFDiscado.consultarCheque(valorTotal: Double;
  documentoFiscalVinculado, cmc7, tipoPessoa, documentoPessoa: string;
  dataCheque: TDateTime; banco, agencia, digitoControleAgencia, contaCorrente,
  digitoControleContaCorrente, numeroCheque,
  digitoControleNumeroCheque: string);
var
  campo, valor: string;
begin
  if podeComecarRequisicao then begin
    {$IFDEF AVALIACAO} mostrarMensagemAvaliacao; {$ENDIF}
    tratarInicioRequisicao;
    try
      if verificarGerenciadorAtivo then begin
        inserirDadosIniciaisRequisicao(ttCheque);
        try
          escreverValores(CAMPO_DOCUMENTO_FISCAL, documentoFiscalVinculado);
          escreverValores(CAMPO_VALOR_TOTAL, tratarValorTotal(valorTotal));

          // evento necessário para o dia da certificação, quando o
          // certificador irá testar se não é um aplicativo externo
          // que escreve os arquivos de requisição
          if Assigned(FOnValorPersonalizadoReq) then
            FOnValorPersonalizadoReq(campo, valor);

          escreverValores(campo, valor);
          escreverValores(CAMPO_CMC7, cmc7);
          escreverValores(CAMPO_TIPO_PESSOA, tipoPessoa);
          escreverValores(CAMPO_DOCUMENTO_PESSOA, documentoPessoa);
          escreverValores(CAMPO_DATA_CHEQUE, dataGp(dataCheque));
          escreverValores(CAMPO_BANCO, banco);
          escreverValores(CAMPO_AGENCIA, agencia);
          escreverValores(CAMPO_AGENCIA_DC, digitoControleAgencia);
          escreverValores(CAMPO_CONTA_CORRENTE, contaCorrente);
          escreverValores(CAMPO_CONTA_CORRENTE_DC, digitoControleContaCorrente);
          escreverValores(CAMPO_NUMERO_CHEQUE, numeroCheque);
          escreverValores(CAMPO_NUMERO_CHEQUE_DC, digitoControleNumeroCheque);

        finally
          finalizarRequisicao;
        end;//try..finally
        processarRespostaGp;
      end;//if
    finally
      tratarFimRequisicao;
    end;//try..finally
    if transacaoAprovada then begin
      excluirRespostas;
    end;//if
  end;//if
end;

constructor TEasyTEFDiscado.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  verificarOwnerForm;
  iniciarVariaveis;
  // se o componente estiver sendo lido com o aplicativo em tempo
  // de desenvolvimento
  if (csDesigning in ComponentState) then
    verificarEmTempoDeDesign;  
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 15/05/2008
  Objetivo...: Salvar os valores do arquivo de resposta do GP no arquivo de
               backup.
  Comentários:
  Alterações.:
*******************************************************************************}
function TEasyTEFDiscado.dataGp(data: TDate): string;
begin
  Result := FormatDateTime('ddmmyyyy', data);
end;

destructor TEasyTEFDiscado.Destroy;
begin
  if not (requisicaoEmMemoria = nil) then
    requisicaoEmMemoria.Free;
  listaComprovantesTEF.Free;
  listaValoresCartao.Free;
  FformMsgOperador.Free;
  if arquivoBackupIrrelevante then
    excluirArquivoBackup;
  inherited;
end;

procedure TEasyTEFDiscado.escreverConfirmacaoBackup;
var i: TIniFile;
begin
  i := TIniFile.Create(arquivoBackup);
  try
    i.WriteBool('REQUISICAO' + IntToStr(countCartoes), 'confirmado', True);
  finally
    i.Free;
  end;//try..finally
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 14/01/2008
  Objetivo...: Escrever os dados da última requisicao ao GP para no caso de
               haver uma interrupção na confirmação da transação, poder fazer
               uma não confirmação automática.
  Comentários:
  Alterações.:
*******************************************************************************}
procedure TEasyTEFDiscado.escreverRequisicaoBackup;
var
  i: TIniFile;
  secao: string;
begin
  i := TIniFile.Create(arquivoBackup);
  try
    if not lendoConfirmacaoBackup then begin
      secao := 'REQUISICAO' + IntToStr(countCartoes);
      i.WriteInteger('GERAL', 'numCartoes', countCartoes);
      i.WriteBool('GERAL', 'multiplosCartoes', maisDeUmCartao);
      i.WriteString(secao, 'gerenciador',
        GetEnumName(TypeInfo(TTipoGerenciador), Integer(gerenciador)));
      i.WriteString(secao, 'id', valorCampo001_000);
        i.WriteString(secao, 'rede', valorCampo010_000);
      i.WriteString(secao, 'nsu', valorCampo012_000);
      i.WriteString(secao, 'finalizacao', valorCampo027_000);
      i.WriteString(secao, 'valor', FormatFloat('R$ #,##0.00',
        valorCampo003_000));
      i.WriteString(secao, 'header', valorCampo000_000);
      i.WriteDate(secao, 'data', valorCampo022_000);
      i.WriteTime(secao, 'hora', valorCampo023_000);
      i.WriteBool(secao, 'confirmado', False);
    end;//if
  finally
    i.Free;
  end;//try..finally
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 20/05/2008
  Objetivo...: Escrever os valores dos campos no arquivo de requisição do GP.
  Comentários:
  Alterações.:
*******************************************************************************}
procedure TEasyTEFDiscado.escreverValores(campo, valor: string);
begin
  if not (valor = '') then
    Writeln(arquivoRequisicaoGp, campo, RECEBE, valor);
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 03/01/2008
  Objetivo...: Excluir o arquivo de backup de resposta do GP.
  Comentários:
  Alterações.:
*******************************************************************************}
procedure TEasyTEFDiscado.excluirArquivoBackup;
begin
  DeleteFile(arquivoBackup);
end;

procedure TEasyTEFDiscado.excluirArquivoRequisicao;
begin
  DeleteFile(arquivoRequisicao);
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 03/01/2008
  Objetivo...: Excluir o arquivo de resposta do Gerenciador Padrão.
  Comentários:
  Alterações.:
*******************************************************************************}
procedure TEasyTEFDiscado.excluirArquivoResposta;
begin
  DeleteFile(arquivoResposta);
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 03/01/2008
  Objetivo...: Excluir o arquivo de resposta de recebimento e processamento de
               requisição do GP.
  Comentários:
  Alterações.:
*******************************************************************************}
procedure TEasyTEFDiscado.excluirArquivoStatus;
begin
  DeleteFile(diretorioResposta + NOME_ARQUIVO_RESP);
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 20/05/2008
  Objetivo...: Excluir o arquivo de resposta do GP e o arquivo de Backup.
  Comentários:
  Alterações.:
*******************************************************************************}
procedure TEasyTEFDiscado.excluirRespostas;
begin
  excluirArquivoStatus;
  excluirArquivoResposta;
  // aqui é maisDeUmCartao porque não deve excluir o arquivo de backup
  // durante o loop de leitura no método lerConfirmacaoBackup
  if not maisDeUmCartao then
    excluirArquivoBackup;
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 20/05/2008
  Objetivo...: Abrir o programa Gerenciador Padrão.
  Comentários:
  Alterações.:
*******************************************************************************}
procedure TEasyTEFDiscado.executarGerenciador;
const
  PROGRAMA_EXECUTADO_COM_SUCESSO = 31;
var
  programa: Boolean;
  ativou: Boolean;
begin
  if verificarGerenciadorInstalado then begin
    // se for para iniciar o gerenciador automaticamente
    if autoAtivarGerenciador then begin
      if gerenciadorPadrao then
        mostrarMensagemOperador(MSG_ERRO_GP_INATIVO)
      else if hiperCard then
        mostrarMensagemOperador('HiperTEF não ativo e será ativado automaticamente.')
      else if tecBanBanrisul then
        mostrarMensagemOperador('Gerenciador TecBan / Banrisul não ativo e será ativado automaticamente.')
      else
        mostrarMensagemOperador('Pay&Go não ativo e será ativado automaticamente.');

      if gerenciadorPadrao or hiperCard or tecBanBanrisul then
        programa := executarGerenciador(programaGerenciador)
      else
        programa := executarGerenciador(programaPayGo);

      if not programa then begin
        if gerenciadorPadrao then
          MessageDlg('Não foi possível executar o Gerenciador padrão.',
            mtInformation, [mbOK], 0)
        else if hiperCard then
          MessageDlg('Não foi possível executar o HiperTEF.',
            mtInformation, [mbOK], 0)
        else if tecBanBanrisul then
          MessageDlg('Não foi possível executar o Gerenciador TecBan / Banrisul.',
            mtInformation, [mbOK], 0)
        else
          MessageBox(0, 'Não foi possível executar o Pay&Go.',
            'Pay&Go não encontrado', MB_ICONINFORMATION or MB_OK);

      end else begin
        if not (operacaoTefAtual = ttGpAtivo) then
          if not (requisicaoEmMemoria = nil) then
            if not (requisicaoEmMemoria.GetText = '') then
              requisicaoEmMemoria.SaveToFile(arquivoRequisicao);
      end;
    end else begin
      ativou := False;
      while not ativou do begin
        if gerenciadorPadrao then
          MessageDlg('Gerenciador Padrão não ativo. Favor ativá-lo.', mtWarning, [mbOK], 0)
        else if hiperCard then
          MessageDlg('HiperTEF não ativo. Favor ativá-lo.', mtWarning, [mbOK], 0)
        else if tecBanBanrisul then
          MessageDlg('Gerenciador TecBan / Banrisul não ativo. Favor ativá-lo.', mtWarning, [mbOK], 0)
        else
          MessageDlg('Pay&Go não ativo. Favor ativá-lo.', mtWarning, [mbOK], 0);

        ativou := gerenciadorAtivo;
      end;//while
    end;//else
  end;//if
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 20/05/2008
  Objetivo...: Disparar os eventos de fechamento de relatório abertos na ECF
               de acordo com o tipo de operação TEF que está ocorrendo. 
  Comentários:
  Alterações.:
*******************************************************************************}
procedure TEasyTEFDiscado.fazerRequisicaoAdministrativa;
begin
  if podeComecarRequisicao then begin
    {$IFDEF AVALIACAO} mostrarMensagemAvaliacao; {$ENDIF}
    tratarInicioRequisicao;
    try
      if verificarGerenciadorAtivo then begin
        delay(3000);
        inserirDadosIniciaisRequisicao(ttAdministrativa);
        finalizarRequisicao;
        processarRespostaGp;
      end else
        cancelarTransacao;
    finally
      tratarFimRequisicao;
    end;//try..finally
    tratarTransacaoNaoAprovada;
  end;
end;

procedure TEasyTEFDiscado.fecharECF(header: string);
begin
  if (valorCampo000_000 = VALOR_HEADER_ADMINISTRATIVA) or
     (header = VALOR_HEADER_ADMINISTRATIVA) then
    fecharRelatorioGerencial
  else begin
    if Assigned(FOnEncerrarCupomFiscal) then
      FOnEncerrarCupomFiscal(Self);
  end;//else
  reiniciarContagemDeCartoes;
end;

function TEasyTEFDiscado.fecharRelatorioGerencial: Boolean;
begin
  Result := False;
  if Assigned(FOnFecharRelatorioGerencial) then
    FOnFecharRelatorioGerencial(Result);
  comandoECF := 'tmeFecharRelatorioGerencial';
end;

procedure TEasyTEFDiscado.finalizarRequisicao;
begin
  escreverValores(CAMPO_FIM_ARQUIVO, IntToStr(VALOR_FIM_ARQUIVO));
  CloseFile(arquivoRequisicaoGp);
  if requisicaoEmMemoria = nil then
    requisicaoEmMemoria := TStringList.Create;
  requisicaoEmMemoria.LoadFromFile(arquivoRequisicao);
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 20/05/2008
  Objetivo...: Trazer o foco para o form principal da aplicação e depois focar
               a janela de fechamento do cupom fiscal, que é a tela que deve
               possuir o componente TEasyTEFDiscado. 
  Comentários:
  Alterações.:
*******************************************************************************}
procedure TEasyTEFDiscado.focarFormPrincipal;
var
  handle: THandle;
begin
  Application.BringToFront;

  // minimiza a janela do redecard caso ela esteja aberta ainda
  handle := FindWindow(nil, Pchar('Redecard'));
  if not (handle = 0) then
    ShowWindow(handle, SW_HIDE);

  if not (janelaParaSetarFoco = '') then begin
    handle := FindWindow(nil, Pchar(janelaParaSetarFoco));
    if not (handle = 0) then begin
      ShowWindow(handle, SW_SHOWMAXIMIZED);
      SetForegroundWindow(handle);
    end;//if
  end;//if

  Application.Restore;
  Application.ProcessMessages;
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 20/05/2008
  Objetivo...: Verificar se o Gerenciador padrão está instalado no computador.
  Comentários:
  Alterações.:
*******************************************************************************}
function TEasyTEFDiscado.gerenciadorAtivo: Boolean;
begin
  Result := gerenciadorInstalado;
  if Result then begin
    iniciarRequisicao(ttGpAtivo);
    finalizarRequisicao;
    Result := verificarStatusGp;
  end;//if
end;

function TEasyTEFDiscado.gerenciadorInstalado: Boolean;
begin
  if gerenciadorPadrao or hiperCard or tecBanBanrisul then
    Result := FileExists(programaGerenciador)
  else
    Result := FileExists(programaPayGo);
end;

function TEasyTEFDiscado.getUsouCartaoCredito: Boolean;
begin
  Result := (valorCampo011_000 = CARTAO_CREDITO_A_VISTA) or
    (valorCampo011_000 = CARTAO_CREDITO_PARC_ADM) or
    (valorCampo011_000 = CARTAO_CREDITO_PARC_EST);
end;

function TEasyTEFDiscado.getUsouCartaoDebito: Boolean;
begin
  Result := (valorCampo011_000 = CARTAO_DEBITO_A_VISTA) or
    (valorCampo011_000 = CARTAO_DEBITO_A_VISTA_FORCADA) or
    (valorCampo011_000 = CARTAO_DEBITO_PARCELADO) or
    (valorCampo011_000 = CARTAO_DEBITO_PRE_DATADO) or
    (valorCampo011_000 = CARTAO_DEBITO_PRE_DATADO_FORCADA) or
    (valorCampo011_000 = CARTAO_DEBITO_PRE_DATADO_SEM_GARANTIA);
end;

function TEasyTEFDiscado.getValorCampo003_000: Double;
begin
  if not (FValorCampo003_000 = '') then
    Result := StrToInt(FValorCampo003_000) / 100
  else
    Result := 0;
end;

function TEasyTEFDiscado.getValorCampo008_000: TDate;
begin
  if not (FValorCampo008_000 = '') then
    Result := EncodeDate(StrToInt(Copy(FValorCampo008_000, 5, 4)),
      StrToInt(Copy(FValorCampo008_000, 3, 2)),
      StrToInt(Copy(FValorCampo008_000, 1, 2)))
  else
    Result := 0;
end;

function TEasyTEFDiscado.getValorCampo018_000: Integer;
begin
  if not (FValorCampo018_000 = '') then
    Result := StrToInt(FValorCampo018_000)
  else
    Result := -1;
end;

function TEasyTEFDiscado.getValorCampo022_000: TDate;
begin
  if not (FValorCampo022_000 = '') then
    Result := EncodeDate(StrToInt(Copy(FValorCampo022_000, 5, 4)),
      StrToInt(Copy(FValorCampo022_000, 3, 2)),
      StrToInt(Copy(FValorCampo022_000, 1, 2)))
  else
    Result := 0;
end;

function TEasyTEFDiscado.getValorCampo023_000: TTime;
begin
  if not (FValorCampo023_000 = '') then
    Result := EncodeTime(StrToInt(Copy(FValorCampo023_000, 1, 2)),
      StrToInt(Copy(FValorCampo023_000, 3, 2)),
      StrToInt(Copy(FValorCampo023_000, 5, 2)), 0)
  else
    Result := 0;
end;

function TEasyTEFDiscado.getValorCampo024_000: TDate;
begin
  if not (FValorCampo024_000 = '') then
    Result := EncodeDate(StrToInt(Copy(FValorCampo024_000, 5, 4)),
      StrToInt(Copy(FValorCampo024_000, 3, 2)),
      StrToInt(Copy(FValorCampo024_000, 1, 2)))
  else
    Result := 0;
end;

function TEasyTEFDiscado.getValorCampo028_000: Integer;
begin
  if not (FValorCampo028_000 = '') then
    Result := StrToInt(FValorCampo028_000)
  else
    Result := -1;
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 26/05/2008
  Objetivo...: Verificar se é o Gerenciador Padrão que está setado como o
               gerenciador do componente.
  Comentários:
  Alterações.:
*******************************************************************************}
function TEasyTEFDiscado.gerenciadorPadrao: Boolean;
begin
  Result := gerenciador = tgGerenciadorPadrao;
end;


{*******************************************************************************
  Autor......: EasyTEF Team - 20/05/2008
  Objetivo...: Devolver a imagem do cupom fiscal que está no arquivo de resposta
               do GP, logo após o processamento da operação TEF.
  Comentários:
  Alterações.:
*******************************************************************************}
function TEasyTEFDiscado.horaGp(hora: TTime): string;
begin
  Result := FormatDateTime('hhmmss', hora);
end;

function TEasyTEFDiscado.imagemCupomTEF: TStringList;
var i: Integer;
begin
  Result := TStringList.Create;
  if VarIsArray(valorCampo029_000) then begin
    for i := VarArrayLowBound(valorCampo029_000, 1) to
       VarArrayHighBound(valorCampo029_000, 1) do
      Result.Add(valorCampo029_000[i]);
    // inserção de linhas em branco que devem ser impressas
    // após a primeira impressão para dar espaço para a segunda via
    Result.Add(' '); Result.Add(' ');
    Result.Add(' '); Result.Add(' ');
    Result.Add(' '); Result.Add(' ');
  end;//if
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 20/05/2008
  Objetivo...: Fazer o gerenciamento de impressão do cupom fiscal e chamar os
               eventos que devem implementar as funções de impressão de cada
               ECF. 
  Comentários:
  Alterações.:
*******************************************************************************}
function TEasyTEFDiscado.imprimirCupomECF(imagemCupomTEF: TStrings;
  primeiroCartao, ultimoCartao: Boolean): Boolean;
var
  impressaoTEFOk: Boolean;
begin
  blockInput(True);
  try
    // o cupom TEF deve ser impresso em duas vias
    imprimirCupomECF(imagemCupomTEF, impressaoTEFOk, primeiroCartao,
      ultimoCartao);
  finally
    blockInput(False);
  end;//try..finally

  Result := impressaoTEFOk;

  // se a impressão não foi bem sucedida
  if not impressaoTEFOk then begin
    while not impressaoTEFOk do begin
      focarFormPrincipal;
      impressaoTEFOk := Application.MessageBox(MSG_IMP_NAO_RESP,
        'ECF não responde', MB_ICONQUESTION + MB_YESNO) = idNo;
      // se o usuário escolheu tentar novamente
      if not impressaoTEFOk then begin
        blockInput(True);
        // espera a impressora ligar e se preparar para poder fazer o
        // cancelamento do cupom anterior
        Sleep(TIME_OUT_TEF);
        try
          if Assigned(FOnImprimirLeituraX) then
            FOnImprimirLeituraX(impressaoTEFOk);

          // se a LeituraX foi impressa com sucesso
          if impressaoTEFOk then
            imprimirRelatorioGerencial(imagemCupomTEF, impressaoTEFOk);
        finally
          blockInput(False);
        end;//try..finally

        Result := impressaoTEFOk;
        
        // com múltiplos cartõs não é feita a confirmação porque a confirmação
        // já foi feita
        if impressaoTEFOk and not multiplosCartoes then
          confirmacaoVendaImpressaoCupom(valorCampo010_000,
            valorCampo012_000, valorCampo027_000, valorCampo002_000);
      // se o usuário escolheu não tentar novamente
      end else begin

        Result := False;

        if multiplosCartoes then
          lerConfirmacaoBackup
        else begin
          // se o usuário escolheu não tentar mais imprimir e se a transação
          // já havia sido aprovada pela rede administradora
          if impressaoTEFOk and (valorCampo009_000 = '0') then begin
            naoConfirmacaoVendaImpressaoCupom(valorCampo010_000,
              valorCampo012_000, valorCampo027_000,
              valorCampo002_000);

            msgNaoConfirmacaoVendaImpressaoCupom;
            FTransacaoAprovada := False;
            fecharECF;
          end;//if
        end;
      end;//else
    end;//while not impressaoTEFOk
  // se a impressão foi bem sucedida e se não for múltiplos cartões, pois com
  // com múltiplos cartões a confirmação já foi feita, faz a confirmação
  end else if not multiplosCartoes then
    confirmacaoVendaImpressaoCupom(valorCampo010_000,
      valorCampo012_000, valorCampo027_000, valorCampo002_000);

  escreverConfirmacaoBackup;
  comandoECF := '';
end;

procedure TEasyTEFDiscado.imprimirCupomECF(imagemCupomTEF: TStrings;
  var impressaoTEFOk: Boolean; primeiroCartao, ultimoCartao: Boolean);
var
  impressaoOk: Boolean;
  valorCupom: string;
  procedure setarImpressaoTEFOk;
  {$IFNDEF AVALIACAO}
  var
    temPapel: Boolean;
  {$ENDIF}
  begin
    {$IFNDEF AVALIACAO}
    temPapel := impressoraTemPapel;
    {$ENDIF};
    impressaoTEFOk := impressaoTEFOk and impressaoOk
      {$IFNDEF AVALIACAO} and temPapel {$ENDIF};
    {$IFNDEF AVALIACAO}
    if not temPapel then
      comandoECF := 'tmeImpressoraTemPapel';
    {$ENDIF}
  end;//procedure
begin
  impressaoTEFOk := True;
  // se for uma operação administrativa
  if (valorCampo000_000 = VALOR_HEADER_ADMINISTRATIVA) or
     (valorCampo000_000 = VALOR_HEADER_CANCELAMENTO) then
    imprimirRelatorioGerencial(imagemCupomTEF, impressaoTEFOk)
  else begin
    comandoECF := 'tmeAbrirComprovanteNaoFiscalVinculado';
    if Assigned(FOnAbrirComprovanteNaoFiscalVinculado) then begin
      if multiplosCartoes then
        valorCupom := listaValoresCartao[indicePagamento]
      else
        valorCupom := '0,00';
      FOnAbrirComprovanteNaoFiscalVinculado(impressaoOk, valorCupom);
    end;//if

    setarImpressaoTEFOk;

    if impressaoTEFOk then begin
      imprimirEmBloco(imagemCupomTEF, impressaoOk);
      setarImpressaoTEFOk;
      if impressaoTEFOk then begin
        if Assigned(FOnGuilhotinar2aViaCupomTEF) then
          FOnGuilhotinar2aViaCupomTEF(Self);
        // a aplicação deve aguardar um certo tempo para que a primeira via do
        // cupom TEF seja impressa e então imprimir a segunda via para que o
        // operador possa destacar a primeira via antes da impressão da segunda
        Sleep(TIME_OUT_TEF);
          
        imprimirEmBloco(imagemCupomTEF, impressaoOk);
        setarImpressaoTEFOk;
      end;//if
      if Assigned(FOnFecharComprovanteNaoFiscalVinculado) then
        FOnFecharComprovanteNaoFiscalVinculado(Self);
    end;
  end;//else
end;

procedure TEasyTEFDiscado.imprimirEmBloco(imagemCupomTEF: TStrings;
  var impressaoTEFOk: Boolean; relatorioGerencial: Boolean);
var
  lista1, lista2: TStringList;
  impressaoOk: Boolean;
  procedure carregarTresLinhas;
  begin
    lista2.Clear;
    if lista1.Count >= 1 then
      lista2.Add(lista1.Strings[0]);
    if lista1.Count >= 2 then
      lista2.Add(lista1.Strings[1]);
    if lista1.Count >= 3 then
      lista2.Add(lista1.Strings[2]);

    if lista1.Count >= 1 then
      lista1.Delete(0);
    if lista1.Count >= 1 then
      lista1.Delete(0);
    if lista1.Count >= 1 then
      lista1.Delete(0);
  end;//procedure
begin
  lista1 := TStringList.Create;
  lista2 := TStringList.Create;
  impressaoTEFOk := True;
  try
    lista1.Assign(imagemCupomTEF);
    while not (lista1.Count = 0) and impressaoTEFOk do begin
      carregarTresLinhas;

      if not relatorioGerencial then begin
        comandoECF := 'tmeUsarComprovanteNaoFiscalVinculado';
        if Assigned(FOnUsarComprovanteNaoFiscalVinculado) then
          FOnUsarComprovanteNaoFiscalVinculado(lista2, impressaoOk)
      end else begin
        comandoECF := 'tmeImprimirRelatorioGerencial';
        if Assigned(FOnImprimirRelatorioGerencial) then
          FOnImprimirRelatorioGerencial(lista2, impressaoOk);
      end;

      impressaoTEFOk := impressaoTEFOk and impressaoOk
        {$IFNDEF AVALIACAO} and impressoraTemPapel {$ENDIF};
    end;//while
  finally
    lista2.free;
    lista1.free;
  end;//try..finally
end;

procedure TEasyTEFDiscado.imprimirRelatorioGerencial(imagemCupomTEF: TStrings;
  var impressaoTEFOk: Boolean);
var
  impressaoOk: Boolean;
  i: Integer;
  procedure setarImpressaoTEFOk;
  {$IFNDEF AVALIACAO}
  var
    temPapel: Boolean;
  {$ENDIF}
  begin
    {$IFNDEF AVALIACAO}
    temPapel := impressoraTemPapel;
    {$ENDIF};
    impressaoTEFOk := impressaoTEFOk and impressaoOk
      {$IFNDEF AVALIACAO} and temPapel {$ENDIF};
    {$IFNDEF AVALIACAO}
    if not temPapel then
      comandoECF := 'tmeImpressoraTemPapel';
    {$ENDIF}
  end;//procedure
begin
  impressaoTEFOk := True;
  impressaoOk := True;
  imprimiuRelatorioGerencial := True;
  fecharRelatorioGerencial;

  if multiplosCartoes then begin
    for i := 0 to listaComprovantesTEF.Count - 1 do begin
      imagemCupomTEF := listaComprovantesTEF[i];
      imprimirEmBloco(imagemCupomTEF, impressaoOk, True);
      setarImpressaoTEFOk;

      if impressaoTEFOk then begin
        if Assigned(FOnGuilhotinar2aViaCupomTEF) then
          FOnGuilhotinar2aViaCupomTEF(Self);          
        Sleep(TIME_OUT_TEF);
        imprimirEmBloco(imagemCupomTEF, impressaoOk, True);
        setarImpressaoTEFOk;
      end else
        Break;
    end;//for
    if impressaoTEFOk then
      impressaoTEFOk := impressaoTEFOk and fecharRelatorioGerencial;
  end else begin
    imprimirEmBloco(imagemCupomTEF, impressaoOk, True);
    setarImpressaoTEFOk;

    if impressaoTEFOk then begin
      if Assigned(FOnGuilhotinar2aViaCupomTEF) then
        FOnGuilhotinar2aViaCupomTEF(Self);
      Sleep(TIME_OUT_TEF);
      imprimirEmBloco(imagemCupomTEF, impressaoOk, True);
      setarImpressaoTEFOk;
      if impressaoTEFOk then
        impressaoTEFOk := impressaoTEFOk and fecharRelatorioGerencial;
    end;//if
  end;//else
  if impressaoTEFOk then
    comandoECF := '';
end;

function TEasyTEFDiscado.impressoraTemPapel: Boolean;
begin
  Result := False;
  if Assigned(FOnImpressoraTemPapel) then
    FOnImpressoraTemPapel(Result);
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 20/05/2008
  Objetivo...: Escrever o arquivo de requisição de acordo com a especificação
               do manual do GP.
  Comentários:
  Alterações.:
*******************************************************************************}
procedure TEasyTEFDiscado.iniciarRequisicao(tipoTransacao: TTipoTef);
begin
  iniciarTefDiscado;

  case tipoTransacao of
    ttGpAtivo: escreverValores(CAMPO_HEADER, VALOR_HEADER_GP_ATIVO);

    ttAdministrativa: escreverValores(CAMPO_HEADER, VALOR_HEADER_ADMINISTRATIVA);

    ttCheque: escreverValores(CAMPO_HEADER, VALOR_HEADER_CHEQUE);

    ttCartao: escreverValores(CAMPO_HEADER, VALOR_HEADER_CARTAO);

    ttCancelamento: escreverValores(CAMPO_HEADER, VALOR_HEADER_CANCELAMENTO);

    ttConfirmacao: escreverValores(CAMPO_HEADER, VALOR_HEADER_CONFIRMACAO);

    ttNaoConfirmacao: escreverValores(CAMPO_HEADER, VALOR_HEADER_NAO_CONFIRMACAO);

    ttPagamentos: escreverValores(CAMPO_HEADER, VALOR_HEADER_PAGAMENTOS);

  end;//case

  FoperacaoTEFAtual := tipoTransacao;

  if Assigned(FOnGerarIdentificador) then begin
    FOnGerarIdentificador(Fidentificacao);
    escreverValores(CAMPO_IDENTIFICACAO, IntToStr(Fidentificacao));
  end else
    MessageDlg('O evento OnGerarIdentificacao não foi programado.'+#13+
      'Por este motivo, poderá ocorrer erros dependendo do gerenciador utilizado.'+#13+
      'Ademais, este evento é obrigatório para a homologação TEF.',
      mtWarning, [mbOK], 0);
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 03/01/2008
  Objetivo...: Criar o arquivo de Requisicao ao Gerenciador Padrão de acordo com
               o manual, que diz ser necessário primeiro criar um arquivo
               IntPos.tmp e depois renomea-lo para IntPos.001.
  Comentários:
  Alterações.:
*******************************************************************************}
procedure TEasyTEFDiscado.iniciarTefDiscado;
begin
  if FileExists(arquivoRequisicao) then
    excluirArquivoRequisicao;

  excluirArquivoStatus;

  AssignFile(arquivoRequisicaoGp, diretorioRequisicao + NOME_ARQUIVO_REQ_TMP);
  Rewrite(arquivoRequisicaoGp);
  CloseFile(arquivoRequisicaoGp);

  RenameFile(diretorioRequisicao + NOME_ARQUIVO_REQ_TMP, arquivoRequisicao);

  AssignFile(arquivoRequisicaoGp, arquivoRequisicao);
  Rewrite(arquivoRequisicaoGp);
end;

procedure TEasyTEFDiscado.iniciarVariaveis;
begin
  Fidentificacao := 0;
  FimprimirComprovante := False;
  FoperacaoTEFAtual := ttNone;
  FtransacaoAprovada := False;
  FrequisicaoIniciada := False;
  FautoVerificarTEF := True;
  reiniciarContagemDeCartoes;
  listaComprovantesTEF := TList.Create;
  listaValoresCartao := TStringList.Create;
  FnumeroDeCartoes := 0;
  FtimeOutGerenciador := 7;
  lendoConfirmacaoBackup := False;
  FformMsgOperador := TFormMsgOperadorConfig.Create;
  comandoECF := '';
  imprimiuRelatorioGerencial := False;
  FautoAtivarGerenciador := True;
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 04/01/2008
  Objetivo...: Ler o arquivo de resposta do GP e armazenar os resultados em suas
               devidas propriedades.
  Comentários:
  Alterações.:
*******************************************************************************}
procedure TEasyTEFDiscado.inserirDadosIniciaisRequisicao(tipo: TTipoTef);
begin
  iniciarRequisicao(tipo);
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 04/01/2008
  Objetivo...: Ler o arquivo de resposta do GP e armazenar os resultados em suas
               devidas propriedades.
  Comentários: 
  Alterações.:
*******************************************************************************}
function TEasyTEFDiscado.lerArquivoRespostaGp: Boolean;
var
  f: TextFile;
  linha: string;
  campoArray: Boolean;
  line, oldLine: string;
  count, i, i1, i2, i3: Integer;

  function existeCampo(campo: string): Boolean;
  begin
    Result := Pos(campo, linha) > 0;
  end;//function

  function pegarValorCampoArray(tipo: Word): Variant;
  var v: string;
  begin
    Result := null;
    pegarValorCampo(v, linha);
    if not (v = '') then begin
      if tipo = varDate then
        Result := EncodeDate(StrToInt(Copy(v, 5, 4)),
          StrToInt(Copy(v, 3, 2)), StrToInt(Copy(v, 1, 2)))
      else if tipo = varDouble then
        Result := StrToCurr(v) / 100
      else if tipo = varString then
        Result := StringReplace(v, '"', '', [rfReplaceAll]);
    end;//if
  end;//function

  function compararValores: Boolean;
  begin
    Result := (Copy(line, 1, 3) = Copy(oldLine, 1, 3));
  end;//function

  procedure tratarCampoArray;
  begin
    //data de vencimento da parcela
    campoArray := Copy(linha, 1, 4) = '019-';
    if campoArray then begin
      FValorCampo019[i1] := pegarValorCampoArray(varDate);
      i1 := i1 + 1;
    end else begin
      //valor da parcela
      campoArray := Copy(linha, 1, 4) = '020-';
      if campoArray then begin
        FValorCampo020[i2] := pegarValorCampoArray(varDouble);
        i2 := i2 + 1;
      end else begin
        //nsu da parcela
        campoArray := Copy(linha, 1, 4) = '021-';
        if campoArray then begin
          FValorCampo021[i3] := pegarValorCampoArray(varString);
          i3 := i3 + 1;
        end else begin
          //imagem de cada linha do comprovante
          campoArray := Copy(linha, 1, 4) = '029-';
          if campoArray then begin
            FValorCampo029[i] := pegarValorCampoArray(varString);
            i := i + 1;
          end;//if
        end;//if
      end;//if
    end;//if
  end;//procedure
begin
  reiniciarPropriedades;
  campoArray := False;
  line := '';
  oldLine := '';
  i := 0; i1 := 0; i2 := 0; i3 := 0;
  Result := FileExists(arquivoResposta);

  // segundo especificação do manual e ligação feita para a Software Express dia  
  // 08/01/2008, com Caio, a aplicação deve esperar pela resposta do GP no
  // processamento do pagamento ou consulta, o que faz sentido já que não
  // sabemos quando o operador irá terminar a transação junto a rede
  while not Result do begin
    Result := FileExists(arquivoResposta);
    // espera 1/2 segundo para não consumir muita CPU com este loop.
    Sleep(500);
    Application.ProcessMessages;
  end;//while

  AssignFile(f, arquivoResposta);
  Reset(f);

  while not Eof(f) do begin
    oldLine := line;
    ReadLn(f, linha);
    line := linha;

    tratarCampoArray;

    if not campoArray then begin
      if existeCampo(CAMPO_HEADER) then
        pegarValorCampo(FValorCampo000_000, linha)

      else if existeCampo(CAMPO_IDENTIFICACAO) then
        pegarValorCampo(FValorCampo001_000, linha)

      else if existeCampo(CAMPO_DOCUMENTO_FISCAL) then
        pegarValorCampo(FValorCampo002_000, linha)

      else if existeCampo(CAMPO_VALOR_TOTAL) then
        pegarValorCampo(FValorCampo003_000, linha)

      else if existeCampo(CAMPO_MOEDA) then
        pegarValorCampo(FValorCampo004_000, linha)

      else if existeCampo(CAMPO_CMC7) then
        pegarValorCampo(FValorCampo005_000, linha)

      else if existeCampo(CAMPO_TIPO_PESSOA) then
        pegarValorCampo(FValorCampo006_000, linha)

      else if existeCampo(CAMPO_DOCUMENTO_PESSOA) then
        pegarValorCampo(FValorCampo007_000, linha)

      else if existeCampo(CAMPO_DATA_CHEQUE) then
        pegarValorCampo(FValorCampo008_000, linha)

      else if existeCampo(CAMPO_STATUS_TRANSACAO) then begin
        pegarValorCampo(FValorCampo009_000, linha);
        FTransacaoAprovada := valorCampo009_000 = '0';
      end else if existeCampo(CAMPO_NOME_REDE) then
        pegarValorCampo(FValorCampo010_000, linha)

      else if existeCampo(CAMPO_TIPO_TRANSACAO) then
        pegarValorCampo(FValorCampo011_000, linha)

      else if existeCampo(CAMPO_NUMERO_TRANSACAO_NSU) then
        pegarValorCampo(FValorCampo012_000, linha)

      else if existeCampo(CAMPO_CODIGO_AUTORIZACAO_TRANSACAO) then
        pegarValorCampo(FValorCampo013_000, linha)

      else if existeCampo(CAMPO_NUMERO_LOTE_TRANSACAO) then
        pegarValorCampo(FValorCampo014_000, linha)

      else if existeCampo(CAMPO_TIMESTAMP_TRANSACAO_HOST) then
        pegarValorCampo(FValorCampo015_000, linha)

      else if existeCampo(CAMPO_TIMESTAMP_LOCAL) then
        pegarValorCampo(FValorCampo016_000, linha)

      else if existeCampo(CAMPO_TIPO_PARCELAMENTO) then
        pegarValorCampo(FValorCampo017_000, linha)

      else if existeCampo(CAMPO_QTD_PARCELAS) then begin
        pegarValorCampo(FValorCampo018_000, linha);
        if not (FValorCampo018_000 = '') then begin
          count := StrToInt(FValorCampo018_000);
          if count > 0 then begin
            FValorCampo019 := VarArrayCreate([0, count - 1], varVariant);
            FValorCampo020 := VarArrayCreate([0, count - 1], varVariant);
            FValorCampo021 := VarArrayCreate([0, count - 1], varVariant);
          end;//if
        end;//if
      end else if existeCampo(CAMPO_DATA_TRANSACAO_COMPROVANTE) then
        pegarValorCampo(FValorCampo022_000, linha)

      else if existeCampo(CAMPO_HORA_TRANSACAO_COMPROVANTE) then
        pegarValorCampo(FValorCampo023_000, linha)

      else if existeCampo(CAMPO_DATA_PREDATADO) then
        pegarValorCampo(FValorCampo024_000, linha)

      else if existeCampo(CAMPO_NUMERO_TRANSACAO_CANCELADA_NSU) then
        pegarValorCampo(FValorCampo025_000, linha)

      else if existeCampo(CAMPO_TIMESTAMP_TRANSACAO_CANCELADA) then
        pegarValorCampo(FValorCampo026_000, linha)

      else if existeCampo(CAMPO_FINALIZACAO) then
        pegarValorCampo(FValorCampo027_000, linha)

      else if existeCampo(CAMPO_QTD_LINHAS_COMPROVANTE) then begin
        pegarValorCampo(FValorCampo028_000, linha);
        if not (FValorCampo028_000 = '') then begin
          count := StrToInt(FValorCampo028_000);
          if count > 0 then
            FValorCampo029 := VarArrayCreate([0, count - 1], varVariant);
        end;//if
      end else if existeCampo(CAMPO_TEXTO_OPERADOR) then
        pegarValorCampo(FValorCampo030_000, linha)

      else if existeCampo(CAMPO_TEXTO_ESPECIAL_CLIENTE) then
        pegarValorCampo(FValorCampo031_000, linha)

      else if existeCampo(CAMPO_AUTENTICACAO) then
        pegarValorCampo(FValorCampo032_000, linha)

      else if existeCampo(CAMPO_BANCO) then
        pegarValorCampo(FValorCampo033_000, linha)

      else if existeCampo(CAMPO_AGENCIA) then
        pegarValorCampo(FValorCampo034_000, linha)

      else if existeCampo(CAMPO_AGENCIA_DC) then
        pegarValorCampo(FValorCampo035_000, linha)

      else if existeCampo(CAMPO_CONTA_CORRENTE) then
        pegarValorCampo(FValorCampo036_000, linha)

      else if existeCampo(CAMPO_CONTA_CORRENTE_DC) then
        pegarValorCampo(FValorCampo037_000, linha)

      else if existeCampo(CAMPO_NUMERO_CHEQUE) then
        pegarValorCampo(FValorCampo038_000, linha)

      else if existeCampo(CAMPO_NUMERO_CHEQUE_DC) then
        pegarValorCampo(FValorCampo039_000, linha)

      else if existeCampo(CAMPO_NOME_ADMINISTRADORA) then
        pegarValorCampo(FValorCampo040_000, linha)
    end;//if
  end;//while
  CloseFile(f);
  // se for pagamento com múltiplos ou se for um pagamento com cartão
  if multiplosCartoes or (valorCampo000_000 = VALOR_HEADER_CARTAO) then
    escreverRequisicaoBackup;
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 15/05/2008
  Objetivo...: Ler o arquivo de resposta do GP na criação do componente e caso o
               arquivo exista, significa que o aplicativo está sendo reiniciado
               logo após alguma exceção durante o processo de pagamento com o
               cartão.
  Comentários:
  Alterações.:
*******************************************************************************}
function TEasyTEFDiscado.lerConfirmacaoArquivoRespostaGp: Boolean;
begin
  Result := FileExists(arquivoResposta);
  if Result then begin
    lerArquivoRespostaGp;
    naoConfirmacaoVendaImpressaoCupom(valorCampo010_000,
      valorCampo012_000, valorCampo027_000, valorCampo002_000);
    msgNaoConfirmacaoVendaImpressaoCupom;
    excluirArquivoResposta;
    fecharECF(valorCampo000_000);
  end;//if
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 15/05/2008
  Objetivo...: O sistema deve ter um arquivo de backup pelo menos com os valores
               mais importantes do arquivo de resposta do GP para que, caso
               aconteça algum problema com o arquivo, o sistema possua uma
               forma alternativa de tratar exceções que necessitam do arquivo
               de resposta.
  Comentários:
  Alterações.:
*******************************************************************************}
function TEasyTEFDiscado.lerConfirmacaoBackup: Boolean;
var
  arquivoIni: TIniFile;
  confirmado, cupomFechado, multCards: Boolean;
  id, rede, nsu, finalizacao, valor, header, secao, gerenciadorTEF: string;
  i, numCartoes: Integer;
  data: TDate;
  hora: TTime;

  procedure carregarValoresParaCancelamento;
  begin
    secao := 'REQUISICAO' + IntToStr(i);
    gerenciadorTEF := arquivoIni.ReadString(secao, 'gerenciador', '');
    confirmado := arquivoIni.ReadBool(secao, 'confirmado', False);
    valor := arquivoIni.ReadString(secao, 'valor', '');
    header := arquivoIni.ReadString(secao, 'header', '');
    id := arquivoIni.ReadString(secao, 'id', '');
    rede := arquivoIni.ReadString(secao, 'rede', '');
    nsu := arquivoIni.ReadString(secao, 'nsu', '');
    finalizacao := arquivoIni.ReadString(secao, 'finalizacao', '');
    data := arquivoIni.ReadDate(secao, 'data', 0);
    hora := arquivoIni.ReadTime(secao, 'hora', 0);
    multCards := arquivoIni.ReadBool('GERAL', 'multiplosCartoes', False);
  end;//procedure

  procedure tratarFinalImpressaoCupons;
  begin
    if not cupomFechado then
      fecharECF(header);
    if maisDeUmCartao then
      excluirArquivoBackup;
    if Assigned(FOnTerminarCancelamentoMultiplosCartoes) then
      FOnTerminarCancelamentoMultiplosCartoes(Self);
  end;//procedure

  procedure verificarArquivoResposta;
  var
    i: TIniFile;
    cardCount: Integer;
  begin
    if FileExists(arquivoResposta) then begin
      i := TIniFile.Create(arquivoBackup);
      try
        cardCount := i.ReadInteger('GERAL', 'numCartoes', 0);
        lerArquivoRespostaGp;
        if valorCampo000_000 = VALOR_HEADER_CANCELAMENTO then begin
          lendoConfirmacaoBackup := False;
          try
            excluirArquivoResposta;
            countCartoes := cardCount + 1;
            numeroDeCartoes := countCartoes;
            escreverRequisicaoBackup;
          finally
            lendoConfirmacaoBackup := True;
          end;
        end;//if
      finally
        FreeAndNil(i);
      end;//try..finally
    end;//if
  end;//procedure
begin
  Result := FileExists(arquivoBackup);
  if Result and not arquivoBackupIrrelevante then begin
    cupomFechado := False;
    lendoConfirmacaoBackup := True;
    // método exclusivo para o teste 27 do Visa Plug&Pay
    verificarArquivoResposta;
    arquivoIni := TIniFile.Create(arquivoBackup);
    try
      numCartoes := arquivoIni.ReadInteger('GERAL', 'numCartoes', 0);
      Self.numeroDeCartoes := numCartoes;
      for i := numCartoes downto 1 do begin
        carregarValoresParaCancelamento;
        Self.gerenciador := TTipoGerenciador(GetEnumValue(TypeInfo(
          TTipoGerenciador), gerenciadorTEF));
        // se a transação foi confirmada e se é um pagamento com múltiplos
        // cartões
        if confirmado and multCards then begin
          if not cupomFechado then begin
            fecharECF;
            cupomFechado := True;
          end;//if
          valor := StringReplace(valor, 'R$', '', [rfReplaceAll]);
          reiniciarPropriedades;
          while not transacaoAprovada do begin
            cancelarVenda(StrToFloat(valor), rede, nsu, data, hora);
            if transacaoAprovada then begin
              lerArquivoRespostaGp;
              imprimirRelatorioGerencial(imagemCupomTEF);
              excluirRespostas;
            end;//if
          end;//while
        // se não foi feita a confirmação da venda e se o valor é diferente de 0
        // ou a operação é administrativa
        end else if not confirmado and ((valor <> 'R$ 0,00') or
           (header = 'ADM')) then begin
          naoConfirmacaoVendaImpressaoCupom(rede, nsu, finalizacao);
          msgNaoConfirmacaoVendaImpressaoCupom(rede, nsu, valor);
          arquivoIni.EraseSection('REQUISICAO' + IntToStr(i));
          numCartoes := arquivoIni.ReadInteger('GERAL', 'numCartoes', 0);
          arquivoIni.WriteInteger('GERAL', 'numCartoes', numCartoes - 1);
        end;//else
      end;//for
      tratarFinalImpressaoCupons;
    finally
      arquivoIni.Free;
      excluirRespostas;
      lendoConfirmacaoBackup := False;
    end;//try..finally
  end else if arquivoBackupIrrelevante then begin
    excluirArquivoBackup;
    Result := False;
  end;//else
end;

procedure TEasyTEFDiscado.Loaded;
begin
  inherited;
  tratarVerificacoesIniciais;
  {$IFDEF AVALIACAO} mostrarMensagemAvaliacao; {$ENDIF}
end;//procedure

{*******************************************************************************
  Autor......: EasyTEF Team - 20/05/2008
  Objetivo...: Mostrar as mensagens do GP para o operador dentro da seguinte
               regra. Quando houver mensagem para o operador e houver imagem
               de cupom para ser impressa, mostrar a tela sem botão ok e esta
               tela deve sumir automaticamente. Caso não exista imagem de
               cupom, mostrar a tela com botão ok esperando o clique do
               operador para sumir.
  Comentários:
  Alterações.:
*******************************************************************************}
procedure TEasyTEFDiscado.mostrarMensagemOperador;
var
  f: TMsgForm;
  msgCampo030: TStringList;
  sumirSozinho: Boolean;
  procedure configurarFormMsg;
  begin
    f.Font := FformMsgOperador.font;
    f.Height := FformMsgOperador.altura;
    f.Width := FformMsgOperador.largura;
    // se a nova altura do botão for menor que a altura atual
    if FformMsgOperador.botaoOK.altura < f.btnOk.Height then
      f.btnOk.Top := f.btnOk.Top + (f.btnOk.Height -
        FformMsgOperador.botaoOK.altura)
    // se a nova altura do botão for maior que a altura atual
    else if FformMsgOperador.botaoOK.altura > f.btnOk.Height then
      f.btnOk.Top := f.btnOk.Top - (FformMsgOperador.botaoOK.altura -
        f.btnOk.Height);
    f.btnOk.Height := FformMsgOperador.botaoOK.altura;
    f.btnOk.Width := FformMsgOperador.botaoOK.largura;
    f.Caption := valorCampo010_000 + ' [' + pegarFormaDePagamento + ']';
  end;//procedure
begin
  if not (valorCampo030_000 = '') then begin
    Screen.Cursor := crHourGlass;
    try
      msgCampo030 := stringToStringList(valorCampo030_000, ' ');
      Application.ProcessMessages;
      focarFormPrincipal;
      Application.ProcessMessages;
      if (valorCampo009_000 = '0') and (valorCampo028_000 > 0) then begin
        sumirSozinho := valorCampo030_000 <> MSG_ERRO_GP_INATIVO;
        f := TMsgForm.Create(Application, msgCampo030, sumirSozinho);
        configurarFormMsg;
        if sumirSozinho then begin
          f.BringToFront;
          f.Repaint;
          f.Refresh;
          f.Show;
          Application.ProcessMessages;
        end else
          f.ShowModal;
      end else begin
        if not (valorCampo030_000 = MSG_ERRO_GP_INATIVO) then begin
          excluirArquivoRequisicao;
          excluirRespostas;
        end;//if
        f := TMsgForm.Create(Application, msgCampo030);
        configurarFormMsg;
        f.ShowModal;
      end;//else
    finally
      Screen.Cursor := crDefault;
    end;//try..finally
  end;//if
end;

procedure TEasyTEFDiscado.mostrarMensagemOperador(msg: string);
begin
  FvalorCampo030_000 := msg;
  mostrarMensagemOperador;
end;//procedure

{*******************************************************************************
  Autor......: EasyTEF Team - 20/05/2008
  Objetivo...: Montar a mensagem automática que o operador receberá de que a
               última transação TEF foi cancelada, seja por desligamento de
               energia da ECF, ou Ctrl + Alt + Del na AC durante a impressão e
               etc.  
  Comentários:
  Alterações.:
*******************************************************************************}
procedure TEasyTEFDiscado.msgNaoConfirmacaoVendaImpressaoCupom(rede, nsu,
  valor: string);
var msgCancelamento: string;
begin
  msgCancelamento := 'Cancelada a transação: '+#13+#13;
  if not (valorCampo010_000 = '') then
    msgCancelamento := msgCancelamento +
      Format('Rede: %s'+#13+#13, [valorCampo010_000])
  else if not (rede = '') then
    msgCancelamento := msgCancelamento +
      Format('Rede: %s'+#13+#13, [rede]);

  if not (valorCampo012_000 = '') then
    msgCancelamento := msgCancelamento +
      Format('NSU: %s'+#13+#13, [valorCampo012_000])
  else if not (nsu = '') then
    msgCancelamento := msgCancelamento +
      Format('NSU: %s'+#13+#13, [nsu]);

  if not (valorCampo003_000 = 0)then
    msgCancelamento := msgCancelamento +
      Format('Valor: %s',
      [FormatCurr('#,##0.00', valorCampo003_000)])
  else if not (valor = '') and not (valor = 'R$ 0,00') then
    msgCancelamento := msgCancelamento +
      Format('Valor: %s'+#13+#13, [valor]);

  MessageDlg(msgCancelamento, mtWarning, [mbOK],0);
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 20/05/2008
  Objetivo...: Comando que deve ser enviado a administradora de cartão caso
               não tenha sido impresso o cupom vinculado TEF ao cupom fiscal. 
  Comentários:
  Alterações.:
*******************************************************************************}
procedure TEasyTEFDiscado.naoConfirmacaoVendaImpressaoCupom(
  nomeRede, numeroTransacaoNsu, finalizacao,
  documentoFiscalVinculado: string);
var
  naoEstavaAtivo: Boolean;
begin
  naoEstavaAtivo := False;
  while not verificarGerenciadorAtivo do begin
    cancelarTransacao;
    delay(TIME_OUT_TEF);
    naoEstavaAtivo := True;
  end;//while

  if naoEstavaAtivo then
    delay(TIME_OUT_TEF);
    
  inserirDadosIniciaisRequisicao(ttNaoConfirmacao);
  try
    if not (documentoFiscalVinculado = '') then
      escreverValores(CAMPO_DOCUMENTO_FISCAL, documentoFiscalVinculado);
    escreverValores(CAMPO_NOME_REDE, nomeRede);
    escreverValores(CAMPO_NUMERO_TRANSACAO_NSU, numeroTransacaoNsu);
    escreverValores(CAMPO_FINALIZACAO, finalizacao);
  finally
    finalizarRequisicao;
    if not maisDeUmCartao then
      excluirArquivoBackup;
  end;//try..finally
  aguardarRetornoStatusGp(naoConfirmacaoVendaImpressaoCupom);
  if transacaoAprovada then begin
    excluirArquivoResposta;
  end;//if
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 20/05/2008
  Objetivo...: Método para pagamento de compra via cartão de débito e crédito.
  Comentários:
  Alterações.:
*******************************************************************************}
procedure TEasyTEFDiscado.pagarNoCartao(valorTotal: Double; moeda: Byte;
  documentoFiscalVinculado: string; primeiroCartao, ultimoCartao: Boolean);
var campo, valor: string;
begin
  if podeComecarRequisicao then begin
    {$IFDEF AVALIACAO} mostrarMensagemAvaliacao; {$ENDIF}
    tratarInicioRequisicao;
    try
      if verificarGerenciadorAtivo then begin
        inserirDadosIniciaisRequisicao(ttCartao);
        try
          if not (documentoFiscalVinculado = '') then
            escreverValores(CAMPO_DOCUMENTO_FISCAL, documentoFiscalVinculado);
          escreverValores(CAMPO_VALOR_TOTAL, tratarValorTotal(valorTotal));
          // evento necessário para o dia da certificação, quando o
          // certificador irá testar se não é um aplicativo externo
          // que escreve os arquivos de requisição
          if Assigned(FOnValorPersonalizadoReq) then
            FOnValorPersonalizadoReq(campo, valor);
          escreverValores(campo, valor);
          escreverValores(CAMPO_MOEDA, IntToStr(moeda));
        finally
          finalizarRequisicao;
        end;//try..finally
        processarRespostaGp(primeiroCartao, ultimoCartao);
      end else
        cancelarTransacao;
    finally
      tratarFimRequisicao;
    end;//try..finally
    tratarTransacaoNaoAprovada;
    tratarTransacaoComMultiplosCartoes(primeiroCartao, ultimoCartao);
  end;//if
end;

function TEasyTEFDiscado.pegarFormaDePagamento: string;
begin
  if valorCampo011_000 = '00' then
    Result := 'Administração'
  else if valorCampo011_000 = '01' then
    Result := 'Administração – Fechamento/Transmissão de Lote'
  else if valorCampo011_000 = '10' then
    Result := 'Cartão de Crédito à Vista'
  else if valorCampo011_000 = '11' then
    Result := 'Cartão de Crédito Parcelado pelo Estabelecimento'
  else if valorCampo011_000 = '12' then
    Result := 'Cartão de Crédito Parcelado pela Administradora'
  else if valorCampo011_000 = '13' then
    Result := 'Pré­Autorização com Cartão de Crédito'
  else if valorCampo011_000 = '20' then
    Result := 'Cartão de Débito à Vista'
  else if valorCampo011_000 = '21' then
    Result := 'Cartão de Débito Pré­Datado'
  else if valorCampo011_000 = '22' then
    Result := 'Cartão de Débito Parcelada'
  else if valorCampo011_000 = '23' then
    Result := 'Cartão de Débito à Vista Forçada'
  else if valorCampo011_000 = '24' then
    Result := 'Cartão de Débito Pré­Datado Forçada'
  else if valorCampo011_000 = '25' then
    Result := 'Cartão de Débito Pré­Datado sem Garantia'
  else if valorCampo011_000 = '30' then
    Result := 'Outros Cartões'
  else if valorCampo011_000 = '40' then
    Result := 'CDC'
  else if valorCampo011_000 = '41' then
    Result := 'Consulta CDC'
  else if valorCampo011_000 = '50' then
    Result := 'Convênio'
  else if valorCampo011_000 = '60' then
    Result := 'Voucher'
  else if valorCampo011_000 = '70' then
    Result := 'Consulta Cheque'
  else if valorCampo011_000 = '71' then
    Result := 'Garantia de Cheque'
  else if valorCampo011_000 = '80' then
    Result := 'Pagamento de Conta com Cartão'
  else if valorCampo011_000 = '81' then
    Result := 'Pagamento de Conta com Cheque'
  else if valorCampo011_000 = '82' then
    Result := 'Pagamento de Conta com Dinheiro'
  else if valorCampo011_000 = '99' then
    Result := 'Outras'
  else
    Result := '';
end;

function TEasyTEFDiscado.ownerEhForm: Boolean;
begin
  Result := Assigned(Owner) and (Owner is TForm);
end;

procedure TEasyTEFDiscado.processarRespostaGp(primeiroCartao,
  ultimoCartao: Boolean);
begin
  aguardarRetornoStatusGp;
  lerArquivoRespostaGp;
  tratarRespostaGp(primeiroCartao, ultimoCartao);
end;

function TEasyTEFDiscado.programaPayGo: string;
var
  reg: TRegistry;
  dlg: TOpenDialog;
  ini: TIniFile;
  programa: string;
begin
  Result := '';
  reg := TRegistry.Create;
  ini := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    programa := ini.ReadString('GERAL', 'Pay&Go', '');
    if not (programa = '') then
      Result := programa
    else begin
      reg.RootKey := HKEY_LOCAL_MACHINE;
      if reg.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\' +
         'App Paths\PayGo Cliente GerPadr Socket.exe', False) then
        Result := reg.ReadString('');
      reg.CloseKey;
      if Result = '' then begin
        MessageBox(0, 'Não foi possível encontrar o programa Pay&Go Client.'+#13+#10+
          ''+#13+#10+'Por favor, pressione OK e informe onde está o programa.',
          'Programa não encontrado', MB_ICONWARNING or MB_OK);
        dlg := TOpenDialog.Create(nil);
        try
          dlg.Filter := 'Executável Pay&Go|*.exe';
          dlg.DefaultExt := 'exe';
          if dlg.Execute then begin
            Result := dlg.FileName;
            ini.WriteString('GERAL', 'Pay&Go', Result);
          end;//if
        finally
          FreeAndNil(dlg);
        end;//try..finally
      end;//if
    end;//else
  finally
    ini.Free;
    reg.Free;
  end;//try..finally
end;

procedure TEasyTEFDiscado.reiniciarPropriedades;
begin
  FValorCampo000_000 := ''; FValorCampo001_000 := ''; FValorCampo002_000 := '';
  FValorCampo003_000 := ''; FValorCampo004_000 := ''; FValorCampo005_000 := '';
  FValorCampo006_000 := ''; FValorCampo007_000 := ''; FValorCampo008_000 := '';
  FValorCampo009_000 := ''; FValorCampo010_000 := ''; FValorCampo011_000 := '';
  FValorCampo012_000 := ''; FValorCampo013_000 := ''; FValorCampo014_000 := '';
  FValorCampo015_000 := ''; FValorCampo016_000 := ''; FValorCampo017_000 := '';
  FValorCampo018_000 := ''; FValorCampo022_000 := ''; FValorCampo023_000 := '';
  FValorCampo024_000 := ''; FValorCampo025_000 := ''; FValorCampo026_000 := '';
  FValorCampo027_000 := ''; FValorCampo028_000 := ''; FValorCampo030_000 := '';
  FValorCampo031_000 := ''; FValorCampo032_000 := ''; FValorCampo033_000 := '';
  FValorCampo034_000 := ''; FValorCampo035_000 := ''; FValorCampo036_000 := '';
  FValorCampo037_000 := ''; FValorCampo038_000 := ''; FValorCampo039_000 := '';
  FValorCampo040_000 := '';

  FValorCampo019 := null; FValorCampo020 := null; FValorCampo021 := null;
  FValorCampo029 := null;

  FTransacaoAprovada := False;
  imprimiuRelatorioGerencial := False;
end;

function TEasyTEFDiscado.podeComecarRequisicao: Boolean;
begin
  Result := not FrequisicaoIniciada and gerenciadorInstalado and FautoVerificarTEF;
end;

procedure TEasyTEFDiscado.SetimprimirComprovante(const Value: Boolean);
begin
  if FimprimirComprovante <> Value then
    FimprimirComprovante := Value;
end;

procedure TEasyTEFDiscado.SetOnAbrirComprovanteNaoFiscalVinculado(
  const Value: TOnAbrirComprovanteNaoFiscalVinculado);
begin
  FOnAbrirComprovanteNaoFiscalVinculado := Value;
end;

procedure TEasyTEFDiscado.SetOnEfetuarFormaPagamento(
  const Value: TOnTratamentoECFOk);
begin
  FOnEfetuarFormaPagamento := Value;
end;

procedure TEasyTEFDiscado.SetOnEfetuarFormaPagamentoDescricaoForma(
  const Value: TOnTratamentoECFOk);
begin
  FOnEfetuarFormaPagamentoDescricaoForma := Value;
end;

procedure TEasyTEFDiscado.SetOnEncerrarCupomFiscal(
  const Value: TNotifyEvent);
begin
  FOnEncerrarCupomFiscal := Value;
end;

procedure TEasyTEFDiscado.SetOnFecharComprovanteNaoFiscalVinculado(
  const Value: TNotifyEvent);
begin
  FOnFecharComprovanteNaoFiscalVinculado := Value;
end;

procedure TEasyTEFDiscado.SetOnFecharRelatorioGerencial(
  const Value: TOnOperacaoECFOk);
begin
  FOnFecharRelatorioGerencial := Value;
end;

procedure TEasyTEFDiscado.SetOnImpressoraTemPapel(const Value: TOnOperacaoECFOk);
begin
  FOnImpressoraTemPapel := Value;
end;

procedure TEasyTEFDiscado.SetOnImprimirRelatorioGerencial(
  const Value: TOnImprimirCupomECF);
begin
  FOnImprimirRelatorioGerencial := Value
end;

procedure TEasyTEFDiscado.SetOnIniciarFechamentoCupomFiscal(
  const Value: TOnTratamentoECFOk);
begin
  FOnIniciarFechamentoCupomFiscal := Value;
end;

procedure TEasyTEFDiscado.SetOnTerminarFechamentoCupom(
  const Value: TOnTratamentoECFOk);
begin
  FOnTerminarFechamentoCupom := Value;
end;

procedure TEasyTEFDiscado.SetOnUsarComprovanteNaoFiscalVinculado(
  const Value: TOnImprimirCupomECF);
begin
  FOnUsarComprovanteNaoFiscalVinculado := Value;
end;

procedure TEasyTEFDiscado.SetOnSubTotalizarCupom(
  const Value: TOnTratamentoECFOk);
begin
  FOnSubTotalizarCupom := Value;
end;

procedure TEasyTEFDiscado.SetOnValorPersonalizadoReq(
  const Value: TOnValorPersonalizadoReq);
begin
  FOnValorPersonalizadoReq := Value;
end;

procedure TEasyTEFDiscado.Setgerenciador(const Value: TTipoGerenciador);
begin
  if Fgerenciador <> Value then
    Fgerenciador := Value;
end;

procedure TEasyTEFDiscado.SetoperacaoTEFAtual(const Value: TTipoTef);
begin
  if FoperacaoTEFAtual <> Value then
    FoperacaoTEFAtual := Value;
end;

procedure TEasyTEFDiscado.tratarFimRequisicao;
begin
  // se for uma transação não aprovada e se não for uma transação com múltiplos
  // cartões
  if (not transacaoAprovada and not maisDeUmCartao) then
    excluirArquivoBackup;
  janelaParaSetarFoco := '';
  FrequisicaoIniciada := False;
  Screen.Cursor := crDefault;
end;

procedure TEasyTEFDiscado.tratarInicioRequisicao;
begin
  Screen.Cursor := crHourGlass;
  FrequisicaoIniciada := True;
  janelaParaSetarFoco := Owner.ClassName;
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 07/01/2008
  Objetivo...: Tratar os valores passados para o GP de acordo com o manual, ou
               seja, sem pontuação e com duas casas decimais.
  Comentários:
  Alterações.:
*******************************************************************************}
procedure TEasyTEFDiscado.tratarRespostaGp(primeiroCartao,
  ultimoCartao: Boolean);
var
  imagemCupom: TStringList;
begin
  // conforme especificação do fluxograva da página 8 do manual do tef discado
  // v2.1, deve-se desprezar o arquivo e voltar a esperar um novo arquivo
  // resposta se o nº de identificação do pedido não for o mesmo da resposta
  if not conferirIdentificacao(IntToStr(Fidentificacao)) then begin
    excluirArquivoResposta;
    lerArquivoRespostaGp;
    tratarRespostaGp;
  end else begin
    mostrarMensagemOperador;
    // se houver linhas de comprovante para imprimir e se for para imprimir
    // o cupom fiscal imediatamente
    if (valorCampo028_000 > 0) and imprimirComprovante then begin
      imagemCupom := TStringList.Create;
      try
        imagemCupom.Assign(Self.imagemCupomTEF);
        imprimirCupomECF(imagemCupom, primeiroCartao, ultimoCartao);
      finally
        imagemCupom.Free;
      end;//try..finally
    end;//if
  end;//else
end;

procedure TEasyTEFDiscado.tratarTransacaoNaoAprovada;
begin
  if not transacaoAprovada then
    excluirRespostas;
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 07/01/2008
  Objetivo...: Tratar os valores passados para o GP de acordo com o manual, ou
               seja, sem pontuação e com duas casas decimais.
  Comentários:
  Alterações.:
*******************************************************************************}
function TEasyTEFDiscado.tratarValorTotal(valor: Double): string;
begin
  if valor <= 0 then
    raise Exception.Create('O valor total não pode ser menor ou igual a zero(0).');
  Result := FormatFloat('#,##0.00', valor);
  Result := StringReplace(Result, '.', '', [rfReplaceAll]);
  Result := StringReplace(Result, ',', '', [rfReplaceAll]);
end;

procedure TEasyTEFDiscado.tratarConsultaCheque(imagemCupomTEF: TStrings;
  nomeRede, numeroTransacaoNsu, finalizacao, docFiscalVinculado: string);
var
  impressaoOk: Boolean;
begin
  impressaoOk := False;
  // a impressora pode ter algum problema na impressão do compravante
  // TEF, então, enquanto ela não responder ok
  while not impressaoOk do begin
    blockInput(True);
    try
      imprimirCupomECF(imagemCupomTEF, impressaoOk, True, True);
    finally
      blockInput(False);
    end;//try..finally
    // se a impressora não respondeu ok
    if not impressaoOk then begin
      focarFormPrincipal;
      impressaoOk := Application.MessageBox(MSG_IMP_NAO_RESP,
        'ECF não responde', MB_ICONQUESTION + MB_YESNO) = idNo;
      // se o usuário escolheu não tentar mais imprimir
      if impressaoOk then begin
        naoConfirmacaoVendaImpressaoCupom(nomeRede,
          numeroTransacaoNsu, finalizacao, docFiscalVinculado);
        if Assigned(FOnFecharComprovanteNaoFiscalVinculado) then
          FOnFecharComprovanteNaoFiscalVinculado(Self)
      end;//if
    // se a impressora respondeu ok
    end else
      confirmacaoVendaImpressaoCupom(nomeRede,
        numeroTransacaoNsu, finalizacao, docFiscalVinculado);
  end;//while not impressaoOk
end;

function TEasyTEFDiscado.tratarCupomFiscal(metodo: TMetodoECF;
  params: array of string): string;
var
  impressaoOk: Boolean;
  valor: string;
  
  procedure executarMetodoECF;
  begin
    valor := '';
    case metodo of
      tmeSubTotal: begin
        reiniciarPropriedades;
        valor := params[0];
        if Assigned(FOnSubTotalizarCupom) then
          FOnSubTotalizarCupom(impressaoOk, params, valor);

        Result := valor;
      end;//tmeSubTotal

      tmeIniciarFechamentoCupom:
        if Assigned(FOnIniciarFechamentoCupomFiscal) then
          FOnIniciarFechamentoCupomFiscal(impressaoOk, params, valor);

      tmeEfetuarFormaPgto:
        if Assigned(FOnEfetuarFormaPagamento) then
          FOnEfetuarFormaPagamento(impressaoOk, params, valor);

      tmeEfetuarFormaPgtoDescForma:
        if Assigned(FOnEfetuarFormaPagamentoDescricaoForma) then
          FOnEfetuarFormaPagamentoDescricaoForma(impressaoOk, params, valor);

      tmeTerminarFechamentoCupom:
        if Assigned(FOnTerminarFechamentoCupom) then
          FOnTerminarFechamentoCupom(impressaoOk, params, valor);

    end;//case
    impressaoOk := impressaoOk {$IFNDEF AVALIACAO} and impressoraTemPapel {$ENDIF};
  end;//procedure
begin
  Result := '';
  executarMetodoECF;
  while not impressaoOk do begin
    focarFormPrincipal;
    if Application.MessageBox(MSG_IMP_NAO_RESP, 'ECF não responde',
       MB_ICONQUESTION + MB_YESNO) = idYes then begin
      Sleep(TIME_OUT_TEF);
      executarMetodoECF;
    end else begin
      if Assigned(FOnEncerrarCupomFiscal) then
        FOnEncerrarCupomFiscal(Self);

      reiniciarContagemDeCartoes;

      if transacaoAprovada then begin
        naoConfirmacaoVendaImpressaoCupom(valorCampo010_000, valorCampo012_000,
          valorCampo027_000, valorCampo002_000);
        msgNaoConfirmacaoVendaImpressaoCupom;
      end;//if
      Abort;
    end;//else
  end;//while
end;

procedure TEasyTEFDiscado.tratarVerificacoesIniciais;
begin
  if not (csDesigning in ComponentState) and FautoVerificarTEF then begin
    Screen.Cursor := crHourGlass;
    try
      verificarGerenciadorAtivo;
      if not lerConfirmacaoBackup then
        lerConfirmacaoArquivoRespostaGp;
    finally
      Screen.Cursor := crDefault;
    end;//try..finally
  end;//if
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 08/01/2008
  Objetivo...:
  Comentários: Para acessar os limites inferior e superior dos arrays das 4
               funções abaixo, usar as funções VarArrayLowBound e
               VarArrayHighBound, respectivamente.
  Alterações.:
*******************************************************************************}
function TEasyTEFDiscado.valorCampo019_000: Variant;
begin
  Result := FValorCampo019;
end;

function TEasyTEFDiscado.valorCampo020_000: Variant;
begin
  Result := FValorCampo020;
end;

function TEasyTEFDiscado.valorCampo021_000: Variant;
begin
  Result := FValorCampo021;
end;

function TEasyTEFDiscado.valorCampo029_000: Variant;
begin
    Result := FValorCampo029;
end;

function TEasyTEFDiscado.verificarGerenciadorAtivo: Boolean;
begin
  Result := verificarGerenciadorInstalado;
  if Result then begin
    Result := gerenciadorAtivo;
    if not Result then begin
      executarGerenciador;
      delay(TIME_OUT_TEF);
      verificarGerenciadorAtivo;
    end;//if
  end;//if
end;

function TEasyTEFDiscado.verificarGerenciadorInstalado: Boolean;
begin
  Result := gerenciadorInstalado;
  if not Result then begin
    if gerenciadorPadrao then
      MessageDlg('Gerenciador Padrão não instalado.', mtInformation, [mbOK], 0)
    else if hiperCard then
      MessageDlg('HiperTEF não instalado.', mtInformation, [mbOK], 0)
    else if tecBanBanrisul then
      MessageDlg('Gerenciador TecBan / Banrisul não instalado.', mtInformation, [mbOK], 0)
    else
      MessageDlg('Pay&Go não instalado.', mtInformation, [mbOK], 0);
  end;//if
end;

procedure TEasyTEFDiscado.verificarOwnerForm;
begin
  if Assigned(Owner) and not (Owner is TForm) then
    raise Exception.Create('Este componente só pode ser utilizado em Forms.');
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 20/05/2008
  Objetivo...: Aguardar a resposta do GP de que ele recebeu a requisição e está
               processando a mesma. O tempo de espera, segundo o manual, é de
               até 7 segundos. 
  Comentários:
  Alterações.:
*******************************************************************************}
function TEasyTEFDiscado.verificarStatusGp: Boolean;
var i: Byte;
begin
  Result := FileExists(arquivoStatus);
  i := 1;
  while not Result and (i <= timeOutGerenciador) do begin
    Result := FileExists(arquivoStatus);
    if not Result then
      delay(1000);
    i := i + 1;
  end;//while
  excluirArquivoStatus;
end;

procedure TEasyTEFDiscado.verificarEmTempoDeDesign;
var i, count: Integer;
begin
  count := 0;
  if ownerEhForm then
    for i := 0 to Owner.ComponentCount - 1 do begin
      if Owner.Components[i] is TEasyTEFDiscado then
        count := count + 1;
    end//for
  else
    raise Exception.Create('Owner inválido');

  if count > 1 then
    raise Exception.Create('Só pode existir um componente por Form. O GP trata ' +
      'apenas uma requisição por vez.');
end;

function TEasyTEFDiscado.diretorioRequisicao: string;
begin
  case gerenciador of
    tgGerenciadorPadrao, tgPayGo: Result := 'c:\tef_dial\req\';
    tgTecBan, tgBanrisul: Result := 'c:\tef_disc\req\';
    tgHipercard: Result := 'c:\HiperTEF\req\';
    else
      Result := 'c:\';
  end;
end;

function TEasyTEFDiscado.diretorioResposta: string;
begin
  case gerenciador of
    tgGerenciadorPadrao, tgPayGo: Result := 'c:\tef_dial\resp\';
    tgTecBan, tgBanrisul: Result := 'c:\tef_disc\resp\';
    tgHipercard: Result := 'c:\HiperTEF\resp\';
    else
      Result := 'c:\';
  end;
end;

function TEasyTEFDiscado.programaGerenciador: string;
begin
  case gerenciador of
    tgGerenciadorPadrao: Result := 'c:\tef_dial\tef_dial.exe';
    tgHipercard: Result := 'c:\HiperTEF\HiperTEF.exe';
    tgTecBan, tgBanrisul: Result := 'c:\tef_disc\tef_disc.exe';
    else
      Result := '';
  end;
end;

function TEasyTEFDiscado.hiperCard: Boolean;
begin
  Result := gerenciador = tgHipercard;
end;

function TEasyTEFDiscado.tecBanBanrisul: Boolean;
begin
  Result := (gerenciador = tgTecBan) or (gerenciador = tgBanrisul);
end;

procedure TEasyTEFDiscado.SetautoVerificarTEF(const Value: Boolean);
begin
  if not (Value = FautoVerificarTEF) then begin
    FautoVerificarTEF := Value;
    if FautoVerificarTEF then
      tratarVerificacoesIniciais;
  end;
end;

procedure TEasyTEFDiscado.reiniciarContagemDeCartoes;
begin
  countCartoes := 1;
  if not (listaComprovantesTEF = nil) then begin
    listaComprovantesTEF.Clear;
    listaValoresCartao.Clear;
  end;//if
end;

function TEasyTEFDiscado.getTransacaoNegada: Boolean;
begin
  Result := (valorCampo009_000 = '25') or (valorCampo009_000 = '55');
end;

{*******************************************************************************
  Author.....: EasyTEF Team - 03/12/2008
  Objetivo...: Fazer os tratamentos necessários para pagamentos com múltiplos
               cartões e preparar as estruturas de controle para impressão dos
               N cupons TEF.
  Alterações.:
*******************************************************************************}
procedure TEasyTEFDiscado.tratarTransacaoComMultiplosCartoes(primeiroCartao,
  ultimoCartao: Boolean);
begin
  // se a transação é feita com múltiplos cartões e se a transação foi negada
  if multiplosCartoes and transacaoNegada then begin
    // se o usuário escolher por não continuar
    if Application.MessageBox('Gostaria de continuar a transação com outra(s) '+
       'forma(s) de pagamento?', 'Formas de pagamento', MB_ICONQUESTION +
       MB_YESNO) = idNo then
      lerConfirmacaoBackup;
  end else if multiplosCartoes and transacaoAprovada then begin
    // faz a confirmação do pagamento pois com múltiplos cartões a confirmação
    // deve ser feita antes da impressão
    if not ultimoCartao then begin
      confirmacaoVendaImpressaoCupom(valorCampo010_000,
        valorCampo012_000, valorCampo027_000, valorCampo002_000);
      // registra a transação corrente como confirmada
      escreverConfirmacaoBackup;
    end;
    // guarda a imagem do cupom TEF para impressão subsequente
    listaComprovantesTEF.Add(TStringList.Create);
    listaValoresCartao.Add(FormatFloat('#,##0.00',
      StrToFloat(FValorCampo003_000) / 100));
    TStringList(listaComprovantesTEF[listaComprovantesTEF.Count - 1]).Assign(
      imagemCupomTEF);
    // grava qual é o primeiro cartão e qual é o último
    listaTipoComprovante[listaComprovantesTEF.Count - 1, 0] := primeiroCartao;
    listaTipoComprovante[listaComprovantesTEF.Count - 1, 1] := ultimoCartao;
    countCartoes := countCartoes + 1;
  end else if multiplosCartoes and not primeiroCartao and ultimoCartao and
     imprimirComprovante then
    imprimirCuponsECF;
end;

{*******************************************************************************
  Author.....: EasyTEF Team - 27/11/2008
  Objetivo...: Fazer a impressão dos cupons armazenados em uma transação com
               múltiplos cartões, onde há mais de um cupom TEF a imprimir.
  Alterações.:
*******************************************************************************}
procedure TEasyTEFDiscado.imprimirCuponsECF;
var
  i, j: Integer;
begin
  i := 0;
  for j := 0 to listaComprovantesTEF.Count - 1 do begin
    indicePagamento := j;
    // se a impressão não for bem sucedida, todos os cancelamentos serão feitos
    // e a impressão não precisa mais continuar
    if not imprimirCupomECF(TStringList(listaComprovantesTEF[j]),
       listaTipoComprovante[i, 0], listaTipoComprovante[i, 1]) then
      Break;
    i := i + 1;

    if imprimiuRelatorioGerencial then
      Break;
  end;//for

  confirmacaoVendaImpressaoCupom(valorCampo010_000,
    valorCampo012_000, valorCampo027_000, valorCampo002_000);
  // registra a transação corrente como confirmada
  escreverConfirmacaoBackup;
  excluirRespostas;
  excluirArquivoBackup;
  reiniciarContagemDeCartoes;
end;

procedure TEasyTEFDiscado.SetnumeroDeCartoes(const Value: Integer);
var i: Integer;
begin
  FnumeroDeCartoes := Value;
  SetLength(listaTipoComprovante, Value);
  for i := Low(listaTipoComprovante) to High(listaTipoComprovante) do
    SetLength(listaTipoComprovante[i], 2);
end;

function TEasyTEFDiscado.getMultiplosCartoes: Boolean;
begin
  Result := maisDeUmCartao and (valorCampo000_000 = VALOR_HEADER_CARTAO);
end;

function TEasyTEFDiscado.maisDeUmCartao: Boolean;
begin
  Result := numeroDeCartoes > 1;
end;

function TEasyTEFDiscado.imprimirRelatorioGerencial(
  imagemCupomTEF: TStrings): Boolean;
var
  impressaoTEFOk: Boolean;
begin
  imprimiuRelatorioGerencial := True;
  blockInput(True);
  try
    // o cupom TEF deve ser impresso em duas vias
    imprimirRelatorioGerencial(imagemCupomTEF, impressaoTEFOk);
  finally
    blockInput(False);
  end;//try..finally

  Result := impressaoTEFOk;

  // se a impressão não foi bem sucedida
  if not impressaoTEFOk then begin
    while not impressaoTEFOk do begin
      focarFormPrincipal;
      impressaoTEFOk := Application.MessageBox(MSG_IMP_NAO_RESP,
        'ECF não responde', MB_ICONQUESTION + MB_YESNO) = idNo;
      // se o usuário escolheu tentar novamente
      if not impressaoTEFOk then begin
        blockInput(True);
        // espera a impressora ligar e se preparar para poder fazer o
        // cancelamento do cupom anterior
        Sleep(TIME_OUT_TEF);
        try
          imprimirRelatorioGerencial(imagemCupomTEF, impressaoTEFOk);
        finally
          blockInput(False);
        end;//try..finally
        Result := impressaoTEFOk;
      end else begin
        Result := False;
        lerConfirmacaoBackup;
      end;//else
    end;//while not impressaoTEFOk
  // aqui precisa fazer a confirmação caso seja um cancelamento, mas se for
  // pagamento com múltiplos cartões não precisa pois as confirmações já
  // foram feitas
  end else if not multiplosCartoes then
    confirmacaoVendaImpressaoCupom(valorCampo010_000,
      valorCampo012_000, valorCampo027_000, valorCampo002_000);
end;

procedure TEasyTEFDiscado.SetOnTerminarCancelamentoMultiplosCartoes(
  const Value: TNotifyEvent);
begin
  FOnTerminarCancelamentoMultiplosCartoes := Value;
end;

procedure TEasyTEFDiscado.SettimeOutGerenciador(const Value: Integer);
begin
  FtimeOutGerenciador := Value;
end;

procedure TEasyTEFDiscado.delay(msecs: Cardinal);
var
  firstTick, currentTick: Cardinal;
  done: Boolean;
begin
  done := False;
  firstTick := GetTickCount;
  while not done do begin
    Application.ProcessMessages;
    currentTick := GetTickCount;
    if Int64(currentTick) - Int64(firstTick) < 0 then begin
      if currentTick >= (Int64(firstTick) - High(Cardinal) + msecs) then
        done := True;
    end else if currentTick - firstTick >= msecs then
     done := True;
  end;
end;

procedure TEasyTEFDiscado.pegarValorCampo(var v: string; linha: string);
begin
  v := Trim(Copy(linha, Pos(RECEBE, linha) + Length(RECEBE), Length(linha)));
end;

{$IFDEF AVALIACAO}
procedure TEasyTEFDiscado.mostrarMensagemAvaliacao;
begin
  if not (csDesigning in ComponentState) then
    MessageDlg('*** Atenção ***'+#13+
      'Esta é uma CÓPIA para DESENVOLVEDOR de software.'+#13+
      'Não deve ser utilizada comercialmente.'+#13+
      'A versão definitiva é distribuida após negociação comercial com o EasyTEF Team.',
      mtWarning, [mbOK], 0);
end;
{$ENDIF}

procedure TEasyTEFDiscado.SeTFormMsgOperadorConfig(
  const Value: TFormMsgOperadorConfig);
begin
  FformMsgOperador.Assign(Value);
end;

{*******************************************************************************
  Autor......: EasyTEF Team - 28/04/2009
  Objetivo...: Fazer o cancelamento de transações caso tenha sido feito o
               cancelamento da venda pelo operador, após um ou mais cartões já
               terem sido aprovados.
  Comentários:
*******************************************************************************}
procedure TEasyTEFDiscado.cancelarVenda;
var
  arquivoIni: TIniFile;
  id, rede, nsu, finalizacao, valor, header, secao: string;
  i, numCartoes: Integer;
  data: TDate;
  hora: TTime;
  confirmado: Boolean;

  procedure carregarValoresParaCancelamento;
  begin
    secao := 'REQUISICAO' + IntToStr(i);
    confirmado := arquivoIni.ReadBool(secao, 'confirmado', False);
    valor := arquivoIni.ReadString(secao, 'valor', '');
    header := arquivoIni.ReadString(secao, 'header', '');
    id := arquivoIni.ReadString(secao, 'id', '');
    rede := arquivoIni.ReadString(secao, 'rede', '');
    nsu := arquivoIni.ReadString(secao, 'nsu', '');
    finalizacao := arquivoIni.ReadString(secao, 'finalizacao', '');
    data := arquivoIni.ReadDate(secao, 'data', 0);
    hora := arquivoIni.ReadTime(secao, 'hora', 0);
  end;//procedure
begin
  if FileExists(arquivoBackup) and not arquivoBackupIrrelevante then begin
    lendoConfirmacaoBackup := True;

    reiniciarContagemDeCartoes;
    arquivoIni := TIniFile.Create(arquivoBackup);
    try
      numCartoes := arquivoIni.ReadInteger('GERAL', 'numCartoes', 0);
      for i := numCartoes downto 1 do begin
        carregarValoresParaCancelamento;
        // se a transação foi confirmada
        if confirmado then begin
          valor := Trim(StringReplace(valor, 'R$', '', [rfReplaceAll]));
          if valor <> '0,00' then begin
            reiniciarPropriedades;
            while not transacaoAprovada do begin
              cancelarVenda(StrToFloat(valor), rede, nsu, data, hora);
              if transacaoAprovada then begin
                lerArquivoRespostaGp;
                imprimirRelatorioGerencial(imagemCupomTEF);
                excluirRespostas;
              end;//if
            end;//while
          end;//if
        end;//if
      end;//for
    finally
      arquivoIni.Free;
      excluirRespostas;
      DeleteFile(arquivoBackup);
      lendoConfirmacaoBackup := False;
    end;//try..finally
  end;//if
end;

function TEasyTEFDiscado.arquivoBackupIrrelevante: Boolean;
var
  secao, valor, header, id, rede, nsu, finalizacao: string;
  data: TDate;
  hora: TTime;
  confirmado, multCards: Boolean;
  arquivoIni: TIniFile;
begin
  Result := FileExists(arquivoBackup);
  if Result then begin
    arquivoIni := TIniFile.Create(arquivoBackup);
    try
      secao := 'REQUISICAO1';
      confirmado := arquivoIni.ReadBool(secao, 'confirmado', False);
      valor := arquivoIni.ReadString(secao, 'valor', '');
      header := arquivoIni.ReadString(secao, 'header', '');
      id := arquivoIni.ReadString(secao, 'id', '');
      rede := arquivoIni.ReadString(secao, 'rede', '');
      nsu := arquivoIni.ReadString(secao, 'nsu', '');
      finalizacao := arquivoIni.ReadString(secao, 'finalizacao', '');
      data := arquivoIni.ReadDate(secao, 'data', 0);
      hora := arquivoIni.ReadTime(secao, 'hora', 0);
      multCards := arquivoIni.ReadBool('GERAL', 'multiplosCartoes', False);
    finally
      arquivoIni.Free;
    end;//try..finally

    Result := Result and confirmado and (valor = '') and (header = '') and
      (id = '') and (rede = '') and (nsu = '') and (finalizacao = '') and
      (data = 0) and (hora = 0) and not multCards;
  end;//if
end;

procedure TEasyTEFDiscado.SetOnGerarIdentificador(
  const Value: TOnGerarIdentificador);
begin
  FOnGerarIdentificador := Value;
end;

procedure TEasyTEFDiscado.SetOnGuilhotinar2aViaCupomTEF(
  const Value: TNotifyEvent);
begin
  FOnGuilhotinar2aViaCupomTEF := Value;
end;

function TEasyTEFDiscado.executarGerenciador(gerenciador: string): Boolean;
var
  s: string;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  s := gerenciador;
  FillChar(StartupInfo, SizeOf(StartupInfo), 0);
  StartupInfo.cb := SizeOf(StartupInfo);
  Result := CreateProcess(nil, PChar(s), nil, nil, False, 0, nil, nil,
    StartupInfo, ProcessInfo);
end;

procedure TEasyTEFDiscado.SetautoAtivarGerenciador(const Value: Boolean);
begin
  FautoAtivarGerenciador := Value;
end;

procedure TEasyTEFDiscado.SetOnImprimirLeituraX(
  const Value: TOnOperacaoECFOk);
begin
  FOnImprimirLeituraX := Value;
end;

procedure TEasyTEFDiscado.solicitarPagamentoContas(valorTotal: Double;
  cmc7, tipoPessoa, documentoPessoa: string;
  dataCheque: TDateTime; banco, agencia, digitoControleAgencia,
  contaCorrente, digitoControleContaCorrente, numeroCheque,
  digitoControleNumeroCheque, codigoBarrasLinhaDigitavel: string);
var
  campo, valor: string;
begin
  if podeComecarRequisicao then begin
    {$IFDEF AVALIACAO} mostrarMensagemAvaliacao; {$ENDIF}
    tratarInicioRequisicao;
    try
      if verificarGerenciadorAtivo then begin
        inserirDadosIniciaisRequisicao(ttPagamentos);
        try
          escreverValores(CAMPO_VALOR_TOTAL, tratarValorTotal(valorTotal));

          // evento necessário para o dia da certificação, quando o
          // certificador irá testar se não é um aplicativo externo
          // que escreve os arquivos de requisição
          if Assigned(FOnValorPersonalizadoReq) then
            FOnValorPersonalizadoReq(campo, valor);

          escreverValores(campo, valor);
          escreverValores(CAMPO_CMC7, cmc7);
          escreverValores(CAMPO_TIPO_PESSOA, tipoPessoa);
          escreverValores(CAMPO_DOCUMENTO_PESSOA, documentoPessoa);
          escreverValores(CAMPO_DATA_CHEQUE, dataGp(dataCheque));
          escreverValores(CAMPO_BANCO, banco);
          escreverValores(CAMPO_AGENCIA, agencia);
          escreverValores(CAMPO_AGENCIA_DC, digitoControleAgencia);
          escreverValores(CAMPO_CONTA_CORRENTE, contaCorrente);
          escreverValores(CAMPO_CONTA_CORRENTE_DC, digitoControleContaCorrente);
          escreverValores(CAMPO_NUMERO_CHEQUE, numeroCheque);
          escreverValores(CAMPO_NUMERO_CHEQUE_DC, digitoControleNumeroCheque);
          escreverValores(CAMPO_CODIGO_BARRAS_LINHA_DIGITAVEL,
            codigoBarrasLinhaDigitavel);

        finally
          finalizarRequisicao;
        end;//try..finally
        processarRespostaGp;
      end;//if
    finally
      tratarFimRequisicao;
    end;//try..finally
    if transacaoAprovada then begin
      excluirRespostas;
    end;//if
  end;//if
end;

procedure TEasyTEFDiscado.cancelarTransacao;
begin
  FtransacaoAprovada := False;
  excluirArquivoRequisicao;
  excluirRespostas;
end;

end.
