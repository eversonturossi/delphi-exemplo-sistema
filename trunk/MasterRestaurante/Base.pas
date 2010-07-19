unit Base;
//localhost:D:\Automação Comercial\MasterERP\db\MASTERERP.FDB
interface

uses
  SysUtils, Classes, WideStrings, DBXFirebird, FMTBcd, DB, SqlExpr, IniFiles,
  Forms, Provider, DBClient, Messages, Dialogs, Controls;

type
  TBancoDados = class(TDataModule)
    Conexao: TSQLConnection;
    qryLog: TSQLQuery;
    qryExecute: TSQLQuery;
    qryLogin: TSQLQuery;
    qryLoginLOGIN: TStringField;
    qryLoginSENHA: TStringField;
    qryAuxiliar: TSQLQuery;
    qryGeraID: TSQLQuery;
    qryVendedorFuncao: TSQLQuery;
    qryVendedorFuncaoABREVIACAO: TStringField;
    qryLoginVENDEDOR_FUNCAO_ID: TIntegerField;
    qryLoginVENDEDOR_ID: TIntegerField;
    CDSRestauranteGarcon: TClientDataSet;
    DSRestauranteComanda: TDataSource;
    DSPRestauranteGarcon: TDataSetProvider;
    qryRestauranteComanda: TSQLQuery;
    qryRestauranteGarcon: TSQLQuery;
    DSRestauranteComandaItem: TDataSource;
    CDSRestauranteComanda: TClientDataSet;
    CDSRestauranteComandaRESTAURANTE_COMANDA_ID: TIntegerField;
    CDSRestauranteComandaVENDEDOR_ID: TIntegerField;
    CDSRestauranteComandaRESTAURANTE_GARCON_ID: TIntegerField;
    CDSRestauranteComandaDATA_LANCAMENTO: TSQLTimeStampField;
    DSRestauranteGarcon: TDataSource;
    CDSRestauranteComandaItem: TClientDataSet;
    DSPRestauranteComandaItem: TDataSetProvider;
    qryRestauranteComandaItem: TSQLQuery;
    CDSRestauranteComandaItemRESTAURANTE_COMANDA_ITEM_ID: TIntegerField;
    CDSRestauranteComandaItemRESTAURANTE_COMANDA_ID: TIntegerField;
    CDSRestauranteComandaItemCANCELADO: TSmallintField;
    CDSRestauranteComandaItemPRODUTO_ID: TIntegerField;
    CDSRestauranteComandaItemQUANTIDADE: TFloatField;
    CDSRestauranteComandaItemPRECO: TFloatField;
    CDSRestauranteComandaItemTOTAL: TFloatField;
    CDSRestauranteGarconRESTAURANTE_GARCON_ID: TIntegerField;
    CDSRestauranteGarconATIVO: TSmallintField;
    CDSRestauranteGarconDATA_CADASTRO: TSQLTimeStampField;
    CDSRestauranteGarconDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSRestauranteGarconNOME: TStringField;
    CDSRestauranteGarconCOMISSAO: TFloatField;
    qryProduto: TSQLQuery;
    DSProduto: TDataSource;
    CDSProduto: TClientDataSet;
    DSPProduto: TDataSetProvider;
    CDSProdutoPRODUTO_ID: TIntegerField;
    CDSProdutoATIVO: TSmallintField;
    CDSProdutoDATA_CADASTRO: TSQLTimeStampField;
    CDSProdutoDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSProdutoDESCRICAO: TStringField;
    CDSProdutoDESCRICAO_REDUZIDA: TStringField;
    CDSProdutoREFERENCIA: TStringField;
    CDSProdutoUNIDADE_ID: TIntegerField;
    CDSRestauranteComandal_gargon_nome: TStringField;
    DSRestauranteMesa: TDataSource;
    CDSRestauranteMesa: TClientDataSet;
    qryRestauranteMesa: TSQLQuery;
    CDSRestauranteMesaRESTAURANTE_MESA_ID: TIntegerField;
    CDSRestauranteMesaSTATUS: TStringField;
    CDSRestauranteMesaATIVO: TSmallintField;
    CDSRestauranteMesaDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSRestauranteMesaDATA_CADASTRO: TSQLTimeStampField;
    CDSRestauranteMesaNUMERO: TSmallintField;
    qryRestauranteMesaGarcon: TSQLQuery;
    DSRestauranteMesaGarcon: TDataSource;
    CDSRestauranteMesaGarcon: TClientDataSet;
    DSPRestauranteMesaGarcon: TDataSetProvider;
    CDSRestauranteMesaGarconRESTAURANTE_MESA_GARCON_ID: TIntegerField;
    CDSRestauranteMesaGarconRESTAURANTE_MESA_ID: TIntegerField;
    CDSRestauranteMesaGarconRESTAURANTE_GARCON_ID: TIntegerField;
    CDSRestauranteMesaGarconDATA_CADASTRO: TSQLTimeStampField;
    CDSRestauranteMesac_mesa_garcon_nome: TStringField;
    DSPRestauranteComanda: TDataSetProvider;
    CDSRestauranteComandaFECHADO: TSmallintField;
    CDSRestauranteComandaCANCELADO: TSmallintField;
    CDSUnidade: TClientDataSet;
    DSPUnidade: TDataSetProvider;
    DSUnidade: TDataSource;
    qryUnidade: TSQLQuery;
    CDSProdutoPRECO: TFloatField;
    CDSUnidadeUNIDADE_ID: TIntegerField;
    CDSUnidadeATIVO: TSmallintField;
    CDSUnidadeDATA_CADASTRO: TSQLTimeStampField;
    CDSUnidadeDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSUnidadeDESCRICAO: TStringField;
    CDSProdutol_unidade: TStringField;
    CDSRestauranteMesaDESCRICAO: TStringField;
    DSPRestauranteMesa: TDataSetProvider;
    DSVenda: TDataSource;
    CDSVenda: TClientDataSet;
    DSPVenda: TDataSetProvider;
    qryVenda: TSQLQuery;
    CDSVendaVENDA_ID: TIntegerField;
    CDSVendaDATA_LANCAMENTO: TSQLTimeStampField;
    CDSVendaFECHADO: TSmallintField;
    CDSVendaCANCELADO: TSmallintField;
    CDSVendaCLIENTE_ID: TIntegerField;
    CDSVendaACRESCIMO: TFloatField;
    CDSVendaDESCONTO: TFloatField;
    CDSVendaSUBTOTAL: TFloatField;
    CDSVendaItem: TClientDataSet;
    DSVendaItem: TDataSource;
    DSPVendaItem: TDataSetProvider;
    qryVendaItem: TSQLQuery;
    CDSVendaItemVENDA_ITEM_ID: TIntegerField;
    CDSVendaItemVENDA_ID: TIntegerField;
    CDSVendaItemCANCELADO: TSmallintField;
    CDSVendaItemPRODUTO_ID: TIntegerField;
    CDSVendaItemQUANTIDADE: TFloatField;
    CDSVendaItemPRECO: TFloatField;
    CDSVendaItemTOTAL: TFloatField;
    CDSVendaItemITEM: TSmallintField;
    CDSVendaVENDEDOR_ID: TIntegerField;
    CDSRestauranteComandaVENDA_ID: TIntegerField;
    CDSNegociacao: TClientDataSet;
    DSNegociacao: TDataSource;
    DSPNegociacao: TDataSetProvider;
    qryNegociacao: TSQLQuery;
    CDSNegociacaoNEGOCIACAO_ID: TIntegerField;
    CDSNegociacaoVENDA_ID: TIntegerField;
    CDSNegociacaoFORMA_PAGAMENTO_ID: TIntegerField;
    CDSNegociacaoVALOR: TFloatField;
    qryFormaPagamento: TSQLQuery;
    DSFormaPagamento: TDataSource;
    CDSFormaPagamento: TClientDataSet;
    DSPFormaPagamento: TDataSetProvider;
    CDSFormaPagamentoFORMA_PAGAMENTO_ID: TIntegerField;
    CDSFormaPagamentoATIVO: TSmallintField;
    CDSFormaPagamentoDATA_CADASTRO: TSQLTimeStampField;
    CDSFormaPagamentoDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSFormaPagamentoDESCRICAO: TStringField;
    CDSFormaPagamentoABREVIACAO: TStringField;
    CDSNegociacaol_forma_pagamento: TStringField;
    CDSNegociacaoDESCONTO: TFloatField;
    CDSNegociacaoTOTAL: TFloatField;
    CDSVendaItemcalc_descricao: TStringField;
    CDSVendedor: TClientDataSet;
    DSVendedor: TDataSource;
    DSPVendedor: TDataSetProvider;
    qryVendedor: TSQLQuery;
    CDSRestauranteComandal_vendedor_nome: TStringField;
    CDSRestauranteMesacalc_total_mesa: TCurrencyField;
    CDSRestauranteComandaItemUND: TStringField;
    CDSVendaItemUND: TStringField;
    CDSRestauranteComandaRESTAURANTE_MESA_ID: TIntegerField;
    CDSVendedorVENDEDOR_ID: TIntegerField;
    CDSVendedorATIVO: TSmallintField;
    CDSVendedorDATA_CADASTRO: TSQLTimeStampField;
    CDSVendedorDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSVendedorNOME: TStringField;
    CDSVendedorVENDEDOR_FUNCAO_ID: TIntegerField;
    CDSVendedorCOMISSAO: TFloatField;
    CDSVendedorLOGIN: TStringField;
    CDSVendedorSENHA: TStringField;
    CDSRestauranteComandaItemDESCRICAO: TStringField;
    CDSItens: TClientDataSet;
    DSCDSItens: TDataSource;
    DSPItens: TDataSetProvider;
    qryItens: TSQLQuery;
    CDSItensPRODUTO_ID: TIntegerField;
    CDSItensDESCRICAO: TStringField;
    CDSItensUND: TStringField;
    CDSItensPRECO: TFloatField;
    CDSItensQUANTIDADE: TFloatField;
    CDSItensTOTAL: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSRestauranteComandaAfterInsert(DataSet: TDataSet);
    procedure CDSRestauranteComandaItemAfterInsert(DataSet: TDataSet);
    procedure CDSRestauranteGarconAfterInsert(DataSet: TDataSet);
    procedure CDSProdutoAfterInsert(DataSet: TDataSet);
    procedure CDSRestauranteMesaAfterInsert(DataSet: TDataSet);
    procedure CDSRestauranteMesaGarconAfterInsert(DataSet: TDataSet);
    procedure CDSRestauranteMesaCalcFields(DataSet: TDataSet);
    procedure CDSRestauranteComandaBeforePost(DataSet: TDataSet);
    procedure CDSRestauranteComandaAfterPost(DataSet: TDataSet);
    procedure CDSRestauranteComandaItemAfterPost(DataSet: TDataSet);
    procedure CDSRestauranteGarconAfterPost(DataSet: TDataSet);
    procedure CDSProdutoAfterPost(DataSet: TDataSet);
    procedure CDSRestauranteMesaAfterPost(DataSet: TDataSet);
    procedure CDSRestauranteMesaGarconAfterPost(DataSet: TDataSet);
    procedure CDSUnidadeAfterPost(DataSet: TDataSet);
    procedure CDSUnidadeAfterInsert(DataSet: TDataSet);
    procedure CDSRestauranteComandaAfterCancel(DataSet: TDataSet);
    procedure CDSRestauranteComandaBeforeCancel(DataSet: TDataSet);
    procedure CDSVendaAfterDelete(DataSet: TDataSet);
    procedure CDSVendaAfterInsert(DataSet: TDataSet);
    procedure CDSVendaAfterPost(DataSet: TDataSet);
    procedure CDSVendaBeforeCancel(DataSet: TDataSet);
    procedure CDSVendaBeforeDelete(DataSet: TDataSet);
    procedure CDSVendaItemAfterPost(DataSet: TDataSet);
    procedure CDSVendaItemAfterInsert(DataSet: TDataSet);
    procedure CDSNegociacaoAfterInsert(DataSet: TDataSet);
    procedure CDSNegociacaoAfterDelete(DataSet: TDataSet);
    procedure CDSNegociacaoAfterPost(DataSet: TDataSet);
    procedure CDSFormaPagamentoAfterDelete(DataSet: TDataSet);
    procedure CDSFormaPagamentoAfterInsert(DataSet: TDataSet);
    procedure CDSVendaItemCalcFields(DataSet: TDataSet);
    procedure CDSRestauranteComandaBeforeDelete(DataSet: TDataSet);
    procedure CDSRestauranteComandaItemBeforeCancel(DataSet: TDataSet);
    procedure CDSRestauranteComandaItemBeforeDelete(DataSet: TDataSet);
    procedure CDSRestauranteComandaItemAfterCancel(DataSet: TDataSet);
    procedure CDSRestauranteGarconAfterCancel(DataSet: TDataSet);
    procedure CDSProdutoAfterCancel(DataSet: TDataSet);
    procedure CDSRestauranteMesaAfterCancel(DataSet: TDataSet);
    procedure CDSRestauranteMesaGarconAfterCancel(DataSet: TDataSet);
    procedure CDSUnidadeAfterCancel(DataSet: TDataSet);
    procedure CDSVendaAfterCancel(DataSet: TDataSet);
    procedure CDSVendaItemAfterCancel(DataSet: TDataSet);
    procedure CDSNegociacaoAfterCancel(DataSet: TDataSet);
    procedure CDSFormaPagamentoAfterCancel(DataSet: TDataSet);
    procedure CDSVendedorAfterCancel(DataSet: TDataSet);
    procedure CDSRestauranteMesaGarconAfterDelete(DataSet: TDataSet);
    procedure CDSVendaItemAfterDelete(DataSet: TDataSet);
    procedure CDSVendedorAfterDelete(DataSet: TDataSet);
    procedure CDSVendedorAfterInsert(DataSet: TDataSet);
    procedure CDSRestauranteGarconBeforeCancel(DataSet: TDataSet);
    procedure CDSProdutoBeforeCancel(DataSet: TDataSet);
    procedure CDSRestauranteMesaBeforeCancel(DataSet: TDataSet);
    procedure CDSRestauranteMesaGarconBeforeCancel(DataSet: TDataSet);
    procedure CDSUnidadeBeforeCancel(DataSet: TDataSet);
    procedure CDSVendaItemBeforeCancel(DataSet: TDataSet);
    procedure CDSNegociacaoBeforeCancel(DataSet: TDataSet);
    procedure CDSFormaPagamentoBeforeCancel(DataSet: TDataSet);
    procedure CDSVendedorBeforeCancel(DataSet: TDataSet);
    procedure CDSVendedorAfterPost(DataSet: TDataSet);
    procedure CDSRestauranteGarconBeforeDelete(DataSet: TDataSet);
    procedure CDSProdutoBeforeDelete(DataSet: TDataSet);
    procedure CDSRestauranteMesaBeforeDelete(DataSet: TDataSet);
    procedure CDSRestauranteMesaGarconBeforeDelete(DataSet: TDataSet);
    procedure CDSUnidadeBeforeDelete(DataSet: TDataSet);
    procedure CDSVendaItemBeforeDelete(DataSet: TDataSet);
    procedure CDSNegociacaoBeforeDelete(DataSet: TDataSet);
    procedure CDSFormaPagamentoBeforeDelete(DataSet: TDataSet);
    procedure CDSVendedorBeforeDelete(DataSet: TDataSet);
    procedure CDSRestauranteComandaItemBeforePost(DataSet: TDataSet);
    procedure CDSRestauranteGarconBeforePost(DataSet: TDataSet);
    procedure CDSProdutoBeforePost(DataSet: TDataSet);
    procedure CDSRestauranteMesaBeforePost(DataSet: TDataSet);
    procedure CDSRestauranteMesaGarconBeforePost(DataSet: TDataSet);
    procedure CDSUnidadeBeforePost(DataSet: TDataSet);
    procedure CDSVendaBeforePost(DataSet: TDataSet);
    procedure CDSVendaItemBeforePost(DataSet: TDataSet);
    procedure CDSNegociacaoBeforePost(DataSet: TDataSet);
    procedure CDSFormaPagamentoBeforePost(DataSet: TDataSet);
    procedure CDSVendedorBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    ArquivoIni: TIniFile;
    path : String;
  public
    { Public declarations }
    Transacao: TTransactionDesc;
    imgLogin, imgCancelarLogin, imgOkLogin, imgSair : ShortString;
    Tabela : ShortString;
    VendaID : Integer;
    VendaConcluida : Boolean;
  end;

var
  BancoDados: TBancoDados;

implementation
uses UPrincipal, UFuncoes;
{$R *.dfm}

procedure TBancoDados.CDSFormaPagamentoAfterCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.Rollback(BancoDados.Transacao);
end;

procedure TBancoDados.CDSFormaPagamentoAfterDelete(DataSet: TDataSet);
begin
  CDSFormaPagamento.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TBancoDados.CDSFormaPagamentoAfterInsert(DataSet: TDataSet);
begin
  try
    with BancoDados.qryGeraID do
      begin
        GeraTrace(BancoDados.Tabela,'Inicia Geração de ID');
        Close;
        SQL.Clear;
        SQL.Add('select gen_id( GEN_FORMA_PAGAMENTO_ID, 1 ) from RDB$DATABASE');
        Open;
        CDSVendaVENDA_ID.Value := BancoDados.qryGeraID.Fields[0].Value;
        CDSFormaPagamento.FieldByName('DATA_CADASTRO').Value := Now;
        CDSFormaPagamento.FieldByName('DATA_ULTIMA_ALTERACAO').Value := Now;
        CDSFormaPagamentoATIVO.Value := 1;
        GeraTrace(BancoDados.Tabela,'ID Gerado');
      end;
  except
    Mensagem('Falha ao Tentar Gerar o I.D!', mtWarning,[mbOk],mrOK,0);
  end;
end;

procedure TBancoDados.CDSFormaPagamentoBeforeCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSFormaPagamentoBeforeDelete(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSFormaPagamentoBeforePost(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSNegociacaoAfterCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.Rollback(BancoDados.Transacao);
end;

procedure TBancoDados.CDSNegociacaoAfterDelete(DataSet: TDataSet);
begin
  CDSNegociacao.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TBancoDados.CDSNegociacaoAfterInsert(DataSet: TDataSet);
begin
  try
    with BancoDados.qryGeraID do
      begin
        GeraTrace(BancoDados.Tabela,'Inicia Geração de ID');
        Close;
        SQL.Clear;
        SQL.Add('select gen_id( GEN_NEGOCIACAO_ID, 1 ) from RDB$DATABASE');
        Open;
        CDSNegociacaoNEGOCIACAO_ID.Value := BancoDados.qryGeraID.Fields[0].Value;
        GeraTrace(BancoDados.Tabela,'ID Gerado');
      end;
  except
    Mensagem('Falha ao Tentar Gerar o I.D!', mtWarning,[mbOk],mrOK,0);
  end;
end;

procedure TBancoDados.CDSNegociacaoAfterPost(DataSet: TDataSet);
begin
  CDSNegociacao.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TBancoDados.CDSNegociacaoBeforeCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSNegociacaoBeforeDelete(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSNegociacaoBeforePost(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSProdutoAfterCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.Rollback(BancoDados.Transacao);
end;

procedure TBancoDados.CDSProdutoAfterInsert(DataSet: TDataSet);
begin
  try
    with BancoDados.qryGeraID do
      begin
        GeraTrace(BancoDados.Tabela,'Inicia Geração de ID');
        Close;
        SQL.Clear;
        SQL.Add('select gen_id( GEN_PRODUTO_ID, 1 ) from RDB$DATABASE');
        Open;
        CDSProdutoPRODUTO_ID.Value := BancoDados.qryGeraID.Fields[0].Value;
        CDSProdutoATIVO.Value := 1;
        CDSProduto.FieldByName('DATA_CADASTRO').Value := Now;
        GeraTrace(BancoDados.Tabela,'ID Gerado');
      end;
  except
    Mensagem('Falha ao Tentar Gerar o I.D!', mtWarning,[mbOk],mrOK,0);
  end;
end;

procedure TBancoDados.CDSProdutoAfterPost(DataSet: TDataSet);
begin
  CDSProduto.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TBancoDados.CDSProdutoBeforeCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSProdutoBeforeDelete(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSProdutoBeforePost(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteComandaAfterCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.Rollback(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteComandaAfterInsert(DataSet: TDataSet);
begin
  try
    with BancoDados.qryGeraID do
      begin
        GeraTrace(BancoDados.Tabela,'Inicia Geração de ID');
        Close;
        SQL.Clear;
        SQL.Add('select gen_id( GEN_RESTAURANTE_COMANDA_ID, 1 ) from RDB$DATABASE');
        Open;
        CDSRestauranteComandaRESTAURANTE_COMANDA_ID.Value := BancoDados.qryGeraID.Fields[0].Value;
        CDSRestauranteComandaVENDEDOR_ID.Value := VendedorID;
        CDSRestauranteComanda.FieldByName('DATA_LANCAMENTO').Value := Now;
        CDSRestauranteComandaFECHADO.Value := 0;
        CDSRestauranteComandaCANCELADO.Value := 0;
        CDSRestauranteComandaVENDA_ID.Value := 0;
        GeraTrace(BancoDados.Tabela,'ID Gerado');
      end;
  except
    Mensagem('Falha ao Tentar Gerar o I.D!', mtWarning,[mbOk],mrOK,0);
  end;
end;

procedure TBancoDados.CDSRestauranteComandaAfterPost(DataSet: TDataSet);
begin
  CDSRestauranteComanda.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteComandaBeforeCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteComandaBeforeDelete(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteComandaBeforePost(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteComandaItemAfterCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.Rollback(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteComandaItemAfterInsert(DataSet: TDataSet);
begin
  try
    with BancoDados.qryGeraID do
      begin
        GeraTrace(BancoDados.Tabela,'Inicia Geração de ID');
        Close;
        SQL.Clear;
        SQL.Add('select gen_id( GEN_RESTAURANTE_COMANDA_ITEM_ID, 1 ) from RDB$DATABASE');
        Open;
        CDSRestauranteComandaItemRESTAURANTE_COMANDA_ITEM_ID.Value := BancoDados.qryGeraID.Fields[0].Value;
        CDSRestauranteComandaItemRESTAURANTE_COMANDA_ID.Value := CDSRestauranteComandaRESTAURANTE_COMANDA_ID.Value;
        CDSRestauranteComandaItemCANCELADO.Value := 0;
        CDSRestauranteComandaItemPRECO.Value := 0;
        CDSRestauranteComandaItemQUANTIDADE.Value := 1;
        CDSRestauranteComandaItemTOTAL.Value := 0;
        GeraTrace(BancoDados.Tabela,'ID Gerado');
      end;
  except
    Mensagem('Falha ao Tentar Gerar o I.D!', mtWarning,[mbOk],mrOK,0);
  end;
end;

procedure TBancoDados.CDSRestauranteComandaItemAfterPost(DataSet: TDataSet);
begin
  CDSRestauranteComandaItem.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteComandaItemBeforeCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteComandaItemBeforeDelete(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteComandaItemBeforePost(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteGarconAfterCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.Rollback(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteGarconAfterInsert(DataSet: TDataSet);
begin
  try
    with BancoDados.qryGeraID do
      begin
        GeraTrace(BancoDados.Tabela,'Inicia Geração de ID');
        Close;
        SQL.Clear;
        SQL.Add('select gen_id( GEN_RESTAURANTE_GARCON_ID, 1 ) from RDB$DATABASE');
        Open;
        CDSRestauranteGarconRESTAURANTE_GARCON_ID.Value := BancoDados.qryGeraID.Fields[0].Value;
        CDSRestauranteGarconATIVO.Value := 1;
        CDSRestauranteGarcon.FieldByName('DATA_CADASTRO').Value := Now;
        CDSRestauranteGarconCOMISSAO.Value := 0;
        GeraTrace(BancoDados.Tabela,'ID Gerado');
      end;
  except
    Mensagem('Falha ao Tentar Gerar o I.D!', mtWarning,[mbOk],mrOK,0);
  end;
end;

procedure TBancoDados.CDSRestauranteGarconAfterPost(DataSet: TDataSet);
begin
  CDSRestauranteGarcon.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteGarconBeforeCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteGarconBeforeDelete(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteGarconBeforePost(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteMesaAfterCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.Rollback(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteMesaAfterInsert(DataSet: TDataSet);
begin
  try
    with BancoDados.qryGeraID do
      begin
        GeraTrace(BancoDados.Tabela,'Inicia Geração de ID');
        Close;
        SQL.Clear;
        SQL.Add('select gen_id( GEN_RESTAURANTE_MESA_ID, 1 ) from RDB$DATABASE');
        Open;
        CDSRestauranteMesaRESTAURANTE_MESA_ID.Value := BancoDados.qryGeraID.Fields[0].Value;
        CDSRestauranteMesaATIVO.Value := 1;
        CDSRestauranteMesa.FieldByName('DATA_CADASTRO').Value := Now;
        CDSRestauranteMesaSTATUS.Value := 'LIVRE';
        CDSRestauranteMesaNUMERO.Value := 0;
        GeraTrace(BancoDados.Tabela,'ID Gerado');
      end;
  except
    Mensagem('Falha ao Tentar Gerar o I.D!', mtWarning,[mbOk],mrOK,0);
  end;
end;

procedure TBancoDados.CDSRestauranteMesaAfterPost(DataSet: TDataSet);
begin
  CDSRestauranteMesa.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteMesaBeforeCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteMesaBeforeDelete(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteMesaBeforePost(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteMesaCalcFields(DataSet: TDataSet);
begin
  with qryAuxiliar do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select nome from restaurante_garcon where restaurante_garcon_id in(' +
        'select restaurante_garcon_id from restaurante_mesa_garcon where restaurante_mesa_id = ' +
        IntToStr(CDSRestauranteMesaRESTAURANTE_MESA_ID.Value) + ')');
      Open;
    end;
  if not (qryAuxiliar.IsEmpty) then
    CDSRestauranteMesac_mesa_garcon_nome.Value := qryAuxiliar.Fields[0].Value
  else
    CDSRestauranteMesac_mesa_garcon_nome.Value := 'Desconhecido';

  try
    with qryAuxiliar do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select COALESCE(sum(total), 0.0) as total from restaurante_comanda_item' +
          ' where restaurante_comanda_id = (select max(restaurante_comanda_id)' +
          ' from restaurante_comanda where venda_id = 0 and cancelado = 0 and' +
          ' restaurante_mesa_id = (select restaurante_mesa_id from restaurante_mesa' +
          ' where status <> ' + QuotedStr('LIVRE') + ' and numero = ' +
          IntToStr(CDSRestauranteMesaNUMERO.Value) + '))');
        Open;
      end;
  CDSRestauranteMesacalc_total_mesa.Value := qryAuxiliar.Fields[0].Value;
  except
    CDSRestauranteMesacalc_total_mesa.Value := 0;
  end;
end;

procedure TBancoDados.CDSRestauranteMesaGarconAfterCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.Rollback(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteMesaGarconAfterDelete(DataSet: TDataSet);
begin
  CDSRestauranteMesaGarcon.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteMesaGarconAfterInsert(DataSet: TDataSet);
begin
  try
    with BancoDados.qryGeraID do
      begin
        GeraTrace(BancoDados.Tabela,'Inicia Geração de ID');
        Close;
        SQL.Clear;
        SQL.Add('select gen_id( GEN_RESTAURANTE_MESA_GARCON_ID, 1 ) from RDB$DATABASE');
        Open;
        CDSRestauranteMesaGarconRESTAURANTE_MESA_GARCON_ID.Value := BancoDados.qryGeraID.Fields[0].Value;
        CDSRestauranteMesaGarcon.FieldByName('DATA_CADASTRO').Value := Now;
        GeraTrace(BancoDados.Tabela,'ID Gerado');
      end;
  except
    Mensagem('Falha ao Tentar Gerar o I.D!', mtWarning,[mbOk],mrOK,0);
  end;
end;

procedure TBancoDados.CDSRestauranteMesaGarconAfterPost(DataSet: TDataSet);
begin
  CDSRestauranteMesaGarcon.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteMesaGarconBeforeCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteMesaGarconBeforeDelete(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSRestauranteMesaGarconBeforePost(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSUnidadeAfterCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.Rollback(BancoDados.Transacao);
end;

procedure TBancoDados.CDSUnidadeAfterInsert(DataSet: TDataSet);
begin
  try
    with BancoDados.qryGeraID do
      begin
        GeraTrace(BancoDados.Tabela,'Inicia Geração de ID');
        Close;
        SQL.Clear;
        SQL.Add('select gen_id( GEN_UNIDADE_ID, 1 ) from RDB$DATABASE');
        Open;
        CDSUnidadeUNIDADE_ID.Value := BancoDados.qryGeraID.Fields[0].Value;
        CDSRestauranteMesaGarcon.FieldByName('DATA_CADASTRO').Value := Now;
        CDSUnidadeATIVO.Value := 0;
        GeraTrace(BancoDados.Tabela,'ID Gerado');
      end;
  except
    Mensagem('Falha ao Tentar Gerar o I.D!', mtWarning,[mbOk],mrOK,0);
  end;
end;

procedure TBancoDados.CDSUnidadeAfterPost(DataSet: TDataSet);
begin
  CDSUnidade.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TBancoDados.CDSUnidadeBeforeCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSUnidadeBeforeDelete(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSUnidadeBeforePost(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSVendaAfterCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.Rollback(BancoDados.Transacao);
end;

procedure TBancoDados.CDSVendaAfterDelete(DataSet: TDataSet);
begin
  CDSVenda.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TBancoDados.CDSVendaAfterInsert(DataSet: TDataSet);
begin
  try
    with BancoDados.qryGeraID do
      begin
        GeraTrace(BancoDados.Tabela,'Inicia Geração de ID');
        Close;
        SQL.Clear;
        SQL.Add('select gen_id( GEN_VENDA_ID, 1 ) from RDB$DATABASE');
        Open;
        CDSVendaVENDA_ID.Value := BancoDados.qryGeraID.Fields[0].Value;
        CDSVenda.FieldByName('DATA_LANCAMENTO').Value := Now;
        CDSVendaFECHADO.Value := 0;
        CDSVendaCANCELADO.Value := 0;
        CDSVendaACRESCIMO.Value := 0;
        CDSVendaDESCONTO.Value := 0;
        CDSVendaSUBTOTAL.Value := 0;
        GeraTrace(BancoDados.Tabela,'ID Gerado');
      end;
  except
    Mensagem('Falha ao Tentar Gerar o I.D!', mtWarning,[mbOk],mrOK,0);
  end;
end;

procedure TBancoDados.CDSVendaAfterPost(DataSet: TDataSet);
begin
  CDSVenda.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TBancoDados.CDSVendaBeforeCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSVendaBeforeDelete(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSVendaBeforePost(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSVendaItemAfterCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.Rollback(BancoDados.Transacao);
end;

procedure TBancoDados.CDSVendaItemAfterDelete(DataSet: TDataSet);
begin
  CDSVendaItem.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TBancoDados.CDSVendaItemAfterInsert(DataSet: TDataSet);
begin
  try
    with BancoDados.qryGeraID do
      begin
        GeraTrace(BancoDados.Tabela,'Inicia Geração de ID');
        Close;
        SQL.Clear;
        SQL.Add('select gen_id( GEN_VENDA_ITEM_ID, 1 ) from RDB$DATABASE');
        Open;
        CDSVendaItemVENDA_ITEM_ID.Value := BancoDados.qryGeraID.Fields[0].Value;
        CDSVendaItemVENDA_ID.Value := CDSVendaVENDA_ID.Value;
        CDSVendaItemCANCELADO.Value := 0;
        CDSVendaItemQUANTIDADE.Value := 1;
        CDSVendaItemTOTAL.Value := 0;
        GeraTrace(BancoDados.Tabela,'ID Gerado');
      end;
  except
    Mensagem('Falha ao Tentar Gerar o I.D!', mtWarning,[mbOk],mrOK,0);
  end;
end;

procedure TBancoDados.CDSVendaItemAfterPost(DataSet: TDataSet);
begin
  CDSVendaItem.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TBancoDados.CDSVendaItemBeforeCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSVendaItemBeforeDelete(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSVendaItemBeforePost(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSVendaItemCalcFields(DataSet: TDataSet);
begin
  if (CDSVendaItemPRODUTO_ID.Value > 0) then
    begin
      with qryAuxiliar do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select descricao from produto where produto_id = ' +
            IntToStr(CDSVendaItemPRODUTO_ID.Value));
          Open;
        end;
      CDSVendaItemcalc_descricao.Value := qryAuxiliar.Fields[0].Value;
    end;
end;

procedure TBancoDados.CDSVendedorAfterCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.Rollback(BancoDados.Transacao);
end;

procedure TBancoDados.CDSVendedorAfterDelete(DataSet: TDataSet);
begin
  CDSVendedor.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TBancoDados.CDSVendedorAfterInsert(DataSet: TDataSet);
begin
  try
    with BancoDados.qryGeraID do
      begin
        GeraTrace(BancoDados.Tabela,'Inicia Geração de ID');
        Close;
        SQL.Clear;
        SQL.Add('select gen_id( GEN_VENDEDOR_ID, 1 ) from RDB$DATABASE');
        Open;
        CDSVendaVENDA_ID.Value := BancoDados.qryGeraID.Fields[0].Value;
        CDSFormaPagamento.FieldByName('DATA_CADASTRO').Value := Now;
        CDSFormaPagamento.FieldByName('DATA_ULTIMA_ALTERACAO').Value := Now;
        CDSFormaPagamentoATIVO.Value := 1;
        GeraTrace(BancoDados.Tabela,'ID Gerado');
      end;
  except
    Mensagem('Falha ao Tentar Gerar o I.D!', mtWarning,[mbOk],mrOK,0);
  end;
end;

procedure TBancoDados.CDSVendedorAfterPost(DataSet: TDataSet);
begin
  CDSVendedor.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TBancoDados.CDSVendedorBeforeCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSVendedorBeforeDelete(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.CDSVendedorBeforePost(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TBancoDados.DataModuleCreate(Sender: TObject);
begin
  Transacao.TransactionID := 1;
  Transacao.IsolationLevel := xilReadCommitted;

  Path := RCopy(Application.ExeName, '\');
  if FileExists(Path + 'MasterERP.ini') then
    begin
      ArquivoIni        := TIniFile.Create(Path + 'MasterERP.ini');
      AtivaTrace        := (ArquivoIni.ReadString( 'GERAL', 'TRACE','') = '1');
      imgLogin          := ArquivoIni.ReadString( 'IMAGENS', 'IMGLOGIN','');
      imgOkLogin        := ArquivoIni.ReadString( 'IMAGENS', 'IMGOKLOGIN','');
      imgCancelarLogin  := ArquivoIni.ReadString( 'IMAGENS', 'IMGCANCELARLOGIN','');
      imgSair           := ArquivoIni.ReadString( 'IMAGENS', 'IMGSAIR','');
    end;
end;

end.
