unit UMonitorPDV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RXShell, StdCtrls, XPMan, ExtCtrls, AppEvnts, IniFiles,
  SqlExpr, DBXPress, DBClient;

type
  TFMonitorPDV = class(TForm)
    SB: TStatusBar;
    RxTrayIcon1: TRxTrayIcon;
    GInformacaoPDV: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LIdentificacao: TLabel;
    LIP_PDV: TLabel;
    LUrlBDPDV: TLabel;
    TVerificaConexaoRemota: TTimer;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    LIP_Remoto: TLabel;
    LUrlBDRemoto: TLabel;
    GroupBox2: TGroupBox;
    ImageOF: TImage;
    ImageON: TImage;
    Label4: TLabel;
    Label7: TLabel;
    LDataHoraEnviados: TLabel;
    LDataHoraRecebidos: TLabel;
    ApplicationEvents1: TApplicationEvents;
    TEscondeForm: TTimer;
    TVerificaRecebidos: TTimer;
    LExecuta: TLabel;
    TAtualizaDeletados: TTimer;
    Image: TImage;
    TVerificaEnviados: TTimer;
    LogEvents: TApplicationEvents;
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure RxTrayIcon1DblClick(Sender: TObject);
    procedure TEscondeFormTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TVerificaConexaoRemotaTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TVerificaRecebidosTimer(Sender: TObject);
    procedure TAtualizaDeletadosTimer(Sender: TObject);
    procedure LogEventsException(Sender: TObject; E: Exception);
    procedure TVerificaEnviadosTimer(Sender: TObject);
  private
    { Private declarations }
    iRecords : Integer;
    nRecebeu_Dados, nEnviou_Dados : Boolean;
    IP_Local,IP_Remoto,URL_Local,URL_Remoto, PDV,
    Delay_Conexao_Remota,Delay_Atualiz_Recebido,Delay_Atualiz_Enviados,
    Delay_Atualiz_Deletados,Ativa_loq_Erro,vDir_Configuracao : String;

    procedure AbreConexaoLocal;
    procedure Ler_ConfigDataBase(Var IP_Local: String; Var IP_Remoto: String;
                Var Url_Local: String; Var URL_Remoto: String; Var PDV: String);
    procedure VerificaConexaoRemota;
    procedure AtualizaCadClientesPDV(sUlt_Alteracao : TDateTime);
    procedure AtualizaCadEstoquePDV(sUlt_Alteracao : TDateTime);
    procedure AtualizaCadEmpresaPDV(sUlt_Alteracao : TDateTime);
    procedure AtualizaCadECFAliquotaPDV;
    procedure AtualizaCadMarcaPDV;
    procedure AtualizaCadGrupoPDV;
    procedure AtualizaCadSecaoPDV;
    procedure AtualizaCadCoresPDV;
    procedure AtualizaCadTamanhoPDV;
    procedure PegaDataHoraServidor;
    procedure SetValorGeneratorPDV(CAMPO,TABELA,GENERATOR : String);
    procedure Le_ConfigIni;
    procedure AtualizaVendasRetaguarda(sUlt_Alteracao : TDateTime);
    procedure AtualizaReducoesRetaguarda(sUlt_Alteracao : TDateTime);
  public
    { Public declarations }
    procedure AbreConexaoRemota;
  end;

var
  FMonitorPDV: TFMonitorPDV;
  H : THandle;
  TD: TTransactionDesc;

implementation

uses UDM, DateUtils, DB, Math;

{$R *.dfm}

procedure TFMonitorPDV.PegaDataHoraServidor;
begin
     DM.QPegaDataHora.Close;
     DM.QPegaDataHora.Open;
end;

procedure TFMonitorPDV.AtualizaReducoesRetaguarda(sUlt_Alteracao : TDateTime);
begin
     With DM.QReducoesLocal
     do begin
        Close;
        Params[0].Value:=sUlt_Alteracao;
        Open;
        if not IsEmpty
        then begin
             While not Eof
             do begin
                DM.QVerifReducaoRetag.Close;
                DM.QVerifReducaoRetag.Params[0].AsInteger:=FieldByName('CODIGO').Value;
                DM.QVerifReducaoRetag.Params[1].AsString:=FieldByName('NRO_SERIE_EQP').AsString;
                DM.QVerifReducaoRetag.Open;
                if DM.QVerifReducaoRetag.IsEmpty//Se não a redução na tabela do retaguarda, então insere as informações
                then begin
                     nEnviou_Dados:=True;
                     DM.TCadReducaoRetag.Close;
                     DM.TCadReducaoRetag.Params[0].AsInteger:=-1;
                     DM.TCadReducaoRetag.Open;
                     DM.TCadReducaoRetag.Append;
                     DM.TCadReducaoRetagDATA_HORA.AsDateTime:=FieldByName('DATA_HORA').Value;
                     DM.TCadReducaoRetagDATA_MOVIMENTO.AsDateTime:=FieldByName('DATA_MOVIMENTO').Value;
                     DM.TCadReducaoRetagNRO_SERIE_EQP.AsString:=FieldByName('NRO_SERIE_EQP').AsString;
                     DM.TCadReducaoRetagNR_ORDEM_EQP.AsString:=FieldByName('NR_ORDEM_EQP').AsString;
                     DM.TCadReducaoRetagMODELO_DOC.AsString:=FieldByName('MODELO_DOC').AsString;
                     DM.TCadReducaoRetagNRO_CONTADOR_INICIO.AsInteger:=FieldByName('NRO_CONTADOR_INICIO').AsInteger;
                     DM.TCadReducaoRetagNRO_CONTADOR_FIM.AsInteger:=FieldByName('NRO_CONTADOR_FIM').AsInteger;
                     DM.TCadReducaoRetagNR_CONTADOR_Z.AsInteger:=FieldByName('NR_CONTADOR_Z').AsInteger;
                     DM.TCadReducaoRetagCONTADOR_REINICIO.AsInteger:=FieldByName('CONTADOR_REINICIO').AsInteger;
                     DM.TCadReducaoRetagVALOR_VENDA_BRUTA.AsFloat:=FieldByName('VALOR_VENDA_BRUTA').AsFloat;
                     DM.TCadReducaoRetagVALOR_VENDA_GERAL.AsFloat:=FieldByName('VALOR_VENDA_GERAL').AsFloat;
                     DM.TCadReducaoRetagVALOR_CANCELAMENTOS.AsFloat:=FieldByName('VALOR_CANCELAMENTOS').AsFloat;
                     DM.TCadReducaoRetagVALOR_DESCONTOS.AsFloat:=FieldByName('VALOR_DESCONTOS').AsFloat;
                     DM.TCadReducaoRetagVALOR_ISSQN.AsFloat:=FieldByName('VALOR_ISSQN').AsFloat;
                     DM.TCadReducaoRetagVALOR_SUBST_TRIB.AsFloat:=FieldByName('VALOR_SUBST_TRIB').AsFloat;
                     DM.TCadReducaoRetagVALOR_ISENTO.AsFloat:=FieldByName('VALOR_ISENTO').AsFloat;
                     DM.TCadReducaoRetagVALOR_NAO_INCIDENCIA.AsFloat:=FieldByName('VALOR_NAO_INCIDENCIA').AsFloat;
                     DM.TCadReducaoRetagALIQUOTA01.AsString:=FieldByName('ALIQUOTA01').AsString;
                     DM.TCadReducaoRetagVALOR_TPARCIAL01.AsFloat:=FieldByName('VALOR_TPARCIAL01').AsFloat;
                     DM.TCadReducaoRetagALIQUOTA01.AsString:=FieldByName('ALIQUOTA02').AsString;
                     DM.TCadReducaoRetagVALOR_TPARCIAL01.AsFloat:=FieldByName('VALOR_TPARCIAL02').AsFloat;
                     DM.TCadReducaoRetagALIQUOTA01.AsString:=FieldByName('ALIQUOTA03').AsString;
                     DM.TCadReducaoRetagVALOR_TPARCIAL01.AsFloat:=FieldByName('VALOR_TPARCIAL03').AsFloat;
                     DM.TCadReducaoRetagALIQUOTA01.AsString:=FieldByName('ALIQUOTA04').AsString;
                     DM.TCadReducaoRetagVALOR_TPARCIAL01.AsFloat:=FieldByName('VALOR_TPARCIAL04').AsFloat;
                     DM.TCadReducaoRetagALIQUOTA01.AsString:=FieldByName('ALIQUOTA05').AsString;
                     DM.TCadReducaoRetagVALOR_TPARCIAL01.AsFloat:=FieldByName('VALOR_TPARCIAL05').AsFloat;
                     DM.TCadReducaoRetagALIQUOTA01.AsString:=FieldByName('ALIQUOTA06').AsString;
                     DM.TCadReducaoRetagVALOR_TPARCIAL01.AsFloat:=FieldByName('VALOR_TPARCIAL06').AsFloat;
                     DM.TCadReducaoRetagALIQUOTA01.AsString:=FieldByName('ALIQUOTA07').AsString;
                     DM.TCadReducaoRetagVALOR_TPARCIAL01.AsFloat:=FieldByName('VALOR_TPARCIAL07').AsFloat;
                     DM.TCadReducaoRetagALIQUOTA01.AsString:=FieldByName('ALIQUOTA08').AsString;
                     DM.TCadReducaoRetagVALOR_TPARCIAL01.AsFloat:=FieldByName('VALOR_TPARCIAL08').AsFloat;
                     DM.TCadReducaoRetagALIQUOTA01.AsString:=FieldByName('ALIQUOTA09').AsString;
                     DM.TCadReducaoRetagVALOR_TPARCIAL01.AsFloat:=FieldByName('VALOR_TPARCIAL09').AsFloat;
                     DM.TCadReducaoRetagALIQUOTA01.AsString:=FieldByName('ALIQUOTA010').AsString;
                     DM.TCadReducaoRetagVALOR_TPARCIAL01.AsFloat:=FieldByName('VALOR_TPARCIAL010').AsFloat;
                     DM.TCadReducaoRetagCOD_REDUCAO_PDV.AsInteger:=FieldByName('CODIGO').AsInteger;
                     DM.TCadReducaoRetagALIQUOTA01.AsString:=FieldByName('POSI_ALIQUOTA01').AsString;
                     DM.TCadReducaoRetagALIQUOTA01.AsString:=FieldByName('POSI_ALIQUOTA02').AsString;
                     DM.TCadReducaoRetagALIQUOTA01.AsString:=FieldByName('POSI_ALIQUOTA03').AsString;
                     DM.TCadReducaoRetagALIQUOTA01.AsString:=FieldByName('POSI_ALIQUOTA04').AsString;
                     DM.TCadReducaoRetagALIQUOTA01.AsString:=FieldByName('POSI_ALIQUOTA05').AsString;
                     DM.TCadReducaoRetagALIQUOTA01.AsString:=FieldByName('POSI_ALIQUOTA06').AsString;
                     DM.TCadReducaoRetagALIQUOTA01.AsString:=FieldByName('POSI_ALIQUOTA07').AsString;
                     DM.TCadReducaoRetagALIQUOTA01.AsString:=FieldByName('POSI_ALIQUOTA08').AsString;
                     DM.TCadReducaoRetagALIQUOTA01.AsString:=FieldByName('POSI_ALIQUOTA09').AsString;
                     DM.TCadReducaoRetagALIQUOTA01.AsString:=FieldByName('POSI_ALIQUOTA010').AsString;
                     DM.TCadReducaoRetag.Post;
                     DM.TCadReducaoRetag.ApplyUpdates(-1);
                     end;
                Next;
                end;
             end;//if IsEmpty
        end;//With Qreducoeslocal
end;

procedure TFMonitorPDV.AtualizaVendasRetaguarda(sUlt_Alteracao : TDateTime);
var
   nTotal_Custo : Currency;
   Cont : Integer;
begin
     With DM.TVendaLocal
     do begin
        Close;
        Params[0].Value:=sUlt_Alteracao;
        Open;
        if not IsEmpty
        then begin
             While not Eof
             do begin
                DM.QVerifVendaPDV.Close;
                DM.QVerifVendaPDV.Params[0].AsInteger:=FieldByName('CODIGO').Value;
                DM.QVerifVendaPDV.Params[1].AsString:=FieldByName('NUMERO_ECF').Value;
                DM.QVerifVendaPDV.Params[2].AsString:=FieldByName('CUPOM_CANCELADO').Value;
                DM.QVerifVendaPDV.Open;
                //Verifica se a venda do pdv esta no retaguarda
                if not DM.QVerifVendaPDV.FieldByName('CODIGO').IsNull
                then begin
                     nEnviou_Dados:=True;
                    Try
                     With DM do begin
                     TD.TransactionId := 1;
                     TD.IsolationLevel := xilREADCOMMITTED;
                     if not SQLConnectionRetaguarda.InTransaction
                     then SQLConnectionRetaguarda.StartTransaction(TD);

                     TVendaRetag.Close;
                     TVendaRetag.Params[0].AsInteger:=-1;
                     TVendaRetag.Open;
                     TVendaRetag.Append;
                     TVendaRetagTIPO.AsString:=TVendaLocalTIPO.AsString;
                     TVendaRetagCODCLIENTE.AsInteger:=TVendaLocalCOD_CLIENTE.AsInteger;
                     TVendaRetagCODVENDEDOR1.AsInteger:=TVendaLocalCOD_VENDEDOR.AsInteger;
                     TVendaRetagCOMISSAO1.AsFloat:=100;
                     TVendaRetagNUMPGTO.AsInteger:=TVendaLocalNUMPGTO.AsInteger;
                     TVendaRetagDATAEMISSAO.AsDateTime:=TVendaLocalDATA.AsDateTime;
                     TVendaRetagFINANCEIRO.AsCurrency:=TVendaLocalACRESCIMO.AsCurrency;
                     TVendaRetagPERCFINANCEIRO.AsCurrency:=TVendaLocalPERC_ACRESCIMO.AsCurrency;
                     TVendaRetagDESCONTO.AsCurrency:=TVendaLocalDESCONTO.AsCurrency;
                     TVendaRetagPERCDESCONTO.AsCurrency:=TVendaLocalPERC_DESCONTO.AsCurrency;
                     TVendaRetagSUBTOTAL.AsCurrency:=TVendaLocalSUBTOTAL.AsCurrency;
                     TVendaRetagTOTAL.AsCurrency:=TVendaLocalTOTAL.AsCurrency;
                     TVendaRetagSAIDA.AsDateTime:=TVendaLocalHORA.AsDateTime;
                     TVendaRetagENTREGAFUTURA.AsString:='N';
                     TVendaRetagENTREGACOMPLETA.AsString:='N';
                     TVendaRetagSERVICO.AsString:='N';
                     TVendaRetagCODPORTADOR.AsInteger:=1;
                     TVendaRetagTROCO.AsCurrency:=TVendaLocalTROCO.AsCurrency;
                     TVendaRetagDINHEIRO.AsCurrency:=TVendaLocalDINHEIRO.AsCurrency;
                     TVendaRetagCHEQUE.AsCurrency:=TVendaLocalCHEQUE.AsCurrency;
                     TVendaRetagCARTAO.AsCurrency:=TVendaLocalCARTAO.AsCurrency;
                     TVendaRetagTICKET.AsCurrency:=TVendaLocalTICKET.AsCurrency;
                     TVendaRetagCREDIARIO.AsCurrency:=TVendaLocalCREDIARIO.AsCurrency;
                     TVendaRetagCHEQUE_PRE.AsCurrency:=TVendaLocalCHEQUE_PRE.AsCurrency;
                     TVendaRetagNUMERO_ECF.AsString:=TVendaLocalNUMERO_ECF.AsString;
                     TVendaRetagNUMERO_CUPOM.AsInteger:=TVendaLocalNUMERO_CUPOM.AsInteger;
                     TVendaRetagCOD_OPERADOR_PDV.AsInteger:=TVendaLocalCOD_OPERADOR.AsInteger;
                     TVendaRetagPDV.AsString:=TVendaLocalPDV.AsString;
                     TVendaRetagCODIGO_VENDA_PDV.AsInteger:=TVendaLocalCODIGO.AsInteger;
                     TVendaRetagCANCELADO.AsString:=TVendaLocalCUPOM_CANCELADO.AsString;
                     TVendaRetagBASE_ICMS.AsCurrency:=TVendaLocalBASE_ICMS.AsCurrency;
                     TVendaRetagVALOR_ICMS.AsCurrency:=TVendaLocalVALOR_ICMS.AsCurrency;
                     TVendaRetagNUM_CCF_CUPOM.AsInteger:=TVendaLocalNUM_CCF_CUPOM.AsInteger;
                     TVendaRetagMODELO_NF.Value:='02';
                     TVendaRetagSERIE_NF.Value:='2D';

                     nTotal_Custo:=0;
                     Cont:=0;
                     While not TItemVendaLocal.Eof
                     do begin
                        Inc(Cont);
                        TItemVendaRetag.Append;
                        TItemVendaRetagCONTROLE.AsInteger:=Cont;
                        TItemVendaRetagCODPRODUTO.AsInteger:=TItemVendaLocalCOD_PRODUTO.AsInteger;
                        TItemVendaRetagDATAEMISSAO.AsDateTime:=TVendaRetagDATAEMISSAO.AsDateTime;
                        TItemVendaRetagTIPO.AsString:=TVendaRetagTIPO.AsString;
                        TItemVendaRetagCODCLIENTE.AsInteger:=TVendaRetagCODCLIENTE.AsInteger;
                        TItemVendaRetagCODVENDEDOR1.AsInteger:=TVendaRetagCODVENDEDOR1.AsInteger;
                        TItemVendaRetagCOMISSAO1.AsFloat:=TVendaRetagCOMISSAO1.AsFloat;
                        TItemVendaRetagDESCRICAO.AsString:=TItemVendaLocalDESCRICAO.AsString;
                        TItemVendaRetagQTDE.AsCurrency:=TItemVendaLocalQUANTIDADE.AsCurrency;
                        TItemVendaRetagQTDEPEGA.AsCurrency:=0;
                        TItemVendaRetagPRECOFIXO.AsCurrency:=TItemVendaLocalVL_UNITARIO.AsCurrency;
                        TItemVendaRetagVENDIDO.AsCurrency:=TItemVendaLocalVL_UNITARIO.AsCurrency;
                        TItemVendaRetagTOTALITEN.AsCurrency:=TItemVendaLocalVL_TOTAL.AsCurrency;
                        TItemVendaRetagTABELA.AsString:=TItemVendaLocalTABELA.AsString;
                        TItemVendaRetagMAODEOBRA.AsString:='N';
                        TItemVendaRetagCODPORTADOR.AsInteger:=TVendaRetagCODPORTADOR.AsInteger;
                        TItemVendaRetagSERVICO.AsString:=TVendaRetagSERVICO.AsString;
                        TItemVendaRetagCOMNOTA.AsString:='S';
                        TItemVendaRetagNUMERO_ECF.AsString:=TItemVendaLocalNUMERO_ECF.AsString;
                        TItemVendaRetagNUMERO_CUPOM.AsInteger:=TItemVendaLocalNUMERO_CUPOM.AsInteger;
                        TItemVendaRetagITEM.AsInteger:=TItemVendaLocalITEM.AsInteger;
                        TItemVendaRetagST.AsString:=TItemVendaLocalST.AsString;
                        TItemVendaRetagALIQUOTA.AsCurrency:=TItemVendaLocalALIQUOTA.AsCurrency;
                        TItemVendaRetagCANCELADO.AsString:=TVendaRetagCANCELADO.AsString;
                        TItemVendaRetagBASE_ICMS.AsCurrency:=TItemVendaLocalBASE_ICMS.AsCurrency;
                        TItemVendaRetagVALOR_ICMS.AsCurrency:=TItemVendaLocalVALOR_ICMS.AsCurrency;
                        TItemVendaRetagIPI.AsCurrency:=TItemVendaLocalPERC_IPI.AsCurrency;
                        TItemVendaRetagVALOR_UNIT_BRUTO.AsCurrency:=TItemVendaLocalVL_UNIT_BRUTO.AsCurrency;
                        TItemVendaRetagVALOR_TOTAL_BRUTO.AsCurrency:=TItemVendaLocalVL_TOTAL_BRUTO.AsCurrency;
                        TItemVendaRetagPERC_DESCONTO.AsCurrency:=TItemVendaLocalPERC_DESCONTO.AsCurrency;
                        TItemVendaRetagVALOR_DESCONTO.AsCurrency:=TItemVendaLocalVALOR_DESCONTO.AsCurrency;
                        TItemVendaRetagPERC_ACRESCIMO.AsCurrency:=TItemVendaLocalPERC_ACRESCIMO.AsCurrency;
                        TItemVendaRetagVALOR_ACRESCIMO.AsCurrency:=TItemVendaLocalVALOR_ACRESCIMO.AsCurrency;
                        TItemVendaRetagCST.AsString:=TItemVendaLocalCST.AsString;

                        TItemVendaRetagCODGRUPO.AsInteger:=TItemVendaRetagCODGRUPO_1.AsInteger;
                        TItemVendaRetagCODMARCA.AsInteger:=TItemVendaRetagCODMARCA_1.AsInteger;
                        TItemVendaRetagCUSTOFINAL.AsCurrency:=TItemVendaRetagCUSTOFINAL_1.AsCurrency;
                        TItemVendaRetagTOTALCUSTO.AsCurrency:=(TItemVendaRetagCUSTOFINAL.AsCurrency * TItemVendaRetagQTDE.AsCurrency);
                        nTotal_Custo:=nTotal_Custo + TItemVendaRetagTOTALCUSTO.AsCurrency;
                        TItemVendaRetag.Post;


                        if DM.TVendaLocalCUPOM_CANCELADO.Value='N'
                        then begin
                              //Baixa Estoque
                              With DM.QConsultaRemoto
                              do begin
                                 Close;
                                 SQL.Clear;
                                 SQL.Add('UPDATE ESTOQUE SET QTDE = QTDE - :PQTDEBAIXA, ULT_ALTERACAO = CURRENT_TIMESTAMP');
                                 Sql.Add('WHERE CODIGO=:PCODIGO');
                                 ParamByName('PCODIGO').AsInteger:=TItemVendaRetagCODPRODUTO.AsInteger;
                                 ParamByName('PQTDEBAIXA').AsFloat:=TItemVendaRetagQTDE.AsFloat;
                                 ExecSQL();
                                 end;
                             end;    

                        TItemVendaLocal.Next;
                        end;
                     TVendaRetagTOTALCUSTO.AsCurrency:=nTotal_Custo;
                     TVendaRetag.Post;
                     TVendaRetag.ApplyUpdates(-1);

                     TVendaGradeLocal.Close;
                     TVendaGradeLocal.Params[0].AsInteger:=TVendaLocalCODIGO.AsInteger;
                     TVendaGradeLocal.Open;
                     if TVendaGradeLocal.RecordCount > 0
                     then begin
                          While not TVendaGradeLocal.Eof
                          do begin
                             TVendaGradeRetag.Close;
                             TVendaGradeRetag.Params[0].AsInteger:=-1;
                             TVendaGradeRetag.Open;
                             TVendaGradeRetag.Append;
                             TVendaGradeRetagCOD_VENDA.AsInteger:=TVendaRetagCODVENDA.AsInteger;
                             TVendaGradeRetagCOD_PRODUTO.AsInteger:=TVendaGradeLocalCOD_PRODUTO.AsInteger;
                             TVendaGradeRetagCOD_GRADE.AsInteger:=TVendaGradeLocalCOD_GRADE.AsInteger;
                             TVendaGradeRetagQTDE.AsCurrency:=TVendaGradeLocalQTDE.AsCurrency;
                             TVendaGradeRetagCOD_COR.AsInteger:=TVendaGradeLocalCOD_COR.AsInteger;
                             TVendaGradeRetagCOD_TAMANHO.AsInteger:=TVendaGradeLocalCOD_TAMANHO.AsInteger;
                             TVendaGradeRetag.Post;
                             TVendaGradeRetag.ApplyUpdates(-1);


                             if DM.TVendaLocalCUPOM_CANCELADO.Value='N'
                             then begin
                                   //Baixa Estoque na Grade
                                   With DM.QConsultaRemoto
                                   do begin
                                      Close;
                                      SQL.Clear;
                                      SQL.Add('UPDATE ESTOQUE_GRADE SET QTDE = QTDE - :PQTDEBAIXA');
                                      Sql.Add('WHERE CODIGO=:PCODIGO');
                                      ParamByName('PCODIGO').AsInteger:=TVendaGradeLocalCOD_GRADE.AsInteger;
                                      ParamByName('PQTDEBAIXA').AsFloat:=TVendaGradeLocalQTDE.AsFloat;
                                      ExecSQL();
                                      end;
                                  end;    

                             DM.TVendaGradeLocal.Next;
                             end;
                          end;

                     if SQLConnectionRetaguarda.InTransaction
                     then SQLConnectionRetaguarda.Commit(TD);
                     end;//With DM
                Except
                  on E: exception
                  do begin
                     if DM.SQLConnectionRetaguarda.InTransaction
                     then DM.SQLConnectionRetaguarda.RollBack(TD);
                     MessageDlg('Ocorreu o seguinte erro ao tentar enviar informações para '+
                                'o servidor: '+E.Message+#13+#13+
                                'Informe o erro acima para o suporte técnico!!!',mtInformation,[mbOk],0);
                     raise;
                     end;
                   end;//Try
                 end;//if not DM.QVerifVendaPDV.FieldByName('CODIGO').IsNull
              Next;
              end;
          end;
      end;
end;

procedure TFMonitorPDV.SetValorGeneratorPDV(CAMPO,TABELA,GENERATOR : String);
var
   nValor_Generator : Integer;
begin
     With DM.QGen
     do begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT MAX('+CAMPO+') FROM '+TABELA);
        Open;
        nValor_Generator:=Fields.Fields[0].AsInteger;
        end;

     With DM.QGen
     do begin
        Close;
        Sql.Clear;
        Sql.Add('SET GENERATOR '+GENERATOR+' TO '+IntToStr(nValor_Generator));
        ExecSql;
        end;
end;

procedure TFMonitorPDV.AtualizaCadClientesPDV(sUlt_Alteracao : TDateTime);
begin
     iRecords:=0;
     DM.QVerificaCadClientes.Close;
     DM.QVerificaCadClientes.Params[0].Value:=sUlt_Alteracao;
     DM.QVerificaCadClientes.Open;
     if not DM.QVerificaCadClientes.IsEmpty
     then begin
           nRecebeu_Dados:=True;
           While not DM.QVerificaCadClientes.Eof
           do begin
              Inc(iRecords);
              With DM.SQLStoredProcClientes
              do begin
                 Close;
                 Application.ProcessMessages;

                 Params[0].AsInteger:=DM.QVerificaCadClientesCODIGO.AsInteger;
                 Params[1].AsString:=DM.QVerificaCadClientesNOME.AsString;
                 Params[2].AsString:=DM.QVerificaCadClientesENDERECO.AsString;
                 Params[3].AsString:=DM.QVerificaCadClientesBAIRRO.AsString;
                 Params[4].AsString:=DM.QVerificaCadClientesCIDADE.AsString;
                 Params[5].AsString:=DM.QVerificaCadClientesUF.AsString;
                 Params[6].AsString:=DM.QVerificaCadClientesCEP.AsString;
                 Params[7].AsString:=DM.QVerificaCadClientesTELEFONE.AsString;
                 Params[8].AsString:=DM.QVerificaCadClientesCELULAR.AsString;
                 Params[9].AsString:=DM.QVerificaCadClientesCPF.AsString;
                 Params[10].AsString:=DM.QVerificaCadClientesRG.AsString;
                 Params[11].AsString:=DM.QVerificaCadClientesCGC.AsString;
                 Params[12].AsString:=DM.QVerificaCadClientesIE.AsString;
                 Params[13].AsString:=DM.QVerificaCadClientesINADIMPLENTE.AsString;
                 Params[14].Value:=DM.QVerificaCadClientesTRAVA.AsFloat;
                 Params[15].Value:=DM.QVerificaCadClientesLIMITECREDITO.AsFloat;
                 Params[16].AsString:=DM.QVerificaCadClientesOBS.AsString;
                 Params[17].AsInteger:=DM.QVerificaCadClientesCODCIDADE.AsInteger;
                 Params[18].AsInteger:=DM.QVerificaCadClientesCODBAIRRO.AsInteger;
                 Params[19].AsString:=DM.QVerificaCadClientesINATIVO.AsString;

                 LExecuta.Caption:='Em execução';
                 Application.ProcessMessages;

                 ExecProc;

                 LExecuta.Caption:='';
                 Application.ProcessMessages;
                 end;
              DM.QVerificaCadClientes.Next;

              SB.Panels[1].Text:=IntToStr(iRecords)+' records Fetched no cadastro de clientes do PDV';
              Application.ProcessMessages;
            end;
        end;
    if nRecebeu_Dados
    then SetValorGeneratorPDV('CODIGO','CLIENTE','GEN_CLIENTE_ID');

    DM.QVerificaCadClientes.Close;
    SB.Panels[1].Text:='';
    Application.ProcessMessages;
end;

procedure TFMonitorPDV.AtualizaCadEstoquePDV(sUlt_Alteracao : TDateTime);
var
   Tem_Grade : Boolean;
begin
     iRecords:=0;
     Tem_Grade:=False;
     DM.QVerificaCadEstoque.Close;
     DM.QVerificaCadEstoque.Params[0].Value:=sUlt_Alteracao;
     DM.QVerificaCadEstoque.Open;
     if not DM.QVerificaCadEstoque.IsEmpty
     then begin
           nRecebeu_Dados:=True;
           //Atualiza as tabelas vinculada no cadastro do produto
           AtualizaCadECFAliquotaPDV;
           AtualizaCadMarcaPDV;
           AtualizaCadGrupoPDV;
           AtualizaCadSecaoPDV;
           AtualizaCadCoresPDV;
           AtualizaCadTamanhoPDV;

           While not DM.QVerificaCadEstoque.Eof
           do begin
              Inc(iRecords);
              With DM.SQLStoredProcEstoque
              do begin
                 Close;
                 Application.ProcessMessages;

                 Params[0].AsInteger:=DM.QVerificaCadEstoqueCODIGO.AsInteger;
                 Params[1].AsString:=DM.QVerificaCadEstoqueCODBARRA.AsString;
                 Params[2].AsString:=DM.QVerificaCadEstoqueREFERENCIA.AsString;
                 Params[3].AsString:=DM.QVerificaCadEstoqueDESCRICAO.AsString;
                 Params[4].AsInteger:=DM.QVerificaCadEstoqueCODGRUPO.AsInteger;
                 Params[5].AsInteger:=DM.QVerificaCadEstoqueCODMARCA.AsInteger;
                 Params[6].Value:=DM.QVerificaCadEstoqueQTDE.AsFloat;
                 Params[7].Value:=DM.QVerificaCadEstoqueQTDEMINIMA.AsFloat;
                 Params[8].Value:=DM.QVerificaCadEstoqueCUSTOFINAL.AsFloat;
                 Params[9].Value:=DM.QVerificaCadEstoquePRECOVENDA.AsFloat;
                 Params[10].Value:=DM.QVerificaCadEstoquePRECOPRAZO.AsFloat;
                 Params[11].Value:=DM.QVerificaCadEstoqueDESCONTOMAX.AsFloat;
                 Params[12].AsString:=DM.QVerificaCadEstoqueMED.AsString;
                 Params[13].AsInteger:=DM.QVerificaCadEstoqueCODALIQUOTA.AsInteger;
                 Params[14].AsString:=DM.QVerificaCadEstoqueBALANCA.AsString;
                 Params[15].AsInteger:=DM.QVerificaCadEstoqueCODSECAO.AsInteger;
                 Params[16].AsString:=DM.QVerificaCadEstoqueOBS.AsString;
                 Params[17].Value:=DM.QVerificaCadEstoqueIPI.AsFloat;
                 Params[18].AsString:=DM.QVerificaCadEstoqueCOD_SIT.AsString;
                 Params[19].AsString:=DM.QVerificaCadEstoqueINATIVO.AsString;
                 if not DM.QVerificaCadEstoqueDATAULTVENDA.IsNull
                 then Params[20].AsDate:=DM.QVerificaCadEstoqueDATAULTVENDA.AsDateTime;
                 Params[21].AsString:=DM.QVerificaCadEstoqueIAT.AsString;
                 Params[22].AsString:=DM.QVerificaCadEstoqueIPPT.AsString;
                 Params[23].Value:=DM.QVerificaCadEstoqueQTDEEF.AsFloat;

                 LExecuta.Caption:='Em execução';
                 Application.ProcessMessages;

                 ExecProc;

                 DM.QVerificaCadEstoqueGrade.Close;
                 DM.QVerificaCadEstoqueGrade.Params[0].AsInteger:=DM.QVerificaCadEstoqueCODIGO.AsInteger;
                 DM.QVerificaCadEstoqueGrade.Open;
                 While not DM.QVerificaCadEstoqueGrade.Eof
                 do begin
                    Tem_Grade:=True;
                    With DM.SQLStoredProcEstoqueGrade
                    do begin
                       Params[0].AsInteger:=DM.QVerificaCadEstoqueGradeCODIGO.AsInteger;
                       Params[1].AsInteger:=DM.QVerificaCadEstoqueGradeCOD_PRODUTO.AsInteger;
                       Params[2].AsString:=DM.QVerificaCadEstoqueGradeVARIACAO.AsString;
                       Params[3].Value:=DM.QVerificaCadEstoqueGradeQTDE.AsFloat;
                       Params[4].Value:=DM.QVerificaCadEstoqueGradeQTDE_EF.AsFloat;
                       Params[5].Value:=DM.QVerificaCadEstoqueGradeQTDE_MINIMA.AsFloat;
                       Params[6].AsString:=DM.QVerificaCadEstoqueGradeCOD_BARRA.AsString;
                       Params[7].AsString:=DM.QVerificaCadEstoqueGradeREFERENCIA.AsString;
                       Params[8].Value:=DM.QVerificaCadEstoqueGradeMED.AsString;
                       if DM.QVerificaCadEstoqueGradeCOD_COR.AsInteger > 0 then
                       Params[9].AsInteger:=DM.QVerificaCadEstoqueGradeCOD_COR.AsInteger;
                       if DM.QVerificaCadEstoqueGradeCOD_TAMANHO.AsInteger > 0 then
                       Params[10].AsInteger:=DM.QVerificaCadEstoqueGradeCOD_TAMANHO.AsInteger;
                       ExecProc;
                       end;
                       DM.QVerificaCadEstoqueGrade.Next;
                    end;

                 LExecuta.Caption:='';
                 Application.ProcessMessages;

                 end;
              DM.QVerificaCadEstoque.Next;

              SB.Panels[1].Text:=IntToStr(iRecords)+' records Fetched no cadastro de estoque do PDV';
              Application.ProcessMessages;
              end;
           end;
    if nRecebeu_Dados
    then begin
         SetValorGeneratorPDV('CODIGO','ESTOQUE','GEN_ESTOQUE_ID');

         if Tem_Grade
         then SetValorGeneratorPDV('CODIGO','ESTOQUE_GRADE','GEN_ESTOQUE_GRADE_ID');
         end;

    DM.QVerificaCadEstoque.Close;
    SB.Panels[1].Text:='';
    Application.ProcessMessages;
end;

procedure TFMonitorPDV.AtualizaCadEmpresaPDV(sUlt_Alteracao : TDateTime);
begin
     iRecords:=0;
     DM.QVerificaCadEmpresa.Close;
     DM.QVerificaCadEmpresa.Params[0].Value:=sUlt_Alteracao;
     DM.QVerificaCadEmpresa.Open;
     if not DM.QVerificaCadEmpresa.IsEmpty
     then begin
           nRecebeu_Dados:=True;
           While not DM.QVerificaCadEmpresa.Eof
           do begin
              Inc(iRecords);
              With DM.SQLStoredProcEmpresas
              do begin
                 Close;
                 Application.ProcessMessages;

                 Params[0].AsInteger:=DM.QVerificaCadEmpresaCODIGO.AsInteger;
                 Params[1].AsString:=DM.QVerificaCadEmpresaRazao.AsString;
                 Params[2].AsString:=DM.QVerificaCadEmpresaNome.AsString;
                 Params[3].AsString:=DM.QVerificaCadEmpresaEndereco.AsString;
                 Params[4].AsString:=DM.QVerificaCadEmpresaBairro.AsString;
                 Params[5].AsString:=DM.QVerificaCadEmpresaNOME_CIDADE.AsString;
                 Params[6].AsString:=DM.QVerificaCadEmpresaUF.AsString;
                 Params[7].AsString:=DM.QVerificaCadEmpresaCEP.AsString;
                 Params[8].AsString:=DM.QVerificaCadEmpresaCGC.AsString;
                 Params[9].AsString:=DM.QVerificaCadEmpresaIE.AsString;
                 Params[10].AsString:='';//Insc. municipal
                 Params[11].AsString:=DM.QVerificaCadEmpresaFone.AsString;
                 Params[12].AsString:=DM.QVerificaCadEmpresaFax.AsString;
                 Params[13].Value:=DateToStr(Date);
                 Params[14].AsString:=DM.QVerificaCadEmpresaCONTATO.AsString;

                 LExecuta.Caption:='Em execução';
                 Application.ProcessMessages;

                 ExecProc;

                 LExecuta.Caption:='';
                 Application.ProcessMessages;

                 end;
              DM.QVerificaCadEmpresa.Next;

              SB.Panels[1].Text:=IntToStr(iRecords)+' records Fetched no cadastro de empresa do PDV';
              Application.ProcessMessages;
              end;
           end;
    if nRecebeu_Dados
    then SetValorGeneratorPDV('ID','EMPRESA','GEN_EMPRESA_ID');

    DM.QVerificaCadEmpresa.Close;
    SB.Panels[1].Text:='';
    Application.ProcessMessages;
end;

procedure TFMonitorPDV.AtualizaCadECFAliquotaPDV;
begin
     iRecords:=0;
     DM.QVerificaCadECFAliquota.Close;
     DM.QVerificaCadECFAliquota.Open;
     if not DM.QVerificaCadECFAliquota.IsEmpty
     then begin
           While not DM.QVerificaCadECFAliquota.Eof
           do begin
              Inc(iRecords);
              With DM.SQLStoredProcECFAliquota
              do begin
                 Close;
                 Application.ProcessMessages;

                 Params[0].AsInteger:=DM.QVerificaCadECFAliquotaCODIGO.AsInteger;
                 Params[1].AsString:=DM.QVerificaCadECFAliquotaNOME.AsString;
                 Params[2].Value:=DM.QVerificaCadECFAliquotaALIQUOTA.AsFloat;
                 Params[3].AsString:=DM.QVerificaCadECFAliquotaCODIGOCUPOM.AsString;

                 LExecuta.Caption:='Em execução';
                 Application.ProcessMessages;

                 ExecProc;

                 LExecuta.Caption:='';
                 Application.ProcessMessages;

                 end;
              DM.QVerificaCadECFAliquota.Next;

              SB.Panels[1].Text:=IntToStr(iRecords)+' records Fetched no cadastro de ecfaliquota do PDV';
              Application.ProcessMessages;
              end;
           end;
    SetValorGeneratorPDV('CODIGO','ECFALIQUOTA','GEN_ECFALIQUOTA_ID');

    DM.QVerificaCadECFAliquota.Close;
    SB.Panels[1].Text:='';
    Application.ProcessMessages;
end;

procedure TFMonitorPDV.AtualizaCadMarcaPDV;
begin
     iRecords:=0;
     DM.QVerificaCadMarca.Close;
     DM.QVerificaCadMarca.Open;
     if not DM.QVerificaCadMarca.IsEmpty
     then begin
           While not DM.QVerificaCadMarca.Eof
           do begin
              Inc(iRecords);
              With DM.SQLStoredProcMarca
              do begin
                 Close;
                 Application.ProcessMessages;

                 Params[0].AsInteger:=DM.QVerificaCadMarcaCODIGO.AsInteger;
                 Params[1].AsString:=DM.QVerificaCadMarcaNOME.AsString;

                 LExecuta.Caption:='Em execução';
                 Application.ProcessMessages;

                 ExecProc;

                 LExecuta.Caption:='';
                 Application.ProcessMessages;

                 end;
              DM.QVerificaCadMarca.Next;

              SB.Panels[1].Text:=IntToStr(iRecords)+' records Fetched no cadastro de marcas do PDV';
              Application.ProcessMessages;
              end;
           end;
    SetValorGeneratorPDV('CODIGO','MARCA','GEN_MARCA_ID');

    DM.QVerificaCadMarca.Close;
    SB.Panels[1].Text:='';
    Application.ProcessMessages;
end;

procedure TFMonitorPDV.AtualizaCadGrupoPDV;
begin
     iRecords:=0;
     DM.QVerificaCadGrupo.Close;
     DM.QVerificaCadGrupo.Open;
     if not DM.QVerificaCadGrupo.IsEmpty
     then begin
           While not DM.QVerificaCadGrupo.Eof
           do begin
              Inc(iRecords);
              With DM.SQLStoredProcGrupo
              do begin
                 Close;
                 Application.ProcessMessages;

                 Params[0].AsInteger:=DM.QVerificaCadGrupoCODIGO.AsInteger;
                 Params[1].AsString:=DM.QVerificaCadGrupoNOME.AsString;

                 LExecuta.Caption:='Em execução';
                 Application.ProcessMessages;

                 ExecProc;

                 LExecuta.Caption:='';
                 Application.ProcessMessages;

                 end;
              DM.QVerificaCadGrupo.Next;

              SB.Panels[1].Text:=IntToStr(iRecords)+' records Fetched no cadastro de grupos do PDV';
              Application.ProcessMessages;
              end;
           end;
    SetValorGeneratorPDV('CODIGO','GRUPO','GEN_GRUPO_ID');

    DM.QVerificaCadGrupo.Close;
    SB.Panels[1].Text:='';
    Application.ProcessMessages;
end;

procedure TFMonitorPDV.AtualizaCadSecaoPDV;
begin
     iRecords:=0;
     DM.QVerificaCadSecao.Close;
     DM.QVerificaCadSecao.Open;
     if not DM.QVerificaCadSecao.IsEmpty
     then begin
           While not DM.QVerificaCadSecao.Eof
           do begin
              Inc(iRecords);
              With DM.SQLStoredProcSecao
              do begin
                 Close;
                 Application.ProcessMessages;

                 Params[0].AsInteger:=DM.QVerificaCadSecaoCODIGO.AsInteger;
                 Params[1].AsString:=DM.QVerificaCadSecaoNOME.AsString;

                 LExecuta.Caption:='Em execução';
                 Application.ProcessMessages;

                 ExecProc;

                 LExecuta.Caption:='';
                 Application.ProcessMessages;

                 end;
              DM.QVerificaCadSecao.Next;

              SB.Panels[1].Text:=IntToStr(iRecords)+' records Fetched no cadastro de seções do PDV';
              Application.ProcessMessages;
              end;
           end;
    SetValorGeneratorPDV('CODIGO','SECAO','GEN_SECAO_ID');

    DM.QVerificaCadSecao.Close;
    SB.Panels[1].Text:='';
    Application.ProcessMessages;
end;

procedure TFMonitorPDV.AtualizaCadCoresPDV;
begin
     iRecords:=0;
     DM.QVerifCadCores.Close;
     DM.QVerifCadCores.Open;
     if not DM.QVerifCadCores.IsEmpty
     then begin
           While not DM.QVerifCadCores.Eof
           do begin
              Inc(iRecords);
              With DM.SQLStoredProcCores
              do begin
                 Close;
                 Application.ProcessMessages;

                 Params[0].AsInteger:=DM.QVerifCadCoresCODIGO.AsInteger;
                 Params[1].AsString:=DM.QVerifCadCoresNOME_COR.AsString;

                 LExecuta.Caption:='Em execução';
                 Application.ProcessMessages;

                 ExecProc;

                 LExecuta.Caption:='';
                 Application.ProcessMessages;

                 end;
              DM.QVerifCadCores.Next;

              SB.Panels[1].Text:=IntToStr(iRecords)+' records Fetched no cadastro de Cores do PDV';
              Application.ProcessMessages;
              end;
           end;
    SetValorGeneratorPDV('CODIGO','ESTOQUE_GRADE_CORES','GEN_ESTOQUE_GRADE_CORES_ID');

    DM.QVerifCadCores.Close;
    SB.Panels[1].Text:='';
    Application.ProcessMessages;
end;

procedure TFMonitorPDV.AtualizaCadTamanhoPDV;
begin
     iRecords:=0;
     DM.QVerifCadTamanho.Close;
     DM.QVerifCadTamanho.Open;
     if not DM.QVerifCadTamanho.IsEmpty
     then begin
           While not DM.QVerifCadTamanho.Eof
           do begin
              Inc(iRecords);
              With DM.SQLStoredProcTamanho
              do begin
                 Close;
                 Application.ProcessMessages;

                 Params[0].AsInteger:=DM.QVerifCadTamanhoCODIGO.AsInteger;
                 Params[1].AsString:=DM.QVerifCadTamanhoNOME_TAMANHO.AsString;

                 LExecuta.Caption:='Em execução';
                 Application.ProcessMessages;

                 ExecProc;

                 LExecuta.Caption:='';
                 Application.ProcessMessages;

                 end;
              DM.QVerifCadTamanho.Next;

              SB.Panels[1].Text:=IntToStr(iRecords)+' records Fetched no cadastro de Tamanhos do PDV';
              Application.ProcessMessages;
              end;
           end;
    SetValorGeneratorPDV('CODIGO','ESTOQUE_GRADE_TAMANHOS','GEN_ESTOQUE_GRADE_TAMANHOS_ID');

    DM.QVerifCadTamanho.Close;
    SB.Panels[1].Text:='';
    Application.ProcessMessages;
end;



Function GetVersaoArq: string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(
    ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0,
    VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue),
    VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(
      dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(
      dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(
      dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
end;

procedure TFMonitorPDV.VerificaConexaoRemota;
begin
      if DM.TCPTestaConexao.Connected
      then DM.TCPTestaConexao.Disconnect;
      DM.TCPTestaConexao.Host := IP_Remoto;
      DM.TCPTestaConexao.Port := 3050;
     Try
       DM.TCPTestaConexao.Connect(5000);//Aguarda 5 segundos
       ImageON.Visible:=True;
       ImageOF.Visible:=False;
     Except
       ImageON.Visible:=False;
       ImageOF.Visible:=True;
       Application.ProcessMessages;
       end;
end;

procedure TFMonitorPDV.AbreConexaoLocal;
begin
   Try
     DM.SQLConnectionLocal.Connected:=False;
     DM.SQLConnectionLocal.Params.Values['Database']:=IP_Local+':'+Url_Local;
     DM.SQLConnectionLocal.Connected:=True;
   Except
     on E: exception
     do begin
        MessageDlg('Não foi possivél se conectar com o banco de dados local para ativar o monitor de '+
                   'atualizações do PDV. Informe o Erro apresentado abaixo para o Suporte Técnico!'+#13+
                   E.Message,mtWarning,[mbOk],0);
        Application.Terminate;
        Raise;
     end;
   end;  
end;

procedure TFMonitorPDV.AbreConexaoRemota;
begin
    if (IP_Remoto<>'')and(Url_Remoto<>'')
    then begin
         if DM.SQLConnectionRetaguarda.Connected=False
         then begin
             Try
               DM.SQLConnectionRetaguarda.Connected:=False;
               DM.SQLConnectionRetaguarda.Params.Values['Database']:=IP_Remoto+'/3050'+':'+Url_Remoto;
               DM.SQLConnectionRetaguarda.Connected:=True;
               ImageON.Visible:=True;
               ImageOF.Visible:=False;
             Except
               ImageON.Visible:=False;
               ImageOF.Visible:=True;
               end;
            end;
         end
    else begin
         ImageON.Visible:=False;
         ImageOF.Visible:=True;
         end;
end;

procedure TFMonitorPDV.Ler_ConfigDataBase(Var IP_Local: String; Var IP_Remoto: String; Var Url_Local: String;
                                        Var URL_Remoto: String; Var PDV: String);
var
   Banco : TIniFile;
begin
  Try
    Banco := TIniFile.create(GetCurrentDir+'\database.ini');
    IP_Local    := Banco.ReadString('LOCAL','IP',IP_Local);
    URL_Local   := Banco.ReadString('LOCAL','URL',URL_Local);
    PDV         := Banco.ReadString('LOCAL','PDV',PDV);
    IP_Remoto   := Banco.ReadString('REMOTO','IP',IP_Remoto);
    URL_Remoto  := Banco.ReadString('REMOTO','URL',URL_Remoto);
  Finally
    Banco.Free;
  end;
end;

procedure TFMonitorPDV.ApplicationEvents1Minimize(Sender: TObject);
begin
   h := FindWindow(nil,'MonitorPDV'); { acha o ponteiro da aplicação no sistema}
   ShowWindow(h,SW_HIDE); { esconde a aplicação da barra de tarefas}
   RxTrayIcon1.Active := true; { coloca ícone no tray icon}
   hide; { esconde o form }
end;

procedure TFMonitorPDV.RxTrayIcon1DblClick(Sender: TObject);
begin
   show; {Mostra o form}
   WindowState := wsNormal;
   H := FindWindow(nil,'MonitorPDV'); { acha o ponteiro da aplicação no sistema}
   ShowWindow(h,SW_RESTORE); { mostra aplicação na barra de tarefas}
   RxTrayIcon1.Active := false; {oculta ícone do tray icon}
end;

procedure TFMonitorPDV.TEscondeFormTimer(Sender: TObject);
begin
    TEscondeForm.Enabled:=False;
    h := FindWindow(nil,'MonitorPDV'); { acha o ponteiro da aplicação no sistema}
    ShowWindow(h,SW_HIDE); { esconde a aplicação da barra de tarefas}
    RxTrayIcon1.Active := true; { coloca ícone no tray icon}
    hide; { esconde o form }
end;

procedure TFMonitorPDV.FormCreate(Sender: TObject);
begin
     if not DirectoryExists('C:\Apgef\Local')
     then ForceDirectories('C:\Apgef\Local');

     SB.Panels[0].Text:='Versão e Build: '+GetVersaoArq;

     Ler_configDataBase(IP_Local,IP_Remoto,Url_Local,Url_Remoto,PDV);
     Le_ConfigIni();

     TVerificaConexaoRemota.Interval:=StrToInt(Delay_Conexao_Remota);
     TVerificaRecebidos.Interval:=StrToInt(Delay_Atualiz_Recebido);
     TVerificaEnviados.Interval:=StrToInt(Delay_Atualiz_Enviados);
     TAtualizaDeletados.Interval:=StrToInt(Delay_Atualiz_Deletados);
     
     AbreConexaoLocal;

     //Informações Local
     LIdentificacao.Caption:=PDV;
     LIP_PDV.Caption:=IP_Local;
     LUrlBDPDV.Caption:=URL_Local;

     if DM.TDeployULT_ENVIADOS.AsDateTime > 0
     then LDataHoraEnviados.Caption:=DateTimeToStr(DM.TDeployULT_ENVIADOS.AsDateTime)
     else LDataHoraEnviados.Caption:='';
     if DM.TDeployULT_RECEBIDOS.AsDateTime > 0
     then LDataHoraRecebidos.Caption:=DateTimeToStr(DM.TDeployULT_RECEBIDOS.AsDateTime)
     else LDataHoraRecebidos.Caption:='';

     //Informações Remota
     LIP_Remoto.Caption:=IP_Remoto;
     LUrlBDRemoto.Caption:=URL_Remoto;
end;

procedure TFMonitorPDV.FormDestroy(Sender: TObject);
begin
     DM.SQLConnectionRetaguarda.Connected:=False;
     DM.SQLConnectionLocal.Connected:=False;
end;

procedure TFMonitorPDV.TVerificaConexaoRemotaTimer(Sender: TObject);
begin
     Image.Visible:=True;
     Repaint;

     VerificaConexaoRemota;

     Image.Visible:=False;
     Application.ProcessMessages;
end;

procedure TFMonitorPDV.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if FindWindow('TFrmPrincipal', nil) = 0
     then begin
           if CanClose = True
           then begin
                TVerificaConexaoRemota.Enabled:=False;
                DM.TCPTestaConexao.Disconnect;
                DM.SQLConnectionRetaguarda.Connected:=False;
                Application.ProcessMessages;
                if MessageDlg('Tem certeza que deseja encerrar o Monitor de Atualizações do PDV?',
                              mtConfirmation,[mbok,mbCancel],0)=mrOk
                then Application.Terminate
                else CanClose := False;
                end;
           end;
end;

procedure TFMonitorPDV.TVerificaRecebidosTimer(Sender: TObject);
var
   vData_Hora : TDateTime;
begin
     if ImageON.Visible//Se o servidor estiver ativo, então verifica as atualizações
     then begin
          nRecebeu_Dados:=False;
          TVerificaRecebidos.Enabled:=False;

          if DM.TDeployULT_RECEBIDOS.AsDateTime > 0
          then vData_Hora:=DM.TDeployULT_RECEBIDOS.AsDateTime
          else vData_Hora:=Now-1;

        Try
          AtualizaCadClientesPDV(vData_Hora);
          AtualizaCadEstoquePDV(vData_Hora);
          AtualizaCadEmpresaPDV(vData_Hora);

          if nRecebeu_Dados
          then begin
               PegaDataHoraServidor;
               if DM.TDeploy.RecordCount=0
               then DM.TDeploy.Append
               else DM.TDeploy.Edit;
               DM.TDeployULT_RECEBIDOS.AsDateTime:=DM.QPegaDataHoraCURRENT_TIMESTAMP.AsDateTime;
               DM.TDeploy.Post;
               LDataHoraRecebidos.Caption:=DateTimeToStr(DM.TDeployULT_RECEBIDOS.AsDateTime);
               end;

        except
          end;

          TVerificaRecebidos.Enabled:=True;
          Application.ProcessMessages;
          end;
end;

procedure TFMonitorPDV.TAtualizaDeletadosTimer(Sender: TObject);
begin
     //Esta rotina faz a verificação dos registros excluidos no banco de dados,
     //a apenas 1 vez por execução do monitor, e quatro horas após ser excutado
     if ImageON.Visible//Se o servidor estiver ativo, então verifica as atualizações
     then begin
          TAtualizaDeletados.Enabled:=False;

//########EXCLUI CADASTRO DE CLIENTES###########################################

        Try

          With DM.QConsultaLocal//Passar valor Null no campo Flag
          do begin
             Close;
             Sql.Clear;
             Sql.add('UPDATE CLIENTE SET FLAG = NULL');
             ExecSQL();
             Close;//Fecha a consulta
             end;

          iRecords:=0;
          With DM.QConsultaRemoto
          do begin
             Close;
             SQl.Clear;
             SQL.Add('SELECT CODIGO FROM CLIENTE');
             Open;
             While not Eof
             do begin
                Inc(iRecords);

                DM.SQLStoredProcCliExcluido.Params[0].Value:=DM.QConsultaRemoto.FieldByName('CODIGO').Value;
                DM.SQLStoredProcCliExcluido.Params[1].AsString:='S';
                DM.SQLStoredProcCliExcluido.ExecProc;

                DM.QConsultaRemoto.Next;

                LExecuta.Caption:='Em execução';
                SB.Panels[1].Text:='Lendo: '+IntToStr(iRecords)+' verificando se existe cadastro de cliente excluído no PDV.';

                Repaint;
                end;
             Close;//Fecha a consulta
             end;
          //Se houver algum campo Null, então o registro foi deletado no retaguarda,
          //então eu excluo do banco de dados do PDV.
          With DM.QConsultaLocal
          do begin
             Close;
             Sql.Clear;
             Sql.add('DELETE FROM CLIENTE WHERE FLAG IS NULL');
             ExecSQL();
             Close;//Fecha a consulta
             end;
          SB.Panels[1].Text:='';
          LExecuta.Caption:='';
          Application.ProcessMessages;

//########EXCLUI CADASTRO DE ESTOQUE############################################

          With DM.QConsultaLocal//Passar valor Null no campo Flag
          do begin
             Close;
             Sql.Clear;
             Sql.add('UPDATE ESTOQUE SET FLAG = NULL');
             ExecSQL();
             Close;//Fecha a consulta
             end;

          iRecords:=0;
          With DM.QConsultaRemoto
          do begin
             Close;
             SQl.Clear;
             SQL.Add('SELECT CODIGO FROM ESTOQUE');
             Open;
             While not Eof
             do begin
                Inc(iRecords);

                DM.SQLStoredProcProdExcluido.Params[0].Value:=DM.QConsultaRemoto.FieldByName('CODIGO').Value;
                DM.SQLStoredProcProdExcluido.Params[1].AsString:='S';
                DM.SQLStoredProcProdExcluido.ExecProc;

                DM.QConsultaRemoto.Next;

                LExecuta.Caption:='Em execução';
                SB.Panels[1].Text:='Lendo: '+IntToStr(iRecords)+' verificando se existe cadastro de produtos excluído no PDV.';

                Repaint;
                end;
             Close;//Fecha a consulta
             end;
          //Se houver algum campo Null, então o registro foi deletado no retaguarda,
          //então eu excluo do banco de dados do PDV.
          With DM.QConsultaLocal
          do begin
             Close;
             Sql.Clear;
             Sql.add('DELETE FROM ESTOQUE WHERE FLAG IS NULL');
             ExecSQL();
             Close;//Fecha a consulta
             end;
        except
          TAtualizaDeletados.Enabled:=True;
          end;

          SB.Panels[1].Text:='';
          LExecuta.Caption:='';
          Application.ProcessMessages;

       end;//if ImageON
end;

procedure TFMonitorPDV.LogEventsException(Sender: TObject; E: Exception);
var
   NomeDoLog, Mensagem: string;
   Arquivo: TextFile;
begin
    if Ativa_loq_Erro='Sim'
    then begin
          Mensagem:=UpperCase(E.Message);
          //Gravar no arquivo de Loq
          NomeDoLog := ChangeFileExt(Application.Exename, '.log');
          AssignFile(Arquivo, NomeDoLog);
          if FileExists(NomeDoLog) then
            Append(arquivo) { se existir, apenas adiciona linhas }
          else
            ReWrite(arquivo); { cria um novo se não existir }
          try
            WriteLn(arquivo, DateTimeToStr(Now) + ':' + Mensagem);
            WriteLn(arquivo, '----------------------------------------------------------------------');
            Application.ShowException(E);
          finally
            CloseFile(arquivo)
          end;
     end;     
end;

procedure TFMonitorPDV.Le_ConfigIni;
var
   ConfigIni : TIniFile;
begin
     vDir_Configuracao := ('C:\Apgef\Config.ini');
     ConfigIni  := TIniFile.Create( vDir_Configuracao );
     if not FileExists( vDir_Configuracao )
     then with ConfigIni
          do begin
             WriteString('MONITOR PDV','Delay Conexão Remota' ,'7000');
             WriteString('MONITOR PDV','Delay dados recebidos','10000');
             WriteString('MONITOR PDV','Delay dados enviados' ,'15000');
             WriteString('MONITOR PDV','Delay dados deletados','240000');
             WriteString('MONITOR PDV','Ativa Log Erro','Sim');
             end;
          ConfigIni := TIniFile.Create(vDir_Configuracao);
          with ConfigIni
          do begin
             Delay_Conexao_Remota   :=ReadString('MONITOR PDV','Delay Conexão Remota' ,'');
             Delay_Atualiz_Recebido :=ReadString('MONITOR PDV','Delay dados recebidos','');
             Delay_Atualiz_Enviados :=ReadString('MONITOR PDV','Delay dados enviados' ,'');
             Delay_Atualiz_Deletados:=ReadString('MONITOR PDV','Delay dados deletados','');
             Ativa_loq_Erro         :=ReadString('MONITOR PDV','Ativa Log Erro','');
             end;
          ConfigIni.Free;
end;

procedure TFMonitorPDV.TVerificaEnviadosTimer(Sender: TObject);
var
   vData_Hora : TDateTime;
begin
     if ImageON.Visible//Se o servidor estiver ativo, então verifica as atualizações
     then begin
          nEnviou_Dados:=False;
          TVerificaEnviados.Enabled:=False;

          if DM.TDeployULT_VERIF_VENDAS.AsDateTime > 0 //Verifica ultimas vendas e reduções
          then vData_Hora:=DM.TDeployULT_VERIF_VENDAS.AsDateTime
          else vData_Hora:=Now-1;

         Try
          AtualizaVendasRetaguarda(vData_Hora);
          AtualizaReducoesRetaguarda(vData_Hora);

          PegaDataHoraServidor;
          if nEnviou_Dados
          then begin
               if DM.TDeploy.RecordCount=0
               then DM.TDeploy.Append
               else DM.TDeploy.Edit;
               DM.TDeployULT_ENVIADOS.AsDateTime:=DM.QPegaDataHoraCURRENT_TIMESTAMP.AsDateTime;
               DM.TDeployULT_VERIF_VENDAS.AsDateTime:=DM.QPegaDataHoraCURRENT_TIMESTAMP.AsDateTime;
               DM.TDeploy.Post;
               LDataHoraEnviados.Caption:=DateTimeToStr(DM.TDeployULT_ENVIADOS.AsDateTime);
               end
          else begin
               if DM.TDeploy.RecordCount=0
               then DM.TDeploy.Append
               else DM.TDeploy.Edit;
               DM.TDeployULT_VERIF_VENDAS.AsDateTime:=DM.QPegaDataHoraCURRENT_TIMESTAMP.AsDateTime;
               DM.TDeploy.Post;
               end;

         except
          end;

          TVerificaEnviados.Enabled:=True;
          Application.ProcessMessages;
          end;
end;

end.
