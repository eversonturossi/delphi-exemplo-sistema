unit dmsyndAC;

interface

uses
  SysUtils, Classes, DB, DBTables, DBClient, FMTBcd, SqlExpr, DBXpress, Provider,
  IdAntiFreezeBase, IdAntiFreeze, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient;

type
  TDM = class(TDataModule)
    SQLConnectionLocal: TSQLConnection;
    QEmpresa: TSQLQuery;
    dspEmpresa: TDataSetProvider;
    QEmpresaID: TIntegerField;
    QEmpresaRAZAO_SOCIAL: TStringField;
    QEmpresaNOME_FANTASIA: TStringField;
    QEmpresaENDERECO: TStringField;
    QEmpresaBAIRRO: TStringField;
    QEmpresaCIDADE: TStringField;
    QEmpresaUF: TStringField;
    QEmpresaCEP: TStringField;
    QEmpresaINSC_ESTADUAL: TStringField;
    QEmpresaINSC_MUNICIPAL: TStringField;
    QEmpresaDATA: TDateField;
    TEmpresa: TClientDataSet;
    TEmpresaID: TIntegerField;
    TEmpresaRAZAO_SOCIAL: TStringField;
    TEmpresaNOME_FANTASIA: TStringField;
    TEmpresaENDERECO: TStringField;
    TEmpresaBAIRRO: TStringField;
    TEmpresaCIDADE: TStringField;
    TEmpresaUF: TStringField;
    TEmpresaCEP: TStringField;
    TEmpresaINSC_ESTADUAL: TStringField;
    TEmpresaINSC_MUNICIPAL: TStringField;
    TEmpresaDATA: TDateField;
    QGrupos: TSQLQuery;
    dspGrupos: TDataSetProvider;
    TGrupos: TClientDataSet;
    QUnidades: TSQLQuery;
    dspUnidades: TDataSetProvider;
    TUnidades: TClientDataSet;
    QGruposCODIGO: TIntegerField;
    TGruposCODIGO: TIntegerField;
    QUnidadesCODIGO: TIntegerField;
    QUnidadesDESCRICAO: TStringField;
    QUnidadesABREVIATURA: TStringField;
    TUnidadesCODIGO: TIntegerField;
    TUnidadesDESCRICAO: TStringField;
    TUnidadesABREVIATURA: TStringField;
    QProdutoLocal: TSQLQuery;
    dspProdutoLocal: TDataSetProvider;
    TProdutoLocal: TClientDataSet;
    QClientes: TSQLQuery;
    dspClientes: TDataSetProvider;
    TClientes: TClientDataSet;
    QClientesCODIGO: TIntegerField;
    QClientesNOME: TStringField;
    QClientesENDERECO: TStringField;
    QClientesBAIRRO: TStringField;
    QClientesCIDADE: TStringField;
    QClientesUF: TStringField;
    QClientesCEP: TStringField;
    QClientesTELEFONE: TStringField;
    QClientesCELULAR: TStringField;
    QClientesCPF: TStringField;
    QClientesRG: TStringField;
    QClientesIE: TStringField;
    QClientesINADIMPLENTE: TStringField;
    QClientesTRAVA: TFMTBCDField;
    QClientesOBS: TBlobField;
    TClientesCODIGO: TIntegerField;
    TClientesNOME: TStringField;
    TClientesENDERECO: TStringField;
    TClientesBAIRRO: TStringField;
    TClientesCIDADE: TStringField;
    TClientesUF: TStringField;
    TClientesCEP: TStringField;
    TClientesTELEFONE: TStringField;
    TClientesCELULAR: TStringField;
    TClientesCPF: TStringField;
    TClientesRG: TStringField;
    TClientesIE: TStringField;
    TClientesINADIMPLENTE: TStringField;
    TClientesTRAVA: TFMTBCDField;
    TClientesOBS: TBlobField;
    QMarca: TSQLQuery;
    dspMarca: TDataSetProvider;
    TMarca: TClientDataSet;
    QMarcaCODIGO: TSmallintField;
    TMarcaCODIGO: TSmallintField;
    QTributacao: TSQLQuery;
    dspTributacao: TDataSetProvider;
    T_Tributacao: TClientDataSet;
    QUsuario: TSQLQuery;
    dspUsuario: TDataSetProvider;
    TUsuario: TClientDataSet;
    QUsuarioID: TSmallintField;
    QUsuarioNOME: TStringField;
    QUsuarioCHK_PARAMETROS: TSmallintField;
    QUsuarioCHK_CADASTRO: TSmallintField;
    QUsuarioCHK_GRUPOS: TSmallintField;
    QUsuarioCHK_UNIDADES: TSmallintField;
    QUsuarioCHK_MARCAS: TSmallintField;
    QUsuarioCHK_CLIENTES: TSmallintField;
    QUsuarioCHK_PRODUTOS: TSmallintField;
    QUsuarioCHK_VENDAS: TSmallintField;
    QUsuarioCHK_VENDA_CHECKOUT: TSmallintField;
    QUsuarioCHK_CONFIGURACOES: TSmallintField;
    QUsuarioCHK_CONFIG_ECF: TSmallintField;
    QUsuarioCHK_CONFIG_TEF: TSmallintField;
    QUsuarioCHK_USUARIOS: TSmallintField;
    QUsuarioPE_ABRE_GAVETA: TSmallintField;
    QUsuarioPE_SUPRIMENTO_SANGRIA: TSmallintField;
    QUsuarioPE_CANCELA_CUPOM: TSmallintField;
    QUsuarioPE_REDUCAO_Z: TSmallintField;
    QUsuarioPE_LEITURA_X: TSmallintField;
    QUsuarioPE_ALTERA_MSG_PROMOCIONAL: TSmallintField;
    QUsuarioPE_ALTERA_ESTOQUE: TSmallintField;
    TUsuarioID: TSmallintField;
    TUsuarioNOME: TStringField;
    TUsuarioCHK_PARAMETROS: TSmallintField;
    TUsuarioCHK_CADASTRO: TSmallintField;
    TUsuarioCHK_GRUPOS: TSmallintField;
    TUsuarioCHK_UNIDADES: TSmallintField;
    TUsuarioCHK_MARCAS: TSmallintField;
    TUsuarioCHK_CLIENTES: TSmallintField;
    TUsuarioCHK_PRODUTOS: TSmallintField;
    TUsuarioCHK_VENDAS: TSmallintField;
    TUsuarioCHK_VENDA_CHECKOUT: TSmallintField;
    TUsuarioCHK_CONFIGURACOES: TSmallintField;
    TUsuarioCHK_CONFIG_ECF: TSmallintField;
    TUsuarioCHK_CONFIG_TEF: TSmallintField;
    TUsuarioCHK_USUARIOS: TSmallintField;
    TUsuarioPE_ABRE_GAVETA: TSmallintField;
    TUsuarioPE_SUPRIMENTO_SANGRIA: TSmallintField;
    TUsuarioPE_CANCELA_CUPOM: TSmallintField;
    TUsuarioPE_REDUCAO_Z: TSmallintField;
    TUsuarioPE_LEITURA_X: TSmallintField;
    TUsuarioPE_ALTERA_MSG_PROMOCIONAL: TSmallintField;
    TUsuarioPE_ALTERA_ESTOQUE: TSmallintField;
    QPesquisa: TSQLQuery;
    QGenRemoto: TSQLQuery;
    QVendaLocal: TSQLQuery;
    dspVendaLocal: TDataSetProvider;
    TVendaLocal: TClientDataSet;
    QVendaLocalCODIGO: TIntegerField;
    QVendaLocalDATA: TDateField;
    QVendaLocalHORA: TTimeField;
    QVendaLocalNUMERO_CUPOM: TIntegerField;
    QVendaLocalCOD_CLIENTE: TIntegerField;
    QVendaLocalCOD_OPERADOR: TIntegerField;
    QVendaLocalSUBTOTAL: TFMTBCDField;
    QVendaLocalTOTAL: TFMTBCDField;
    QVendaLocalDINHEIRO: TFMTBCDField;
    QVendaLocalCHEQUE: TFMTBCDField;
    QVendaLocalCREDIARIO: TFMTBCDField;
    QVendaLocalCARTAO: TFMTBCDField;
    QVendaLocalTROCO: TFMTBCDField;
    QVendaLocalCUPOM_CANCELADO: TStringField;
    TVendaLocalCODIGO: TIntegerField;
    TVendaLocalDATA: TDateField;
    TVendaLocalHORA: TTimeField;
    TVendaLocalNUMERO_CUPOM: TIntegerField;
    TVendaLocalCOD_CLIENTE: TIntegerField;
    TVendaLocalCOD_OPERADOR: TIntegerField;
    TVendaLocalSUBTOTAL: TFMTBCDField;
    TVendaLocalTOTAL: TFMTBCDField;
    TVendaLocalDINHEIRO: TFMTBCDField;
    TVendaLocalCHEQUE: TFMTBCDField;
    TVendaLocalCREDIARIO: TFMTBCDField;
    TVendaLocalCARTAO: TFMTBCDField;
    TVendaLocalTROCO: TFMTBCDField;
    TVendaLocalCUPOM_CANCELADO: TStringField;
    dsVendaLocal: TDataSource;
    QItemVendaLocal: TSQLQuery;
    TItemVendaLocal: TClientDataSet;
    QItemVendaLocalCONTROLE: TIntegerField;
    QItemVendaLocalCODIGO: TIntegerField;
    QItemVendaLocalNUMERO_CUPOM: TIntegerField;
    QItemVendaLocalITEM: TIntegerField;
    QItemVendaLocalCOD_PRODUTO: TIntegerField;
    QItemVendaLocalDESCRICAO: TStringField;
    QItemVendaLocalQUANTIDADE: TFMTBCDField;
    QItemVendaLocalUNIDADE: TStringField;
    QItemVendaLocalVL_UNITARIO: TFMTBCDField;
    QItemVendaLocalALIQUOTA: TFMTBCDField;
    QItemVendaLocalVL_TOTAL: TFMTBCDField;
    TItemVendaLocalCONTROLE: TIntegerField;
    TItemVendaLocalCODIGO: TIntegerField;
    TItemVendaLocalNUMERO_CUPOM: TIntegerField;
    TItemVendaLocalITEM: TIntegerField;
    TItemVendaLocalCOD_PRODUTO: TIntegerField;
    TItemVendaLocalDESCRICAO: TStringField;
    TItemVendaLocalQUANTIDADE: TFMTBCDField;
    TItemVendaLocalUNIDADE: TStringField;
    TItemVendaLocalVL_UNITARIO: TFMTBCDField;
    TItemVendaLocalALIQUOTA: TFMTBCDField;
    TItemVendaLocalVL_TOTAL: TFMTBCDField;
    QPesqCliente: TSQLQuery;
    dspPesqCliente: TDataSetProvider;
    TPesqCliente: TClientDataSet;
    TPesqClienteCODIGO: TIntegerField;
    TPesqClienteNOME: TStringField;
    TPesqClienteCPF: TStringField;
    TPesqClienteENDERECO: TStringField;
    QPesqProduto: TSQLQuery;
    dspPesqProduto: TDataSetProvider;
    TPesqProduto: TClientDataSet;
    TPesqProdutoCODIGO: TIntegerField;
    TPesqProdutoREFERENCIA: TStringField;
    TPesqProdutoDESCRICAO: TStringField;
    TPesqProdutoQTDE: TFMTBCDField;
    QUsuarioSENHA: TStringField;
    TUsuarioSENHA: TStringField;
    TPDV: TClientDataSet;
    TPDVITEN: TAutoIncField;
    TPDVCODPRODUTO: TIntegerField;
    TPDVDESCRICAO: TStringField;
    TPDVMED: TStringField;
    TPDVQTDE: TFloatField;
    TPDVVL_UNITARIO: TFloatField;
    TPDVVL_TOTAL: TFloatField;
    TPDVALIQUOTA: TFloatField;
    TPDVCANCELADO: TStringField;
    QClientesLIMITECREDITO: TFMTBCDField;
    TClientesLIMITECREDITO: TFMTBCDField;
    QVendaLocalTICKET: TFMTBCDField;
    QVendaLocalTIPO: TStringField;
    QVendaLocalNUMPGTO: TIntegerField;
    TVendaLocalTICKET: TFMTBCDField;
    TVendaLocalTIPO: TStringField;
    TVendaLocalNUMPGTO: TIntegerField;
    QItemVendaLocalTABELA: TStringField;
    TItemVendaLocalTABELA: TStringField;
    QClientesCGC: TStringField;
    TClientesCGC: TStringField;
    TVendaLocalQItemVendaLocal: TDataSetField;
    SQLConnectionRetaguarda: TSQLConnection;
    QReceber: TSQLQuery;
    QReceberCODIGO: TIntegerField;
    QReceberCODVENDA: TIntegerField;
    QReceberDOCUMENTO: TStringField;
    QReceberNUMPARCELA: TStringField;
    QReceberCODCLIENTE: TIntegerField;
    QReceberCODVENDEDOR1: TIntegerField;
    QReceberCODVENDEDOR2: TIntegerField;
    QReceberCOMISSAO1: TFMTBCDField;
    QReceberCOMISSAO2: TFMTBCDField;
    QReceberDATAEMISSAO: TDateField;
    QReceberDATAVENCIMENTO: TDateField;
    QReceberDATAPAGAMENTO: TDateField;
    QReceberVALOR: TFMTBCDField;
    QReceberVALORRECEBIDO: TFMTBCDField;
    QReceberHISTORICO: TStringField;
    QReceberCOMPLEMENTO: TStringField;
    QReceberCOBRANCA: TStringField;
    QReceberJUSTICA: TStringField;
    QReceberARQUIVOMORTO: TStringField;
    QReceberDEVOLUCAO: TStringField;
    QReceberCODPORTADOR: TIntegerField;
    QReceberNOME: TStringField;
    QReceberNOME_1: TStringField;
    QReceberNOME_2: TStringField;
    QReceberCODRECEBIMENTO: TStringField;
    QReceberCODREMESSA: TIntegerField;
    DstReceber: TDataSetProvider;
    TReceber: TClientDataSet;
    TReceberCODIGO: TIntegerField;
    TReceberCODVENDA: TIntegerField;
    TReceberDOCUMENTO: TStringField;
    TReceberNUMPARCELA: TStringField;
    TReceberCODCLIENTE: TIntegerField;
    TReceberCODVENDEDOR1: TIntegerField;
    TReceberCODVENDEDOR2: TIntegerField;
    TReceberCOMISSAO1: TFMTBCDField;
    TReceberCOMISSAO2: TFMTBCDField;
    TReceberDATAEMISSAO: TDateField;
    TReceberDATAVENCIMENTO: TDateField;
    TReceberDATAPAGAMENTO: TDateField;
    TReceberVALOR: TFMTBCDField;
    TReceberVALORRECEBIDO: TFMTBCDField;
    TReceberHISTORICO: TStringField;
    TReceberCOMPLEMENTO: TStringField;
    TReceberCOBRANCA: TStringField;
    TReceberJUSTICA: TStringField;
    TReceberARQUIVOMORTO: TStringField;
    TReceberDEVOLUCAO: TStringField;
    TReceberCODPORTADOR: TIntegerField;
    TReceberNOME: TStringField;
    TReceberNOME_1: TStringField;
    TReceberNOME_2: TStringField;
    TReceberCODRECEBIMENTO: TStringField;
    TReceberCODREMESSA: TIntegerField;
    QVenda: TSQLQuery;
    QVendaCODVENDA: TIntegerField;
    QVendaDATAEMISSAO: TDateField;
    QVendaSAIDA: TTimeField;
    QVendaNUMERO_CUPOM: TIntegerField;
    QVendaCODCLIENTE: TIntegerField;
    QVendaCOD_OPERADOR_PDV: TIntegerField;
    QVendaCODVENDEDOR1: TIntegerField;
    QVendaCOMISSAO1: TFMTBCDField;
    QVendaSUBTOTAL: TFMTBCDField;
    QVendaFINANCEIRO: TFMTBCDField;
    QVendaDESCONTO: TFMTBCDField;
    QVendaTOTAL: TFMTBCDField;
    QVendaTOTALCUSTO: TFMTBCDField;
    QVendaNUMPGTO: TIntegerField;
    QVendaTIPO: TStringField;
    QVendaDINHEIRO: TFMTBCDField;
    QVendaCHEQUE: TFMTBCDField;
    QVendaCREDIARIO: TFMTBCDField;
    QVendaCARTAO: TFMTBCDField;
    QVendaTICKET: TFMTBCDField;
    QVendaTROCO: TFMTBCDField;
    QVendaENTREGAFUTURA: TStringField;
    QVendaENTREGACOMPLETA: TStringField;
    QVendaSERVICO: TStringField;
    QVendaGEROUFINANCEIRO: TStringField;
    dspVenda: TDataSetProvider;
    TVenda: TClientDataSet;
    TVendaCODVENDA: TIntegerField;
    TVendaDATAEMISSAO: TDateField;
    TVendaSAIDA: TTimeField;
    TVendaNUMERO_CUPOM: TIntegerField;
    TVendaCODCLIENTE: TIntegerField;
    TVendaCOD_OPERADOR_PDV: TIntegerField;
    TVendaCODVENDEDOR1: TIntegerField;
    TVendaCOMISSAO1: TFMTBCDField;
    TVendaSUBTOTAL: TFMTBCDField;
    TVendaFINANCEIRO: TFMTBCDField;
    TVendaDESCONTO: TFMTBCDField;
    TVendaTOTAL: TFMTBCDField;
    TVendaTOTALCUSTO: TFMTBCDField;
    TVendaNUMPGTO: TIntegerField;
    TVendaTIPO: TStringField;
    TVendaDINHEIRO: TFMTBCDField;
    TVendaCHEQUE: TFMTBCDField;
    TVendaCREDIARIO: TFMTBCDField;
    TVendaCARTAO: TFMTBCDField;
    TVendaTICKET: TFMTBCDField;
    TVendaTROCO: TFMTBCDField;
    TVendaENTREGAFUTURA: TStringField;
    TVendaENTREGACOMPLETA: TStringField;
    TVendaSERVICO: TStringField;
    TVendaGEROUFINANCEIRO: TStringField;
    TVendaQItemVenda: TDataSetField;
    dsVenda: TDataSource;
    QItemVenda: TSQLQuery;
    QItemVendaCONTROLE: TIntegerField;
    QItemVendaCODVENDA: TIntegerField;
    QItemVendaNUMERO_CUPOM: TIntegerField;
    QItemVendaITEM: TIntegerField;
    QItemVendaCODPRODUTO: TIntegerField;
    QItemVendaDESCRICAO: TStringField;
    QItemVendaDATAEMISSAO: TDateField;
    QItemVendaTIPO: TStringField;
    QItemVendaCODCLIENTE: TIntegerField;
    QItemVendaCODVENDEDOR1: TIntegerField;
    QItemVendaCOMISSAO1: TFMTBCDField;
    QItemVendaPRECOFIXO: TFMTBCDField;
    QItemVendaQTDE: TFMTBCDField;
    QItemVendaVENDIDO: TFMTBCDField;
    QItemVendaTOTALITEN: TFMTBCDField;
    QItemVendaTABELA: TStringField;
    QItemVendaCODGRUPO: TIntegerField;
    QItemVendaCODMARCA: TIntegerField;
    QItemVendaMAODEOBRA: TStringField;
    QItemVendaCUSTOFINAL: TFMTBCDField;
    QItemVendaTOTALCUSTO: TFMTBCDField;
    QItemVendaSERVICO: TStringField;
    QItemVendaCOMNOTA: TStringField;
    TItemVenda: TClientDataSet;
    TItemVendaCONTROLE: TIntegerField;
    TItemVendaCODVENDA: TIntegerField;
    TItemVendaNUMERO_CUPOM: TIntegerField;
    TItemVendaITEM: TIntegerField;
    TItemVendaCODPRODUTO: TIntegerField;
    TItemVendaDESCRICAO: TStringField;
    TItemVendaDATAEMISSAO: TDateField;
    TItemVendaTIPO: TStringField;
    TItemVendaCODCLIENTE: TIntegerField;
    TItemVendaCODVENDEDOR1: TIntegerField;
    TItemVendaCOMISSAO1: TFMTBCDField;
    TItemVendaQTDE: TFMTBCDField;
    TItemVendaPRECOFIXO: TFMTBCDField;
    TItemVendaVENDIDO: TFMTBCDField;
    TItemVendaTOTALITEN: TFMTBCDField;
    TItemVendaTABELA: TStringField;
    TItemVendaCODGRUPO: TIntegerField;
    TItemVendaCODMARCA: TIntegerField;
    TItemVendaMAODEOBRA: TStringField;
    TItemVendaCUSTOFINAL: TFMTBCDField;
    TItemVendaTOTALCUSTO: TFMTBCDField;
    TItemVendaSERVICO: TStringField;
    TItemVendaCOMNOTA: TStringField;
    QProdutoLocalCODIGO: TIntegerField;
    QProdutoLocalREFERENCIA: TStringField;
    QProdutoLocalDESCRICAO: TStringField;
    QProdutoLocalCODGRUPO: TIntegerField;
    QProdutoLocalCODMARCA: TIntegerField;
    QProdutoLocalQTDE: TFMTBCDField;
    QProdutoLocalQTDEMINIMA: TFMTBCDField;
    QProdutoLocalPRECOCUSTO: TFMTBCDField;
    QProdutoLocalPRECOVENDA: TFMTBCDField;
    QProdutoLocalPRECOPRAZO: TFMTBCDField;
    QProdutoLocalDESCONTOMAX: TFMTBCDField;
    QProdutoLocalMED: TStringField;
    QProdutoLocalCODALIQUOTA: TIntegerField;
    QProdutoLocalBALANCA: TStringField;
    QProdutoLocalOBS: TBlobField;
    TProdutoLocalREFERENCIA: TStringField;
    TProdutoLocalDESCRICAO: TStringField;
    TProdutoLocalCODGRUPO: TIntegerField;
    TProdutoLocalCODMARCA: TIntegerField;
    TProdutoLocalQTDE: TFMTBCDField;
    TProdutoLocalQTDEMINIMA: TFMTBCDField;
    TProdutoLocalPRECOCUSTO: TFMTBCDField;
    TProdutoLocalPRECOVENDA: TFMTBCDField;
    TProdutoLocalPRECOPRAZO: TFMTBCDField;
    TProdutoLocalDESCONTOMAX: TFMTBCDField;
    TProdutoLocalMED: TStringField;
    TProdutoLocalCODALIQUOTA: TIntegerField;
    TProdutoLocalBALANCA: TStringField;
    TProdutoLocalOBS: TBlobField;
    TPesqClienteCGC: TStringField;
    QTributacaoCODIGO: TIntegerField;
    QTributacaoNOME: TStringField;
    QTributacaoALIQUOTA: TFMTBCDField;
    QTributacaoCODIGOCUPOM: TStringField;
    T_TributacaoNOME: TStringField;
    T_TributacaoALIQUOTA: TFMTBCDField;
    T_TributacaoCODIGOCUPOM: TStringField;
    TPesqProdutoMED: TStringField;
    TPesqProdutoPRECOVENDA: TFMTBCDField;
    TPesqProdutoPRECOPRAZO: TFMTBCDField;
    TPesqProdutoCODALIQUOTA: TIntegerField;
    TPesqProdutoCODIGOCUPOM: TStringField;
    QGruposNOME: TStringField;
    TGruposNOME: TStringField;
    QMarcaNOME: TStringField;
    TMarcaNOME: TStringField;
    QSecao: TSQLQuery;
    dspSecao: TDataSetProvider;
    TSecao: TClientDataSet;
    QSecaoCODIGO: TIntegerField;
    QSecaoNOME: TStringField;
    TSecaoCODIGO: TIntegerField;
    TSecaoNOME: TStringField;
    QProdutoLocalCODSECAO: TIntegerField;
    QProdutoLocalNOME: TStringField;
    QProdutoLocalNOME_1: TStringField;
    QProdutoLocalNOME_2: TStringField;
    QProdutoLocalNOME_3: TStringField;
    TProdutoLocalCODSECAO: TIntegerField;
    TProdutoLocalNOME: TStringField;
    TProdutoLocalNOME_1: TStringField;
    TProdutoLocalNOME_2: TStringField;
    TProdutoLocalNOME_3: TStringField;
    QUsuarioCHK_SECAO: TSmallintField;
    TUsuarioCHK_SECAO: TSmallintField;
    TPesqProdutoNOME: TStringField;
    TPesqProdutoNOME_1: TStringField;
    TPesqProdutoNOME_2: TStringField;
    QVendaLocalACRESCIMO: TFMTBCDField;
    QVendaLocalPERC_ACRESCIMO: TFMTBCDField;
    QVendaLocalDESCONTO: TFMTBCDField;
    QVendaLocalPERC_DESCONTO: TFMTBCDField;
    TVendaLocalACRESCIMO: TFMTBCDField;
    TVendaLocalPERC_ACRESCIMO: TFMTBCDField;
    TVendaLocalDESCONTO: TFMTBCDField;
    TVendaLocalPERC_DESCONTO: TFMTBCDField;
    QAgBancaria: TSQLQuery;
    QAgBancariaCODIGO: TIntegerField;
    QAgBancariaNOME: TStringField;
    DstAgBancaria: TDataSetProvider;
    TAgBancaria: TClientDataSet;
    TAgBancariaCODIGO: TIntegerField;
    TAgBancariaNOME: TStringField;
    QChequeBaixar: TSQLQuery;
    DstChequeBaixar: TDataSetProvider;
    TChequeBaixar: TClientDataSet;
    QChequeBaixarCODIGO: TIntegerField;
    QChequeBaixarCODBANCO: TIntegerField;
    QChequeBaixarNUMAGENCIA: TStringField;
    QChequeBaixarNUMCONTA: TStringField;
    QChequeBaixarNUMCHEQUE: TStringField;
    QChequeBaixarTITULAR: TStringField;
    QChequeBaixarCODCLIENTE: TIntegerField;
    QChequeBaixarDATAEMISSAO: TDateField;
    QChequeBaixarDATAVENCIMENTO: TDateField;
    QChequeBaixarVALOR: TFMTBCDField;
    QChequeBaixarCODVENDA: TIntegerField;
    QChequeBaixarCODVENDEDOR1: TIntegerField;
    QChequeBaixarCODVENDEDOR2: TIntegerField;
    QChequeBaixarCOMISSAO1: TFMTBCDField;
    QChequeBaixarCOMISSAO2: TFMTBCDField;
    QChequeBaixarCIDADE: TStringField;
    QChequeBaixarCPF: TStringField;
    QChequeBaixarCGC: TStringField;
    QChequeBaixarCODVERIFICA: TStringField;
    QChequeBaixarCODREMESSA: TIntegerField;
    QChequeBaixarREPARCELADO: TStringField;
    TChequeBaixarCODIGO: TIntegerField;
    TChequeBaixarCODBANCO: TIntegerField;
    TChequeBaixarNUMAGENCIA: TStringField;
    TChequeBaixarNUMCONTA: TStringField;
    TChequeBaixarNUMCHEQUE: TStringField;
    TChequeBaixarTITULAR: TStringField;
    TChequeBaixarCODCLIENTE: TIntegerField;
    TChequeBaixarDATAEMISSAO: TDateField;
    TChequeBaixarDATAVENCIMENTO: TDateField;
    TChequeBaixarVALOR: TFMTBCDField;
    TChequeBaixarCODVENDA: TIntegerField;
    TChequeBaixarCODVENDEDOR1: TIntegerField;
    TChequeBaixarCODVENDEDOR2: TIntegerField;
    TChequeBaixarCOMISSAO1: TFMTBCDField;
    TChequeBaixarCOMISSAO2: TFMTBCDField;
    TChequeBaixarCIDADE: TStringField;
    TChequeBaixarCPF: TStringField;
    TChequeBaixarCGC: TStringField;
    TChequeBaixarCODVERIFICA: TStringField;
    TChequeBaixarCODREMESSA: TIntegerField;
    TChequeBaixarREPARCELADO: TStringField;
    QUsuarioPE_CANCELA_ITEM: TSmallintField;
    TUsuarioPE_CANCELA_ITEM: TSmallintField;
    QUsuarioPE_CONFIG_DIVERSAS: TSmallintField;
    TUsuarioPE_CONFIG_DIVERSAS: TSmallintField;
    QUsuarioPE_CAD_PRODUTO: TSmallintField;
    TUsuarioPE_CAD_PRODUTO: TSmallintField;
    QVendaLocalPDV: TStringField;
    TVendaLocalPDV: TStringField;
    QVendaPDV: TStringField;
    TVendaPDV: TStringField;
    TPesqProdutoNOME_3: TStringField;
    TPDVNUMERO_CUPOM: TIntegerField;
    TPDVNUMERO_ECF: TStringField;
    QBuscaDAV: TSQLQuery;
    dspBuscaDAV: TDataSetProvider;
    TBuscaDAV: TClientDataSet;
    QBuscaItemDAV: TSQLQuery;
    dspBuscaItemDAV: TDataSetProvider;
    TBuscaItemDAV: TClientDataSet;
    QVendedor: TSQLQuery;
    QVendedorCODIGO: TIntegerField;
    QVendedorNOME: TStringField;
    QVendedorPERCCOMISSAOPRAZO: TFMTBCDField;
    QVendedorPERCCOMISSAOVISTA: TFMTBCDField;
    QVendedorINATIVO: TStringField;
    DstVendedor: TDataSetProvider;
    TVendedor: TClientDataSet;
    TVendedorCODIGO: TIntegerField;
    TVendedorNOME: TStringField;
    TVendedorPERCCOMISSAOPRAZO: TFMTBCDField;
    TVendedorPERCCOMISSAOVISTA: TFMTBCDField;
    TVendedorINATIVO: TStringField;
    QUsuarioPE_LIBERA_VENDA_ATRASO: TSmallintField;
    QUsuarioPE_LIBERA_VENDA_LIMITE_EXC: TSmallintField;
    QUsuarioPE_LIBERA_VENDA_INADIMPLENTE: TSmallintField;
    TUsuarioPE_LIBERA_VENDA_ATRASO: TSmallintField;
    TUsuarioPE_LIBERA_VENDA_LIMITE_EXC: TSmallintField;
    TUsuarioPE_LIBERA_VENDA_INADIMPLENTE: TSmallintField;
    QVendaLocalCHEQUE_PRE: TFMTBCDField;
    TVendaLocalCHEQUE_PRE: TFMTBCDField;
    TPDVTABELA: TStringField;
    QGenLocal: TSQLQuery;
    QBaixaEstoqueLocal: TSQLQuery;
    dspBaixaEstoqueLocal: TDataSetProvider;
    TBaixaEstoqueLocal: TClientDataSet;
    QBaixaEstoqueLocalCODIGO: TIntegerField;
    QBaixaEstoqueLocalQTDE: TFMTBCDField;
    TBaixaEstoqueLocalCODIGO: TIntegerField;
    TBaixaEstoqueLocalQTDE: TFMTBCDField;
    QPesquisaBaseLocal: TSQLQuery;
    T_TributacaoCODIGO: TIntegerField;
    TProdutoLocalCODIGO: TIntegerField;
    QPesquisaBaseRemota: TSQLQuery;
    QVendaCODIGO_VENDA_PDV: TIntegerField;
    TVendaCODIGO_VENDA_PDV: TIntegerField;
    QVendaPERCDESCONTO: TFMTBCDField;
    TVendaPERCDESCONTO: TFMTBCDField;
    QVendaCHEQUE_PRE: TFMTBCDField;
    TVendaCHEQUE_PRE: TFMTBCDField;
    QVendaPERCFINANCEIRO: TFMTBCDField;
    TVendaPERCFINANCEIRO: TFMTBCDField;
    QRota: TSQLQuery;
    dspRota: TDataSetProvider;
    TRota: TClientDataSet;
    QRotaCODIGO: TIntegerField;
    QRotaHISTORICO: TStringField;
    QRotaCODPRODUTO: TIntegerField;
    QRotaDATA: TDateField;
    QRotaANTERIOR: TFMTBCDField;
    QRotaENTRADA: TFMTBCDField;
    QRotaSAIDA: TFMTBCDField;
    TRotaCODIGO: TIntegerField;
    TRotaHISTORICO: TStringField;
    TRotaCODPRODUTO: TIntegerField;
    TRotaDATA: TDateField;
    TRotaANTERIOR: TFMTBCDField;
    TRotaENTRADA: TFMTBCDField;
    TRotaSAIDA: TFMTBCDField;
    QCaixa: TSQLQuery;
    dspCaixa: TDataSetProvider;
    TCaixa: TClientDataSet;
    QCaixaCODIGO: TIntegerField;
    QCaixaDATA: TDateField;
    QCaixaHISTORICO: TStringField;
    QCaixaENTRADA: TFMTBCDField;
    QCaixaSAIDA: TFMTBCDField;
    QCaixaTIPO: TStringField;
    QCaixaCODUSUARIO: TIntegerField;
    QCaixaCODVENDA: TIntegerField;
    QCaixaHORA: TTimeField;
    QCaixaTROCO: TFMTBCDField;
    QCaixaDINHEIRO: TFMTBCDField;
    QCaixaCHEQUE: TFMTBCDField;
    QCaixaCARTAO: TFMTBCDField;
    QCaixaTICKET: TFMTBCDField;
    TCaixaCODIGO: TIntegerField;
    TCaixaDATA: TDateField;
    TCaixaHISTORICO: TStringField;
    TCaixaENTRADA: TFMTBCDField;
    TCaixaSAIDA: TFMTBCDField;
    TCaixaTIPO: TStringField;
    TCaixaCODUSUARIO: TIntegerField;
    TCaixaCODVENDA: TIntegerField;
    TCaixaHORA: TTimeField;
    TCaixaTROCO: TFMTBCDField;
    TCaixaDINHEIRO: TFMTBCDField;
    TCaixaCHEQUE: TFMTBCDField;
    TCaixaCARTAO: TFMTBCDField;
    TCaixaTICKET: TFMTBCDField;
    QVendaCODPORTADOR: TIntegerField;
    TVendaCODPORTADOR: TIntegerField;
    QClientesCODCIDADE: TIntegerField;
    QClientesCODBAIRRO: TIntegerField;
    TClientesCODCIDADE: TIntegerField;
    TClientesCODBAIRRO: TIntegerField;
    QVendaCANCELADO: TStringField;
    QVendaCODCIDADE: TIntegerField;
    QVendaCODBAIRRO: TIntegerField;
    TVendaCANCELADO: TStringField;
    TVendaCODCIDADE: TIntegerField;
    TVendaCODBAIRRO: TIntegerField;
    QReceberCODCIDADE: TIntegerField;
    QReceberCODBAIRRO: TIntegerField;
    TReceberCODCIDADE: TIntegerField;
    TReceberCODBAIRRO: TIntegerField;
    QChequeBaixarCODCIDADE: TIntegerField;
    QChequeBaixarCODBAIRRO: TIntegerField;
    TChequeBaixarCODCIDADE: TIntegerField;
    TChequeBaixarCODBAIRRO: TIntegerField;
    QCancelaFinanceiro: TSQLQuery;
    QItemVendaCANCELADO: TStringField;
    TItemVendaCANCELADO: TStringField;
    QReceberCANCELADO: TStringField;
    TReceberCANCELADO: TStringField;
    QChequeBaixarCANCELADO: TStringField;
    TChequeBaixarCANCELADO: TStringField;
    QCaixaCANCELADO: TStringField;
    TCaixaCANCELADO: TStringField;
    QUsuarioVINCULADO_AO_VENDEDOR: TIntegerField;
    TUsuarioVINCULADO_AO_VENDEDOR: TIntegerField;
    QVendaLocalCOD_VENDEDOR: TIntegerField;
    TVendaLocalCOD_VENDEDOR: TIntegerField;
    QEmpresaCNPJ: TStringField;
    TEmpresaCNPJ: TStringField;
    QForma_Pgto: TSQLQuery;
    dspForma_Pgto: TDataSetProvider;
    TForma_Pgto: TClientDataSet;
    QForma_PgtoCODIGO: TIntegerField;
    QForma_PgtoDESCRICAO: TStringField;
    QForma_PgtoATALHO: TStringField;
    TForma_PgtoCODIGO: TIntegerField;
    TForma_PgtoDESCRICAO: TStringField;
    TForma_PgtoATALHO: TStringField;
    QForma_PgtoABRE_GAVETA: TStringField;
    QForma_PgtoTEF: TStringField;
    QForma_PgtoGERA_CREDIARIO: TStringField;
    QForma_PgtoIMPRIMI_COMPROVANTE: TStringField;
    TForma_PgtoABRE_GAVETA: TStringField;
    TForma_PgtoTEF: TStringField;
    TForma_PgtoGERA_CREDIARIO: TStringField;
    TForma_PgtoIMPRIMI_COMPROVANTE: TStringField;
    QProduto: TSQLQuery;
    DstProduto: TDataSetProvider;
    TProduto: TClientDataSet;
    TProdutoCODIGO: TIntegerField;
    TProdutoCODBARRA: TStringField;
    TProdutoREFERENCIA: TStringField;
    TProdutoDESCRICAO: TStringField;
    TProdutoDESCRIFISCAL: TStringField;
    TProdutoMED: TStringField;
    TProdutoCODGRUPO: TIntegerField;
    TProdutoCODMARCA: TIntegerField;
    TProdutoCODFORNECEDOR: TIntegerField;
    TProdutoPRECOCUSTO: TFMTBCDField;
    TProdutoPRECOVENDA: TFMTBCDField;
    TProdutoFINANCEIRO: TFMTBCDField;
    TProdutoPRECOPRAZO: TFMTBCDField;
    TProdutoPRECOFISCAL: TFMTBCDField;
    TProdutoQTDE: TFMTBCDField;
    TProdutoQTDEMINIMA: TFMTBCDField;
    TProdutoIPI: TFMTBCDField;
    TProdutoSUBST: TStringField;
    TProdutoICM: TFMTBCDField;
    TProdutoCODALIQUOTA: TIntegerField;
    TProdutoDESCONTOMAX: TFMTBCDField;
    TProdutoDATACADASTRO: TDateField;
    TProdutoDATAULTCOMPRA: TDateField;
    TProdutoDATAULTVENDA: TDateField;
    TProdutoCODSECAO: TIntegerField;
    TProdutoMAODEOBRA: TStringField;
    TProdutoECF: TStringField;
    TProdutoINATIVO: TStringField;
    TProdutoBALANCA: TStringField;
    TProdutoOBS: TBlobField;
    TProdutoSUBSTRIBUTARIA: TFMTBCDField;
    QProdutoCODIGO: TIntegerField;
    QProdutoCODBARRA: TStringField;
    QProdutoREFERENCIA: TStringField;
    QProdutoDESCRICAO: TStringField;
    QProdutoDESCRIFISCAL: TStringField;
    QProdutoMED: TStringField;
    QProdutoCODGRUPO: TIntegerField;
    QProdutoCODMARCA: TIntegerField;
    QProdutoCODFORNECEDOR: TIntegerField;
    QProdutoPRECOCUSTO: TFMTBCDField;
    QProdutoPRECOVENDA: TFMTBCDField;
    QProdutoFINANCEIRO: TFMTBCDField;
    QProdutoPRECOPRAZO: TFMTBCDField;
    QProdutoPRECOFISCAL: TFMTBCDField;
    QProdutoQTDE: TFMTBCDField;
    QProdutoQTDEMINIMA: TFMTBCDField;
    QProdutoIPI: TFMTBCDField;
    QProdutoSUBST: TStringField;
    QProdutoSUBSTRIBUTARIA: TFMTBCDField;
    QProdutoICM: TFMTBCDField;
    QProdutoCODALIQUOTA: TIntegerField;
    QProdutoDESCONTOMAX: TFMTBCDField;
    QProdutoDATACADASTRO: TDateField;
    QProdutoDATAULTCOMPRA: TDateField;
    QProdutoDATAULTVENDA: TDateField;
    QProdutoCODSECAO: TIntegerField;
    QProdutoOBS: TBlobField;
    QProdutoMAODEOBRA: TStringField;
    QProdutoECF: TStringField;
    QProdutoINATIVO: TStringField;
    QProdutoBALANCA: TStringField;
    QProdutoNOME: TStringField;
    QProdutoNOME_1: TStringField;
    QProdutoNOME_2: TStringField;
    QProdutoNOME_3: TStringField;
    TProdutoNOME: TStringField;
    TProdutoNOME_1: TStringField;
    TProdutoNOME_2: TStringField;
    TProdutoNOME_3: TStringField;
    QUsuarioCHK_FORMAPGTO: TSmallintField;
    QUsuarioPE_LIBERA_DESCONTO: TSmallintField;
    QUsuarioPE_MAXIMO_DESCONTO: TFMTBCDField;
    TUsuarioCHK_FORMAPGTO: TSmallintField;
    TUsuarioPE_LIBERA_DESCONTO: TSmallintField;
    TUsuarioPE_MAXIMO_DESCONTO: TFMTBCDField;
    TPDVP_VISTA: TFloatField;
    TPDVPERC_DESC: TFloatField;
    QUsuarioPE_LIBERA_DESC_MINIMO: TSmallintField;
    TUsuarioPE_LIBERA_DESC_MINIMO: TSmallintField;
    QUsuarioPE_ALTERA_CLIENTE: TSmallintField;
    TUsuarioPE_ALTERA_CLIENTE: TSmallintField;
    QProdutoLUCROLIQUIDO: TFMTBCDField;
    TProdutoLUCROLIQUIDO: TFMTBCDField;
    QCartao_Adm: TSQLQuery;
    dspCartao_Adm: TDataSetProvider;
    TCartao_Adm: TClientDataSet;
    QCartao_AdmCODIGO: TIntegerField;
    QCartao_AdmDESCRICAO: TStringField;
    QCartao_AdmTELEFONE: TStringField;
    QCartao_AdmFAX: TStringField;
    QCartao_AdmWEB_SITE: TStringField;
    QCartao_AdmE_MAIL: TStringField;
    QCartao_AdmTAXA_DESC_DEB: TFMTBCDField;
    QCartao_AdmTAXA_DESC_CRED: TFMTBCDField;
    QCartao_AdmNOME_REDE: TStringField;
    TCartao_AdmCODIGO: TIntegerField;
    TCartao_AdmDESCRICAO: TStringField;
    TCartao_AdmTELEFONE: TStringField;
    TCartao_AdmFAX: TStringField;
    TCartao_AdmWEB_SITE: TStringField;
    TCartao_AdmE_MAIL: TStringField;
    TCartao_AdmTAXA_DESC_DEB: TFMTBCDField;
    TCartao_AdmTAXA_DESC_CRED: TFMTBCDField;
    TCartao_AdmNOME_REDE: TStringField;
    QVendaLocalCOD_ADM_CARTAO: TIntegerField;
    QVendaLocalNUMERO_CARTOES: TSmallintField;
    QVendaLocalCARTAO_DEB_CRED: TStringField;
    QVendaLocalNUM_TRANSACAO_TEF: TIntegerField;
    TVendaLocalCOD_ADM_CARTAO: TIntegerField;
    TVendaLocalNUMERO_CARTOES: TSmallintField;
    TVendaLocalCARTAO_DEB_CRED: TStringField;
    TVendaLocalNUM_TRANSACAO_TEF: TIntegerField;
    QVendaLocalNUMERO_ECF: TStringField;
    TVendaLocalNUMERO_ECF: TStringField;
    QItemVendaLocalNUMERO_ECF: TStringField;
    TItemVendaLocalNUMERO_ECF: TStringField;
    QVendaNUMERO_ECF: TStringField;
    TVendaNUMERO_ECF: TStringField;
    QItemVendaNUMERO_ECF: TStringField;
    TItemVendaNUMERO_ECF: TStringField;
    QVendaLocalNOME_REDE_TEF: TStringField;
    QVendaLocalNUM_TRANS_NSU_TEF: TStringField;
    TVendaLocalNOME_REDE_TEF: TStringField;
    TVendaLocalNUM_TRANS_NSU_TEF: TStringField;
    QVendaLocalDATA_TRANS_TEF: TDateField;
    QVendaLocalHORA_TRANS_TEF: TTimeField;
    TVendaLocalDATA_TRANS_TEF: TDateField;
    TVendaLocalHORA_TRANS_TEF: TTimeField;
    QReducoes_Local: TSQLQuery;
    dspReducoes_Local: TDataSetProvider;
    TReducoes_Local: TClientDataSet;
    QReducoes_LocalCODIGO: TIntegerField;
    QReducoes_LocalDATA_HORA: TSQLTimeStampField;
    QReducoes_LocalNRO_SERIE_EQP: TStringField;
    QReducoes_LocalMODELO_DOC: TStringField;
    QReducoes_LocalNRO_CONTADOR_INICIO: TIntegerField;
    QReducoes_LocalNRO_CONTADOR_FIM: TIntegerField;
    QReducoes_LocalNR_CONTADOR_Z: TIntegerField;
    QReducoes_LocalCONTADOR_REINICIO: TIntegerField;
    QReducoes_LocalVALOR_VENDA_BRUTA: TFMTBCDField;
    QReducoes_LocalVALOR_VENDA_GERAL: TFMTBCDField;
    QReducoes_LocalVALOR_CANCELAMENTOS: TFMTBCDField;
    QReducoes_LocalVALOR_DESCONTOS: TFMTBCDField;
    QReducoes_LocalVALOR_ISSQN: TFMTBCDField;
    QReducoes_LocalVALOR_SUBST_TRIB: TFMTBCDField;
    QReducoes_LocalVALOR_ISENTO: TFMTBCDField;
    QReducoes_LocalVALOR_NAO_INCIDENCIA: TFMTBCDField;
    TReducoes_LocalCODIGO: TIntegerField;
    TReducoes_LocalDATA_HORA: TSQLTimeStampField;
    TReducoes_LocalNRO_SERIE_EQP: TStringField;
    TReducoes_LocalMODELO_DOC: TStringField;
    TReducoes_LocalNRO_CONTADOR_INICIO: TIntegerField;
    TReducoes_LocalNRO_CONTADOR_FIM: TIntegerField;
    TReducoes_LocalNR_CONTADOR_Z: TIntegerField;
    TReducoes_LocalCONTADOR_REINICIO: TIntegerField;
    TReducoes_LocalVALOR_VENDA_BRUTA: TFMTBCDField;
    TReducoes_LocalVALOR_VENDA_GERAL: TFMTBCDField;
    TReducoes_LocalVALOR_CANCELAMENTOS: TFMTBCDField;
    TReducoes_LocalVALOR_DESCONTOS: TFMTBCDField;
    TReducoes_LocalVALOR_ISSQN: TFMTBCDField;
    TReducoes_LocalVALOR_SUBST_TRIB: TFMTBCDField;
    TReducoes_LocalVALOR_ISENTO: TFMTBCDField;
    TReducoes_LocalVALOR_NAO_INCIDENCIA: TFMTBCDField;
    QReducoes_Remoto: TSQLQuery;
    dspReducoes_Remoto: TDataSetProvider;
    TReducoes_Remoto: TClientDataSet;
    QReducoes_RemotoCODIGO: TIntegerField;
    QReducoes_RemotoDATA_HORA: TSQLTimeStampField;
    QReducoes_RemotoNRO_SERIE_EQP: TStringField;
    QReducoes_RemotoMODELO_DOC: TStringField;
    QReducoes_RemotoNRO_CONTADOR_INICIO: TIntegerField;
    QReducoes_RemotoNRO_CONTADOR_FIM: TIntegerField;
    QReducoes_RemotoNR_CONTADOR_Z: TIntegerField;
    QReducoes_RemotoCONTADOR_REINICIO: TIntegerField;
    QReducoes_RemotoVALOR_VENDA_BRUTA: TFMTBCDField;
    QReducoes_RemotoVALOR_VENDA_GERAL: TFMTBCDField;
    QReducoes_RemotoVALOR_CANCELAMENTOS: TFMTBCDField;
    QReducoes_RemotoVALOR_DESCONTOS: TFMTBCDField;
    QReducoes_RemotoVALOR_ISSQN: TFMTBCDField;
    QReducoes_RemotoVALOR_SUBST_TRIB: TFMTBCDField;
    QReducoes_RemotoVALOR_ISENTO: TFMTBCDField;
    QReducoes_RemotoVALOR_NAO_INCIDENCIA: TFMTBCDField;
    TReducoes_RemotoCODIGO: TIntegerField;
    TReducoes_RemotoDATA_HORA: TSQLTimeStampField;
    TReducoes_RemotoNRO_SERIE_EQP: TStringField;
    TReducoes_RemotoMODELO_DOC: TStringField;
    TReducoes_RemotoNRO_CONTADOR_INICIO: TIntegerField;
    TReducoes_RemotoNRO_CONTADOR_FIM: TIntegerField;
    TReducoes_RemotoNR_CONTADOR_Z: TIntegerField;
    TReducoes_RemotoCONTADOR_REINICIO: TIntegerField;
    TReducoes_RemotoVALOR_VENDA_BRUTA: TFMTBCDField;
    TReducoes_RemotoVALOR_VENDA_GERAL: TFMTBCDField;
    TReducoes_RemotoVALOR_CANCELAMENTOS: TFMTBCDField;
    TReducoes_RemotoVALOR_DESCONTOS: TFMTBCDField;
    TReducoes_RemotoVALOR_ISSQN: TFMTBCDField;
    TReducoes_RemotoVALOR_SUBST_TRIB: TFMTBCDField;
    TReducoes_RemotoVALOR_ISENTO: TFMTBCDField;
    TReducoes_RemotoVALOR_NAO_INCIDENCIA: TFMTBCDField;
    QItemVendaLocalVL_TOTAL_BRUTO: TFMTBCDField;
    QItemVendaLocalPERC_DESCONTO: TFMTBCDField;
    QItemVendaLocalVALOR_DESCONTO: TFMTBCDField;
    QItemVendaLocalPERC_ACRESCIMO: TFMTBCDField;
    QItemVendaLocalVALOR_ACRESCIMO: TFMTBCDField;
    QItemVendaLocalBASE_ICMS: TFMTBCDField;
    QItemVendaLocalVALOR_ICMS: TFMTBCDField;
    TItemVendaLocalVL_TOTAL_BRUTO: TFMTBCDField;
    TItemVendaLocalPERC_DESCONTO: TFMTBCDField;
    TItemVendaLocalVALOR_DESCONTO: TFMTBCDField;
    TItemVendaLocalPERC_ACRESCIMO: TFMTBCDField;
    TItemVendaLocalVALOR_ACRESCIMO: TFMTBCDField;
    TItemVendaLocalBASE_ICMS: TFMTBCDField;
    TItemVendaLocalVALOR_ICMS: TFMTBCDField;
    QItemVendaALIQUOTA: TFMTBCDField;
    QItemVendaIPI: TFMTBCDField;
    QItemVendaBASE_ICMS: TFMTBCDField;
    QItemVendaVALOR_ICMS: TFMTBCDField;
    QItemVendaPERC_DESCONTO: TFMTBCDField;
    QItemVendaVALOR_DESCONTO: TFMTBCDField;
    QItemVendaPERC_ACRESCIMO: TFMTBCDField;
    QItemVendaVALOR_ACRESCIMO: TFMTBCDField;
    TItemVendaALIQUOTA: TFMTBCDField;
    TItemVendaIPI: TFMTBCDField;
    TItemVendaBASE_ICMS: TFMTBCDField;
    TItemVendaVALOR_ICMS: TFMTBCDField;
    TItemVendaPERC_DESCONTO: TFMTBCDField;
    TItemVendaVALOR_DESCONTO: TFMTBCDField;
    TItemVendaPERC_ACRESCIMO: TFMTBCDField;
    TItemVendaVALOR_ACRESCIMO: TFMTBCDField;
    QItemVendaLocalPERC_IPI: TFMTBCDField;
    TItemVendaLocalPERC_IPI: TFMTBCDField;
    QItemVendaLocalVL_UNIT_BRUTO: TFMTBCDField;
    TItemVendaLocalVL_UNIT_BRUTO: TFMTBCDField;
    QItemVendaVALOR_UNIT_BRUTO: TFMTBCDField;
    QItemVendaVALOR_TOTAL_BRUTO: TFMTBCDField;
    TItemVendaVALOR_UNIT_BRUTO: TFMTBCDField;
    TItemVendaVALOR_TOTAL_BRUTO: TFMTBCDField;
    TItemVendaLocalSUM_TOTAL: TAggregateField;
    QProdutoCUSTOFINAL: TFMTBCDField;
    TProdutoCUSTOFINAL: TFMTBCDField;
    QReceberREPARCELADO: TStringField;
    TReceberREPARCELADO: TStringField;
    TPDVPERC_IPI: TFloatField;
    QProdutoLocalIPI: TFMTBCDField;
    TProdutoLocalIPI: TFMTBCDField;
    TItemVendaSUM_TOTAL: TAggregateField;
    QVendaBASE_ICMS: TFMTBCDField;
    QVendaVALOR_ICMS: TFMTBCDField;
    TVendaBASE_ICMS: TFMTBCDField;
    TVendaVALOR_ICMS: TFMTBCDField;
    QVendaLocalBASE_ICMS: TFMTBCDField;
    QVendaLocalVALOR_ICMS: TFMTBCDField;
    TVendaLocalBASE_ICMS: TFMTBCDField;
    TVendaLocalVALOR_ICMS: TFMTBCDField;
    QReducoes_LocalALIQUOTA01: TStringField;
    QReducoes_LocalVALOR_TPARCIAL01: TFMTBCDField;
    QReducoes_LocalALIQUOTA02: TStringField;
    QReducoes_LocalVALOR_TPARCIAL02: TFMTBCDField;
    QReducoes_LocalALIQUOTA03: TStringField;
    QReducoes_LocalVALOR_TPARCIAL03: TFMTBCDField;
    QReducoes_LocalALIQUOTA04: TStringField;
    QReducoes_LocalVALOR_TPARCIAL04: TFMTBCDField;
    QReducoes_LocalALIQUOTA05: TStringField;
    QReducoes_LocalVALOR_TPARCIAL05: TFMTBCDField;
    QReducoes_LocalALIQUOTA06: TStringField;
    QReducoes_LocalVALOR_TPARCIAL06: TFMTBCDField;
    QReducoes_LocalALIQUOTA07: TStringField;
    QReducoes_LocalVALOR_TPARCIAL07: TFMTBCDField;
    QReducoes_LocalALIQUOTA08: TStringField;
    QReducoes_LocalVALOR_TPARCIAL08: TFMTBCDField;
    QReducoes_LocalALIQUOTA09: TStringField;
    QReducoes_LocalVALOR_TPARCIAL09: TFMTBCDField;
    QReducoes_LocalALIQUOTA010: TStringField;
    QReducoes_LocalVALOR_TPARCIAL010: TFMTBCDField;
    TReducoes_LocalALIQUOTA01: TStringField;
    TReducoes_LocalVALOR_TPARCIAL01: TFMTBCDField;
    TReducoes_LocalALIQUOTA02: TStringField;
    TReducoes_LocalVALOR_TPARCIAL02: TFMTBCDField;
    TReducoes_LocalALIQUOTA03: TStringField;
    TReducoes_LocalVALOR_TPARCIAL03: TFMTBCDField;
    TReducoes_LocalALIQUOTA04: TStringField;
    TReducoes_LocalVALOR_TPARCIAL04: TFMTBCDField;
    TReducoes_LocalALIQUOTA05: TStringField;
    TReducoes_LocalVALOR_TPARCIAL05: TFMTBCDField;
    TReducoes_LocalALIQUOTA06: TStringField;
    TReducoes_LocalVALOR_TPARCIAL06: TFMTBCDField;
    TReducoes_LocalALIQUOTA07: TStringField;
    TReducoes_LocalVALOR_TPARCIAL07: TFMTBCDField;
    TReducoes_LocalALIQUOTA08: TStringField;
    TReducoes_LocalVALOR_TPARCIAL08: TFMTBCDField;
    TReducoes_LocalALIQUOTA09: TStringField;
    TReducoes_LocalVALOR_TPARCIAL09: TFMTBCDField;
    TReducoes_LocalALIQUOTA010: TStringField;
    TReducoes_LocalVALOR_TPARCIAL010: TFMTBCDField;
    QReducoes_RemotoALIQUOTA01: TStringField;
    QReducoes_RemotoVALOR_TPARCIAL01: TFMTBCDField;
    QReducoes_RemotoALIQUOTA02: TStringField;
    QReducoes_RemotoVALOR_TPARCIAL02: TFMTBCDField;
    QReducoes_RemotoALIQUOTA03: TStringField;
    QReducoes_RemotoVALOR_TPARCIAL03: TFMTBCDField;
    QReducoes_RemotoALIQUOTA04: TStringField;
    QReducoes_RemotoVALOR_TPARCIAL04: TFMTBCDField;
    QReducoes_RemotoALIQUOTA05: TStringField;
    QReducoes_RemotoVALOR_TPARCIAL05: TFMTBCDField;
    QReducoes_RemotoALIQUOTA06: TStringField;
    QReducoes_RemotoVALOR_TPARCIAL06: TFMTBCDField;
    QReducoes_RemotoALIQUOTA07: TStringField;
    QReducoes_RemotoVALOR_TPARCIAL07: TFMTBCDField;
    QReducoes_RemotoALIQUOTA08: TStringField;
    QReducoes_RemotoVALOR_TPARCIAL08: TFMTBCDField;
    QReducoes_RemotoALIQUOTA09: TStringField;
    QReducoes_RemotoVALOR_TPARCIAL09: TFMTBCDField;
    QReducoes_RemotoALIQUOTA010: TStringField;
    QReducoes_RemotoVALOR_TPARCIAL010: TFMTBCDField;
    TReducoes_RemotoALIQUOTA01: TStringField;
    TReducoes_RemotoVALOR_TPARCIAL01: TFMTBCDField;
    TReducoes_RemotoALIQUOTA02: TStringField;
    TReducoes_RemotoVALOR_TPARCIAL02: TFMTBCDField;
    TReducoes_RemotoALIQUOTA03: TStringField;
    TReducoes_RemotoVALOR_TPARCIAL03: TFMTBCDField;
    TReducoes_RemotoALIQUOTA04: TStringField;
    TReducoes_RemotoVALOR_TPARCIAL04: TFMTBCDField;
    TReducoes_RemotoALIQUOTA05: TStringField;
    TReducoes_RemotoVALOR_TPARCIAL05: TFMTBCDField;
    TReducoes_RemotoALIQUOTA06: TStringField;
    TReducoes_RemotoVALOR_TPARCIAL06: TFMTBCDField;
    TReducoes_RemotoALIQUOTA07: TStringField;
    TReducoes_RemotoVALOR_TPARCIAL07: TFMTBCDField;
    TReducoes_RemotoALIQUOTA08: TStringField;
    TReducoes_RemotoVALOR_TPARCIAL08: TFMTBCDField;
    TReducoes_RemotoALIQUOTA09: TStringField;
    TReducoes_RemotoVALOR_TPARCIAL09: TFMTBCDField;
    TReducoes_RemotoALIQUOTA010: TStringField;
    TReducoes_RemotoVALOR_TPARCIAL010: TFMTBCDField;
    QReducoes_LocalNR_ORDEM_EQP: TStringField;
    TReducoes_LocalNR_ORDEM_EQP: TStringField;
    QReducoes_RemotoNR_ORDEM_EQP: TStringField;
    TReducoes_RemotoNR_ORDEM_EQP: TStringField;
    QProdutoLocalINATIVO: TStringField;
    TProdutoLocalINATIVO: TStringField;
    TPesqProdutoINATIVO: TStringField;
    QReducoes_RemotoCOD_REDUCAO_PDV: TIntegerField;
    TReducoes_RemotoCOD_REDUCAO_PDV: TIntegerField;
    QPegaDataHora: TSQLQuery;
    QPegaDataHoraCURRENT_TIMESTAMP: TSQLTimeStampField;
    QEmpresaTELEFONE: TStringField;
    QEmpresaFAX: TStringField;
    TEmpresaTELEFONE: TStringField;
    TEmpresaFAX: TStringField;
    QVendaLocalULT_ATUALIZACAO: TSQLTimeStampField;
    TVendaLocalULT_ATUALIZACAO: TSQLTimeStampField;
    PingConexao: TIdTCPClient;
    IdAntiFreeze: TIdAntiFreeze;
    TPesqClienteINATIVO: TStringField;
    QClientesINATIVO: TStringField;
    TClientesINATIVO: TStringField;
    QReducoes_LocalDATA_MOVIMENTO: TDateField;
    TReducoes_LocalDATA_MOVIMENTO: TDateField;
    QReducoes_RemotoDATA_MOVIMENTO: TDateField;
    TReducoes_RemotoDATA_MOVIMENTO: TDateField;
    QVendaIMPRIMIU_COO_ATRAVES_DAV: TStringField;
    TVendaIMPRIMIU_COO_ATRAVES_DAV: TStringField;
    QVendaLocalCOD_DAV: TIntegerField;
    TVendaLocalCOD_DAV: TIntegerField;
    TPDVNUM_CCF_CUPOM: TIntegerField;
    QVendaLocalNUM_CCF_CUPOM: TIntegerField;
    TVendaLocalNUM_CCF_CUPOM: TIntegerField;
    QVendaNUM_CCF_CUPOM: TIntegerField;
    TVendaNUM_CCF_CUPOM: TIntegerField;
    TPDVMF_ADICIONAL: TStringField;
    TPDVTIPO_ECF: TStringField;
    TPDVMARCA_ECF: TStringField;
    TPDVMODELO_ECF: TStringField;
    QVendaLocalMODELO_ECF: TStringField;
    QVendaLocalMARCA_ECF: TStringField;
    QVendaLocalTIPO_ECF: TStringField;
    QVendaLocalMF_ADICIONAL: TStringField;
    TVendaLocalMODELO_ECF: TStringField;
    TVendaLocalMARCA_ECF: TStringField;
    TVendaLocalTIPO_ECF: TStringField;
    TVendaLocalMF_ADICIONAL: TStringField;
    TPDVNUM_FABRICAO_ECF: TStringField;
    QVendaLocalNUM_FABRICACAO_ECF: TStringField;
    TVendaLocalNUM_FABRICACAO_ECF: TStringField;
    QDAVEmitidos: TSQLQuery;
    dspDAVEmitidos: TDataSetProvider;
    TDAVEmitidos: TClientDataSet;
    TDAVEmitidosDATA: TDateField;
    TDAVEmitidosCOD_DAV: TIntegerField;
    TDAVEmitidosNUM_FABRICACAO_ECF: TStringField;
    TDAVEmitidosMF_ADICIONAL: TStringField;
    TDAVEmitidosTIPO_ECF: TStringField;
    TDAVEmitidosMARCA_ECF: TStringField;
    TDAVEmitidosMODELO_ECF: TStringField;
    TDAVEmitidosNUMERO_CUPOM: TIntegerField;
    TDAVEmitidosNUM_CCF_CUPOM: TIntegerField;
    TDAVEmitidosTOTAL: TFMTBCDField;
    QProdutoLocalDATAULTVENDA: TDateField;
    TProdutoLocalDATAULTVENDA: TDateField;
    TPesqProdutoDATAULTVENDA: TDateField;
    TPesqProdutoALIQUOTA: TFMTBCDField;
    QRegistro: TSQLQuery;
    dspRegistro: TDataSetProvider;
    TRegistro: TClientDataSet;
    QRegistroCODIGO: TIntegerField;
    QRegistroNUM_LAUDO: TStringField;
    QRegistroCNPJ: TStringField;
    QRegistroRAZAO_EMPRESA: TStringField;
    QRegistroENDERECO: TStringField;
    QRegistroNUMERO: TStringField;
    QRegistroCOMPLEMENTO: TStringField;
    QRegistroBAIRRO: TStringField;
    QRegistroCIDADE: TStringField;
    QRegistroCEP: TStringField;
    QRegistroUF: TStringField;
    QRegistroRESPONSAVEL: TStringField;
    QRegistroNOME_COMERCIAL: TStringField;
    QRegistroVERSAO: TStringField;
    QRegistroPRINCIPAL_ARQUIVO_EXE: TStringField;
    QRegistroCOD_AUTENTICACAO: TStringField;
    QRegistroEXECUTAVEL_DAV: TStringField;
    TRegistroCODIGO: TIntegerField;
    TRegistroNUM_LAUDO: TStringField;
    TRegistroCNPJ: TStringField;
    TRegistroRAZAO_EMPRESA: TStringField;
    TRegistroENDERECO: TStringField;
    TRegistroNUMERO: TStringField;
    TRegistroCOMPLEMENTO: TStringField;
    TRegistroBAIRRO: TStringField;
    TRegistroCIDADE: TStringField;
    TRegistroCEP: TStringField;
    TRegistroUF: TStringField;
    TRegistroRESPONSAVEL: TStringField;
    TRegistroNOME_COMERCIAL: TStringField;
    TRegistroVERSAO: TStringField;
    TRegistroPRINCIPAL_ARQUIVO_EXE: TStringField;
    TRegistroCOD_AUTENTICACAO: TStringField;
    TRegistroEXECUTAVEL_DAV: TStringField;
    QRegistroFONE: TStringField;
    TRegistroFONE: TStringField;
    QRegistroINSC_ESTADUAL: TStringField;
    QRegistroINSC_MUNICIPAL: TStringField;
    TRegistroINSC_ESTADUAL: TStringField;
    TRegistroINSC_MUNICIPAL: TStringField;
    QRegistroFANTASIA_EMPRESA: TStringField;
    TRegistroFANTASIA_EMPRESA: TStringField;
    QRegistroVERSAO_ER_PAF_ECF: TStringField;
    TRegistroVERSAO_ER_PAF_ECF: TStringField;
    QConsultaReducoes: TSQLQuery;
    dspConsultaReducoes: TDataSetProvider;
    TConsultaReducoes: TClientDataSet;
    TConsultaReducoesCODIGO: TIntegerField;
    TConsultaReducoesDATA_HORA: TSQLTimeStampField;
    TConsultaReducoesDATA_MOVIMENTO: TDateField;
    TConsultaReducoesNRO_SERIE_EQP: TStringField;
    TConsultaReducoesNR_ORDEM_EQP: TStringField;
    TConsultaReducoesMODELO_DOC: TStringField;
    TConsultaReducoesNRO_CONTADOR_INICIO: TIntegerField;
    TConsultaReducoesNRO_CONTADOR_FIM: TIntegerField;
    TConsultaReducoesNR_CONTADOR_Z: TIntegerField;
    TConsultaReducoesCONTADOR_REINICIO: TIntegerField;
    TConsultaReducoesVALOR_VENDA_BRUTA: TFMTBCDField;
    TConsultaReducoesVALOR_VENDA_GERAL: TFMTBCDField;
    TConsultaReducoesVALOR_CANCELAMENTOS: TFMTBCDField;
    TConsultaReducoesVALOR_DESCONTOS: TFMTBCDField;
    TConsultaReducoesVALOR_ISSQN: TFMTBCDField;
    TConsultaReducoesVALOR_SUBST_TRIB: TFMTBCDField;
    TConsultaReducoesVALOR_ISENTO: TFMTBCDField;
    TConsultaReducoesVALOR_NAO_INCIDENCIA: TFMTBCDField;
    TConsultaReducoesALIQUOTA01: TStringField;
    TConsultaReducoesVALOR_TPARCIAL01: TFMTBCDField;
    TConsultaReducoesALIQUOTA02: TStringField;
    TConsultaReducoesVALOR_TPARCIAL02: TFMTBCDField;
    TConsultaReducoesALIQUOTA03: TStringField;
    TConsultaReducoesVALOR_TPARCIAL03: TFMTBCDField;
    TConsultaReducoesALIQUOTA04: TStringField;
    TConsultaReducoesVALOR_TPARCIAL04: TFMTBCDField;
    TConsultaReducoesALIQUOTA05: TStringField;
    TConsultaReducoesVALOR_TPARCIAL05: TFMTBCDField;
    TConsultaReducoesALIQUOTA06: TStringField;
    TConsultaReducoesVALOR_TPARCIAL06: TFMTBCDField;
    TConsultaReducoesALIQUOTA07: TStringField;
    TConsultaReducoesVALOR_TPARCIAL07: TFMTBCDField;
    TConsultaReducoesALIQUOTA08: TStringField;
    TConsultaReducoesVALOR_TPARCIAL08: TFMTBCDField;
    TConsultaReducoesALIQUOTA09: TStringField;
    TConsultaReducoesVALOR_TPARCIAL09: TFMTBCDField;
    TConsultaReducoesALIQUOTA010: TStringField;
    TConsultaReducoesVALOR_TPARCIAL010: TFMTBCDField;
    QConsultaVendas: TSQLQuery;
    dspConsultaVendas: TDataSetProvider;
    TConsultaVendas: TClientDataSet;
    TConsultaVendasCODIGO: TIntegerField;
    TConsultaVendasDATA: TDateField;
    TConsultaVendasHORA: TTimeField;
    TConsultaVendasNUMERO_ECF: TStringField;
    TConsultaVendasNUMERO_CUPOM: TIntegerField;
    TConsultaVendasCOD_CLIENTE: TIntegerField;
    TConsultaVendasCOD_OPERADOR: TIntegerField;
    TConsultaVendasCOD_VENDEDOR: TIntegerField;
    TConsultaVendasSUBTOTAL: TFMTBCDField;
    TConsultaVendasACRESCIMO: TFMTBCDField;
    TConsultaVendasPERC_ACRESCIMO: TFMTBCDField;
    TConsultaVendasDESCONTO: TFMTBCDField;
    TConsultaVendasPERC_DESCONTO: TFMTBCDField;
    TConsultaVendasTOTAL: TFMTBCDField;
    TConsultaVendasDINHEIRO: TFMTBCDField;
    TConsultaVendasCHEQUE: TFMTBCDField;
    TConsultaVendasCHEQUE_PRE: TFMTBCDField;
    TConsultaVendasCREDIARIO: TFMTBCDField;
    TConsultaVendasCARTAO: TFMTBCDField;
    TConsultaVendasTICKET: TFMTBCDField;
    TConsultaVendasTROCO: TFMTBCDField;
    TConsultaVendasTIPO: TStringField;
    TConsultaVendasNUMPGTO: TIntegerField;
    TConsultaVendasCUPOM_CANCELADO: TStringField;
    TConsultaVendasPDV: TStringField;
    TConsultaVendasCOD_DAV: TIntegerField;
    TConsultaVendasCOD_ADM_CARTAO: TIntegerField;
    TConsultaVendasNUMERO_CARTOES: TSmallintField;
    TConsultaVendasCARTAO_DEB_CRED: TStringField;
    TConsultaVendasNUM_TRANSACAO_TEF: TIntegerField;
    TConsultaVendasNOME_REDE_TEF: TStringField;
    TConsultaVendasNUM_TRANS_NSU_TEF: TStringField;
    TConsultaVendasDATA_TRANS_TEF: TDateField;
    TConsultaVendasHORA_TRANS_TEF: TTimeField;
    TConsultaVendasBASE_ICMS: TFMTBCDField;
    TConsultaVendasVALOR_ICMS: TFMTBCDField;
    TConsultaVendasULT_ATUALIZACAO: TSQLTimeStampField;
    TConsultaVendasNUM_CCF_CUPOM: TIntegerField;
    TConsultaVendasMODELO_ECF: TStringField;
    TConsultaVendasMARCA_ECF: TStringField;
    TConsultaVendasTIPO_ECF: TStringField;
    TConsultaVendasMF_ADICIONAL: TStringField;
    TConsultaVendasNUM_FABRICACAO_ECF: TStringField;
    TConsultaVendasNOME: TStringField;
    TConsultaVendasCPF: TStringField;
    TConsultaVendasCGC: TStringField;
    QConsultaItenVendas: TSQLQuery;
    dspConsultaItenVendas: TDataSetProvider;
    TConsultaItenVendas: TClientDataSet;
    TConsultaItenVendasDATA: TDateField;
    TConsultaItenVendasNUM_CCF_CUPOM: TIntegerField;
    TConsultaItenVendasCONTROLE: TIntegerField;
    TConsultaItenVendasCODIGO: TIntegerField;
    TConsultaItenVendasNUMERO_ECF: TStringField;
    TConsultaItenVendasNUMERO_CUPOM: TIntegerField;
    TConsultaItenVendasITEM: TIntegerField;
    TConsultaItenVendasCOD_PRODUTO: TIntegerField;
    TConsultaItenVendasDESCRICAO: TStringField;
    TConsultaItenVendasQUANTIDADE: TFMTBCDField;
    TConsultaItenVendasUNIDADE: TStringField;
    TConsultaItenVendasVL_UNITARIO: TFMTBCDField;
    TConsultaItenVendasST: TStringField;
    TConsultaItenVendasALIQUOTA: TFMTBCDField;
    TConsultaItenVendasVL_TOTAL: TFMTBCDField;
    TConsultaItenVendasTABELA: TStringField;
    TConsultaItenVendasVL_UNIT_BRUTO: TFMTBCDField;
    TConsultaItenVendasVL_TOTAL_BRUTO: TFMTBCDField;
    TConsultaItenVendasPERC_DESCONTO: TFMTBCDField;
    TConsultaItenVendasVALOR_DESCONTO: TFMTBCDField;
    TConsultaItenVendasPERC_ACRESCIMO: TFMTBCDField;
    TConsultaItenVendasVALOR_ACRESCIMO: TFMTBCDField;
    TConsultaItenVendasBASE_ICMS: TFMTBCDField;
    TConsultaItenVendasVALOR_ICMS: TFMTBCDField;
    TConsultaItenVendasPERC_IPI: TFMTBCDField;
    QItemVendaLocalCOD_TOTALIZADOR_PARCIAL: TStringField;
    TItemVendaLocalCOD_TOTALIZADOR_PARCIAL: TStringField;
    TConsultaItenVendasCOD_TOTALIZADOR_PARCIAL: TStringField;
    TConsultaItenVendasCUPOM_CANCELADO: TStringField;
    TTotalizadores_ECF: TClientDataSet;
    QItemVendaLocalST: TStringField;
    TItemVendaLocalST: TStringField;
    QItemVendaST: TStringField;
    TItemVendaST: TStringField;
    TTotalizadores_ECFALIQUOTA: TStringField;
    TTotalizadores_ECFVALOR: TStringField;
    TTotalizadores_ECFNUM_SERIE: TStringField;
    TPDVST: TStringField;
    QDocEmitidos: TSQLQuery;
    dspDocEmitidos: TDataSetProvider;
    TDocEmitidos: TClientDataSet;
    QDocEmitidosCODIGO: TIntegerField;
    QDocEmitidosCOO: TIntegerField;
    QDocEmitidosGNF: TIntegerField;
    QDocEmitidosGRG: TIntegerField;
    QDocEmitidosCDC: TIntegerField;
    QDocEmitidosDENOMINACAO: TStringField;
    QDocEmitidosDATA_EMISSAO: TDateField;
    QDocEmitidosCAIXA: TStringField;
    TDocEmitidosCODIGO: TIntegerField;
    TDocEmitidosCOO: TIntegerField;
    TDocEmitidosGNF: TIntegerField;
    TDocEmitidosGRG: TIntegerField;
    TDocEmitidosCDC: TIntegerField;
    TDocEmitidosDENOMINACAO: TStringField;
    TDocEmitidosDATA_EMISSAO: TDateField;
    TDocEmitidosCAIXA: TStringField;
    QDocEmitidosHORA_EMISSAO: TTimeField;
    TDocEmitidosHORA_EMISSAO: TTimeField;
    QDocEmitidosNUM_SERIE_ECF: TStringField;
    TDocEmitidosNUM_SERIE_ECF: TStringField;
    QConsultaDocEmitidos: TSQLQuery;
    dspConsultaDocEmitidos: TDataSetProvider;
    TConsultaDocEmitidos: TClientDataSet;
    TConsultaDocEmitidosCODIGO: TIntegerField;
    TConsultaDocEmitidosCOO: TIntegerField;
    TConsultaDocEmitidosGNF: TIntegerField;
    TConsultaDocEmitidosGRG: TIntegerField;
    TConsultaDocEmitidosCDC: TIntegerField;
    TConsultaDocEmitidosDENOMINACAO: TStringField;
    TConsultaDocEmitidosDATA_EMISSAO: TDateField;
    TConsultaDocEmitidosHORA_EMISSAO: TTimeField;
    TConsultaDocEmitidosCAIXA: TStringField;
    TConsultaDocEmitidosNUM_SERIE_ECF: TStringField;
    QVendaLocalCONTADOR_GNF: TIntegerField;
    TVendaLocalCONTADOR_GNF: TIntegerField;
    TConsultaVendasCONTADOR_GNF: TIntegerField;
    QMeiosPgtos: TSQLQuery;
    dspMeiosPgtos: TDataSetProvider;
    TMeiosPgtos: TClientDataSet;
    QMeiosPgtosCODIGO: TIntegerField;
    QMeiosPgtosCOD_VENDA: TIntegerField;
    QMeiosPgtosDESCR_PGTO: TStringField;
    QMeiosPgtosVALOR: TFMTBCDField;
    TMeiosPgtosCODIGO: TIntegerField;
    TMeiosPgtosCOD_VENDA: TIntegerField;
    TMeiosPgtosDESCR_PGTO: TStringField;
    TMeiosPgtosVALOR: TFMTBCDField;
    QMeiosPgtosR7: TSQLQuery;
    dspMeiosPgtosR7: TDataSetProvider;
    TMeiosPgtosR7: TClientDataSet;
    TMeiosPgtosR7DATA: TDateField;
    TMeiosPgtosR7NUMERO_ECF: TStringField;
    TMeiosPgtosR7NUMERO_CUPOM: TIntegerField;
    TMeiosPgtosR7NUM_CCF_CUPOM: TIntegerField;
    TMeiosPgtosR7CONTADOR_GNF: TIntegerField;
    TMeiosPgtosR7CUPOM_CANCELADO: TStringField;
    TMeiosPgtosR7COD_VENDA: TIntegerField;
    TMeiosPgtosR7DESCR_PGTO: TStringField;
    TMeiosPgtosR7VALOR: TFMTBCDField;
    QCNIEE: TSQLQuery;
    dspCNIEE: TDataSetProvider;
    TCNIEE: TClientDataSet;
    QCNIEECODIGO: TIntegerField;
    TCNIEECODIGO: TIntegerField;
    QCNIEECOD_MC: TStringField;
    QCNIEECOD_MD: TStringField;
    QCNIEECOD_VR: TStringField;
    QCNIEETIPO: TStringField;
    QCNIEEMARCA: TStringField;
    QCNIEEMODELO: TStringField;
    QCNIEEVERSAO: TStringField;
    TCNIEECOD_MC: TStringField;
    TCNIEECOD_MD: TStringField;
    TCNIEECOD_VR: TStringField;
    TCNIEETIPO: TStringField;
    TCNIEEMARCA: TStringField;
    TCNIEEMODELO: TStringField;
    TCNIEEVERSAO: TStringField;
    QConsultaMeiosPgtos: TSQLQuery;
    dspConsultaMeiosPgtos: TDataSetProvider;
    TConsultaMeiosPgtos: TClientDataSet;
    TConsultaMeiosPgtosDATA: TDateField;
    TConsultaMeiosPgtosNUMERO_ECF: TStringField;
    TConsultaMeiosPgtosDESCR_PGTO: TStringField;
    TConsultaMeiosPgtosTOTAL: TFMTBCDField;
    QMeiosPgtosTROCO: TFMTBCDField;
    TMeiosPgtosTROCO: TFMTBCDField;
    QProdutoIAT: TStringField;
    QProdutoIPPT: TStringField;
    TProdutoIAT: TStringField;
    TProdutoIPPT: TStringField;
    TPesqProdutoIAT: TStringField;
    TPesqProdutoIPPT: TStringField;
    QDocNaoFiscal: TSQLQuery;
    dspDocNaoFiscal: TDataSetProvider;
    TDocNaoFiscal: TClientDataSet;
    QDocNaoFiscalCODIGO: TIntegerField;
    QDocNaoFiscalDATA: TDateField;
    QDocNaoFiscalNOME: TStringField;
    QDocNaoFiscalHISTORICO: TStringField;
    QDocNaoFiscalVALOR: TFMTBCDField;
    QDocNaoFiscalTIPO_MOVIMENTO: TStringField;
    QDocNaoFiscalFORMA_PGTO: TStringField;
    QDocNaoFiscalNUM_COO: TIntegerField;
    QDocNaoFiscalNUM_GNF: TIntegerField;
    QDocNaoFiscalNUM_GRG: TIntegerField;
    QDocNaoFiscalNUMERO_SERIE_IMP: TStringField;
    TDocNaoFiscalCODIGO: TIntegerField;
    TDocNaoFiscalDATA: TDateField;
    TDocNaoFiscalNOME: TStringField;
    TDocNaoFiscalHISTORICO: TStringField;
    TDocNaoFiscalVALOR: TFMTBCDField;
    TDocNaoFiscalTIPO_MOVIMENTO: TStringField;
    TDocNaoFiscalFORMA_PGTO: TStringField;
    TDocNaoFiscalNUM_COO: TIntegerField;
    TDocNaoFiscalNUM_GNF: TIntegerField;
    TDocNaoFiscalNUM_GRG: TIntegerField;
    TDocNaoFiscalNUMERO_SERIE_IMP: TStringField;
    TDescAcresc: TClientDataSet;
    TDescAcrescCODPRODUTO: TIntegerField;
    TDescAcrescITEM: TIntegerField;
    TDescAcrescOPERADOR: TStringField;
    TDescAcrescTIPO_DESC_ACRESC: TStringField;
    TDescAcrescVALOR: TFloatField;
    TDescAcrescDESC_ACRESC: TStringField;
    TDescAcrescDESCRICAO: TStringField;
    TDescAcrescPERC_VALOR: TFloatField;
    QProdutoLocalCST: TStringField;
    TProdutoLocalCST: TStringField;
    QReducoes_LocalPOSI_ALIQUOTA01: TStringField;
    QReducoes_LocalPOSI_ALIQUOTA02: TStringField;
    QReducoes_LocalPOSI_ALIQUOTA03: TStringField;
    QReducoes_LocalPOSI_ALIQUOTA04: TStringField;
    QReducoes_LocalPOSI_ALIQUOTA05: TStringField;
    QReducoes_LocalPOSI_ALIQUOTA06: TStringField;
    QReducoes_LocalPOSI_ALIQUOTA07: TStringField;
    QReducoes_LocalPOSI_ALIQUOTA08: TStringField;
    QReducoes_LocalPOSI_ALIQUOTA09: TStringField;
    QReducoes_LocalPOSI_ALIQUOTA010: TStringField;
    TReducoes_LocalPOSI_ALIQUOTA01: TStringField;
    TReducoes_LocalPOSI_ALIQUOTA02: TStringField;
    TReducoes_LocalPOSI_ALIQUOTA03: TStringField;
    TReducoes_LocalPOSI_ALIQUOTA04: TStringField;
    TReducoes_LocalPOSI_ALIQUOTA05: TStringField;
    TReducoes_LocalPOSI_ALIQUOTA06: TStringField;
    TReducoes_LocalPOSI_ALIQUOTA07: TStringField;
    TReducoes_LocalPOSI_ALIQUOTA08: TStringField;
    TReducoes_LocalPOSI_ALIQUOTA09: TStringField;
    TReducoes_LocalPOSI_ALIQUOTA010: TStringField;
    QReducoes_RemotoPOSI_ALIQUOTA01: TStringField;
    QReducoes_RemotoPOSI_ALIQUOTA02: TStringField;
    QReducoes_RemotoPOSI_ALIQUOTA03: TStringField;
    QReducoes_RemotoPOSI_ALIQUOTA04: TStringField;
    QReducoes_RemotoPOSI_ALIQUOTA05: TStringField;
    QReducoes_RemotoPOSI_ALIQUOTA06: TStringField;
    QReducoes_RemotoPOSI_ALIQUOTA07: TStringField;
    QReducoes_RemotoPOSI_ALIQUOTA08: TStringField;
    QReducoes_RemotoPOSI_ALIQUOTA09: TStringField;
    QReducoes_RemotoPOSI_ALIQUOTA010: TStringField;
    TReducoes_RemotoPOSI_ALIQUOTA01: TStringField;
    TReducoes_RemotoPOSI_ALIQUOTA02: TStringField;
    TReducoes_RemotoPOSI_ALIQUOTA03: TStringField;
    TReducoes_RemotoPOSI_ALIQUOTA04: TStringField;
    TReducoes_RemotoPOSI_ALIQUOTA05: TStringField;
    TReducoes_RemotoPOSI_ALIQUOTA06: TStringField;
    TReducoes_RemotoPOSI_ALIQUOTA07: TStringField;
    TReducoes_RemotoPOSI_ALIQUOTA08: TStringField;
    TReducoes_RemotoPOSI_ALIQUOTA09: TStringField;
    TReducoes_RemotoPOSI_ALIQUOTA010: TStringField;
    TConsultaReducoesPOSI_ALIQUOTA01: TStringField;
    TConsultaReducoesPOSI_ALIQUOTA02: TStringField;
    TConsultaReducoesPOSI_ALIQUOTA03: TStringField;
    TConsultaReducoesPOSI_ALIQUOTA04: TStringField;
    TConsultaReducoesPOSI_ALIQUOTA05: TStringField;
    TConsultaReducoesPOSI_ALIQUOTA06: TStringField;
    TConsultaReducoesPOSI_ALIQUOTA07: TStringField;
    TConsultaReducoesPOSI_ALIQUOTA08: TStringField;
    TConsultaReducoesPOSI_ALIQUOTA09: TStringField;
    TConsultaReducoesPOSI_ALIQUOTA010: TStringField;
    QItemVendaLocalCST: TStringField;
    TItemVendaLocalCST: TStringField;
    QItemVendaCST: TStringField;
    TItemVendaCST: TStringField;
    TPDVCST: TStringField;
    TPesqProdutoQTDEEF: TFMTBCDField;
    QProdutoLocalCODBARRA: TStringField;
    TProdutoLocalCODBARRA: TStringField;
    TPesqProdutoCODBARRA: TStringField;
    TPesqProdutoSALDO: TFloatField;
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
    TPDVGrade: TClientDataSet;
    TPDVGradeCOD_PRODUTO: TIntegerField;
    TPDVGradeCOD_GRADE: TIntegerField;
    TPDVGradeQTDE: TFloatField;
    TPDVGradeITEN: TIntegerField;
    TPDVGradeCOD_COR: TIntegerField;
    TPDVGradeCOD_TAMANHO: TIntegerField;
    QVendaGrade: TSQLQuery;
    dspVendaGrade: TDataSetProvider;
    TVendaGrade: TClientDataSet;
    QVendaGradeCODIGO: TIntegerField;
    QVendaGradeCOD_VENDA: TIntegerField;
    QVendaGradeCOD_PRODUTO: TIntegerField;
    QVendaGradeCOD_GRADE: TIntegerField;
    QVendaGradeQTDE: TFMTBCDField;
    QVendaGradeCOD_COR: TSmallintField;
    QVendaGradeCOD_TAMANHO: TSmallintField;
    TVendaGradeCODIGO: TIntegerField;
    TVendaGradeCOD_VENDA: TIntegerField;
    TVendaGradeCOD_PRODUTO: TIntegerField;
    TVendaGradeCOD_GRADE: TIntegerField;
    TVendaGradeQTDE: TFMTBCDField;
    TVendaGradeCOD_COR: TSmallintField;
    TVendaGradeCOD_TAMANHO: TSmallintField;
    QVendaGradeLocal: TSQLQuery;
    dspVendaGradeLocal: TDataSetProvider;
    TVendaGradeLocal: TClientDataSet;
    QVendaGradeLocalCODIGO: TIntegerField;
    QVendaGradeLocalCOD_VENDA: TIntegerField;
    QVendaGradeLocalCOD_PRODUTO: TIntegerField;
    QVendaGradeLocalCOD_GRADE: TIntegerField;
    QVendaGradeLocalQTDE: TFMTBCDField;
    QVendaGradeLocalCOD_COR: TSmallintField;
    QVendaGradeLocalCOD_TAMANHO: TSmallintField;
    TVendaGradeLocalCODIGO: TIntegerField;
    TVendaGradeLocalCOD_VENDA: TIntegerField;
    TVendaGradeLocalCOD_PRODUTO: TIntegerField;
    TVendaGradeLocalCOD_GRADE: TIntegerField;
    TVendaGradeLocalQTDE: TFMTBCDField;
    TVendaGradeLocalCOD_COR: TSmallintField;
    TVendaGradeLocalCOD_TAMANHO: TSmallintField;
    QBaixaGradeLocal: TSQLQuery;
    dspBaixaGradeLocal: TDataSetProvider;
    TBaixaGradeLocal: TClientDataSet;
    QBaixaGradeLocalCODIGO: TIntegerField;
    QBaixaGradeLocalQTDE: TFMTBCDField;
    TBaixaGradeLocalCODIGO: TIntegerField;
    TBaixaGradeLocalQTDE: TFMTBCDField;
    QBaixaGrade: TSQLQuery;
    dspBaixaGrade: TDataSetProvider;
    TBaixaGrade: TClientDataSet;
    QBaixaGradeCODIGO: TIntegerField;
    QBaixaGradeQTDE: TFMTBCDField;
    TBaixaGradeCODIGO: TIntegerField;
    TBaixaGradeQTDE: TFMTBCDField;
    TBuscaDAVCODIGO: TIntegerField;
    TBuscaDAVDTEMISSAO: TDateField;
    TBuscaDAVCODCLIENTE: TIntegerField;
    TBuscaDAVNOMECLIENTE: TStringField;
    TBuscaDAVCODVENDEDOR: TIntegerField;
    TBuscaDAVDESCONTO: TFMTBCDField;
    TBuscaDAVVALOR: TFMTBCDField;
    TBuscaDAVTOTALCUSTO: TFMTBCDField;
    TBuscaDAVOBS: TStringField;
    TBuscaDAVNUMERO_DAV: TIntegerField;
    TBuscaDAVVALIDADE: TDateField;
    TBuscaDAVSITUACAO: TStringField;
    TBuscaDAVALTERADO: TStringField;
    TBuscaDAVHORA: TTimeField;
    TBuscaDAVNOME: TStringField;
    TBuscaItemDAVCODIGO: TIntegerField;
    TBuscaItemDAVCODPRODUTO: TIntegerField;
    TBuscaItemDAVQTDE: TFMTBCDField;
    TBuscaItemDAVPRECO: TFMTBCDField;
    TBuscaItemDAVTOTALITEN: TFMTBCDField;
    TBuscaItemDAVCUSTO: TFMTBCDField;
    TBuscaItemDAVTABELA: TStringField;
    TBuscaItemDAVDESCRICAO: TStringField;
    TBuscaDAVSUBTOTAL: TFloatField;
    TPDVBUSCOU_DAV: TBooleanField;
    TPDVCOD_DAV: TIntegerField;
    TPDVCODCLIENTE_DAV: TIntegerField;
    TPDVCLIENTE_DAV: TStringField;
    TPDVDESCONTO_DAV: TFloatField;
    QBuscaGradeDAV: TSQLQuery;
    dspBuscaGradeDAV: TDataSetProvider;
    TBuscaGradeDAV: TClientDataSet;
    TBuscaGradeDAVCODIGO: TIntegerField;
    TBuscaGradeDAVCOD_ORCAMENTO: TIntegerField;
    TBuscaGradeDAVCOD_PRODUTO: TIntegerField;
    TBuscaGradeDAVCOD_GRADE: TIntegerField;
    TBuscaGradeDAVQTDE: TFMTBCDField;
    TBuscaGradeDAVCOD_COR: TSmallintField;
    TBuscaGradeDAVCOD_TAMANHO: TSmallintField;
    TBuscaGradeDAVNOME_COR: TStringField;
    TBuscaGradeDAVNOME_TAMANHO: TStringField;
    TBuscaGradeDAVREFERENCIA: TStringField;
    TBuscaGradeDAVCOD_BARRA: TStringField;
    TBuscaGradeDAVVARIACAO: TStringField;
    QProdutoLocalIAT: TStringField;
    QProdutoLocalIPPT: TStringField;
    TProdutoLocalIAT: TStringField;
    TProdutoLocalIPPT: TStringField;
    TPesqGradeProdDESCRICAO: TStringField;
    TBuscaDAVFLAG: TSmallintField;
    TPDVFLAG_DAV: TIntegerField;
    QOrcDAV: TSQLQuery;
    QOrcDAVCODIGO: TIntegerField;
    QOrcDAVNUMERO_DAV: TIntegerField;
    QOrcDAVSITUACAO: TStringField;
    QOrcDAVNUMERO_CUPOM: TIntegerField;
    QOrcDAVNUMERO_SERIE_ECF: TStringField;
    QOrcDAVNUMERO_CAIXA: TSmallintField;
    dspOrcDAV: TDataSetProvider;
    TOrcDAV: TClientDataSet;
    TOrcDAVCODIGO: TIntegerField;
    TOrcDAVNUMERO_DAV: TIntegerField;
    TOrcDAVSITUACAO: TStringField;
    TOrcDAVNUMERO_CUPOM: TIntegerField;
    TOrcDAVNUMERO_SERIE_ECF: TStringField;
    TOrcDAVNUMERO_CAIXA: TSmallintField;
    TBuscaDAVNUMERO_FLAG: TIntegerField;
    TPDVNUM_FLAG_DAV: TIntegerField;
    QBaixaEstoqueLocalDATAULTVENDA: TDateField;
    TBaixaEstoqueLocalDATAULTVENDA: TDateField;
    QVendaMODELO_NF: TStringField;
    QVendaSERIE_NF: TStringField;
    TVendaMODELO_NF: TStringField;
    TVendaSERIE_NF: TStringField;
    QEmpresaCONTATO: TStringField;
    TEmpresaCONTATO: TStringField;
    QContabilista: TSQLQuery;
    dspContabilista: TDataSetProvider;
    TContabilista: TClientDataSet;
    QContabilistaCODIGO: TIntegerField;
    QContabilistaNOME: TStringField;
    QContabilistaCPF: TStringField;
    QContabilistaCRC: TStringField;
    QContabilistaCNPJ: TStringField;
    QContabilistaCEP: TStringField;
    QContabilistaENDERECO: TStringField;
    QContabilistaNUMERO: TStringField;
    QContabilistaCOMPLEMENTO: TStringField;
    QContabilistaBAIRRO: TStringField;
    QContabilistaFONE: TStringField;
    QContabilistaFAX: TStringField;
    QContabilistaEMAIL: TStringField;
    TContabilistaCODIGO: TIntegerField;
    TContabilistaNOME: TStringField;
    TContabilistaCPF: TStringField;
    TContabilistaCRC: TStringField;
    TContabilistaCNPJ: TStringField;
    TContabilistaCEP: TStringField;
    TContabilistaENDERECO: TStringField;
    TContabilistaNUMERO: TStringField;
    TContabilistaCOMPLEMENTO: TStringField;
    TContabilistaBAIRRO: TStringField;
    TContabilistaFONE: TStringField;
    TContabilistaFAX: TStringField;
    TContabilistaEMAIL: TStringField;
    QEmpresaEMAIL: TStringField;
    TEmpresaEMAIL: TStringField;
    QEmpresaINSC_SUFRAMA: TStringField;
    TEmpresaINSC_SUFRAMA: TStringField;
    QEmpresaCOMPLEMENTO: TStringField;
    TEmpresaCOMPLEMENTO: TStringField;
    QProdutoLocalCOD_NCM: TStringField;
    TProdutoLocalCOD_NCM: TStringField;
    QProdutoCOD_NCM: TStringField;
    TProdutoCOD_NCM: TStringField;
    QContabilistaCOD_MUNICIPIO: TStringField;
    TContabilistaCOD_MUNICIPIO: TStringField;
    QEmpresaCOD_MUNICIPIO: TStringField;
    TEmpresaCOD_MUNICIPIO: TStringField;
    QContabilistaCIDADE: TStringField;
    TContabilistaCIDADE: TStringField;
    procedure TProdutoLocalAfterInsert(DataSet: TDataSet);
    procedure TProdutoLocalCODGRUPOValidate(Sender: TField);
    procedure TProdutoLocalCODMARCAValidate(Sender: TField);
    procedure DstReceberBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure TReceberNewRecord(DataSet: TDataSet);
    procedure TReceberAfterInsert(DataSet: TDataSet);
    procedure TProdutoLocalCODALIQUOTAValidate(Sender: TField);
    procedure TProdutoLocalCODSECAOValidate(Sender: TField);
    procedure dspVendaLocalBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure TVendaLocalNewRecord(DataSet: TDataSet);
    procedure dspVendaBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure TVendaNewRecord(DataSet: TDataSet);
    procedure DstChequeBaixarBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspRotaBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspCaixaBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure TChequeBaixarNewRecord(DataSet: TDataSet);
    procedure TRotaNewRecord(DataSet: TDataSet);
    procedure TCaixaNewRecord(DataSet: TDataSet);
    procedure TVendaAfterPost(DataSet: TDataSet);
    procedure TReceberAfterPost(DataSet: TDataSet);
    procedure TChequeBaixarAfterPost(DataSet: TDataSet);
    procedure TVendaAfterInsert(DataSet: TDataSet);
    procedure TItemVendaAfterInsert(DataSet: TDataSet);
    procedure TChequeBaixarAfterInsert(DataSet: TDataSet);
    procedure TCaixaAfterInsert(DataSet: TDataSet);
    procedure TProdutoAfterInsert(DataSet: TDataSet);
    procedure TCartao_AdmAfterInsert(DataSet: TDataSet);
    procedure dspReducoes_LocalBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure TReducoes_LocalNewRecord(DataSet: TDataSet);
    procedure TPDVAfterPost(DataSet: TDataSet);
    procedure TPDVAfterDelete(DataSet: TDataSet);
    procedure TProdutoAfterEdit(DataSet: TDataSet);
    procedure TClientesAfterEdit(DataSet: TDataSet);
    procedure TVendaLocalAfterEdit(DataSet: TDataSet);
    procedure TVendaLocalAfterInsert(DataSet: TDataSet);
    procedure TClientesAfterInsert(DataSet: TDataSet);
    procedure TTotalizadores_ECFAfterDelete(DataSet: TDataSet);
    procedure TTotalizadores_ECFAfterPost(DataSet: TDataSet);
    procedure dspDocEmitidosBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure TDocEmitidosNewRecord(DataSet: TDataSet);
    procedure dspMeiosPgtosBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure TMeiosPgtosNewRecord(DataSet: TDataSet);
    procedure TDescAcrescAfterDelete(DataSet: TDataSet);
    procedure TDescAcrescAfterPost(DataSet: TDataSet);
    procedure TPesqProdutoCalcFields(DataSet: TDataSet);
    procedure TPesqGradeProdCalcFields(DataSet: TDataSet);
    procedure TPDVGradeAfterDelete(DataSet: TDataSet);
    procedure TPDVGradeAfterPost(DataSet: TDataSet);
    procedure dspVendaGradeLocalBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspVendaGradeBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure TVendaGradeLocalNewRecord(DataSet: TDataSet);
    procedure TVendaGradeNewRecord(DataSet: TDataSet);
    procedure TBuscaDAVCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FSeqTmp : Integer;
    FNumCodigo : Integer;
  public
    { Public declarations }
    procedure FecharTodasSqlQuery;
  end;

var
  DM: TDM;

implementation

uses UBarsa, Math, lite_frmprincipal;

{$R *.dfm}

procedure TDM.FecharTodasSqlQuery;
var
   I : Integer;
begin
    for I := 0 to ComponentCount - 1 do
    if (Components[i] is TSQLQuery) then
    TSQLQuery(Components[i]).Close;
end;

procedure TDM.TProdutoLocalAfterInsert(DataSet: TDataSet);
begin
     TProdutoLocalPrecoVenda.AsFloat:=0;
     TProdutoLocalPrecoPrazo.AsFloat:=0;
     TProdutoLocalPrecoCusto.AsFloat:=0;
     TProdutoLocalQtde.AsFloat:=0;
     TProdutoLocalDescontoMax.AsFloat:=0;
     TProdutoLocalQtdeMinima.AsFloat:=0;
end;

procedure TDM.TProdutoLocalCODGRUPOValidate(Sender: TField);
begin
     if not Sender.IsNull
     then begin
          With QPesquisa
          do begin
             Close;
             Sql.Clear;
             Sql.Add('SELECT CODIGO,NOME FROM GRUPO');
             Sql.Add('WHERE CODIGO=:PCODIGO');
             ParamByName('PCODIGO').AsInteger:=Sender.Value;
             Open;
             end;
        Try
          if not QPesquisa.IsEmpty
          then TProdutoLocal.FieldByName('NOME').Value:=
               QPesquisa.FieldByName('NOME').Value
          else raise Exception.Create('Grupo não cadastrado');
        Finally
          QPesquisa.Close;
          end;
      end;
end;

procedure TDM.TProdutoLocalCODMARCAValidate(Sender: TField);
begin
     if not Sender.IsNull
     then begin
          With QPesquisa
          do begin
             Close;
             Sql.Clear;
             Sql.Add('SELECT CODIGO,NOME FROM MARCA');
             Sql.Add('WHERE CODIGO=:PCODIGO');
             ParamByName('PCODIGO').AsInteger:=Sender.Value;
             Open;
             end;
        Try
          if not QPesquisa.IsEmpty
          then TProdutoLocal.FieldByName('NOME_2').Value:=
               QPesquisa.FieldByName('NOME').Value
          else raise Exception.Create('Marca não cadastrado');
        Finally
          QPesquisa.Close;
          end;
      end;
end;

procedure TDM.DstReceberBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
     if UpdateKind = ukInsert
     then begin
          With QGenRemoto
          do begin
             Close;
             Sql.Clear;
             Sql.Add('SELECT GEN_ID(GEN_RECEBER_ID,1) AS CODIGO_NOVO FROM DUAL');
             Open;
             end;
          Try
             FNumCodigo := QGenRemoto.FieldByName('CODIGO_NOVO').AsInteger;
          Finally
             QGenRemoto.Close;
             end;
          DeltaDs.FieldByName('CODIGO').NewValue:=FNumCodigo;
       end;
end;

procedure TDM.TReceberNewRecord(DataSet: TDataSet);
begin
     Dec(FSeqTmp);
     TReceber.FieldByName('CODIGO').AsInteger:=FSeqTmp;
end;

procedure TDM.TReceberAfterInsert(DataSet: TDataSet);
begin
     TReceberValor.AsFloat:=0;
     TReceberValorRecebido.AsFloat:=0;
     TReceberCodVenda.AsInteger:=0;
     TReceberComissao1.AsFloat:=100;
     TReceberComissao2.AsFloat:=0;
     TReceberCANCELADO.AsString:='N';
     TReceberREPARCELADO.AsString:='N';
end;

procedure TDM.TProdutoLocalCODALIQUOTAValidate(Sender: TField);
begin
     if not Sender.IsNull
     then begin
          With QPesquisa
          do begin
             Close;
             Sql.Clear;
             Sql.Add('SELECT CODIGO,NOME FROM ECFALIQUOTA');
             Sql.Add('WHERE CODIGO=:PCODIGO');
             ParamByName('PCODIGO').AsInteger:=Sender.Value;
             Open;
             end;
        Try
          if not QPesquisa.IsEmpty
          then TProdutoLocal.FieldByName('NOME_3').Value:=
               QPesquisa.FieldByName('NOME').Value
          else raise Exception.Create('Tributação não cadastrado');
        Finally
          QPesquisa.Close;
          end;
      end;
end;

procedure TDM.TProdutoLocalCODSECAOValidate(Sender: TField);
begin
     if not Sender.IsNull
     then begin
          With QPesquisa
          do begin
             Close;
             Sql.Clear;
             Sql.Add('SELECT CODIGO,NOME FROM SECAO');
             Sql.Add('WHERE CODIGO=:PCODIGO');
             ParamByName('PCODIGO').AsInteger:=Sender.Value;
             Open;
             end;
        Try
          if not QPesquisa.IsEmpty
          then TProdutoLocal.FieldByName('NOME_1').Value:=
               QPesquisa.FieldByName('NOME').Value
          else raise Exception.Create('Seção não cadastrado');
        Finally
          QPesquisa.Close;
          end;
      end;
end;

procedure TDM.dspVendaLocalBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
    if UpdateKind = ukInsert
    then begin
          if SourceDs = QVendaLocal
          then begin
                With QGenLocal
                do begin
                   Close;
                   Sql.Clear;
                   Sql.Add('SELECT GEN_ID(GEN_VENDA_ID,1) AS CODIGO_NOVO FROM DUAL');
                   Open;
                   end;
                try
                  FNumCodigo := QGenLocal.FieldByName('CODIGO_NOVO').AsInteger;
                finally
                  QGenLocal.Close;
                end;
                DeltaDs.FieldByName('CODIGO').NewValue := FNumCodigo;
          end else if (SourceDs = QItemVendaLocal)
          then if TItemVendaLocal.FieldByName('CODIGO').AsInteger < 0
          then DeltaDs.FieldByName('CODIGO').NewValue := FNumCodigo;
      end;
end;

procedure TDM.TVendaLocalNewRecord(DataSet: TDataSet);
begin
     Dec(FSeqTmp);
     TVendaLocal.FieldByName('CODIGO').AsInteger:=FSeqTmp;
end;

procedure TDM.dspVendaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
    if UpdateKind = ukInsert
    then begin
          if SourceDs = QVenda
          then begin
                With QGenRemoto
                do begin
                   Close;
                   Sql.Clear;
                   Sql.Add('SELECT GEN_ID(GEN_VENDA_ID,1) AS CODIGO_NOVO FROM DUAL');
                   Open;
                   end;
                try
                  FNumCodigo := QGenRemoto.FieldByName('CODIGO_NOVO').AsInteger;
                finally
                  QGenRemoto.Close;
                end;
                DeltaDs.FieldByName('CODVENDA').NewValue := FNumCodigo;
          end else if (SourceDs = QItemVenda)
          then if TItemVenda.FieldByName('CODVENDA').AsInteger < 0
          then DeltaDs.FieldByName('CODVENDA').NewValue := FNumCodigo;
      end;
end;

procedure TDM.TVendaNewRecord(DataSet: TDataSet);
begin
     Dec(FSeqTmp);
     TVenda.FieldByName('CODVENDA').AsInteger:=FSeqTmp;
end;

procedure TDM.DstChequeBaixarBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
     if UpdateKind = ukInsert
     then begin
          With QGenRemoto
          do begin
             Close;
             Sql.Clear;
             Sql.Add('SELECT GEN_ID(GEN_CLICHEQUEABAIXAR_ID,1) AS CODIGO_NOVO FROM DUAL');
             Open;
             end;
          Try
             FNumCodigo := QGenRemoto.FieldByName('CODIGO_NOVO').AsInteger;
          Finally
             QGenRemoto.Close;
             end;
          DeltaDs.FieldByName('CODIGO').NewValue:=FNumCodigo;
       end;
end;

procedure TDM.dspRotaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
     if UpdateKind = ukInsert
     then begin
          With QGenRemoto
          do begin
             Close;
             Sql.Clear;
             Sql.Add('SELECT GEN_ID(GEN_ROTATIVIDADE_ID,1) AS CODIGO_NOVO FROM DUAL');
             Open;
             end;
          Try
             FNumCodigo := QGenRemoto.FieldByName('CODIGO_NOVO').AsInteger;
          Finally
             QGenRemoto.Close;
             end;
          DeltaDs.FieldByName('CODIGO').NewValue:=FNumCodigo;
       end;
end;

procedure TDM.dspCaixaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
     if UpdateKind = ukInsert
     then begin
          With QGenRemoto
          do begin
             Close;
             Sql.Clear;
             Sql.Add('SELECT GEN_ID(GEN_CAIXA_ID,1) AS CODIGO_NOVO FROM DUAL');
             Open;
             end;
          Try
             FNumCodigo := QGenRemoto.FieldByName('CODIGO_NOVO').AsInteger;
          Finally
             QGenRemoto.Close;
             end;
          DeltaDs.FieldByName('CODIGO').NewValue:=FNumCodigo;
       end;
end;

procedure TDM.TChequeBaixarNewRecord(DataSet: TDataSet);
begin
     Dec(FSeqTmp);
     TChequeBaixar.FieldByName('CODIGO').AsInteger:=FSeqTmp;
end;

procedure TDM.TRotaNewRecord(DataSet: TDataSet);
begin
     Dec(FSeqTmp);
     TRota.FieldByName('CODIGO').AsInteger:=FSeqTmp;
end;

procedure TDM.TCaixaNewRecord(DataSet: TDataSet);
begin
     Dec(FSeqTmp);
     TCaixa.FieldByName('CODIGO').AsInteger:=FSeqTmp;
end;

procedure TDM.TVendaAfterPost(DataSet: TDataSet);
begin
     With QPesquisaBaseRemota
     do begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT CODIGO,CODCIDADE,CODBAIRRO FROM CLIENTE');
        Sql.Add('WHERE CODIGO=:PCODIGO');
        ParamByName('PCODIGO').AsInteger:=TVendaCodCliente.AsInteger;
        Open;
        TVenda.Edit;
        TVendaCodCidade.AsInteger:=FieldByName('CODCIDADE').AsInteger;
        TVendaCodBairro.AsInteger:=FieldByName('CODBAIRRO').AsInteger;
        Close;
        end;
end;

procedure TDM.TReceberAfterPost(DataSet: TDataSet);
begin
     With QPesquisaBaseRemota
     do begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT CODIGO,CODCIDADE,CODBAIRRO FROM CLIENTE');
        Sql.Add('WHERE CODIGO=:PCODIGO');
        ParamByName('PCODIGO').AsInteger:=TReceberCodCliente.AsInteger;
        Open;
        TReceber.Edit;
        TReceberCodCidade.AsInteger:=FieldByName('CODCIDADE').AsInteger;
        TReceberCodBairro.AsInteger:=FieldByName('CODBAIRRO').AsInteger;
        Close;
        end;
end;

procedure TDM.TChequeBaixarAfterPost(DataSet: TDataSet);
begin
     With QPesquisaBaseRemota
     do begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT CODIGO,CODCIDADE,CODBAIRRO FROM CLIENTE');
        Sql.Add('WHERE CODIGO=:PCODIGO');
        ParamByName('PCODIGO').AsInteger:=TChequeBaixarCodCliente.AsInteger;
        Open;
        TChequeBaixar.Edit;
        TChequeBaixarCodCidade.AsInteger:=FieldByName('CODCIDADE').AsInteger;
        TChequeBaixarCodBairro.AsInteger:=FieldByName('CODBAIRRO').AsInteger;
        Close;
        end;
end;

procedure TDM.TVendaAfterInsert(DataSet: TDataSet);
begin
     TVendaCANCELADO.AsString:='N';
end;

procedure TDM.TItemVendaAfterInsert(DataSet: TDataSet);
begin
     TItemVendaCANCELADO.AsString:='N';
end;

procedure TDM.TChequeBaixarAfterInsert(DataSet: TDataSet);
begin
     TChequeBaixarCANCELADO.AsString:='N';
end;

procedure TDM.TCaixaAfterInsert(DataSet: TDataSet);
begin
     TCaixaCANCELADO.AsString:='N';
end;

procedure TDM.TProdutoAfterInsert(DataSet: TDataSet);
begin
     TProdutoECF.AsString:='N';
     TProdutoInativo.AsString:='N';
     TProdutoMaodeObra.AsString:='N';
     TProdutoBalanca.AsString:='N';
     TProdutoDataCadastro.AsDateTime:=Date();
     TProdutoPrecoFiscal.AsFloat:=0;
     TProdutoQtde.AsFloat:=0;
     TProdutoQtdeMinima.AsFloat:=0;
     TProdutoPrecoCusto.AsFloat:=0;
     TProdutoIPI.AsFloat:=0;
     TProdutoSubstributaria.AsFloat:=0;
     TProdutoLucroLiquido.AsFloat:=0;
     TProdutoPrecoVenda.AsFloat:=0;
     TProdutoPrecoPrazo.AsFloat:=0;
     TProdutoDescontoMax.AsFloat:=0;
     TProdutoFinanceiro.AsFloat:=0;
     TProdutoMed.AsString:='UN';

     If ServidorRemoto='ON'
     then begin
          PegaDataHoraServidor;
          With QPesquisaBaseRemota
          do begin
             Close;
             Sql.Clear;
             SQL.Add('UPDATE ESTOQUE SET ULT_ALTERACAO = :PULT_ATUALIZACAO');
             Sql.Add('WHERE CODIGO = :PCODIGO');
             ParamByName('PULT_ATUALIZACAO').AsSQLTimeStamp:=DM.QPegaDataHoraCURRENT_TIMESTAMP.AsSQLTimeStamp;
             ParamByName('PCODIGO').AsInteger:=TProdutoCODIGO.AsInteger;
             ExecSQL();
             end;
          end;

end;

procedure TDM.TCartao_AdmAfterInsert(DataSet: TDataSet);
begin
     TCartao_AdmTAXA_DESC_DEB.AsCurrency:=0;
     TCartao_AdmTAXA_DESC_CRED.AsCurrency:=0;
end;

procedure TDM.dspReducoes_LocalBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
     if UpdateKind = ukInsert
     then begin
          With QGenLocal
          do begin
             Close;
             Sql.Clear;
             Sql.Add('SELECT GEN_ID(GEN_REDUCOES_ID,1) AS CODIGO_NOVO FROM DUAL');
             Open;
             end;
          Try
             FNumCodigo := QGenLocal.FieldByName('CODIGO_NOVO').AsInteger;
          Finally
             QGenLocal.Close;
             end;
          DeltaDs.FieldByName('CODIGO').NewValue:=FNumCodigo;
       end;
end;

procedure TDM.TReducoes_LocalNewRecord(DataSet: TDataSet);
begin
     Dec(FSeqTmp);
     TReducoes_Local.FieldByName('CODIGO').AsInteger:=FSeqTmp;
end;

procedure TDM.TPDVAfterPost(DataSet: TDataSet);
begin
    TPDV.SaveToFile(TPDV.FileName,dfXML);
end;

procedure TDM.TPDVAfterDelete(DataSet: TDataSet);
begin
   TPDV.SaveToFile(TPDV.FileName,dfXML);
end;

procedure TDM.TProdutoAfterEdit(DataSet: TDataSet);
begin
     If ServidorRemoto='ON'
     then begin
          PegaDataHoraServidor;
          With QPesquisaBaseRemota
          do begin
             Close;
             Sql.Clear;
             SQL.Add('UPDATE ESTOQUE SET ULT_ALTERACAO = :PULT_ATUALIZACAO');
             Sql.Add('WHERE CODIGO = :PCODIGO');
             ParamByName('PULT_ATUALIZACAO').AsSQLTimeStamp:=DM.QPegaDataHoraCURRENT_TIMESTAMP.AsSQLTimeStamp;
             ParamByName('PCODIGO').AsInteger:=TProdutoCODIGO.AsInteger;
             ExecSQL();
             end;
          end;
end;

procedure TDM.TClientesAfterEdit(DataSet: TDataSet);
begin
     If ServidorRemoto='ON'
     then begin
          PegaDataHoraServidor;
          With QPesquisaBaseRemota
          do begin
             Close;
             Sql.Clear;
             SQL.Add('UPDATE CLIENTE SET ULT_ALTERACAO = :PULT_ATUALIZACAO');
             Sql.Add('WHERE CODIGO = :PCODIGO');
             ParamByName('PULT_ATUALIZACAO').AsSQLTimeStamp:=DM.QPegaDataHoraCURRENT_TIMESTAMP.AsSQLTimeStamp;
             ParamByName('PCODIGO').AsInteger:=TClientesCODIGO.AsInteger;
             ExecSQL();
             end;
          end;
end;

procedure TDM.TVendaLocalAfterEdit(DataSet: TDataSet);
begin
     TVendaLocalULT_ATUALIZACAO.AsDateTime:=Now;
end;

procedure TDM.TVendaLocalAfterInsert(DataSet: TDataSet);
begin
     TVendaLocalDINHEIRO.AsCurrency:=0;
     TVendaLocalCHEQUE.AsCurrency:=0;
     TVendaLocalCHEQUE_PRE.AsCurrency:=0;
     TVendaLocalCREDIARIO.AsCurrency:=0;
     TVendaLocalCARTAO.AsCurrency:=0;
     TVendaLocalTICKET.AsCurrency:=0;
     TVendaLocalTROCO.AsCurrency:=0;
     TVendaLocalULT_ATUALIZACAO.AsDateTime:=Now;
end;

procedure TDM.TClientesAfterInsert(DataSet: TDataSet);
begin
     TClientesINATIVO.AsString:='N';

     If ServidorRemoto='ON'
     then begin
          PegaDataHoraServidor;
          With QPesquisaBaseRemota
          do begin
             Close;
             Sql.Clear;
             SQL.Add('UPDATE CLIENTE SET ULT_ALTERACAO = :PULT_ATUALIZACAO');
             Sql.Add('WHERE CODIGO = :PCODIGO');
             ParamByName('PULT_ATUALIZACAO').AsSQLTimeStamp:=DM.QPegaDataHoraCURRENT_TIMESTAMP.AsSQLTimeStamp;
             ParamByName('PCODIGO').AsInteger:=TClientesCODIGO.AsInteger;
             ExecSQL();
             end;
          end;
end;

procedure TDM.TTotalizadores_ECFAfterDelete(DataSet: TDataSet);
begin
    TTotalizadores_ECF.SaveToFile(TTotalizadores_ECF.FileName,dfXML);
end;

procedure TDM.TTotalizadores_ECFAfterPost(DataSet: TDataSet);
begin
    TTotalizadores_ECF.SaveToFile(TTotalizadores_ECF.FileName,dfXML);
end;

procedure TDM.dspDocEmitidosBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
     if UpdateKind = ukInsert
     then begin
          With QGenLocal
          do begin
             Close;
             Sql.Clear;
             Sql.Add('SELECT GEN_ID(GEN_DOC_EMITIDOS_ECF_ID,1) AS CODIGO_NOVO FROM DUAL');
             Open;
             end;
          Try
             FNumCodigo := QGenLocal.FieldByName('CODIGO_NOVO').AsInteger;
          Finally
             QGenLocal.Close;
             end;
          DeltaDs.FieldByName('CODIGO').NewValue:=FNumCodigo;
       end;
end;

procedure TDM.TDocEmitidosNewRecord(DataSet: TDataSet);
begin
     Dec(FSeqTmp);
     TDocEmitidos.FieldByName('CODIGO').AsInteger:=FSeqTmp;
end;

procedure TDM.dspMeiosPgtosBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
     if UpdateKind = ukInsert
     then begin
          With QGenLocal
          do begin
             Close;
             Sql.Clear;
             Sql.Add('SELECT GEN_ID(GEN_MEIOS_PGTOS_ID,1) AS CODIGO_NOVO FROM DUAL');
             Open;
             end;
          Try
             FNumCodigo := QGenLocal.FieldByName('CODIGO_NOVO').AsInteger;
          Finally
             QGenLocal.Close;
             end;
          DeltaDs.FieldByName('CODIGO').NewValue:=FNumCodigo;
       end;
end;

procedure TDM.TMeiosPgtosNewRecord(DataSet: TDataSet);
begin
     Dec(FSeqTmp);
     TMeiosPgtos.FieldByName('CODIGO').AsInteger:=FSeqTmp;
end;

procedure TDM.TDescAcrescAfterDelete(DataSet: TDataSet);
begin
     TDescAcresc.SaveToFile(TDescAcresc.FileName,dfXML);
end;

procedure TDM.TDescAcrescAfterPost(DataSet: TDataSet);
begin
     TDescAcresc.SaveToFile(TDescAcresc.FileName,dfXML);
end;

procedure TDM.TPesqProdutoCalcFields(DataSet: TDataSet);
begin
     if TPesqProduto.State = dsInternalCalc
     then TPesqProdutoSALDO.AsCurrency:=TPesqProdutoQTDE.AsCurrency - TPesqProdutoQTDEEF.AsCurrency;
end;

procedure TDM.TPesqGradeProdCalcFields(DataSet: TDataSet);
begin
     TPesqGradeProdSALDO.AsCurrency := TPesqGradeProdQTDE.AsCurrency - TPesqGradeProdQTDE_EF.AsCurrency;
end;

procedure TDM.TPDVGradeAfterDelete(DataSet: TDataSet);
begin
   TPDVGrade.SaveToFile(TPDVGrade.FileName,dfXML);
end;

procedure TDM.TPDVGradeAfterPost(DataSet: TDataSet);
begin
    TPDVGrade.SaveToFile(TPDVGrade.FileName,dfXML);
end;

procedure TDM.dspVendaGradeLocalBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
     if UpdateKind = ukInsert
     then begin
          With DM.QGenLocal
          do begin
             Close;
             Sql.Clear;
             Sql.Add('SELECT GEN_ID(GEN_VENDA_GRADE_ID,1) AS CODIGO_NOVO FROM DUAL');
             Open;
             end;
          Try
             FNumCodigo := QGenLocal.FieldByName('CODIGO_NOVO').AsInteger;
          Finally
             QGenLocal.Close;
             end;
          DeltaDs.FieldByName('CODIGO').NewValue:=FNumCodigo;
       end;
end;

procedure TDM.dspVendaGradeBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
     if UpdateKind = ukInsert
     then begin
          With QGenRemoto
          do begin
             Close;
             Sql.Clear;
             Sql.Add('SELECT GEN_ID(GEN_VENDA_GRADE_ID,1) AS CODIGO_NOVO FROM DUAL');
             Open;
             end;
          Try
             FNumCodigo := QGenRemoto.FieldByName('CODIGO_NOVO').AsInteger;
          Finally
             QGenRemoto.Close;
             end;
          DeltaDs.FieldByName('CODIGO').NewValue:=FNumCodigo;
       end;
end;

procedure TDM.TVendaGradeLocalNewRecord(DataSet: TDataSet);
begin
     Dec(FSeqTmp);
     TVendaGradeLocal.FieldByName('CODIGO').AsInteger:=FSeqTmp;
end;

procedure TDM.TVendaGradeNewRecord(DataSet: TDataSet);
begin
     Dec(FSeqTmp);
     TVendaGrade.FieldByName('CODIGO').AsInteger:=FSeqTmp;
end;

procedure TDM.TBuscaDAVCalcFields(DataSet: TDataSet);
begin
     if TBuscaDAV.State = dsInternalCalc
     then TBuscaDAVSUBTOTAL.AsCurrency := TBuscaDAVVALOR.AsCurrency + TBuscaDAVDESCONTO.AsCurrency;
end;

end.
