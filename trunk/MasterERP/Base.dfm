object BancoDados: TBancoDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 568
  Width = 739
  object Conexao: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxfb.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      
        'Database=localhost:D:\Automa'#231#227'o Comercial\MasterSoft\MasterERP\d' +
        'b\MASTERERP.FDB'
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
  object qryUsuario: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from usuario')
    SQLConnection = Conexao
    Left = 66
    Top = 71
    object qryUsuarioUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
      DisplayFormat = '0000000000'
    end
    object qryUsuarioATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object qryUsuarioDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object qryUsuarioNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryUsuarioLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 25
    end
    object qryUsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Size = 15
    end
    object qryUsuarioUSUARIO_NIVEL_ID: TIntegerField
      FieldName = 'USUARIO_NIVEL_ID'
      DisplayFormat = '0000000000'
    end
    object qryUsuarioDATA_ULTIMA_ALTERAÃÃƒO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERA'#195#8225#195#402'O'
    end
  end
  object DSUsuario: TDataSource
    DataSet = CDSUsuario
    Left = 68
    Top = 203
  end
  object CDSUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPUsuario'
    Left = 68
    Top = 160
    object CDSUsuarioUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
      DisplayFormat = '0000000000'
    end
    object CDSUsuarioATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object CDSUsuarioDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object CDSUsuarioNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object CDSUsuarioLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 25
    end
    object CDSUsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Size = 15
    end
    object CDSUsuarioUSUARIO_NIVEL_ID: TIntegerField
      FieldName = 'USUARIO_NIVEL_ID'
      DisplayFormat = '0000000000'
    end
    object CDSUsuarioDATA_ULTIMA_ALTERAÃÃƒO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERA'#195#8225#195#402'O'
    end
  end
  object DSPUsuario: TDataSetProvider
    DataSet = qryUsuario
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 67
    Top = 116
  end
  object qryLog: TSQLQuery
    AfterOpen = qryLogAfterOpen
    AfterClose = qryLogAfterClose
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      '')
    SQLConnection = Conexao
    Left = 81
    Top = 15
  end
  object qryAlteracao: TSQLQuery
    AfterOpen = qryAlteracaoAfterOpen
    AfterClose = qryAlteracaoAfterClose
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'select * from alteracao')
    SQLConnection = Conexao
    Left = 99
    Top = 71
    object qryAlteracaoALTERACAO_ID: TIntegerField
      FieldName = 'ALTERACAO_ID'
      DisplayFormat = '0000000000'
    end
    object qryAlteracaoTABELA: TStringField
      FieldName = 'TABELA'
      Size = 60
    end
    object qryAlteracaoUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
      DisplayFormat = '0000000000'
    end
    object qryAlteracaoDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object qryAlteracaoDADOS: TMemoField
      FieldName = 'DADOS'
      BlobType = ftMemo
      Size = 1
    end
    object qryAlteracaoRECUPERADA: TSmallintField
      FieldName = 'RECUPERADA'
    end
    object qryAlteracaoDATA_RECUPERACAO: TSQLTimeStampField
      FieldName = 'DATA_RECUPERACAO'
    end
    object qryAlteracaoATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object qryAlteracaocalc_nome_usuario: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nome_usuario'
      LookupDataSet = qryUsuario
      LookupKeyFields = 'USUARIO_ID'
      LookupResultField = 'LOGIN'
      KeyFields = 'USUARIO_ID'
      Lookup = True
    end
    object qryAlteracaocalc_descricao_tabela: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_descricao_tabela'
      LookupDataSet = qryTabela
      LookupKeyFields = 'TABELA'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TABELA'
      Lookup = True
    end
  end
  object DSAlteracao: TDataSource
    DataSet = CDSAlteracao
    Left = 100
    Top = 203
  end
  object DSPAlteracao: TDataSetProvider
    DataSet = qryAlteracao
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 98
    Top = 116
  end
  object CDSAlteracao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPAlteracao'
    Left = 99
    Top = 160
    object CDSAlteracaoALTERACAO_ID: TIntegerField
      FieldName = 'ALTERACAO_ID'
      DisplayFormat = '0000000000'
    end
    object CDSAlteracaoTABELA: TStringField
      FieldName = 'TABELA'
      Size = 60
    end
    object CDSAlteracaoUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
      DisplayFormat = '0000000000'
    end
    object CDSAlteracaoDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object CDSAlteracaoDADOS: TMemoField
      FieldName = 'DADOS'
      BlobType = ftMemo
      Size = 1
    end
    object CDSAlteracaoRECUPERADA: TSmallintField
      FieldName = 'RECUPERADA'
    end
    object CDSAlteracaoDATA_RECUPERACAO: TSQLTimeStampField
      FieldName = 'DATA_RECUPERACAO'
    end
    object CDSAlteracaoATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object CDSAlteracaocalc_nome_usuario: TStringField
      FieldName = 'calc_nome_usuario'
      ReadOnly = True
    end
    object CDSAlteracaocalc_descricao_tabela: TStringField
      FieldName = 'calc_descricao_tabela'
      ReadOnly = True
    end
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
      'select * from usuario')
    SQLConnection = Conexao
    Left = 164
    Top = 15
    object qryLoginUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
    end
    object qryLoginLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 25
    end
    object qryLoginSENHA: TStringField
      FieldName = 'SENHA'
      Size = 8
    end
    object qryLoginNIVEL: TStringField
      FieldName = 'NIVEL'
      Size = 5
    end
  end
  object qryTabela: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from tabela')
    SQLConnection = Conexao
    Left = 132
    Top = 71
    object qryTabelaTABELA: TStringField
      FieldName = 'TABELA'
      Size = 60
    end
    object qryTabelaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryTabelaATIVAR_TRACE: TSmallintField
      FieldName = 'ATIVAR_TRACE'
    end
  end
  object DSTabela: TDataSource
    DataSet = CDSTabela
    Left = 133
    Top = 203
  end
  object DSPTabela: TDataSetProvider
    DataSet = qryTabela
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 133
    Top = 116
  end
  object CDSTabela: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPTabela'
    Left = 134
    Top = 159
    object CDSTabelaTABELA: TStringField
      FieldName = 'TABELA'
      Size = 60
    end
    object CDSTabelaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CDSTabelaATIVAR_TRACE: TSmallintField
      FieldName = 'ATIVAR_TRACE'
    end
  end
  object qryPessoaEndereco: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from pessoa_endereco where pessoa_endereco_id = 0')
    SQLConnection = Conexao
    Left = 29
    Top = 71
  end
  object DSPessoaEndereco: TDataSource
    DataSet = CDSPessoaEndereco
    Left = 31
    Top = 203
  end
  object DSPPessoaEndereco: TDataSetProvider
    DataSet = qryPessoaEndereco
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 29
    Top = 115
  end
  object CDSPessoaEndereco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPessoaEndereco'
    AfterInsert = CDSPessoaEnderecoAfterInsert
    BeforePost = CDSPessoaBeforePost
    OnCalcFields = CDSPessoaEnderecoCalcFields
    Left = 30
    Top = 160
    object CDSPessoaEnderecoPESSOA_ENDERECO_ID: TIntegerField
      FieldName = 'PESSOA_ENDERECO_ID'
    end
    object CDSPessoaEnderecoPESSOA_ID: TIntegerField
      FieldName = 'PESSOA_ID'
    end
    object CDSPessoaEnderecoMUNICIPIO_ID: TIntegerField
      FieldName = 'MUNICIPIO_ID'
    end
    object CDSPessoaEnderecoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object CDSPessoaEnderecoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 15
    end
    object CDSPessoaEnderecoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object CDSPessoaEnderecoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object CDSPessoaEnderecoCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object CDSPessoaEnderecocalc_municipio_nome: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_municipio_nome'
      Size = 120
      Calculated = True
    end
    object CDSPessoaEnderecocalc_municipio_uf: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_municipio_uf'
      Size = 2
      Calculated = True
    end
  end
  object tmpCDSUsuarioAcesso: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPTmpUsuarioAcesso'
    Left = 276
    Top = 16
    object tmpCDSUsuarioAcessoUSUARIO_ACESSO_ID: TIntegerField
      FieldName = 'USUARIO_ACESSO_ID'
    end
    object tmpCDSUsuarioAcessoUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
    end
    object tmpCDSUsuarioAcessoTABELA: TStringField
      FieldName = 'TABELA'
      Size = 60
    end
    object tmpCDSUsuarioAcessoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object tmpCDSUsuarioAcessoVALOR: TSmallintField
      FieldName = 'VALOR'
    end
    object tmpCDSUsuarioAcessoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 12
    end
  end
  object qryTmpUsuarioAcesso: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from usuario_acesso')
    SQLConnection = Conexao
    Left = 203
    Top = 15
    object qryTmpUsuarioAcessoUSUARIO_ACESSO_ID: TIntegerField
      FieldName = 'USUARIO_ACESSO_ID'
    end
    object qryTmpUsuarioAcessoUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
    end
    object qryTmpUsuarioAcessoTABELA: TStringField
      FieldName = 'TABELA'
      Size = 60
    end
    object qryTmpUsuarioAcessoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryTmpUsuarioAcessoVALOR: TSmallintField
      FieldName = 'VALOR'
    end
    object qryTmpUsuarioAcessoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 12
    end
  end
  object DSPTmpUsuarioAcesso: TDataSetProvider
    DataSet = qryTmpUsuarioAcesso
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 239
    Top = 16
  end
  object DSUsuarioNivel: TDataSource
    DataSet = CDSUsuarioNivel
    Left = 170
    Top = 203
  end
  object CDSUsuarioNivel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPUsuarioNivel'
    Left = 169
    Top = 159
    object CDSUsuarioNivelUSUARIO_NIVEL_ID: TIntegerField
      FieldName = 'USUARIO_NIVEL_ID'
    end
    object CDSUsuarioNivelDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object DSPUsuarioNivel: TDataSetProvider
    DataSet = qryUsuarioNivel
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 168
    Top = 116
  end
  object qryUsuarioNivel: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from usuario_nivel')
    SQLConnection = Conexao
    Left = 168
    Top = 71
    object qryUsuarioNivelUSUARIO_NIVEL_ID: TIntegerField
      FieldName = 'USUARIO_NIVEL_ID'
    end
    object qryUsuarioNivelDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object qryGeraID: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 312
    Top = 16
  end
  object qryUsuarioExibir: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from usuario_exibir where usuario_exibir_id = 0')
    SQLConnection = Conexao
    Left = 203
    Top = 71
    object qryUsuarioExibirUSUARIO_EXIBIR_ID: TLargeintField
      FieldName = 'USUARIO_EXIBIR_ID'
      DisplayFormat = '0000000000'
    end
    object qryUsuarioExibirUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
    end
    object qryUsuarioExibirFONTE_NOME: TStringField
      FieldName = 'FONTE_NOME'
      Size = 60
    end
    object qryUsuarioExibirFONTE_TAMANHO: TSmallintField
      FieldName = 'FONTE_TAMANHO'
    end
    object qryUsuarioExibirTABELA: TStringField
      FieldName = 'TABELA'
      Size = 60
    end
  end
  object DSCDSUsuarioExibirColuna: TDataSource
    DataSet = CDSUsuarioExibirColuna
    Left = 239
    Top = 203
  end
  object CDSUsuarioExibir: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPUsuarioExibir'
    Left = 204
    Top = 159
    object CDSUsuarioExibirUSUARIO_EXIBIR_ID: TLargeintField
      FieldName = 'USUARIO_EXIBIR_ID'
    end
    object CDSUsuarioExibirUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
    end
    object CDSUsuarioExibirFONTE_NOME: TStringField
      FieldName = 'FONTE_NOME'
      Size = 60
    end
    object CDSUsuarioExibirFONTE_TAMANHO: TSmallintField
      FieldName = 'FONTE_TAMANHO'
    end
    object CDSUsuarioExibirTABELA: TStringField
      FieldName = 'TABELA'
      Size = 60
    end
  end
  object CDSUsuarioExibirColuna: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPUsuarioExibirColuna'
    Left = 239
    Top = 159
    object CDSUsuarioExibirColunaUSUARIO_EXIBIR_COLUNA_ID: TLargeintField
      FieldName = 'USUARIO_EXIBIR_COLUNA_ID'
    end
    object CDSUsuarioExibirColunaUSUARIO_EXIBIR_ID: TLargeintField
      FieldName = 'USUARIO_EXIBIR_ID'
    end
    object CDSUsuarioExibirColunaINDICE: TSmallintField
      FieldName = 'INDICE'
    end
    object CDSUsuarioExibirColunaCOLUNA_NOME: TStringField
      FieldName = 'COLUNA_NOME'
      Size = 60
    end
    object CDSUsuarioExibirColunaCOLUNA_LABEL: TStringField
      FieldName = 'COLUNA_LABEL'
      Size = 60
    end
    object CDSUsuarioExibirColunaVISIVEL: TSmallintField
      FieldName = 'VISIVEL'
    end
    object CDSUsuarioExibirColunaTAMANHO: TSmallintField
      FieldName = 'TAMANHO'
    end
    object CDSUsuarioExibirColunaALINHAMENTO: TStringField
      FieldName = 'ALINHAMENTO'
      Size = 15
    end
  end
  object DSPUsuarioExibir: TDataSetProvider
    DataSet = qryUsuarioExibir
    Left = 204
    Top = 116
  end
  object DSPUsuarioExibirColuna: TDataSetProvider
    DataSet = qryUsuarioExibirColuna
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 238
    Top = 116
  end
  object qryUsuarioExibirColuna: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'select * from usuario_exibir_coluna where usuario_exibir_coluna_' +
        'id = 0')
    SQLConnection = Conexao
    Left = 238
    Top = 71
    object qryUsuarioExibirColunaUSUARIO_EXIBIR_COLUNA_ID: TLargeintField
      FieldName = 'USUARIO_EXIBIR_COLUNA_ID'
      DisplayFormat = '0000000000'
    end
    object qryUsuarioExibirColunaUSUARIO_EXIBIR_ID: TLargeintField
      FieldName = 'USUARIO_EXIBIR_ID'
    end
    object qryUsuarioExibirColunaINDICE: TSmallintField
      FieldName = 'INDICE'
    end
    object qryUsuarioExibirColunaCOLUNA_NOME: TStringField
      FieldName = 'COLUNA_NOME'
      Size = 60
    end
    object qryUsuarioExibirColunaCOLUNA_LABEL: TStringField
      FieldName = 'COLUNA_LABEL'
      Size = 60
    end
    object qryUsuarioExibirColunaVISIVEL: TSmallintField
      FieldName = 'VISIVEL'
    end
    object qryUsuarioExibirColunaTAMANHO: TSmallintField
      FieldName = 'TAMANHO'
    end
    object qryUsuarioExibirColunaALINHAMENTO: TStringField
      FieldName = 'ALINHAMENTO'
      Size = 15
    end
  end
  object qryUsuarioPrivilegio: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from usuario_privilegio')
    SQLConnection = Conexao
    Left = 305
    Top = 71
    object qryUsuarioPrivilegioUSUARIO_PRIVILEGIO_ID: TLargeintField
      FieldName = 'USUARIO_PRIVILEGIO_ID'
    end
    object qryUsuarioPrivilegioUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
    end
    object qryUsuarioPrivilegioPRIVILEGIO_ID: TIntegerField
      FieldName = 'PRIVILEGIO_ID'
    end
    object qryUsuarioPrivilegioACESSO: TIntegerField
      FieldName = 'ACESSO'
    end
  end
  object CDSUsuarioPrivilegio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPUsuarioPrivilegio'
    Left = 307
    Top = 159
    object CDSUsuarioPrivilegioUSUARIO_PRIVILEGIO_ID: TLargeintField
      FieldName = 'USUARIO_PRIVILEGIO_ID'
    end
    object CDSUsuarioPrivilegioUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
    end
    object CDSUsuarioPrivilegioPRIVILEGIO_ID: TIntegerField
      FieldName = 'PRIVILEGIO_ID'
    end
    object CDSUsuarioPrivilegioACESSO: TIntegerField
      FieldName = 'ACESSO'
    end
  end
  object DSPUsuarioPrivilegio: TDataSetProvider
    DataSet = qryUsuarioPrivilegio
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 306
    Top = 116
  end
  object CDSPrivilegio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPrivilegio'
    Left = 272
    Top = 159
    object CDSPrivilegioPRIVILEGIO_ID: TIntegerField
      FieldName = 'PRIVILEGIO_ID'
    end
    object CDSPrivilegioTABELA: TStringField
      FieldName = 'TABELA'
      Size = 60
    end
    object CDSPrivilegioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object CDSPrivilegioABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      Size = 15
    end
  end
  object DSPPrivilegio: TDataSetProvider
    DataSet = qryPrivilegio
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 272
    Top = 116
  end
  object qryPrivilegio: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from privilegio')
    SQLConnection = Conexao
    Left = 272
    Top = 71
    object qryPrivilegioPRIVILEGIO_ID: TIntegerField
      FieldName = 'PRIVILEGIO_ID'
    end
    object qryPrivilegioTABELA: TStringField
      FieldName = 'TABELA'
      Size = 60
    end
    object qryPrivilegioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object qryPrivilegioABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      Size = 15
    end
  end
  object qryAuxiliar: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 352
    Top = 16
  end
  object qryMunicipio: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from municipio where municipio_id = 0')
    SQLConnection = Conexao
    Left = 338
    Top = 71
  end
  object DSMunicipio: TDataSource
    DataSet = CDSMunicipio
    Left = 339
    Top = 202
  end
  object CDSMunicipio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPMunicipio'
    Left = 339
    Top = 159
    object CDSMunicipioMUNICIPIO_ID: TIntegerField
      FieldName = 'MUNICIPIO_ID'
    end
    object CDSMunicipioNOME: TStringField
      FieldName = 'NOME'
      Size = 121
    end
    object CDSMunicipioUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object CDSMunicipioUF_ID: TIntegerField
      FieldName = 'UF_ID'
    end
  end
  object DSPMunicipio: TDataSetProvider
    DataSet = qryMunicipio
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 338
    Top = 115
  end
  object DSPessoaContato: TDataSource
    DataSet = CDSPessoaContato
    Left = 370
    Top = 202
  end
  object CDSPessoaContato: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPessoaContato'
    AfterInsert = CDSPessoaContatoAfterInsert
    OnCalcFields = CDSPessoaContatoCalcFields
    Left = 370
    Top = 159
    object CDSPessoaContatoPESSOA_CONTATO_ID: TIntegerField
      FieldName = 'PESSOA_CONTATO_ID'
    end
    object CDSPessoaContatoPESSOA_ID: TIntegerField
      FieldName = 'PESSOA_ID'
    end
    object CDSPessoaContatoPESSOA_CONTATO_TIPO_ID: TIntegerField
      FieldName = 'PESSOA_CONTATO_TIPO_ID'
    end
    object CDSPessoaContatoVALOR: TStringField
      FieldName = 'VALOR'
      Size = 60
    end
    object CDSPessoaContatocalc_contato_tipo_descricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_contato_tipo_descricao'
      Size = 60
      Calculated = True
    end
  end
  object DSPPessoaContato: TDataSetProvider
    DataSet = qryPessoaContato
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 370
    Top = 115
  end
  object qryPessoaContato: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from pessoa_contato where pessoa_contato_id = 0')
    SQLConnection = Conexao
    Left = 370
    Top = 71
  end
  object qryPessoa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from pessoa where pessoa_id = 0')
    SQLConnection = Conexao
    Left = 401
    Top = 71
  end
  object DSPPessoa: TDataSetProvider
    DataSet = qryPessoa
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 402
    Top = 115
  end
  object CDSPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPessoa'
    AfterInsert = CDSPessoaAfterInsert
    BeforePost = CDSPessoaBeforePost
    AfterPost = CDSPessoaAfterPost
    BeforeCancel = CDSPessoaBeforeCancel
    AfterCancel = CDSPessoaAfterCancel
    BeforeDelete = CDSPessoaBeforeDelete
    AfterDelete = CDSPessoaAfterDelete
    Left = 403
    Top = 159
    object CDSPessoaPESSOA_ID: TIntegerField
      FieldName = 'PESSOA_ID'
    end
    object CDSPessoaATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object CDSPessoaDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object CDSPessoaDATA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
    end
    object CDSPessoaNOME_APELIDO_FANTASIA: TStringField
      FieldName = 'NOME_APELIDO_FANTASIA'
      Size = 60
    end
    object CDSPessoaNOME_RAZAO: TStringField
      FieldName = 'NOME_RAZAO'
      Size = 60
    end
  end
  object DSPessoa: TDataSource
    DataSet = CDSPessoa
    Left = 404
    Top = 202
  end
  object DSUnidade: TDataSource
    DataSet = CDSUnidade
    Left = 440
    Top = 202
  end
  object CDSUnidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPUnidade'
    Left = 437
    Top = 159
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
    Left = 437
    Top = 115
  end
  object qryUnidade: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from unidade where unidade_id = 0')
    SQLConnection = Conexao
    Left = 435
    Top = 71
  end
  object qryParametro: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from parametro where parametro = 0')
    SQLConnection = Conexao
    Left = 468
    Top = 71
  end
  object DSParametro: TDataSource
    DataSet = CDSParametro
    Left = 472
    Top = 202
  end
  object CDSParametro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPParametro'
    Left = 470
    Top = 159
  end
  object DSPParametro: TDataSetProvider
    DataSet = qryParametro
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 469
    Top = 115
  end
  object qryGrupoProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from produto_grupo where produto_grupo_id = 0')
    SQLConnection = Conexao
    Left = 500
    Top = 71
  end
  object qrySubGrupoProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from produto_subgrupo where produto_subgrupo_id = 0')
    SQLConnection = Conexao
    Left = 533
    Top = 71
  end
  object DSGrupoProduto: TDataSource
    DataSet = CDSGrupoProduto
    Left = 503
    Top = 202
  end
  object DSSubGrupoProduto: TDataSource
    DataSet = CDSSubGrupoProduto
    Left = 535
    Top = 202
  end
  object CDSGrupoProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPGrupoProduto'
    Left = 502
    Top = 159
    object CDSGrupoProdutoPRODUTO_GRUPO_ID: TIntegerField
      FieldName = 'PRODUTO_GRUPO_ID'
      DisplayFormat = '0000000000'
    end
    object CDSGrupoProdutoATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object CDSGrupoProdutoDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object CDSGrupoProdutoDATA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
    end
    object CDSGrupoProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object CDSSubGrupoProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPSubGrupoProduto'
    Left = 534
    Top = 159
    object CDSSubGrupoProdutoPRODUTO_SUBGRUPO_ID: TIntegerField
      FieldName = 'PRODUTO_SUBGRUPO_ID'
      DisplayFormat = '0000000000'
    end
    object CDSSubGrupoProdutoATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object CDSSubGrupoProdutoDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object CDSSubGrupoProdutoDATA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
    end
    object CDSSubGrupoProdutoPRODUTO_GRUPO_ID: TIntegerField
      FieldName = 'PRODUTO_GRUPO_ID'
    end
    object CDSSubGrupoProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CDSSubGrupoProdutol_grupo_descricao: TStringField
      FieldKind = fkLookup
      FieldName = 'l_grupo_descricao'
      LookupDataSet = CDSGrupoProduto
      LookupKeyFields = 'PRODUTO_GRUPO_ID'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PRODUTO_GRUPO_ID'
      Lookup = True
    end
  end
  object DSPGrupoProduto: TDataSetProvider
    DataSet = qryGrupoProduto
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 501
    Top = 114
  end
  object DSPSubGrupoProduto: TDataSetProvider
    DataSet = qrySubGrupoProduto
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 534
    Top = 114
  end
  object qryPessoaImagem: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'select * from pessoa_imagem where pessoa_imagem_id = 0')
    SQLConnection = Conexao
    Left = 565
    Top = 71
  end
  object DSPessoaImagem: TDataSource
    DataSet = CDSPessoaImagem
    Left = 568
    Top = 202
  end
  object CDSPessoaImagem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPessoaImagem'
    AfterInsert = CDSPessoaImagemAfterInsert
    Left = 567
    Top = 159
    object CDSPessoaImagemPESSOA_IMAGEM_ID: TIntegerField
      FieldName = 'PESSOA_IMAGEM_ID'
    end
    object CDSPessoaImagemPESSOA_ID: TIntegerField
      FieldName = 'PESSOA_ID'
    end
    object CDSPessoaImagemIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      Size = 1
    end
  end
  object DSPPessoaImagem: TDataSetProvider
    DataSet = qryPessoaImagem
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 567
    Top = 114
  end
  object DSPessoaContatoTipo: TDataSource
    DataSet = CDSPessoaContatoTipo
    Left = 602
    Top = 202
  end
  object CDSPessoaContatoTipo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPessoaContatoTipo'
    AfterInsert = CDSPessoaContatoTipoAfterInsert
    AfterPost = CDSPessoaContatoTipoAfterPost
    BeforeCancel = CDSPessoaContatoTipoBeforeCancel
    AfterCancel = CDSPessoaContatoTipoAfterCancel
    BeforeDelete = CDSPessoaContatoTipoBeforeDelete
    AfterDelete = CDSPessoaContatoTipoAfterDelete
    Left = 602
    Top = 160
    object CDSPessoaContatoTipoPESSOA_CONTATO_TIPO_ID: TIntegerField
      FieldName = 'PESSOA_CONTATO_TIPO_ID'
    end
    object CDSPessoaContatoTipoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object DSPPessoaContatoTipo: TDataSetProvider
    DataSet = qryPessoaContatoTipo
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 601
    Top = 114
  end
  object qryPessoaContatoTipo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'select * from pessoa_contato_tipo where pessoa_contato_tipo_id =' +
        ' 0')
    SQLConnection = Conexao
    Left = 600
    Top = 71
  end
end
