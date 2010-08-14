unit u_fechamento_venda_TEF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask,IniFiles,
  jpeg, RxGIF, Mylabel, DBXPress, Grids, DBGrids, DB, DBClient, RXDBCtrl,
  EasyTEFDiscado, TiposTefDiscado, UConsultaChequeSerasa, rxToolEdit,
  rxCurrEdit;

type
  Tffechamentovenda_tef = class(TForm)
    ERecebido: TCurrencyEdit;
    ETroco: TCurrencyEdit;
    Image1: TImage;
    dsFormaPgto: TDataSource;
    TFormaPgto: TClientDataSet;
    TFormaPgtoVALOR: TFloatField;
    TFormaPgtoTIPO: TStringField;
    DBGrid1: TDBGrid;
    dsForma_Pgto: TDataSource;
    ERestante: TCurrencyEdit;
    PMensagem: TPanel;
    TFormaPgtoCOD_PGTO: TIntegerField;
    TFormaPgtoTROCO: TFloatField;
    EasyTEFDiscado: TEasyTEFDiscado;
    TFormaPgtoID: TIntegerField;
    TFormaPgtoTOTAL: TAggregateField;
    TFoco: TTimer;
    Shape1: TShape;
    LSubTotal: TmyLabel3d;
    Shape2: TShape;
    myLabel3d1: TmyLabel3d;
    ESubTotal: TCurrencyEdit;
    Shape3: TShape;
    myLabel3d5: TmyLabel3d;
    ETotalLiquido: TCurrencyEdit;
    Shape4: TShape;
    myLabel3d2: TmyLabel3d;
    Shape5: TShape;
    myLabel3d7: TmyLabel3d;
    Shape6: TShape;
    myLabel3d3: TmyLabel3d;
    DBGrid: TDBGrid;
    myLabel3d4: TmyLabel3d;
    PRodape: TPanel;
    myLabel3d11: TmyLabel3d;
    Shape7: TShape;
    myLabel3d6: TmyLabel3d;
    Shape8: TShape;
    Timer1: TTimer;
    LEncerramento1: TmyLabel3d;
    LEncerramento: TmyLabel3d;
    Panel1: TPanel;
    myLabel3d10: TmyLabel3d;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ERecebidoKeyPress(Sender: TObject; var Key: Char);
    procedure ESubTotalKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ERecebidoEnter(Sender: TObject);
    procedure ERecebidoExit(Sender: TObject);
    procedure EasyTEFDiscadoAbrirComprovanteNaoFiscalVinculado(
      var operacaoECFOk: Boolean; valorCupom: String);
    procedure EasyTEFDiscadoEfetuarFormaPagamento(
      var operacaoECFOk: Boolean; params: array of String;
      var retorno: String);
    procedure EasyTEFDiscadoEncerrarCupomFiscal(Sender: TObject);
    procedure EasyTEFDiscadoFecharComprovanteNaoFiscalVinculado(
      Sender: TObject);
    procedure EasyTEFDiscadoFecharRelatorioGerencial(
      var operacaoECFOk: Boolean);
    procedure EasyTEFDiscadoImpressoraTemPapel(var operacaoECFOk: Boolean);
    procedure EasyTEFDiscadoImprimirRelatorioGerencial(
      imagemCupomTef: TStrings; var impressaoOk: Boolean);
    procedure EasyTEFDiscadoIniciarFechamentoCupomFiscal(
      var operacaoECFOk: Boolean; params: array of String;
      var retorno: String);
    procedure EasyTEFDiscadoSubTotalizarCupom(var operacaoECFOk: Boolean;
      params: array of String; var retorno: String);
    procedure EasyTEFDiscadoTerminarFechamentoCupom(
      var operacaoECFOk: Boolean; params: array of String;
      var retorno: String);
    procedure EasyTEFDiscadoUsarComprovanteNaoFiscalVinculado(
      imagemCupomTef: TStrings; var impressaoOk: Boolean);
    procedure EasyTEFDiscadoGerarIdentificador(var identificacao: Integer);
    procedure EasyTEFDiscadoValorPersonalizadoReq(var campo,
      valor: String);
    procedure FormDestroy(Sender: TObject);
    procedure EasyTEFDiscadoImprimirLeituraX(var operacaoECFOk: Boolean);
    procedure TFocoTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }

    vGravaBancodeDados, Consultou_Cheque, Aprovou_Cheque, Cancelou_Transacao_TEF : Boolean;
    S_Forma_de_Pagamento, S_Acrescimo_ou_Desconto, S_Tipo_Acrescimo_ou_Desconto,
    S_Valor_Acrescimo_ou_Desconto,sValor, S_Mensagem_Promocional, S_Texto_Comprovante_Nao_Fiscal,
    S_Texto_Parcelas, S_Texto, S_Rodape_Comprovante, S_Salta_Linha, S_Parcela,
    S_Valor_Parcela, S_Vencimento, vCPF_CNPJ, vRG_IE, Usou_Cartao_Deb_Cred,
    valorPgto, s_Operadora_Cartao, s_Registro_DAV, S_Linha_Comprovante, sTrib, sGNF : String;
    Cont, Nr_Transacao_Tef, Cod_Adm_Cartao, iNum_Caixa : Integer;
    nDif_Valor, nBase_Icms, nValor_Icms, nTotal_Crediario : Currency;

    procedure GravaFechamentoLocal;
    procedure GravaFechamentoRemoto;
    procedure SomaTabelaPgtos;
    //procedure Concede_Desc_Maximo(Sender: TObject);
    procedure EncerrarVenda;
    procedure ConsultarCheque;
    procedure Aciona_Gaveta;
    procedure Imprimi_Comprovante_Nao_Fiscal_Vinculado;
    procedure Mostra(xMensagem:String);
    procedure Libera;
    procedure AtivaComponenteTEF_Fechamento;
    procedure ImprimiParcelaRelGerencial;
    procedure ChamaFormularioClienteConsumidor;
    procedure Verifica_Impressao_Doc_Nao_Fiscal;
  public
    { Public declarations }
    vTipo, vTecla_Crediario : String;
    vFechamento, vCliente, vLancaCaixa, vConcedido_Desconto, vAtivarComponenteTEF_Fechamento : Boolean;
    vCodCliente, result_compara_valores, vCont, vCodPortador : Integer;
    vDesconto, vPercDesconto, vPercAcrescimo, vAcrescimo, vValorCompara,
    vTotalCusto, vSomaItens, vDescIten, vQtdeAnterior, vForma_Pgto_Lancado : Currency;

    dadosConsultaCheque : TDadosConsultaCheque;
    procedure Verifica_Valores;
  end;

var
  ffechamentovenda_tef: Tffechamentovenda_tef;

implementation

uses dmsyndAC, checkout, UPAF_ECF, u_cadastro_nominalpdv,
     lite_frmprincipal, UDesc_Acresc, UBarsa,
     UDesconto_Ticket, UPesqClienteBalcao, UCrediario, UAdm_Cartoes,
     UCartao_Deb_Cred, Math, UMenuFiscal;

{$R *.dfm}

procedure TFFechamentoVenda_tef.Verifica_Impressao_Doc_Nao_Fiscal;
var
   Str_Indice, Str_Valor : String;
   Int_Tamanho, iConta : Integer;
begin
     if Imprimiu_Comprovante_nao_fiscal
     then begin
          Try
            if s_ImpFiscal = 'ECF Daruma'
            then begin
                 Int_Tamanho := 6 + 1;
                 Str_Indice := '28';
                 setlength( Str_valor, Int_Tamanho);
                 retorno_imp_fiscal:=Daruma_FIMFD_RetornaInformacao( Str_Indice, Str_Valor );
                 sGNF:=Str_Valor;
                 end
             else if s_ImpFiscal = 'ECF Bematech'
             then begin
                  for iConta := 1 to 6 do sGNF := sGNF + ' ';
                  retorno_imp_fiscal := Bematech_FI_NumeroOperacoesNaoFiscais( sGNF );
                  end
             else if s_ImpFiscal = 'ECF Elgin'
             then begin
                  for iConta := 1 to 6 do sGNF := sGNF + ' ';
                  retorno_imp_fiscal := Elgin_NumeroOperacoesNaoFiscais( sGNF );
                  end
             else if s_ImpFiscal = 'ECF Sweda'
             then begin
                  for iConta := 1 to 6 do sGNF := sGNF + ' ';
                  retorno_imp_fiscal := ECF_NumeroOperacoesNaoFiscais( Pchar(sGNF) );
                  end
          except
            Informa('Ocorreu um erro ao obter o numero do GNF (Número do Contador Geral '+
                    'Não Fiscal).');
            sGNF:='';        
            end;
          end
     else sGNF:='';
end;

procedure TFFechamentovenda_tef.ChamaFormularioClienteConsumidor;
begin
    Try
       if f_cadastro_nominalPDV=nil
       then application.createform(tf_cadastro_nominalPDV, f_cadastro_nominalPDV);
       f_cadastro_nominalPDV.showmodal;
    Finally
       f_cadastro_nominalPDV.Release;
       f_cadastro_nominalPDV:=Nil;
       end;
end;

procedure TFFechamentovenda_tef.AtivaComponenteTEF_Fechamento;
var
   Gerenciador_Estava_Ativo : Boolean;
begin
     if FrmPrincipal.Tef_Utilizado='Discado'
     then begin
          Mostra('Ativando funções TEF.Aguarde um momento!');

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

          vAtivarComponenteTEF_Fechamento:=False;

          Libera;
          end;
end;

procedure TFFechamentovenda_tef.Mostra(xMensagem:String);
begin
     AC;
     PMensagem.Caption:=xMensagem;
     PMensagem.Visible:=True;
     PMensagem.repaint;
end;

procedure TFFechamentovenda_tef.Libera;
begin
     DC;
     BlockInput(False);//Destrava o teclado
     PMensagem.Visible:=False;
end;

procedure TFFechamentovenda_tef.ConsultarCheque;
var
   myForm: TFConsultaChequeSerasa;
begin
   if TFormaPgto.Locate('COD_PGTO',2,[])//Forma de Pgto Cheque
   then begin
        Consultou_Cheque:=True;
        myForm := TFConsultaChequeSerasa.Create(Self);
        myForm.eValorCheque.Value := TFormaPgtoVALOR.Value;
        myForm.ShowModal;
        dadosConsultaCheque := myForm.dadosconsultaCheque;
        if myForm.EasyTEFDiscado.transacaoAprovada
        then Aprovou_Cheque:=True
        else Aprovou_Cheque:=False;

        if myForm <> Nil
        then begin
             myForm.Release;
             myForm:=Nil;
             end;
        end
   else Informa('Não existe nenhuma forma de pagamento em cheque!');
end;

procedure TFfechamentovenda_tef.EncerrarVenda;
var
  valorTotalCartao, valorTotal: Currency;
  pgtComCartao: string;
  i: Integer;

  procedure tratarPagamentoComCartao;
  var
    cartaoNumero: Integer;
  begin
    pgtComCartao:='N';
    cartaoNumero := 0;
    valorTotalCartao := 0;
    EasyTEFDiscado.numeroDeCartoes := 1;//Aqui eu faço uma verificação para ver qtos cartões
    TFormaPgto.First;                   //foi pago
    While not TFormaPgto.Eof
    do begin
       if (TFormaPgtoCOD_PGTO.Value=3)and(FrmPrincipal.Tef_Utilizado='Discado')
       then begin
            cartaoNumero := cartaoNumero + 1;
            pgtComCartao := 'S';
            valorTotalCartao := valorTotalCartao + TFormaPgtoVALOR.Value;

            Application.Minimize;

            EasyTEFDiscado.imprimirComprovante := False;
            EasyTEFDiscado.pagarNoCartao(TFormaPgtoVALOR.Value, 0, StrZero(nNumero_Cupom,6), cartaoNumero = 1, cartaoNumero = 1 );

            if not EasyTEFDiscado.transacaoAprovada
            then begin
                 Application.Restore;
                 FrmPrincipal.Visible:=False;
                 ffechamentovenda_tef.Refresh;
                 Application.ProcessMessages;
                 Close;
                 Abort;
                 end;
            // a identificaçao deve ser sequencial e única para toda e qualquer requisição TEF.
            Nr_Transacao_Tef:=NewGen('GEN_TRANSACAO_TEF',DM.SQLConnectionLocal);

            if EasyTEFDiscado.usouCartaoDebito=True
            then Usou_Cartao_Deb_Cred:='D'
            else if EasyTEFDiscado.usouCartaoCredito=True
            then Usou_Cartao_Deb_Cred:='C';

            // forma de pagamento que será passada para o comprovante não fiscal
            // vinculado
            S_Forma_de_Pagamento := TFormaPgtoTIPO.AsString;//+' '+s_Operadora_Cartao;
        end;
       TFormaPgto.Next;
    end;//while
    if pgtComCartao = 'S'
    then begin
         Application.Restore;
         FrmPrincipal.Visible:=False;
         ffechamentovenda_tef.Refresh;
         Application.ProcessMessages;
         end;
  end;//procedure
begin
    valorTotal := StrToFloat(EasyTEFDiscado.tratarCupomFiscal(tmeSubTotal, ['']));
    if (valorTotal / 100) = 0 then
      raise Exception.Create('Cupom fiscal sem valor, operação cancelada');

    // O tratamento para pagamento via cartões com GP é diferente porque o
    // cupom fiscal não pode ser fechado se a transação de pagamento não for
    // aprovada pela rede, além da especificação TEF Discado exigir que a forma
    // de pagamento Cartão seja tratada por último no cupom fiscal.

    tratarPagamentoComCartao;

     S_Tipo_Acrescimo_ou_Desconto:='$';
     if (vDesconto > 0)
     then begin
          S_Acrescimo_ou_Desconto:='D';//Desconto
          s_Valor_Acrescimo_ou_Desconto:=formatfloat('###,###,##0.00',vDesconto);
          end
     else if (vAcrescimo > 0)
     then begin
          S_Acrescimo_ou_Desconto:='A';//Acréscimo
          s_Valor_Acrescimo_ou_Desconto:=formatfloat('###,###,##0.00',vAcrescimo);
          end
     else begin
          S_Acrescimo_ou_Desconto:='D';
          s_Valor_Acrescimo_ou_Desconto:='0,00';
          end;

    EasyTEFDiscado.tratarCupomFiscal(tmeIniciarFechamentoCupom,
                   [S_Acrescimo_ou_Desconto, S_Tipo_Acrescimo_ou_Desconto, s_Valor_Acrescimo_ou_Desconto]);

    With TFormaPgto
    do begin
        First;
        // efetua todas as formas de pagamento utilizadas no cupom
        while not Eof
        do begin
           EasyTEFDiscado.tratarCupomFiscal(tmeEfetuarFormaPgto,
                    [FieldByName('TIPO').AsString,FormatFloat('#,##0.00', FieldByName('VALOR').AsCurrency)]);
           Next;
           end;//while

         //Observação para esta rotina:
         //Na Impressora Elgin não Funciona, mas nas outras IF sim

         // se houve pagamento com cartão
        if s_ImpFiscal <> 'ECF Elgin'
        then begin
              TFormaPgto.Locate('COD_PGTO',3,[]);//Forma de Pgto a Cartao
              if pgtComCartao = 'S'
              then begin
                   if EasyTEFDiscado.multiplosCartoes
                   then for i := 0 to EasyTEFDiscado.valoresCartoes.Count - 1
                        do begin
                           EasyTEFDiscado.tratarCupomFiscal(tmeEfetuarFormaPgto,
                           [S_Forma_de_Pagamento, EasyTEFDiscado.valoresCartoes[i]]);
                           end//for
              else EasyTEFDiscado.tratarCupomFiscal(tmeEfetuarFormaPgto,
                          [S_Forma_de_Pagamento, FormatFloat('#,##0.00', valorTotalCartao)]);
              end;//if pgtoComCartao
        end;

        if vCod_DAV > 0 //Buscou DAV - Requisito para PAF-ECF
        then s_Registro_DAV:='DAV N '+StrZero(vCod_DAV,10)
        else s_Registro_DAV:='';

        if s_Registro_DAV=''
        then s_mensagem_promocional:=sMsgPDV
        else s_mensagem_promocional:=sMsgPDV+#13#10+s_Registro_DAV;

        if (s_nome_consumidor <> '')
        then s_mensagem_promocional:=s_mensagem_promocional+#13#10+
                                    'Cliente.: '+S_Nome_Consumidor+#13#10+
                                    'Cnpj/Cpf: '+S_CPF_ou_CNPJ+' IE/Rg: '+S_RG_IE+#13#10+
                                    'Endereço: '+S_Endereco+#13#10+
                                    'Cidade..: '+S_Cidade+' '+S_UF+' '+S_Cep;

        s_mensagem_promocional:=s_mensagem_promocional+#13#10+FrmPrincipal.Mensagem;

        EasyTEFDiscado.tratarCupomFiscal(tmeTerminarFechamentoCupom,[s_mensagem_promocional]);

        // se houve consulta de cheque no serasa e se foi aprovada, existe cupom
        // TEF a ser impresso
        with dadosConsultaCheque
        do if houveConsulta and consultaOk
        then begin
            // forma de pagamento que será passada para o comprovante não fiscal
            // vinculado
            TFormaPgto.Locate('COD_PGTO',2,[]);//Forma de Pgto Cheque
            S_Forma_de_Pagamento:=TFormaPgtoTIPO.Value;
            valorPgto := FormatFloat('#,##0.00', valor);
            EasyTEFDiscado.tratarConsultaCheque(cupomTEF, nomeRede, nsu, finalizacao,
                                                docFiscalVinculado);
            end;//if

        valorPgto := FormatFloat('#,##0.00', valorTotalCartao);

        // imprime o(s) cupom(s) TEF na ECF após o fechamento do cupom fiscal
        if (pgtComCartao = 'S') and (EasyTEFDiscado.numeroDeCartoes = 1)
        then EasyTEFDiscado.imprimirCupomECF(EasyTEFDiscado.imagemCupomTef, True, True)
        else if (pgtComCartao = 'S') and (EasyTEFDiscado.multiplosCartoes)
        then EasyTEFDiscado.imprimirCuponsECF;

        GravaDadosDocECF('RV');

        vGravaBancodeDados:=True;

     end;//with
end;

{procedure TFfechamentovenda_tef.Concede_Desc_Maximo(Sender: TObject);
var
   vValorMinimo, vDescMax : Currency;
begin
     vValorMinimo:=0;
     DM.TPDV.DisableControls;
     DM.TPDV.First;
     While not DM.TPDV.Eof
     do begin
        if DM.TPDVCANCELADO.AsString='N'
        then begin
             if DM.TPDVP_VISTA.AsCurrency > 0
             then begin
                  vDescMax:=(DM.TPDVP_VISTA.AsCurrency*DM.TPDVPERC_DESC.AsCurrency)/100;
                  vValorMinimo:=vValorMinimo+((DM.TPDVP_VISTA.AsCurrency*DM.TPDVQTDE.AsCurrency)-vDescMax)
                  end
             else vValorMinimo:=vValorMinimo+DM.TPDVVL_TOTAL.AsCurrency;     
             end;
        DM.TPDV.Next;     
        end;
    DM.TPDV.EnableControls;
    if Confirma('CONFIRMA UM DESCONTO DE R$:'+FormatFloat('#####0.00',ESubTotal.Value-vValorMinimo)+' ?')=mryes
    then begin
         vConcedido_Desconto:=True;
         ETotalLiquido.Value:=vValorMinimo;
         vDesconto:=ESubTotal.Value-ETotalLiquido.Value;
         end;
end;}

procedure Tffechamentovenda_tef.GravaFechamentoLocal;
var
   nPode_Fechar : Boolean;
begin
    if TFormaPgto.Locate('COD_PGTO',2,[])//Cheques
    then begin
         if FrmPrincipal.Tef_Utilizado='Discado'
         then begin
              Consultou_Cheque:=False;
              if Confirma('Deseja realizar a Consulta Garantia de Cheque?')=mrYes
              then ConsultarCheque;
              Application.ProcessMessages;
              end;
         end;

    AC;
    if (Consultou_Cheque)and(Aprovou_Cheque)
    then nPode_Fechar:=True
    else if (Consultou_Cheque)and(Aprovou_Cheque=False)
    then nPode_Fechar:=False
    else if (Consultou_Cheque=False)and(Aprovou_Cheque=False)
    then nPode_Fechar:=True;

    if nPode_Fechar
    then begin
          vGravaBancodeDados:=False;

          Mostra('Finalizando a Venda. Aguarde!!!');

          EncerrarVenda;//Procedimentos do Componente EasyTEF

          Aciona_Gaveta;
          Imprimi_Comprovante_Nao_Fiscal_Vinculado;

          if vGravaBancodeDados//Se não houve nenhum erro então grava no banco de dados local
          then begin           // e depois no banco de dados Remoto se for o caso
                if Cancelou_Transacao_TEF
                then Exit;

                Verifica_Impressao_Doc_Nao_Fiscal;

                Atualiza_GrandeTotal;

                Mostra('Gravando informações no Banco Local. Aguarde!');
                AC;
              Try
                TD.TransactionId := 1;
                TD.IsolationLevel := xilREADCOMMITTED;
                if not DM.SQLConnectionLocal.InTransaction
                then DM.SQLConnectionLocal.StartTransaction(TD);

                DM.TVendaLocal.Close;
                DM.TVendaLocal.Params[0].AsInteger:=-1;
                DM.TVendaLocal.Open;
                DM.TVendaLocal.Append;
                DM.TVendaLocalDATA.AsDateTime:=Date;
                DM.TVendaLocalHORA.AsDateTime:=Time;
                DM.TVendaLocalNUMERO_ECF.AsString:=DM.TPDVNUMERO_ECF.AsString;
                DM.TVendaLocalNUMERO_CUPOM.AsInteger:=DM.TPDVNUMERO_CUPOM.AsInteger;
                DM.TVendaLocalNUM_CCF_CUPOM.AsInteger:=DM.TPDVNUM_CCF_CUPOM.AsInteger;
                DM.TVendaLocalCOD_CLIENTE.AsInteger:=vCodCliente;
                DM.TVendaLocalCOD_OPERADOR.AsInteger:=n_Usuario;
                DM.TVendaLocalCOD_VENDEDOR.AsInteger:=n_vinculo_vendedor;
                DM.TVendaLocalSUBTOTAL.AsCurrency:=ESubTotal.Value;
                DM.TVendaLocalACRESCIMO.AsCurrency:=vAcrescimo;
                DM.TVendaLocalPERC_ACRESCIMO.AsCurrency:=vPercAcrescimo;
                DM.TVendaLocalDESCONTO.AsCurrency:=vDesconto;
                DM.TVendaLocalPERC_DESCONTO.AsCurrency:=vPercDesconto;
                DM.TVendaLocalTOTAL.AsCurrency:=ETotalLiquido.Value;
                if Nr_Transacao_Tef > 0 // Houve Transação TEF, e foi aprovada
                then begin
                     DM.TVendaLocalCOD_ADM_CARTAO.AsInteger:=Cod_Adm_Cartao;
                     DM.TVendaLocalNUMERO_CARTOES.AsInteger:=1;
                     DM.TVendaLocalCARTAO_DEB_CRED.AsString:=Usou_Cartao_Deb_Cred;
                     DM.TVendaLocalNUM_TRANSACAO_TEF.AsInteger:=Nr_Transacao_Tef;
                     DM.TVendaLocalNOME_REDE_TEF.AsString:=EasyTEFDiscado.valorCampo010_000;
                     DM.TVendaLocalNUM_TRANS_NSU_TEF.AsString:=EasyTEFDiscado.valorCampo012_000;
                     DM.TVendaLocalDATA_TRANS_TEF.AsDateTime:=EasyTEFDiscado.valorCampo022_000;
                     DM.TVendaLocalHORA_TRANS_TEF.AsDateTime:=EasyTEFDiscado.valorCampo023_000;

                     //nValorTotal:=DM.TVendaLocalCARTAO.AsCurrency;
                     //sNome_Rede:=DM.TVendaLocalNOME_REDE_TEF.AsString;
                     //sNum_Trans_NSU:=DM.TVendaLocalNUM_TRANSACAO_TEF.AsString;
                     //dData_Trans:=DM.TVendaLocalDATA_TRANS_TEF.AsDateTime;
                     //dHora_Trans:=DM.TVendaLocalHORA_TRANS_TEF.AsDateTime;
                     end;
                DM.TVendaLocalNUM_FABRICACAO_ECF.AsString:=DM.TPDVNUM_FABRICAO_ECF.Value;
                DM.TVendaLocalMF_ADICIONAL.Value:=DM.TPDVMF_ADICIONAL.Value;
                DM.TVendaLocalTIPO_ECF.AsString:=DM.TPDVTIPO_ECF.Value;
                DM.TVendaLocalMARCA_ECF.AsString:=DM.TPDVMARCA_ECF.Value;
                DM.TVendaLocalMODELO_ECF.AsString:=DM.TPDVMODELO_ECF.Value;

                TFormaPgto.First;
                While not TFormaPgto.Eof
                do begin
                    if TFormaPgtoCod_Pgto.Value=1
                    then DM.TVendaLocalDINHEIRO.AsCurrency:=TFormaPgtoValor.Value
                    else if TFormaPgtoCod_Pgto.Value=2
                    then DM.TVendaLocalCHEQUE.AsCurrency:=TFormaPgtoValor.Value
                    else if TFormaPgtoCod_Pgto.Value=3
                    then DM.TVendaLocalCARTAO.AsCurrency:=TFormaPgtoValor.Value
                    else if TFormaPgtoCod_Pgto.Value=4
                    then DM.TVendaLocalTICKET.AsCurrency:=TFormaPgtoValor.Value
                    else if TFormaPgtoCod_Pgto.Value=5
                    then DM.TVendaLocalCREDIARIO.AsCurrency:=TFormaPgtoValor.Value
                    else if TFormaPgtoCod_Pgto.Value=6
                    then DM.TVendaLocalCHEQUE_PRE.AsCurrency:=TFormaPgtoValor.Value;
                    DM.TVendaLocalTROCO.AsCurrency:=ETroco.Value;

                    if DM.TVendaLocalCREDIARIO.AsCurrency > 0
                    then begin
                         DM.TVendaLocalTIPO.AsString:='P';
                         DM.TVendaLocalNUMPGTO.AsInteger:=StrToInt(FloatToStr(FCrediario.ENumParcelas.Value));
                         end
                    else begin
                         DM.TVendaLocalTIPO.AsString:='V';
                         DM.TVendaLocalNUMPGTO.AsInteger:=1;
                         end;
                    TFormaPgto.Next;
                end;    
                DM.TVendaLocalCUPOM_CANCELADO.AsString:='N';
                if Trim(sNum_Caixa)<>''
                then iNum_Caixa:=StrToInt(sNum_Caixa)
                else iNum_Caixa:=0;
                DM.TVendaLocalPDV.AsString:=StrZero(iNum_Caixa,3);
                if nBuscou_DAV
                then DM.TVendaLocalCOD_DAV.AsInteger:=vCod_DAV;
                if Alltrim(sGNF)<>''
                then DM.TVendaLocalCONTADOR_GNF.AsInteger:=StrToInt(sGNF)
                else DM.TVendaLocalCONTADOR_GNF.AsInteger:=0;

                vCont:=0;
                nBase_Icms:=0;
                nValor_Icms:=0;
                DM.TPDV.DisableControls;
                DM.TPDV.First;
                While not DM.TPDV.Eof
                do begin
                   if DM.TPDVCANCELADO.AsString='N'
                   then begin
                         Inc(vCont);
                         DM.TItemVendaLocal.Append;
                         DM.TItemVendaLocalCONTROLE.AsInteger:=vCont;
                         DM.TItemVendaLocalNUMERO_ECF.AsString:=DM.TPDVNUMERO_ECF.AsString;
                         DM.TItemVendaLocalNUMERO_CUPOM.AsInteger:=DM.TPDVNUMERO_CUPOM.AsInteger;
                         DM.TItemVendaLocalITEM.AsInteger:=DM.TPDVITEN.AsInteger;
                         DM.TItemVendaLocalCOD_PRODUTO.AsInteger:=DM.TPDVCODPRODUTO.AsInteger;
                         DM.TItemVendaLocalDESCRICAO.AsString:=DM.TPDVDESCRICAO.AsString;
                         DM.TItemVendaLocalQUANTIDADE.AsCurrency:=DM.TPDVQTDE.AsCurrency;
                         DM.TItemVendaLocalUNIDADE.AsString:=DM.TPDVMED.AsString;
                         DM.TItemVendaLocalVL_UNIT_BRUTO.AsCurrency:=DM.TPDVVL_UNITARIO.AsCurrency;
                         DM.TItemVendaLocalVL_TOTAL_BRUTO.AsCurrency:=DM.TPDVVL_TOTAL.AsCurrency;
                         DM.TItemVendaLocalPERC_DESCONTO.AsCurrency:=0;
                         DM.TItemVendaLocalVALOR_DESCONTO.AsCurrency:=0;
                         DM.TItemVendaLocalPERC_ACRESCIMO.AsCurrency:=0;
                         DM.TItemVendaLocalVALOR_ACRESCIMO.AsCurrency:=0;
                         if DM.TVendaLocalPERC_DESCONTO.AsCurrency > 0
                         then begin
                              DM.TItemVendaLocalVL_UNITARIO.AsCurrency:=DM.TPDVVL_UNITARIO.AsCurrency - ((DM.TPDVVL_UNITARIO.AsCurrency * DM.TVendaLocalPERC_DESCONTO.AsCurrency)/100);
                              DM.TItemVendaLocalVL_TOTAL.AsCurrency:=(DM.TItemVendaLocalVL_UNITARIO.AsCurrency * DM.TItemVendaLocalQUANTIDADE.AsCurrency);
                              DM.TItemVendaLocalPERC_DESCONTO.AsCurrency:=DM.TVendaLocalPERC_DESCONTO.AsCurrency;
                              DM.TItemVendaLocalVALOR_DESCONTO.AsCurrency:=DM.TItemVendaLocalVL_UNIT_BRUTO.AsCurrency - DM.TItemVendaLocalVL_UNITARIO.AsCurrency;
                              end
                         else if DM.TVendaLocalPERC_ACRESCIMO.AsCurrency > 0
                         then begin
                              DM.TItemVendaLocalVL_UNITARIO.AsCurrency:=DM.TPDVVL_UNITARIO.AsCurrency + ((DM.TPDVVL_UNITARIO.AsCurrency * DM.TVendaLocalPERC_ACRESCIMO.AsCurrency)/100);
                              DM.TItemVendaLocalVL_TOTAL.AsCurrency:=(DM.TItemVendaLocalVL_UNITARIO.AsCurrency * DM.TItemVendaLocalQUANTIDADE.AsCurrency);
                              DM.TItemVendaLocalPERC_ACRESCIMO.AsCurrency:=DM.TVendaLocalPERC_ACRESCIMO.AsCurrency;
                              DM.TItemVendaLocalVALOR_ACRESCIMO.AsCurrency:=DM.TItemVendaLocalVL_UNITARIO.AsCurrency - DM.TItemVendaLocalVL_UNIT_BRUTO.AsCurrency; 
                              end
                         else begin
                              DM.TItemVendaLocalVL_UNITARIO.AsCurrency:=DM.TPDVVL_UNITARIO.AsCurrency;
                              DM.TItemVendaLocalVL_TOTAL.AsCurrency:=DM.TPDVVL_TOTAL.AsCurrency;
                              end;

                         //Se houver Desconto/Acréscimo genérico no item
                         if not DM.TDescAcresc.IsEmpty
                         then begin
                              if DM.TDescAcresc.Locate('CODPRODUTO',DM.TItemVendaLocalCOD_PRODUTO.AsInteger,[])
                              then begin
                                   if DM.TDescAcrescDESC_ACRESC.Value='D'//Desconto
                                   then begin
                                        DM.TItemVendaLocalPERC_DESCONTO.AsCurrency:=DM.TItemVendaLocalPERC_DESCONTO.AsCurrency + DM.TDescAcrescPERC_VALOR.AsCurrency;
                                        DM.TItemVendaLocalVALOR_DESCONTO.AsCurrency:=DM.TItemVendaLocalVALOR_DESCONTO.AsCurrency + DM.TDescAcrescVALOR.AsCurrency;
                                        DM.TItemVendaLocalVL_TOTAL.AsCurrency:=DM.TItemVendaLocalVL_TOTAL.AsCurrency - DM.TDescAcrescVALOR.AsCurrency;
                                        DM.TItemVendaLocalVL_UNITARIO.AsCurrency:=(DM.TItemVendaLocalVL_TOTAL.AsCurrency / DM.TItemVendaLocalQUANTIDADE.AsCurrency);
                                        end
                                   else if DM.TDescAcrescDESC_ACRESC.Value='A'//Acréscimo
                                   then begin
                                        DM.TItemVendaLocalPERC_ACRESCIMO.AsCurrency:=DM.TItemVendaLocalPERC_ACRESCIMO.AsCurrency + DM.TDescAcrescPERC_VALOR.AsCurrency;
                                        DM.TItemVendaLocalVALOR_ACRESCIMO.AsCurrency:=DM.TItemVendaLocalVALOR_ACRESCIMO.AsCurrency + DM.TDescAcrescVALOR.AsCurrency;
                                        DM.TItemVendaLocalVL_TOTAL.AsCurrency:=DM.TItemVendaLocalVL_TOTAL.AsCurrency + DM.TDescAcrescVALOR.AsCurrency;
                                        DM.TItemVendaLocalVL_UNITARIO.AsCurrency:=(DM.TItemVendaLocalVL_TOTAL.AsCurrency / DM.TItemVendaLocalQUANTIDADE.AsCurrency);
                                        end;
                                   end;
                               end;

                     {    DM.TItemVendaLocalST.AsString:=DM.TPDVST.Value;
                         if DM.TTotalizadores_ECF.Locate('VALOR',DM.TPDVST.Value,[])
                         then DM.TItemVendaLocalCOD_TOTALIZADOR_PARCIAL.Value:=DM.TTotalizadores_ECFALIQUOTA.Value
                         else DM.TItemVendaLocalCOD_TOTALIZADOR_PARCIAL.Value:='00000';
                      }
                         DM.TItemVendaLocalCOD_TOTALIZADOR_PARCIAL.Value:='00000' ;
                         ////////////////////////////////////////////////////////////
                         DM.TItemVendaLocalALIQUOTA.AsCurrency:=DM.TPDVALIQUOTA.AsCurrency;
                         DM.TItemVendaLocalBASE_ICMS.AsCurrency:=DM.TItemVendaLocalVL_TOTAL.AsCurrency;
                         DM.TItemVendaLocalVALOR_ICMS.AsCurrency:=(DM.TItemVendaLocalVL_TOTAL.AsCurrency * DM.TItemVendaLocalALIQUOTA.AsCurrency)/100;
                         if DM.TItemVendaLocalALIQUOTA.AsCurrency > 0
                         then begin
                              nBase_Icms:=nBase_Icms + DM.TItemVendaLocalBASE_ICMS.AsCurrency;
                              nValor_Icms:=nValor_Icms + DM.TItemVendaLocalVALOR_ICMS.AsCurrency;
                              end;
                         DM.TItemVendaLocalPERC_IPI.AsCurrency:=DM.TPDVPERC_IPI.Value;
                         DM.TItemVendaLocalTABELA.AsString:=DM.TPDVTABELA.AsString;
                         DM.TItemVendaLocalCST.Value:=DM.TPDVCST.Value;
                         DM.TItemVendaLocal.Post;

                         if FrmPrincipal.BaixaEstoque='S'
                         then begin
                              DM.TBaixaEstoqueLocal.Close;
                              DM.TBaixaEstoqueLocal.Params[0].AsInteger:=DM.TPDVCODPRODUTO.AsInteger;
                              DM.TBaixaEstoqueLocal.Open;
                              if DM.TBaixaEstoqueLocal.RecordCount > 0
                              then begin
                                   DM.TBaixaEstoqueLocal.Edit;
                                   DM.TBaixaEstoqueLocalQTDE.AsCurrency:=DM.TBaixaEstoqueLocalQTDE.AsCurrency-DM.TPDVQTDE.AsCurrency;
                                   DM.TBaixaEstoqueLocalDATAULTVENDA.AsDateTime:=Now;
                                   DM.TBaixaEstoqueLocal.Post;
                                   DM.TBaixaEstoqueLocal.ApplyUpdates(-1);
                                   end;
                              end;
                         end;
                   DM.TPDV.Next;
                   end;
                DM.TPDV.EnableControls;

                //Arredondamento de Valores quando há desconto ou acréscimo
                if (DM.TVendaLocalTOTAL.AsCurrency <> DM.TItemVendaLocalSUM_TOTAL.Value)
                then begin
                     DM.TItemVendaLocal.Edit;
                     if (DM.TItemVendaLocalSUM_TOTAL.Value < DM.TVendaLocalTOTAL.AsCurrency)
                     then begin
                          nDif_Valor:=DM.TVendaLocalTOTAL.AsCurrency - DM.TItemVendaLocalSUM_TOTAL.Value;
                          DM.TItemVendaLocalVL_UNITARIO.AsCurrency:=DM.TItemVendaLocalVL_UNITARIO.AsCurrency + nDif_Valor;
                          DM.TItemVendaLocalVL_TOTAL.AsCurrency:=(DM.TItemVendaLocalVL_UNITARIO.AsCurrency * DM.TItemVendaLocalQUANTIDADE.AsCurrency);
                          end
                     else if (DM.TItemVendaLocalSUM_TOTAL.Value > DM.TVendaLocalTOTAL.AsCurrency)
                     then begin
                          nDif_Valor:=DM.TItemVendaLocalSUM_TOTAL.Value - DM.TVendaLocalTOTAL.AsCurrency;
                          DM.TItemVendaLocalVL_UNITARIO.AsCurrency:=DM.TItemVendaLocalVL_UNITARIO.AsCurrency - nDif_Valor;
                          DM.TItemVendaLocalVL_TOTAL.AsCurrency:=(DM.TItemVendaLocalVL_UNITARIO.AsCurrency * DM.TItemVendaLocalQUANTIDADE.AsCurrency);
                          end;
                     DM.TItemVendaLocal.Post;
                     end;
                DM.TVendaLocalBASE_ICMS.AsCurrency:=nBase_Icms;
                DM.TVendaLocalVALOR_ICMS.AsCurrency:=nValor_Icms;
                DM.TVendaLocal.Post;
                DM.TVendaLocal.ApplyUpdates(-1);

                if not DM.TPDVGrade.IsEmpty
                then begin
                     DM.TPDVGrade.First;
                     While not DM.TPDVGrade.Eof
                     do begin
                        DM.TVendaGradeLocal.Close;
                        DM.TVendaGradeLocal.Params[0].AsInteger:=-1;
                        DM.TVendaGradeLocal.Open;
                        DM.TVendaGradeLocal.Append;
                        DM.TVendaGradeLocalCOD_VENDA.AsInteger:=DM.TVendaLocalCODIGO.AsInteger;
                        DM.TVendaGradeLocalCOD_PRODUTO.AsInteger:=DM.TPDVGradeCOD_PRODUTO.Value;
                        DM.TVendaGradeLocalCOD_GRADE.AsInteger:=DM.TPDVGradeCOD_GRADE.Value;
                        DM.TVendaGradeLocalQTDE.AsCurrency:=DM.TPDVGradeQTDE.Value;
                        DM.TVendaGradeLocalCOD_COR.AsInteger:=DM.TPDVGradeCOD_COR.Value;
                        DM.TVendaGradeLocalCOD_TAMANHO.AsInteger:=DM.TPDVGradeCOD_TAMANHO.Value;
                        DM.TVendaGradeLocal.Post;
                        DM.TVendaGradeLocal.ApplyUpdates(-1);

                        if FrmPrincipal.BaixaEstoque='S'
                        then begin
                              DM.TBaixaGradeLocal.Close;
                              DM.TBaixaGradeLocal.Params[0].AsInteger:=DM.TPDVGradeCOD_GRADE.AsInteger;
                              DM.TBaixaGradeLocal.Open;
                              DM.TBaixaGradeLocal.Edit;
                              DM.TBaixaGradeLocalQTDE.AsCurrency:=DM.TBaixaGradeLocalQTDE.AsCurrency-DM.TPDVGradeQTDE.AsCurrency;
                              DM.TBaixaGradeLocal.Post;
                              DM.TBaixaGradeLocal.ApplyUpdates(-1);
                              end;
                        DM.TPDVGrade.Next;
                        end;
                        DM.TBaixaGradeLocal.Close;
                        end;

                //Meios de Pagamentos - Crie este rotina para atender o PAF-ECF
                TFormaPgto.First;
                While not TFormaPgto.Eof
                do begin
                   DM.TMeiosPgtos.Close;
                   DM.TMeiosPgtos.Params[0].AsInteger:=-1;
                   DM.TMeiosPgtos.Open;
                   DM.TMeiosPgtos.Append;
                   DM.TMeiosPgtosCOD_VENDA.AsInteger:=DM.TVendaLocalCODIGO.AsInteger;
                   DM.TMeiosPgtosDESCR_PGTO.Value:=TFormaPgtoTIPO.Value;
                   DM.TMeiosPgtosVALOR.AsCurrency:=TFormaPgtoVALOR.Value;
                   DM.TMeiosPgtosTROCO.AsCurrency:=TFormaPgtoTROCO.Value;
                   DM.TMeiosPgtos.Post;
                   DM.TMeiosPgtos.ApplyUpdates(-1);
                   TFormaPgto.Next;
                   end;

                if DM.SQLConnectionLocal.InTransaction
                then DM.SQLConnectionLocal.Commit(TD);
                Fechou:='SIM';
                Libera;

                if (ServidorRemoto='ON')and(nBuscou_DAV=False)
                then begin
                     if FrmPrincipal.Grava_Retaguarda='S'
                     then GravaFechamentoRemoto;
                     end
                else if (ServidorRemoto='ON')and(nBuscou_DAV)
                then begin
                     if FrmPrincipal.Grava_Retaguarda='S'
                     then begin
                          if nFlagDAV=0
                          then begin
                               DM.TOrcDAV.Close;
                               DM.TOrcDAV.Params[0].AsInteger:=vCod_DAV;
                               DM.TOrcDAV.Open;
                               DM.TOrcDAV.Edit;
                               DM.TOrcDAVSITUACAO.Value:='F';
                               DM.TOrcDAVNUMERO_CUPOM.Value:=DM.TPDVNUMERO_CUPOM.Value;
                               DM.TOrcDAVNUMERO_SERIE_ECF.Value:=DM.TPDVNUMERO_ECF.Value;
                               DM.TOrcDAVNUMERO_CAIXA.Value:=StrToInt(sNum_Caixa);
                               DM.TOrcDAV.Post;
                               DM.TOrcDAV.ApplyUpdates(-1);

                               GravaFechamentoRemoto;
                               end
                          else if nFlagDAV=1
                          then begin
                               DM.TVenda.Close;
                               DM.TVenda.Params[0].AsInteger:=nNumFlagDAV;
                               DM.TVenda.Open;
                               DM.TVenda.Edit;
                               DM.TVendaNUMERO_ECF.AsString:=DM.TPDVNUMERO_ECF.AsString;
                               DM.TVendaNUMERO_CUPOM.AsInteger:=DM.TPDVNUMERO_CUPOM.AsInteger;
                               DM.TVendaNUM_CCF_CUPOM.AsInteger:=DM.TPDVNUM_CCF_CUPOM.AsInteger;
                               DM.TVendaCOD_OPERADOR_PDV.AsInteger:=n_Usuario;
                               DM.TVendaPDV.AsString:=sNum_Caixa;
                               DM.TVendaCODIGO_VENDA_PDV.AsInteger:=DM.TVendaLocalCODIGO.AsInteger;
                               DM.TVendaIMPRIMIU_COO_ATRAVES_DAV.Value:='S';
                               DM.TVenda.Post;
                               DM.TVenda.ApplyUpdates(-1);
                               end;//If nFlagDAV
                          end;
                     end;
              Except
                on E: exception
                do begin
                   if DM.SQLConnectionLocal.InTransaction
                   then DM.SQLConnectionLocal.RollBack(TD);

                   Libera;
                   DC;

                   InformaError('Não possivél gravar no Banco de dados Local!');
                   InformaError('Erro Interno: '+(E.Message));
                   raise;
                   end;
               end;
          end;
      end
      else begin//If nPode_Fechar
           Informa('A Venda não foi Finalizada!');
           Close;
           end;
end;

procedure Tffechamentovenda_tef.GravaFechamentoRemoto;
var
   vQtdeAnterior, vTotalCusto : Currency;
begin
      Mostra('Gravando informações no banco remoto! Aguarde');
      Try
        vTotalCusto:=0;
        TD.TransactionId := 1;
        TD.IsolationLevel := xilREADCOMMITTED;
        if not DM.SQLConnectionRetaguarda.InTransaction
        then DM.SQLConnectionRetaguarda.StartTransaction(TD);

        DM.TVenda.Close;
        DM.TVenda.Params[0].AsInteger:=-1;
        DM.TVenda.Open;
        DM.TVenda.Append;
        DM.TVendaDATAEMISSAO.AsDateTime:=DM.TVendaLocalDATA.AsDateTime;
        DM.TVendaSAIDA.AsDateTime:=DM.TVendaLocalHORA.AsDateTime;
        DM.TVendaNUMERO_ECF.AsString:=DM.TPDVNUMERO_ECF.AsString;
        DM.TVendaNUMERO_CUPOM.AsInteger:=DM.TPDVNUMERO_CUPOM.AsInteger;
        DM.TVendaNUM_CCF_CUPOM.AsInteger:=DM.TPDVNUM_CCF_CUPOM.AsInteger;
        DM.TVendaCODCLIENTE.AsInteger:=vCodCliente;
        DM.TVendaCOD_OPERADOR_PDV.AsInteger:=n_Usuario;
        DM.TVendaCODVENDEDOR1.AsInteger:=n_vinculo_vendedor;
        DM.TVendaCOMISSAO1.AsCurrency:=100;
        DM.TVendaSUBTOTAL.AsCurrency:=ESubTotal.Value;
        DM.TVendaFINANCEIRO.AsCurrency:=vAcrescimo;
        DM.TVendaPERCFINANCEIRO.AsCurrency:=vPercAcrescimo;
        DM.TVendaDESCONTO.AsCurrency:=vDesconto;
        DM.TVendaPERCDESCONTO.AsCurrency:=vPercDesconto;
        DM.TVendaTOTAL.AsCurrency:=ETotalLiquido.Value;
        DM.TVendaDINHEIRO.AsCurrency:=DM.TVendaLocalDINHEIRO.AsCurrency;
        DM.TVendaCHEQUE.AsCurrency:=DM.TVendaLocalCHEQUE.AsCurrency;
        DM.TVendaCHEQUE_PRE.AsCurrency:=DM.TVendaLocalCHEQUE_PRE.AsCurrency;
        DM.TVendaCREDIARIO.AsCurrency:=DM.TVendaLocalCREDIARIO.AsCurrency;
        DM.TVendaCARTAO.AsCurrency:=DM.TVendaLocalCARTAO.AsCurrency;
        DM.TVendaTICKET.AsCurrency:=DM.TVendaLocalTICKET.AsCurrency;
        DM.TVendaTROCO.AsCurrency:=ETroco.Value;
        if DM.TVendaCREDIARIO.AsCurrency > 0
        then begin
             DM.TVendaTIPO.AsString:='P';
             DM.TVendaNUMPGTO.AsInteger:=StrToInt(FloatToStr(FCrediario.ENumParcelas.Value));
             end
        else begin
             DM.TVendaTIPO.AsString:='V';
             DM.TVendaNUMPGTO.AsInteger:=1;
             end;
        DM.TVendaCANCELADO.AsString:='N';
        if Trim(sNum_Caixa)<>''
        then iNum_Caixa:=StrToInt(sNum_Caixa)
        else iNum_Caixa:=0;
        DM.TVendaPDV.AsString:=StrZero(iNum_Caixa,3);
        DM.TVendaENTREGAFUTURA.AsString:='N';
        DM.TVendaENTREGACOMPLETA.AsString:='N';
        DM.TVendaSERVICO.AsString:='N';
        DM.TVendaCODIGO_VENDA_PDV.AsInteger:=DM.TVendaLocalCODIGO.AsInteger;
        DM.TVendaCODPORTADOR.AsInteger:=1;
        DM.TVendaMODELO_NF.Value:='02';
        DM.TVendaSERIE_NF.Value:='2D';

        vCont:=0;
        DM.TPDV.DisableControls;
        DM.TPDV.First;
        While not DM.TPDV.Eof
        do begin
           if DM.TPDVCANCELADO.AsString='N'
           then begin
                Inc(vCont);
                DM.TItemVenda.Append;
                DM.TItemVendaControle.AsInteger:=vCont;
                DM.TItemVendaDATAEMISSAO.AsDateTime:=DM.TVendaDATAEMISSAO.AsDateTime;
                DM.TItemVendaNUMERO_ECF.AsString:=DM.TVendaNUMERO_ECF.AsString;
                DM.TItemVendaNUMERO_CUPOM.AsInteger:=DM.TVendaNUMERO_CUPOM.AsInteger;
                DM.TItemVendaTIPO.AsString:=DM.TVendaTIPO.AsString;
                DM.TItemVendaCODCLIENTE.AsInteger:=DM.TVendaCODCLIENTE.AsInteger;
                DM.TItemVendaCODVENDEDOR1.AsInteger:=DM.TVendaCODVENDEDOR1.AsInteger;
                DM.TItemVendaCOMISSAO1.AsCurrency:=DM.TVendaCOMISSAO1.AsCurrency;
                DM.TItemVendaITEM.AsInteger:=DM.TPDVITEN.AsInteger;
                DM.TItemVendaCODPRODUTO.AsInteger:=DM.TPDVCODPRODUTO.AsInteger;
                DM.TItemVendaDESCRICAO.AsString:=DM.TPDVDESCRICAO.AsString;
                DM.TItemVendaQTDE.AsCurrency:=DM.TPDVQTDE.Value;
                DM.TItemVendaPRECOFIXO.AsCurrency:=DM.TPDVVL_UNITARIO.Value;
                DM.TItemVendaVALOR_UNIT_BRUTO.AsCurrency:=DM.TPDVVL_UNITARIO.AsCurrency;
                DM.TItemVendaVALOR_TOTAL_BRUTO.AsCurrency:=DM.TPDVVL_TOTAL.AsCurrency;
                DM.TItemVendaPERC_DESCONTO.AsCurrency:=0;
                DM.TItemVendaVALOR_DESCONTO.AsCurrency:=0;
                DM.TItemVendaPERC_ACRESCIMO.AsCurrency:=0;
                DM.TItemVendaVALOR_ACRESCIMO.AsCurrency:=0;
                if DM.TVendaPERCDESCONTO.AsCurrency > 0
                then begin
                     DM.TItemVendaVENDIDO.AsCurrency:=DM.TPDVVL_UNITARIO.AsCurrency - ((DM.TPDVVL_UNITARIO.AsCurrency * DM.TVendaPERCDESCONTO.AsCurrency)/100);
                     DM.TItemVendaTOTALITEN.AsCurrency:=(DM.TItemVendaVENDIDO.AsCurrency * DM.TItemVendaQTDE.AsCurrency);
                     DM.TItemVendaPERC_DESCONTO.AsCurrency:=DM.TVendaPERCDESCONTO.AsCurrency;
                     DM.TItemVendaVALOR_DESCONTO.AsCurrency:=DM.TItemVendaVALOR_UNIT_BRUTO.AsCurrency - DM.TItemVendaVENDIDO.AsCurrency;
                     end
                else if DM.TVendaPERCFINANCEIRO.AsCurrency > 0
                then begin
                     DM.TItemVendaVENDIDO.AsCurrency:=DM.TPDVVL_UNITARIO.AsCurrency + ((DM.TPDVVL_UNITARIO.AsCurrency * DM.TVendaPERCFINANCEIRO.AsCurrency)/100);
                     DM.TItemVendaTOTALITEN.AsCurrency:=(DM.TItemVendaVENDIDO.AsCurrency * DM.TItemVendaQTDE.AsCurrency);
                     DM.TItemVendaPERC_ACRESCIMO.AsCurrency:=DM.TVendaPERCFINANCEIRO.AsCurrency;
                     DM.TItemVendaVALOR_ACRESCIMO.AsCurrency:=DM.TItemVendaVENDIDO.AsCurrency - DM.TItemVendaVALOR_UNIT_BRUTO.AsCurrency;
                     end
                else begin
                     DM.TItemVendaVENDIDO.AsCurrency:=DM.TPDVVL_UNITARIO.AsCurrency;
                     DM.TItemVendaTOTALITEN.AsCurrency:=DM.TPDVVL_TOTAL.AsCurrency;
                     end;

                 //Se houver Desconto/Acréscimo genérico no item
                 if not DM.TDescAcresc.IsEmpty
                 then begin
                      if DM.TDescAcresc.Locate('CODPRODUTO',DM.TItemVendaCODPRODUTO.AsInteger,[])
                      then begin
                           if DM.TDescAcrescDESC_ACRESC.Value='D'//Desconto
                           then begin
                                DM.TItemVendaPERC_DESCONTO.AsCurrency:=DM.TItemVendaPERC_DESCONTO.AsCurrency + DM.TDescAcrescPERC_VALOR.AsCurrency;
                                DM.TItemVendaVALOR_DESCONTO.AsCurrency:=DM.TItemVendaVALOR_DESCONTO.AsCurrency + DM.TDescAcrescVALOR.AsCurrency;
                                DM.TItemVendaTOTALITEN.AsCurrency:=DM.TItemVendaTOTALITEN.AsCurrency - DM.TDescAcrescVALOR.AsCurrency;
                                DM.TItemVendaVENDIDO.AsCurrency:=(DM.TItemVendaTOTALITEN.AsCurrency / DM.TItemVendaQTDE.AsCurrency);
                                end
                           else if DM.TDescAcrescDESC_ACRESC.Value='A'//Acréscimo
                           then begin
                                DM.TItemVendaPERC_ACRESCIMO.AsCurrency:=DM.TItemVendaPERC_ACRESCIMO.AsCurrency + DM.TDescAcrescPERC_VALOR.AsCurrency;
                                DM.TItemVendaVALOR_ACRESCIMO.AsCurrency:=DM.TItemVendaVALOR_ACRESCIMO.AsCurrency + DM.TDescAcrescVALOR.AsCurrency;
                                DM.TItemVendaTOTALITEN.AsCurrency:=DM.TItemVendaTOTALITEN.AsCurrency + DM.TDescAcrescVALOR.AsCurrency;
                                DM.TItemVendaVENDIDO.AsCurrency:=(DM.TItemVendaTOTALITEN.AsCurrency / DM.TItemVendaQTDE.AsCurrency);
                                end;
                           end;
                       end;

                DM.TItemVendaST.AsString:=DM.TPDVST.Value;
                DM.TItemVendaALIQUOTA.AsCurrency:=DM.TPDVALIQUOTA.Value;
                DM.TItemVendaBASE_ICMS.AsCurrency:=DM.TItemVendaTOTALITEN.AsCurrency;
                DM.TItemVendaVALOR_ICMS.AsCurrency:=(DM.TItemVendaTOTALITEN.AsCurrency * DM.TItemVendaALIQUOTA.AsCurrency)/100;
                DM.TItemVendaIPI.AsCurrency:=DM.TPDVPERC_IPI.Value;
                DM.TItemVendaTABELA.AsString:=DM.TPDVTABELA.AsString;
                DM.TItemVendaMAODEOBRA.AsString:='N';
                DM.TItemVendaSERVICO.AsString:='N';
                DM.TItemVendaCOMNOTA.AsString:='S';

                DM.TProduto.Close;
                DM.TProduto.Params[0].AsInteger:=DM.TItemVendaCODPRODUTO.AsInteger;
                DM.TProduto.Open;
                DM.TProduto.Edit;
                DM.TProdutoDATAULTVENDA.AsDateTime:=Now;
                DM.TProduto.Post;
                DM.TProduto.ApplyUpdates(-1);

                DM.TItemVendaCUSTOFINAL.AsCurrency:=DM.TProdutoCUSTOFINAL.AsCurrency;
                DM.TItemVendaTOTALCUSTO.AsCurrency:=DM.TProdutoCUSTOFINAL.AsCurrency*DM.TItemVendaQTDE.AsCurrency;
                vTotalCusto:=vTotalCusto+DM.TItemVendaTOTALCUSTO.AsCurrency;
                DM.TItemVendaCODGRUPO.AsInteger:=DM.TProdutoCODGRUPO.AsInteger;
                DM.TItemVendaCODMARCA.AsInteger:=DM.TProdutoCODMARCA.AsInteger;
                DM.TItemVendaCST.Value:=DM.TPDVCST.Value;
                DM.TItemVenda.Post;

                if FrmPrincipal.BaixaEstoque='S'
                then begin
                     vQtdeAnterior:=DM.TProdutoQTDE.AsCurrency;
                     DM.TProduto.Edit;
                     DM.TProdutoQTDE.AsCurrency:=DM.TProdutoQTDE.AsCurrency-DM.TItemVendaQTDE.AsCurrency;
                     DM.TProduto.Post;
                     DM.TProduto.ApplyUpdates(-1);

                     DM.TRota.Close;
                     DM.TRota.Params[0].AsInteger:=-1;
                     DM.TRota.Open;
                     DM.TRota.Append;
                     DM.TRotaData.AsDateTime:=DM.TVendaDATAEMISSAO.AsDateTime;
                     DM.TRotaHistorico.AsString:='CUPOM FISCAL DE Nº '+StrZero(DM.TVendaNUMERO_CUPOM.AsInteger,6)+' PDV '+FrmPrincipal.PDVLocal;
                     DM.TRotaCodProduto.AsInteger:=DM.TPDVCODPRODUTO.AsInteger;
                     DM.TRotaAnterior.AsCurrency:=vQtdeAnterior;
                     DM.TRotaSaida.AsCurrency:=DM.TPDVQtde.AsCurrency;
                     DM.TRotaEntrada.AsCurrency:=0;
                     DM.TRota.Post;
                     DM.TRota.ApplyUpdates(-1);
                     end;
                end;
           DM.TPDV.Next;
           end;
          DM.TPDV.EnableControls; 
          //Arredondamento de Valores quando há desconto ou acréscimo
          if (DM.TVendaTOTAL.AsCurrency <> DM.TItemVendaSUM_TOTAL.Value)
          then begin
               DM.TItemVenda.Edit;
               if (DM.TItemVendaSUM_TOTAL.Value < DM.TVendaTOTAL.AsCurrency)
               then begin
                    nDif_Valor:=DM.TVendaTOTAL.AsCurrency - DM.TItemVendaSUM_TOTAL.Value;
                    DM.TItemVendaVENDIDO.AsCurrency:=DM.TItemVendaVENDIDO.AsCurrency + nDif_Valor;
                    DM.TItemVendaTOTALITEN.AsCurrency:=(DM.TItemVendaVENDIDO.AsCurrency * DM.TItemVendaQTDE.AsCurrency);
                    end
               else if (DM.TItemVendaSUM_TOTAL.Value > DM.TVendaTOTAL.AsCurrency)
               then begin
                    nDif_Valor:=DM.TItemVendaSUM_TOTAL.Value - DM.TVendaTOTAL.AsCurrency;
                    DM.TItemVendaVENDIDO.AsCurrency:=DM.TItemVendaVENDIDO.AsCurrency - nDif_Valor;
                    DM.TItemVendaTOTALITEN.AsCurrency:=(DM.TItemVendaVENDIDO.AsCurrency * DM.TItemVendaQTDE.AsCurrency);
                    end;
               DM.TItemVenda.Post;
               end;
        DM.TVendaTOTALCUSTO.AsCurrency:=vTotalCusto;
        DM.TVendaBASE_ICMS.AsCurrency:=nBase_Icms;
        DM.TVendaVALOR_ICMS.AsCurrency:=nValor_Icms;
        DM.TVenda.Post;
        DM.TVenda.ApplyUpdates(-1);

        if not DM.TPDVGrade.IsEmpty
        then begin
             DM.TPDVGrade.First;
             While not DM.TPDVGrade.Eof
             do begin
                DM.TVendaGrade.Close;
                DM.TVendaGrade.Params[0].AsInteger:=-1;
                DM.TVendaGrade.Open;
                DM.TVendaGrade.Append;
                DM.TVendaGradeCOD_VENDA.AsInteger:=DM.TVendaCODVENDA.AsInteger;
                DM.TVendaGradeCOD_PRODUTO.AsInteger:=DM.TPDVGradeCOD_PRODUTO.Value;
                DM.TVendaGradeCOD_GRADE.AsInteger:=DM.TPDVGradeCOD_GRADE.Value;
                DM.TVendaGradeQTDE.AsCurrency:=DM.TPDVGradeQTDE.Value;
                DM.TVendaGradeCOD_COR.AsInteger:=DM.TPDVGradeCOD_COR.Value;
                DM.TVendaGradeCOD_TAMANHO.AsInteger:=DM.TPDVGradeCOD_TAMANHO.Value;
                DM.TVendaGrade.Post;
                DM.TVendaGrade.ApplyUpdates(-1);

                if FrmPrincipal.BaixaEstoque='S'
                then begin
                      DM.TBaixaGrade.Close;
                      DM.TBaixaGrade.Params[0].AsInteger:=DM.TPDVGradeCOD_GRADE.AsInteger;
                      DM.TBaixaGrade.Open;
                      DM.TBaixaGrade.Edit;
                      DM.TBaixaGradeQTDE.AsCurrency:=DM.TBaixaGradeQTDE.AsCurrency-DM.TPDVGradeQTDE.AsCurrency;
                      DM.TBaixaGrade.Post;
                      DM.TBaixaGrade.ApplyUpdates(-1);
                      end;
                DM.TPDVGrade.Next;
                end;
                DM.TBaixaGrade.Close;
                end;

        if DM.TVendaCREDIARIO.AsCurrency > 0
        then begin
             With FCrediario
             do begin
                TParcelasCarteira.First;
                While not TParcelasCarteira.Eof
                do begin
                    DM.TReceber.Close;
                    DM.TReceber.Params[0].AsInteger:=-1;
                    DM.TReceber.Open;
                    DM.TReceber.Append;
                    DM.TReceberDocumento.AsString := StrZero(DM.TVendaCodVenda.Value,6);
                    DM.TReceberNumParcela.AsString := TParcelasCarteiraParcela.AsString;
                    DM.TReceberCodCliente.AsInteger := DM.TVendaCodCliente.AsInteger;
                    DM.TReceberCodVendedor1.AsInteger := DM.TVendaCODVENDEDOR1.AsInteger;
                    DM.TReceberCodVendedor2.AsInteger := 0;
                    DM.TReceberHistorico.AsString := 'CUPOM FISCAL DE Nº: '+StrZero(DM.TVendaNUMERO_CUPOM.Value,6)+' PDV '+FrmPrincipal.PDVLocal;
                    DM.TReceberDataEmissao.AsDateTime := DM.TVendaDATAEMISSAO.AsDateTime;
                    DM.TReceberDataVencimento.AsDateTime := TParcelasCarteiraVencimento.Value;
                    DM.TReceberDataPagamento.Clear;
                    DM.TReceberValor.AsCurrency := TParcelasCarteiraValor.AsCurrency;
                    DM.TReceberCodVenda.AsInteger := DM.TVendaCodVenda.AsInteger;
                    DM.TReceberComissao1.AsCurrency:=DM.TVendaComissao1.AsCurrency;
                    DM.TReceberComissao2.AsCurrency:=0;
                    DM.TReceberCodPortador.AsInteger:=1;//Carteira
                    DM.TReceberDevolucao.AsString:='N';
                    DM.TReceberCodRemessa.AsInteger:=0;
                    DM.TReceber.Post;
                    DM.TReceber.ApplyUpdates(-1);

                    TParcelasCarteira.Next;
                   end;
                end;

             if FCrediario.ECheque.Value > 0
             then begin
                  With FCrediario
                  do begin
                     TParcelasCheque.First;
                     While not TParcelasCheque.Eof
                     do begin
                         DM.TChequeBaixar.Close;
                         DM.TChequeBaixar.Params[0].AsInteger:=-1;
                         DM.TChequeBaixar.Open;
                         DM.TChequeBaixar.Append;
                         DM.TChequeBaixarDataEmissao.AsDateTime:=DM.TVendaDATAEMISSAO.AsDateTime;
                         DM.TChequeBaixarDataVencimento.AsDateTime:=TParcelasChequeVencimento.Value;
                         DM.TChequeBaixarCodBanco.AsInteger:=TParcelasChequeCodBanco.AsInteger;
                         DM.TChequeBaixarNumAgencia.AsString:=TParcelasChequeAgencia.AsString;
                         DM.TChequeBaixarNumConta.AsString:=TParcelasChequeConta.AsString;
                         DM.TChequeBaixarNumCheque.AsString:=TParcelasChequeCheque.AsString;
                         DM.TChequeBaixarValor.AsCurrency:=TParcelasChequeValor.AsCurrency;
                         DM.TChequeBaixarCodVendedor1.AsInteger:=DM.TVendaCODVENDEDOR1.AsInteger;
                         DM.TChequeBaixarCodVendedor2.AsInteger:=0;
                         DM.TChequeBaixarCodCliente.AsInteger:=DM.TVendaCODCLIENTE.AsInteger;
                         DM.TChequeBaixarCodVenda.AsInteger:=DM.TVendaCodVenda.AsInteger;
                         DM.TChequeBaixarTitular.AsString:=LCliente.Caption;
                         DM.TChequeBaixarCidade.AsString:='';
                         DM.TChequeBaixarComissao1.AsCurrency:=DM.TVendaComissao1.AsCurrency;
                         DM.TChequeBaixarComissao2.AsCurrency:=0;
                         DM.TChequeBaixarCodRemessa.AsInteger:=0;
                         DM.TChequeBaixar.Post;
                         DM.TChequeBaixar.ApplyUpdates(-1);

                         TParcelasCheque.Next;
                         end;
                     end;
                  end;
             end;

       TFormaPgto.First;
       While not TFormaPgto.Eof
       do begin
          if (TFormaPgtoCod_Pgto.Value=1)or(TFormaPgtoCod_Pgto.Value=2)//Dinheiro ou Cheque
          then begin
                DM.TCaixa.Close;
                DM.TCaixa.Params[0].AsInteger:=-1;
                DM.TCaixa.Open;
                DM.TCaixa.Append;
                DM.TCaixaData.AsDateTime:=DM.TVendaDATAEMISSAO.AsDateTime;
                DM.TCaixaHistorico.AsString:='RECEB.NO PDV '+FrmPrincipal.PDVLocal;
                DM.TCaixaTipo.AsString:=vTipo;
                DM.TCaixaHora.AsDateTime:=Time;
                DM.TCaixaCodVenda.AsInteger:=DM.TVendaCodVenda.AsInteger;
                DM.TCaixaSaida.AsCurrency:=0;
                DM.TCaixaCodUsuario.AsInteger:=0;
                if TFormaPgtoCod_Pgto.Value=1//Dinheiro
                then begin
                     DM.TCaixaEntrada.AsCurrency:=TFormaPgtoValor.Value-TFormaPgtoTroco.Value;
                     DM.TCaixaDinheiro.AsCurrency:=DM.TVendaDINHEIRO.AsCurrency;
                     DM.TCaixaTroco.AsCurrency:=DM.TVendaTROCO.AsCurrency;
                     DM.TCaixaTIPO.AsString:='R';
                     end
                else if TFormaPgtoCod_Pgto.Value=2//Cheque
                then begin
                     DM.TCaixaEntrada.AsCurrency:=TFormaPgtoValor.Value-TFormaPgtoTroco.Value;
                     DM.TCaixaCheque.AsCurrency:=DM.TVendaCHEQUE.AsCurrency;
                     DM.TCaixaTroco.AsCurrency:=DM.TVendaTROCO.AsCurrency;
                     DM.TCaixaTIPO.AsString:='CH';
                     end;
                DM.TCaixa.Post;
                DM.TCaixa.ApplyUpdates(-1);
                end;
          TFormaPgto.Next;
          end;

        if DM.SQLConnectionRetaguarda.InTransaction
        then DM.SQLConnectionRetaguarda.Commit(TD);

        Libera;
      Except
        on E: exception
        do begin
           if DM.SQLConnectionRetaguarda.InTransaction
           then DM.SQLConnectionRetaguarda.RollBack(TD);

           Libera;
           DC;

           InformaError('Não possivél gravar no Banco de dados Remoto!');
           InformaError('Erro Interno: '+(E.Message));
           raise;
           end;
      end;
end;

procedure Tffechamentovenda_tef.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   vRestante : Currency;
begin
     if not vFechamento
     then begin

           if ERecebido.Value < 0
           then begin
                Informa('VALOR INVÁLIDO!');
                ERecebido.Value:=0;
                ERecebido.SetFocus;
                Exit;
                end;
 
           if Key=VK_F10
           then ChamaFormularioClienteConsumidor;

           if (Key=VK_F11)and(vConcedido_Desconto=False)
           then begin
                FrmPrincipal.VerificaPermissaoUsuario('PE_LIBERA_DESCONTO');

                if vLiberado
                then begin
                      Try
                         if FDesc_Acresc=Nil
                         then Application.CreateForm(TFDesc_Acresc,FDesc_Acresc);
                         FDesc_Acresc.ShowModal;
                      Finally
                         FDesc_Acresc.Release;
                         FDesc_Acresc:=Nil;
                         end;
                      end;
                end;

     if (Key=VK_F12)and(vConcedido_Desconto=False)
     then begin
          FrmPrincipal.VerificaPermissaoUsuario('PE_LIBERA_DESC_MINIMO');

          //if vLiberado
          //then Concede_Desc_Maximo(Nil);
          end;


     if (Key=VK_F1)and(ERecebido.Value > 0)
     then begin
          if DM.TForma_Pgto.Locate('ATALHO','F1',[])
          then begin
               Verifica_Valores;

               if not TFormaPgto.Locate('TIPO',DM.TForma_PgtoDESCRICAO.Value,[])
               then TFormaPgto.Append
               else TFormaPgto.Edit;
               TFormaPgtoID.Value:=01;
               TFormaPgtoCod_Pgto.Value:=DM.TForma_PgtoCODIGO.Value;
               TFormaPgtoTipo.AsString:=DM.TForma_PgtoDESCRICAO.Value;
               if ERecebido.Value=0
               then TFormaPgtoValor.Value:=ETotalLiquido.Value-vForma_Pgto_Lancado
               else TFormaPgtoValor.Value:=ERecebido.Value;
               TFormaPgtoTroco.Value:=ETroco.Value;
               TFormaPgto.Post;

               vRestante:=(ETotalLiquido.Value-TFormaPgto.FieldByName('TOTAL').Value);
               if vRestante > 0
               then ERestante.Value:=vRestante
               else ERestante.Value:=0;

               if not vFechamento
               then ERecebido.Value:=0;
               end
          else begin
               Informa('TECLA [ F1 ] NÃO PROGRAMADA PARA FORMA DE PAGAMENTO!');
               ERecebido.SetFocus;
               end;
          end
     else if (Key=VK_F2)and(ERecebido.Value > 0)
     then begin
          if DM.TForma_Pgto.Locate('ATALHO','F2',[])
          then begin
               Verifica_Valores;

               if not TFormaPgto.Locate('TIPO',DM.TForma_PgtoDESCRICAO.Value,[])
               then TFormaPgto.Append
               else TFormaPgto.Edit;
               TFormaPgtoID.Value:=02;
               TFormaPgtoCod_Pgto.Value:=DM.TForma_PgtoCODIGO.Value;
               TFormaPgtoTipo.AsString:=DM.TForma_PgtoDESCRICAO.Value;
               if ERecebido.Value=0
               then TFormaPgtoValor.Value:=ETotalLiquido.Value-vForma_Pgto_Lancado
               else TFormaPgtoValor.Value:=ERecebido.Value;
               TFormaPgtoTroco.Value:=ETroco.Value;
               TFormaPgto.Post;

               vRestante:=(ETotalLiquido.Value-TFormaPgto.FieldByName('TOTAL').Value);
               if vRestante > 0
               then ERestante.Value:=vRestante
               else ERestante.Value:=0;

               if not vFechamento
               then ERecebido.Value:=0;
               end
           else begin
                Informa('TECLA [ F2 ] NÃO PROGRAMADA PARA FORMA DE PAGAMENTO!');
                ERecebido.SetFocus;
                end;
          end
     else if (Key=VK_F3)and(ERecebido.Value > 0)
     then begin
          if DM.TForma_Pgto.Locate('ATALHO','F3',[])
          then begin
               Verifica_Valores;

               if ETroco.Value > 0
               then begin
                    Informa('Não é permitido Troco para pagamento com cartão!');
                    vFechamento:=False;
                    LEncerramento.Visible:=False;
                    LEncerramento1.Visible:=False;
                    Timer1.Enabled:=false;
                    ERecebido.ReadOnly:=False;
                    ETroco.Value:=0;
                    ERecebido.Clear;
                    ERecebido.SetFocus;
                    Exit;
                    end;

               Try
                  if FAdm_Cartoes=Nil
                  then Application.CreateForm(TFAdm_Cartoes,FAdm_Cartoes);
                  FAdm_Cartoes.vConsulta:=True;
                  FAdm_Cartoes.ShowModal;
                  FAdm_Cartoes.vConsulta:=False;
                  if FAdm_Cartoes.ModalResult=mrOk
                  then begin
                       s_Operadora_Cartao:=DM.TCartao_AdmDESCRICAO.AsString;
                       Cod_adm_Cartao:=DM.TCartao_AdmCODIGO.AsInteger;
                       if (FrmPrincipal.Tef_Utilizado='Nenhum')
                       then begin
                            Try
                               if FCartao_Deb_Cred=Nil
                               then Application.CreateForm(TFCartao_Deb_Cred,FCartao_Deb_Cred);
                               FCartao_Deb_Cred.ShowModal;
                               if FCartao_Deb_Cred.ModalResult=mrOk
                               then begin
                                    if FCartao_Deb_Cred.RBCredito.Checked
                                    then Usou_Cartao_Deb_Cred:='C'
                                    else Usou_Cartao_Deb_Cred:='D';
                                    end;
                            Finally
                               FCartao_Deb_Cred.Release;
                               FCartao_Deb_Cred:=Nil;
                               end;
                            end;
                       end
                  else begin
                       s_Operadora_Cartao:='';
                       Cod_adm_Cartao:=0;
                       Usou_Cartao_Deb_Cred:='';
                       end;
               Finally
                  FAdm_Cartoes.Release;
                  FAdm_Cartoes:=Nil;
                  end;

               if not TFormaPgto.Locate('TIPO',DM.TForma_PgtoDESCRICAO.Value,[])
               then TFormaPgto.Append
               else TFormaPgto.Edit;
               TFormaPgtoID.Value:=99;
               TFormaPgtoCod_Pgto.Value:=DM.TForma_PgtoCODIGO.Value;
               TFormaPgtoTipo.AsString:=DM.TForma_PgtoDESCRICAO.Value;
               if ERecebido.Value=0
               then TFormaPgtoValor.Value:=ETotalLiquido.Value-vForma_Pgto_Lancado
               else TFormaPgtoValor.Value:=ERecebido.Value;
               TFormaPgtoTroco.Value:=ETroco.Value;
               TFormaPgto.Post;

               vRestante:=(ETotalLiquido.Value-TFormaPgto.FieldByName('TOTAL').Value);
               if vRestante > 0
               then ERestante.Value:=vRestante
               else ERestante.Value:=0;

               if not vFechamento
               then ERecebido.Value:=0;
               end
          else begin
               Informa('TECLA [ F3 ] NÃO PROGRAMADA PARA FORMA DE PAGAMENTO!');
               ERecebido.SetFocus;
               end;
          end
     else if (Key=VK_F4)and(ERecebido.Value > 0)
     then begin
          if DM.TForma_Pgto.Locate('ATALHO','F4',[])
          then begin
               Verifica_Valores;

               if not TFormaPgto.Locate('TIPO',DM.TForma_PgtoDESCRICAO.Value,[])
               then TFormaPgto.Append
               else TFormaPgto.Edit;
               TFormaPgtoID.Value:=04;
               TFormaPgtoCod_Pgto.Value:=DM.TForma_PgtoCODIGO.Value;
               TFormaPgtoTipo.AsString:=DM.TForma_PgtoDESCRICAO.Value;
               if ERecebido.Value=0
               then TFormaPgtoValor.Value:=ETotalLiquido.Value-vForma_Pgto_Lancado
               else TFormaPgtoValor.Value:=ERecebido.Value;
               TFormaPgtoTroco.Value:=ETroco.Value;
               TFormaPgto.Post;

               vRestante:=(ETotalLiquido.Value-TFormaPgto.FieldByName('TOTAL').Value);
               if vRestante > 0
               then ERestante.Value:=vRestante
               else ERestante.Value:=0;

               if not vFechamento
               then ERecebido.Value:=0;
               end
          else begin
               Informa('TECLA [ F4 ] NÃO PROGRAMADA PARA FORMA DE PAGAMENTO!');
               ERecebido.SetFocus;
               end;
          end
     else if (Key=VK_F5)or(Key=VK_F6)
     then begin
          if Key=VK_F5
          then vTecla_Crediario:='F5'
          else vTecla_Crediario:='F6';

          if DM.TForma_Pgto.Locate('ATALHO',vTecla_Crediario,[])
          then begin
                Verifica_Valores;

                if ETroco.Value > 0
                then begin
                     Informa('Não é permitido Troco em Crediário!');
                     vFechamento:=False;
                     LEncerramento.Visible:=False;
                     LEncerramento1.Visible:=False;
                     Timer1.Enabled:=False;
                     ERecebido.ReadOnly:=False;
                     ETroco.Value:=0;
                     ERecebido.Clear;
                     ERecebido.SetFocus;
                     Exit;
                     end;

                if (FrmPrincipal.Depende_Retaguarda='S')and(ServidorRemoto='ON')
                then begin
                      if FCrediario=Nil
                      then Application.CreateForm(TFCrediario,FCrediario);
                      FCrediario.ShowModal;

                      if FCrediario.OkCrediario
                      then begin
                            nTotal_Crediario:=0;
                            if FCrediario.ECarteira.Value > 0
                            then begin
                                 if not TFormaPgto.Locate('COD_PGTO',DM.TForma_PgtoCODIGO.Value,[])
                                 then TFormaPgto.Append
                                 else TFormaPgto.edit;
                                 TFormaPgtoID.Value:=05;
                                 TFormaPgtoCod_Pgto.Value:=DM.TForma_PgtoCODIGO.Value;
                                 TFormaPgtoTipo.AsString:=DM.TForma_PgtoDESCRICAO.Value;
                                 TFormaPgtoValor.Value:=TFormaPgtoValor.Value + FCrediario.ECarteira.Value;
                                 TFormaPgto.Post;
                                 nTotal_Crediario:=nTotal_Crediario + TFormaPgtoValor.Value;
                                 end;
                            if FCrediario.ECheque.Value > 0
                            then begin
                                 if not TFormaPgto.Locate('COD_PGTO',DM.TForma_PgtoCODIGO.Value,[])
                                 then TFormaPgto.Append
                                 else TFormaPgto.edit;
                                 TFormaPgtoID.Value:=06;
                                 TFormaPgtoCod_Pgto.Value:=DM.TForma_PgtoCODIGO.Value;
                                 TFormaPgtoTipo.AsString:=DM.TForma_PgtoDESCRICAO.Value;
                                 TFormaPgtoValor.Value:=TFormaPgtoValor.Value + FCrediario.ECheque.Value;
                                 TFormaPgto.Post;
                                 nTotal_Crediario:=nTotal_Crediario + TFormaPgtoValor.Value;
                                 end;

                            vRestante:=(ETotalLiquido.Value-TFormaPgto.FieldByName('TOTAL').Value);
                            if vRestante > 0
                            then ERestante.Value:=vRestante
                            else ERestante.Value:=0;

                            if not vFechamento
                            then ERecebido.Value:=0;

                            Verifica_Valores;
                            end;
                       end
                     else begin
                          Informa('Não será possivél gerar crediario, o Servidor Remoto esta OffLine! Tente mais Tarde!!!'+#13+
                                  'Selecione outra forma de pagamento!');
                          end;
                 end
         else begin
              Informa('TECLA [ '+vTecla_Crediario+' ] NÃO PROGRAMADA PARA FORMA DE PAGAMENTO!');
              ERecebido.SetFocus;
              end;
          end;
     end
     else if (Key=VK_F7)and(ERecebido.Value > 0)
     then begin
          if DM.TForma_Pgto.Locate('ATALHO','F7',[])
          then begin
               Verifica_Valores;

               if not TFormaPgto.Locate('TIPO',DM.TForma_PgtoDESCRICAO.Value,[])
               then TFormaPgto.Append
               else TFormaPgto.Edit;
               TFormaPgtoID.Value:=07;
               TFormaPgtoTipo.AsString:=DM.TForma_PgtoDESCRICAO.Value;
               if ERecebido.Value=0
               then TFormaPgtoValor.Value:=ETotalLiquido.Value-vForma_Pgto_Lancado
               else TFormaPgtoValor.Value:=ERecebido.Value;
               TFormaPgtoTroco.Value:=ETroco.Value;
               TFormaPgto.Post;

               vRestante:=(ETotalLiquido.Value-TFormaPgto.FieldByName('TOTAL').Value);
               if vRestante > 0
               then ERestante.Value:=vRestante
               else ERestante.Value:=0;

               if not vFechamento
               then ERecebido.Value:=0;
               end
          else begin
               Informa('TECLA [ F7 ] NÃO PROGRAMADA PARA FORMA DE PAGAMENTO!');
               ERecebido.SetFocus;
               end;
          end
     else if (Key=VK_F8)and(ERecebido.Value > 0)
     then begin
          if DM.TForma_Pgto.Locate('ATALHO','F8',[])
          then begin
               Verifica_Valores;

               if not TFormaPgto.Locate('TIPO',DM.TForma_PgtoDESCRICAO.Value,[])
               then TFormaPgto.Append
               else TFormaPgto.Edit;
               TFormaPgtoID.Value:=08;
               TFormaPgtoTipo.AsString:=DM.TForma_PgtoDESCRICAO.Value;
               if ERecebido.Value=0
               then TFormaPgtoValor.Value:=ETotalLiquido.Value-vForma_Pgto_Lancado
               else TFormaPgtoValor.Value:=ERecebido.Value;
               TFormaPgtoTroco.Value:=ETroco.Value;
               TFormaPgto.Post;

               vRestante:=(ETotalLiquido.Value-TFormaPgto.FieldByName('TOTAL').Value);
               if vRestante > 0
               then ERestante.Value:=vRestante
               else ERestante.Value:=0;

               if not vFechamento
               then ERecebido.Value:=0;
               end
          else begin
               Informa('TECLA [ F8 ] NÃO PROGRAMADA PARA FORMA DE PAGAMENTO!');
               ERecebido.SetFocus;
               end;
          end;

     if Key=VK_Escape
     then begin
          if Confirma('CONFIRMA O CANCELAMENTO DO FECHAMENTO?')=mryes
          then Close;
          end;
end;

procedure TFFechamentoVenda_tef.Verifica_Valores;
var
   vRecebido,vTotalLiquido,vTroco : Currency;
begin
     SomaTabelaPgtos;

     vRecebido:=ERecebido.Value;
     vTotalLiquido:=ETotalLiquido.Value;
     vTroco:=ETroco.Value;

     if ((vRecebido+vForma_Pgto_Lancado) >= (vTotalLiquido+vTroco))
     then begin
          ETroco.Value:=(vForma_Pgto_Lancado+vRecebido)-vTotalLiquido;
          vFechamento:=True;
          LEncerramento.Visible:=True;
          LEncerramento1.Visible:=True;
          Timer1.Enabled:=True;
          ERecebido.ReadOnly:=True;
          PRodape.SetFocus;
          end;
end;

procedure TFFechamentoVenda_Tef.SomaTabelaPgtos;
begin
     vForma_Pgto_Lancado:=0;
     TFormaPgto.First;
     While not TFormaPgto.Eof
     do begin
        vForma_Pgto_Lancado:=vForma_Pgto_Lancado+TFormaPgtoVALOR.Value;
        TFormaPgto.Next;
        end;
end;        

procedure Tffechamentovenda_tef.FormShow(Sender: TObject);
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

     TFormaPgto.EmptyDataSet;
     DM.TForma_Pgto.Open;
     DM.TForma_Pgto.Refresh;   

     nTotal_Crediario:=0;
     Nr_Transacao_Tef:=0;
     Cod_Adm_Cartao:=0;
     vDesconto:=0;
     vPercDesconto:=0;
     vAcrescimo:=0;
     vPercAcrescimo:=0;
     vCodPortador:=1;
     vTotalCusto:=0;
     ESubTotal.Value:=frmcheckout.editSUBTOTAL.Value;
     ETotalLiquido.Value:=frmcheckout.editSUBTOTAL.Value;
     ETroco.Value:=0;
     ERestante.Value:=0;
     ERecebido.ReadOnly:=False;
     ERecebido.Value:=0;
     ERecebido.Refresh;
     vCliente:=False;
     LEncerramento.Visible:=False;
     LEncerramento1.Visible:=False;
     Timer1.Enabled:=False;
     S_Nome_Consumidor:='';
     S_Endereco:='';
     S_CPF_OU_CNPJ:='';
     vFechamento:=False;
     vConcedido_Desconto:=False;
     Usou_Cartao_Deb_Cred:='';
     s_Operadora_Cartao:='';
     Consultou_Cheque:=False;
     Aprovou_Cheque:=False;
     Cancelou_Transacao_TEF:=False;
     Gravou_RelGerencial_BD:=False;
     Imprimiu_Comprovante_nao_fiscal:=False;
     if nBuscou_DAV=False
     then vCodCliente:=StrToInt(FrmPrincipal.Cod_Consumidor)
     else begin
          vCodCliente:=nCodClienteDAV;
          ChamaFormularioClienteConsumidor;

          if nDesconto_DAV > 0
          then begin
               if Confirma('Existe um desconto de R$:'+FormatFloat('##,###0.00',nDesconto_DAV)+
                           ' neste Orçamento, deseja conceder este desconto no cupom fiscal?')=mrYes
               then begin
                    FDesc_Acresc := TFDesc_Acresc.Create(Self);
                    FDesc_Acresc.ed_desconto.Value:=nDesconto_DAV;
                    FDesc_Acresc.ShowModal;
                    FreeAndNil(FDesc_Acresc);
                    end;             
               end;
          end;
     PMensagem.Visible:=False;
     ERecebido.SetFocus;
end;

procedure Tffechamentovenda_tef.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (Key=#13)and(not PMensagem.Visible)
     then begin
          if vFechamento
          then begin
               if Confirma('Confirma o Fechamento da Venda?')=mrYes
               then begin

                    GravaFechamentoLocal;
                    DC;

                    if vGravaBancodeDados//Se Gravou no Banco de dados (Ocorreu tudo certo)
                    then begin
                          Close;
                          vFechamento:=False;
                          frmcheckout.FormShow(Sender);

                          Try
                           if FileExists('C:\Apgef\Local\Itens.xml')
                           then DeleteFile('C:\Apgef\Local\Itens.xml');

                           if FileExists('C:\Apgef\Local\DescAcresc.xml')
                           then DeleteFile('C:\Apgef\Local\DescAcresc.xml');

                           if FileExists('C:\Apgef\Local\ItensGrade.xml')
                           then DeleteFile('C:\Apgef\Local\ItensGrade.xml');
                          Except
                           Informa('Não foi possivél atualizar o arquivo local!');
                           end;
                          end;
                      end;
                 end;
          end;
end;

procedure Tffechamentovenda_tef.ERecebidoKeyPress(Sender: TObject;
  var Key: Char);
var
   vTotalLiquido : Currency;
begin
     if (Key=#13)and(not vFechamento)
     then begin
          if ERecebido.Value < 0
          then begin
               Informa('VALOR INVÁLIDO!');
               ERecebido.SetFocus;
               Exit;
               end
          else if ERecebido.Value = 0
          then begin
               Informa('INFORME O VALOR RECEBIDO!');
               ERecebido.SetFocus;
               Exit;
               end;

          if TFormaPgto.IsEmpty
          then begin
               DM.TForma_Pgto.First;
               if not TFormaPgto.Locate('TIPO',DM.TForma_PgtoDESCRICAO.Value,[])
               then TFormaPgto.Append
               else TFormaPgto.Edit;
               TFormaPgtoCOD_PGTO.Value:=DM.TForma_PgtoCODIGO.Value;
               TFormaPgtoTipo.Value:=DM.TForma_PgtoDESCRICAO.Value;
               TFormaPgtoValor.Value:=ERecebido.Value;
               TFormaPgtoTroco.Value:=ERecebido.Value-ETotalLiquido.Value;
               TFormaPgto.Post;
               end;

          Verifica_Valores;
          vTotalLiquido:=ETotalLiquido.Value;

          if (vForma_Pgto_Lancado  < vTotalLiquido)
          then begin
               ETroco.Value:=0;
               ERestante.Value:=0;
               Informa('O VALOR DO FECHAMENTO NÃO PODE SER MENOR QUE O TOTAL DA COMPRA!');
               TFormaPgto.EmptyDataSet;
               ERecebido.ReadOnly:=False;
               vFechamento:=False;
               LEncerramento.Visible:=False;
               LEncerramento1.Visible:=False;
               ERecebido.SetFocus;
               Exit;
               end;

          ETroco.Value:=(ERecebido.Value - ETotalLiquido.Value);
          vFechamento:=True;
          LEncerramento.Visible:=True;
          LEncerramento1.Visible:=True;
          PRodape.SetFocus;
          end;
end;

procedure Tffechamentovenda_tef.ESubTotalKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if key=40  // seta para baixo
     then FFechamentoVenda_Tef.Perform(WM_NextDlgCtl,0,0);

     if key=38  // seta para cima
     then FFechamentoVenda_Tef.Perform(WM_NextDlgCtl,1,0);
end;

procedure Tffechamentovenda_tef.ERecebidoEnter(Sender: TObject);
begin
     if (Sender is TCurrencyEdit) then
     TCurrencyEdit(Sender).Color:=$0080FFFF;
end;

procedure Tffechamentovenda_tef.ERecebidoExit(Sender: TObject);
begin
     if (Sender is TCurrencyEdit) then
     TCurrencyEdit(Sender).Color:=clWhite;
end;

procedure Tffechamentovenda_tef.EasyTEFDiscadoAbrirComprovanteNaoFiscalVinculado(
  var operacaoECFOk: Boolean; valorCupom: String);
begin
    valorCupom := valorPgto;

    if s_ImpFiscal = 'ECF Bematech'
    then operacaoECFOk :=  Bematech_FI_AbreComprovanteNaoFiscalVinculado( PChar(S_Forma_de_Pagamento), PChar(valorCupom),  PChar(StrZero(nNumero_Cupom,6))) = Retorno_imp_Fiscal
    else if s_ImpFiscal = 'ECF Daruma'
    then operacaoECFOk :=  Daruma_FI_AbreComprovanteNaoFiscalVinculado( PChar(S_Forma_de_Pagamento), PChar(valorCupom),  PChar(StrZero(nNumero_Cupom,6))) = Retorno_imp_Fiscal
    else if s_ImpFiscal = 'ECF Elgin'
    then operacaoECFOk :=  Elgin_AbreComprovanteNaoFiscalVinculado( PChar(S_Forma_de_Pagamento), PChar(valorCupom),  PChar(StrZero(nNumero_Cupom,6))) = Retorno_imp_Fiscal
    else if s_ImpFiscal = 'ECF Sweda'
    then operacaoECFOk :=  ECF_AbreComprovanteNaoFiscalVinculado( PChar(S_Forma_de_Pagamento), PChar(valorCupom),  PChar(StrZero(nNumero_Cupom,6))) = Retorno_imp_Fiscal;

    if operacaoECFOk
    then begin
         GravaDadosDocECF('CC');//Comprovante de Crédito ou débito - Sigla Padrão PAF-ECF
         end;
end;

procedure Tffechamentovenda_tef.EasyTEFDiscadoEfetuarFormaPagamento(
  var operacaoECFOk: Boolean; params: array of String;
  var retorno: String);
begin
    if s_ImpFiscal = 'ECF Bematech'
    then operacaoECFOk := Bematech_FI_EfetuaFormaPagamento(PChar(params[0]), PChar(params[1])) = Retorno_imp_Fiscal
    else if s_ImpFiscal = 'ECF Daruma'
    then operacaoECFOk := Daruma_FI_EfetuaFormaPagamento(PChar(params[0]), PChar(params[1])) = Retorno_imp_Fiscal
    else if s_ImpFiscal = 'ECF Elgin'
    then operacaoECFOk := Elgin_EfetuaFormaPagamento(PChar(params[0]), PChar(params[1])) = Retorno_imp_Fiscal
    else if s_ImpFiscal = 'ECF Sweda'
    then operacaoECFOk := ECF_EfetuaFormaPagamento(PChar(params[0]), PChar(params[1])) = Retorno_imp_Fiscal;
end;

procedure Tffechamentovenda_tef.EasyTEFDiscadoEncerrarCupomFiscal(
  Sender: TObject);
begin
     Cancelou_Transacao_TEF:=True;
     frmcheckout.FormShow(Sender);

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

    Close;
end;

procedure Tffechamentovenda_tef.EasyTEFDiscadoFecharComprovanteNaoFiscalVinculado(
  Sender: TObject);
begin
    if s_ImpFiscal = 'ECF Bematech'
    then Bematech_FI_FechaComprovanteNaoFiscalVinculado
    else if s_ImpFiscal = 'ECF Daruma'
    then Daruma_FI_FechaComprovanteNaoFiscalVinculado
    else if s_ImpFiscal = 'ECF Elgin'
    then Elgin_FechaComprovanteNaoFiscalVinculado
    else if s_ImpFiscal = 'ECF Sweda'
    then ECF_FechaComprovanteNaoFiscalVinculado;
end;

procedure Tffechamentovenda_tef.EasyTEFDiscadoFecharRelatorioGerencial(
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

procedure Tffechamentovenda_tef.EasyTEFDiscadoImpressoraTemPapel(
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

procedure Tffechamentovenda_tef.EasyTEFDiscadoImprimirRelatorioGerencial(
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

procedure Tffechamentovenda_tef.EasyTEFDiscadoIniciarFechamentoCupomFiscal(
  var operacaoECFOk: Boolean; params: array of String;
  var retorno: String);
begin
    if s_ImpFiscal = 'ECF Bematech'
    then operacaoECFOk := Bematech_FI_IniciaFechamentoCupom(PChar(params[0]), PChar(params[1]), PChar(params[2])) = Retorno_imp_Fiscal
    else if s_ImpFiscal = 'ECF Daruma'
    then operacaoECFOk := Daruma_FI_IniciaFechamentoCupom(PChar(params[0]), PChar(params[1]), PChar(params[2])) = Retorno_imp_Fiscal
    else if s_ImpFiscal = 'ECF Elgin'
    then operacaoECFOk := Elgin_IniciaFechamentoCupom(PChar(params[0]), PChar(params[1]), PChar(params[2])) = Retorno_imp_Fiscal
    else if s_ImpFiscal = 'ECF Sweda'
    then operacaoECFOk := ECF_IniciaFechamentoCupom(PChar(params[0]), PChar(params[1]), PChar(params[2])) = Retorno_imp_Fiscal;
end;

procedure Tffechamentovenda_tef.EasyTEFDiscadoSubTotalizarCupom(
  var operacaoECFOk: Boolean; params: array of String;
  var retorno: String);
var
  i: Integer;
begin
    if s_ImpFiscal = 'ECF Bematech'
    then begin
         for i := 1 to 14 do retorno := retorno + ' ';
         operacaoECFOk := Bematech_FI_SubTotal(retorno) = Retorno_imp_Fiscal;
         end
    else if s_ImpFiscal = 'ECF Daruma'
    then begin
         for i := 1 to 14 do retorno := retorno + ' ';
         operacaoECFOk := Daruma_FI_SubTotal(retorno) = Retorno_imp_Fiscal;
         end
    else if s_ImpFiscal = 'ECF Elgin'
    then begin
         for i := 1 to 14 do retorno := StringOfChar(' ',14);
         operacaoECFOk := Elgin_SubTotal(retorno) = Retorno_imp_Fiscal;
         //Retorno := StringOfChar(' ',14);
         //operacaoECFOk := Elgin_SubTotal(retorno) = Retorno_imp_Fiscal;
         end
    else if s_ImpFiscal = 'ECF Sweda'
    then begin
         for i := 1 to 14 do retorno := retorno + ' ';
         operacaoECFOk := ECF_SubTotal(Pchar(retorno)) = Retorno_imp_Fiscal;
         end;
end;

procedure Tffechamentovenda_tef.EasyTEFDiscadoTerminarFechamentoCupom(
  var operacaoECFOk: Boolean; params: array of String;
  var retorno: String);
begin
    if s_ImpFiscal = 'ECF Bematech'
    then operacaoECFOk := Bematech_FI_TerminaFechamentoCupom(PChar(params[0])) = Retorno_imp_Fiscal
    else if s_ImpFiscal = 'ECF Daruma'
    then operacaoECFOk := Daruma_FI_TerminaFechamentoCupom(PChar(params[0])) = Retorno_imp_Fiscal
    else if s_ImpFiscal = 'ECF Elgin'
    then operacaoECFOk := Elgin_TerminaFechamentoCupom(PChar(params[0])) = Retorno_imp_Fiscal
    else if s_ImpFiscal = 'ECF Sweda'
    then operacaoECFOk := ECF_TerminaFechamentoCupom(PChar(params[0])) = Retorno_imp_Fiscal;
end;

procedure Tffechamentovenda_tef.EasyTEFDiscadoUsarComprovanteNaoFiscalVinculado(
  imagemCupomTef: TStrings; var impressaoOk: Boolean);
begin
    if s_ImpFiscal = 'ECF Bematech'
    then impressaoOk := Bematech_FI_UsaComprovanteNaoFiscalVinculado(imagemCupomTef.GetText) = Retorno_imp_Fiscal
    else if s_ImpFiscal = 'ECF Daruma'
    then impressaoOk := Daruma_FI_UsaComprovanteNaoFiscalVinculado(imagemCupomTef.GetText) = Retorno_imp_Fiscal
    else if s_ImpFiscal = 'ECF Elgin'
    then impressaoOk := Elgin_UsaComprovanteNaoFiscalVinculado(imagemCupomTef.GetText) = Retorno_imp_Fiscal
    else if s_ImpFiscal = 'ECF Sweda'
    then impressaoOk := ECF_UsaComprovanteNaoFiscalVinculado(imagemCupomTef.GetText) = Retorno_imp_Fiscal;
end;

procedure Tffechamentovenda_tef.EasyTEFDiscadoGerarIdentificador(
  var identificacao: Integer);
begin
  //Randomize;
  //identificacao := Random(999999);
  identificacao := Nr_Transacao_Tef;
end;

procedure Tffechamentovenda_tef.EasyTEFDiscadoValorPersonalizadoReq(
  var campo, valor: String);
begin
//  campo := '777-777';
//  valor := 'TESTE REDECARD';
end;

procedure Tffechamentovenda_tef.FormDestroy(Sender: TObject);
begin
     if FrmPrincipal.Visible=False
     then begin
          FrmPrincipal.Visible:=True;
          Application.ProcessMessages;
          end;
end;

procedure Tffechamentovenda_tef.Aciona_Gaveta;
begin
     if FrmPrincipal.Gaveta='S'
     then begin
          TFormaPgto.First;
          While not TFormaPgto.Eof
          do begin
             if DM.TForma_Pgto.Locate('CODIGO',TFormaPgtoCod_Pgto.Value,[])
             then if DM.TForma_PgtoABRE_GAVETA.AsString='SIM'
             then begin
                  if s_ImpFiscal = 'ECF Daruma'
                  then Retorno_imp_Fiscal:= Daruma_FI_AcionaGaveta()
                  else if s_ImpFiscal = 'ECF Bematech'
                  then Retorno_imp_Fiscal:= Bematech_FI_AcionaGaveta()
                  else if s_ImpFiscal = 'ECF Elgin'
                  then Retorno_imp_Fiscal:= Elgin_AcionaGaveta()
                  else if s_ImpFiscal = 'ECF Sweda'
                  then Retorno_imp_Fiscal:= ECF_AcionaGaveta();

                  Analisa_iRetorno();
                  Retorno_Impressora();
                  end;
             TFormaPgto.Next;
             end;
       end;
end;

procedure Tffechamentovenda_tef.Imprimi_Comprovante_Nao_Fiscal_Vinculado;
var
   vCompara_CGC, vCompara_CPF, valor_formapgto : String;
begin
   //Imprimi Comprovante não Fiscal
   TFormaPgto.First;
   While not TFormaPgto.Eof
   do begin
      if DM.TForma_Pgto.Locate('DESCRICAO',TFormaPgtoTipo.Value,[])
      then if DM.TForma_PgtoIMPRIMI_COMPROVANTE.AsString='SIM'
      then begin
            DM.TClientes.Close;
            DM.TClientes.Params[0].AsInteger:=vCodCliente;
            DM.TClientes.Open;

            vCompara_CPF:=SoNumeros(DM.TClientesCPF.AsString);
            vCompara_CGC:=SoNumeros(DM.TClientesCGC.AsString);

            if vCompara_CPF<>''
            then vCPF_CNPJ:=DM.TClientesCPF.Value
            else if vCompara_CGC<>''
            then vCPF_CNPJ:=DM.TClientesCGC.Value
            else vCPF_CNPJ:='';

            if (not DM.TClientesRG.IsNull)or(DM.TClientesRG.AsString<>'')
            then vRG_IE:=DM.TClientesRG.Value
            else vRG_IE:=DM.TClientesIE.Value;

            S_Forma_de_Pagamento:=TFormaPgtoTipo.AsString;
            valor_formapgto:=FormatFloat('##,###0.00',TFormaPgtoVALOR.Value);
            S_Texto_Comprovante_Nao_Fiscal:=
                         ('Eu, '+DM.TClientesNome.Value+', '+
                          'residente a Rua/Av. '+DM.TClientesENDERECO.Value+', '+
                          'no municipio de '+DM.TClientesCIDADE.Value+', portador '+
                          'do CNPJ/sCpf '+vCPF_CNPJ+' e do IE/Rg n. '+vRG_IE+', '+
                          'comprometo-me a saldar o débito conforme abaixo discriminado.');

            S_Texto_Parcelas:=
                        'Parcela            Valor              Vencimento'+
                        '------------------------------------------------';

            S_Rodape_Comprovante:=
                        '------------------------------------------------'+
                        Center(StrZero(DM.TClientesCODIGO.AsInteger,5)+'-'+(DM.TClientesNOME.AsString),48)+
                        'Operador: '+StrZero(n_usuario,3)+'-'+s_usuario;

            S_Salta_Linha:=' ';

            S_Linha_Comprovante:='------------------------------------------------';

            AbreRelGerencial;

            ImprimiRelGerencial(pchar( S_Forma_de_Pagamento ));
            ImprimiRelGerencial(pchar( S_Texto_Comprovante_Nao_Fiscal+#13+#10+S_Texto_Parcelas ));
            ImprimiParcelaRelGerencial;
            ImprimiRelGerencial(pchar( S_Linha_Comprovante ));
            ImprimiRelGerencial(pchar( S_Salta_Linha+#13+#10+#13+#10+#13+#10 ));
            ImprimiRelGerencial(pchar( S_Rodape_Comprovante ));

            FechaRelGerencial;

            {if s_ImpFiscal = 'ECF Bematech'
            then begin
                 Retorno_imp_Fiscal:=Bematech_FI_AbreComprovanteNaoFiscalVinculado( pchar( S_Forma_de_Pagamento ), pchar( '' ), pchar( '' ) );
                 Retorno_imp_Fiscal:=Bematech_FI_UsaComprovanteNaoFiscalVinculado( pchar( S_Texto_Comprovante_Nao_Fiscal+#13+#10+S_Texto_Parcelas ) );
                 ImprimiParcelaRelGerencial;
                 Retorno_imp_Fiscal:=Bematech_FI_UsaComprovanteNaoFiscalVinculado( pchar( S_Linha_Comprovante ) );
                 Retorno_imp_Fiscal:=Bematech_FI_UsaComprovanteNaoFiscalVinculado( pchar( S_Salta_Linha+#13+#10+#13+#10+#13+#10 ) );
                 Retorno_imp_Fiscal:=Bematech_FI_UsaComprovanteNaoFiscalVinculado( pchar( S_Rodape_Comprovante ) );
                 Retorno_imp_Fiscal:=Bematech_FI_FechaComprovanteNaoFiscalVinculado();
                 end
            else if s_ImpFiscal = 'ECF Daruma'
            then begin
                 Retorno_imp_Fiscal:=Daruma_FI_AbreComprovanteNaoFiscalVinculado( pchar( S_Forma_de_Pagamento ), pchar( '' ), pchar( '' ) );
                 Retorno_imp_Fiscal:=Daruma_FI_UsaComprovanteNaoFiscalVinculado( pchar( S_Texto_Comprovante_Nao_Fiscal+#13+#10+S_Texto_Parcelas ) );
                 ImprimiParcelaRelGerencial;
                 Retorno_imp_Fiscal:=Daruma_FI_UsaComprovanteNaoFiscalVinculado( pchar( S_Linha_Comprovante ) );
                 Retorno_imp_Fiscal:=Daruma_FI_UsaComprovanteNaoFiscalVinculado( pchar( S_Salta_Linha+#13+#10+#13+#10+#13+#10 ) );
                 Retorno_imp_Fiscal:=Daruma_FI_UsaComprovanteNaoFiscalVinculado( pchar( S_Rodape_Comprovante ) );
                 Retorno_imp_Fiscal:=Daruma_FI_FechaComprovanteNaoFiscalVinculado();
                 end
            else if s_ImpFiscal = 'ECF Elgin'
            then begin
                 Retorno_imp_Fiscal:=Elgin_AbreComprovanteNaoFiscalVinculado( pchar( S_Forma_de_Pagamento ), pchar( '' ), pchar( '' ) );
                 Retorno_imp_Fiscal:=Elgin_UsaComprovanteNaoFiscalVinculado( pchar( S_Texto_Comprovante_Nao_Fiscal+#13+#10+S_Texto_Parcelas ) );
                 ImprimiParcelaRelGerencial;
                 Retorno_imp_Fiscal:=Daruma_FI_UsaComprovanteNaoFiscalVinculado( pchar( S_Linha_Comprovante ) );
                 Retorno_imp_Fiscal:=Elgin_UsaComprovanteNaoFiscalVinculado( pchar( S_Salta_Linha+#13+#10+#13+#10+#13+#10 ) );
                 Retorno_imp_Fiscal:=Elgin_UsaComprovanteNaoFiscalVinculado( pchar( S_Rodape_Comprovante ) );
                 Retorno_imp_Fiscal:=Elgin_FechaComprovanteNaoFiscalVinculado();
                 end
            else if s_ImpFiscal = 'ECF Sweda'
            then begin
                 Retorno_imp_Fiscal:=ECF_AbreComprovanteNaoFiscalVinculado( pchar( S_Forma_de_Pagamento ), pchar( '' ), pchar( '' ) );
                 Retorno_imp_Fiscal:=ECF_UsaComprovanteNaoFiscalVinculado( pchar( S_Texto_Comprovante_Nao_Fiscal+#13+#10+S_Texto_Parcelas ) );
                 ImprimiParcelaRelGerencial;
                 Retorno_imp_Fiscal:=Daruma_FI_UsaComprovanteNaoFiscalVinculado( pchar( S_Linha_Comprovante ) );
                 Retorno_imp_Fiscal:=ECF_UsaComprovanteNaoFiscalVinculado( pchar( S_Salta_Linha+#13+#10+#13+#10+#13+#10 ) );
                 Retorno_imp_Fiscal:=ECF_UsaComprovanteNaoFiscalVinculado( pchar( S_Rodape_Comprovante ) );
                 Retorno_imp_Fiscal:=ECF_FechaComprovanteNaoFiscalVinculado();
                 end;
           //Obrigações do PAF-ECF
           GravaDadosDocECF('CC');//Comprovante de crédito ou débito }
           end;
      TFormaPGto.Next;
      end;
end;

procedure Tffechamentovenda_tef.ImprimiParcelaRelGerencial;
begin
      if TFormaPgtoCod_Pgto.Value=5//Crediário
      then begin
           FCrediario.TParcelasCarteira.First;
           While not FCrediario.TParcelasCarteira.Eof
           do begin
              S_Parcela:=FCrediario.TParcelasCarteiraPARCELA.Value;
              S_Valor_Parcela:=FormatFloat('##,###0.00',FCrediario.TParcelasCarteiraVALOR.AsCurrency);
              S_Vencimento:=DateToStr(FCrediario.TParcelasCarteiraVENCIMENTO.Value);

              if s_ImpFiscal = 'ECF Bematech' then
              Retorno_imp_Fiscal := Bematech_FI_UsaComprovanteNaoFiscalVinculado( pchar( S_Parcela +Space(15)+ S_Valor_Parcela +Space(12)+ S_Vencimento) )
              else if s_ImpFiscal = 'ECF Daruma' then
              Retorno_imp_Fiscal := Daruma_FI_UsaComprovanteNaoFiscalVinculado( pchar( S_Parcela +Space(15)+ S_Valor_Parcela +Space(12)+ S_Vencimento) )
              else if s_ImpFiscal = 'ECF Elgin' then
              Retorno_imp_Fiscal := Elgin_UsaComprovanteNaoFiscalVinculado( pchar( S_Parcela +Space(15)+ S_Valor_Parcela +Space(12)+ S_Vencimento) )
              else if s_ImpFiscal = 'ECF Sweda' then
              Retorno_imp_Fiscal := ECF_UsaComprovanteNaoFiscalVinculado( pchar( S_Parcela +Space(15)+ S_Valor_Parcela +Space(12)+ S_Vencimento) );

              FCrediario.TParcelasCarteira.Next;
              end;
       end;
end;

procedure Tffechamentovenda_tef.EasyTEFDiscadoImprimirLeituraX(
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

procedure Tffechamentovenda_tef.TFocoTimer(Sender: TObject);
begin
     TFoco.Enabled:=False;
     ForceForegroundWindow(ffechamentovenda_tef.Handle);//Força o focu no formulário
     if EasyTEFDiscado.gerenciadorAtivo
     then Informa('O Gerenciador foi ativado com sucesso pelo Aplicativo de Gestor Fiscal!!'+chr(13)+chr(13)+
                  'Selecione sua forma de pagamento!!!');
     ffechamentovenda_tef.FormShow(Sender);
end;

procedure Tffechamentovenda_tef.FormActivate(Sender: TObject);
begin
     if vAtivarComponenteTEF_Fechamento
     then AtivaComponenteTEF_Fechamento;
end;

procedure Tffechamentovenda_tef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     frmcheckout.TFoco.Enabled:=True;
end;

procedure Tffechamentovenda_tef.Timer1Timer(Sender: TObject);
begin
     LEncerramento.Visible := not LEncerramento.Visible;
end;

end.

