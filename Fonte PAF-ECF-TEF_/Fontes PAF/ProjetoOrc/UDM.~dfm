object DM: TDM
  OldCreateOrder = False
  Left = 381
  Top = 117
  Height = 416
  Width = 631
  object TOrcTemp: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    AfterPost = TOrcTempAfterPost
    AfterDelete = TOrcTempAfterDelete
    Left = 27
    Top = 143
    object TOrcTempNUM_ITEM: TAutoIncField
      FieldName = 'NUM_ITEM'
      DisplayFormat = '000'
    end
    object TOrcTempCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
      DisplayFormat = '000000000000000'
    end
    object TOrcTempREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 15
    end
    object TOrcTempDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object TOrcTempQTDE: TFloatField
      FieldName = 'QTDE'
      DisplayFormat = '0.000'
    end
    object TOrcTempVL_UNIT: TFloatField
      FieldName = 'VL_UNIT'
      DisplayFormat = '##,###0.00'
    end
    object TOrcTempVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      DisplayFormat = '##,###0.00'
    end
    object TOrcTempTABELA: TStringField
      FieldName = 'TABELA'
      Size = 1
    end
    object TOrcTempCUSTOFINAL: TFloatField
      FieldName = 'CUSTOFINAL'
    end
    object TOrcTempSUBTOTAL: TAggregateField
      FieldName = 'SUBTOTAL'
      Active = True
      Expression = 'SUM(VL_TOTAL)'
    end
  end
  object QPesqProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PDESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODBARRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PINATIVO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  P.CODIGO,'
      '  P.CODBARRA,'
      '  P.REFERENCIA,'
      '  P.DESCRICAO,'
      '  P.MED,'
      '  P.QTDE,'
      '  P.QTDEEF,'
      '  P.PRECOVENDA,'
      '  P.PRECOPRAZO,'
      '  P.INATIVO,'
      '  P.CUSTOFINAL,'
      '  G.NOME,'
      '  S.NOME,'
      '  M.NOME'
      'FROM '
      '  ESTOQUE P'
      '  LEFT JOIN GRUPO G ON G.CODIGO = P.CODGRUPO'
      '  LEFT JOIN SECAO S ON S.CODIGO = P.CODSECAO'
      '  LEFT JOIN MARCA M ON M.CODIGO = P.CODMARCA'
      '  LEFT JOIN ECFALIQUOTA T ON T.CODIGO = P.CODALIQUOTA'
      'WHERE'
      '  P.DESCRICAO LIKE :PDESCRICAO OR'
      '  P.REFERENCIA LIKE :PREFERENCIA OR'
      '  P.CODBARRA = :PCODBARRA OR'
      '  P.CODIGO = :PCODIGO  '
      'AND'
      '  P.INATIVO = :PINATIVO')
    SQLConnection = SQLConnection
    Left = 109
    Top = 8
  end
  object dspPesqProduto: TDataSetProvider
    DataSet = QPesqProduto
    Left = 137
    Top = 8
  end
  object TPesqProduto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'PDESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODBARRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PINATIVO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqProduto'
    OnCalcFields = TPesqProdutoCalcFields
    Left = 164
    Top = 8
    object TPesqProdutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
      DisplayFormat = '00000000000000'
    end
    object TPesqProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 15
    end
    object TPesqProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
    object TPesqProdutoQTDE: TFMTBCDField
      FieldName = 'QTDE'
      DisplayFormat = '0.000'
      Precision = 15
      Size = 3
    end
    object TPesqProdutoQTDEEF: TFMTBCDField
      FieldName = 'QTDEEF'
      Precision = 15
      Size = 3
    end
    object TPesqProdutoSALDO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SALDO'
      DisplayFormat = '0.000'
    end
    object TPesqProdutoMED: TStringField
      FieldName = 'MED'
      Size = 2
    end
    object TPesqProdutoPRECOVENDA: TFMTBCDField
      FieldName = 'PRECOVENDA'
      DisplayFormat = '##,###0.00'
      Precision = 15
      Size = 2
    end
    object TPesqProdutoPRECOPRAZO: TFMTBCDField
      FieldName = 'PRECOPRAZO'
      DisplayFormat = '##,###0.00'
      Precision = 15
      Size = 2
    end
    object TPesqProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object TPesqProdutoNOME_1: TStringField
      FieldName = 'NOME_1'
      Size = 50
    end
    object TPesqProdutoNOME_2: TStringField
      FieldName = 'NOME_2'
      Size = 50
    end
    object TPesqProdutoINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object TPesqProdutoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object TPesqProdutoCUSTOFINAL: TFMTBCDField
      FieldName = 'CUSTOFINAL'
      Precision = 15
      Size = 5
    end
  end
  object SQLConnection: TSQLConnection
    ConnectionName = 'APG'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=LocalHost:C:\Aplicativo_Gerencial\Bd\BANCO.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet=WIN1252'
      'SQLDialect=3'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'fbClient.dll'
    Left = 27
    Top = 7
  end
  object QPesquisa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 27
    Top = 51
  end
  object QPesqCliente: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PNOME'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PINATIVO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  C.CODIGO,'
      '  C.NOME,'
      '  C.NOME_FANTASIA,'
      '  C.ENDERECO,'
      '  C.BAIRRO,'
      '  C.CODCIDADE,'
      '  C.CEP,'
      '  C.UF,'
      '  C.CPF,'
      '  C.RG,'
      '  C.CGC,'
      '  C.IE,'
      '  C.TELEFONE,'
      '  C.CELULAR,'
      '  C.INATIVO,'
      '  CI.NOME_CIDADE'
      'FROM'
      '  CLIENTE C'
      '  LEFT JOIN CIDADE CI ON CI.CODIGO = C.CODCIDADE'
      'WHERE'
      '  C.NOME LIKE :PNOME OR   '
      '  C.CODIGO = :PCODIGO  '
      'AND'
      '  C.INATIVO = :PINATIVO')
    SQLConnection = SQLConnection
    Left = 101
    Top = 117
  end
  object dspPesqClilente: TDataSetProvider
    DataSet = QPesqCliente
    Left = 129
    Top = 117
  end
  object TPesqCliente: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'PNOME'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PINATIVO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqClilente'
    Left = 157
    Top = 117
    object TPesqClienteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
      DisplayFormat = '00000'
    end
    object TPesqClienteNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object TPesqClienteNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 60
    end
    object TPesqClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object TPesqClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object TPesqClienteCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
    end
    object TPesqClienteCEP: TStringField
      FieldName = 'CEP'
      Size = 15
    end
    object TPesqClienteUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object TPesqClienteCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object TPesqClienteRG: TStringField
      FieldName = 'RG'
    end
    object TPesqClienteCGC: TStringField
      FieldName = 'CGC'
    end
    object TPesqClienteIE: TStringField
      FieldName = 'IE'
    end
    object TPesqClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 16
    end
    object TPesqClienteCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 16
    end
    object TPesqClienteNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      Size = 50
    end
    object TPesqClienteINATIVO: TStringField
      FieldName = 'INATIVO'
      Size = 1
    end
  end
  object TPesqProdutoTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 138
    Top = 57
    object TPesqProdutoTempCODIGO: TIntegerField
      FieldName = 'CODIGO'
      DisplayFormat = '00000000000000'
    end
    object TPesqProdutoTempREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 15
    end
    object TPesqProdutoTempDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object TPesqProdutoTempQTDE: TFMTBCDField
      FieldName = 'QTDE'
      DisplayFormat = '0.000'
      Size = 8
    end
    object TPesqProdutoTempMED: TStringField
      FieldName = 'MED'
      Size = 2
    end
    object TPesqProdutoTempNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object TPesqProdutoTempNOME_1: TStringField
      FieldName = 'NOME_1'
      Size = 40
    end
    object TPesqProdutoTempNOME_2: TStringField
      FieldName = 'NOME_2'
      Size = 40
    end
    object TPesqProdutoTempINATIVO: TStringField
      FieldName = 'INATIVO'
      Size = 1
    end
    object TPesqProdutoTempPRECOVENDA: TFMTBCDField
      FieldName = 'PRECOVENDA'
      DisplayFormat = '##,###0.00'
      Size = 8
    end
    object TPesqProdutoTempPRECOPRAZO: TFMTBCDField
      FieldName = 'PRECOPRAZO'
      DisplayFormat = '##,###0.00'
      Size = 8
    end
    object TPesqProdutoTempCUSTOFINAL: TFMTBCDField
      FieldName = 'CUSTOFINAL'
      DisplayFormat = '##,###0.00'
      Size = 8
    end
    object TPesqProdutoTempCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
  end
  object TPesqClienteTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 131
    Top = 164
    object TPesqClienteTempCODIGO: TIntegerField
      FieldName = 'CODIGO'
      DisplayFormat = '00000'
    end
    object TPesqClienteTempNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object TPesqClienteTempNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 60
    end
    object TPesqClienteTempENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object TPesqClienteTempBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 35
    end
    object TPesqClienteTempCEP: TStringField
      FieldName = 'CEP'
      Size = 16
    end
    object TPesqClienteTempUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object TPesqClienteTempCPF: TStringField
      FieldName = 'CPF'
    end
    object TPesqClienteTempRG: TStringField
      FieldName = 'RG'
      Size = 16
    end
    object TPesqClienteTempCGC: TStringField
      FieldName = 'CGC'
    end
    object TPesqClienteTempIE: TStringField
      FieldName = 'IE'
      Size = 16
    end
    object TPesqClienteTempTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 16
    end
    object TPesqClienteTempCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 16
    end
    object TPesqClienteTempINATIVO: TStringField
      FieldName = 'INATIVO'
      Size = 1
    end
    object TPesqClienteTempNOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      Size = 35
    end
  end
  object QPesqVendedor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PINATIVO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  NOME,'
      '  INATIVO'
      'FROM'
      '  VENDEDOR'
      'WHERE'
      '  INATIVO= :PINATIVO')
    SQLConnection = SQLConnection
    Left = 246
    Top = 57
  end
  object dspPesqVendedor: TDataSetProvider
    DataSet = QPesqVendedor
    Left = 274
    Top = 57
  end
  object TPesqVendedor: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'PINATIVO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqVendedor'
    Left = 302
    Top = 57
    object TPesqVendedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
      DisplayFormat = '00000'
    end
    object TPesqVendedorNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
  end
  object TPesqVendedorTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 276
    Top = 106
    object TPesqVendedorTempCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object TPesqVendedorTempNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
  end
  object QOrcamento: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  O.CODIGO,'
      '  O.DTEMISSAO,'
      '  O.HORA,'
      '  O.CODCLIENTE,'
      '  O.NOMECLIENTE,'
      '  O.CODVENDEDOR,'
      '  O.DESCONTO,'
      '  O.VALOR,'
      '  O.TOTALCUSTO,'
      '  O.OBS,'
      '  O.VALIDADE,'
      '  O.NUMERO_DAV,'
      '  O.SITUACAO,'
      '  O.ALTERADO,'
      '  O.DT_HORA_ALTEROU,'
      '  O. NUM_NOVO_DAV,'
      '  O.REF_NUM_DAV,'
      '  O.NUMERO_CUPOM,'
      '  O.NUMERO_SERIE_ECF,'
      '  O.NUMERO_CAIXA,'
      '  O.FLAG,'
      '  V.NOME'
      'FROM'
      '  ORCAMENTO O'
      '  LEFT JOIN VENDEDOR V ON V.CODIGO = O.CODVENDEDOR '
      'WHERE'
      '  O.CODIGO=:CODIGO')
    SQLConnection = SQLConnection
    Left = 506
    Top = 4
    object QOrcamentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QOrcamentoDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object QOrcamentoCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object QOrcamentoNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      Size = 50
    end
    object QOrcamentoCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
    end
    object QOrcamentoDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 15
      Size = 5
    end
    object QOrcamentoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object QOrcamentoTOTALCUSTO: TFMTBCDField
      FieldName = 'TOTALCUSTO'
      Precision = 15
      Size = 2
    end
    object QOrcamentoOBS: TStringField
      FieldName = 'OBS'
      Size = 100
    end
    object QOrcamentoVALIDADE: TDateField
      FieldName = 'VALIDADE'
    end
    object QOrcamentoNUMERO_DAV: TIntegerField
      FieldName = 'NUMERO_DAV'
    end
    object QOrcamentoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 50
    end
    object QOrcamentoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QOrcamentoALTERADO: TStringField
      FieldName = 'ALTERADO'
      FixedChar = True
      Size = 1
    end
    object QOrcamentoDT_HORA_ALTEROU: TSQLTimeStampField
      FieldName = 'DT_HORA_ALTEROU'
    end
    object QOrcamentoNUMERO_CUPOM: TIntegerField
      FieldName = 'NUMERO_CUPOM'
    end
    object QOrcamentoNUMERO_SERIE_ECF: TStringField
      FieldName = 'NUMERO_SERIE_ECF'
    end
    object QOrcamentoNUMERO_CAIXA: TSmallintField
      FieldName = 'NUMERO_CAIXA'
    end
    object QOrcamentoREF_NUM_DAV: TIntegerField
      FieldName = 'REF_NUM_DAV'
    end
    object QOrcamentoNUM_NOVO_DAV: TIntegerField
      FieldName = 'NUM_NOVO_DAV'
    end
    object QOrcamentoHORA: TTimeField
      FieldName = 'HORA'
    end
    object QOrcamentoFLAG: TSmallintField
      FieldName = 'FLAG'
      Required = True
    end
  end
  object dspOrcamento: TDataSetProvider
    DataSet = QOrcamento
    Options = [poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspOrcamentoBeforeUpdateRecord
    Left = 534
    Top = 4
  end
  object TOrcamento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspOrcamento'
    AfterInsert = TOrcamentoAfterInsert
    OnCalcFields = TOrcamentoCalcFields
    OnNewRecord = TOrcamentoNewRecord
    Left = 562
    Top = 4
    object TOrcamentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TOrcamentoDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object TOrcamentoHORA: TTimeField
      FieldName = 'HORA'
    end
    object TOrcamentoCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      DisplayFormat = '00000'
    end
    object TOrcamentoNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      Size = 50
    end
    object TOrcamentoCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
      DisplayFormat = '000'
    end
    object TOrcamentoDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      DisplayFormat = '##,###0.00'
      Precision = 15
      Size = 5
    end
    object TOrcamentoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '##,###0.00'
      Precision = 15
      Size = 2
    end
    object TOrcamentoTOTALCUSTO: TFMTBCDField
      FieldName = 'TOTALCUSTO'
      Precision = 15
      Size = 2
    end
    object TOrcamentoOBS: TStringField
      FieldName = 'OBS'
      Size = 100
    end
    object TOrcamentoSUBTOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SUBTOTAL'
      DisplayFormat = '##,###0.00'
    end
    object TOrcamentoVALIDADE: TDateField
      FieldName = 'VALIDADE'
    end
    object TOrcamentoNUMERO_DAV: TIntegerField
      FieldName = 'NUMERO_DAV'
      DisplayFormat = '00000000000000'
    end
    object TOrcamentoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 50
    end
    object TOrcamentoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TOrcamentoALTERADO: TStringField
      FieldName = 'ALTERADO'
      FixedChar = True
      Size = 1
    end
    object TOrcamentoDT_HORA_ALTEROU: TSQLTimeStampField
      FieldName = 'DT_HORA_ALTEROU'
    end
    object TOrcamentoNUMERO_CUPOM: TIntegerField
      FieldName = 'NUMERO_CUPOM'
    end
    object TOrcamentoNUMERO_SERIE_ECF: TStringField
      FieldName = 'NUMERO_SERIE_ECF'
    end
    object TOrcamentoNUMERO_CAIXA: TSmallintField
      FieldName = 'NUMERO_CAIXA'
    end
    object TOrcamentoREF_NUM_DAV: TIntegerField
      FieldName = 'REF_NUM_DAV'
      DisplayFormat = '00000000000000'
    end
    object TOrcamentoNUM_NOVO_DAV: TIntegerField
      FieldName = 'NUM_NOVO_DAV'
    end
    object TOrcamentoQItemOrcamento: TDataSetField
      FieldName = 'QItemOrcamento'
    end
    object TOrcamentoFLAG: TSmallintField
      FieldName = 'FLAG'
      Required = True
    end
  end
  object TItemOrcamento: TClientDataSet
    Aggregates = <>
    DataSetField = TOrcamentoQItemOrcamento
    Params = <>
    Left = 561
    Top = 49
    object TItemOrcamentoCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '000'
    end
    object TItemOrcamentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TItemOrcamentoCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
      DisplayFormat = '000000'
    end
    object TItemOrcamentoQTDE: TFMTBCDField
      FieldName = 'QTDE'
      DisplayFormat = '0.000'
      Precision = 15
      Size = 3
    end
    object TItemOrcamentoPRECO: TFMTBCDField
      FieldName = 'PRECO'
      DisplayFormat = '##,###0.00'
      Precision = 15
      Size = 2
    end
    object TItemOrcamentoCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      Precision = 15
      Size = 2
    end
    object TItemOrcamentoTABELA: TStringField
      FieldName = 'TABELA'
      Size = 1
    end
    object TItemOrcamentoTOTALITEN: TFMTBCDField
      FieldName = 'TOTALITEN'
      DisplayFormat = '##,###0.00'
      Precision = 15
      Size = 2
    end
    object TItemOrcamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object TItemOrcamentoMAODEOBRA: TStringField
      FieldName = 'MAODEOBRA'
      FixedChar = True
      Size = 1
    end
    object TItemOrcamentoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object TItemOrcamentoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object TItemOrcamentoMED: TStringField
      FieldName = 'MED'
      Size = 2
    end
    object TItemOrcamentoCODMARCA: TIntegerField
      FieldName = 'CODMARCA'
    end
    object TItemOrcamentoNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
  end
  object DstOrcamento: TDataSource
    DataSet = QOrcamento
    Left = 534
    Top = 49
  end
  object QItemOrcamento: TSQLQuery
    DataSource = DstOrcamento
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'SELECT'
      '  I.CONTROLE,'
      '  I.CODIGO,'
      '  I.CODPRODUTO,'
      '  I.QTDE,'
      '  I.PRECO,'
      '  I.CUSTO,'
      '  I.TABELA,'
      '  I.TOTALITEN,'
      '  I.DESCRICAO,'
      '  I.MAODEOBRA,'
      '  I.OBSERVACAO,'
      '  E.REFERENCIA,'
      '  E.MED,'
      '  E.CODMARCA,'
      '  M.NOME'
      'FROM'
      '  ITEMORCAMENTO I'
      '  LEFT JOIN ESTOQUE E ON E.CODIGO = I.CODPRODUTO'
      '  LEFT JOIN MARCA M ON M.CODIGO = E.CODMARCA'
      'WHERE'
      '  I.CODIGO=:CODIGO')
    SQLConnection = SQLConnection
    Left = 506
    Top = 49
    object QItemOrcamentoCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QItemOrcamentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QItemOrcamentoCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object QItemOrcamentoQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 15
      Size = 3
    end
    object QItemOrcamentoPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Precision = 15
      Size = 2
    end
    object QItemOrcamentoCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      Precision = 15
      Size = 2
    end
    object QItemOrcamentoTABELA: TStringField
      FieldName = 'TABELA'
      Size = 1
    end
    object QItemOrcamentoTOTALITEN: TFMTBCDField
      FieldName = 'TOTALITEN'
      Precision = 15
      Size = 2
    end
    object QItemOrcamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object QItemOrcamentoMAODEOBRA: TStringField
      FieldName = 'MAODEOBRA'
      FixedChar = True
      Size = 1
    end
    object QItemOrcamentoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object QItemOrcamentoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      ProviderFlags = []
    end
    object QItemOrcamentoMED: TStringField
      FieldName = 'MED'
      ProviderFlags = []
      Size = 2
    end
    object QItemOrcamentoCODMARCA: TIntegerField
      FieldName = 'CODMARCA'
      ProviderFlags = []
    end
    object QItemOrcamentoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 50
    end
  end
  object QGen: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 27
    Top = 96
  end
  object dsPesqVendedores: TDataSource
    DataSet = TPesqVendedor
    Left = 357
    Top = 77
  end
  object dsPesquisaClientes: TDataSource
    DataSet = TPesqCliente
    Left = 208
    Top = 144
  end
  object dsOrcamento: TDataSource
    DataSet = TOrcamento
    Left = 524
    Top = 95
  end
  object dsItemOrcamento: TDataSource
    DataSet = TItemOrcamento
    Left = 552
    Top = 95
  end
  object QEmpresa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '  RAZAO,'
      '  CGC,'
      '  IE,'
      '  ENDERECO,'
      '  BAIRRO,'
      '  CEP,'
      '  CIDADE,'
      '  UF,'
      '  FONE,'
      '  PADRAOBUSCA,'
      '  PERMITIVENDAESTOQUENEG'
      'FROM'
      '  EMPRESA')
    SQLConnection = SQLConnection
    Left = 383
    Top = 6
  end
  object dspEmpresa: TDataSetProvider
    DataSet = QEmpresa
    Left = 411
    Top = 6
  end
  object TEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    Left = 438
    Top = 6
    object TEmpresaRAZAO: TStringField
      FieldName = 'RAZAO'
      Size = 50
    end
    object TEmpresaCGC: TStringField
      FieldName = 'CGC'
    end
    object TEmpresaIE: TStringField
      FieldName = 'IE'
    end
    object TEmpresaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object TEmpresaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object TEmpresaCEP: TStringField
      FieldName = 'CEP'
      Size = 15
    end
    object TEmpresaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object TEmpresaUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object TEmpresaFONE: TStringField
      FieldName = 'FONE'
    end
    object TEmpresaPADRAOBUSCA: TStringField
      FieldName = 'PADRAOBUSCA'
      Size = 1
    end
    object TEmpresaPERMITIVENDAESTOQUENEG: TStringField
      FieldName = 'PERMITIVENDAESTOQUENEG'
      Size = 1
    end
  end
  object QConsultaOrc: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '  O.CODIGO,'
      '  O.DTEMISSAO,'
      '  O.HORA,'
      '  O.CODCLIENTE,'
      '  O.NOMECLIENTE,'
      '  O.CODVENDEDOR,'
      '  O.DESCONTO,'
      '  O.VALOR,'
      '  O.TOTALCUSTO,'
      '  O.OBS,'
      '  O.VALIDADE,'
      '  O.NUMERO_DAV,'
      '  O.SITUACAO,'
      '  O.ALTERADO,'
      '  O.DT_HORA_ALTEROU,'
      '  O. NUM_NOVO_DAV,'
      '  O.REF_NUM_DAV,'
      '  O.NUMERO_CUPOM,'
      '  O.NUMERO_SERIE_ECF,'
      '  O.NUMERO_CAIXA,'
      '  V.NOME'
      'FROM'
      '  ORCAMENTO O'
      '  LEFT JOIN VENDEDOR V ON V.CODIGO = O.CODVENDEDOR '
      '')
    SQLConnection = SQLConnection
    Left = 33
    Top = 236
  end
  object dspConsultaOrc: TDataSetProvider
    DataSet = QConsultaOrc
    Left = 61
    Top = 236
  end
  object TConsultaOrc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsultaOrc'
    OnCalcFields = TConsultaOrcCalcFields
    Left = 89
    Top = 236
    object TConsultaOrcCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TConsultaOrcDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object TConsultaOrcHORA: TTimeField
      FieldName = 'HORA'
    end
    object TConsultaOrcCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object TConsultaOrcNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      Size = 50
    end
    object TConsultaOrcCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
    end
    object TConsultaOrcSUBTOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SUBTOTAL'
      DisplayFormat = '##,###0.00'
    end
    object TConsultaOrcDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      DisplayFormat = '##,###0.00'
      Precision = 15
      Size = 5
    end
    object TConsultaOrcVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '##,###0.00'
      Precision = 15
      Size = 2
    end
    object TConsultaOrcTOTALCUSTO: TFMTBCDField
      FieldName = 'TOTALCUSTO'
      Precision = 15
      Size = 2
    end
    object TConsultaOrcOBS: TStringField
      FieldName = 'OBS'
      Size = 100
    end
    object TConsultaOrcVALIDADE: TDateField
      FieldName = 'VALIDADE'
    end
    object TConsultaOrcNUMERO_DAV: TIntegerField
      FieldName = 'NUMERO_DAV'
      DisplayFormat = '00000000000000'
    end
    object TConsultaOrcNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object TConsultaOrcSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TConsultaOrcALTERADO: TStringField
      FieldName = 'ALTERADO'
      FixedChar = True
      Size = 1
    end
    object TConsultaOrcDT_HORA_ALTEROU: TSQLTimeStampField
      FieldName = 'DT_HORA_ALTEROU'
    end
    object TConsultaOrcNUMERO_CUPOM: TIntegerField
      FieldName = 'NUMERO_CUPOM'
      DisplayFormat = '000000'
    end
    object TConsultaOrcNUMERO_SERIE_ECF: TStringField
      FieldName = 'NUMERO_SERIE_ECF'
    end
    object TConsultaOrcNUMERO_CAIXA: TSmallintField
      FieldName = 'NUMERO_CAIXA'
      DisplayFormat = '0000'
    end
    object TConsultaOrcREF_NUM_DAV: TIntegerField
      FieldName = 'REF_NUM_DAV'
    end
    object TConsultaOrcNUM_NOVO_DAV: TIntegerField
      FieldName = 'NUM_NOVO_DAV'
      DisplayFormat = '00000000000000'
    end
    object TConsultaOrcSEL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
  end
  object QConsultaItenOrc: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  I.CONTROLE,'
      '  I.CODIGO,'
      '  I.CODPRODUTO,'
      '  I.QTDE,'
      '  I.PRECO,'
      '  I.CUSTO,'
      '  I.TABELA,'
      '  I.TOTALITEN,'
      '  I.DESCRICAO,'
      '  I.MAODEOBRA,'
      '  I.OBSERVACAO,'
      '  E.REFERENCIA,'
      '  E.MED'
      'FROM'
      '  ITEMORCAMENTO I'
      '  LEFT JOIN ESTOQUE E ON E.CODIGO = I.CODPRODUTO'
      'WHERE'
      '  I.CODIGO=:PCODIGO')
    SQLConnection = SQLConnection
    Left = 34
    Top = 282
  end
  object dspConsultaItenOrc: TDataSetProvider
    DataSet = QConsultaItenOrc
    Left = 62
    Top = 282
  end
  object TConsultaItenOrc: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsultaItenOrc'
    Left = 89
    Top = 282
    object TConsultaItenOrcCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      Required = True
    end
    object TConsultaItenOrcCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TConsultaItenOrcCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
      DisplayFormat = '000000'
    end
    object TConsultaItenOrcQTDE: TFMTBCDField
      FieldName = 'QTDE'
      DisplayFormat = '0.000'
      Precision = 15
      Size = 3
    end
    object TConsultaItenOrcPRECO: TFMTBCDField
      FieldName = 'PRECO'
      DisplayFormat = '##,###0.00'
      Precision = 15
      Size = 2
    end
    object TConsultaItenOrcCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      Precision = 15
      Size = 2
    end
    object TConsultaItenOrcTABELA: TStringField
      FieldName = 'TABELA'
      Size = 1
    end
    object TConsultaItenOrcTOTALITEN: TFMTBCDField
      FieldName = 'TOTALITEN'
      DisplayFormat = '##,###0.00'
      Precision = 15
      Size = 2
    end
    object TConsultaItenOrcDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object TConsultaItenOrcMAODEOBRA: TStringField
      FieldName = 'MAODEOBRA'
      FixedChar = True
      Size = 1
    end
    object TConsultaItenOrcOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object TConsultaItenOrcREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object TConsultaItenOrcMED: TStringField
      FieldName = 'MED'
      Size = 2
    end
    object TConsultaItenOrcGRADE: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'GRADE'
      Size = 1
    end
  end
  object RLRichFilter1: TRLRichFilter
    DisplayName = 'Formato RichText'
    Left = 55
    Top = 330
  end
  object RLHTMLFilter1: TRLHTMLFilter
    DocumentStyle = dsCSS2
    DisplayName = 'P'#225'gina da Web'
    Left = 87
    Top = 330
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel'
    Left = 151
    Top = 330
  end
  object RLPrintDialogSetup: TRLPrintDialogSetup
    Copies = 0
    Left = 238
    Top = 331
  end
  object RLPreviewSetup: TRLPreviewSetup
    Caption = 'Preview'
    Left = 268
    Top = 331
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport(Open Source) v3.24(BETA16) \251 Copyright '#169' 1999-20' +
      '08 Fortes Inform'#225'tica'
    ViewerOptions = []
    FontEncoding = feNoEncoding
    DisplayName = 'Documento PDF'
    Left = 120
    Top = 331
  end
  object RLDraftFilter1: TRLDraftFilter
    DisplayName = 'Matricial'
    Left = 23
    Top = 330
  end
  object QPesqGradeProd: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODPRODUTO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  G.CODIGO,'
      '  G.COD_PRODUTO,'
      '  G.VARIACAO,'
      '  G.QTDE,'
      '  G.QTDE_EF,'
      '  G.QTDE_MINIMA,'
      '  G.COD_BARRA,'
      '  G.REFERENCIA,'
      '  G.MED,'
      '  G.COD_COR,'
      '  G.COD_TAMANHO,'
      '  C.NOME_COR,'
      '  T.NOME_TAMANHO,'
      '  E.REFERENCIA'
      'FROM'
      '  ESTOQUE_GRADE G'
      
        '  LEFT JOIN ESTOQUE_GRADE_TAMANHOS T ON T.CODIGO = G.COD_TAMANHO' +
        ' '
      '  LEFT JOIN ESTOQUE_GRADE_CORES C ON C.CODIGO = G.COD_COR'
      '  LEFT JOIN ESTOQUE E ON E.CODIGO = G.COD_PRODUTO'
      'WHERE'
      '  G.COD_PRODUTO=:PCODPRODUTO ')
    SQLConnection = SQLConnection
    Left = 246
    Top = 7
  end
  object dspPesqGradeProd: TDataSetProvider
    DataSet = QPesqGradeProd
    UpdateMode = upWhereKeyOnly
    Left = 275
    Top = 7
  end
  object TPesqGradeProd: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODPRODUTO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqGradeProd'
    OnCalcFields = TPesqGradeProdCalcFields
    Left = 302
    Top = 7
    object TPesqGradeProdCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TPesqGradeProdCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object TPesqGradeProdVARIACAO: TStringField
      FieldName = 'VARIACAO'
      Size = 50
    end
    object TPesqGradeProdQTDE: TFMTBCDField
      FieldName = 'QTDE'
      DisplayFormat = '0.000'
      Precision = 15
      Size = 3
    end
    object TPesqGradeProdQTDE_EF: TFMTBCDField
      FieldName = 'QTDE_EF'
      DisplayFormat = '0.000'
      Precision = 15
      Size = 3
    end
    object TPesqGradeProdSALDO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SALDO'
      DisplayFormat = '0.000'
    end
    object TPesqGradeProdQTDE_MINIMA: TFMTBCDField
      FieldName = 'QTDE_MINIMA'
      DisplayFormat = '0.000'
      Precision = 15
      Size = 3
    end
    object TPesqGradeProdCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Size = 13
    end
    object TPesqGradeProdREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object TPesqGradeProdMED: TStringField
      FieldName = 'MED'
      FixedChar = True
      Size = 2
    end
    object TPesqGradeProdSEL: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SEL'
      Size = 1
    end
    object TPesqGradeProdQTDE_SELECIONADA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'QTDE_SELECIONADA'
      DisplayFormat = '0.000'
    end
    object TPesqGradeProdCOD_COR: TSmallintField
      FieldName = 'COD_COR'
    end
    object TPesqGradeProdCOD_TAMANHO: TSmallintField
      FieldName = 'COD_TAMANHO'
    end
    object TPesqGradeProdNOME_COR: TStringField
      FieldName = 'NOME_COR'
      Size = 35
    end
    object TPesqGradeProdNOME_TAMANHO: TStringField
      FieldName = 'NOME_TAMANHO'
      Size = 15
    end
    object TPesqGradeProdREFERENCIA_1: TStringField
      FieldName = 'REFERENCIA_1'
    end
    object TPesqGradeProdSOMA_QTDE: TAggregateField
      FieldName = 'SOMA_QTDE'
      Active = True
      Expression = 'SUM(QTDE)'
    end
    object TPesqGradeProdSOMA_QTDE_EF: TAggregateField
      FieldName = 'SOMA_QTDE_EF'
      Active = True
      Expression = 'SUM(QTDE_EF)'
    end
    object TPesqGradeProdSOMA_QTDE_MINNA: TAggregateField
      FieldName = 'SOMA_QTDE_MINNA'
      Expression = 'SUM(QTDE_MINIMA)'
    end
    object TPesqGradeProdSOMA_SALDO: TAggregateField
      FieldName = 'SOMA_SALDO'
      Active = True
      Expression = 'SUM(SALDO)'
    end
    object TPesqGradeProdSOMA_SEL: TAggregateField
      FieldName = 'SOMA_SEL'
      Active = True
      Expression = 'SUM(QTDE_SELECIONADA)'
    end
  end
  object TOrcGradeTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterPost = TOrcGradeTempAfterPost
    AfterDelete = TOrcGradeTempAfterDelete
    Left = 29
    Top = 187
    object TOrcGradeTempITEN: TIntegerField
      FieldName = 'ITEN'
    end
    object TOrcGradeTempCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
    end
    object TOrcGradeTempCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object TOrcGradeTempQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object TOrcGradeTempCOD_COR: TIntegerField
      FieldName = 'COD_COR'
    end
    object TOrcGradeTempCOD_TAMANHO: TIntegerField
      FieldName = 'COD_TAMANHO'
    end
  end
  object QOrcamento_Grade: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  COD_ORCAMENTO,'
      '  COD_PRODUTO,'
      '  COD_GRADE,'
      '  QTDE,'
      '  COD_COR,'
      '  COD_TAMANHO'
      'FROM'
      '  ORCAMENTO_GRADE'
      'WHERE'
      '  CODIGO=:PCODIGO')
    SQLConnection = SQLConnection
    Left = 393
    Top = 127
    object QOrcamento_GradeCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QOrcamento_GradeCOD_ORCAMENTO: TIntegerField
      FieldName = 'COD_ORCAMENTO'
      Required = True
    end
    object QOrcamento_GradeCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QOrcamento_GradeCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Required = True
    end
    object QOrcamento_GradeQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 15
      Size = 3
    end
    object QOrcamento_GradeCOD_COR: TSmallintField
      FieldName = 'COD_COR'
    end
    object QOrcamento_GradeCOD_TAMANHO: TSmallintField
      FieldName = 'COD_TAMANHO'
    end
  end
  object dspOrcamento_Grade: TDataSetProvider
    DataSet = QOrcamento_Grade
    Options = [poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspOrcamento_GradeBeforeUpdateRecord
    Left = 421
    Top = 127
  end
  object TOrcamento_Grade: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspOrcamento_Grade'
    OnNewRecord = TOrcamento_GradeNewRecord
    Left = 449
    Top = 127
    object TOrcamento_GradeCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TOrcamento_GradeCOD_ORCAMENTO: TIntegerField
      FieldName = 'COD_ORCAMENTO'
      Required = True
    end
    object TOrcamento_GradeCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object TOrcamento_GradeCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Required = True
    end
    object TOrcamento_GradeQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 15
      Size = 3
    end
    object TOrcamento_GradeCOD_COR: TSmallintField
      FieldName = 'COD_COR'
    end
    object TOrcamento_GradeCOD_TAMANHO: TSmallintField
      FieldName = 'COD_TAMANHO'
    end
  end
  object QConsultaOrcGrade: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODPRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODORC'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  G.CODIGO,'
      '  G.COD_ORCAMENTO,'
      '  G.COD_PRODUTO,'
      '  G.COD_GRADE,'
      '  G.QTDE,'
      '  G.COD_COR,'
      '  G.COD_TAMANHO,'
      '  V.VARIACAO,'
      '  B.COD_BARRA,'
      '  R.REFERENCIA,'
      '  C.NOME_COR,'
      '  T.NOME_TAMANHO,'
      '  M.MED'
      'FROM'
      '  ORCAMENTO_GRADE G'
      '  LEFT JOIN ESTOQUE_GRADE V ON V.CODIGO = G.COD_GRADE'
      '  LEFT JOIN ESTOQUE_GRADE B ON B.CODIGO = G.COD_GRADE'
      '  LEFT JOIN ESTOQUE_GRADE R ON R.CODIGO = G.COD_GRADE'
      '  LEFT JOIN ESTOQUE_GRADE M ON M.CODIGO = G.COD_GRADE'
      '  LEFT JOIN ESTOQUE_GRADE_CORES C ON C.CODIGO = G.COD_COR'
      '  LEFT JOIN ESTOQUE_GRADE_TAMANHOS T ON T.CODIGO = G.COD_TAMANHO'
      'WHERE'
      '  G.COD_PRODUTO=:PCODPRODUTO'
      'AND'
      '  G.COD_ORCAMENTO=:PCODORC')
    SQLConnection = SQLConnection
    Left = 175
    Top = 236
  end
  object dspConsultaOrcGrade: TDataSetProvider
    DataSet = QConsultaOrcGrade
    Left = 203
    Top = 236
  end
  object TConsultaOrcGrade: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODPRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODORC'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsultaOrcGrade'
    Left = 231
    Top = 236
    object TConsultaOrcGradeCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TConsultaOrcGradeCOD_ORCAMENTO: TIntegerField
      FieldName = 'COD_ORCAMENTO'
      Required = True
    end
    object TConsultaOrcGradeCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object TConsultaOrcGradeCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Required = True
    end
    object TConsultaOrcGradeQTDE: TFMTBCDField
      FieldName = 'QTDE'
      DisplayFormat = '0.000'
      Precision = 15
      Size = 3
    end
    object TConsultaOrcGradeCOD_COR: TSmallintField
      FieldName = 'COD_COR'
    end
    object TConsultaOrcGradeCOD_TAMANHO: TSmallintField
      FieldName = 'COD_TAMANHO'
    end
    object TConsultaOrcGradeVARIACAO: TStringField
      FieldName = 'VARIACAO'
      Size = 50
    end
    object TConsultaOrcGradeCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Size = 13
    end
    object TConsultaOrcGradeREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object TConsultaOrcGradeNOME_COR: TStringField
      FieldName = 'NOME_COR'
      Size = 35
    end
    object TConsultaOrcGradeNOME_TAMANHO: TStringField
      FieldName = 'NOME_TAMANHO'
      Size = 15
    end
    object TConsultaOrcGradeMED: TStringField
      FieldName = 'MED'
      FixedChar = True
      Size = 2
    end
  end
  object TDavAlterando: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 232
    Data = {
      2D0000009619E0BD0100000018000000010000000000030000002D000A4E554D
      45524F5F44415604000100000000000000}
    object TDavAlterandoNUMERO_DAV: TIntegerField
      FieldName = 'NUMERO_DAV'
    end
  end
end
