object DM: TDM
  OldCreateOrder = False
  Left = 316
  Top = 109
  Height = 614
  Width = 891
  object SQLConnectionLocal: TSQLConnection
    ConnectionName = 'PDV'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=LocalHost:C:\Apgef\bd\FRENTE.FDB'
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
    Left = 44
    Top = 8
  end
  object QEmpresa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '  ID,'
      '  RAZAO_SOCIAL,'
      '  NOME_FANTASIA,'
      '  ENDERECO,'
      '  BAIRRO,'
      '  CIDADE,'
      '  UF,'
      '  CEP,'
      '  CNPJ,'
      '  INSC_ESTADUAL,'
      '  INSC_MUNICIPAL,'
      '  TELEFONE,'
      '  FAX,'
      '  DATA,'
      '  CONTATO,'
      '  EMAIL,'
      '  INSC_SUFRAMA,'
      '  COD_MUNICIPIO,'
      '  COMPLEMENTO'
      'FROM'
      '  EMPRESA')
    SQLConnection = SQLConnectionLocal
    Left = 692
    Top = 9
    object QEmpresaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QEmpresaRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Required = True
      Size = 60
    end
    object QEmpresaNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Required = True
      Size = 60
    end
    object QEmpresaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object QEmpresaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object QEmpresaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object QEmpresaUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object QEmpresaCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object QEmpresaINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
    end
    object QEmpresaINSC_MUNICIPAL: TStringField
      FieldName = 'INSC_MUNICIPAL'
    end
    object QEmpresaDATA: TDateField
      FieldName = 'DATA'
    end
    object QEmpresaCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object QEmpresaTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object QEmpresaFAX: TStringField
      FieldName = 'FAX'
    end
    object QEmpresaCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 50
    end
    object QEmpresaEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object QEmpresaINSC_SUFRAMA: TStringField
      FieldName = 'INSC_SUFRAMA'
      Size = 10
    end
    object QEmpresaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object QEmpresaCOD_MUNICIPIO: TStringField
      FieldName = 'COD_MUNICIPIO'
      Size = 10
    end
  end
  object dspEmpresa: TDataSetProvider
    DataSet = QEmpresa
    UpdateMode = upWhereKeyOnly
    Left = 720
    Top = 9
  end
  object TEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    Left = 746
    Top = 9
    object TEmpresaID: TIntegerField
      FieldName = 'ID'
    end
    object TEmpresaRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Required = True
      Size = 60
    end
    object TEmpresaNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Required = True
      Size = 60
    end
    object TEmpresaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object TEmpresaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object TEmpresaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object TEmpresaUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object TEmpresaCEP: TStringField
      FieldName = 'CEP'
      EditMask = '#####\-###;1; '
      Size = 10
    end
    object TEmpresaINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
    end
    object TEmpresaINSC_MUNICIPAL: TStringField
      FieldName = 'INSC_MUNICIPAL'
    end
    object TEmpresaDATA: TDateField
      FieldName = 'DATA'
    end
    object TEmpresaCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object TEmpresaTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object TEmpresaFAX: TStringField
      FieldName = 'FAX'
    end
    object TEmpresaCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 50
    end
    object TEmpresaEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object TEmpresaINSC_SUFRAMA: TStringField
      FieldName = 'INSC_SUFRAMA'
      Size = 10
    end
    object TEmpresaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object TEmpresaCOD_MUNICIPIO: TStringField
      FieldName = 'COD_MUNICIPIO'
      Size = 10
    end
  end
  object QGrupos: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  NOME'
      'FROM'
      '  GRUPO')
    SQLConnection = SQLConnectionLocal
    Left = 156
    Top = 264
    object QGruposCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QGruposNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
  end
  object dspGrupos: TDataSetProvider
    DataSet = QGrupos
    UpdateMode = upWhereKeyOnly
    Left = 185
    Top = 264
  end
  object TGrupos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupos'
    Left = 214
    Top = 264
    object TGruposCODIGO: TIntegerField
      FieldName = 'CODIGO'
      DisplayFormat = '00000'
    end
    object TGruposNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
  end
  object QUnidades: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  DESCRICAO,'
      '  ABREVIATURA'
      'FROM'
      '  UNIDADES')
    SQLConnection = SQLConnectionLocal
    Left = 115
    Top = 57
    object QUnidadesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QUnidadesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 30
    end
    object QUnidadesABREVIATURA: TStringField
      FieldName = 'ABREVIATURA'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object dspUnidades: TDataSetProvider
    DataSet = QUnidades
    UpdateMode = upWhereKeyOnly
    Left = 143
    Top = 57
  end
  object TUnidades: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnidades'
    Left = 171
    Top = 57
    object TUnidadesCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object TUnidadesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 30
    end
    object TUnidadesABREVIATURA: TStringField
      FieldName = 'ABREVIATURA'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object QProdutoLocal: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  P.CODIGO,'
      '  P.CODBARRA,'
      '  P.REFERENCIA,'
      '  P.DESCRICAO,'
      '  P.CODGRUPO,'
      '  P.CODMARCA,'
      '  P.CODSECAO,'
      '  P.QTDE,'
      '  P.QTDEMINIMA,'
      '  P.PRECOCUSTO,'
      '  P.PRECOVENDA,'
      '  P.PRECOPRAZO, '
      '  P.DESCONTOMAX,'
      '  P.MED,'
      '  P.CODALIQUOTA,'
      '  P.BALANCA,'
      '  P.OBS,'
      '  P.IPI,'
      '  P.INATIVO,'
      '  P.DATAULTVENDA, '
      '  P.CST,'
      '  P.IAT,'
      '  P.IPPT,'
      '  P.COD_NCM,'
      '  G.NOME,'
      '  S.NOME,'
      '  M.NOME,'
      '  T.NOME   '
      'FROM'
      '  ESTOQUE P'
      '  LEFT JOIN GRUPO G ON G.CODIGO = P.CODGRUPO'
      '  LEFT JOIN SECAO S ON S.CODIGO = P.CODSECAO'
      '  LEFT JOIN MARCA M ON M.CODIGO = P.CODMARCA'
      '  LEFT JOIN ECFALIQUOTA T ON T.CODIGO = P.CODALIQUOTA'
      'WHERE'
      '  P.CODIGO=:PCODIGO')
    SQLConnection = SQLConnectionLocal
    Left = 471
    Top = 57
    object QProdutoLocalCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QProdutoLocalREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object QProdutoLocalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object QProdutoLocalCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
    end
    object QProdutoLocalCODMARCA: TIntegerField
      FieldName = 'CODMARCA'
    end
    object QProdutoLocalQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 15
      Size = 3
    end
    object QProdutoLocalQTDEMINIMA: TFMTBCDField
      FieldName = 'QTDEMINIMA'
      Precision = 15
      Size = 3
    end
    object QProdutoLocalPRECOCUSTO: TFMTBCDField
      FieldName = 'PRECOCUSTO'
      Precision = 15
      Size = 2
    end
    object QProdutoLocalPRECOVENDA: TFMTBCDField
      FieldName = 'PRECOVENDA'
      Precision = 15
      Size = 2
    end
    object QProdutoLocalPRECOPRAZO: TFMTBCDField
      FieldName = 'PRECOPRAZO'
      Precision = 15
      Size = 2
    end
    object QProdutoLocalDESCONTOMAX: TFMTBCDField
      FieldName = 'DESCONTOMAX'
      Precision = 15
      Size = 2
    end
    object QProdutoLocalMED: TStringField
      FieldName = 'MED'
      Size = 2
    end
    object QProdutoLocalCODALIQUOTA: TIntegerField
      FieldName = 'CODALIQUOTA'
      Required = True
    end
    object QProdutoLocalBALANCA: TStringField
      FieldName = 'BALANCA'
      Size = 1
    end
    object QProdutoLocalOBS: TBlobField
      FieldName = 'OBS'
      Size = 1
    end
    object QProdutoLocalCODSECAO: TIntegerField
      FieldName = 'CODSECAO'
    end
    object QProdutoLocalNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 50
    end
    object QProdutoLocalNOME_1: TStringField
      FieldName = 'NOME_1'
      ProviderFlags = []
      Size = 50
    end
    object QProdutoLocalNOME_2: TStringField
      FieldName = 'NOME_2'
      ProviderFlags = []
      Size = 50
    end
    object QProdutoLocalNOME_3: TStringField
      FieldName = 'NOME_3'
      ProviderFlags = []
      Size = 40
    end
    object QProdutoLocalIPI: TFMTBCDField
      FieldName = 'IPI'
      Precision = 15
      Size = 2
    end
    object QProdutoLocalINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object QProdutoLocalDATAULTVENDA: TDateField
      FieldName = 'DATAULTVENDA'
    end
    object QProdutoLocalCST: TStringField
      FieldName = 'CST'
      Size = 5
    end
    object QProdutoLocalCODBARRA: TStringField
      FieldName = 'CODBARRA'
    end
    object QProdutoLocalIAT: TStringField
      FieldName = 'IAT'
      Size = 5
    end
    object QProdutoLocalIPPT: TStringField
      FieldName = 'IPPT'
      Size = 5
    end
    object QProdutoLocalCOD_NCM: TStringField
      FieldName = 'COD_NCM'
      Size = 15
    end
  end
  object dspProdutoLocal: TDataSetProvider
    DataSet = QProdutoLocal
    UpdateMode = upWhereKeyOnly
    Left = 499
    Top = 57
  end
  object TProdutoLocal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspProdutoLocal'
    AfterInsert = TProdutoLocalAfterInsert
    Left = 527
    Top = 57
    object TProdutoLocalCODIGO: TIntegerField
      FieldName = 'CODIGO'
      DisplayFormat = '00000'
    end
    object TProdutoLocalREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object TProdutoLocalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object TProdutoLocalCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
      OnValidate = TProdutoLocalCODGRUPOValidate
    end
    object TProdutoLocalCODMARCA: TIntegerField
      FieldName = 'CODMARCA'
      OnValidate = TProdutoLocalCODMARCAValidate
    end
    object TProdutoLocalQTDE: TFMTBCDField
      FieldName = 'QTDE'
      DisplayFormat = '0.000'
      Precision = 15
      Size = 3
    end
    object TProdutoLocalQTDEMINIMA: TFMTBCDField
      FieldName = 'QTDEMINIMA'
      DisplayFormat = '0.000'
      Precision = 15
      Size = 3
    end
    object TProdutoLocalPRECOCUSTO: TFMTBCDField
      FieldName = 'PRECOCUSTO'
      DisplayFormat = '##,###0.00'
      Precision = 15
      Size = 2
    end
    object TProdutoLocalPRECOVENDA: TFMTBCDField
      FieldName = 'PRECOVENDA'
      DisplayFormat = '##,###0.00'
      Precision = 15
      Size = 2
    end
    object TProdutoLocalPRECOPRAZO: TFMTBCDField
      FieldName = 'PRECOPRAZO'
      DisplayFormat = '##,###0.00'
      Precision = 15
      Size = 2
    end
    object TProdutoLocalDESCONTOMAX: TFMTBCDField
      FieldName = 'DESCONTOMAX'
      DisplayFormat = '##,###0.00'
      Precision = 15
      Size = 2
    end
    object TProdutoLocalMED: TStringField
      FieldName = 'MED'
      Size = 2
    end
    object TProdutoLocalCODALIQUOTA: TIntegerField
      FieldName = 'CODALIQUOTA'
      Required = True
      OnValidate = TProdutoLocalCODALIQUOTAValidate
    end
    object TProdutoLocalBALANCA: TStringField
      FieldName = 'BALANCA'
      Size = 1
    end
    object TProdutoLocalOBS: TBlobField
      FieldName = 'OBS'
      Size = 1
    end
    object TProdutoLocalCODSECAO: TIntegerField
      FieldName = 'CODSECAO'
      OnValidate = TProdutoLocalCODSECAOValidate
    end
    object TProdutoLocalNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object TProdutoLocalNOME_1: TStringField
      FieldName = 'NOME_1'
      Size = 50
    end
    object TProdutoLocalNOME_2: TStringField
      FieldName = 'NOME_2'
      Size = 50
    end
    object TProdutoLocalNOME_3: TStringField
      FieldName = 'NOME_3'
      Size = 40
    end
    object TProdutoLocalIPI: TFMTBCDField
      FieldName = 'IPI'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object TProdutoLocalINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object TProdutoLocalDATAULTVENDA: TDateField
      FieldName = 'DATAULTVENDA'
    end
    object TProdutoLocalCST: TStringField
      FieldName = 'CST'
      Size = 5
    end
    object TProdutoLocalCODBARRA: TStringField
      FieldName = 'CODBARRA'
    end
    object TProdutoLocalIAT: TStringField
      FieldName = 'IAT'
      Size = 5
    end
    object TProdutoLocalIPPT: TStringField
      FieldName = 'IPPT'
      Size = 5
    end
    object TProdutoLocalCOD_NCM: TStringField
      FieldName = 'COD_NCM'
      Size = 15
    end
  end
  object QClientes: TSQLQuery
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
      '  NOME,'
      '  ENDERECO,'
      '  BAIRRO,'
      '  CIDADE,'
      '  UF,'
      '  CEP,'
      '  TELEFONE,'
      '  CELULAR,'
      '  CPF,'
      '  RG,'
      '  CGC,'
      '  IE,'
      '  INADIMPLENTE,'
      '  TRAVA,'
      '  LIMITECREDITO,'
      '  OBS,'
      '  CODCIDADE,'
      '  CODBAIRRO,'
      '  INATIVO'
      'FROM'
      '  CLIENTE'
      'WHERE'
      '  CODIGO=:PCODIGO')
    SQLConnection = SQLConnectionLocal
    Left = 198
    Top = 313
    object QClientesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QClientesNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object QClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object QClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 35
    end
    object QClientesUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object QClientesCEP: TStringField
      FieldName = 'CEP'
      Size = 16
    end
    object QClientesTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 16
    end
    object QClientesCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 16
    end
    object QClientesCPF: TStringField
      FieldName = 'CPF'
    end
    object QClientesRG: TStringField
      FieldName = 'RG'
    end
    object QClientesIE: TStringField
      FieldName = 'IE'
    end
    object QClientesINADIMPLENTE: TStringField
      FieldName = 'INADIMPLENTE'
      FixedChar = True
      Size = 1
    end
    object QClientesTRAVA: TFMTBCDField
      FieldName = 'TRAVA'
      Precision = 15
      Size = 2
    end
    object QClientesLIMITECREDITO: TFMTBCDField
      FieldName = 'LIMITECREDITO'
      Precision = 15
      Size = 2
    end
    object QClientesOBS: TBlobField
      FieldName = 'OBS'
      Size = 1
    end
    object QClientesCGC: TStringField
      FieldName = 'CGC'
    end
    object QClientesCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
    end
    object QClientesCODBAIRRO: TIntegerField
      FieldName = 'CODBAIRRO'
    end
    object QClientesINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object dspClientes: TDataSetProvider
    DataSet = QClientes
    UpdateMode = upWhereKeyOnly
    Left = 230
    Top = 313
  end
  object TClientes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspClientes'
    AfterInsert = TClientesAfterInsert
    AfterEdit = TClientesAfterEdit
    Left = 261
    Top = 313
    object TClientesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TClientesNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object TClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object TClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object TClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 35
    end
    object TClientesUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object TClientesCEP: TStringField
      FieldName = 'CEP'
      EditMask = '#####\-###;1; '
      Size = 16
    end
    object TClientesTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 16
    end
    object TClientesCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 16
    end
    object TClientesCPF: TStringField
      FieldName = 'CPF'
      EditMask = '###\.###\.###\-##;1; '
    end
    object TClientesRG: TStringField
      FieldName = 'RG'
    end
    object TClientesIE: TStringField
      FieldName = 'IE'
    end
    object TClientesINADIMPLENTE: TStringField
      FieldName = 'INADIMPLENTE'
      FixedChar = True
      Size = 1
    end
    object TClientesTRAVA: TFMTBCDField
      FieldName = 'TRAVA'
      Precision = 15
      Size = 2
    end
    object TClientesLIMITECREDITO: TFMTBCDField
      FieldName = 'LIMITECREDITO'
      Precision = 15
      Size = 2
    end
    object TClientesOBS: TBlobField
      FieldName = 'OBS'
      Size = 1
    end
    object TClientesCGC: TStringField
      FieldName = 'CGC'
      EditMask = '##\.###\.###\/####\-##;1; '
    end
    object TClientesCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
    end
    object TClientesCODBAIRRO: TIntegerField
      FieldName = 'CODBAIRRO'
    end
    object TClientesINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object QMarca: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  NOME'
      'FROM'
      '  MARCA')
    SQLConnection = SQLConnectionLocal
    Left = 265
    Top = 265
    object QMarcaCODIGO: TSmallintField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QMarcaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
  end
  object dspMarca: TDataSetProvider
    DataSet = QMarca
    UpdateMode = upWhereKeyOnly
    Left = 297
    Top = 265
  end
  object TMarca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMarca'
    Left = 329
    Top = 265
    object TMarcaCODIGO: TSmallintField
      FieldName = 'CODIGO'
      DisplayFormat = '00000'
    end
    object TMarcaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
  end
  object QTributacao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  NOME,'
      '  ALIQUOTA,'
      '  CODIGOCUPOM'
      'FROM'
      '  ECFALIQUOTA')
    SQLConnection = SQLConnectionLocal
    Left = 322
    Top = 312
    object QTributacaoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '00000'
    end
    object QTributacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object QTributacaoALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object QTributacaoCODIGOCUPOM: TStringField
      FieldName = 'CODIGOCUPOM'
      Size = 5
    end
  end
  object dspTributacao: TDataSetProvider
    DataSet = QTributacao
    UpdateMode = upWhereKeyOnly
    Left = 354
    Top = 312
  end
  object T_Tributacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTributacao'
    Left = 385
    Top = 312
    object T_TributacaoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      DisplayFormat = '00000'
    end
    object T_TributacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object T_TributacaoALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object T_TributacaoCODIGOCUPOM: TStringField
      FieldName = 'CODIGOCUPOM'
      Size = 5
    end
  end
  object QUsuario: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnectionLocal
    Left = 504
    Top = 263
    object QUsuarioID: TSmallintField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QUsuarioNOME: TStringField
      FieldName = 'NOME'
    end
    object QUsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Size = 10
    end
    object QUsuarioVINCULADO_AO_VENDEDOR: TIntegerField
      FieldName = 'VINCULADO_AO_VENDEDOR'
    end
    object QUsuarioCHK_PARAMETROS: TSmallintField
      FieldName = 'CHK_PARAMETROS'
    end
    object QUsuarioCHK_CADASTRO: TSmallintField
      FieldName = 'CHK_CADASTRO'
    end
    object QUsuarioCHK_GRUPOS: TSmallintField
      FieldName = 'CHK_GRUPOS'
    end
    object QUsuarioCHK_UNIDADES: TSmallintField
      FieldName = 'CHK_UNIDADES'
    end
    object QUsuarioCHK_MARCAS: TSmallintField
      FieldName = 'CHK_MARCAS'
    end
    object QUsuarioCHK_CLIENTES: TSmallintField
      FieldName = 'CHK_CLIENTES'
    end
    object QUsuarioCHK_PRODUTOS: TSmallintField
      FieldName = 'CHK_PRODUTOS'
    end
    object QUsuarioCHK_VENDAS: TSmallintField
      FieldName = 'CHK_VENDAS'
    end
    object QUsuarioCHK_VENDA_CHECKOUT: TSmallintField
      FieldName = 'CHK_VENDA_CHECKOUT'
    end
    object QUsuarioCHK_CONFIGURACOES: TSmallintField
      FieldName = 'CHK_CONFIGURACOES'
    end
    object QUsuarioCHK_CONFIG_ECF: TSmallintField
      FieldName = 'CHK_CONFIG_ECF'
    end
    object QUsuarioCHK_CONFIG_TEF: TSmallintField
      FieldName = 'CHK_CONFIG_TEF'
    end
    object QUsuarioCHK_USUARIOS: TSmallintField
      FieldName = 'CHK_USUARIOS'
    end
    object QUsuarioPE_ABRE_GAVETA: TSmallintField
      FieldName = 'PE_ABRE_GAVETA'
    end
    object QUsuarioPE_SUPRIMENTO_SANGRIA: TSmallintField
      FieldName = 'PE_SUPRIMENTO_SANGRIA'
    end
    object QUsuarioPE_CANCELA_CUPOM: TSmallintField
      FieldName = 'PE_CANCELA_CUPOM'
    end
    object QUsuarioPE_REDUCAO_Z: TSmallintField
      FieldName = 'PE_REDUCAO_Z'
    end
    object QUsuarioPE_LEITURA_X: TSmallintField
      FieldName = 'PE_LEITURA_X'
    end
    object QUsuarioPE_ALTERA_MSG_PROMOCIONAL: TSmallintField
      FieldName = 'PE_ALTERA_MSG_PROMOCIONAL'
    end
    object QUsuarioPE_ALTERA_ESTOQUE: TSmallintField
      FieldName = 'PE_ALTERA_ESTOQUE'
    end
    object QUsuarioCHK_SECAO: TSmallintField
      FieldName = 'CHK_SECAO'
    end
    object QUsuarioPE_CANCELA_ITEM: TSmallintField
      FieldName = 'PE_CANCELA_ITEM'
    end
    object QUsuarioPE_CONFIG_DIVERSAS: TSmallintField
      FieldName = 'PE_CONFIG_DIVERSAS'
    end
    object QUsuarioPE_CAD_PRODUTO: TSmallintField
      FieldName = 'PE_CAD_PRODUTO'
    end
    object QUsuarioPE_LIBERA_VENDA_ATRASO: TSmallintField
      FieldName = 'PE_LIBERA_VENDA_ATRASO'
    end
    object QUsuarioPE_LIBERA_VENDA_LIMITE_EXC: TSmallintField
      FieldName = 'PE_LIBERA_VENDA_LIMITE_EXC'
    end
    object QUsuarioPE_LIBERA_VENDA_INADIMPLENTE: TSmallintField
      FieldName = 'PE_LIBERA_VENDA_INADIMPLENTE'
    end
    object QUsuarioCHK_FORMAPGTO: TSmallintField
      FieldName = 'CHK_FORMAPGTO'
    end
    object QUsuarioPE_LIBERA_DESCONTO: TSmallintField
      FieldName = 'PE_LIBERA_DESCONTO'
    end
    object QUsuarioPE_MAXIMO_DESCONTO: TFMTBCDField
      FieldName = 'PE_MAXIMO_DESCONTO'
      Precision = 15
      Size = 2
    end
    object QUsuarioPE_LIBERA_DESC_MINIMO: TSmallintField
      FieldName = 'PE_LIBERA_DESC_MINIMO'
    end
    object QUsuarioPE_ALTERA_CLIENTE: TSmallintField
      FieldName = 'PE_ALTERA_CLIENTE'
    end
  end
  object dspUsuario: TDataSetProvider
    DataSet = QUsuario
    UpdateMode = upWhereKeyOnly
    Left = 536
    Top = 263
  end
  object TUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuario'
    Left = 568
    Top = 262
    object TUsuarioID: TSmallintField
      FieldName = 'ID'
    end
    object TUsuarioNOME: TStringField
      FieldName = 'NOME'
    end
    object TUsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Size = 10
    end
    object TUsuarioVINCULADO_AO_VENDEDOR: TIntegerField
      FieldName = 'VINCULADO_AO_VENDEDOR'
    end
    object TUsuarioCHK_PARAMETROS: TSmallintField
      FieldName = 'CHK_PARAMETROS'
    end
    object TUsuarioCHK_CADASTRO: TSmallintField
      FieldName = 'CHK_CADASTRO'
    end
    object TUsuarioCHK_GRUPOS: TSmallintField
      FieldName = 'CHK_GRUPOS'
    end
    object TUsuarioCHK_UNIDADES: TSmallintField
      FieldName = 'CHK_UNIDADES'
    end
    object TUsuarioCHK_MARCAS: TSmallintField
      FieldName = 'CHK_MARCAS'
    end
    object TUsuarioCHK_CLIENTES: TSmallintField
      FieldName = 'CHK_CLIENTES'
    end
    object TUsuarioCHK_PRODUTOS: TSmallintField
      FieldName = 'CHK_PRODUTOS'
    end
    object TUsuarioCHK_VENDAS: TSmallintField
      FieldName = 'CHK_VENDAS'
    end
    object TUsuarioCHK_VENDA_CHECKOUT: TSmallintField
      FieldName = 'CHK_VENDA_CHECKOUT'
    end
    object TUsuarioCHK_CONFIGURACOES: TSmallintField
      FieldName = 'CHK_CONFIGURACOES'
    end
    object TUsuarioCHK_CONFIG_ECF: TSmallintField
      FieldName = 'CHK_CONFIG_ECF'
    end
    object TUsuarioCHK_CONFIG_TEF: TSmallintField
      FieldName = 'CHK_CONFIG_TEF'
    end
    object TUsuarioCHK_USUARIOS: TSmallintField
      FieldName = 'CHK_USUARIOS'
    end
    object TUsuarioPE_ABRE_GAVETA: TSmallintField
      FieldName = 'PE_ABRE_GAVETA'
    end
    object TUsuarioPE_SUPRIMENTO_SANGRIA: TSmallintField
      FieldName = 'PE_SUPRIMENTO_SANGRIA'
    end
    object TUsuarioPE_CANCELA_CUPOM: TSmallintField
      FieldName = 'PE_CANCELA_CUPOM'
    end
    object TUsuarioPE_REDUCAO_Z: TSmallintField
      FieldName = 'PE_REDUCAO_Z'
    end
    object TUsuarioPE_LEITURA_X: TSmallintField
      FieldName = 'PE_LEITURA_X'
    end
    object TUsuarioPE_ALTERA_MSG_PROMOCIONAL: TSmallintField
      FieldName = 'PE_ALTERA_MSG_PROMOCIONAL'
    end
    object TUsuarioPE_ALTERA_ESTOQUE: TSmallintField
      FieldName = 'PE_ALTERA_ESTOQUE'
    end
    object TUsuarioCHK_SECAO: TSmallintField
      FieldName = 'CHK_SECAO'
    end
    object TUsuarioPE_CANCELA_ITEM: TSmallintField
      FieldName = 'PE_CANCELA_ITEM'
    end
    object TUsuarioPE_CONFIG_DIVERSAS: TSmallintField
      FieldName = 'PE_CONFIG_DIVERSAS'
    end
    object TUsuarioPE_CAD_PRODUTO: TSmallintField
      FieldName = 'PE_CAD_PRODUTO'
    end
    object TUsuarioPE_LIBERA_VENDA_ATRASO: TSmallintField
      FieldName = 'PE_LIBERA_VENDA_ATRASO'
    end
    object TUsuarioPE_LIBERA_VENDA_LIMITE_EXC: TSmallintField
      FieldName = 'PE_LIBERA_VENDA_LIMITE_EXC'
    end
    object TUsuarioPE_LIBERA_VENDA_INADIMPLENTE: TSmallintField
      FieldName = 'PE_LIBERA_VENDA_INADIMPLENTE'
    end
    object TUsuarioCHK_FORMAPGTO: TSmallintField
      FieldName = 'CHK_FORMAPGTO'
    end
    object TUsuarioPE_LIBERA_DESCONTO: TSmallintField
      FieldName = 'PE_LIBERA_DESCONTO'
    end
    object TUsuarioPE_MAXIMO_DESCONTO: TFMTBCDField
      FieldName = 'PE_MAXIMO_DESCONTO'
      Precision = 15
      Size = 2
    end
    object TUsuarioPE_LIBERA_DESC_MINIMO: TSmallintField
      FieldName = 'PE_LIBERA_DESC_MINIMO'
    end
    object TUsuarioPE_ALTERA_CLIENTE: TSmallintField
      FieldName = 'PE_ALTERA_CLIENTE'
    end
  end
  object QPesquisa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnectionLocal
    Left = 92
    Top = 264
  end
  object QGenRemoto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnectionRetaguarda
    Left = 162
    Top = 374
  end
  object QVendaLocal: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  DATA,'
      '  HORA,'
      '  NUMERO_ECF,'
      '  NUMERO_CUPOM,'
      '  COD_CLIENTE,'
      '  COD_OPERADOR,'
      '  COD_VENDEDOR,'
      '  SUBTOTAL,'
      '  ACRESCIMO,'
      '  PERC_ACRESCIMO,'
      '  DESCONTO,'
      '  PERC_DESCONTO,'
      '  TOTAL,'
      '  DINHEIRO,'
      '  CHEQUE,'
      '  CHEQUE_PRE,'
      '  CREDIARIO,'
      '  CARTAO,'
      '  TICKET,'
      '  TROCO,'
      '  TIPO,'
      '  NUMPGTO,'
      '  CUPOM_CANCELADO,'
      '  PDV,'
      '  COD_DAV,'
      '  COD_ADM_CARTAO,'
      '  NUMERO_CARTOES,'
      '  CARTAO_DEB_CRED,'
      '  NUM_TRANSACAO_TEF,'
      '  NOME_REDE_TEF,'
      '  NUM_TRANS_NSU_TEF,'
      '  DATA_TRANS_TEF,'
      '  HORA_TRANS_TEF,'
      '  BASE_ICMS,'
      '  VALOR_ICMS,'
      '  ULT_ATUALIZACAO,'
      '  NUM_CCF_CUPOM,'
      '  MODELO_ECF,'
      '  MARCA_ECF,'
      '  TIPO_ECF,'
      '  MF_ADICIONAL ,'
      '  NUM_FABRICACAO_ECF,'
      '  CONTADOR_GNF  '
      'FROM'
      '  VENDA'
      'WHERE'
      '  CODIGO=:CODIGO')
    SQLConnection = SQLConnectionLocal
    Left = 233
    Top = 57
    object QVendaLocalCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QVendaLocalDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object QVendaLocalHORA: TTimeField
      FieldName = 'HORA'
      Required = True
    end
    object QVendaLocalNUMERO_ECF: TStringField
      FieldName = 'NUMERO_ECF'
      Required = True
    end
    object QVendaLocalNUMERO_CUPOM: TIntegerField
      FieldName = 'NUMERO_CUPOM'
      Required = True
    end
    object QVendaLocalCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object QVendaLocalCOD_OPERADOR: TIntegerField
      FieldName = 'COD_OPERADOR'
      Required = True
    end
    object QVendaLocalSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Precision = 15
      Size = 2
    end
    object QVendaLocalTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
      Size = 2
    end
    object QVendaLocalDINHEIRO: TFMTBCDField
      FieldName = 'DINHEIRO'
      Precision = 15
      Size = 2
    end
    object QVendaLocalCHEQUE: TFMTBCDField
      FieldName = 'CHEQUE'
      Precision = 15
      Size = 2
    end
    object QVendaLocalCHEQUE_PRE: TFMTBCDField
      FieldName = 'CHEQUE_PRE'
      Precision = 15
      Size = 2
    end
    object QVendaLocalCREDIARIO: TFMTBCDField
      FieldName = 'CREDIARIO'
      Precision = 15
      Size = 2
    end
    object QVendaLocalCARTAO: TFMTBCDField
      FieldName = 'CARTAO'
      Precision = 15
      Size = 2
    end
    object QVendaLocalTROCO: TFMTBCDField
      FieldName = 'TROCO'
      Precision = 15
      Size = 2
    end
    object QVendaLocalCUPOM_CANCELADO: TStringField
      FieldName = 'CUPOM_CANCELADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QVendaLocalTICKET: TFMTBCDField
      FieldName = 'TICKET'
      Precision = 15
      Size = 2
    end
    object QVendaLocalTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QVendaLocalNUMPGTO: TIntegerField
      FieldName = 'NUMPGTO'
    end
    object QVendaLocalACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Precision = 15
      Size = 6
    end
    object QVendaLocalPERC_ACRESCIMO: TFMTBCDField
      FieldName = 'PERC_ACRESCIMO'
      Precision = 15
      Size = 6
    end
    object QVendaLocalDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 15
      Size = 6
    end
    object QVendaLocalPERC_DESCONTO: TFMTBCDField
      FieldName = 'PERC_DESCONTO'
      Precision = 15
      Size = 6
    end
    object QVendaLocalPDV: TStringField
      FieldName = 'PDV'
      FixedChar = True
      Size = 3
    end
    object QVendaLocalCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object QVendaLocalCOD_ADM_CARTAO: TIntegerField
      FieldName = 'COD_ADM_CARTAO'
    end
    object QVendaLocalNUMERO_CARTOES: TSmallintField
      FieldName = 'NUMERO_CARTOES'
    end
    object QVendaLocalCARTAO_DEB_CRED: TStringField
      FieldName = 'CARTAO_DEB_CRED'
      FixedChar = True
      Size = 1
    end
    object QVendaLocalNUM_TRANSACAO_TEF: TIntegerField
      FieldName = 'NUM_TRANSACAO_TEF'
    end
    object QVendaLocalNOME_REDE_TEF: TStringField
      FieldName = 'NOME_REDE_TEF'
      Size = 15
    end
    object QVendaLocalNUM_TRANS_NSU_TEF: TStringField
      FieldName = 'NUM_TRANS_NSU_TEF'
    end
    object QVendaLocalDATA_TRANS_TEF: TDateField
      FieldName = 'DATA_TRANS_TEF'
    end
    object QVendaLocalHORA_TRANS_TEF: TTimeField
      FieldName = 'HORA_TRANS_TEF'
    end
    object QVendaLocalBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Precision = 15
      Size = 2
    end
    object QVendaLocalVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 15
      Size = 2
    end
    object QVendaLocalULT_ATUALIZACAO: TSQLTimeStampField
      FieldName = 'ULT_ATUALIZACAO'
    end
    object QVendaLocalCOD_DAV: TIntegerField
      FieldName = 'COD_DAV'
    end
    object QVendaLocalNUM_CCF_CUPOM: TIntegerField
      FieldName = 'NUM_CCF_CUPOM'
    end
    object QVendaLocalMODELO_ECF: TStringField
      FieldName = 'MODELO_ECF'
    end
    object QVendaLocalMARCA_ECF: TStringField
      FieldName = 'MARCA_ECF'
    end
    object QVendaLocalTIPO_ECF: TStringField
      FieldName = 'TIPO_ECF'
      Size = 10
    end
    object QVendaLocalMF_ADICIONAL: TStringField
      FieldName = 'MF_ADICIONAL'
      FixedChar = True
      Size = 1
    end
    object QVendaLocalNUM_FABRICACAO_ECF: TStringField
      FieldName = 'NUM_FABRICACAO_ECF'
    end
    object QVendaLocalCONTADOR_GNF: TIntegerField
      FieldName = 'CONTADOR_GNF'
    end
  end
  object dspVendaLocal: TDataSetProvider
    DataSet = QVendaLocal
    Options = [poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspVendaLocalBeforeUpdateRecord
    Left = 261
    Top = 57
  end
  object TVendaLocal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspVendaLocal'
    AfterInsert = TVendaLocalAfterInsert
    AfterEdit = TVendaLocalAfterEdit
    OnNewRecord = TVendaLocalNewRecord
    Left = 289
    Top = 57
    object TVendaLocalCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TVendaLocalDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object TVendaLocalHORA: TTimeField
      FieldName = 'HORA'
      Required = True
    end
    object TVendaLocalNUMERO_ECF: TStringField
      FieldName = 'NUMERO_ECF'
      Required = True
    end
    object TVendaLocalNUMERO_CUPOM: TIntegerField
      FieldName = 'NUMERO_CUPOM'
      Required = True
    end
    object TVendaLocalCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object TVendaLocalCOD_OPERADOR: TIntegerField
      FieldName = 'COD_OPERADOR'
      Required = True
    end
    object TVendaLocalSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Precision = 15
      Size = 2
    end
    object TVendaLocalTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
      Size = 2
    end
    object TVendaLocalDINHEIRO: TFMTBCDField
      FieldName = 'DINHEIRO'
      Precision = 15
      Size = 2
    end
    object TVendaLocalCHEQUE: TFMTBCDField
      FieldName = 'CHEQUE'
      Precision = 15
      Size = 2
    end
    object TVendaLocalCHEQUE_PRE: TFMTBCDField
      FieldName = 'CHEQUE_PRE'
      Precision = 15
      Size = 2
    end
    object TVendaLocalCREDIARIO: TFMTBCDField
      FieldName = 'CREDIARIO'
      Precision = 15
      Size = 2
    end
    object TVendaLocalCARTAO: TFMTBCDField
      FieldName = 'CARTAO'
      Precision = 15
      Size = 2
    end
    object TVendaLocalTROCO: TFMTBCDField
      FieldName = 'TROCO'
      Precision = 15
      Size = 2
    end
    object TVendaLocalCUPOM_CANCELADO: TStringField
      FieldName = 'CUPOM_CANCELADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TVendaLocalTICKET: TFMTBCDField
      FieldName = 'TICKET'
      Precision = 15
      Size = 2
    end
    object TVendaLocalTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TVendaLocalNUMPGTO: TIntegerField
      FieldName = 'NUMPGTO'
    end
    object TVendaLocalACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Precision = 15
      Size = 6
    end
    object TVendaLocalPERC_ACRESCIMO: TFMTBCDField
      FieldName = 'PERC_ACRESCIMO'
      Precision = 15
      Size = 6
    end
    object TVendaLocalDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 15
      Size = 6
    end
    object TVendaLocalPERC_DESCONTO: TFMTBCDField
      FieldName = 'PERC_DESCONTO'
      Precision = 15
      Size = 6
    end
    object TVendaLocalPDV: TStringField
      FieldName = 'PDV'
      FixedChar = True
      Size = 3
    end
    object TVendaLocalCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object TVendaLocalCOD_ADM_CARTAO: TIntegerField
      FieldName = 'COD_ADM_CARTAO'
    end
    object TVendaLocalNUMERO_CARTOES: TSmallintField
      FieldName = 'NUMERO_CARTOES'
    end
    object TVendaLocalCARTAO_DEB_CRED: TStringField
      FieldName = 'CARTAO_DEB_CRED'
      FixedChar = True
      Size = 1
    end
    object TVendaLocalNUM_TRANSACAO_TEF: TIntegerField
      FieldName = 'NUM_TRANSACAO_TEF'
    end
    object TVendaLocalNOME_REDE_TEF: TStringField
      FieldName = 'NOME_REDE_TEF'
      Size = 15
    end
    object TVendaLocalNUM_TRANS_NSU_TEF: TStringField
      FieldName = 'NUM_TRANS_NSU_TEF'
    end
    object TVendaLocalDATA_TRANS_TEF: TDateField
      FieldName = 'DATA_TRANS_TEF'
    end
    object TVendaLocalHORA_TRANS_TEF: TTimeField
      FieldName = 'HORA_TRANS_TEF'
    end
    object TVendaLocalBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Precision = 15
      Size = 2
    end
    object TVendaLocalVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 15
      Size = 2
    end
    object TVendaLocalULT_ATUALIZACAO: TSQLTimeStampField
      FieldName = 'ULT_ATUALIZACAO'
    end
    object TVendaLocalCOD_DAV: TIntegerField
      FieldName = 'COD_DAV'
    end
    object TVendaLocalNUM_CCF_CUPOM: TIntegerField
      FieldName = 'NUM_CCF_CUPOM'
    end
    object TVendaLocalMODELO_ECF: TStringField
      FieldName = 'MODELO_ECF'
    end
    object TVendaLocalMARCA_ECF: TStringField
      FieldName = 'MARCA_ECF'
    end
    object TVendaLocalTIPO_ECF: TStringField
      FieldName = 'TIPO_ECF'
      Size = 10
    end
    object TVendaLocalMF_ADICIONAL: TStringField
      FieldName = 'MF_ADICIONAL'
      FixedChar = True
      Size = 1
    end
    object TVendaLocalNUM_FABRICACAO_ECF: TStringField
      FieldName = 'NUM_FABRICACAO_ECF'
    end
    object TVendaLocalCONTADOR_GNF: TIntegerField
      FieldName = 'CONTADOR_GNF'
    end
    object TVendaLocalQItemVendaLocal: TDataSetField
      FieldName = 'QItemVendaLocal'
    end
  end
  object dsVendaLocal: TDataSource
    DataSet = QVendaLocal
    Left = 325
    Top = 57
  end
  object QItemVendaLocal: TSQLQuery
    DataSource = dsVendaLocal
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
      '  CONTROLE,'
      '  CODIGO,'
      '  NUMERO_ECF,'
      '  NUMERO_CUPOM,'
      '  ITEM,'
      '  COD_PRODUTO,'
      '  DESCRICAO,'
      '  QUANTIDADE,'
      '  UNIDADE,'
      '  VL_UNITARIO,'
      '  ST,'
      '  ALIQUOTA,'
      '  VL_TOTAL,'
      '  TABELA,'
      '  VL_UNIT_BRUTO,'
      '  VL_TOTAL_BRUTO,'
      '  PERC_DESCONTO,'
      '  VALOR_DESCONTO,'
      '  PERC_ACRESCIMO,'
      '  VALOR_ACRESCIMO,'
      '  BASE_ICMS,'
      '  VALOR_ICMS,'
      '  PERC_IPI,'
      '  COD_TOTALIZADOR_PARCIAL, '
      '  CST'
      'FROM'
      '  VENDA_ITEM'
      'WHERE'
      '  CODIGO=:CODIGO')
    SQLConnection = SQLConnectionLocal
    Left = 362
    Top = 57
    object QItemVendaLocalCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QItemVendaLocalCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QItemVendaLocalNUMERO_ECF: TStringField
      FieldName = 'NUMERO_ECF'
      Required = True
    end
    object QItemVendaLocalNUMERO_CUPOM: TIntegerField
      FieldName = 'NUMERO_CUPOM'
      Required = True
    end
    object QItemVendaLocalITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object QItemVendaLocalCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QItemVendaLocalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object QItemVendaLocalQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 15
      Size = 3
    end
    object QItemVendaLocalUNIDADE: TStringField
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 2
    end
    object QItemVendaLocalVL_UNITARIO: TFMTBCDField
      FieldName = 'VL_UNITARIO'
      Precision = 15
      Size = 2
    end
    object QItemVendaLocalALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 15
      Size = 2
    end
    object QItemVendaLocalVL_TOTAL: TFMTBCDField
      FieldName = 'VL_TOTAL'
      Precision = 15
      Size = 2
    end
    object QItemVendaLocalTABELA: TStringField
      FieldName = 'TABELA'
      FixedChar = True
      Size = 1
    end
    object QItemVendaLocalVL_UNIT_BRUTO: TFMTBCDField
      FieldName = 'VL_UNIT_BRUTO'
      Precision = 15
      Size = 2
    end
    object QItemVendaLocalVL_TOTAL_BRUTO: TFMTBCDField
      FieldName = 'VL_TOTAL_BRUTO'
      Precision = 15
      Size = 2
    end
    object QItemVendaLocalPERC_DESCONTO: TFMTBCDField
      FieldName = 'PERC_DESCONTO'
      Precision = 15
      Size = 6
    end
    object QItemVendaLocalVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      Precision = 15
      Size = 2
    end
    object QItemVendaLocalPERC_ACRESCIMO: TFMTBCDField
      FieldName = 'PERC_ACRESCIMO'
      Precision = 15
      Size = 6
    end
    object QItemVendaLocalVALOR_ACRESCIMO: TFMTBCDField
      FieldName = 'VALOR_ACRESCIMO'
      Precision = 15
      Size = 2
    end
    object QItemVendaLocalBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Precision = 15
      Size = 2
    end
    object QItemVendaLocalVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 15
      Size = 2
    end
    object QItemVendaLocalPERC_IPI: TFMTBCDField
      FieldName = 'PERC_IPI'
      Precision = 15
      Size = 2
    end
    object QItemVendaLocalCOD_TOTALIZADOR_PARCIAL: TStringField
      FieldName = 'COD_TOTALIZADOR_PARCIAL'
      Size = 10
    end
    object QItemVendaLocalST: TStringField
      FieldName = 'ST'
      FixedChar = True
      Size = 5
    end
    object QItemVendaLocalCST: TStringField
      FieldName = 'CST'
      Size = 5
    end
  end
  object TItemVendaLocal: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = TVendaLocalQItemVendaLocal
    Params = <>
    Left = 390
    Top = 57
    object TItemVendaLocalCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TItemVendaLocalCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TItemVendaLocalNUMERO_ECF: TStringField
      FieldName = 'NUMERO_ECF'
      Required = True
    end
    object TItemVendaLocalNUMERO_CUPOM: TIntegerField
      FieldName = 'NUMERO_CUPOM'
      Required = True
    end
    object TItemVendaLocalITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object TItemVendaLocalCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object TItemVendaLocalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object TItemVendaLocalQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 15
      Size = 3
    end
    object TItemVendaLocalUNIDADE: TStringField
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 2
    end
    object TItemVendaLocalVL_UNITARIO: TFMTBCDField
      FieldName = 'VL_UNITARIO'
      Precision = 15
      Size = 2
    end
    object TItemVendaLocalALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 15
      Size = 2
    end
    object TItemVendaLocalVL_TOTAL: TFMTBCDField
      FieldName = 'VL_TOTAL'
      Precision = 15
      Size = 2
    end
    object TItemVendaLocalTABELA: TStringField
      FieldName = 'TABELA'
      FixedChar = True
      Size = 1
    end
    object TItemVendaLocalVL_UNIT_BRUTO: TFMTBCDField
      FieldName = 'VL_UNIT_BRUTO'
      Precision = 15
      Size = 2
    end
    object TItemVendaLocalVL_TOTAL_BRUTO: TFMTBCDField
      FieldName = 'VL_TOTAL_BRUTO'
      Precision = 15
      Size = 2
    end
    object TItemVendaLocalPERC_DESCONTO: TFMTBCDField
      FieldName = 'PERC_DESCONTO'
      Precision = 15
      Size = 6
    end
    object TItemVendaLocalVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      Precision = 15
      Size = 2
    end
    object TItemVendaLocalPERC_ACRESCIMO: TFMTBCDField
      FieldName = 'PERC_ACRESCIMO'
      Precision = 15
      Size = 6
    end
    object TItemVendaLocalVALOR_ACRESCIMO: TFMTBCDField
      FieldName = 'VALOR_ACRESCIMO'
      Precision = 15
      Size = 2
    end
    object TItemVendaLocalBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Precision = 15
      Size = 2
    end
    object TItemVendaLocalVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 15
      Size = 2
    end
    object TItemVendaLocalPERC_IPI: TFMTBCDField
      FieldName = 'PERC_IPI'
      Precision = 15
      Size = 2
    end
    object TItemVendaLocalCOD_TOTALIZADOR_PARCIAL: TStringField
      FieldName = 'COD_TOTALIZADOR_PARCIAL'
      Size = 10
    end
    object TItemVendaLocalST: TStringField
      FieldName = 'ST'
      FixedChar = True
      Size = 5
    end
    object TItemVendaLocalCST: TStringField
      FieldName = 'CST'
      Size = 5
    end
    object TItemVendaLocalSUM_TOTAL: TAggregateField
      FieldName = 'SUM_TOTAL'
      Active = True
      Expression = 'SUM(VL_TOTAL)'
    end
  end
  object QPesqCliente: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  NOME,'
      '  ENDERECO,'
      '  CPF,'
      '  CGC,'
      '  INATIVO'
      'FROM'
      '  CLIENTE')
    SQLConnection = SQLConnectionLocal
    Left = 456
    Top = 312
  end
  object dspPesqCliente: TDataSetProvider
    DataSet = QPesqCliente
    Left = 488
    Top = 312
  end
  object TPesqCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqCliente'
    Left = 520
    Top = 312
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
    object TPesqClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object TPesqClienteCPF: TStringField
      FieldName = 'CPF'
    end
    object TPesqClienteCGC: TStringField
      FieldName = 'CGC'
    end
    object TPesqClienteINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object QPesqProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
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
      '  P.CODALIQUOTA,'
      '  P.INATIVO,'
      '  P.DATAULTVENDA,'
      '  P.IAT,'
      '  P.IPPT,'
      '  G.NOME,'
      '  S.NOME,'
      '  M.NOME,'
      '  T.CODIGOCUPOM,'
      '  T.NOME,'
      '  T.ALIQUOTA'
      'FROM '
      '  ESTOQUE P'
      '  LEFT JOIN GRUPO G ON G.CODIGO = P.CODGRUPO'
      '  LEFT JOIN SECAO S ON S.CODIGO = P.CODSECAO'
      '  LEFT JOIN MARCA M ON M.CODIGO = P.CODMARCA'
      '  LEFT JOIN ECFALIQUOTA T ON T.CODIGO = P.CODALIQUOTA'
      '  ')
    SQLConnection = SQLConnectionLocal
    Left = 592
    Top = 312
  end
  object dspPesqProduto: TDataSetProvider
    DataSet = QPesqProduto
    Left = 624
    Top = 312
  end
  object TPesqProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesqProduto'
    OnCalcFields = TPesqProdutoCalcFields
    Left = 654
    Top = 312
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
    object TPesqProdutoSALDO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SALDO'
      DisplayFormat = '0.000'
    end
    object TPesqProdutoCODALIQUOTA: TIntegerField
      FieldName = 'CODALIQUOTA'
      Required = True
    end
    object TPesqProdutoCODIGOCUPOM: TStringField
      FieldName = 'CODIGOCUPOM'
      Size = 5
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
    object TPesqProdutoNOME_3: TStringField
      FieldName = 'NOME_3'
      Size = 40
    end
    object TPesqProdutoINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object TPesqProdutoDATAULTVENDA: TDateField
      FieldName = 'DATAULTVENDA'
    end
    object TPesqProdutoALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object TPesqProdutoIAT: TStringField
      FieldName = 'IAT'
      Size = 5
    end
    object TPesqProdutoIPPT: TStringField
      FieldName = 'IPPT'
      Size = 5
    end
    object TPesqProdutoCODBARRA: TStringField
      FieldName = 'CODBARRA'
    end
  end
  object TPDV: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Apgef\Local\Itens.xml'
    IndexFieldNames = 'ITEN'
    Params = <>
    AfterPost = TPDVAfterPost
    AfterDelete = TPDVAfterDelete
    Left = 7
    Top = 59
    object TPDVITEN: TAutoIncField
      FieldName = 'ITEN'
      DisplayFormat = '000'
    end
    object TPDVDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object TPDVCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object TPDVQTDE: TFloatField
      FieldName = 'QTDE'
      DisplayFormat = '0.000'
    end
    object TPDVMED: TStringField
      FieldName = 'MED'
      Size = 2
    end
    object TPDVVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      DisplayFormat = '##,###0.00'
    end
    object TPDVVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      DisplayFormat = '##,###0.00'
    end
    object TPDVALIQUOTA: TFloatField
      FieldName = 'ALIQUOTA'
    end
    object TPDVCANCELADO: TStringField
      FieldName = 'CANCELADO'
      Size = 1
    end
    object TPDVNUMERO_ECF: TStringField
      DisplayWidth = 20
      FieldName = 'NUMERO_ECF'
    end
    object TPDVNUMERO_CUPOM: TIntegerField
      FieldName = 'NUMERO_CUPOM'
    end
    object TPDVTABELA: TStringField
      FieldName = 'TABELA'
      Size = 1
    end
    object TPDVP_VISTA: TFloatField
      FieldName = 'P_VISTA'
    end
    object TPDVPERC_DESC: TFloatField
      FieldName = 'PERC_DESC'
    end
    object TPDVPERC_IPI: TFloatField
      FieldName = 'PERC_IPI'
    end
    object TPDVNUM_CCF_CUPOM: TIntegerField
      FieldName = 'NUM_CCF_CUPOM'
    end
    object TPDVMF_ADICIONAL: TStringField
      FieldName = 'MF_ADICIONAL'
      Size = 1
    end
    object TPDVTIPO_ECF: TStringField
      FieldName = 'TIPO_ECF'
      Size = 10
    end
    object TPDVMARCA_ECF: TStringField
      FieldName = 'MARCA_ECF'
    end
    object TPDVMODELO_ECF: TStringField
      FieldName = 'MODELO_ECF'
    end
    object TPDVNUM_FABRICAO_ECF: TStringField
      FieldName = 'NUM_FABRICAO_ECF'
    end
    object TPDVST: TStringField
      FieldName = 'ST'
      Size = 5
    end
    object TPDVCST: TStringField
      FieldName = 'CST'
      Size = 5
    end
    object TPDVBUSCOU_DAV: TBooleanField
      FieldName = 'BUSCOU_DAV'
    end
    object TPDVCOD_DAV: TIntegerField
      FieldName = 'COD_DAV'
    end
    object TPDVCODCLIENTE_DAV: TIntegerField
      FieldName = 'CODCLIENTE_DAV'
    end
    object TPDVCLIENTE_DAV: TStringField
      FieldName = 'CLIENTE_DAV'
      Size = 60
    end
    object TPDVDESCONTO_DAV: TFloatField
      FieldName = 'DESCONTO_DAV'
    end
    object TPDVFLAG_DAV: TIntegerField
      FieldName = 'FLAG_DAV'
    end
    object TPDVNUM_FLAG_DAV: TIntegerField
      FieldName = 'NUM_FLAG_DAV'
    end
  end
  object SQLConnectionRetaguarda: TSQLConnection
    ConnectionName = 'APG'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=LocalHost:C:\Aplicativo_Gerencial\Bd\Banco.Fdb'
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
    Left = 56
    Top = 373
  end
  object QReceber: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '   R.CODIGO,'
      '   R.CODVENDA,'
      '   R.DOCUMENTO,'
      '   R.NUMPARCELA,'
      '   R.CODCLIENTE,'
      '   R.CODVENDEDOR1,'
      '   R.CODVENDEDOR2,'
      '   R.COMISSAO1,'
      '   R.COMISSAO2,'
      '   R.DATAEMISSAO,'
      '   R.DATAVENCIMENTO,'
      '   R.DATAPAGAMENTO,'
      '   R.VALOR,'
      '   R.VALORRECEBIDO,'
      '   R.HISTORICO,'
      '   R.COMPLEMENTO,'
      '   R.COBRANCA,'
      '   R.JUSTICA,'
      '   R.ARQUIVOMORTO,'
      '   R.CODRECEBIMENTO,'
      '   R.DEVOLUCAO,'
      '   R.CODPORTADOR,'
      '   R.CODREMESSA,'
      '   R.CODCIDADE,'
      '   R.CODBAIRRO,'
      '   R.CANCELADO,'
      '   R.REPARCELADO,'
      '   CLI.NOME,'
      '   F.NOME,'
      '   V.NOME'
      'FROM'
      '   RECEBER R'
      '   LEFT JOIN CLIENTE CLI ON CLI.CODIGO = R.CODCLIENTE'
      '   LEFT JOIN FORMAREC F ON F.CODIGO = R.CODPORTADOR'
      '   LEFT JOIN VENDEDOR V ON V.CODIGO = R.CODVENDEDOR1'
      'WHERE'
      '   R.CODIGO=:PCODIGO')
    SQLConnection = SQLConnectionRetaguarda
    Left = 252
    Top = 423
    object QReceberCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QReceberCODVENDA: TIntegerField
      FieldName = 'CODVENDA'
    end
    object QReceberDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 15
    end
    object QReceberNUMPARCELA: TStringField
      FieldName = 'NUMPARCELA'
      Size = 10
    end
    object QReceberCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object QReceberCODVENDEDOR1: TIntegerField
      FieldName = 'CODVENDEDOR1'
    end
    object QReceberCODVENDEDOR2: TIntegerField
      FieldName = 'CODVENDEDOR2'
    end
    object QReceberCOMISSAO1: TFMTBCDField
      FieldName = 'COMISSAO1'
      Precision = 15
      Size = 2
    end
    object QReceberCOMISSAO2: TFMTBCDField
      FieldName = 'COMISSAO2'
      Precision = 15
      Size = 2
    end
    object QReceberDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
    end
    object QReceberDATAVENCIMENTO: TDateField
      FieldName = 'DATAVENCIMENTO'
    end
    object QReceberDATAPAGAMENTO: TDateField
      FieldName = 'DATAPAGAMENTO'
    end
    object QReceberVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object QReceberVALORRECEBIDO: TFMTBCDField
      FieldName = 'VALORRECEBIDO'
      Precision = 15
      Size = 2
    end
    object QReceberHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 50
    end
    object QReceberCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 30
    end
    object QReceberCOBRANCA: TStringField
      FieldName = 'COBRANCA'
      Size = 1
    end
    object QReceberJUSTICA: TStringField
      FieldName = 'JUSTICA'
      Size = 1
    end
    object QReceberARQUIVOMORTO: TStringField
      FieldName = 'ARQUIVOMORTO'
      Size = 1
    end
    object QReceberDEVOLUCAO: TStringField
      FieldName = 'DEVOLUCAO'
      Size = 1
    end
    object QReceberCODPORTADOR: TIntegerField
      FieldName = 'CODPORTADOR'
    end
    object QReceberNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 50
    end
    object QReceberNOME_1: TStringField
      FieldName = 'NOME_1'
      ProviderFlags = []
      Size = 40
    end
    object QReceberNOME_2: TStringField
      FieldName = 'NOME_2'
      ProviderFlags = []
      Size = 50
    end
    object QReceberCODRECEBIMENTO: TStringField
      FieldName = 'CODRECEBIMENTO'
    end
    object QReceberCODREMESSA: TIntegerField
      FieldName = 'CODREMESSA'
    end
    object QReceberCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
    end
    object QReceberCODBAIRRO: TIntegerField
      FieldName = 'CODBAIRRO'
    end
    object QReceberCANCELADO: TStringField
      FieldName = 'CANCELADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QReceberREPARCELADO: TStringField
      FieldName = 'REPARCELADO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object DstReceber: TDataSetProvider
    DataSet = QReceber
    Options = [poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = DstReceberBeforeUpdateRecord
    Left = 280
    Top = 423
  end
  object TReceber: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'DstReceber'
    AfterInsert = TReceberAfterInsert
    AfterPost = TReceberAfterPost
    OnNewRecord = TReceberNewRecord
    Left = 307
    Top = 423
    object TReceberCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TReceberCODVENDA: TIntegerField
      FieldName = 'CODVENDA'
    end
    object TReceberDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 15
    end
    object TReceberNUMPARCELA: TStringField
      FieldName = 'NUMPARCELA'
      Size = 10
    end
    object TReceberCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      DisplayFormat = '00000'
    end
    object TReceberCODVENDEDOR1: TIntegerField
      FieldName = 'CODVENDEDOR1'
      DisplayFormat = '00000'
    end
    object TReceberCODVENDEDOR2: TIntegerField
      FieldName = 'CODVENDEDOR2'
    end
    object TReceberCOMISSAO1: TFMTBCDField
      FieldName = 'COMISSAO1'
      Precision = 15
      Size = 2
    end
    object TReceberCOMISSAO2: TFMTBCDField
      FieldName = 'COMISSAO2'
      Precision = 15
      Size = 2
    end
    object TReceberDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      EditMask = '!##/##/####;1; '
    end
    object TReceberDATAVENCIMENTO: TDateField
      FieldName = 'DATAVENCIMENTO'
      EditMask = '!##/##/####;1; '
    end
    object TReceberDATAPAGAMENTO: TDateField
      FieldName = 'DATAPAGAMENTO'
    end
    object TReceberVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '##,###0.00'
      Precision = 15
      Size = 2
    end
    object TReceberVALORRECEBIDO: TFMTBCDField
      FieldName = 'VALORRECEBIDO'
      Precision = 15
      Size = 2
    end
    object TReceberHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 50
    end
    object TReceberCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 30
    end
    object TReceberCOBRANCA: TStringField
      FieldName = 'COBRANCA'
      Size = 1
    end
    object TReceberJUSTICA: TStringField
      FieldName = 'JUSTICA'
      Size = 1
    end
    object TReceberARQUIVOMORTO: TStringField
      FieldName = 'ARQUIVOMORTO'
      Size = 1
    end
    object TReceberDEVOLUCAO: TStringField
      FieldName = 'DEVOLUCAO'
      Size = 1
    end
    object TReceberCODPORTADOR: TIntegerField
      FieldName = 'CODPORTADOR'
      DisplayFormat = '00000'
    end
    object TReceberNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 50
    end
    object TReceberNOME_1: TStringField
      FieldName = 'NOME_1'
      ProviderFlags = []
      Size = 40
    end
    object TReceberNOME_2: TStringField
      FieldName = 'NOME_2'
      ProviderFlags = []
      Size = 50
    end
    object TReceberCODRECEBIMENTO: TStringField
      FieldName = 'CODRECEBIMENTO'
    end
    object TReceberCODREMESSA: TIntegerField
      FieldName = 'CODREMESSA'
    end
    object TReceberCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
    end
    object TReceberCODBAIRRO: TIntegerField
      FieldName = 'CODBAIRRO'
    end
    object TReceberCANCELADO: TStringField
      FieldName = 'CANCELADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TReceberREPARCELADO: TStringField
      FieldName = 'REPARCELADO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object QVenda: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODVENDA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  CODVENDA,'
      '  DATAEMISSAO,'
      '  SAIDA,'
      '  NUMERO_ECF,'
      '  NUMERO_CUPOM,'
      '  CODCLIENTE,'
      '  COD_OPERADOR_PDV,'
      '  CODVENDEDOR1,'
      '  COMISSAO1,'
      '  SUBTOTAL,'
      '  FINANCEIRO,'
      '  PERCFINANCEIRO, '
      '  DESCONTO,'
      '  PERCDESCONTO,'
      '  TOTAL,'
      '  TOTALCUSTO,'
      '  NUMPGTO,'
      '  TIPO,'
      '  DINHEIRO,'
      '  CHEQUE,'
      '  CHEQUE_PRE,'
      '  CREDIARIO,'
      '  CARTAO,'
      '  TICKET,'
      '  TROCO,'
      '  ENTREGAFUTURA,'
      '  ENTREGACOMPLETA,'
      '  SERVICO,'
      '  GEROUFINANCEIRO,'
      '  PDV,'
      '  CODIGO_VENDA_PDV,'
      '  CANCELADO,'
      '  CODPORTADOR,'
      '  CODCIDADE,'
      '  CODBAIRRO,'
      '  BASE_ICMS,'
      '  VALOR_ICMS,'
      '  IMPRIMIU_COO_ATRAVES_DAV,'
      '  NUM_CCF_CUPOM,'
      '  MODELO_NF,'
      '  SERIE_NF'
      'FROM'
      '  VENDA'
      'WHERE'
      '  CODVENDA=:CODVENDA'
      '  '
      '  '
      '   ')
    SQLConnection = SQLConnectionRetaguarda
    Left = 10
    Top = 422
    object QVendaCODVENDA: TIntegerField
      FieldName = 'CODVENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QVendaDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Required = True
    end
    object QVendaSAIDA: TTimeField
      FieldName = 'SAIDA'
    end
    object QVendaNUMERO_CUPOM: TIntegerField
      FieldName = 'NUMERO_CUPOM'
    end
    object QVendaCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Required = True
    end
    object QVendaCOD_OPERADOR_PDV: TIntegerField
      FieldName = 'COD_OPERADOR_PDV'
    end
    object QVendaCODVENDEDOR1: TIntegerField
      FieldName = 'CODVENDEDOR1'
    end
    object QVendaCOMISSAO1: TFMTBCDField
      FieldName = 'COMISSAO1'
      Precision = 15
      Size = 2
    end
    object QVendaSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Precision = 15
      Size = 2
    end
    object QVendaFINANCEIRO: TFMTBCDField
      FieldName = 'FINANCEIRO'
      Precision = 15
      Size = 5
    end
    object QVendaPERCFINANCEIRO: TFMTBCDField
      FieldName = 'PERCFINANCEIRO'
      Precision = 15
      Size = 5
    end
    object QVendaDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 15
      Size = 5
    end
    object QVendaPERCDESCONTO: TFMTBCDField
      FieldName = 'PERCDESCONTO'
      Precision = 15
      Size = 5
    end
    object QVendaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
      Size = 2
    end
    object QVendaTOTALCUSTO: TFMTBCDField
      FieldName = 'TOTALCUSTO'
      Precision = 15
      Size = 2
    end
    object QVendaNUMPGTO: TIntegerField
      FieldName = 'NUMPGTO'
    end
    object QVendaTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 1
    end
    object QVendaDINHEIRO: TFMTBCDField
      FieldName = 'DINHEIRO'
      Precision = 15
      Size = 2
    end
    object QVendaCHEQUE: TFMTBCDField
      FieldName = 'CHEQUE'
      Precision = 15
      Size = 2
    end
    object QVendaCREDIARIO: TFMTBCDField
      FieldName = 'CREDIARIO'
      Precision = 15
      Size = 2
    end
    object QVendaCARTAO: TFMTBCDField
      FieldName = 'CARTAO'
      Precision = 15
      Size = 2
    end
    object QVendaTICKET: TFMTBCDField
      FieldName = 'TICKET'
      Precision = 15
      Size = 2
    end
    object QVendaTROCO: TFMTBCDField
      FieldName = 'TROCO'
      Precision = 15
      Size = 2
    end
    object QVendaENTREGAFUTURA: TStringField
      FieldName = 'ENTREGAFUTURA'
      Size = 1
    end
    object QVendaENTREGACOMPLETA: TStringField
      FieldName = 'ENTREGACOMPLETA'
      Size = 1
    end
    object QVendaSERVICO: TStringField
      FieldName = 'SERVICO'
      Size = 1
    end
    object QVendaGEROUFINANCEIRO: TStringField
      FieldName = 'GEROUFINANCEIRO'
      Size = 1
    end
    object QVendaPDV: TStringField
      FieldName = 'PDV'
      FixedChar = True
      Size = 3
    end
    object QVendaCODIGO_VENDA_PDV: TIntegerField
      FieldName = 'CODIGO_VENDA_PDV'
    end
    object QVendaCHEQUE_PRE: TFMTBCDField
      FieldName = 'CHEQUE_PRE'
      Precision = 15
      Size = 2
    end
    object QVendaCODPORTADOR: TIntegerField
      FieldName = 'CODPORTADOR'
      Required = True
    end
    object QVendaCANCELADO: TStringField
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object QVendaCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
    end
    object QVendaCODBAIRRO: TIntegerField
      FieldName = 'CODBAIRRO'
    end
    object QVendaNUMERO_ECF: TStringField
      FieldName = 'NUMERO_ECF'
    end
    object QVendaBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Precision = 15
      Size = 2
    end
    object QVendaVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 15
      Size = 2
    end
    object QVendaIMPRIMIU_COO_ATRAVES_DAV: TStringField
      FieldName = 'IMPRIMIU_COO_ATRAVES_DAV'
      FixedChar = True
      Size = 1
    end
    object QVendaNUM_CCF_CUPOM: TIntegerField
      FieldName = 'NUM_CCF_CUPOM'
    end
    object QVendaMODELO_NF: TStringField
      FieldName = 'MODELO_NF'
      Size = 2
    end
    object QVendaSERIE_NF: TStringField
      FieldName = 'SERIE_NF'
      Size = 10
    end
  end
  object dspVenda: TDataSetProvider
    DataSet = QVenda
    Options = [poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspVendaBeforeUpdateRecord
    Left = 38
    Top = 422
  end
  object TVenda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODVENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspVenda'
    AfterInsert = TVendaAfterInsert
    AfterPost = TVendaAfterPost
    OnNewRecord = TVendaNewRecord
    Left = 65
    Top = 422
    object TVendaCODVENDA: TIntegerField
      FieldName = 'CODVENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TVendaDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Required = True
    end
    object TVendaSAIDA: TTimeField
      FieldName = 'SAIDA'
    end
    object TVendaNUMERO_CUPOM: TIntegerField
      FieldName = 'NUMERO_CUPOM'
    end
    object TVendaCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Required = True
    end
    object TVendaCOD_OPERADOR_PDV: TIntegerField
      FieldName = 'COD_OPERADOR_PDV'
    end
    object TVendaCODVENDEDOR1: TIntegerField
      FieldName = 'CODVENDEDOR1'
    end
    object TVendaCOMISSAO1: TFMTBCDField
      FieldName = 'COMISSAO1'
      Precision = 15
      Size = 2
    end
    object TVendaSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Precision = 15
      Size = 2
    end
    object TVendaFINANCEIRO: TFMTBCDField
      FieldName = 'FINANCEIRO'
      Precision = 15
      Size = 5
    end
    object TVendaPERCFINANCEIRO: TFMTBCDField
      FieldName = 'PERCFINANCEIRO'
      Precision = 15
      Size = 5
    end
    object TVendaDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 15
      Size = 5
    end
    object TVendaPERCDESCONTO: TFMTBCDField
      FieldName = 'PERCDESCONTO'
      Precision = 15
      Size = 5
    end
    object TVendaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
      Size = 2
    end
    object TVendaTOTALCUSTO: TFMTBCDField
      FieldName = 'TOTALCUSTO'
      Precision = 15
      Size = 2
    end
    object TVendaNUMPGTO: TIntegerField
      FieldName = 'NUMPGTO'
    end
    object TVendaTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 1
    end
    object TVendaDINHEIRO: TFMTBCDField
      FieldName = 'DINHEIRO'
      Precision = 15
      Size = 2
    end
    object TVendaCHEQUE: TFMTBCDField
      FieldName = 'CHEQUE'
      Precision = 15
      Size = 2
    end
    object TVendaCHEQUE_PRE: TFMTBCDField
      FieldName = 'CHEQUE_PRE'
      Precision = 15
      Size = 2
    end
    object TVendaCREDIARIO: TFMTBCDField
      FieldName = 'CREDIARIO'
      Precision = 15
      Size = 2
    end
    object TVendaCARTAO: TFMTBCDField
      FieldName = 'CARTAO'
      Precision = 15
      Size = 2
    end
    object TVendaTICKET: TFMTBCDField
      FieldName = 'TICKET'
      Precision = 15
      Size = 2
    end
    object TVendaTROCO: TFMTBCDField
      FieldName = 'TROCO'
      Precision = 15
      Size = 2
    end
    object TVendaENTREGAFUTURA: TStringField
      FieldName = 'ENTREGAFUTURA'
      Size = 1
    end
    object TVendaENTREGACOMPLETA: TStringField
      FieldName = 'ENTREGACOMPLETA'
      Size = 1
    end
    object TVendaSERVICO: TStringField
      FieldName = 'SERVICO'
      Size = 1
    end
    object TVendaGEROUFINANCEIRO: TStringField
      FieldName = 'GEROUFINANCEIRO'
      Size = 1
    end
    object TVendaPDV: TStringField
      FieldName = 'PDV'
      FixedChar = True
      Size = 3
    end
    object TVendaCODIGO_VENDA_PDV: TIntegerField
      FieldName = 'CODIGO_VENDA_PDV'
    end
    object TVendaCODPORTADOR: TIntegerField
      FieldName = 'CODPORTADOR'
      Required = True
    end
    object TVendaQItemVenda: TDataSetField
      FieldName = 'QItemVenda'
    end
    object TVendaCANCELADO: TStringField
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object TVendaCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
    end
    object TVendaCODBAIRRO: TIntegerField
      FieldName = 'CODBAIRRO'
    end
    object TVendaNUMERO_ECF: TStringField
      FieldName = 'NUMERO_ECF'
    end
    object TVendaBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Precision = 15
      Size = 2
    end
    object TVendaVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 15
      Size = 2
    end
    object TVendaIMPRIMIU_COO_ATRAVES_DAV: TStringField
      FieldName = 'IMPRIMIU_COO_ATRAVES_DAV'
      FixedChar = True
      Size = 1
    end
    object TVendaNUM_CCF_CUPOM: TIntegerField
      FieldName = 'NUM_CCF_CUPOM'
    end
    object TVendaMODELO_NF: TStringField
      FieldName = 'MODELO_NF'
      Size = 2
    end
    object TVendaSERIE_NF: TStringField
      FieldName = 'SERIE_NF'
      Size = 10
    end
  end
  object dsVenda: TDataSource
    DataSet = QVenda
    Left = 108
    Top = 422
  end
  object QItemVenda: TSQLQuery
    DataSource = dsVenda
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODVENDA'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'SELECT'
      '  CONTROLE,'
      '  CODVENDA,'
      '  NUMERO_ECF,'
      '  NUMERO_CUPOM,'
      '  ITEM,'
      '  CODPRODUTO,'
      '  DESCRICAO,'
      '  DATAEMISSAO,'
      '  TIPO,'
      '  CODCLIENTE,'
      '  CODVENDEDOR1,'
      '  COMISSAO1,'
      '  QTDE,'
      '  PRECOFIXO,'
      '  VENDIDO,'
      '  TOTALITEN,'
      '  TABELA,'
      '  CODGRUPO,'
      '  CODMARCA,'
      '  MAODEOBRA,'
      '  CUSTOFINAL,'
      '  TOTALCUSTO,'
      '  SERVICO,'
      '  COMNOTA,'
      '  CANCELADO,'
      '  ST,'
      '  ALIQUOTA,'
      '  IPI,'
      '  BASE_ICMS,'
      '  VALOR_ICMS,'
      '  VALOR_UNIT_BRUTO,'
      '  VALOR_TOTAL_BRUTO,'
      '  PERC_DESCONTO,'
      '  VALOR_DESCONTO,'
      '  PERC_ACRESCIMO,'
      '  VALOR_ACRESCIMO,'
      '  CST'
      'FROM'
      '  ITEMVENDA'
      'WHERE'
      '  CODVENDA=:CODVENDA'
      '  ')
    SQLConnection = SQLConnectionRetaguarda
    Left = 162
    Top = 423
    object QItemVendaCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QItemVendaCODVENDA: TIntegerField
      FieldName = 'CODVENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QItemVendaNUMERO_CUPOM: TIntegerField
      FieldName = 'NUMERO_CUPOM'
    end
    object QItemVendaITEM: TIntegerField
      FieldName = 'ITEM'
    end
    object QItemVendaCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
      Required = True
    end
    object QItemVendaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object QItemVendaDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
    end
    object QItemVendaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object QItemVendaCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Required = True
    end
    object QItemVendaCODVENDEDOR1: TIntegerField
      FieldName = 'CODVENDEDOR1'
    end
    object QItemVendaCOMISSAO1: TFMTBCDField
      FieldName = 'COMISSAO1'
      Precision = 15
      Size = 2
    end
    object QItemVendaPRECOFIXO: TFMTBCDField
      FieldName = 'PRECOFIXO'
      Precision = 15
      Size = 2
    end
    object QItemVendaQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 15
      Size = 3
    end
    object QItemVendaVENDIDO: TFMTBCDField
      FieldName = 'VENDIDO'
      Precision = 15
      Size = 2
    end
    object QItemVendaTOTALITEN: TFMTBCDField
      FieldName = 'TOTALITEN'
      Precision = 15
      Size = 2
    end
    object QItemVendaTABELA: TStringField
      FieldName = 'TABELA'
      Size = 1
    end
    object QItemVendaCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
    end
    object QItemVendaCODMARCA: TIntegerField
      FieldName = 'CODMARCA'
    end
    object QItemVendaMAODEOBRA: TStringField
      FieldName = 'MAODEOBRA'
      Size = 1
    end
    object QItemVendaCUSTOFINAL: TFMTBCDField
      FieldName = 'CUSTOFINAL'
      Precision = 15
      Size = 2
    end
    object QItemVendaTOTALCUSTO: TFMTBCDField
      FieldName = 'TOTALCUSTO'
      Precision = 15
      Size = 2
    end
    object QItemVendaSERVICO: TStringField
      FieldName = 'SERVICO'
      Size = 1
    end
    object QItemVendaCOMNOTA: TStringField
      FieldName = 'COMNOTA'
      Size = 1
    end
    object QItemVendaCANCELADO: TStringField
      FieldName = 'CANCELADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QItemVendaNUMERO_ECF: TStringField
      FieldName = 'NUMERO_ECF'
    end
    object QItemVendaALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 15
      Size = 2
    end
    object QItemVendaIPI: TFMTBCDField
      FieldName = 'IPI'
      Precision = 15
      Size = 2
    end
    object QItemVendaBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Precision = 15
      Size = 2
    end
    object QItemVendaVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 15
      Size = 2
    end
    object QItemVendaPERC_DESCONTO: TFMTBCDField
      FieldName = 'PERC_DESCONTO'
      Precision = 15
      Size = 6
    end
    object QItemVendaVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      Precision = 15
      Size = 2
    end
    object QItemVendaPERC_ACRESCIMO: TFMTBCDField
      FieldName = 'PERC_ACRESCIMO'
      Precision = 15
      Size = 6
    end
    object QItemVendaVALOR_ACRESCIMO: TFMTBCDField
      FieldName = 'VALOR_ACRESCIMO'
      Precision = 15
      Size = 2
    end
    object QItemVendaVALOR_UNIT_BRUTO: TFMTBCDField
      FieldName = 'VALOR_UNIT_BRUTO'
      Precision = 15
      Size = 2
    end
    object QItemVendaVALOR_TOTAL_BRUTO: TFMTBCDField
      FieldName = 'VALOR_TOTAL_BRUTO'
      Precision = 15
      Size = 2
    end
    object QItemVendaST: TStringField
      FieldName = 'ST'
      FixedChar = True
      Size = 5
    end
    object QItemVendaCST: TStringField
      FieldName = 'CST'
      Size = 5
    end
  end
  object TItemVenda: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    DataSetField = TVendaQItemVenda
    Params = <>
    AfterInsert = TItemVendaAfterInsert
    Left = 191
    Top = 423
    object TItemVendaCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      Required = True
    end
    object TItemVendaCODVENDA: TIntegerField
      FieldName = 'CODVENDA'
      Required = True
    end
    object TItemVendaNUMERO_CUPOM: TIntegerField
      FieldName = 'NUMERO_CUPOM'
    end
    object TItemVendaITEM: TIntegerField
      FieldName = 'ITEM'
    end
    object TItemVendaCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
      Required = True
    end
    object TItemVendaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object TItemVendaDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
    end
    object TItemVendaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object TItemVendaCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Required = True
    end
    object TItemVendaCODVENDEDOR1: TIntegerField
      FieldName = 'CODVENDEDOR1'
    end
    object TItemVendaCOMISSAO1: TFMTBCDField
      FieldName = 'COMISSAO1'
      Precision = 15
      Size = 2
    end
    object TItemVendaQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 15
      Size = 3
    end
    object TItemVendaPRECOFIXO: TFMTBCDField
      FieldName = 'PRECOFIXO'
      Precision = 15
      Size = 2
    end
    object TItemVendaVENDIDO: TFMTBCDField
      FieldName = 'VENDIDO'
      Precision = 15
      Size = 2
    end
    object TItemVendaTOTALITEN: TFMTBCDField
      FieldName = 'TOTALITEN'
      Precision = 15
      Size = 2
    end
    object TItemVendaTABELA: TStringField
      FieldName = 'TABELA'
      Size = 1
    end
    object TItemVendaCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
    end
    object TItemVendaCODMARCA: TIntegerField
      FieldName = 'CODMARCA'
    end
    object TItemVendaMAODEOBRA: TStringField
      FieldName = 'MAODEOBRA'
      Size = 1
    end
    object TItemVendaCUSTOFINAL: TFMTBCDField
      FieldName = 'CUSTOFINAL'
      Precision = 15
      Size = 2
    end
    object TItemVendaTOTALCUSTO: TFMTBCDField
      FieldName = 'TOTALCUSTO'
      Precision = 15
      Size = 2
    end
    object TItemVendaSERVICO: TStringField
      FieldName = 'SERVICO'
      Size = 1
    end
    object TItemVendaCOMNOTA: TStringField
      FieldName = 'COMNOTA'
      Size = 1
    end
    object TItemVendaCANCELADO: TStringField
      FieldName = 'CANCELADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TItemVendaNUMERO_ECF: TStringField
      FieldName = 'NUMERO_ECF'
    end
    object TItemVendaALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 15
      Size = 2
    end
    object TItemVendaIPI: TFMTBCDField
      FieldName = 'IPI'
      Precision = 15
      Size = 2
    end
    object TItemVendaBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Precision = 15
      Size = 2
    end
    object TItemVendaVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 15
      Size = 2
    end
    object TItemVendaPERC_DESCONTO: TFMTBCDField
      FieldName = 'PERC_DESCONTO'
      Precision = 15
      Size = 6
    end
    object TItemVendaVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      Precision = 15
      Size = 2
    end
    object TItemVendaPERC_ACRESCIMO: TFMTBCDField
      FieldName = 'PERC_ACRESCIMO'
      Precision = 15
      Size = 6
    end
    object TItemVendaVALOR_ACRESCIMO: TFMTBCDField
      FieldName = 'VALOR_ACRESCIMO'
      Precision = 15
      Size = 2
    end
    object TItemVendaVALOR_UNIT_BRUTO: TFMTBCDField
      FieldName = 'VALOR_UNIT_BRUTO'
      Precision = 15
      Size = 2
    end
    object TItemVendaVALOR_TOTAL_BRUTO: TFMTBCDField
      FieldName = 'VALOR_TOTAL_BRUTO'
      Precision = 15
      Size = 2
    end
    object TItemVendaST: TStringField
      FieldName = 'ST'
      FixedChar = True
      Size = 5
    end
    object TItemVendaCST: TStringField
      FieldName = 'CST'
      Size = 5
    end
    object TItemVendaSUM_TOTAL: TAggregateField
      FieldName = 'SUM_TOTAL'
      Active = True
      Expression = 'SUM(TOTALITEN)'
    end
  end
  object QSecao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  NOME'
      'FROM'
      '  SECAO')
    SQLConnection = SQLConnectionLocal
    Left = 386
    Top = 265
    object QSecaoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QSecaoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
  end
  object dspSecao: TDataSetProvider
    DataSet = QSecao
    UpdateMode = upWhereKeyOnly
    Left = 418
    Top = 265
  end
  object TSecao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSecao'
    Left = 450
    Top = 265
    object TSecaoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      DisplayFormat = '00000'
    end
    object TSecaoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
  end
  object QAgBancaria: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT '
      '  CODIGO, '
      '  NOME'
      'FROM '
      '  AGBANCARIA'
      'ORDER BY '
      '  NOME')
    SQLConnection = SQLConnectionRetaguarda
    Left = 366
    Top = 423
    object QAgBancariaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QAgBancariaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 35
    end
  end
  object DstAgBancaria: TDataSetProvider
    DataSet = QAgBancaria
    UpdateMode = upWhereKeyOnly
    Left = 394
    Top = 423
  end
  object TAgBancaria: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DstAgBancaria'
    Left = 422
    Top = 423
    object TAgBancariaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      DisplayFormat = '00000'
    end
    object TAgBancariaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 35
    end
  end
  object QChequeBaixar: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '   CODIGO,'
      '   CODBANCO,'
      '   NUMAGENCIA,'
      '   NUMCONTA,'
      '   NUMCHEQUE,'
      '   TITULAR,'
      '   CODCLIENTE,'
      '   DATAEMISSAO,'
      '   DATAVENCIMENTO,'
      '   VALOR,'
      '   CODVENDA,'
      '   CODVENDEDOR1,'
      '   CODVENDEDOR2,'
      '   COMISSAO1,'
      '   COMISSAO2,'
      '   CIDADE,'
      '   CPF,'
      '   CGC,'
      '   CODVERIFICA,'
      '   CODREMESSA,'
      '   REPARCELADO,'
      '   CODCIDADE,'
      '   CODBAIRRO,'
      '   CANCELADO'
      'FROM'
      '   CLICHEQUEABAIXAR'
      'WHERE'
      '   CODIGO=:PCODIGO'
      ''
      ''
      '')
    SQLConnection = SQLConnectionRetaguarda
    Left = 494
    Top = 423
    object QChequeBaixarCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QChequeBaixarCODBANCO: TIntegerField
      FieldName = 'CODBANCO'
      Required = True
    end
    object QChequeBaixarNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      Size = 10
    end
    object QChequeBaixarNUMCONTA: TStringField
      FieldName = 'NUMCONTA'
      Size = 10
    end
    object QChequeBaixarNUMCHEQUE: TStringField
      FieldName = 'NUMCHEQUE'
      Size = 10
    end
    object QChequeBaixarTITULAR: TStringField
      FieldName = 'TITULAR'
      Size = 50
    end
    object QChequeBaixarCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Required = True
    end
    object QChequeBaixarDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Required = True
    end
    object QChequeBaixarDATAVENCIMENTO: TDateField
      FieldName = 'DATAVENCIMENTO'
      Required = True
    end
    object QChequeBaixarVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object QChequeBaixarCODVENDA: TIntegerField
      FieldName = 'CODVENDA'
    end
    object QChequeBaixarCODVENDEDOR1: TIntegerField
      FieldName = 'CODVENDEDOR1'
    end
    object QChequeBaixarCODVENDEDOR2: TIntegerField
      FieldName = 'CODVENDEDOR2'
    end
    object QChequeBaixarCOMISSAO1: TFMTBCDField
      FieldName = 'COMISSAO1'
      Precision = 15
      Size = 2
    end
    object QChequeBaixarCOMISSAO2: TFMTBCDField
      FieldName = 'COMISSAO2'
      Precision = 15
      Size = 2
    end
    object QChequeBaixarCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object QChequeBaixarCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object QChequeBaixarCGC: TStringField
      FieldName = 'CGC'
      Size = 15
    end
    object QChequeBaixarCODVERIFICA: TStringField
      FieldName = 'CODVERIFICA'
    end
    object QChequeBaixarCODREMESSA: TIntegerField
      FieldName = 'CODREMESSA'
    end
    object QChequeBaixarREPARCELADO: TStringField
      FieldName = 'REPARCELADO'
      Size = 1
    end
    object QChequeBaixarCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
    end
    object QChequeBaixarCODBAIRRO: TIntegerField
      FieldName = 'CODBAIRRO'
    end
    object QChequeBaixarCANCELADO: TStringField
      FieldName = 'CANCELADO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object DstChequeBaixar: TDataSetProvider
    DataSet = QChequeBaixar
    Options = [poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = DstChequeBaixarBeforeUpdateRecord
    Left = 522
    Top = 423
  end
  object TChequeBaixar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'DstChequeBaixar'
    AfterInsert = TChequeBaixarAfterInsert
    AfterPost = TChequeBaixarAfterPost
    OnNewRecord = TChequeBaixarNewRecord
    Left = 550
    Top = 423
    object TChequeBaixarCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TChequeBaixarCODBANCO: TIntegerField
      FieldName = 'CODBANCO'
      Required = True
    end
    object TChequeBaixarNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      Size = 10
    end
    object TChequeBaixarNUMCONTA: TStringField
      FieldName = 'NUMCONTA'
      Size = 10
    end
    object TChequeBaixarNUMCHEQUE: TStringField
      FieldName = 'NUMCHEQUE'
      Size = 10
    end
    object TChequeBaixarTITULAR: TStringField
      FieldName = 'TITULAR'
      Size = 50
    end
    object TChequeBaixarCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Required = True
    end
    object TChequeBaixarDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Required = True
    end
    object TChequeBaixarDATAVENCIMENTO: TDateField
      FieldName = 'DATAVENCIMENTO'
      Required = True
    end
    object TChequeBaixarVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object TChequeBaixarCODVENDA: TIntegerField
      FieldName = 'CODVENDA'
    end
    object TChequeBaixarCODVENDEDOR1: TIntegerField
      FieldName = 'CODVENDEDOR1'
    end
    object TChequeBaixarCODVENDEDOR2: TIntegerField
      FieldName = 'CODVENDEDOR2'
    end
    object TChequeBaixarCOMISSAO1: TFMTBCDField
      FieldName = 'COMISSAO1'
      Precision = 15
      Size = 2
    end
    object TChequeBaixarCOMISSAO2: TFMTBCDField
      FieldName = 'COMISSAO2'
      Precision = 15
      Size = 2
    end
    object TChequeBaixarCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object TChequeBaixarCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object TChequeBaixarCGC: TStringField
      FieldName = 'CGC'
      Size = 15
    end
    object TChequeBaixarCODVERIFICA: TStringField
      FieldName = 'CODVERIFICA'
    end
    object TChequeBaixarCODREMESSA: TIntegerField
      FieldName = 'CODREMESSA'
    end
    object TChequeBaixarREPARCELADO: TStringField
      FieldName = 'REPARCELADO'
      Size = 1
    end
    object TChequeBaixarCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
    end
    object TChequeBaixarCODBAIRRO: TIntegerField
      FieldName = 'CODBAIRRO'
    end
    object TChequeBaixarCANCELADO: TStringField
      FieldName = 'CANCELADO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object QBuscaDAV: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '  O.CODIGO,'
      '  O.DTEMISSAO,'
      '  O.CODCLIENTE,'
      '  O.NOMECLIENTE,'
      '  O.CODVENDEDOR,'
      '  O.DESCONTO,'
      '  O.VALOR,'
      '  O.TOTALCUSTO,'
      '  O.OBS,'
      '  O.NUMERO_DAV,'
      '  O.VALIDADE,'
      '  O.SITUACAO,'
      '  O.ALTERADO,'
      '  O.HORA,'
      '  O.FLAG,'
      '  O.NUMERO_FLAG,'
      '  V.NOME'
      'FROM'
      '  ORCAMENTO O '
      '  LEFT JOIN VENDEDOR V ON V.CODIGO = O.CODVENDEDOR')
    SQLConnection = SQLConnectionRetaguarda
    Left = 20
    Top = 477
  end
  object dspBuscaDAV: TDataSetProvider
    DataSet = QBuscaDAV
    Left = 48
    Top = 477
  end
  object TBuscaDAV: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBuscaDAV'
    OnCalcFields = TBuscaDAVCalcFields
    Left = 75
    Top = 477
    object TBuscaDAVCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TBuscaDAVDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object TBuscaDAVCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object TBuscaDAVNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      Size = 50
    end
    object TBuscaDAVCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
    end
    object TBuscaDAVSUBTOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SUBTOTAL'
      DisplayFormat = '##,###0.00'
    end
    object TBuscaDAVDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      DisplayFormat = '##,###0.00'
      Precision = 15
      Size = 5
    end
    object TBuscaDAVVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '##,###0.00'
      Precision = 15
      Size = 2
    end
    object TBuscaDAVTOTALCUSTO: TFMTBCDField
      FieldName = 'TOTALCUSTO'
      Precision = 15
      Size = 2
    end
    object TBuscaDAVOBS: TStringField
      FieldName = 'OBS'
      Size = 100
    end
    object TBuscaDAVNUMERO_DAV: TIntegerField
      FieldName = 'NUMERO_DAV'
      DisplayFormat = '00000000000000'
    end
    object TBuscaDAVVALIDADE: TDateField
      FieldName = 'VALIDADE'
    end
    object TBuscaDAVSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TBuscaDAVALTERADO: TStringField
      FieldName = 'ALTERADO'
      FixedChar = True
      Size = 1
    end
    object TBuscaDAVHORA: TTimeField
      FieldName = 'HORA'
    end
    object TBuscaDAVNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object TBuscaDAVFLAG: TSmallintField
      FieldName = 'FLAG'
      Required = True
    end
    object TBuscaDAVNUMERO_FLAG: TIntegerField
      FieldName = 'NUMERO_FLAG'
    end
  end
  object QBuscaItemDAV: TSQLQuery
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
      '  CODPRODUTO,'
      '  QTDE,'
      '  PRECO,'
      '  TOTALITEN,'
      '  CUSTO,'
      '  TABELA,'
      '  DESCRICAO'
      'FROM'
      '  ITEMORCAMENTO'
      'WHERE'
      '  CODIGO=:PCODIGO'
      '  ')
    SQLConnection = SQLConnectionRetaguarda
    Left = 107
    Top = 477
  end
  object dspBuscaItemDAV: TDataSetProvider
    DataSet = QBuscaItemDAV
    Left = 135
    Top = 477
  end
  object TBuscaItemDAV: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspBuscaItemDAV'
    Left = 162
    Top = 477
    object TBuscaItemDAVCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TBuscaItemDAVCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
      DisplayFormat = '00000000000000'
    end
    object TBuscaItemDAVQTDE: TFMTBCDField
      FieldName = 'QTDE'
      DisplayFormat = '0.000'
      Precision = 15
      Size = 3
    end
    object TBuscaItemDAVPRECO: TFMTBCDField
      FieldName = 'PRECO'
      DisplayFormat = '##,###0.00'
      Precision = 15
      Size = 2
    end
    object TBuscaItemDAVTOTALITEN: TFMTBCDField
      FieldName = 'TOTALITEN'
      DisplayFormat = '##,###0.00'
      Precision = 15
      Size = 2
    end
    object TBuscaItemDAVCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      Precision = 15
      Size = 2
    end
    object TBuscaItemDAVTABELA: TStringField
      FieldName = 'TABELA'
      Size = 1
    end
    object TBuscaItemDAVDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object QVendedor: TSQLQuery
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
      '  PERCCOMISSAOPRAZO,'
      '  PERCCOMISSAOVISTA,'
      '  INATIVO'
      'FROM'
      '  VENDEDOR'
      'WHERE'
      '  INATIVO=:PINATIVO'
      'ORDER BY '
      '  NOME')
    SQLConnection = SQLConnectionRetaguarda
    Left = 435
    Top = 476
    object QVendedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QVendedorNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QVendedorPERCCOMISSAOPRAZO: TFMTBCDField
      FieldName = 'PERCCOMISSAOPRAZO'
      Precision = 15
      Size = 2
    end
    object QVendedorPERCCOMISSAOVISTA: TFMTBCDField
      FieldName = 'PERCCOMISSAOVISTA'
      Precision = 15
      Size = 2
    end
    object QVendedorINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object DstVendedor: TDataSetProvider
    DataSet = QVendedor
    UpdateMode = upWhereKeyOnly
    Left = 463
    Top = 476
  end
  object TVendedor: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'PINATIVO'
        ParamType = ptInput
      end>
    ProviderName = 'DstVendedor'
    Left = 491
    Top = 476
    object TVendedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      DisplayFormat = '00000'
    end
    object TVendedorNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object TVendedorPERCCOMISSAOPRAZO: TFMTBCDField
      FieldName = 'PERCCOMISSAOPRAZO'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object TVendedorPERCCOMISSAOVISTA: TFMTBCDField
      FieldName = 'PERCCOMISSAOVISTA'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object TVendedorINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object QGenLocal: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnectionLocal
    Left = 129
    Top = 8
  end
  object QBaixaEstoqueLocal: TSQLQuery
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
      '  QTDE,'
      '  DATAULTVENDA'
      'FROM'
      '  ESTOQUE'
      'WHERE'
      '  CODIGO=:PCODIGO')
    SQLConnection = SQLConnectionLocal
    Left = 210
    Top = 9
    object QBaixaEstoqueLocalCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBaixaEstoqueLocalQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 15
      Size = 3
    end
    object QBaixaEstoqueLocalDATAULTVENDA: TDateField
      FieldName = 'DATAULTVENDA'
    end
  end
  object dspBaixaEstoqueLocal: TDataSetProvider
    DataSet = QBaixaEstoqueLocal
    UpdateMode = upWhereKeyOnly
    Left = 238
    Top = 9
  end
  object TBaixaEstoqueLocal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspBaixaEstoqueLocal'
    Left = 265
    Top = 9
    object TBaixaEstoqueLocalCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TBaixaEstoqueLocalQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 15
      Size = 3
    end
    object TBaixaEstoqueLocalDATAULTVENDA: TDateField
      FieldName = 'DATAULTVENDA'
    end
  end
  object QPesquisaBaseLocal: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnectionLocal
    Left = 368
    Top = 8
  end
  object QPesquisaBaseRemota: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnectionRetaguarda
    Left = 253
    Top = 375
  end
  object QRota: TSQLQuery
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
      '  HISTORICO,'
      '  CODPRODUTO,'
      '  DATA,'
      '  ANTERIOR,'
      '  ENTRADA,'
      '  SAIDA'
      'FROM'
      '  ROTATIVIDADE'
      'WHERE'
      '  CODIGO=:PCODIGO')
    SQLConnection = SQLConnectionRetaguarda
    Left = 524
    Top = 476
    object QRotaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QRotaHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 60
    end
    object QRotaCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object QRotaDATA: TDateField
      FieldName = 'DATA'
    end
    object QRotaANTERIOR: TFMTBCDField
      FieldName = 'ANTERIOR'
      Precision = 15
      Size = 2
    end
    object QRotaENTRADA: TFMTBCDField
      FieldName = 'ENTRADA'
      Precision = 15
      Size = 2
    end
    object QRotaSAIDA: TFMTBCDField
      FieldName = 'SAIDA'
      Precision = 15
      Size = 2
    end
  end
  object dspRota: TDataSetProvider
    DataSet = QRota
    Options = [poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspRotaBeforeUpdateRecord
    Left = 552
    Top = 476
  end
  object TRota: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspRota'
    OnNewRecord = TRotaNewRecord
    Left = 580
    Top = 476
    object TRotaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TRotaHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 60
    end
    object TRotaCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object TRotaDATA: TDateField
      FieldName = 'DATA'
    end
    object TRotaANTERIOR: TFMTBCDField
      FieldName = 'ANTERIOR'
      Precision = 15
      Size = 2
    end
    object TRotaENTRADA: TFMTBCDField
      FieldName = 'ENTRADA'
      Precision = 15
      Size = 2
    end
    object TRotaSAIDA: TFMTBCDField
      FieldName = 'SAIDA'
      Precision = 15
      Size = 2
    end
  end
  object QCaixa: TSQLQuery
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
      '  DATA,'
      '  HISTORICO,'
      '  ENTRADA,'
      '  SAIDA,'
      '  TIPO,'
      '  CODUSUARIO,'
      '  CODVENDA,'
      '  HORA,'
      '  TROCO,'
      '  DINHEIRO,'
      '  CHEQUE,'
      '  CARTAO,'
      '  TICKET,'
      '  CANCELADO'
      'FROM'
      '  CAIXA'
      'WHERE'
      '  CODIGO=:PCODIGO'
      '  '
      '  ')
    SQLConnection = SQLConnectionRetaguarda
    Left = 613
    Top = 476
    object QCaixaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QCaixaDATA: TDateField
      FieldName = 'DATA'
    end
    object QCaixaHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 100
    end
    object QCaixaENTRADA: TFMTBCDField
      FieldName = 'ENTRADA'
      Precision = 15
      Size = 2
    end
    object QCaixaSAIDA: TFMTBCDField
      FieldName = 'SAIDA'
      Precision = 15
      Size = 2
    end
    object QCaixaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 2
    end
    object QCaixaCODUSUARIO: TIntegerField
      FieldName = 'CODUSUARIO'
    end
    object QCaixaCODVENDA: TIntegerField
      FieldName = 'CODVENDA'
    end
    object QCaixaHORA: TTimeField
      FieldName = 'HORA'
    end
    object QCaixaTROCO: TFMTBCDField
      FieldName = 'TROCO'
      Precision = 15
      Size = 2
    end
    object QCaixaDINHEIRO: TFMTBCDField
      FieldName = 'DINHEIRO'
      Precision = 15
      Size = 2
    end
    object QCaixaCHEQUE: TFMTBCDField
      FieldName = 'CHEQUE'
      Precision = 15
      Size = 2
    end
    object QCaixaCARTAO: TFMTBCDField
      FieldName = 'CARTAO'
      Precision = 15
      Size = 2
    end
    object QCaixaTICKET: TFMTBCDField
      FieldName = 'TICKET'
      Precision = 15
      Size = 2
    end
    object QCaixaCANCELADO: TStringField
      FieldName = 'CANCELADO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dspCaixa: TDataSetProvider
    DataSet = QCaixa
    Options = [poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspCaixaBeforeUpdateRecord
    Left = 641
    Top = 476
  end
  object TCaixa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspCaixa'
    AfterInsert = TCaixaAfterInsert
    OnNewRecord = TCaixaNewRecord
    Left = 669
    Top = 476
    object TCaixaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TCaixaDATA: TDateField
      FieldName = 'DATA'
    end
    object TCaixaHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 100
    end
    object TCaixaENTRADA: TFMTBCDField
      FieldName = 'ENTRADA'
      Precision = 15
      Size = 2
    end
    object TCaixaSAIDA: TFMTBCDField
      FieldName = 'SAIDA'
      Precision = 15
      Size = 2
    end
    object TCaixaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 2
    end
    object TCaixaCODUSUARIO: TIntegerField
      FieldName = 'CODUSUARIO'
    end
    object TCaixaCODVENDA: TIntegerField
      FieldName = 'CODVENDA'
    end
    object TCaixaHORA: TTimeField
      FieldName = 'HORA'
    end
    object TCaixaTROCO: TFMTBCDField
      FieldName = 'TROCO'
      Precision = 15
      Size = 2
    end
    object TCaixaDINHEIRO: TFMTBCDField
      FieldName = 'DINHEIRO'
      Precision = 15
      Size = 2
    end
    object TCaixaCHEQUE: TFMTBCDField
      FieldName = 'CHEQUE'
      Precision = 15
      Size = 2
    end
    object TCaixaCARTAO: TFMTBCDField
      FieldName = 'CARTAO'
      Precision = 15
      Size = 2
    end
    object TCaixaTICKET: TFMTBCDField
      FieldName = 'TICKET'
      Precision = 15
      Size = 2
    end
    object TCaixaCANCELADO: TStringField
      FieldName = 'CANCELADO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object QCancelaFinanceiro: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnectionRetaguarda
    Left = 360
    Top = 375
  end
  object QForma_Pgto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  DESCRICAO,'
      '  ATALHO,'
      '  ABRE_GAVETA,'
      '  TEF,'
      '  GERA_CREDIARIO,'
      '  IMPRIMI_COMPROVANTE'
      'FROM'
      '  FORMA_PGTO')
    SQLConnection = SQLConnectionLocal
    Left = 454
    Top = 8
    object QForma_PgtoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QForma_PgtoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 25
    end
    object QForma_PgtoATALHO: TStringField
      FieldName = 'ATALHO'
      FixedChar = True
      Size = 2
    end
    object QForma_PgtoABRE_GAVETA: TStringField
      FieldName = 'ABRE_GAVETA'
      FixedChar = True
      Size = 3
    end
    object QForma_PgtoTEF: TStringField
      FieldName = 'TEF'
      FixedChar = True
      Size = 3
    end
    object QForma_PgtoGERA_CREDIARIO: TStringField
      FieldName = 'GERA_CREDIARIO'
      FixedChar = True
      Size = 3
    end
    object QForma_PgtoIMPRIMI_COMPROVANTE: TStringField
      FieldName = 'IMPRIMI_COMPROVANTE'
      FixedChar = True
      Size = 3
    end
  end
  object dspForma_Pgto: TDataSetProvider
    DataSet = QForma_Pgto
    UpdateMode = upWhereKeyOnly
    Left = 482
    Top = 8
  end
  object TForma_Pgto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspForma_Pgto'
    Left = 509
    Top = 8
    object TForma_PgtoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TForma_PgtoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 25
    end
    object TForma_PgtoATALHO: TStringField
      FieldName = 'ATALHO'
      FixedChar = True
      Size = 2
    end
    object TForma_PgtoABRE_GAVETA: TStringField
      FieldName = 'ABRE_GAVETA'
      FixedChar = True
      Size = 3
    end
    object TForma_PgtoTEF: TStringField
      FieldName = 'TEF'
      FixedChar = True
      Size = 3
    end
    object TForma_PgtoGERA_CREDIARIO: TStringField
      FieldName = 'GERA_CREDIARIO'
      FixedChar = True
      Size = 3
    end
    object TForma_PgtoIMPRIMI_COMPROVANTE: TStringField
      FieldName = 'IMPRIMI_COMPROVANTE'
      FixedChar = True
      Size = 3
    end
  end
  object QProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      '   E.CODIGO,'
      '   E.CODBARRA,'
      '   E.REFERENCIA,'
      '   E.DESCRICAO,'
      '   E.DESCRIFISCAL,'
      '   E.MED,'
      '   E.CODGRUPO,'
      '   E.CODMARCA,'
      '   E.CODFORNECEDOR,'
      '   E.PRECOCUSTO,'
      '   E.PRECOVENDA,'
      '   E.FINANCEIRO,'
      '   E.PRECOPRAZO,'
      '   E.PRECOFISCAL,'
      '   E.QTDE,'
      '   E.QTDEMINIMA,'
      '   E.IPI,'
      '   E.SUBST,'
      '   E.SUBSTRIBUTARIA,'
      '   E.ICM,'
      '   E.CODALIQUOTA,'
      '   E.LUCROLIQUIDO,'
      '   E.DESCONTOMAX,'
      '   E.DATACADASTRO,'
      '   E.DATAULTCOMPRA,'
      '   E.DATAULTVENDA,'
      '   E.CODSECAO,'
      '   E.OBS,'
      '   E.MAODEOBRA,'
      '   E.ECF,'
      '   E.INATIVO,'
      '   E.BALANCA,'
      '   E.CUSTOFINAL,'
      '   E.IAT,'
      '   E.IPPT,'
      '   E.COD_NCM,'
      '   G.NOME,'
      '   S.NOME,'
      '   M.NOME,'
      '   T.NOME '
      'FROM '
      '    ESTOQUE E'
      '    LEFT JOIN GRUPO G ON G.CODIGO = E.CODGRUPO'
      '    LEFT JOIN SECAO S ON S.CODIGO = E.CODSECAO'
      '    LEFT JOIN MARCA M ON M.CODIGO = E.CODMARCA'
      '    LEFT JOIN ECFALIQUOTA T ON T.CODIGO = E.CODALIQUOTA'
      'WHERE '
      '   E.CODIGO=:PCODIGO')
    SQLConnection = SQLConnectionRetaguarda
    Left = 84
    Top = 313
    object QProdutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QProdutoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object QProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object QProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object QProdutoDESCRIFISCAL: TStringField
      FieldName = 'DESCRIFISCAL'
      Size = 50
    end
    object QProdutoMED: TStringField
      FieldName = 'MED'
      Size = 2
    end
    object QProdutoCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
    end
    object QProdutoCODMARCA: TIntegerField
      FieldName = 'CODMARCA'
    end
    object QProdutoCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
    end
    object QProdutoPRECOCUSTO: TFMTBCDField
      FieldName = 'PRECOCUSTO'
      Precision = 15
      Size = 5
    end
    object QProdutoPRECOVENDA: TFMTBCDField
      FieldName = 'PRECOVENDA'
      Precision = 15
      Size = 2
    end
    object QProdutoFINANCEIRO: TFMTBCDField
      FieldName = 'FINANCEIRO'
      Precision = 15
      Size = 5
    end
    object QProdutoPRECOPRAZO: TFMTBCDField
      FieldName = 'PRECOPRAZO'
      Precision = 15
      Size = 2
    end
    object QProdutoPRECOFISCAL: TFMTBCDField
      FieldName = 'PRECOFISCAL'
      Precision = 15
      Size = 2
    end
    object QProdutoQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 15
      Size = 3
    end
    object QProdutoQTDEMINIMA: TFMTBCDField
      FieldName = 'QTDEMINIMA'
      Precision = 15
      Size = 3
    end
    object QProdutoIPI: TFMTBCDField
      FieldName = 'IPI'
      Precision = 15
      Size = 2
    end
    object QProdutoSUBST: TStringField
      FieldName = 'SUBST'
      Size = 1
    end
    object QProdutoSUBSTRIBUTARIA: TFMTBCDField
      FieldName = 'SUBSTRIBUTARIA'
      Precision = 15
      Size = 6
    end
    object QProdutoICM: TFMTBCDField
      FieldName = 'ICM'
      Precision = 15
      Size = 2
    end
    object QProdutoCODALIQUOTA: TIntegerField
      FieldName = 'CODALIQUOTA'
    end
    object QProdutoDESCONTOMAX: TFMTBCDField
      FieldName = 'DESCONTOMAX'
      Precision = 15
      Size = 2
    end
    object QProdutoDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
    end
    object QProdutoDATAULTCOMPRA: TDateField
      FieldName = 'DATAULTCOMPRA'
    end
    object QProdutoDATAULTVENDA: TDateField
      FieldName = 'DATAULTVENDA'
    end
    object QProdutoCODSECAO: TIntegerField
      FieldName = 'CODSECAO'
    end
    object QProdutoOBS: TBlobField
      FieldName = 'OBS'
      Size = 1
    end
    object QProdutoMAODEOBRA: TStringField
      FieldName = 'MAODEOBRA'
      Size = 1
    end
    object QProdutoECF: TStringField
      FieldName = 'ECF'
      Size = 1
    end
    object QProdutoINATIVO: TStringField
      FieldName = 'INATIVO'
      Size = 1
    end
    object QProdutoBALANCA: TStringField
      FieldName = 'BALANCA'
      Size = 1
    end
    object QProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object QProdutoNOME_1: TStringField
      FieldName = 'NOME_1'
      Size = 50
    end
    object QProdutoNOME_2: TStringField
      FieldName = 'NOME_2'
      Size = 50
    end
    object QProdutoNOME_3: TStringField
      FieldName = 'NOME_3'
      Size = 40
    end
    object QProdutoLUCROLIQUIDO: TFMTBCDField
      FieldName = 'LUCROLIQUIDO'
      Precision = 15
      Size = 6
    end
    object QProdutoCUSTOFINAL: TFMTBCDField
      FieldName = 'CUSTOFINAL'
      Precision = 15
      Size = 5
    end
    object QProdutoIAT: TStringField
      FieldName = 'IAT'
      Size = 5
    end
    object QProdutoIPPT: TStringField
      FieldName = 'IPPT'
      Size = 5
    end
    object QProdutoCOD_NCM: TStringField
      FieldName = 'COD_NCM'
      Size = 15
    end
  end
  object DstProduto: TDataSetProvider
    DataSet = QProduto
    Options = [poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    Left = 116
    Top = 313
  end
  object TProduto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'DstProduto'
    AfterInsert = TProdutoAfterInsert
    AfterEdit = TProdutoAfterEdit
    Left = 148
    Top = 313
    object TProdutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00000000000000'
    end
    object TProdutoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 13
    end
    object TProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object TProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object TProdutoDESCRIFISCAL: TStringField
      FieldName = 'DESCRIFISCAL'
      Size = 50
    end
    object TProdutoMED: TStringField
      FieldName = 'MED'
      Size = 2
    end
    object TProdutoCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
      DisplayFormat = '0000'
    end
    object TProdutoCODMARCA: TIntegerField
      FieldName = 'CODMARCA'
      DisplayFormat = '0000'
    end
    object TProdutoCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
      DisplayFormat = '00000'
    end
    object TProdutoPRECOCUSTO: TFMTBCDField
      FieldName = 'PRECOCUSTO'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 5
    end
    object TProdutoPRECOVENDA: TFMTBCDField
      FieldName = 'PRECOVENDA'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object TProdutoFINANCEIRO: TFMTBCDField
      FieldName = 'FINANCEIRO'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 5
    end
    object TProdutoPRECOPRAZO: TFMTBCDField
      FieldName = 'PRECOPRAZO'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object TProdutoPRECOFISCAL: TFMTBCDField
      FieldName = 'PRECOFISCAL'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object TProdutoQTDE: TFMTBCDField
      FieldName = 'QTDE'
      DisplayFormat = '0.000'
      Precision = 15
      Size = 3
    end
    object TProdutoQTDEMINIMA: TFMTBCDField
      FieldName = 'QTDEMINIMA'
      DisplayFormat = '0.000'
      Precision = 15
      Size = 3
    end
    object TProdutoIPI: TFMTBCDField
      FieldName = 'IPI'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object TProdutoSUBST: TStringField
      FieldName = 'SUBST'
      Size = 1
    end
    object TProdutoSUBSTRIBUTARIA: TFMTBCDField
      FieldName = 'SUBSTRIBUTARIA'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 6
    end
    object TProdutoICM: TFMTBCDField
      FieldName = 'ICM'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object TProdutoCODALIQUOTA: TIntegerField
      FieldName = 'CODALIQUOTA'
      DisplayFormat = '00'
    end
    object TProdutoDESCONTOMAX: TFMTBCDField
      FieldName = 'DESCONTOMAX'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object TProdutoDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
    end
    object TProdutoDATAULTCOMPRA: TDateField
      FieldName = 'DATAULTCOMPRA'
    end
    object TProdutoDATAULTVENDA: TDateField
      FieldName = 'DATAULTVENDA'
    end
    object TProdutoCODSECAO: TIntegerField
      FieldName = 'CODSECAO'
      DisplayFormat = '0000'
    end
    object TProdutoMAODEOBRA: TStringField
      FieldName = 'MAODEOBRA'
      Size = 1
    end
    object TProdutoECF: TStringField
      FieldName = 'ECF'
      Size = 1
    end
    object TProdutoINATIVO: TStringField
      FieldName = 'INATIVO'
      Size = 1
    end
    object TProdutoBALANCA: TStringField
      FieldName = 'BALANCA'
      Size = 1
    end
    object TProdutoOBS: TBlobField
      FieldName = 'OBS'
      Size = 1
    end
    object TProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object TProdutoNOME_1: TStringField
      FieldName = 'NOME_1'
      Size = 50
    end
    object TProdutoNOME_2: TStringField
      FieldName = 'NOME_2'
      Size = 50
    end
    object TProdutoNOME_3: TStringField
      FieldName = 'NOME_3'
      Size = 40
    end
    object TProdutoLUCROLIQUIDO: TFMTBCDField
      FieldName = 'LUCROLIQUIDO'
      Precision = 15
      Size = 6
    end
    object TProdutoCUSTOFINAL: TFMTBCDField
      FieldName = 'CUSTOFINAL'
      Precision = 15
      Size = 5
    end
    object TProdutoIAT: TStringField
      FieldName = 'IAT'
      Size = 5
    end
    object TProdutoIPPT: TStringField
      FieldName = 'IPPT'
      Size = 5
    end
    object TProdutoCOD_NCM: TStringField
      FieldName = 'COD_NCM'
      Size = 15
    end
  end
  object QCartao_Adm: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  DESCRICAO,'
      '  TELEFONE,'
      '  FAX,'
      '  WEB_SITE,'
      '  E_MAIL,'
      '  TAXA_DESC_DEB,'
      '  TAXA_DESC_CRED,'
      '  NOME_REDE'
      'FROM'
      '  CARTAO_ADMINISTRADORA')
    SQLConnection = SQLConnectionLocal
    Left = 576
    Top = 8
    object QCartao_AdmCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QCartao_AdmDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object QCartao_AdmTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 16
    end
    object QCartao_AdmFAX: TStringField
      FieldName = 'FAX'
      Size = 16
    end
    object QCartao_AdmWEB_SITE: TStringField
      FieldName = 'WEB_SITE'
      Size = 60
    end
    object QCartao_AdmE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Size = 60
    end
    object QCartao_AdmTAXA_DESC_DEB: TFMTBCDField
      FieldName = 'TAXA_DESC_DEB'
      Precision = 15
      Size = 2
    end
    object QCartao_AdmTAXA_DESC_CRED: TFMTBCDField
      FieldName = 'TAXA_DESC_CRED'
      Precision = 15
      Size = 2
    end
    object QCartao_AdmNOME_REDE: TStringField
      FieldName = 'NOME_REDE'
      Required = True
      Size = 45
    end
  end
  object dspCartao_Adm: TDataSetProvider
    DataSet = QCartao_Adm
    UpdateMode = upWhereKeyOnly
    Left = 604
    Top = 8
  end
  object TCartao_Adm: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCartao_Adm'
    AfterInsert = TCartao_AdmAfterInsert
    Left = 630
    Top = 8
    object TCartao_AdmCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object TCartao_AdmDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object TCartao_AdmTELEFONE: TStringField
      FieldName = 'TELEFONE'
      EditMask = '!\(#xx##\)####-####;1; '
      Size = 16
    end
    object TCartao_AdmFAX: TStringField
      FieldName = 'FAX'
      EditMask = '!\(#xx##\)####-####;1; '
      Size = 16
    end
    object TCartao_AdmWEB_SITE: TStringField
      FieldName = 'WEB_SITE'
      Size = 60
    end
    object TCartao_AdmE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Size = 60
    end
    object TCartao_AdmTAXA_DESC_DEB: TFMTBCDField
      FieldName = 'TAXA_DESC_DEB'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object TCartao_AdmTAXA_DESC_CRED: TFMTBCDField
      FieldName = 'TAXA_DESC_CRED'
      DisplayFormat = '0.00'
      Precision = 15
      Size = 2
    end
    object TCartao_AdmNOME_REDE: TStringField
      FieldName = 'NOME_REDE'
      Required = True
      Size = 45
    end
  end
  object QReducoes_Local: TSQLQuery
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
      '  DATA_HORA,'
      '  DATA_MOVIMENTO,'
      '  NRO_SERIE_EQP,'
      '  NR_ORDEM_EQP,'
      '  MODELO_DOC,'
      '  NRO_CONTADOR_INICIO,'
      '  NRO_CONTADOR_FIM,'
      '  NR_CONTADOR_Z,'
      '  CONTADOR_REINICIO,'
      '  VALOR_VENDA_BRUTA,'
      '  VALOR_VENDA_GERAL,'
      '  VALOR_CANCELAMENTOS,'
      '  VALOR_DESCONTOS,'
      '  VALOR_ISSQN,'
      '  VALOR_SUBST_TRIB,'
      '  VALOR_ISENTO,'
      '  VALOR_NAO_INCIDENCIA,'
      '  ALIQUOTA01,'
      '  VALOR_TPARCIAL01,'
      '  ALIQUOTA02,'
      '  VALOR_TPARCIAL02,'
      '  ALIQUOTA03,'
      '  VALOR_TPARCIAL03,'
      '  ALIQUOTA04,'
      '  VALOR_TPARCIAL04,'
      '  ALIQUOTA05,'
      '  VALOR_TPARCIAL05,'
      '  ALIQUOTA06,'
      '  VALOR_TPARCIAL06,'
      '  ALIQUOTA07,'
      '  VALOR_TPARCIAL07,'
      '  ALIQUOTA08,'
      '  VALOR_TPARCIAL08,'
      '  ALIQUOTA09,'
      '  VALOR_TPARCIAL09,'
      '  ALIQUOTA010,'
      '  VALOR_TPARCIAL010,'
      '  POSI_ALIQUOTA01,'
      '  POSI_ALIQUOTA02,'
      '  POSI_ALIQUOTA03,'
      '  POSI_ALIQUOTA04,'
      '  POSI_ALIQUOTA05,'
      '  POSI_ALIQUOTA06,'
      '  POSI_ALIQUOTA07,'
      '  POSI_ALIQUOTA08,'
      '  POSI_ALIQUOTA09,'
      '  POSI_ALIQUOTA010'
      'FROM'
      '  REDUCOES'
      'WHERE'
      '  CODIGO=:PCODIGO')
    SQLConnection = SQLConnectionLocal
    Left = 610
    Top = 57
    object QReducoes_LocalCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QReducoes_LocalDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
    end
    object QReducoes_LocalDATA_MOVIMENTO: TDateField
      FieldName = 'DATA_MOVIMENTO'
    end
    object QReducoes_LocalNRO_SERIE_EQP: TStringField
      FieldName = 'NRO_SERIE_EQP'
      Size = 25
    end
    object QReducoes_LocalNR_ORDEM_EQP: TStringField
      FieldName = 'NR_ORDEM_EQP'
      Size = 6
    end
    object QReducoes_LocalMODELO_DOC: TStringField
      FieldName = 'MODELO_DOC'
      FixedChar = True
      Size = 2
    end
    object QReducoes_LocalNRO_CONTADOR_INICIO: TIntegerField
      FieldName = 'NRO_CONTADOR_INICIO'
    end
    object QReducoes_LocalNRO_CONTADOR_FIM: TIntegerField
      FieldName = 'NRO_CONTADOR_FIM'
    end
    object QReducoes_LocalNR_CONTADOR_Z: TIntegerField
      FieldName = 'NR_CONTADOR_Z'
    end
    object QReducoes_LocalCONTADOR_REINICIO: TIntegerField
      FieldName = 'CONTADOR_REINICIO'
    end
    object QReducoes_LocalVALOR_VENDA_BRUTA: TFMTBCDField
      FieldName = 'VALOR_VENDA_BRUTA'
      Precision = 15
      Size = 2
    end
    object QReducoes_LocalVALOR_VENDA_GERAL: TFMTBCDField
      FieldName = 'VALOR_VENDA_GERAL'
      Precision = 15
      Size = 2
    end
    object QReducoes_LocalVALOR_CANCELAMENTOS: TFMTBCDField
      FieldName = 'VALOR_CANCELAMENTOS'
      Precision = 15
      Size = 2
    end
    object QReducoes_LocalVALOR_DESCONTOS: TFMTBCDField
      FieldName = 'VALOR_DESCONTOS'
      Precision = 15
      Size = 2
    end
    object QReducoes_LocalVALOR_ISSQN: TFMTBCDField
      FieldName = 'VALOR_ISSQN'
      Precision = 15
      Size = 2
    end
    object QReducoes_LocalVALOR_SUBST_TRIB: TFMTBCDField
      FieldName = 'VALOR_SUBST_TRIB'
      Precision = 15
      Size = 2
    end
    object QReducoes_LocalVALOR_ISENTO: TFMTBCDField
      FieldName = 'VALOR_ISENTO'
      Precision = 15
      Size = 2
    end
    object QReducoes_LocalVALOR_NAO_INCIDENCIA: TFMTBCDField
      FieldName = 'VALOR_NAO_INCIDENCIA'
      Precision = 15
      Size = 2
    end
    object QReducoes_LocalALIQUOTA01: TStringField
      FieldName = 'ALIQUOTA01'
      Size = 10
    end
    object QReducoes_LocalVALOR_TPARCIAL01: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL01'
      Precision = 15
      Size = 2
    end
    object QReducoes_LocalALIQUOTA02: TStringField
      FieldName = 'ALIQUOTA02'
      Size = 10
    end
    object QReducoes_LocalVALOR_TPARCIAL02: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL02'
      Precision = 15
      Size = 2
    end
    object QReducoes_LocalALIQUOTA03: TStringField
      FieldName = 'ALIQUOTA03'
      Size = 10
    end
    object QReducoes_LocalVALOR_TPARCIAL03: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL03'
      Precision = 15
      Size = 2
    end
    object QReducoes_LocalALIQUOTA04: TStringField
      FieldName = 'ALIQUOTA04'
      Size = 10
    end
    object QReducoes_LocalVALOR_TPARCIAL04: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL04'
      Precision = 15
      Size = 2
    end
    object QReducoes_LocalALIQUOTA05: TStringField
      FieldName = 'ALIQUOTA05'
      Size = 10
    end
    object QReducoes_LocalVALOR_TPARCIAL05: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL05'
      Precision = 15
      Size = 2
    end
    object QReducoes_LocalALIQUOTA06: TStringField
      FieldName = 'ALIQUOTA06'
      Size = 10
    end
    object QReducoes_LocalVALOR_TPARCIAL06: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL06'
      Precision = 15
      Size = 2
    end
    object QReducoes_LocalALIQUOTA07: TStringField
      FieldName = 'ALIQUOTA07'
      Size = 10
    end
    object QReducoes_LocalVALOR_TPARCIAL07: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL07'
      Precision = 15
      Size = 2
    end
    object QReducoes_LocalALIQUOTA08: TStringField
      FieldName = 'ALIQUOTA08'
      Size = 10
    end
    object QReducoes_LocalVALOR_TPARCIAL08: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL08'
      Precision = 15
      Size = 2
    end
    object QReducoes_LocalALIQUOTA09: TStringField
      FieldName = 'ALIQUOTA09'
      Size = 10
    end
    object QReducoes_LocalVALOR_TPARCIAL09: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL09'
      Precision = 15
      Size = 2
    end
    object QReducoes_LocalALIQUOTA010: TStringField
      FieldName = 'ALIQUOTA010'
      Size = 10
    end
    object QReducoes_LocalVALOR_TPARCIAL010: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL010'
      Precision = 15
      Size = 2
    end
    object QReducoes_LocalPOSI_ALIQUOTA01: TStringField
      FieldName = 'POSI_ALIQUOTA01'
      Size = 10
    end
    object QReducoes_LocalPOSI_ALIQUOTA02: TStringField
      FieldName = 'POSI_ALIQUOTA02'
      Size = 10
    end
    object QReducoes_LocalPOSI_ALIQUOTA03: TStringField
      FieldName = 'POSI_ALIQUOTA03'
      Size = 10
    end
    object QReducoes_LocalPOSI_ALIQUOTA04: TStringField
      FieldName = 'POSI_ALIQUOTA04'
      Size = 10
    end
    object QReducoes_LocalPOSI_ALIQUOTA05: TStringField
      FieldName = 'POSI_ALIQUOTA05'
      Size = 10
    end
    object QReducoes_LocalPOSI_ALIQUOTA06: TStringField
      FieldName = 'POSI_ALIQUOTA06'
      Size = 10
    end
    object QReducoes_LocalPOSI_ALIQUOTA07: TStringField
      FieldName = 'POSI_ALIQUOTA07'
      Size = 10
    end
    object QReducoes_LocalPOSI_ALIQUOTA08: TStringField
      FieldName = 'POSI_ALIQUOTA08'
      Size = 10
    end
    object QReducoes_LocalPOSI_ALIQUOTA09: TStringField
      FieldName = 'POSI_ALIQUOTA09'
      Size = 10
    end
    object QReducoes_LocalPOSI_ALIQUOTA010: TStringField
      FieldName = 'POSI_ALIQUOTA010'
      Size = 10
    end
  end
  object dspReducoes_Local: TDataSetProvider
    DataSet = QReducoes_Local
    Options = [poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspReducoes_LocalBeforeUpdateRecord
    Left = 638
    Top = 57
  end
  object TReducoes_Local: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspReducoes_Local'
    OnNewRecord = TReducoes_LocalNewRecord
    Left = 666
    Top = 57
    object TReducoes_LocalCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object TReducoes_LocalDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
    end
    object TReducoes_LocalDATA_MOVIMENTO: TDateField
      FieldName = 'DATA_MOVIMENTO'
    end
    object TReducoes_LocalNRO_SERIE_EQP: TStringField
      FieldName = 'NRO_SERIE_EQP'
      Size = 25
    end
    object TReducoes_LocalMODELO_DOC: TStringField
      FieldName = 'MODELO_DOC'
      FixedChar = True
      Size = 2
    end
    object TReducoes_LocalNRO_CONTADOR_INICIO: TIntegerField
      FieldName = 'NRO_CONTADOR_INICIO'
    end
    object TReducoes_LocalNRO_CONTADOR_FIM: TIntegerField
      FieldName = 'NRO_CONTADOR_FIM'
    end
    object TReducoes_LocalNR_CONTADOR_Z: TIntegerField
      FieldName = 'NR_CONTADOR_Z'
    end
    object TReducoes_LocalCONTADOR_REINICIO: TIntegerField
      FieldName = 'CONTADOR_REINICIO'
    end
    object TReducoes_LocalVALOR_VENDA_BRUTA: TFMTBCDField
      FieldName = 'VALOR_VENDA_BRUTA'
      Precision = 15
      Size = 2
    end
    object TReducoes_LocalVALOR_VENDA_GERAL: TFMTBCDField
      FieldName = 'VALOR_VENDA_GERAL'
      Precision = 15
      Size = 2
    end
    object TReducoes_LocalVALOR_CANCELAMENTOS: TFMTBCDField
      FieldName = 'VALOR_CANCELAMENTOS'
      Precision = 15
      Size = 2
    end
    object TReducoes_LocalVALOR_DESCONTOS: TFMTBCDField
      FieldName = 'VALOR_DESCONTOS'
      Precision = 15
      Size = 2
    end
    object TReducoes_LocalVALOR_ISSQN: TFMTBCDField
      FieldName = 'VALOR_ISSQN'
      Precision = 15
      Size = 2
    end
    object TReducoes_LocalVALOR_SUBST_TRIB: TFMTBCDField
      FieldName = 'VALOR_SUBST_TRIB'
      Precision = 15
      Size = 2
    end
    object TReducoes_LocalVALOR_ISENTO: TFMTBCDField
      FieldName = 'VALOR_ISENTO'
      Precision = 15
      Size = 2
    end
    object TReducoes_LocalVALOR_NAO_INCIDENCIA: TFMTBCDField
      FieldName = 'VALOR_NAO_INCIDENCIA'
      Precision = 15
      Size = 2
    end
    object TReducoes_LocalALIQUOTA01: TStringField
      FieldName = 'ALIQUOTA01'
      Size = 10
    end
    object TReducoes_LocalVALOR_TPARCIAL01: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL01'
      Precision = 15
      Size = 2
    end
    object TReducoes_LocalALIQUOTA02: TStringField
      FieldName = 'ALIQUOTA02'
      Size = 10
    end
    object TReducoes_LocalVALOR_TPARCIAL02: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL02'
      Precision = 15
      Size = 2
    end
    object TReducoes_LocalALIQUOTA03: TStringField
      FieldName = 'ALIQUOTA03'
      Size = 10
    end
    object TReducoes_LocalVALOR_TPARCIAL03: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL03'
      Precision = 15
      Size = 2
    end
    object TReducoes_LocalALIQUOTA04: TStringField
      FieldName = 'ALIQUOTA04'
      Size = 10
    end
    object TReducoes_LocalVALOR_TPARCIAL04: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL04'
      Precision = 15
      Size = 2
    end
    object TReducoes_LocalALIQUOTA05: TStringField
      FieldName = 'ALIQUOTA05'
      Size = 10
    end
    object TReducoes_LocalVALOR_TPARCIAL05: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL05'
      Precision = 15
      Size = 2
    end
    object TReducoes_LocalALIQUOTA06: TStringField
      FieldName = 'ALIQUOTA06'
      Size = 10
    end
    object TReducoes_LocalVALOR_TPARCIAL06: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL06'
      Precision = 15
      Size = 2
    end
    object TReducoes_LocalALIQUOTA07: TStringField
      FieldName = 'ALIQUOTA07'
      Size = 10
    end
    object TReducoes_LocalVALOR_TPARCIAL07: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL07'
      Precision = 15
      Size = 2
    end
    object TReducoes_LocalALIQUOTA08: TStringField
      FieldName = 'ALIQUOTA08'
      Size = 10
    end
    object TReducoes_LocalVALOR_TPARCIAL08: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL08'
      Precision = 15
      Size = 2
    end
    object TReducoes_LocalALIQUOTA09: TStringField
      FieldName = 'ALIQUOTA09'
      Size = 10
    end
    object TReducoes_LocalVALOR_TPARCIAL09: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL09'
      Precision = 15
      Size = 2
    end
    object TReducoes_LocalALIQUOTA010: TStringField
      FieldName = 'ALIQUOTA010'
      Size = 10
    end
    object TReducoes_LocalVALOR_TPARCIAL010: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL010'
      Precision = 15
      Size = 2
    end
    object TReducoes_LocalNR_ORDEM_EQP: TStringField
      FieldName = 'NR_ORDEM_EQP'
      Size = 6
    end
    object TReducoes_LocalPOSI_ALIQUOTA01: TStringField
      FieldName = 'POSI_ALIQUOTA01'
      Size = 10
    end
    object TReducoes_LocalPOSI_ALIQUOTA02: TStringField
      FieldName = 'POSI_ALIQUOTA02'
      Size = 10
    end
    object TReducoes_LocalPOSI_ALIQUOTA03: TStringField
      FieldName = 'POSI_ALIQUOTA03'
      Size = 10
    end
    object TReducoes_LocalPOSI_ALIQUOTA04: TStringField
      FieldName = 'POSI_ALIQUOTA04'
      Size = 10
    end
    object TReducoes_LocalPOSI_ALIQUOTA05: TStringField
      FieldName = 'POSI_ALIQUOTA05'
      Size = 10
    end
    object TReducoes_LocalPOSI_ALIQUOTA06: TStringField
      FieldName = 'POSI_ALIQUOTA06'
      Size = 10
    end
    object TReducoes_LocalPOSI_ALIQUOTA07: TStringField
      FieldName = 'POSI_ALIQUOTA07'
      Size = 10
    end
    object TReducoes_LocalPOSI_ALIQUOTA08: TStringField
      FieldName = 'POSI_ALIQUOTA08'
      Size = 10
    end
    object TReducoes_LocalPOSI_ALIQUOTA09: TStringField
      FieldName = 'POSI_ALIQUOTA09'
      Size = 10
    end
    object TReducoes_LocalPOSI_ALIQUOTA010: TStringField
      FieldName = 'POSI_ALIQUOTA010'
      Size = 10
    end
  end
  object QReducoes_Remoto: TSQLQuery
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
      '  DATA_HORA,'
      '  DATA_MOVIMENTO,'
      '  NRO_SERIE_EQP,'
      '  NR_ORDEM_EQP,'
      '  MODELO_DOC,'
      '  NRO_CONTADOR_INICIO,'
      '  NRO_CONTADOR_FIM,'
      '  NR_CONTADOR_Z,'
      '  CONTADOR_REINICIO,'
      '  VALOR_VENDA_BRUTA,'
      '  VALOR_VENDA_GERAL,'
      '  VALOR_CANCELAMENTOS,'
      '  VALOR_DESCONTOS,'
      '  VALOR_ISSQN,'
      '  VALOR_SUBST_TRIB,'
      '  VALOR_ISENTO,'
      '  VALOR_NAO_INCIDENCIA,'
      '  ALIQUOTA01,'
      '  VALOR_TPARCIAL01,'
      '  ALIQUOTA02,'
      '  VALOR_TPARCIAL02,'
      '  ALIQUOTA03,'
      '  VALOR_TPARCIAL03,'
      '  ALIQUOTA04,'
      '  VALOR_TPARCIAL04,'
      '  ALIQUOTA05,'
      '  VALOR_TPARCIAL05,'
      '  ALIQUOTA06,'
      '  VALOR_TPARCIAL06,'
      '  ALIQUOTA07,'
      '  VALOR_TPARCIAL07,'
      '  ALIQUOTA08,'
      '  VALOR_TPARCIAL08,'
      '  ALIQUOTA09,'
      '  VALOR_TPARCIAL09,'
      '  ALIQUOTA010,'
      '  VALOR_TPARCIAL010,'
      '  POSI_ALIQUOTA01,'
      '  POSI_ALIQUOTA02,'
      '  POSI_ALIQUOTA03,'
      '  POSI_ALIQUOTA04,'
      '  POSI_ALIQUOTA05,'
      '  POSI_ALIQUOTA06,'
      '  POSI_ALIQUOTA07,'
      '  POSI_ALIQUOTA08,'
      '  POSI_ALIQUOTA09,'
      '  POSI_ALIQUOTA010,'
      '  COD_REDUCAO_PDV'
      'FROM'
      '  REDUCOES'
      'WHERE'
      '  CODIGO=:PCODIGO')
    SQLConnection = SQLConnectionRetaguarda
    Left = 461
    Top = 375
    object QReducoes_RemotoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QReducoes_RemotoDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
    end
    object QReducoes_RemotoDATA_MOVIMENTO: TDateField
      FieldName = 'DATA_MOVIMENTO'
    end
    object QReducoes_RemotoNRO_SERIE_EQP: TStringField
      FieldName = 'NRO_SERIE_EQP'
      Size = 25
    end
    object QReducoes_RemotoMODELO_DOC: TStringField
      FieldName = 'MODELO_DOC'
      FixedChar = True
      Size = 2
    end
    object QReducoes_RemotoNRO_CONTADOR_INICIO: TIntegerField
      FieldName = 'NRO_CONTADOR_INICIO'
    end
    object QReducoes_RemotoNRO_CONTADOR_FIM: TIntegerField
      FieldName = 'NRO_CONTADOR_FIM'
    end
    object QReducoes_RemotoNR_CONTADOR_Z: TIntegerField
      FieldName = 'NR_CONTADOR_Z'
    end
    object QReducoes_RemotoCONTADOR_REINICIO: TIntegerField
      FieldName = 'CONTADOR_REINICIO'
    end
    object QReducoes_RemotoVALOR_VENDA_BRUTA: TFMTBCDField
      FieldName = 'VALOR_VENDA_BRUTA'
      Precision = 15
      Size = 2
    end
    object QReducoes_RemotoVALOR_VENDA_GERAL: TFMTBCDField
      FieldName = 'VALOR_VENDA_GERAL'
      Precision = 15
      Size = 2
    end
    object QReducoes_RemotoVALOR_CANCELAMENTOS: TFMTBCDField
      FieldName = 'VALOR_CANCELAMENTOS'
      Precision = 15
      Size = 2
    end
    object QReducoes_RemotoVALOR_DESCONTOS: TFMTBCDField
      FieldName = 'VALOR_DESCONTOS'
      Precision = 15
      Size = 2
    end
    object QReducoes_RemotoVALOR_ISSQN: TFMTBCDField
      FieldName = 'VALOR_ISSQN'
      Precision = 15
      Size = 2
    end
    object QReducoes_RemotoVALOR_SUBST_TRIB: TFMTBCDField
      FieldName = 'VALOR_SUBST_TRIB'
      Precision = 15
      Size = 2
    end
    object QReducoes_RemotoVALOR_ISENTO: TFMTBCDField
      FieldName = 'VALOR_ISENTO'
      Precision = 15
      Size = 2
    end
    object QReducoes_RemotoVALOR_NAO_INCIDENCIA: TFMTBCDField
      FieldName = 'VALOR_NAO_INCIDENCIA'
      Precision = 15
      Size = 2
    end
    object QReducoes_RemotoALIQUOTA01: TStringField
      FieldName = 'ALIQUOTA01'
      Size = 10
    end
    object QReducoes_RemotoVALOR_TPARCIAL01: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL01'
      Precision = 15
      Size = 2
    end
    object QReducoes_RemotoALIQUOTA02: TStringField
      FieldName = 'ALIQUOTA02'
      Size = 10
    end
    object QReducoes_RemotoVALOR_TPARCIAL02: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL02'
      Precision = 15
      Size = 2
    end
    object QReducoes_RemotoALIQUOTA03: TStringField
      FieldName = 'ALIQUOTA03'
      Size = 10
    end
    object QReducoes_RemotoVALOR_TPARCIAL03: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL03'
      Precision = 15
      Size = 2
    end
    object QReducoes_RemotoALIQUOTA04: TStringField
      FieldName = 'ALIQUOTA04'
      Size = 10
    end
    object QReducoes_RemotoVALOR_TPARCIAL04: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL04'
      Precision = 15
      Size = 2
    end
    object QReducoes_RemotoALIQUOTA05: TStringField
      FieldName = 'ALIQUOTA05'
      Size = 10
    end
    object QReducoes_RemotoVALOR_TPARCIAL05: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL05'
      Precision = 15
      Size = 2
    end
    object QReducoes_RemotoALIQUOTA06: TStringField
      FieldName = 'ALIQUOTA06'
      Size = 10
    end
    object QReducoes_RemotoVALOR_TPARCIAL06: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL06'
      Precision = 15
      Size = 2
    end
    object QReducoes_RemotoALIQUOTA07: TStringField
      FieldName = 'ALIQUOTA07'
      Size = 10
    end
    object QReducoes_RemotoVALOR_TPARCIAL07: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL07'
      Precision = 15
      Size = 2
    end
    object QReducoes_RemotoALIQUOTA08: TStringField
      FieldName = 'ALIQUOTA08'
      Size = 10
    end
    object QReducoes_RemotoVALOR_TPARCIAL08: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL08'
      Precision = 15
      Size = 2
    end
    object QReducoes_RemotoALIQUOTA09: TStringField
      FieldName = 'ALIQUOTA09'
      Size = 10
    end
    object QReducoes_RemotoVALOR_TPARCIAL09: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL09'
      Precision = 15
      Size = 2
    end
    object QReducoes_RemotoALIQUOTA010: TStringField
      FieldName = 'ALIQUOTA010'
      Size = 10
    end
    object QReducoes_RemotoVALOR_TPARCIAL010: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL010'
      Precision = 15
      Size = 2
    end
    object QReducoes_RemotoNR_ORDEM_EQP: TStringField
      FieldName = 'NR_ORDEM_EQP'
      Size = 6
    end
    object QReducoes_RemotoPOSI_ALIQUOTA01: TStringField
      FieldName = 'POSI_ALIQUOTA01'
      Size = 10
    end
    object QReducoes_RemotoPOSI_ALIQUOTA02: TStringField
      FieldName = 'POSI_ALIQUOTA02'
      Size = 10
    end
    object QReducoes_RemotoPOSI_ALIQUOTA03: TStringField
      FieldName = 'POSI_ALIQUOTA03'
      Size = 10
    end
    object QReducoes_RemotoPOSI_ALIQUOTA04: TStringField
      FieldName = 'POSI_ALIQUOTA04'
      Size = 10
    end
    object QReducoes_RemotoPOSI_ALIQUOTA05: TStringField
      FieldName = 'POSI_ALIQUOTA05'
      Size = 10
    end
    object QReducoes_RemotoPOSI_ALIQUOTA06: TStringField
      FieldName = 'POSI_ALIQUOTA06'
      Size = 10
    end
    object QReducoes_RemotoPOSI_ALIQUOTA07: TStringField
      FieldName = 'POSI_ALIQUOTA07'
      Size = 10
    end
    object QReducoes_RemotoPOSI_ALIQUOTA08: TStringField
      FieldName = 'POSI_ALIQUOTA08'
      Size = 10
    end
    object QReducoes_RemotoPOSI_ALIQUOTA09: TStringField
      FieldName = 'POSI_ALIQUOTA09'
      Size = 10
    end
    object QReducoes_RemotoPOSI_ALIQUOTA010: TStringField
      FieldName = 'POSI_ALIQUOTA010'
      Size = 10
    end
    object QReducoes_RemotoCOD_REDUCAO_PDV: TIntegerField
      FieldName = 'COD_REDUCAO_PDV'
      Required = True
    end
  end
  object dspReducoes_Remoto: TDataSetProvider
    DataSet = QReducoes_Remoto
    UpdateMode = upWhereKeyOnly
    Left = 489
    Top = 375
  end
  object TReducoes_Remoto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspReducoes_Remoto'
    Left = 517
    Top = 375
    object TReducoes_RemotoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object TReducoes_RemotoDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
    end
    object TReducoes_RemotoDATA_MOVIMENTO: TDateField
      FieldName = 'DATA_MOVIMENTO'
    end
    object TReducoes_RemotoNRO_SERIE_EQP: TStringField
      FieldName = 'NRO_SERIE_EQP'
      Size = 25
    end
    object TReducoes_RemotoMODELO_DOC: TStringField
      FieldName = 'MODELO_DOC'
      FixedChar = True
      Size = 2
    end
    object TReducoes_RemotoNRO_CONTADOR_INICIO: TIntegerField
      FieldName = 'NRO_CONTADOR_INICIO'
    end
    object TReducoes_RemotoNRO_CONTADOR_FIM: TIntegerField
      FieldName = 'NRO_CONTADOR_FIM'
    end
    object TReducoes_RemotoNR_CONTADOR_Z: TIntegerField
      FieldName = 'NR_CONTADOR_Z'
    end
    object TReducoes_RemotoCONTADOR_REINICIO: TIntegerField
      FieldName = 'CONTADOR_REINICIO'
    end
    object TReducoes_RemotoVALOR_VENDA_BRUTA: TFMTBCDField
      FieldName = 'VALOR_VENDA_BRUTA'
      Precision = 15
      Size = 2
    end
    object TReducoes_RemotoVALOR_VENDA_GERAL: TFMTBCDField
      FieldName = 'VALOR_VENDA_GERAL'
      Precision = 15
      Size = 2
    end
    object TReducoes_RemotoVALOR_CANCELAMENTOS: TFMTBCDField
      FieldName = 'VALOR_CANCELAMENTOS'
      Precision = 15
      Size = 2
    end
    object TReducoes_RemotoVALOR_DESCONTOS: TFMTBCDField
      FieldName = 'VALOR_DESCONTOS'
      Precision = 15
      Size = 2
    end
    object TReducoes_RemotoVALOR_ISSQN: TFMTBCDField
      FieldName = 'VALOR_ISSQN'
      Precision = 15
      Size = 2
    end
    object TReducoes_RemotoVALOR_SUBST_TRIB: TFMTBCDField
      FieldName = 'VALOR_SUBST_TRIB'
      Precision = 15
      Size = 2
    end
    object TReducoes_RemotoVALOR_ISENTO: TFMTBCDField
      FieldName = 'VALOR_ISENTO'
      Precision = 15
      Size = 2
    end
    object TReducoes_RemotoVALOR_NAO_INCIDENCIA: TFMTBCDField
      FieldName = 'VALOR_NAO_INCIDENCIA'
      Precision = 15
      Size = 2
    end
    object TReducoes_RemotoALIQUOTA01: TStringField
      FieldName = 'ALIQUOTA01'
      Size = 10
    end
    object TReducoes_RemotoVALOR_TPARCIAL01: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL01'
      Precision = 15
      Size = 2
    end
    object TReducoes_RemotoALIQUOTA02: TStringField
      FieldName = 'ALIQUOTA02'
      Size = 10
    end
    object TReducoes_RemotoVALOR_TPARCIAL02: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL02'
      Precision = 15
      Size = 2
    end
    object TReducoes_RemotoALIQUOTA03: TStringField
      FieldName = 'ALIQUOTA03'
      Size = 10
    end
    object TReducoes_RemotoVALOR_TPARCIAL03: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL03'
      Precision = 15
      Size = 2
    end
    object TReducoes_RemotoALIQUOTA04: TStringField
      FieldName = 'ALIQUOTA04'
      Size = 10
    end
    object TReducoes_RemotoVALOR_TPARCIAL04: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL04'
      Precision = 15
      Size = 2
    end
    object TReducoes_RemotoALIQUOTA05: TStringField
      FieldName = 'ALIQUOTA05'
      Size = 10
    end
    object TReducoes_RemotoVALOR_TPARCIAL05: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL05'
      Precision = 15
      Size = 2
    end
    object TReducoes_RemotoALIQUOTA06: TStringField
      FieldName = 'ALIQUOTA06'
      Size = 10
    end
    object TReducoes_RemotoVALOR_TPARCIAL06: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL06'
      Precision = 15
      Size = 2
    end
    object TReducoes_RemotoALIQUOTA07: TStringField
      FieldName = 'ALIQUOTA07'
      Size = 10
    end
    object TReducoes_RemotoVALOR_TPARCIAL07: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL07'
      Precision = 15
      Size = 2
    end
    object TReducoes_RemotoALIQUOTA08: TStringField
      FieldName = 'ALIQUOTA08'
      Size = 10
    end
    object TReducoes_RemotoVALOR_TPARCIAL08: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL08'
      Precision = 15
      Size = 2
    end
    object TReducoes_RemotoALIQUOTA09: TStringField
      FieldName = 'ALIQUOTA09'
      Size = 10
    end
    object TReducoes_RemotoVALOR_TPARCIAL09: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL09'
      Precision = 15
      Size = 2
    end
    object TReducoes_RemotoALIQUOTA010: TStringField
      FieldName = 'ALIQUOTA010'
      Size = 10
    end
    object TReducoes_RemotoVALOR_TPARCIAL010: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL010'
      Precision = 15
      Size = 2
    end
    object TReducoes_RemotoNR_ORDEM_EQP: TStringField
      FieldName = 'NR_ORDEM_EQP'
      Size = 6
    end
    object TReducoes_RemotoPOSI_ALIQUOTA01: TStringField
      FieldName = 'POSI_ALIQUOTA01'
      Size = 10
    end
    object TReducoes_RemotoPOSI_ALIQUOTA02: TStringField
      FieldName = 'POSI_ALIQUOTA02'
      Size = 10
    end
    object TReducoes_RemotoPOSI_ALIQUOTA03: TStringField
      FieldName = 'POSI_ALIQUOTA03'
      Size = 10
    end
    object TReducoes_RemotoPOSI_ALIQUOTA04: TStringField
      FieldName = 'POSI_ALIQUOTA04'
      Size = 10
    end
    object TReducoes_RemotoPOSI_ALIQUOTA05: TStringField
      FieldName = 'POSI_ALIQUOTA05'
      Size = 10
    end
    object TReducoes_RemotoPOSI_ALIQUOTA06: TStringField
      FieldName = 'POSI_ALIQUOTA06'
      Size = 10
    end
    object TReducoes_RemotoPOSI_ALIQUOTA07: TStringField
      FieldName = 'POSI_ALIQUOTA07'
      Size = 10
    end
    object TReducoes_RemotoPOSI_ALIQUOTA08: TStringField
      FieldName = 'POSI_ALIQUOTA08'
      Size = 10
    end
    object TReducoes_RemotoPOSI_ALIQUOTA09: TStringField
      FieldName = 'POSI_ALIQUOTA09'
      Size = 10
    end
    object TReducoes_RemotoPOSI_ALIQUOTA010: TStringField
      FieldName = 'POSI_ALIQUOTA010'
      Size = 10
    end
    object TReducoes_RemotoCOD_REDUCAO_PDV: TIntegerField
      FieldName = 'COD_REDUCAO_PDV'
      Required = True
    end
  end
  object QPegaDataHora: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select'
      '  current_timestamp'
      'from'
      '  RDB$DATABASE')
    SQLConnection = SQLConnectionRetaguarda
    Left = 607
    Top = 375
    object QPegaDataHoraCURRENT_TIMESTAMP: TSQLTimeStampField
      FieldName = 'CURRENT_TIMESTAMP'
      Required = True
    end
  end
  object PingConexao: TIdTCPClient
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 0
    Left = 24
    Top = 262
  end
  object IdAntiFreeze: TIdAntiFreeze
    Left = 23
    Top = 311
  end
  object QDAVEmitidos: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'PDATAI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMSERIE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  DATA,'
      '  COD_DAV,'
      '  NUM_FABRICACAO_ECF,'
      '  MF_ADICIONAL,'
      '  TIPO_ECF,'
      '  MARCA_ECF,'
      '  MODELO_ECF,'
      '  NUMERO_CUPOM,'
      '  NUM_CCF_CUPOM,'
      '  TOTAL'
      'FROM'
      '  VENDA'
      'WHERE'
      '  DATA BETWEEN :PDATAI AND :PDATAF'
      'AND'
      ' NUM_FABRICACAO_ECF=:PNUMSERIE'
      'AND'
      '  COD_DAV > 0'
      '   ')
    SQLConnection = SQLConnectionLocal
    Left = 403
    Top = 103
  end
  object dspDAVEmitidos: TDataSetProvider
    DataSet = QDAVEmitidos
    Left = 431
    Top = 103
  end
  object TDAVEmitidos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'PDATAI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMSERIE'
        ParamType = ptInput
      end>
    ProviderName = 'dspDAVEmitidos'
    Left = 459
    Top = 103
    object TDAVEmitidosDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object TDAVEmitidosCOD_DAV: TIntegerField
      FieldName = 'COD_DAV'
    end
    object TDAVEmitidosNUM_FABRICACAO_ECF: TStringField
      FieldName = 'NUM_FABRICACAO_ECF'
    end
    object TDAVEmitidosMF_ADICIONAL: TStringField
      FieldName = 'MF_ADICIONAL'
      FixedChar = True
      Size = 1
    end
    object TDAVEmitidosTIPO_ECF: TStringField
      FieldName = 'TIPO_ECF'
      Size = 10
    end
    object TDAVEmitidosMARCA_ECF: TStringField
      FieldName = 'MARCA_ECF'
    end
    object TDAVEmitidosMODELO_ECF: TStringField
      FieldName = 'MODELO_ECF'
    end
    object TDAVEmitidosNUMERO_CUPOM: TIntegerField
      FieldName = 'NUMERO_CUPOM'
      Required = True
    end
    object TDAVEmitidosNUM_CCF_CUPOM: TIntegerField
      FieldName = 'NUM_CCF_CUPOM'
    end
    object TDAVEmitidosTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
      Size = 2
    end
  end
  object QRegistro: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '    CODIGO,'
      '    NUM_LAUDO,'
      '    CNPJ,'
      '    RAZAO_EMPRESA,'
      '    ENDERECO,'
      '    NUMERO,'
      '    COMPLEMENTO,'
      '    BAIRRO,'
      '    CIDADE,'
      '    CEP,'
      '    UF,'
      '    FONE,'
      '    RESPONSAVEL,'
      '    NOME_COMERCIAL,'
      '    VERSAO,'
      '    PRINCIPAL_ARQUIVO_EXE,'
      '    COD_AUTENTICACAO,'
      '    EXECUTAVEL_DAV,'
      '    INSC_ESTADUAL,'
      '    INSC_MUNICIPAL, '
      '    FANTASIA_EMPRESA,'
      '    VERSAO_ER_PAF_ECF'
      'FROM'
      '    REGISTRO')
    SQLConnection = SQLConnectionLocal
    Left = 129
    Top = 103
    object QRegistroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QRegistroNUM_LAUDO: TStringField
      FieldName = 'NUM_LAUDO'
    end
    object QRegistroCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object QRegistroRAZAO_EMPRESA: TStringField
      FieldName = 'RAZAO_EMPRESA'
      Size = 50
    end
    object QRegistroENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object QRegistroNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 6
    end
    object QRegistroCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 40
    end
    object QRegistroBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object QRegistroCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 35
    end
    object QRegistroCEP: TStringField
      FieldName = 'CEP'
      Size = 15
    end
    object QRegistroUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object QRegistroRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Size = 45
    end
    object QRegistroNOME_COMERCIAL: TStringField
      FieldName = 'NOME_COMERCIAL'
      Size = 40
    end
    object QRegistroVERSAO: TStringField
      FieldName = 'VERSAO'
      Size = 10
    end
    object QRegistroPRINCIPAL_ARQUIVO_EXE: TStringField
      FieldName = 'PRINCIPAL_ARQUIVO_EXE'
      Size = 10
    end
    object QRegistroCOD_AUTENTICACAO: TStringField
      FieldName = 'COD_AUTENTICACAO'
      Size = 100
    end
    object QRegistroEXECUTAVEL_DAV: TStringField
      FieldName = 'EXECUTAVEL_DAV'
      Size = 10
    end
    object QRegistroFONE: TStringField
      FieldName = 'FONE'
    end
    object QRegistroINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
    end
    object QRegistroINSC_MUNICIPAL: TStringField
      FieldName = 'INSC_MUNICIPAL'
      Size = 15
    end
    object QRegistroFANTASIA_EMPRESA: TStringField
      FieldName = 'FANTASIA_EMPRESA'
      Size = 50
    end
    object QRegistroVERSAO_ER_PAF_ECF: TStringField
      FieldName = 'VERSAO_ER_PAF_ECF'
      Size = 10
    end
  end
  object dspRegistro: TDataSetProvider
    DataSet = QRegistro
    UpdateMode = upWhereKeyOnly
    Left = 158
    Top = 103
  end
  object TRegistro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegistro'
    Left = 185
    Top = 103
    object TRegistroCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object TRegistroNUM_LAUDO: TStringField
      FieldName = 'NUM_LAUDO'
    end
    object TRegistroCNPJ: TStringField
      FieldName = 'CNPJ'
      EditMask = '##\.###\.###\/####\-##;1; '
    end
    object TRegistroRAZAO_EMPRESA: TStringField
      FieldName = 'RAZAO_EMPRESA'
      Size = 50
    end
    object TRegistroENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object TRegistroNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 6
    end
    object TRegistroCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 40
    end
    object TRegistroBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object TRegistroCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 35
    end
    object TRegistroCEP: TStringField
      FieldName = 'CEP'
      EditMask = '#####\-###;1; '
      Size = 15
    end
    object TRegistroUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object TRegistroRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Size = 45
    end
    object TRegistroNOME_COMERCIAL: TStringField
      FieldName = 'NOME_COMERCIAL'
      Size = 40
    end
    object TRegistroVERSAO: TStringField
      FieldName = 'VERSAO'
      Size = 10
    end
    object TRegistroPRINCIPAL_ARQUIVO_EXE: TStringField
      FieldName = 'PRINCIPAL_ARQUIVO_EXE'
      Size = 10
    end
    object TRegistroCOD_AUTENTICACAO: TStringField
      FieldName = 'COD_AUTENTICACAO'
      Size = 100
    end
    object TRegistroEXECUTAVEL_DAV: TStringField
      FieldName = 'EXECUTAVEL_DAV'
      Size = 10
    end
    object TRegistroFONE: TStringField
      FieldName = 'FONE'
      EditMask = '!\(#xx##\)####-####;1; '
    end
    object TRegistroINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
    end
    object TRegistroINSC_MUNICIPAL: TStringField
      FieldName = 'INSC_MUNICIPAL'
      Size = 15
    end
    object TRegistroFANTASIA_EMPRESA: TStringField
      FieldName = 'FANTASIA_EMPRESA'
      Size = 50
    end
    object TRegistroVERSAO_ER_PAF_ECF: TStringField
      FieldName = 'VERSAO_ER_PAF_ECF'
      Size = 10
    end
  end
  object QConsultaReducoes: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'PDATAI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMSERIE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  DATA_HORA,'
      '  DATA_MOVIMENTO,'
      '  NRO_SERIE_EQP,'
      '  NR_ORDEM_EQP,'
      '  MODELO_DOC,'
      '  NRO_CONTADOR_INICIO,'
      '  NRO_CONTADOR_FIM,'
      '  NR_CONTADOR_Z,'
      '  CONTADOR_REINICIO,'
      '  VALOR_VENDA_BRUTA,'
      '  VALOR_VENDA_GERAL,'
      '  VALOR_CANCELAMENTOS,'
      '  VALOR_DESCONTOS,'
      '  VALOR_ISSQN,'
      '  VALOR_SUBST_TRIB,'
      '  VALOR_ISENTO,'
      '  VALOR_NAO_INCIDENCIA,'
      '  ALIQUOTA01,'
      '  VALOR_TPARCIAL01,'
      '  ALIQUOTA02,'
      '  VALOR_TPARCIAL02,'
      '  ALIQUOTA03,'
      '  VALOR_TPARCIAL03,'
      '  ALIQUOTA04,'
      '  VALOR_TPARCIAL04,'
      '  ALIQUOTA05,'
      '  VALOR_TPARCIAL05,'
      '  ALIQUOTA06,'
      '  VALOR_TPARCIAL06,'
      '  ALIQUOTA07,'
      '  VALOR_TPARCIAL07,'
      '  ALIQUOTA08,'
      '  VALOR_TPARCIAL08,'
      '  ALIQUOTA09,'
      '  VALOR_TPARCIAL09,'
      '  ALIQUOTA010,'
      '  VALOR_TPARCIAL010,'
      '  POSI_ALIQUOTA01,'
      '  POSI_ALIQUOTA02,'
      '  POSI_ALIQUOTA03,'
      '  POSI_ALIQUOTA04,'
      '  POSI_ALIQUOTA05,'
      '  POSI_ALIQUOTA06,'
      '  POSI_ALIQUOTA07,'
      '  POSI_ALIQUOTA08,'
      '  POSI_ALIQUOTA09,'
      '  POSI_ALIQUOTA010'
      'FROM'
      '  REDUCOES'
      'WHERE'
      '  DATA_MOVIMENTO BETWEEN :PDATAI AND :PDATAF'
      'AND'
      '  NRO_SERIE_EQP=:PNUMSERIE'
      ''
      '')
    SQLConnection = SQLConnectionLocal
    Left = 260
    Top = 103
  end
  object dspConsultaReducoes: TDataSetProvider
    DataSet = QConsultaReducoes
    Left = 288
    Top = 103
  end
  object TConsultaReducoes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'PDATAI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMSERIE'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsultaReducoes'
    Left = 316
    Top = 103
    object TConsultaReducoesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TConsultaReducoesDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
    end
    object TConsultaReducoesDATA_MOVIMENTO: TDateField
      FieldName = 'DATA_MOVIMENTO'
    end
    object TConsultaReducoesNRO_SERIE_EQP: TStringField
      FieldName = 'NRO_SERIE_EQP'
      Size = 25
    end
    object TConsultaReducoesNR_ORDEM_EQP: TStringField
      FieldName = 'NR_ORDEM_EQP'
      Size = 6
    end
    object TConsultaReducoesMODELO_DOC: TStringField
      FieldName = 'MODELO_DOC'
      FixedChar = True
      Size = 2
    end
    object TConsultaReducoesNRO_CONTADOR_INICIO: TIntegerField
      FieldName = 'NRO_CONTADOR_INICIO'
    end
    object TConsultaReducoesNRO_CONTADOR_FIM: TIntegerField
      FieldName = 'NRO_CONTADOR_FIM'
    end
    object TConsultaReducoesNR_CONTADOR_Z: TIntegerField
      FieldName = 'NR_CONTADOR_Z'
    end
    object TConsultaReducoesCONTADOR_REINICIO: TIntegerField
      FieldName = 'CONTADOR_REINICIO'
    end
    object TConsultaReducoesVALOR_VENDA_BRUTA: TFMTBCDField
      FieldName = 'VALOR_VENDA_BRUTA'
      Precision = 15
      Size = 2
    end
    object TConsultaReducoesVALOR_VENDA_GERAL: TFMTBCDField
      FieldName = 'VALOR_VENDA_GERAL'
      Precision = 15
      Size = 2
    end
    object TConsultaReducoesVALOR_CANCELAMENTOS: TFMTBCDField
      FieldName = 'VALOR_CANCELAMENTOS'
      Precision = 15
      Size = 2
    end
    object TConsultaReducoesVALOR_DESCONTOS: TFMTBCDField
      FieldName = 'VALOR_DESCONTOS'
      Precision = 15
      Size = 2
    end
    object TConsultaReducoesVALOR_ISSQN: TFMTBCDField
      FieldName = 'VALOR_ISSQN'
      Precision = 15
      Size = 2
    end
    object TConsultaReducoesVALOR_SUBST_TRIB: TFMTBCDField
      FieldName = 'VALOR_SUBST_TRIB'
      Precision = 15
      Size = 2
    end
    object TConsultaReducoesVALOR_ISENTO: TFMTBCDField
      FieldName = 'VALOR_ISENTO'
      Precision = 15
      Size = 2
    end
    object TConsultaReducoesVALOR_NAO_INCIDENCIA: TFMTBCDField
      FieldName = 'VALOR_NAO_INCIDENCIA'
      Precision = 15
      Size = 2
    end
    object TConsultaReducoesALIQUOTA01: TStringField
      FieldName = 'ALIQUOTA01'
      Size = 10
    end
    object TConsultaReducoesVALOR_TPARCIAL01: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL01'
      Precision = 15
      Size = 2
    end
    object TConsultaReducoesALIQUOTA02: TStringField
      FieldName = 'ALIQUOTA02'
      Size = 10
    end
    object TConsultaReducoesVALOR_TPARCIAL02: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL02'
      Precision = 15
      Size = 2
    end
    object TConsultaReducoesALIQUOTA03: TStringField
      FieldName = 'ALIQUOTA03'
      Size = 10
    end
    object TConsultaReducoesVALOR_TPARCIAL03: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL03'
      Precision = 15
      Size = 2
    end
    object TConsultaReducoesALIQUOTA04: TStringField
      FieldName = 'ALIQUOTA04'
      Size = 10
    end
    object TConsultaReducoesVALOR_TPARCIAL04: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL04'
      Precision = 15
      Size = 2
    end
    object TConsultaReducoesALIQUOTA05: TStringField
      FieldName = 'ALIQUOTA05'
      Size = 10
    end
    object TConsultaReducoesVALOR_TPARCIAL05: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL05'
      Precision = 15
      Size = 2
    end
    object TConsultaReducoesALIQUOTA06: TStringField
      FieldName = 'ALIQUOTA06'
      Size = 10
    end
    object TConsultaReducoesVALOR_TPARCIAL06: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL06'
      Precision = 15
      Size = 2
    end
    object TConsultaReducoesALIQUOTA07: TStringField
      FieldName = 'ALIQUOTA07'
      Size = 10
    end
    object TConsultaReducoesVALOR_TPARCIAL07: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL07'
      Precision = 15
      Size = 2
    end
    object TConsultaReducoesALIQUOTA08: TStringField
      FieldName = 'ALIQUOTA08'
      Size = 10
    end
    object TConsultaReducoesVALOR_TPARCIAL08: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL08'
      Precision = 15
      Size = 2
    end
    object TConsultaReducoesALIQUOTA09: TStringField
      FieldName = 'ALIQUOTA09'
      Size = 10
    end
    object TConsultaReducoesVALOR_TPARCIAL09: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL09'
      Precision = 15
      Size = 2
    end
    object TConsultaReducoesALIQUOTA010: TStringField
      FieldName = 'ALIQUOTA010'
      Size = 10
    end
    object TConsultaReducoesVALOR_TPARCIAL010: TFMTBCDField
      FieldName = 'VALOR_TPARCIAL010'
      Precision = 15
      Size = 2
    end
    object TConsultaReducoesPOSI_ALIQUOTA01: TStringField
      FieldName = 'POSI_ALIQUOTA01'
      Size = 10
    end
    object TConsultaReducoesPOSI_ALIQUOTA02: TStringField
      FieldName = 'POSI_ALIQUOTA02'
      Size = 10
    end
    object TConsultaReducoesPOSI_ALIQUOTA03: TStringField
      FieldName = 'POSI_ALIQUOTA03'
      Size = 10
    end
    object TConsultaReducoesPOSI_ALIQUOTA04: TStringField
      FieldName = 'POSI_ALIQUOTA04'
      Size = 10
    end
    object TConsultaReducoesPOSI_ALIQUOTA05: TStringField
      FieldName = 'POSI_ALIQUOTA05'
      Size = 10
    end
    object TConsultaReducoesPOSI_ALIQUOTA06: TStringField
      FieldName = 'POSI_ALIQUOTA06'
      Size = 10
    end
    object TConsultaReducoesPOSI_ALIQUOTA07: TStringField
      FieldName = 'POSI_ALIQUOTA07'
      Size = 10
    end
    object TConsultaReducoesPOSI_ALIQUOTA08: TStringField
      FieldName = 'POSI_ALIQUOTA08'
      Size = 10
    end
    object TConsultaReducoesPOSI_ALIQUOTA09: TStringField
      FieldName = 'POSI_ALIQUOTA09'
      Size = 10
    end
    object TConsultaReducoesPOSI_ALIQUOTA010: TStringField
      FieldName = 'POSI_ALIQUOTA010'
      Size = 10
    end
  end
  object QConsultaVendas: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'PDATAI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMSERIE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  V.CODIGO,'
      '  V.DATA,'
      '  V.HORA,'
      '  V.NUMERO_ECF,'
      '  V.NUMERO_CUPOM,'
      '  V.COD_CLIENTE,'
      '  V.COD_OPERADOR,'
      '  V.COD_VENDEDOR,'
      '  V.SUBTOTAL,'
      '  V.ACRESCIMO,'
      '  V.PERC_ACRESCIMO,'
      '  V.DESCONTO,'
      '  V.PERC_DESCONTO,'
      '  V.TOTAL,'
      '  V.DINHEIRO,'
      '  V.CHEQUE,'
      '  V.CHEQUE_PRE,'
      '  V.CREDIARIO,'
      '  V.CARTAO,'
      '  V.TICKET,'
      '  V.TROCO,'
      '  V.TIPO,'
      '  V.NUMPGTO,'
      '  V.CUPOM_CANCELADO,'
      '  V.PDV,'
      '  V.COD_DAV,'
      '  V.COD_ADM_CARTAO,'
      '  V.NUMERO_CARTOES,'
      '  V.CARTAO_DEB_CRED,'
      '  V.NUM_TRANSACAO_TEF,'
      '  V.NOME_REDE_TEF,'
      '  V.NUM_TRANS_NSU_TEF,'
      '  V.DATA_TRANS_TEF,'
      '  V.HORA_TRANS_TEF,'
      '  V.BASE_ICMS,'
      '  V.VALOR_ICMS,'
      '  V.ULT_ATUALIZACAO,'
      '  V.NUM_CCF_CUPOM,'
      '  V.MODELO_ECF,'
      '  V.MARCA_ECF,'
      '  V.TIPO_ECF,'
      '  V.MF_ADICIONAL ,'
      '  V.NUM_FABRICACAO_ECF,'
      '  V.CONTADOR_GNF,'
      '  C.NOME,'
      '  C.CPF,'
      '  C.CGC'
      'FROM'
      '  VENDA V'
      '  LEFT JOIN CLIENTE C ON C.CODIGO = V.COD_CLIENTE'
      'WHERE'
      '  V.DATA BETWEEN :PDATAI AND :PDATAF'
      'AND'
      '  V.NUM_FABRICACAO_ECF=:PNUMSERIE')
    SQLConnection = SQLConnectionLocal
    Left = 666
    Top = 103
  end
  object dspConsultaVendas: TDataSetProvider
    DataSet = QConsultaVendas
    Left = 695
    Top = 103
  end
  object TConsultaVendas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'PDATAI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMSERIE'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsultaVendas'
    Left = 724
    Top = 103
    object TConsultaVendasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TConsultaVendasDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object TConsultaVendasHORA: TTimeField
      FieldName = 'HORA'
      Required = True
    end
    object TConsultaVendasNUMERO_ECF: TStringField
      FieldName = 'NUMERO_ECF'
      Required = True
    end
    object TConsultaVendasNUMERO_CUPOM: TIntegerField
      FieldName = 'NUMERO_CUPOM'
      Required = True
    end
    object TConsultaVendasCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object TConsultaVendasCOD_OPERADOR: TIntegerField
      FieldName = 'COD_OPERADOR'
      Required = True
    end
    object TConsultaVendasCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object TConsultaVendasSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Precision = 15
      Size = 2
    end
    object TConsultaVendasACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Precision = 15
      Size = 6
    end
    object TConsultaVendasPERC_ACRESCIMO: TFMTBCDField
      FieldName = 'PERC_ACRESCIMO'
      Precision = 15
      Size = 6
    end
    object TConsultaVendasDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 15
      Size = 6
    end
    object TConsultaVendasPERC_DESCONTO: TFMTBCDField
      FieldName = 'PERC_DESCONTO'
      Precision = 15
      Size = 6
    end
    object TConsultaVendasTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
      Size = 2
    end
    object TConsultaVendasDINHEIRO: TFMTBCDField
      FieldName = 'DINHEIRO'
      Precision = 15
      Size = 2
    end
    object TConsultaVendasCHEQUE: TFMTBCDField
      FieldName = 'CHEQUE'
      Precision = 15
      Size = 2
    end
    object TConsultaVendasCHEQUE_PRE: TFMTBCDField
      FieldName = 'CHEQUE_PRE'
      Precision = 15
      Size = 2
    end
    object TConsultaVendasCREDIARIO: TFMTBCDField
      FieldName = 'CREDIARIO'
      Precision = 15
      Size = 2
    end
    object TConsultaVendasCARTAO: TFMTBCDField
      FieldName = 'CARTAO'
      Precision = 15
      Size = 2
    end
    object TConsultaVendasTICKET: TFMTBCDField
      FieldName = 'TICKET'
      Precision = 15
      Size = 2
    end
    object TConsultaVendasTROCO: TFMTBCDField
      FieldName = 'TROCO'
      Precision = 15
      Size = 2
    end
    object TConsultaVendasTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TConsultaVendasNUMPGTO: TIntegerField
      FieldName = 'NUMPGTO'
    end
    object TConsultaVendasCUPOM_CANCELADO: TStringField
      FieldName = 'CUPOM_CANCELADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TConsultaVendasPDV: TStringField
      FieldName = 'PDV'
      FixedChar = True
      Size = 3
    end
    object TConsultaVendasCOD_DAV: TIntegerField
      FieldName = 'COD_DAV'
    end
    object TConsultaVendasCOD_ADM_CARTAO: TIntegerField
      FieldName = 'COD_ADM_CARTAO'
    end
    object TConsultaVendasNUMERO_CARTOES: TSmallintField
      FieldName = 'NUMERO_CARTOES'
    end
    object TConsultaVendasCARTAO_DEB_CRED: TStringField
      FieldName = 'CARTAO_DEB_CRED'
      FixedChar = True
      Size = 1
    end
    object TConsultaVendasNUM_TRANSACAO_TEF: TIntegerField
      FieldName = 'NUM_TRANSACAO_TEF'
    end
    object TConsultaVendasNOME_REDE_TEF: TStringField
      FieldName = 'NOME_REDE_TEF'
      Size = 15
    end
    object TConsultaVendasNUM_TRANS_NSU_TEF: TStringField
      FieldName = 'NUM_TRANS_NSU_TEF'
    end
    object TConsultaVendasDATA_TRANS_TEF: TDateField
      FieldName = 'DATA_TRANS_TEF'
    end
    object TConsultaVendasHORA_TRANS_TEF: TTimeField
      FieldName = 'HORA_TRANS_TEF'
    end
    object TConsultaVendasBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Precision = 15
      Size = 2
    end
    object TConsultaVendasVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 15
      Size = 2
    end
    object TConsultaVendasULT_ATUALIZACAO: TSQLTimeStampField
      FieldName = 'ULT_ATUALIZACAO'
    end
    object TConsultaVendasNUM_CCF_CUPOM: TIntegerField
      FieldName = 'NUM_CCF_CUPOM'
    end
    object TConsultaVendasMODELO_ECF: TStringField
      FieldName = 'MODELO_ECF'
    end
    object TConsultaVendasMARCA_ECF: TStringField
      FieldName = 'MARCA_ECF'
    end
    object TConsultaVendasTIPO_ECF: TStringField
      FieldName = 'TIPO_ECF'
      Size = 10
    end
    object TConsultaVendasMF_ADICIONAL: TStringField
      FieldName = 'MF_ADICIONAL'
      FixedChar = True
      Size = 1
    end
    object TConsultaVendasNUM_FABRICACAO_ECF: TStringField
      FieldName = 'NUM_FABRICACAO_ECF'
    end
    object TConsultaVendasNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object TConsultaVendasCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object TConsultaVendasCGC: TStringField
      FieldName = 'CGC'
    end
    object TConsultaVendasCONTADOR_GNF: TIntegerField
      FieldName = 'CONTADOR_GNF'
    end
  end
  object QConsultaItenVendas: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'PDATAI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMSERIE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  V.DATA,'
      '  V.NUM_CCF_CUPOM,'
      '  V.CUPOM_CANCELADO,'
      '  I.CONTROLE,'
      '  I.CODIGO,'
      '  I.NUMERO_ECF,'
      '  I.NUMERO_CUPOM,'
      '  I.ITEM,'
      '  I.COD_PRODUTO,'
      '  I.DESCRICAO,'
      '  I.QUANTIDADE,'
      '  I.UNIDADE,'
      '  I.VL_UNITARIO,'
      '  I.ST,'
      '  I.ALIQUOTA,'
      '  I.VL_TOTAL,'
      '  I.TABELA,'
      '  I.VL_UNIT_BRUTO,'
      '  I.VL_TOTAL_BRUTO,'
      '  I.PERC_DESCONTO,'
      '  I.VALOR_DESCONTO,'
      '  I.PERC_ACRESCIMO,'
      '  I.VALOR_ACRESCIMO,'
      '  I.BASE_ICMS,'
      '  I.VALOR_ICMS,'
      '  I.PERC_IPI,'
      '  I.COD_TOTALIZADOR_PARCIAL '
      'FROM'
      '  VENDA_ITEM I'
      '  INNER JOIN VENDA V ON V.CODIGO = I.CODIGO'
      'WHERE'
      '  V.DATA BETWEEN :PDATAI AND :PDATAF'
      'AND'
      '  I.NUMERO_ECF=:PNUMSERIE'
      '')
    SQLConnection = SQLConnectionLocal
    Left = 665
    Top = 147
  end
  object dspConsultaItenVendas: TDataSetProvider
    DataSet = QConsultaItenVendas
    Left = 694
    Top = 147
  end
  object TConsultaItenVendas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'PDATAI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMSERIE'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsultaItenVendas'
    Left = 723
    Top = 147
    object TConsultaItenVendasDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object TConsultaItenVendasNUM_CCF_CUPOM: TIntegerField
      FieldName = 'NUM_CCF_CUPOM'
    end
    object TConsultaItenVendasCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      Required = True
    end
    object TConsultaItenVendasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TConsultaItenVendasNUMERO_ECF: TStringField
      FieldName = 'NUMERO_ECF'
      Required = True
    end
    object TConsultaItenVendasNUMERO_CUPOM: TIntegerField
      FieldName = 'NUMERO_CUPOM'
      Required = True
    end
    object TConsultaItenVendasITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object TConsultaItenVendasCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object TConsultaItenVendasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object TConsultaItenVendasQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 15
      Size = 3
    end
    object TConsultaItenVendasUNIDADE: TStringField
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 2
    end
    object TConsultaItenVendasVL_UNITARIO: TFMTBCDField
      FieldName = 'VL_UNITARIO'
      Precision = 15
      Size = 2
    end
    object TConsultaItenVendasST: TStringField
      FieldName = 'ST'
      FixedChar = True
      Size = 3
    end
    object TConsultaItenVendasALIQUOTA: TFMTBCDField
      FieldName = 'ALIQUOTA'
      Precision = 15
      Size = 2
    end
    object TConsultaItenVendasVL_TOTAL: TFMTBCDField
      FieldName = 'VL_TOTAL'
      Precision = 15
      Size = 2
    end
    object TConsultaItenVendasTABELA: TStringField
      FieldName = 'TABELA'
      FixedChar = True
      Size = 1
    end
    object TConsultaItenVendasVL_UNIT_BRUTO: TFMTBCDField
      FieldName = 'VL_UNIT_BRUTO'
      Precision = 15
      Size = 2
    end
    object TConsultaItenVendasVL_TOTAL_BRUTO: TFMTBCDField
      FieldName = 'VL_TOTAL_BRUTO'
      Precision = 15
      Size = 2
    end
    object TConsultaItenVendasPERC_DESCONTO: TFMTBCDField
      FieldName = 'PERC_DESCONTO'
      Precision = 15
      Size = 6
    end
    object TConsultaItenVendasVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      Precision = 15
      Size = 2
    end
    object TConsultaItenVendasPERC_ACRESCIMO: TFMTBCDField
      FieldName = 'PERC_ACRESCIMO'
      Precision = 15
      Size = 6
    end
    object TConsultaItenVendasVALOR_ACRESCIMO: TFMTBCDField
      FieldName = 'VALOR_ACRESCIMO'
      Precision = 15
      Size = 2
    end
    object TConsultaItenVendasBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Precision = 15
      Size = 2
    end
    object TConsultaItenVendasVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 15
      Size = 2
    end
    object TConsultaItenVendasPERC_IPI: TFMTBCDField
      FieldName = 'PERC_IPI'
      Precision = 15
      Size = 2
    end
    object TConsultaItenVendasCOD_TOTALIZADOR_PARCIAL: TStringField
      FieldName = 'COD_TOTALIZADOR_PARCIAL'
      Size = 10
    end
    object TConsultaItenVendasCUPOM_CANCELADO: TStringField
      FieldName = 'CUPOM_CANCELADO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object TTotalizadores_ECF: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Apgef\Local\TotalizadoresEcf.xml'
    Params = <>
    AfterPost = TTotalizadores_ECFAfterPost
    AfterDelete = TTotalizadores_ECFAfterDelete
    Left = 52
    Top = 103
    object TTotalizadores_ECFALIQUOTA: TStringField
      FieldName = 'ALIQUOTA'
      Size = 10
    end
    object TTotalizadores_ECFVALOR: TStringField
      FieldName = 'VALOR'
      Size = 5
    end
    object TTotalizadores_ECFNUM_SERIE: TStringField
      FieldName = 'NUM_SERIE'
    end
  end
  object QDocEmitidos: TSQLQuery
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
      '  COO,'
      '  GNF,'
      '  GRG,'
      '  CDC,'
      '  DENOMINACAO,'
      '  DATA_EMISSAO,'
      '  HORA_EMISSAO,'
      '  CAIXA,'
      '  NUM_SERIE_ECF'
      'FROM'
      '  DOC_EMITIDOS_ECF'
      'WHERE'
      '  CODIGO=:PCODIGO')
    SQLConnection = SQLConnectionLocal
    Left = 22
    Top = 149
    object QDocEmitidosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QDocEmitidosCOO: TIntegerField
      FieldName = 'COO'
    end
    object QDocEmitidosGNF: TIntegerField
      FieldName = 'GNF'
    end
    object QDocEmitidosGRG: TIntegerField
      FieldName = 'GRG'
    end
    object QDocEmitidosCDC: TIntegerField
      FieldName = 'CDC'
    end
    object QDocEmitidosDENOMINACAO: TStringField
      FieldName = 'DENOMINACAO'
      Size = 2
    end
    object QDocEmitidosDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object QDocEmitidosHORA_EMISSAO: TTimeField
      FieldName = 'HORA_EMISSAO'
    end
    object QDocEmitidosCAIXA: TStringField
      FieldName = 'CAIXA'
      Size = 5
    end
    object QDocEmitidosNUM_SERIE_ECF: TStringField
      FieldName = 'NUM_SERIE_ECF'
    end
  end
  object dspDocEmitidos: TDataSetProvider
    DataSet = QDocEmitidos
    Options = [poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspDocEmitidosBeforeUpdateRecord
    Left = 50
    Top = 149
  end
  object TDocEmitidos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspDocEmitidos'
    OnNewRecord = TDocEmitidosNewRecord
    Left = 78
    Top = 149
    object TDocEmitidosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TDocEmitidosCOO: TIntegerField
      FieldName = 'COO'
    end
    object TDocEmitidosGNF: TIntegerField
      FieldName = 'GNF'
    end
    object TDocEmitidosGRG: TIntegerField
      FieldName = 'GRG'
    end
    object TDocEmitidosCDC: TIntegerField
      FieldName = 'CDC'
    end
    object TDocEmitidosDENOMINACAO: TStringField
      FieldName = 'DENOMINACAO'
      Size = 2
    end
    object TDocEmitidosDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object TDocEmitidosHORA_EMISSAO: TTimeField
      FieldName = 'HORA_EMISSAO'
    end
    object TDocEmitidosCAIXA: TStringField
      FieldName = 'CAIXA'
      Size = 5
    end
    object TDocEmitidosNUM_SERIE_ECF: TStringField
      FieldName = 'NUM_SERIE_ECF'
    end
  end
  object QConsultaDocEmitidos: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'PDATAI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMSERIE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  COO,'
      '  GNF,'
      '  GRG,'
      '  CDC,'
      '  DENOMINACAO,'
      '  DATA_EMISSAO,'
      '  HORA_EMISSAO,'
      '  CAIXA,'
      '  NUM_SERIE_ECF'
      'FROM'
      '  DOC_EMITIDOS_ECF'
      'WHERE'
      '  DATA_EMISSAO BETWEEN :PDATAI AND :PDATAF'
      'AND'
      '  NUM_SERIE_ECF=:PNUMSERIE')
    SQLConnection = SQLConnectionLocal
    Left = 499
    Top = 147
  end
  object dspConsultaDocEmitidos: TDataSetProvider
    DataSet = QConsultaDocEmitidos
    Left = 527
    Top = 147
  end
  object TConsultaDocEmitidos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'PDATAI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMSERIE'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsultaDocEmitidos'
    Left = 555
    Top = 147
    object TConsultaDocEmitidosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TConsultaDocEmitidosCOO: TIntegerField
      FieldName = 'COO'
    end
    object TConsultaDocEmitidosGNF: TIntegerField
      FieldName = 'GNF'
    end
    object TConsultaDocEmitidosGRG: TIntegerField
      FieldName = 'GRG'
    end
    object TConsultaDocEmitidosCDC: TIntegerField
      FieldName = 'CDC'
    end
    object TConsultaDocEmitidosDENOMINACAO: TStringField
      FieldName = 'DENOMINACAO'
      Size = 2
    end
    object TConsultaDocEmitidosDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object TConsultaDocEmitidosHORA_EMISSAO: TTimeField
      FieldName = 'HORA_EMISSAO'
    end
    object TConsultaDocEmitidosCAIXA: TStringField
      FieldName = 'CAIXA'
      Size = 5
    end
    object TConsultaDocEmitidosNUM_SERIE_ECF: TStringField
      FieldName = 'NUM_SERIE_ECF'
    end
  end
  object QMeiosPgtos: TSQLQuery
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
      '  COD_VENDA,'
      '  DESCR_PGTO,'
      '  VALOR,'
      '  TROCO'
      'FROM'
      '  MEIOS_PGTOS'
      'WHERE'
      '  CODIGO=:PCODIGO')
    SQLConnection = SQLConnectionLocal
    Left = 147
    Top = 149
    object QMeiosPgtosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QMeiosPgtosCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Required = True
    end
    object QMeiosPgtosDESCR_PGTO: TStringField
      FieldName = 'DESCR_PGTO'
      Required = True
      Size = 40
    end
    object QMeiosPgtosVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object QMeiosPgtosTROCO: TFMTBCDField
      FieldName = 'TROCO'
      Precision = 15
      Size = 2
    end
  end
  object dspMeiosPgtos: TDataSetProvider
    DataSet = QMeiosPgtos
    Options = [poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspMeiosPgtosBeforeUpdateRecord
    Left = 175
    Top = 149
  end
  object TMeiosPgtos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspMeiosPgtos'
    OnNewRecord = TMeiosPgtosNewRecord
    Left = 204
    Top = 149
    object TMeiosPgtosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TMeiosPgtosCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Required = True
    end
    object TMeiosPgtosDESCR_PGTO: TStringField
      FieldName = 'DESCR_PGTO'
      Required = True
      Size = 40
    end
    object TMeiosPgtosVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object TMeiosPgtosTROCO: TFMTBCDField
      FieldName = 'TROCO'
      Precision = 15
      Size = 2
    end
  end
  object QMeiosPgtosR7: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'PDATAI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMSERIE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  V.DATA,'
      '  V.NUMERO_ECF,'
      '  V.NUMERO_CUPOM,'
      '  V.NUM_CCF_CUPOM,'
      '  V.CONTADOR_GNF,'
      '  V.CUPOM_CANCELADO,'
      '  M.COD_VENDA,'
      '  M.DESCR_PGTO,'
      '  M.VALOR'
      'FROM'
      '  MEIOS_PGTOS M'
      '  INNER JOIN VENDA V ON V.CODIGO = M.COD_VENDA'
      'WHERE'
      '  V.DATA BETWEEN :PDATAI AND :PDATAF'
      'AND'
      '  V.NUMERO_ECF=:PNUMSERIE')
    SQLConnection = SQLConnectionLocal
    Left = 534
    Top = 103
  end
  object dspMeiosPgtosR7: TDataSetProvider
    DataSet = QMeiosPgtosR7
    Left = 562
    Top = 103
  end
  object TMeiosPgtosR7: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'PDATAI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMSERIE'
        ParamType = ptInput
      end>
    ProviderName = 'dspMeiosPgtosR7'
    Left = 590
    Top = 103
    object TMeiosPgtosR7DATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object TMeiosPgtosR7NUMERO_ECF: TStringField
      FieldName = 'NUMERO_ECF'
      Required = True
    end
    object TMeiosPgtosR7NUMERO_CUPOM: TIntegerField
      FieldName = 'NUMERO_CUPOM'
      Required = True
    end
    object TMeiosPgtosR7NUM_CCF_CUPOM: TIntegerField
      FieldName = 'NUM_CCF_CUPOM'
    end
    object TMeiosPgtosR7CONTADOR_GNF: TIntegerField
      FieldName = 'CONTADOR_GNF'
    end
    object TMeiosPgtosR7CUPOM_CANCELADO: TStringField
      FieldName = 'CUPOM_CANCELADO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TMeiosPgtosR7COD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Required = True
    end
    object TMeiosPgtosR7DESCR_PGTO: TStringField
      FieldName = 'DESCR_PGTO'
      Required = True
      Size = 40
    end
    object TMeiosPgtosR7VALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
  end
  object QCNIEE: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  COD_MC,'
      '  COD_MD,'
      '  COD_VR,'
      '  TIPO,'
      '  MARCA,'
      '  MODELO,'
      '  VERSAO'
      'FROM'
      '  CNI_ECF')
    SQLConnection = SQLConnectionLocal
    Left = 258
    Top = 150
    object QCNIEECODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QCNIEECOD_MC: TStringField
      FieldName = 'COD_MC'
      Size = 10
    end
    object QCNIEECOD_MD: TStringField
      FieldName = 'COD_MD'
      Size = 10
    end
    object QCNIEECOD_VR: TStringField
      FieldName = 'COD_VR'
      Size = 10
    end
    object QCNIEETIPO: TStringField
      FieldName = 'TIPO'
      Size = 100
    end
    object QCNIEEMARCA: TStringField
      FieldName = 'MARCA'
      Size = 100
    end
    object QCNIEEMODELO: TStringField
      FieldName = 'MODELO'
      Size = 100
    end
    object QCNIEEVERSAO: TStringField
      FieldName = 'VERSAO'
      Size = 100
    end
  end
  object dspCNIEE: TDataSetProvider
    DataSet = QCNIEE
    UpdateMode = upWhereKeyOnly
    Left = 286
    Top = 150
  end
  object TCNIEE: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCNIEE'
    Left = 314
    Top = 150
    object TCNIEECODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object TCNIEECOD_MC: TStringField
      FieldName = 'COD_MC'
      Size = 10
    end
    object TCNIEECOD_MD: TStringField
      FieldName = 'COD_MD'
      Size = 10
    end
    object TCNIEECOD_VR: TStringField
      FieldName = 'COD_VR'
      Size = 10
    end
    object TCNIEETIPO: TStringField
      FieldName = 'TIPO'
      Size = 100
    end
    object TCNIEEMARCA: TStringField
      FieldName = 'MARCA'
      Size = 100
    end
    object TCNIEEMODELO: TStringField
      FieldName = 'MODELO'
      Size = 100
    end
    object TCNIEEVERSAO: TStringField
      FieldName = 'VERSAO'
      Size = 100
    end
  end
  object QConsultaMeiosPgtos: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'PDATAI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMSERIE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  V.DATA,'
      '  V.NUMERO_ECF,'
      '  M.DESCR_PGTO,'
      '  SUM (M.VALOR) AS TOTAL'
      'FROM'
      '  MEIOS_PGTOS M'
      '  LEFT OUTER JOIN VENDA V ON MEIOS_PGTOS.COD_VENDA = V.CODIGO'
      'WHERE'
      '  V.DATA BETWEEN :PDATAI AND :PDATAF'
      'AND'
      '  V.NUMERO_ECF=:PNUMSERIE'
      'GROUP BY'
      '  M.DESCR_PGTO,V.DATA,V.NUMERO_ECF')
    SQLConnection = SQLConnectionLocal
    Left = 40
    Top = 196
  end
  object dspConsultaMeiosPgtos: TDataSetProvider
    DataSet = QConsultaMeiosPgtos
    Left = 68
    Top = 196
  end
  object TConsultaMeiosPgtos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'PDATAI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMSERIE'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsultaMeiosPgtos'
    Left = 96
    Top = 195
    object TConsultaMeiosPgtosDATA: TDateField
      FieldName = 'DATA'
    end
    object TConsultaMeiosPgtosNUMERO_ECF: TStringField
      FieldName = 'NUMERO_ECF'
    end
    object TConsultaMeiosPgtosDESCR_PGTO: TStringField
      FieldName = 'DESCR_PGTO'
      Required = True
      Size = 40
    end
    object TConsultaMeiosPgtosTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 15
      Size = 2
    end
  end
  object QDocNaoFiscal: TSQLQuery
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
      '  DATA,'
      '  NOME,'
      '  HISTORICO,'
      '  VALOR,'
      '  TIPO_MOVIMENTO,'
      '  FORMA_PGTO,'
      '  NUM_COO,'
      '  NUM_GNF,'
      '  NUM_GRG,'
      '  NUMERO_SERIE_IMP'
      'FROM'
      '  DOCNAOFISCAL'
      'WHERE'
      '  CODIGO=:PCODIGO')
    SQLConnection = SQLConnectionLocal
    Left = 375
    Top = 150
    object QDocNaoFiscalCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QDocNaoFiscalDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object QDocNaoFiscalNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object QDocNaoFiscalHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 150
    end
    object QDocNaoFiscalVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object QDocNaoFiscalTIPO_MOVIMENTO: TStringField
      FieldName = 'TIPO_MOVIMENTO'
    end
    object QDocNaoFiscalFORMA_PGTO: TStringField
      FieldName = 'FORMA_PGTO'
      Size = 15
    end
    object QDocNaoFiscalNUM_COO: TIntegerField
      FieldName = 'NUM_COO'
    end
    object QDocNaoFiscalNUM_GNF: TIntegerField
      FieldName = 'NUM_GNF'
    end
    object QDocNaoFiscalNUM_GRG: TIntegerField
      FieldName = 'NUM_GRG'
    end
    object QDocNaoFiscalNUMERO_SERIE_IMP: TStringField
      FieldName = 'NUMERO_SERIE_IMP'
      Size = 25
    end
  end
  object dspDocNaoFiscal: TDataSetProvider
    DataSet = QDocNaoFiscal
    UpdateMode = upWhereKeyOnly
    Left = 403
    Top = 150
  end
  object TDocNaoFiscal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspDocNaoFiscal'
    Left = 431
    Top = 150
    object TDocNaoFiscalCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object TDocNaoFiscalDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object TDocNaoFiscalNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object TDocNaoFiscalHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 150
    end
    object TDocNaoFiscalVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 15
      Size = 2
    end
    object TDocNaoFiscalTIPO_MOVIMENTO: TStringField
      FieldName = 'TIPO_MOVIMENTO'
    end
    object TDocNaoFiscalFORMA_PGTO: TStringField
      FieldName = 'FORMA_PGTO'
      Size = 15
    end
    object TDocNaoFiscalNUM_COO: TIntegerField
      FieldName = 'NUM_COO'
    end
    object TDocNaoFiscalNUM_GNF: TIntegerField
      FieldName = 'NUM_GNF'
    end
    object TDocNaoFiscalNUM_GRG: TIntegerField
      FieldName = 'NUM_GRG'
    end
    object TDocNaoFiscalNUMERO_SERIE_IMP: TStringField
      FieldName = 'NUMERO_SERIE_IMP'
      Size = 25
    end
  end
  object TDescAcresc: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Apgef\Local\DescAcresc.xml'
    Params = <>
    AfterPost = TDescAcrescAfterPost
    AfterDelete = TDescAcrescAfterDelete
    Left = 21
    Top = 103
    object TDescAcrescCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object TDescAcrescITEM: TIntegerField
      FieldName = 'ITEM'
    end
    object TDescAcrescDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object TDescAcrescOPERADOR: TStringField
      FieldName = 'OPERADOR'
      Size = 1
    end
    object TDescAcrescDESC_ACRESC: TStringField
      FieldName = 'DESC_ACRESC'
      Size = 1
    end
    object TDescAcrescTIPO_DESC_ACRESC: TStringField
      FieldName = 'TIPO_DESC_ACRESC'
      Size = 1
    end
    object TDescAcrescVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '0.00'
    end
    object TDescAcrescPERC_VALOR: TFloatField
      FieldName = 'PERC_VALOR'
    end
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
      '  E.REFERENCIA,'
      '  E.DESCRICAO'
      'FROM'
      '  ESTOQUE_GRADE G'
      
        '  LEFT JOIN ESTOQUE_GRADE_TAMANHOS T ON T.CODIGO = G.COD_TAMANHO' +
        ' '
      '  LEFT JOIN ESTOQUE_GRADE_CORES C ON C.CODIGO = G.COD_COR'
      '  LEFT JOIN ESTOQUE E ON E.CODIGO = G.COD_PRODUTO'
      'WHERE'
      '  G.COD_PRODUTO=:PCODPRODUTO ')
    SQLConnection = SQLConnectionLocal
    Left = 635
    Top = 262
  end
  object dspPesqGradeProd: TDataSetProvider
    DataSet = QPesqGradeProd
    UpdateMode = upWhereKeyOnly
    Left = 664
    Top = 262
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
    Left = 691
    Top = 262
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
    object TPesqGradeProdDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
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
  object TPDVGrade: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Apgef\Local\ItensGrade.xml'
    Params = <>
    AfterPost = TPDVGradeAfterPost
    AfterDelete = TPDVGradeAfterDelete
    Left = 53
    Top = 58
    object TPDVGradeITEN: TIntegerField
      FieldName = 'ITEN'
    end
    object TPDVGradeCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object TPDVGradeCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
    end
    object TPDVGradeQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object TPDVGradeCOD_COR: TIntegerField
      FieldName = 'COD_COR'
    end
    object TPDVGradeCOD_TAMANHO: TIntegerField
      FieldName = 'COD_TAMANHO'
    end
  end
  object QVendaGrade: TSQLQuery
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
      '  COD_VENDA,'
      '  COD_PRODUTO,'
      '  COD_GRADE,'
      '  QTDE,'
      '  COD_COR,'
      '  COD_TAMANHO'
      'FROM'
      '  VENDA_GRADE'
      'WHERE'
      '  CODIGO=:PCODIGO')
    SQLConnection = SQLConnectionRetaguarda
    Left = 682
    Top = 375
    object QVendaGradeCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QVendaGradeCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Required = True
    end
    object QVendaGradeCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QVendaGradeCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Required = True
    end
    object QVendaGradeQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 15
      Size = 2
    end
    object QVendaGradeCOD_COR: TSmallintField
      FieldName = 'COD_COR'
    end
    object QVendaGradeCOD_TAMANHO: TSmallintField
      FieldName = 'COD_TAMANHO'
    end
  end
  object dspVendaGrade: TDataSetProvider
    DataSet = QVendaGrade
    Options = [poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspVendaGradeBeforeUpdateRecord
    Left = 710
    Top = 375
  end
  object TVendaGrade: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspVendaGrade'
    OnNewRecord = TVendaGradeNewRecord
    Left = 738
    Top = 375
    object TVendaGradeCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TVendaGradeCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Required = True
    end
    object TVendaGradeCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object TVendaGradeCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Required = True
    end
    object TVendaGradeQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 15
      Size = 2
    end
    object TVendaGradeCOD_COR: TSmallintField
      FieldName = 'COD_COR'
    end
    object TVendaGradeCOD_TAMANHO: TSmallintField
      FieldName = 'COD_TAMANHO'
    end
  end
  object QVendaGradeLocal: TSQLQuery
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
      '  COD_VENDA,'
      '  COD_PRODUTO,'
      '  COD_GRADE,'
      '  QTDE,'
      '  COD_COR,'
      '  COD_TAMANHO'
      'FROM'
      '  VENDA_GRADE'
      'WHERE'
      '  CODIGO=:PCODIGO'
      '')
    SQLConnection = SQLConnectionLocal
    Left = 198
    Top = 196
    object QVendaGradeLocalCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QVendaGradeLocalCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Required = True
    end
    object QVendaGradeLocalCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QVendaGradeLocalCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Required = True
    end
    object QVendaGradeLocalQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 15
      Size = 3
    end
    object QVendaGradeLocalCOD_COR: TSmallintField
      FieldName = 'COD_COR'
    end
    object QVendaGradeLocalCOD_TAMANHO: TSmallintField
      FieldName = 'COD_TAMANHO'
    end
  end
  object dspVendaGradeLocal: TDataSetProvider
    DataSet = QVendaGradeLocal
    Options = [poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspVendaGradeLocalBeforeUpdateRecord
    Left = 226
    Top = 196
  end
  object TVendaGradeLocal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspVendaGradeLocal'
    OnNewRecord = TVendaGradeLocalNewRecord
    Left = 254
    Top = 196
    object TVendaGradeLocalCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TVendaGradeLocalCOD_VENDA: TIntegerField
      FieldName = 'COD_VENDA'
      Required = True
    end
    object TVendaGradeLocalCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object TVendaGradeLocalCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Required = True
    end
    object TVendaGradeLocalQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 15
      Size = 3
    end
    object TVendaGradeLocalCOD_COR: TSmallintField
      FieldName = 'COD_COR'
    end
    object TVendaGradeLocalCOD_TAMANHO: TSmallintField
      FieldName = 'COD_TAMANHO'
    end
  end
  object QBaixaGradeLocal: TSQLQuery
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
      '  QTDE'
      'FROM'
      '  ESTOQUE_GRADE'
      'WHERE'
      '  CODIGO=:PCODIGO')
    SQLConnection = SQLConnectionLocal
    Left = 351
    Top = 196
    object QBaixaGradeLocalCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBaixaGradeLocalQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 15
      Size = 3
    end
  end
  object dspBaixaGradeLocal: TDataSetProvider
    DataSet = QBaixaGradeLocal
    UpdateMode = upWhereKeyOnly
    Left = 379
    Top = 196
  end
  object TBaixaGradeLocal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspBaixaGradeLocal'
    Left = 407
    Top = 196
    object TBaixaGradeLocalCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TBaixaGradeLocalQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 15
      Size = 3
    end
  end
  object QBaixaGrade: TSQLQuery
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
      '  QTDE'
      'FROM'
      '  ESTOQUE_GRADE'
      'WHERE'
      '  CODIGO=:PCODIGO')
    SQLConnection = SQLConnectionRetaguarda
    Left = 622
    Top = 423
    object QBaixaGradeCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QBaixaGradeQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 15
      Size = 3
    end
  end
  object dspBaixaGrade: TDataSetProvider
    DataSet = QBaixaGrade
    UpdateMode = upWhereKeyOnly
    Left = 650
    Top = 423
  end
  object TBaixaGrade: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspBaixaGrade'
    Left = 678
    Top = 423
    object TBaixaGradeCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TBaixaGradeQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 15
      Size = 3
    end
  end
  object QBuscaGradeDAV: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODORC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODPRODUTO'
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
      '  C.NOME_COR,'
      '  T.NOME_TAMANHO,'
      '  E.REFERENCIA,'
      '  E.COD_BARRA,'
      '  E.VARIACAO'
      'FROM'
      '  ORCAMENTO_GRADE G'
      '  LEFT JOIN ESTOQUE_GRADE_CORES C ON C.CODIGO = G.COD_COR'
      '  LEFT JOIN ESTOQUE_GRADE_TAMANHOS T ON T.CODIGO = G.COD_TAMANHO'
      '  LEFT JOIN ESTOQUE_GRADE E ON E.CODIGO = G.COD_GRADE'
      'WHERE'
      '  G.COD_ORCAMENTO = :PCODORC'
      'AND'
      '  G.COD_PRODUTO = :PCODPRODUTO')
    SQLConnection = SQLConnectionRetaguarda
    Left = 193
    Top = 477
  end
  object dspBuscaGradeDAV: TDataSetProvider
    DataSet = QBuscaGradeDAV
    Left = 221
    Top = 477
  end
  object TBuscaGradeDAV: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PCODORC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODPRODUTO'
        ParamType = ptInput
      end>
    ProviderName = 'dspBuscaGradeDAV'
    Left = 249
    Top = 477
    object TBuscaGradeDAVCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TBuscaGradeDAVCOD_ORCAMENTO: TIntegerField
      FieldName = 'COD_ORCAMENTO'
      Required = True
    end
    object TBuscaGradeDAVCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object TBuscaGradeDAVCOD_GRADE: TIntegerField
      FieldName = 'COD_GRADE'
      Required = True
    end
    object TBuscaGradeDAVQTDE: TFMTBCDField
      FieldName = 'QTDE'
      DisplayFormat = '0.000'
      Precision = 15
      Size = 3
    end
    object TBuscaGradeDAVCOD_COR: TSmallintField
      FieldName = 'COD_COR'
    end
    object TBuscaGradeDAVCOD_TAMANHO: TSmallintField
      FieldName = 'COD_TAMANHO'
    end
    object TBuscaGradeDAVNOME_COR: TStringField
      FieldName = 'NOME_COR'
      Size = 35
    end
    object TBuscaGradeDAVNOME_TAMANHO: TStringField
      FieldName = 'NOME_TAMANHO'
      Size = 15
    end
    object TBuscaGradeDAVREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object TBuscaGradeDAVCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
    end
    object TBuscaGradeDAVVARIACAO: TStringField
      FieldName = 'VARIACAO'
      Size = 50
    end
  end
  object QOrcDAV: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PDAV'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  NUMERO_DAV,'
      '  SITUACAO,'
      '  NUMERO_CUPOM,'
      '  NUMERO_SERIE_ECF,'
      '  NUMERO_CAIXA'
      'FROM'
      '  ORCAMENTO'
      'WHERE'
      '  NUMERO_DAV = :PDAV')
    SQLConnection = SQLConnectionRetaguarda
    Left = 321
    Top = 477
    object QOrcDAVCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QOrcDAVNUMERO_DAV: TIntegerField
      FieldName = 'NUMERO_DAV'
    end
    object QOrcDAVSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QOrcDAVNUMERO_CUPOM: TIntegerField
      FieldName = 'NUMERO_CUPOM'
    end
    object QOrcDAVNUMERO_SERIE_ECF: TStringField
      FieldName = 'NUMERO_SERIE_ECF'
    end
    object QOrcDAVNUMERO_CAIXA: TSmallintField
      FieldName = 'NUMERO_CAIXA'
    end
  end
  object dspOrcDAV: TDataSetProvider
    DataSet = QOrcDAV
    UpdateMode = upWhereKeyOnly
    Left = 350
    Top = 477
  end
  object TOrcDAV: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PDAV'
        ParamType = ptInput
      end>
    ProviderName = 'dspOrcDAV'
    Left = 379
    Top = 477
    object TOrcDAVCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TOrcDAVNUMERO_DAV: TIntegerField
      FieldName = 'NUMERO_DAV'
    end
    object TOrcDAVSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TOrcDAVNUMERO_CUPOM: TIntegerField
      FieldName = 'NUMERO_CUPOM'
    end
    object TOrcDAVNUMERO_SERIE_ECF: TStringField
      FieldName = 'NUMERO_SERIE_ECF'
    end
    object TOrcDAVNUMERO_CAIXA: TSmallintField
      FieldName = 'NUMERO_CAIXA'
    end
  end
  object QContabilista: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '  CODIGO,'
      '  NOME,'
      '  CPF,'
      '  CRC,'
      '  CNPJ,'
      '  CEP,'
      '  ENDERECO,'
      '  NUMERO,'
      '  COMPLEMENTO,'
      '  BAIRRO,'
      '  FONE,'
      '  FAX,'
      '  EMAIL,'
      '  COD_MUNICIPIO,'
      '  CIDADE'
      'FROM'
      '  CONTABILISTA'
      '  '
      '  ')
    SQLConnection = SQLConnectionLocal
    Left = 487
    Top = 196
    object QContabilistaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QContabilistaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QContabilistaCPF: TStringField
      FieldName = 'CPF'
    end
    object QContabilistaCRC: TStringField
      FieldName = 'CRC'
    end
    object QContabilistaCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object QContabilistaCEP: TStringField
      FieldName = 'CEP'
      Size = 16
    end
    object QContabilistaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object QContabilistaNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object QContabilistaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 45
    end
    object QContabilistaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 35
    end
    object QContabilistaFONE: TStringField
      FieldName = 'FONE'
      Size = 16
    end
    object QContabilistaFAX: TStringField
      FieldName = 'FAX'
      Size = 16
    end
    object QContabilistaEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 40
    end
    object QContabilistaCOD_MUNICIPIO: TStringField
      FieldName = 'COD_MUNICIPIO'
      Size = 10
    end
    object QContabilistaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 45
    end
  end
  object dspContabilista: TDataSetProvider
    DataSet = QContabilista
    UpdateMode = upWhereKeyOnly
    Left = 515
    Top = 196
  end
  object TContabilista: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContabilista'
    Left = 543
    Top = 196
    object TContabilistaCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object TContabilistaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object TContabilistaCPF: TStringField
      FieldName = 'CPF'
    end
    object TContabilistaCRC: TStringField
      FieldName = 'CRC'
    end
    object TContabilistaCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object TContabilistaCEP: TStringField
      FieldName = 'CEP'
      Size = 16
    end
    object TContabilistaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object TContabilistaNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object TContabilistaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 45
    end
    object TContabilistaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 35
    end
    object TContabilistaFONE: TStringField
      FieldName = 'FONE'
      Size = 16
    end
    object TContabilistaFAX: TStringField
      FieldName = 'FAX'
      Size = 16
    end
    object TContabilistaEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 40
    end
    object TContabilistaCOD_MUNICIPIO: TStringField
      FieldName = 'COD_MUNICIPIO'
      Size = 10
    end
    object TContabilistaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 45
    end
  end
end
