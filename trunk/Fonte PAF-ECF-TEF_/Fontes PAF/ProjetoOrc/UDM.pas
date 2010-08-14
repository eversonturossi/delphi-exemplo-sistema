unit UDM;

interface

uses
  SysUtils, Classes, DB, DBClient, FMTBcd, Provider, SqlExpr, DBXpress,
  RLXLSFilter, RLPDFFilter, RLHTMLFilter, RLFilters, RLRichFilter,
  RLDraftFilter, RLPreviewForm, RLPrintDialog;

type
  TDM = class(TDataModule)
    TOrcTemp: TClientDataSet;
    TOrcTempCODPRODUTO: TIntegerField;
    TOrcTempDESCRICAO: TStringField;
    TOrcTempREFERENCIA: TStringField;
    TOrcTempQTDE: TFloatField;
    TOrcTempVL_UNIT: TFloatField;
    TOrcTempVL_TOTAL: TFloatField;
    TOrcTempTABELA: TStringField;
    QPesqProduto: TSQLQuery;
    dspPesqProduto: TDataSetProvider;
    TPesqProduto: TClientDataSet;
    TPesqProdutoCODIGO: TIntegerField;
    TPesqProdutoREFERENCIA: TStringField;
    TPesqProdutoDESCRICAO: TStringField;
    TPesqProdutoQTDE: TFMTBCDField;
    TPesqProdutoMED: TStringField;
    TPesqProdutoPRECOVENDA: TFMTBCDField;
    TPesqProdutoPRECOPRAZO: TFMTBCDField;
    TPesqProdutoNOME: TStringField;
    TPesqProdutoNOME_1: TStringField;
    TPesqProdutoNOME_2: TStringField;
    TPesqProdutoINATIVO: TStringField;
    TPesqProdutoCODBARRA: TStringField;
    SQLConnection: TSQLConnection;
    QPesquisa: TSQLQuery;
    QPesqCliente: TSQLQuery;
    dspPesqClilente: TDataSetProvider;
    TPesqCliente: TClientDataSet;
    TPesqClienteCODIGO: TIntegerField;
    TPesqClienteNOME: TStringField;
    TPesqClienteNOME_FANTASIA: TStringField;
    TPesqClienteENDERECO: TStringField;
    TPesqClienteBAIRRO: TStringField;
    TPesqClienteCODCIDADE: TIntegerField;
    TPesqClienteCEP: TStringField;
    TPesqClienteUF: TStringField;
    TPesqClienteCPF: TStringField;
    TPesqClienteRG: TStringField;
    TPesqClienteCGC: TStringField;
    TPesqClienteIE: TStringField;
    TPesqClienteTELEFONE: TStringField;
    TPesqClienteCELULAR: TStringField;
    TPesqClienteNOME_CIDADE: TStringField;
    TPesqProdutoTemp: TClientDataSet;
    TPesqClienteTemp: TClientDataSet;
    QPesqVendedor: TSQLQuery;
    dspPesqVendedor: TDataSetProvider;
    TPesqVendedor: TClientDataSet;
    TPesqVendedorTemp: TClientDataSet;
    TPesqVendedorCODIGO: TIntegerField;
    TPesqVendedorNOME: TStringField;
    TOrcTempNUM_ITEM: TAutoIncField;
    TPesqProdutoTempCODIGO: TIntegerField;
    TPesqProdutoTempREFERENCIA: TStringField;
    TPesqProdutoTempDESCRICAO: TStringField;
    TPesqProdutoTempMED: TStringField;
    TPesqProdutoTempNOME: TStringField;
    TPesqProdutoTempNOME_1: TStringField;
    TPesqProdutoTempNOME_2: TStringField;
    TPesqProdutoTempINATIVO: TStringField;
    TPesqVendedorTempCODIGO: TIntegerField;
    TPesqVendedorTempNOME: TStringField;
    TPesqClienteTempCODIGO: TIntegerField;
    TPesqClienteTempNOME: TStringField;
    TPesqClienteTempNOME_FANTASIA: TStringField;
    TPesqClienteTempENDERECO: TStringField;
    TPesqClienteTempBAIRRO: TStringField;
    TPesqClienteTempCEP: TStringField;
    TPesqClienteTempUF: TStringField;
    TPesqClienteTempCPF: TStringField;
    TPesqClienteTempRG: TStringField;
    TPesqClienteTempCGC: TStringField;
    TPesqClienteTempIE: TStringField;
    TPesqClienteTempTELEFONE: TStringField;
    TPesqClienteTempCELULAR: TStringField;
    TPesqClienteTempNOME_CIDADE: TStringField;
    QOrcamento: TSQLQuery;
    QOrcamentoCODIGO: TIntegerField;
    QOrcamentoDTEMISSAO: TDateField;
    QOrcamentoCODCLIENTE: TIntegerField;
    QOrcamentoNOMECLIENTE: TStringField;
    QOrcamentoCODVENDEDOR: TIntegerField;
    QOrcamentoDESCONTO: TFMTBCDField;
    QOrcamentoVALOR: TFMTBCDField;
    QOrcamentoTOTALCUSTO: TFMTBCDField;
    QOrcamentoOBS: TStringField;
    dspOrcamento: TDataSetProvider;
    TOrcamento: TClientDataSet;
    TOrcamentoCODIGO: TIntegerField;
    TOrcamentoDTEMISSAO: TDateField;
    TOrcamentoCODCLIENTE: TIntegerField;
    TOrcamentoNOMECLIENTE: TStringField;
    TOrcamentoCODVENDEDOR: TIntegerField;
    TOrcamentoDESCONTO: TFMTBCDField;
    TOrcamentoVALOR: TFMTBCDField;
    TOrcamentoTOTALCUSTO: TFMTBCDField;
    TOrcamentoOBS: TStringField;
    TOrcamentoQItemOrcamento: TDataSetField;
    TOrcamentoSUBTOTAL: TFloatField;
    TItemOrcamento: TClientDataSet;
    TItemOrcamentoCONTROLE: TIntegerField;
    TItemOrcamentoCODIGO: TIntegerField;
    TItemOrcamentoCODPRODUTO: TIntegerField;
    TItemOrcamentoQTDE: TFMTBCDField;
    TItemOrcamentoPRECO: TFMTBCDField;
    TItemOrcamentoCUSTO: TFMTBCDField;
    TItemOrcamentoTABELA: TStringField;
    TItemOrcamentoTOTALITEN: TFMTBCDField;
    TItemOrcamentoDESCRICAO: TStringField;
    TItemOrcamentoMAODEOBRA: TStringField;
    TItemOrcamentoOBSERVACAO: TStringField;
    DstOrcamento: TDataSource;
    QItemOrcamento: TSQLQuery;
    QItemOrcamentoCONTROLE: TIntegerField;
    QItemOrcamentoCODIGO: TIntegerField;
    QItemOrcamentoCODPRODUTO: TIntegerField;
    QItemOrcamentoQTDE: TFMTBCDField;
    QItemOrcamentoPRECO: TFMTBCDField;
    QItemOrcamentoCUSTO: TFMTBCDField;
    QItemOrcamentoTABELA: TStringField;
    QItemOrcamentoTOTALITEN: TFMTBCDField;
    QItemOrcamentoDESCRICAO: TStringField;
    QItemOrcamentoMAODEOBRA: TStringField;
    QItemOrcamentoOBSERVACAO: TStringField;
    QGen: TSQLQuery;
    QOrcamentoVALIDADE: TDateField;
    TOrcamentoVALIDADE: TDateField;
    QOrcamentoNUMERO_DAV: TIntegerField;
    TOrcamentoNUMERO_DAV: TIntegerField;
    TOrcTempSUBTOTAL: TAggregateField;
    TPesqProdutoCUSTOFINAL: TFMTBCDField;
    TOrcTempCUSTOFINAL: TFloatField;
    TPesqProdutoTempQTDE: TFMTBCDField;
    TPesqProdutoTempPRECOVENDA: TFMTBCDField;
    TPesqProdutoTempPRECOPRAZO: TFMTBCDField;
    TPesqProdutoTempCUSTOFINAL: TFMTBCDField;
    TPesqProdutoTempCODBARRA: TStringField;
    TPesqClienteTempINATIVO: TStringField;
    TPesqClienteINATIVO: TStringField;
    dsPesqVendedores: TDataSource;
    dsPesquisaClientes: TDataSource;
    dsOrcamento: TDataSource;
    dsItemOrcamento: TDataSource;
    QOrcamentoNOME: TStringField;
    TOrcamentoNOME: TStringField;
    QItemOrcamentoREFERENCIA: TStringField;
    QItemOrcamentoMED: TStringField;
    QItemOrcamentoCODMARCA: TIntegerField;
    TItemOrcamentoREFERENCIA: TStringField;
    TItemOrcamentoMED: TStringField;
    TItemOrcamentoCODMARCA: TIntegerField;
    QEmpresa: TSQLQuery;
    dspEmpresa: TDataSetProvider;
    TEmpresa: TClientDataSet;
    TEmpresaRAZAO: TStringField;
    TEmpresaCGC: TStringField;
    TEmpresaIE: TStringField;
    TEmpresaENDERECO: TStringField;
    TEmpresaBAIRRO: TStringField;
    TEmpresaCEP: TStringField;
    TEmpresaCIDADE: TStringField;
    TEmpresaUF: TStringField;
    TEmpresaFONE: TStringField;
    QConsultaOrc: TSQLQuery;
    dspConsultaOrc: TDataSetProvider;
    TConsultaOrc: TClientDataSet;
    QConsultaItenOrc: TSQLQuery;
    dspConsultaItenOrc: TDataSetProvider;
    TConsultaItenOrc: TClientDataSet;
    TConsultaOrcCODIGO: TIntegerField;
    TConsultaOrcDTEMISSAO: TDateField;
    TConsultaOrcCODCLIENTE: TIntegerField;
    TConsultaOrcNOMECLIENTE: TStringField;
    TConsultaOrcCODVENDEDOR: TIntegerField;
    TConsultaOrcDESCONTO: TFMTBCDField;
    TConsultaOrcVALOR: TFMTBCDField;
    TConsultaOrcTOTALCUSTO: TFMTBCDField;
    TConsultaOrcOBS: TStringField;
    TConsultaOrcVALIDADE: TDateField;
    TConsultaOrcNUMERO_DAV: TIntegerField;
    TConsultaOrcNOME: TStringField;
    TConsultaOrcSUBTOTAL: TFloatField;
    TConsultaItenOrcCONTROLE: TIntegerField;
    TConsultaItenOrcCODIGO: TIntegerField;
    TConsultaItenOrcCODPRODUTO: TIntegerField;
    TConsultaItenOrcQTDE: TFMTBCDField;
    TConsultaItenOrcPRECO: TFMTBCDField;
    TConsultaItenOrcCUSTO: TFMTBCDField;
    TConsultaItenOrcTABELA: TStringField;
    TConsultaItenOrcTOTALITEN: TFMTBCDField;
    TConsultaItenOrcDESCRICAO: TStringField;
    TConsultaItenOrcMAODEOBRA: TStringField;
    TConsultaItenOrcOBSERVACAO: TStringField;
    TConsultaItenOrcREFERENCIA: TStringField;
    TConsultaItenOrcMED: TStringField;
    QOrcamentoSITUACAO: TStringField;
    QOrcamentoALTERADO: TStringField;
    QOrcamentoDT_HORA_ALTEROU: TSQLTimeStampField;
    QOrcamentoNUMERO_CUPOM: TIntegerField;
    QOrcamentoNUMERO_SERIE_ECF: TStringField;
    QOrcamentoNUMERO_CAIXA: TSmallintField;
    TOrcamentoSITUACAO: TStringField;
    TOrcamentoALTERADO: TStringField;
    TOrcamentoDT_HORA_ALTEROU: TSQLTimeStampField;
    TOrcamentoNUMERO_CUPOM: TIntegerField;
    TOrcamentoNUMERO_SERIE_ECF: TStringField;
    TOrcamentoNUMERO_CAIXA: TSmallintField;
    TConsultaOrcSITUACAO: TStringField;
    TConsultaOrcALTERADO: TStringField;
    TConsultaOrcDT_HORA_ALTEROU: TSQLTimeStampField;
    TConsultaOrcNUMERO_CUPOM: TIntegerField;
    TConsultaOrcNUMERO_SERIE_ECF: TStringField;
    TConsultaOrcNUMERO_CAIXA: TSmallintField;
    RLRichFilter1: TRLRichFilter;
    RLHTMLFilter1: TRLHTMLFilter;
    RLXLSFilter1: TRLXLSFilter;
    QOrcamentoREF_NUM_DAV: TIntegerField;
    TOrcamentoREF_NUM_DAV: TIntegerField;
    TConsultaOrcREF_NUM_DAV: TIntegerField;
    QOrcamentoNUM_NOVO_DAV: TIntegerField;
    TOrcamentoNUM_NOVO_DAV: TIntegerField;
    TConsultaOrcNUM_NOVO_DAV: TIntegerField;
    QOrcamentoHORA: TTimeField;
    TOrcamentoHORA: TTimeField;
    TConsultaOrcHORA: TTimeField;
    RLPrintDialogSetup: TRLPrintDialogSetup;
    RLPreviewSetup: TRLPreviewSetup;
    TEmpresaPADRAOBUSCA: TStringField;
    RLPDFFilter1: TRLPDFFilter;
    RLDraftFilter1: TRLDraftFilter;
    QItemOrcamentoNOME: TStringField;
    TItemOrcamentoNOME: TStringField;
    QPesqGradeProd: TSQLQuery;
    dspPesqGradeProd: TDataSetProvider;
    TPesqGradeProd: TClientDataSet;
    TPesqGradeProdCODIGO: TIntegerField;
    TPesqGradeProdCOD_PRODUTO: TIntegerField;
    TPesqGradeProdVARIACAO: TStringField;
    TPesqGradeProdQTDE: TFMTBCDField;
    TPesqGradeProdQTDE_EF: TFMTBCDField;
    TPesqGradeProdSALDO: TFloatField;
    TPesqGradeProdQTDE_MINIMA: TFMTBCDField;
    TPesqGradeProdCOD_BARRA: TStringField;
    TPesqGradeProdREFERENCIA: TStringField;
    TPesqGradeProdMED: TStringField;
    TPesqGradeProdSEL: TStringField;
    TPesqGradeProdQTDE_SELECIONADA: TFloatField;
    TPesqGradeProdCOD_COR: TSmallintField;
    TPesqGradeProdCOD_TAMANHO: TSmallintField;
    TPesqGradeProdNOME_COR: TStringField;
    TPesqGradeProdNOME_TAMANHO: TStringField;
    TPesqGradeProdREFERENCIA_1: TStringField;
    TPesqGradeProdSOMA_QTDE: TAggregateField;
    TPesqGradeProdSOMA_QTDE_EF: TAggregateField;
    TPesqGradeProdSOMA_QTDE_MINNA: TAggregateField;
    TPesqGradeProdSOMA_SALDO: TAggregateField;
    TPesqGradeProdSOMA_SEL: TAggregateField;
    TOrcGradeTemp: TClientDataSet;
    TOrcGradeTempITEN: TIntegerField;
    TOrcGradeTempCOD_GRADE: TIntegerField;
    TOrcGradeTempCOD_PRODUTO: TIntegerField;
    TOrcGradeTempQTDE: TFloatField;
    TOrcGradeTempCOD_COR: TIntegerField;
    TOrcGradeTempCOD_TAMANHO: TIntegerField;
    TEmpresaPERMITIVENDAESTOQUENEG: TStringField;
    QOrcamento_Grade: TSQLQuery;
    QOrcamento_GradeCODIGO: TIntegerField;
    QOrcamento_GradeCOD_ORCAMENTO: TIntegerField;
    QOrcamento_GradeCOD_PRODUTO: TIntegerField;
    QOrcamento_GradeCOD_GRADE: TIntegerField;
    QOrcamento_GradeQTDE: TFMTBCDField;
    QOrcamento_GradeCOD_COR: TSmallintField;
    QOrcamento_GradeCOD_TAMANHO: TSmallintField;
    dspOrcamento_Grade: TDataSetProvider;
    TOrcamento_Grade: TClientDataSet;
    TOrcamento_GradeCODIGO: TIntegerField;
    TOrcamento_GradeCOD_ORCAMENTO: TIntegerField;
    TOrcamento_GradeCOD_PRODUTO: TIntegerField;
    TOrcamento_GradeCOD_GRADE: TIntegerField;
    TOrcamento_GradeQTDE: TFMTBCDField;
    TOrcamento_GradeCOD_COR: TSmallintField;
    TOrcamento_GradeCOD_TAMANHO: TSmallintField;
    TConsultaItenOrcGRADE: TStringField;
    QConsultaOrcGrade: TSQLQuery;
    dspConsultaOrcGrade: TDataSetProvider;
    TConsultaOrcGrade: TClientDataSet;
    TConsultaOrcGradeCODIGO: TIntegerField;
    TConsultaOrcGradeCOD_ORCAMENTO: TIntegerField;
    TConsultaOrcGradeCOD_PRODUTO: TIntegerField;
    TConsultaOrcGradeCOD_GRADE: TIntegerField;
    TConsultaOrcGradeQTDE: TFMTBCDField;
    TConsultaOrcGradeCOD_COR: TSmallintField;
    TConsultaOrcGradeCOD_TAMANHO: TSmallintField;
    TConsultaOrcGradeVARIACAO: TStringField;
    TConsultaOrcGradeCOD_BARRA: TStringField;
    TConsultaOrcGradeREFERENCIA: TStringField;
    TConsultaOrcGradeNOME_COR: TStringField;
    TConsultaOrcGradeNOME_TAMANHO: TStringField;
    TConsultaOrcGradeMED: TStringField;
    TPesqProdutoQTDEEF: TFMTBCDField;
    TPesqProdutoSALDO: TFloatField;
    QOrcamentoFLAG: TSmallintField;
    TOrcamentoFLAG: TSmallintField;
    TConsultaOrcSEL: TStringField;
    TDavAlterando: TClientDataSet;
    TDavAlterandoNUMERO_DAV: TIntegerField;
    procedure TOrcTempAfterDelete(DataSet: TDataSet);
    procedure TOrcTempAfterPost(DataSet: TDataSet);
    procedure dspOrcamentoBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure TOrcamentoNewRecord(DataSet: TDataSet);
    procedure TConsultaOrcCalcFields(DataSet: TDataSet);
    procedure TOrcamentoAfterInsert(DataSet: TDataSet);
    procedure TOrcamentoCalcFields(DataSet: TDataSet);
    procedure TPesqGradeProdCalcFields(DataSet: TDataSet);
    procedure TOrcGradeTempAfterDelete(DataSet: TDataSet);
    procedure TOrcGradeTempAfterPost(DataSet: TDataSet);
    procedure dspOrcamento_GradeBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure TOrcamento_GradeNewRecord(DataSet: TDataSet);
    procedure TPesqProdutoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FSeqTmp     : Integer;
    FNumCodigo  : Integer;
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.TOrcTempAfterDelete(DataSet: TDataSet);
begin
     TOrcTemp.SaveToFile(TOrcTemp.FileName,dfXML);
end;

procedure TDM.TOrcTempAfterPost(DataSet: TDataSet);
begin
     TOrcTemp.SaveToFile(TOrcTemp.FileName,dfXML);
end;

procedure TDM.dspOrcamentoBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
    if UpdateKind = ukInsert
    then begin
          if SourceDs = QOrcamento
          then begin
                With QGen
                do begin
                   Close;
                   Sql.Clear;
                   Sql.Add('SELECT GEN_ID(GEN_ORCAMENTO_ID,1) AS CODIGO_NOVO FROM DUAL');
                   Open;
                   end;
                try
                  FNumCodigo := QGen.FieldByName('CODIGO_NOVO').AsInteger;
                finally
                  QGen.Close;
                end;
                DeltaDs.FieldByName('CODIGO').NewValue := FNumCodigo;
          end else if (SourceDs = QItemOrcamento)
          then if TItemOrcamento.FieldByName('CODIGO').AsInteger < 0
          then DeltaDs.FieldByName('CODIGO').NewValue := FNumCodigo;
      end;
end;

procedure TDM.TOrcamentoNewRecord(DataSet: TDataSet);
begin
     Dec(FSeqTmp);
     TOrcamento.FieldByName('CODIGO').AsInteger := FSeqTmp;
end;

procedure TDM.TConsultaOrcCalcFields(DataSet: TDataSet);
begin
     if TConsultaOrc.State = dsInternalCalc
     then TConsultaOrcSUBTOTAL.AsFloat:=TConsultaOrcVALOR.AsFloat + TConsultaOrcDESCONTO.AsFloat;
end;

procedure TDM.TOrcamentoAfterInsert(DataSet: TDataSet);
begin
     TOrcamentoFLAG.Value:=0;
     TOrcamentoSITUACAO.Value:='A';//Seta sempre como orçamento aberto na inserção
end;

procedure TDM.TOrcamentoCalcFields(DataSet: TDataSet);
begin
     if TOrcamento.State = dsInternalCalc
     then TOrcamentoSUBTOTAL.AsFloat:=TOrcamentoVALOR.AsFloat + TOrcamentoDESCONTO.AsFloat;
end;

procedure TDM.TPesqGradeProdCalcFields(DataSet: TDataSet);
begin
     if TPesqGradeProd.State = dsInternalCalc
     then begin
          TPesqGradeProdSALDO.AsCurrency:=TPesqGradeProdQTDE.AsCurrency - TPesqGradeProdQTDE_EF.AsCurrency;
          end;
end;

procedure TDM.TOrcGradeTempAfterDelete(DataSet: TDataSet);
begin
     TOrcGradeTemp.SaveToFile(TOrcGradeTemp.FileName,dfXML);
end;

procedure TDM.TOrcGradeTempAfterPost(DataSet: TDataSet);
begin
     TOrcGradeTemp.SaveToFile(TOrcGradeTemp.FileName,dfXML);
end;

procedure TDM.dspOrcamento_GradeBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
     if UpdateKind = ukInsert
     then begin
          With DM.QGen
          do begin
             Close;
             Sql.Clear;
             Sql.Add('SELECT GEN_ID(GEN_ORCAMENTO_GRADE_ID,1) AS CODIGO_NOVO FROM DUAL');
             Open;
             end;
          Try
             FNumCodigo := DM.QGen.FieldByName('CODIGO_NOVO').AsInteger;
          Finally
             DM.QGen.Close;
             end;
          DeltaDs.FieldByName('CODIGO').NewValue:=FNumCodigo;
       end;
end;

procedure TDM.TOrcamento_GradeNewRecord(DataSet: TDataSet);
begin
     Dec(FSeqTmp);
     TOrcamento_Grade.FieldByName('CODIGO').AsInteger := FSeqTmp;
end;

procedure TDM.TPesqProdutoCalcFields(DataSet: TDataSet);
begin
     if TPesqProduto.State = dsInternalCalc
     then TPesqProdutoSALDO.AsCurrency := TPesqProdutoQTDE.AsCurrency - TPesqProdutoQTDEEF.AsCurrency;
end;

end.
