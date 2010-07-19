object BancoDados: TBancoDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 507
  Width = 754
  object Conexao: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxfb.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      
        'Database=localhost:D:\Automa'#231#227'o Comercial\MasterERP\db\MASTERERP' +
        '.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=True'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    VendorLib = 'fbclient.dll'
    Left = 32
    Top = 16
  end
  object qryLog: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      '')
    SQLConnection = Conexao
    Left = 81
    Top = 15
  end
  object qryExecute: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 123
    Top = 15
  end
  object qryLogin: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from vendedor where vendedor_id = 0')
    SQLConnection = Conexao
    Left = 164
    Top = 15
    object qryLoginLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 25
    end
    object qryLoginSENHA: TStringField
      FieldName = 'SENHA'
      Size = 8
    end
    object qryLoginVENDEDOR_FUNCAO_ID: TIntegerField
      FieldName = 'VENDEDOR_FUNCAO_ID'
    end
    object qryLoginVENDEDOR_ID: TIntegerField
      FieldName = 'VENDEDOR_ID'
      Required = True
    end
  end
  object qryAuxiliar: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 200
    Top = 15
  end
  object qryGeraID: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 238
    Top = 15
  end
  object qryVendedorFuncao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from vendedor_funcao where vendedor_funcao_id = 0')
    SQLConnection = Conexao
    Left = 272
    Top = 15
    object qryVendedorFuncaoABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      Size = 5
    end
  end
  object CDSRestauranteGarcon: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPRestauranteGarcon'
    AfterInsert = CDSRestauranteGarconAfterInsert
    BeforePost = CDSRestauranteGarconBeforePost
    AfterPost = CDSRestauranteGarconAfterPost
    BeforeCancel = CDSRestauranteGarconBeforeCancel
    AfterCancel = CDSRestauranteGarconAfterCancel
    BeforeDelete = CDSRestauranteGarconBeforeDelete
    AfterDelete = CDSRestauranteGarconAfterPost
    Left = 112
    Top = 201
    object CDSRestauranteGarconRESTAURANTE_GARCON_ID: TIntegerField
      FieldName = 'RESTAURANTE_GARCON_ID'
    end
    object CDSRestauranteGarconATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object CDSRestauranteGarconDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object CDSRestauranteGarconDATA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
    end
    object CDSRestauranteGarconNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object CDSRestauranteGarconCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
    end
  end
  object DSRestauranteComanda: TDataSource
    DataSet = CDSRestauranteComanda
    Left = 31
    Top = 247
  end
  object DSPRestauranteGarcon: TDataSetProvider
    DataSet = qryRestauranteGarcon
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 112
    Top = 156
  end
  object qryRestauranteComanda: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'select * from restaurante_comanda where restaurante_comanda_id =' +
        ' 0')
    SQLConnection = Conexao
    Left = 32
    Top = 112
  end
  object qryRestauranteGarcon: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from restaurante_garcon where restaurante_garcon_id = 0')
    SQLConnection = Conexao
    Left = 112
    Top = 112
  end
  object DSRestauranteComandaItem: TDataSource
    DataSet = CDSRestauranteComandaItem
    Left = 74
    Top = 247
  end
  object CDSRestauranteComanda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPRestauranteComanda'
    AfterInsert = CDSRestauranteComandaAfterInsert
    BeforePost = CDSRestauranteComandaBeforePost
    AfterPost = CDSRestauranteComandaAfterPost
    BeforeCancel = CDSRestauranteComandaBeforeCancel
    AfterCancel = CDSRestauranteComandaAfterCancel
    BeforeDelete = CDSRestauranteComandaBeforeDelete
    AfterDelete = CDSRestauranteComandaAfterPost
    Left = 31
    Top = 201
    object CDSRestauranteComandaRESTAURANTE_COMANDA_ID: TIntegerField
      FieldName = 'RESTAURANTE_COMANDA_ID'
      DisplayFormat = '0000000000'
    end
    object CDSRestauranteComandaVENDEDOR_ID: TIntegerField
      FieldName = 'VENDEDOR_ID'
    end
    object CDSRestauranteComandaRESTAURANTE_GARCON_ID: TIntegerField
      FieldName = 'RESTAURANTE_GARCON_ID'
    end
    object CDSRestauranteComandaDATA_LANCAMENTO: TSQLTimeStampField
      FieldName = 'DATA_LANCAMENTO'
    end
    object CDSRestauranteComandal_gargon_nome: TStringField
      FieldKind = fkLookup
      FieldName = 'l_gargon_nome'
      LookupDataSet = CDSRestauranteGarcon
      LookupKeyFields = 'RESTAURANTE_GARCON_ID'
      LookupResultField = 'NOME'
      KeyFields = 'RESTAURANTE_GARCON_ID'
      Lookup = True
    end
    object CDSRestauranteComandaFECHADO: TSmallintField
      FieldName = 'FECHADO'
    end
    object CDSRestauranteComandaCANCELADO: TSmallintField
      FieldName = 'CANCELADO'
    end
    object CDSRestauranteComandaVENDA_ID: TIntegerField
      FieldName = 'VENDA_ID'
    end
    object CDSRestauranteComandal_vendedor_nome: TStringField
      FieldKind = fkLookup
      FieldName = 'l_vendedor_nome'
      LookupDataSet = CDSVendedor
      LookupKeyFields = 'VENDEDOR_ID'
      LookupResultField = 'NOME'
      KeyFields = 'VENDEDOR_ID'
      Lookup = True
    end
    object CDSRestauranteComandaRESTAURANTE_MESA_ID: TIntegerField
      FieldName = 'RESTAURANTE_MESA_ID'
    end
  end
  object DSRestauranteGarcon: TDataSource
    DataSet = CDSRestauranteGarcon
    Left = 113
    Top = 247
  end
  object CDSRestauranteComandaItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPRestauranteComandaItem'
    AfterInsert = CDSRestauranteComandaItemAfterInsert
    BeforePost = CDSRestauranteComandaItemBeforePost
    AfterPost = CDSRestauranteComandaItemAfterPost
    BeforeCancel = CDSRestauranteComandaItemBeforeCancel
    AfterCancel = CDSRestauranteComandaItemAfterCancel
    BeforeDelete = CDSRestauranteComandaItemBeforeDelete
    AfterDelete = CDSRestauranteComandaItemAfterPost
    Left = 72
    Top = 201
    object CDSRestauranteComandaItemRESTAURANTE_COMANDA_ITEM_ID: TIntegerField
      FieldName = 'RESTAURANTE_COMANDA_ITEM_ID'
    end
    object CDSRestauranteComandaItemRESTAURANTE_COMANDA_ID: TIntegerField
      FieldName = 'RESTAURANTE_COMANDA_ID'
    end
    object CDSRestauranteComandaItemCANCELADO: TSmallintField
      FieldName = 'CANCELADO'
    end
    object CDSRestauranteComandaItemPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
      DisplayFormat = '0000000000'
    end
    object CDSRestauranteComandaItemQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      DisplayFormat = ',0.0000'
    end
    object CDSRestauranteComandaItemPRECO: TFloatField
      FieldName = 'PRECO'
      DisplayFormat = ',0.00'
    end
    object CDSRestauranteComandaItemTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = ',0.00'
    end
    object CDSRestauranteComandaItemUND: TStringField
      FieldName = 'UND'
      Size = 5
    end
    object CDSRestauranteComandaItemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object DSPRestauranteComandaItem: TDataSetProvider
    DataSet = qryRestauranteComandaItem
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 72
    Top = 156
  end
  object qryRestauranteComandaItem: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'select * from restaurante_comanda_item where restaurante_comanda' +
        '_item_id = 0')
    SQLConnection = Conexao
    Left = 72
    Top = 112
  end
  object qryProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from produto')
    SQLConnection = Conexao
    Left = 152
    Top = 112
  end
  object DSProduto: TDataSource
    DataSet = CDSProduto
    Left = 153
    Top = 247
  end
  object CDSProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPProduto'
    AfterInsert = CDSProdutoAfterInsert
    BeforePost = CDSProdutoBeforePost
    AfterPost = CDSProdutoAfterPost
    BeforeCancel = CDSProdutoBeforeCancel
    AfterCancel = CDSProdutoAfterCancel
    BeforeDelete = CDSProdutoBeforeDelete
    AfterDelete = CDSProdutoAfterPost
    Left = 152
    Top = 201
    object CDSProdutoPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
      DisplayFormat = '0000000000'
    end
    object CDSProdutoATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object CDSProdutoDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object CDSProdutoDATA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
    end
    object CDSProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CDSProdutoDESCRICAO_REDUZIDA: TStringField
      FieldName = 'DESCRICAO_REDUZIDA'
      Size = 60
    end
    object CDSProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 60
    end
    object CDSProdutoUNIDADE_ID: TIntegerField
      FieldName = 'UNIDADE_ID'
    end
    object CDSProdutoPRECO: TFloatField
      FieldName = 'PRECO'
      DisplayFormat = ',0.00'
    end
    object CDSProdutol_unidade: TStringField
      FieldKind = fkLookup
      FieldName = 'l_unidade'
      LookupDataSet = CDSUnidade
      LookupKeyFields = 'UNIDADE_ID'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'UNIDADE_ID'
      Lookup = True
    end
  end
  object DSPProduto: TDataSetProvider
    DataSet = qryProduto
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 152
    Top = 156
  end
  object DSRestauranteMesa: TDataSource
    DataSet = CDSRestauranteMesa
    Left = 191
    Top = 247
  end
  object CDSRestauranteMesa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPRestauranteMesa'
    AfterInsert = CDSRestauranteMesaAfterInsert
    BeforePost = CDSRestauranteMesaBeforePost
    AfterPost = CDSRestauranteMesaAfterPost
    BeforeCancel = CDSRestauranteMesaBeforeCancel
    AfterCancel = CDSRestauranteMesaAfterCancel
    BeforeDelete = CDSRestauranteMesaBeforeDelete
    AfterDelete = CDSRestauranteMesaAfterPost
    OnCalcFields = CDSRestauranteMesaCalcFields
    Left = 190
    Top = 201
    object CDSRestauranteMesaRESTAURANTE_MESA_ID: TIntegerField
      FieldName = 'RESTAURANTE_MESA_ID'
    end
    object CDSRestauranteMesaSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 15
    end
    object CDSRestauranteMesaATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object CDSRestauranteMesaDATA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
    end
    object CDSRestauranteMesaDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object CDSRestauranteMesaNUMERO: TSmallintField
      FieldName = 'NUMERO'
      DisplayFormat = '000'
    end
    object CDSRestauranteMesac_mesa_garcon_nome: TStringField
      FieldKind = fkCalculated
      FieldName = 'c_mesa_garcon_nome'
      Calculated = True
    end
    object CDSRestauranteMesaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CDSRestauranteMesacalc_total_mesa: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'calc_total_mesa'
      DisplayFormat = ',0.00'
      Calculated = True
    end
  end
  object qryRestauranteMesa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from restaurante_mesa where restaurante_mesa_id = 0')
    SQLConnection = Conexao
    Left = 186
    Top = 112
  end
  object qryRestauranteMesaGarcon: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'select * from restaurante_mesa_garcon where  restaurante_mesa_ga' +
        'rcon_id = 0 ')
    SQLConnection = Conexao
    Left = 224
    Top = 112
  end
  object DSRestauranteMesaGarcon: TDataSource
    DataSet = CDSRestauranteMesaGarcon
    Left = 225
    Top = 247
  end
  object CDSRestauranteMesaGarcon: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPRestauranteMesaGarcon'
    AfterInsert = CDSRestauranteMesaGarconAfterInsert
    BeforePost = CDSRestauranteMesaGarconBeforePost
    AfterPost = CDSRestauranteMesaGarconAfterPost
    BeforeCancel = CDSRestauranteMesaGarconBeforeCancel
    AfterCancel = CDSRestauranteMesaGarconAfterCancel
    BeforeDelete = CDSRestauranteMesaGarconBeforeDelete
    AfterDelete = CDSRestauranteMesaGarconAfterDelete
    Left = 224
    Top = 201
    object CDSRestauranteMesaGarconRESTAURANTE_MESA_GARCON_ID: TIntegerField
      FieldName = 'RESTAURANTE_MESA_GARCON_ID'
    end
    object CDSRestauranteMesaGarconRESTAURANTE_MESA_ID: TIntegerField
      FieldName = 'RESTAURANTE_MESA_ID'
    end
    object CDSRestauranteMesaGarconRESTAURANTE_GARCON_ID: TIntegerField
      FieldName = 'RESTAURANTE_GARCON_ID'
    end
    object CDSRestauranteMesaGarconDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
  end
  object DSPRestauranteMesaGarcon: TDataSetProvider
    DataSet = qryRestauranteMesaGarcon
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 224
    Top = 156
  end
  object DSPRestauranteComanda: TDataSetProvider
    DataSet = qryRestauranteComanda
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 32
    Top = 156
  end
  object CDSUnidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPUnidade'
    AfterInsert = CDSUnidadeAfterInsert
    BeforePost = CDSUnidadeBeforePost
    AfterPost = CDSUnidadeAfterPost
    BeforeCancel = CDSUnidadeBeforeCancel
    AfterCancel = CDSUnidadeAfterCancel
    BeforeDelete = CDSUnidadeBeforeDelete
    AfterDelete = CDSUnidadeAfterPost
    Left = 263
    Top = 201
    object CDSUnidadeUNIDADE_ID: TIntegerField
      FieldName = 'UNIDADE_ID'
    end
    object CDSUnidadeATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object CDSUnidadeDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object CDSUnidadeDATA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
    end
    object CDSUnidadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 10
    end
  end
  object DSPUnidade: TDataSetProvider
    DataSet = qryUnidade
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 263
    Top = 156
  end
  object DSUnidade: TDataSource
    DataSet = CDSUnidade
    Left = 264
    Top = 247
  end
  object qryUnidade: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from unidade where unidade_id = 0')
    SQLConnection = Conexao
    Left = 261
    Top = 112
  end
  object DSPRestauranteMesa: TDataSetProvider
    DataSet = qryRestauranteMesa
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 190
    Top = 156
  end
  object DSVenda: TDataSource
    DataSet = CDSVenda
    Left = 298
    Top = 247
  end
  object CDSVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPVenda'
    AfterInsert = CDSVendaAfterInsert
    BeforePost = CDSVendaBeforePost
    AfterPost = CDSVendaAfterPost
    BeforeCancel = CDSVendaBeforeCancel
    AfterCancel = CDSVendaAfterCancel
    BeforeDelete = CDSVendaBeforeDelete
    AfterDelete = CDSVendaAfterDelete
    Left = 298
    Top = 201
    object CDSVendaVENDA_ID: TIntegerField
      FieldName = 'VENDA_ID'
      Required = True
      DisplayFormat = '0000000000'
    end
    object CDSVendaDATA_LANCAMENTO: TSQLTimeStampField
      FieldName = 'DATA_LANCAMENTO'
    end
    object CDSVendaFECHADO: TSmallintField
      FieldName = 'FECHADO'
    end
    object CDSVendaCANCELADO: TSmallintField
      FieldName = 'CANCELADO'
    end
    object CDSVendaCLIENTE_ID: TIntegerField
      FieldName = 'CLIENTE_ID'
    end
    object CDSVendaACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
    end
    object CDSVendaDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object CDSVendaSUBTOTAL: TFloatField
      FieldName = 'SUBTOTAL'
    end
    object CDSVendaVENDEDOR_ID: TIntegerField
      FieldName = 'VENDEDOR_ID'
    end
  end
  object DSPVenda: TDataSetProvider
    DataSet = qryVenda
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 297
    Top = 156
  end
  object qryVenda: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from venda where venda_id = 0')
    SQLConnection = Conexao
    Left = 296
    Top = 112
  end
  object CDSVendaItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPVendaItem'
    AfterInsert = CDSVendaItemAfterInsert
    BeforePost = CDSVendaItemBeforePost
    AfterPost = CDSVendaItemAfterPost
    BeforeCancel = CDSVendaItemBeforeCancel
    AfterCancel = CDSVendaItemAfterCancel
    BeforeDelete = CDSVendaItemBeforeDelete
    AfterDelete = CDSVendaItemAfterDelete
    OnCalcFields = CDSVendaItemCalcFields
    Left = 330
    Top = 201
    object CDSVendaItemVENDA_ITEM_ID: TIntegerField
      FieldName = 'VENDA_ITEM_ID'
    end
    object CDSVendaItemVENDA_ID: TIntegerField
      FieldName = 'VENDA_ID'
    end
    object CDSVendaItemCANCELADO: TSmallintField
      FieldName = 'CANCELADO'
    end
    object CDSVendaItemPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
      DisplayFormat = '0000000000'
    end
    object CDSVendaItemQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      DisplayFormat = ',0.0000'
    end
    object CDSVendaItemPRECO: TFloatField
      FieldName = 'PRECO'
      DisplayFormat = ',0.00'
    end
    object CDSVendaItemTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = ',0.00'
    end
    object CDSVendaItemITEM: TSmallintField
      FieldName = 'ITEM'
    end
    object CDSVendaItemcalc_descricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_descricao'
      Calculated = True
    end
    object CDSVendaItemUND: TStringField
      FieldName = 'UND'
      Size = 5
    end
  end
  object DSVendaItem: TDataSource
    DataSet = CDSVendaItem
    Left = 330
    Top = 247
  end
  object DSPVendaItem: TDataSetProvider
    DataSet = qryVendaItem
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 329
    Top = 156
  end
  object qryVendaItem: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from venda_item where venda_item_id = 0')
    SQLConnection = Conexao
    Left = 329
    Top = 112
  end
  object CDSNegociacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPNegociacao'
    AfterInsert = CDSNegociacaoAfterInsert
    BeforePost = CDSNegociacaoBeforePost
    AfterPost = CDSNegociacaoAfterPost
    BeforeCancel = CDSNegociacaoBeforeCancel
    AfterCancel = CDSNegociacaoAfterCancel
    BeforeDelete = CDSNegociacaoBeforeDelete
    AfterDelete = CDSNegociacaoAfterDelete
    Left = 364
    Top = 201
    object CDSNegociacaoNEGOCIACAO_ID: TIntegerField
      FieldName = 'NEGOCIACAO_ID'
    end
    object CDSNegociacaoVENDA_ID: TIntegerField
      FieldName = 'VENDA_ID'
    end
    object CDSNegociacaoFORMA_PAGAMENTO_ID: TIntegerField
      FieldName = 'FORMA_PAGAMENTO_ID'
    end
    object CDSNegociacaoVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = ',0.00'
    end
    object CDSNegociacaol_forma_pagamento: TStringField
      FieldKind = fkLookup
      FieldName = 'l_forma_pagamento'
      LookupDataSet = CDSFormaPagamento
      LookupKeyFields = 'FORMA_PAGAMENTO_ID'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'FORMA_PAGAMENTO_ID'
      Lookup = True
    end
    object CDSNegociacaoDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      DisplayFormat = ',0.00'
    end
    object CDSNegociacaoTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = ',0.00'
    end
  end
  object DSNegociacao: TDataSource
    DataSet = CDSNegociacao
    Left = 364
    Top = 247
  end
  object DSPNegociacao: TDataSetProvider
    DataSet = qryNegociacao
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 364
    Top = 156
  end
  object qryNegociacao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from negociacao where negociacao_id = 0')
    SQLConnection = Conexao
    Left = 365
    Top = 112
  end
  object qryFormaPagamento: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from forma_pagamento')
    SQLConnection = Conexao
    Left = 400
    Top = 112
  end
  object DSFormaPagamento: TDataSource
    DataSet = CDSFormaPagamento
    Left = 400
    Top = 247
  end
  object CDSFormaPagamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPFormaPagamento'
    AfterInsert = CDSFormaPagamentoAfterInsert
    BeforePost = CDSFormaPagamentoBeforePost
    AfterPost = CDSFormaPagamentoAfterDelete
    BeforeCancel = CDSFormaPagamentoBeforeCancel
    AfterCancel = CDSFormaPagamentoAfterCancel
    BeforeDelete = CDSFormaPagamentoBeforeDelete
    AfterDelete = CDSFormaPagamentoAfterDelete
    Left = 400
    Top = 202
    object CDSFormaPagamentoFORMA_PAGAMENTO_ID: TIntegerField
      FieldName = 'FORMA_PAGAMENTO_ID'
      DisplayFormat = '0000000000'
    end
    object CDSFormaPagamentoATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object CDSFormaPagamentoDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object CDSFormaPagamentoDATA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
    end
    object CDSFormaPagamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CDSFormaPagamentoABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      Size = 15
    end
  end
  object DSPFormaPagamento: TDataSetProvider
    DataSet = qryFormaPagamento
    Left = 400
    Top = 156
  end
  object CDSVendedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPVendedor'
    AfterInsert = CDSVendedorAfterInsert
    BeforePost = CDSVendedorBeforePost
    AfterPost = CDSVendedorAfterPost
    BeforeCancel = CDSVendedorBeforeCancel
    AfterCancel = CDSVendedorAfterCancel
    BeforeDelete = CDSVendedorBeforeDelete
    AfterDelete = CDSVendedorAfterDelete
    Left = 436
    Top = 202
    object CDSVendedorVENDEDOR_ID: TIntegerField
      FieldName = 'VENDEDOR_ID'
      DisplayFormat = '0000000000'
    end
    object CDSVendedorATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object CDSVendedorDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object CDSVendedorDATA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
    end
    object CDSVendedorNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object CDSVendedorVENDEDOR_FUNCAO_ID: TIntegerField
      FieldName = 'VENDEDOR_FUNCAO_ID'
    end
    object CDSVendedorCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
    end
    object CDSVendedorLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 25
    end
    object CDSVendedorSENHA: TStringField
      FieldName = 'SENHA'
      Size = 8
    end
  end
  object DSVendedor: TDataSource
    DataSet = CDSVendedor
    Left = 436
    Top = 247
  end
  object DSPVendedor: TDataSetProvider
    DataSet = qryVendedor
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 436
    Top = 156
  end
  object qryVendedor: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from vendedor where vendedor_id = 0')
    SQLConnection = Conexao
    Left = 435
    Top = 112
  end
  object CDSItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPItens'
    Left = 472
    Top = 202
    object CDSItensPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
      DisplayFormat = '0000000000'
    end
    object CDSItensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CDSItensUND: TStringField
      FieldName = 'UND'
      Size = 5
    end
    object CDSItensPRECO: TFloatField
      FieldName = 'PRECO'
      DisplayFormat = ',0.00'
    end
    object CDSItensQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      DisplayFormat = ',0.00'
    end
    object CDSItensTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = ',0.00'
    end
  end
  object DSCDSItens: TDataSource
    DataSet = CDSItens
    Left = 473
    Top = 247
  end
  object DSPItens: TDataSetProvider
    DataSet = qryItens
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 472
    Top = 156
  end
  object qryItens: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select produto_id, descricao, und, preco, '
      'COALESCE(sum(quantidade), 0.0)as quantidade,'
      'COALESCE(sum(total), 0.0)as total'
      'from restaurante_comanda_item'
      'where cancelado = 0 and restaurante_comanda_id = 0'
      'group by produto_id, descricao, und, preco')
    SQLConnection = Conexao
    Left = 472
    Top = 112
  end
end
