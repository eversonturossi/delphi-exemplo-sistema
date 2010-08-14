{*******************************************************************************
  Autor......: EasyTEF Team - 15/05/2008
  Objetivo...: Fazer um exemplo simples e direto da utilização do componente
               TEasyTEFDiscado numa tela de frente de caixa. Este exemplo
               implementa os tratamentos mínimos necessários para a
               certificação.

  Comentários: Este tela não deve ser usada como referência para uma
               aplicação comercial (AC) mais completa, mas sim como guia para
               uso dos métodos e tratamentos a serem feitos na utilização do
               componente TEasyTEFDiscado.

               Os tratamentos quanto a ECF, como por exemplo, abrir a tela
               com cupom fiscal já aberto, troco, etc., devem ser feitos pela
               AC e não são tratados neste exemplo.
*******************************************************************************}

unit FrenteCaixaFrm;

interface

{$I DelphiVer.inc}

uses
  Windows, Messages, SysUtils, EasyTEFDiscado, StdCtrls, Controls, Buttons,

  {$IFDEF DELPHI_6_UP}
  Variants,
  {$ENDIF}

  {$IFDEF DELPHI_7_UP}
  XPMan,
  {$ENDIF}

  Classes, Forms, Dialogs, ExtCtrls, ActnList;

type
  TFrenteCaixaF = class(TForm)
    pnlBotoes: TPanel;
    pnlPrincipal: TPanel;
    mmoCupomFiscal: TMemo;
    EasyTEF: TEasyTEFDiscado;
    btnFechar: TBitBtn;
    btnNovo: TBitBtn;
    btnCancelarItem: TBitBtn;
    btnCancelarVenda: TBitBtn;
    btnEncerrarVenda: TBitBtn;
    grbItem: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    rbtInteira: TRadioButton;
    rbtFracionaria: TRadioButton;
    edtQtd: TEdit;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    rbt2Casas: TRadioButton;
    rbt3Casas: TRadioButton;
    edtValorUnit: TEdit;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    rbtPercentual: TRadioButton;
    rbtValor: TRadioButton;
    edtValorDesc: TEdit;
    edtAliquota: TEdit;
    btnAdicionarItem: TButton;
    btnAdm: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarVendaClick(Sender: TObject);
    procedure btnAdicionarItemClick(Sender: TObject);
    procedure btnCancelarItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEncerrarVendaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAdmClick(Sender: TObject);
    procedure EasyTEFEncerrarCupomFiscal(Sender: TObject);
    procedure EasyTEFImpressoraTemPapel(var operacaoECFOk: Boolean);
    procedure EasyTEFFecharComprovanteNaoFiscalVinculado(Sender: TObject);
    procedure EasyTEFFecharRelatorioGerencial(var operacaoECFOk: Boolean);
    procedure EasyTEFUsarComprovanteNaoFiscalVinculado(
      imagemCupomTef: TStrings; var impressaoOk: Boolean);
    procedure EasyTEFImprimirRelatorioGerencial(imagemCupomTef: TStrings;
      var impressaoOk: Boolean);
    procedure EasyTEFSubTotalizarCupom(var operacaoECFOk: Boolean;
      params: array of String; var retorno: String);
    procedure EasyTEFEfetuarFormaPagamento(var operacaoECFOk: Boolean;
      params: array of String; var retorno: String);
    procedure EasyTEFIniciarFechamentoCupomFiscal(
      var operacaoECFOk: Boolean; params: array of String;
      var retorno: String);
    procedure EasyTEFTerminarFechamentoCupom(var operacaoECFOk: Boolean;
      params: array of String; var retorno: String);
    procedure EasyTEFTerminarCancelamentoMultiplosCartoes(Sender: TObject);
    procedure EasyTEFAbrirComprovanteNaoFiscalVinculado(
      var operacaoECFOk: Boolean; valorCupom: String);
    procedure EasyTEFGerarIdentificador(var identificacao: Integer);
    procedure EasyTEFValorPersonalizadoReq(var campo, valor: String);
    procedure EasyTEFImprimirLeituraX(var operacaoECFOk: Boolean);
  private
    { Private declarations }
    seq, total: Double;
    retorno: Integer;
    numeroCupom, tipoQtd, tipoDesc, desc, formaPgt, valorPgto: string;
    procedure completarADireita(var s: string; count: Integer);
    procedure novaVenda;
    procedure cancelarVenda;
    procedure habilitarBotoes(habilitar: Boolean);
    procedure adicionarProduto;
    procedure cancelarItem;
    procedure encerrarVenda;
  public
    { Public declarations }
  end;

const
  BEMA_RETORNO_OK = 1;

var
  FrenteCaixaF: TFrenteCaixaF;

implementation

uses BematechFuncoes, FechamentoCupomFrm, ConsultaChequeFrm, TiposTEFDiscado;

{$R *.dfm}

procedure TFrenteCaixaF.btnNovoClick(Sender: TObject);
begin
  novaVenda;
end;

procedure TFrenteCaixaF.novaVenda;
var i: Integer;
begin
  Screen.Cursor := crHourGlass;
  try
    mmoCupomFiscal.Lines.Clear;
    retorno := Bematech_FI_AbreCupom(Pchar(''));

    if not (retorno = BEMA_RETORNO_OK) then
      MessageDlg(Format('Não foi possível abrir o cupom fiscal. O código de erro é: %d',
        [retorno]), mtWarning, [mbOK], 0)
    else begin
      habilitarBotoes(True);
      btnEncerrarVenda.Enabled := False;
      btnCancelarItem.Enabled := False;

      seq := 0;
      total := 0;

      numeroCupom := '';      
      for i := 1 to 6 do
        numeroCupom := numeroCupom + ' ';

      retorno := Bematech_FI_NumeroCupom(numeroCupom);
      mmoCupomFiscal.Lines.Add('Cupom Fiscal No. ' + numeroCupom);
      mmoCupomFiscal.Lines.Add('');
      mmoCupomFiscal.Lines.Add('');
    end;
  finally
    Screen.Cursor := crDefault;
  end;//try..finally
end;

procedure TFrenteCaixaF.cancelarVenda;
begin
  Screen.Cursor := crHourGlass;
  try
    mmoCupomFiscal.Clear;
    retorno := Bematech_FI_CancelaCupom;
    if not (retorno = BEMA_RETORNO_OK) then
      MessageDlg(Format('Não foi possível cancelar o cupom fiscal. O código de erro é: %d',
        [retorno]), mtWarning, [mbOK], 0)
    else begin
      habilitarBotoes(False);
      EasyTEF.cancelarVenda;
    end;//else

  finally
    Screen.Cursor := crDefault;
  end;//try..finally
end;

procedure TFrenteCaixaF.btnCancelarVendaClick(Sender: TObject);
begin
  cancelarVenda;
end;

procedure TFrenteCaixaF.habilitarBotoes(habilitar: Boolean);
begin
  btnNovo.Enabled := not habilitar;
  btnAdicionarItem.Enabled := habilitar;
  btnCancelarItem.Enabled := habilitar;
  btnCancelarVenda.Enabled := habilitar;
  btnEncerrarVenda.Enabled := habilitar;
end;

procedure TFrenteCaixaF.adicionarProduto;
var casasDec: Integer;
    procedure iniciarVariaveis;
    begin
      if rbtInteira.Checked then
        tipoQtd := 'I'
      else
        tipoQtd := 'F';

      if rbt2Casas.Checked then
        casasDec := 2
      else
        casasDec := 3;

      if rbtPercentual.Checked then
        tipoDesc := '%'
      else
        tipoDesc := '$';

      desc := edtDescricao.Text;
      completarADireita(desc, edtDescricao.MaxLength);
    end;//procedure
begin
  Screen.Cursor := crHourGlass;
  try
    iniciarVariaveis;

    retorno := Bematech_FI_VendeItem(edtCodigo.Text, desc, edtAliquota.Text,
      tipoQtd, edtQtd.Text, casasDec, edtValorUnit.Text,
      tipoDesc, edtValorDesc.Text);

    if retorno = BEMA_RETORNO_OK then begin
      seq := seq + 1;
      mmoCupomFiscal.Lines.Add(
        FormatFloat('000', seq) + #9 +
        desc + #9 +
        edtQtd.Text + ' x ' + edtValorUnit.Text);
      total := total + StrToFloat(edtValorUnit.Text) * StrToInt(edtQtd.Text);
      edtCodigo.SetFocus;
      btnEncerrarVenda.Enabled := True;
      btnCancelarItem.Enabled := True;
    end else
      MessageDlg(Format('Não foi possível adicionar o item. O código de erro é: %d',
          [retorno]), mtWarning, [mbOK], 0)
  finally
    Screen.Cursor := crDefault;
  end;//try..finally
end;

procedure TFrenteCaixaF.btnAdicionarItemClick(Sender: TObject);
begin
  adicionarProduto;
end;

procedure TFrenteCaixaF.cancelarItem;
var numero: string;
begin
  numero := '';
  while numero = '' do begin
    numero := InputBox('Informe o numero do item no cupom',
      'Informe o numero do item no cupom', FormatFloat('000', seq));
  end;//while

  if Length(numero) = 1 then
    numero := '00' + numero
  else if Length(numero) = 2 then
    numero := '0' + numero;

  retorno := Bematech_FI_CancelaItemGenerico(PChar(numero));

  if not (retorno = BEMA_RETORNO_OK) then
    MessageDlg(Format('Não foi possível cancelar o Item. O código de erro é: %d',
        [retorno]), mtWarning, [mbOK], 0)
  else begin
    mmoCupomFiscal.Lines.Add('');
    mmoCupomFiscal.Lines.Add('Item ' + numero + ' cancelado');
    mmoCupomFiscal.Lines.Add('');
  end;
end;


procedure TFrenteCaixaF.btnCancelarItemClick(Sender: TObject);
begin
  cancelarItem;
end;

procedure TFrenteCaixaF.completarADireita(var s: string; count: Integer);
var i: Integer;
begin
  for i := Length(s) to count do
    s := s + ' ';
end;

procedure TFrenteCaixaF.FormCreate(Sender: TObject);
begin
  total := 0;
end;

procedure TFrenteCaixaF.encerrarVenda;
var
  frmFechaCupom: TFechamentoCupomForm;
  pgtComCartao: Boolean;
  valorTotalCartao, valorTotal: Double;
  desconto, tipoDesc, valor: string;
  i: Integer;

  procedure tratarPagamentoComCartao;
  var
    cartaoNumero: Integer;
  begin
    cartaoNumero := 0;
    valorTotalCartao := 0;
    EasyTEF.numeroDeCartoes := frmFechaCupom.numCartoes;
    frmFechaCupom.cdsFechamentoCupom.First;
    while not frmFechaCupom.cdsFechamentoCupom.Eof do begin
      cartaoNumero := cartaoNumero + 1;
      pgtComCartao := frmFechaCupom.cdsFechamentoCupomForma.Value = FORMA_PGTO_CARTAO;
      if pgtComCartao then begin
        valorTotalCartao := valorTotalCartao + frmFechaCupom.cdsFechamentoCupomValor.Value;
        // a identificaçao deve ser sequencial e única para toda e qualquer
        // requisição TEF. Se vc estiver utilizando uma base de dados Interbase/
        // Firebird, por exemplo, crie um generator responsável pela geração
        // desta identificação
        EasyTEF.imprimirComprovante := False;
        EasyTEF.pagarNoCartao(frmFechaCupom.cdsFechamentoCupomValor.Value, 0,
          numeroCupom, cartaoNumero = 1, cartaoNumero = frmFechaCupom.numCartoes);
        if not EasyTEF.transacaoAprovada then
          Abort;
        frmFechaCupom.cdsFechamentoCupom.Delete;
        if frmFechaCupom.cdsFechamentoCupomForma.Value <> FORMA_PGTO_CARTAO then
          frmFechaCupom.cdsFechamentoCupom.Next;
        // forma de pagamento que será passada para o comprovante não fiscal
        // vinculado
        formaPgt := FORMA_PGTO_CARTAO;
      end else
        frmFechaCupom.cdsFechamentoCupom.Next;
    end;//while
  end;//procedure
begin
  Screen.Cursor := crHourGlass;
  pnlPrincipal.Enabled := False;
  try
    frmFechaCupom := TFechamentoCupomForm.Create(Self, total);
    frmFechaCupom.ShowModal;

    // se a tela de fechamento do cupom fiscal foi fechada pressionando o botão OK
    if frmFechaCupom.ModalResult = mrOk then begin

      valorTotal := StrToFloat(EasyTEF.tratarCupomFiscal(tmeSubTotal, ['']));
      if (valorTotal / 100) = 0 then
        raise Exception.Create('Cupom fiscal sem valor, operação cancelada');

      // EasyTEF Team - 30/01/2008
      // O tratamento para pagamento via cartões com GP é diferente porque o
      // cupom fiscal não pode ser fechado se a transação de pagamento não for
      // aprovada pela rede, além da especificação TEF Discado exigir que a forma
      // de pagamento Cartão seja tratada por último no cupom fiscal.
      tratarPagamentoComCartao;

      // Neste caso, estamos dando nenhum desconto no cupom
      // Tratamentos mais elaborados de desconto devem ser feitos na aplicação
      // comercial
      desconto := 'D'; tipoDesc := '$'; valor := '0';
      EasyTEF.tratarCupomFiscal(tmeIniciarFechamentoCupom, [desconto, tipoDesc,
        valor]);

      with frmFechaCupom.cdsFechamentoCupom do begin
        First;
        // efetua todas as formas de pagamento utilizadas no cupom
        while not Eof do begin
          EasyTEF.tratarCupomFiscal(tmeEfetuarFormaPgto,
            [FieldByName('Forma').AsString,
            FormatFloat('#,##0.00', FieldByName('Valor').AsFloat)]);
          Next;
        end;//while

        // se houve pagamento com cartão
        if pgtComCartao then begin
          if EasyTEF.multiplosCartoes then
            for i := 0 to EasyTEF.valoresCartoes.Count - 1 do begin
              EasyTEF.tratarCupomFiscal(tmeEfetuarFormaPgto,
                [FORMA_PGTO_CARTAO, EasyTEF.valoresCartoes[i]]);
            end//for
          else
            EasyTEF.tratarCupomFiscal(tmeEfetuarFormaPgto,
              [FORMA_PGTO_CARTAO, FormatFloat('#,##0.00', valorTotalCartao)]);
        end;//if

        EasyTEF.tratarCupomFiscal(tmeTerminarFechamentoCupom,
          ['Mensagem de fechamento desejada...']);

        // se houve consulta de cheque no serasa e se foi aprovada, existe cupom
        // TEF a ser impresso
        with frmFechaCupom.dadosConsultaCheque do
          if houveConsulta and consultaOk then begin
            // forma de pagamento que será passada para o comprovante não fiscal
            // vinculado
            formaPgt := FORMA_PGTO_CHEQUE;
            valorPgto := FormatFloat('#,##0.00', valor);
            EasyTEF.tratarConsultaCheque(cupomTEF, nomeRede, nsu, finalizacao,
              docFiscalVinculado);
          end;//if


        formaPgt := FORMA_PGTO_CARTAO;
        valorPgto := FormatFloat('#,##0.00', valorTotalCartao);
        // imprime o(s) cupom(s) TEF na ECF após o fechamento do cupom fiscal
        if pgtComCartao and (EasyTEF.numeroDeCartoes = 1) then
          EasyTEF.imprimirCupomECF(EasyTEF.imagemCupomTef, True, True)
        else if pgtComCartao and EasyTEF.multiplosCartoes then
          EasyTEF.imprimirCuponsECF;
      end;//with

      mmoCupomFiscal.Lines.Clear;
      habilitarBotoes(False);
    end;//if
  finally
    pnlPrincipal.Enabled := True;
    Screen.Cursor := crDefault;
  end;//try..finally
end;

procedure TFrenteCaixaF.btnEncerrarVendaClick(Sender: TObject);
begin
  encerrarVenda;
end;

procedure TFrenteCaixaF.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [] then begin
    if (Key = VK_F3) and (btnAdicionarItem.Enabled) then
      adicionarProduto
    else if (Key = VK_F4) and (btnNovo.Enabled) then
      novaVenda
    else if (Key = VK_F5) and (btnCancelarItem.Enabled) then
      cancelarItem
    else if (Key = VK_F6) and (btnCancelarVenda.Enabled) then
      cancelarVenda
    else if (Key = VK_F7) and (btnEncerrarVenda.Enabled) then
      encerrarVenda;
  end;//if
end;

procedure TFrenteCaixaF.btnAdmClick(Sender: TObject);
begin
  // como o cupom deve ser impresso logo após o término da operação, ao invés
  // de fazer tratamentos e então imprimi-lo, imprimirComprovante deve ser
  // setado para true
  EasyTEF.imprimirComprovante := True;
  // esta é uma aplicação exemplo, por isso não está sendo passada uma
  // identificação para esta operação TEF
  EasyTEF.fazerRequisicaoAdministrativa;
end;

procedure TFrenteCaixaF.EasyTEFEncerrarCupomFiscal(Sender: TObject);
begin
  Bematech_FI_FechaComprovanteNaoFiscalVinculado;
  Bematech_FI_CancelaCupom;
end;

procedure TFrenteCaixaF.EasyTEFImpressoraTemPapel(
  var operacaoECFOk: Boolean);
var a, s1, s2: Integer;
begin
  a := 0; s1 := 0; s2 := 0;
  Bematech_FI_VerificaEstadoImpressora(a, s1, s2);
  operacaoECFOk := not (s1 >= 128); // fim de papel
end;

procedure TFrenteCaixaF.EasyTEFFecharComprovanteNaoFiscalVinculado(
  Sender: TObject);
begin
  Bematech_FI_FechaComprovanteNaoFiscalVinculado;
end;

procedure TFrenteCaixaF.EasyTEFFecharRelatorioGerencial(
  var operacaoECFOk: Boolean);
begin
  operacaoECFOk := Bematech_FI_FechaRelatorioGerencial = BEMA_RETORNO_OK;
end;

procedure TFrenteCaixaF.EasyTEFUsarComprovanteNaoFiscalVinculado(
  imagemCupomTef: TStrings; var impressaoOk: Boolean);
begin
  impressaoOk := Bematech_FI_UsaComprovanteNaoFiscalVinculado(
    imagemCupomTef.GetText) = BEMA_RETORNO_OK;
end;

procedure TFrenteCaixaF.EasyTEFImprimirRelatorioGerencial(
  imagemCupomTef: TStrings; var impressaoOk: Boolean);
begin
  impressaoOk := Bematech_FI_RelatorioGerencial(imagemCupomTef.GetText) =
    BEMA_RETORNO_OK;
end;

procedure TFrenteCaixaF.EasyTEFSubTotalizarCupom(
  var operacaoECFOk: Boolean; params: array of String;
  var retorno: String);
var i: Integer;
begin
  for i := 1 to 14 do retorno := retorno + ' ';
  operacaoECFOk := Bematech_FI_SubTotal(retorno) = BEMA_RETORNO_OK;
end;

procedure TFrenteCaixaF.EasyTEFEfetuarFormaPagamento(
  var operacaoECFOk: Boolean; params: array of String;
  var retorno: String);
begin
  operacaoECFOk := Bematech_FI_EfetuaFormaPagamento(
    PChar(params[0]), PChar(params[1])) = BEMA_RETORNO_OK;
end;

procedure TFrenteCaixaF.EasyTEFIniciarFechamentoCupomFiscal(
  var operacaoECFOk: Boolean; params: array of String;
  var retorno: String);
begin
  operacaoECFOk := Bematech_FI_IniciaFechamentoCupom(
    PChar(params[0]), PChar(params[1]), PChar(params[2])) = BEMA_RETORNO_OK;
end;

procedure TFrenteCaixaF.EasyTEFTerminarFechamentoCupom(
  var operacaoECFOk: Boolean; params: array of String;
  var retorno: String);
begin
  operacaoECFOk :=
    Bematech_FI_TerminaFechamentoCupom(PChar(params[0])) = BEMA_RETORNO_OK;
end;

procedure TFrenteCaixaF.EasyTEFTerminarCancelamentoMultiplosCartoes(
  Sender: TObject);
begin
  mmoCupomFiscal.Lines.Clear;
  habilitarBotoes(False);
end;

procedure TFrenteCaixaF.EasyTEFAbrirComprovanteNaoFiscalVinculado(
  var operacaoECFOk: Boolean; valorCupom: String);
begin
  if valorCupom = '0,00' then
    valorCupom := valorPgto;
    
  operacaoECFOk := Bematech_FI_AbreComprovanteNaoFiscalVinculado(
    formaPgt, valorCupom, numeroCupom) = BEMA_RETORNO_OK;
end;

procedure TFrenteCaixaF.EasyTEFGerarIdentificador(
  var identificacao: Integer);
begin
  Randomize;
  identificacao := Random(999999);
end;

procedure TFrenteCaixaF.EasyTEFValorPersonalizadoReq(var campo,
  valor: String);
begin
  campo := '777-777';
  valor := 'TESTE REDECARD';
end;

procedure TFrenteCaixaF.EasyTEFImprimirLeituraX(
  var operacaoECFOk: Boolean);
begin
  operacaoECFOk := Bematech_FI_LeituraX = BEMA_RETORNO_OK;
end;

end.


