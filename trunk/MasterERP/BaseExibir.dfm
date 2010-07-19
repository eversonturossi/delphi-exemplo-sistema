object BancoDadosExibir: TBancoDadosExibir
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 280
  Width = 186
  object DSExibirColunas: TDataSource
    DataSet = CDSExibirColunas
    Left = 92
    Top = 205
  end
  object CDSExibirColunas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPExibirColunas'
    Left = 91
    Top = 160
    object CDSExibirColunasUSUARIO_EXIBIR_COLUNA_ID: TLargeintField
      FieldName = 'USUARIO_EXIBIR_COLUNA_ID'
    end
    object CDSExibirColunasUSUARIO_EXIBIR_ID: TLargeintField
      FieldName = 'USUARIO_EXIBIR_ID'
    end
    object CDSExibirColunasINDICE: TSmallintField
      FieldName = 'INDICE'
    end
    object CDSExibirColunasCOLUNA_NOME: TStringField
      FieldName = 'COLUNA_NOME'
      Size = 60
    end
    object CDSExibirColunasCOLUNA_LABEL: TStringField
      FieldName = 'COLUNA_LABEL'
      Size = 60
    end
    object CDSExibirColunasVISIVEL: TSmallintField
      FieldName = 'VISIVEL'
    end
    object CDSExibirColunasTAMANHO: TSmallintField
      FieldName = 'TAMANHO'
    end
  end
  object DSPExibirColunas: TDataSetProvider
    DataSet = qryExibirColunas
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 91
    Top = 112
  end
  object DSExibir: TDataSource
    DataSet = qryExibir
    Left = 32
    Top = 205
  end
  object CDSExibir: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPExibir'
    Left = 32
    Top = 160
    object CDSExibirUSUARIO_EXIBIR_ID: TLargeintField
      FieldName = 'USUARIO_EXIBIR_ID'
    end
    object CDSExibirUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
    end
    object CDSExibirFONTE_NOME: TStringField
      FieldName = 'FONTE_NOME'
      Size = 60
    end
    object CDSExibirFONTE_TAMANHO: TSmallintField
      FieldName = 'FONTE_TAMANHO'
    end
    object CDSExibirTABELA: TStringField
      FieldName = 'TABELA'
      Size = 60
    end
  end
  object DSPExibir: TDataSetProvider
    DataSet = qryExibir
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 32
    Top = 112
  end
  object qryExibir: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from usuario_exibir')
    SQLConnection = BancoDados.Conexao
    Left = 32
    Top = 66
    object qryExibirUSUARIO_EXIBIR_ID: TLargeintField
      FieldName = 'USUARIO_EXIBIR_ID'
    end
    object qryExibirUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
    end
    object qryExibirFONTE_NOME: TStringField
      FieldName = 'FONTE_NOME'
      Size = 60
    end
    object qryExibirFONTE_TAMANHO: TSmallintField
      FieldName = 'FONTE_TAMANHO'
    end
    object qryExibirTABELA: TStringField
      FieldName = 'TABELA'
      Size = 60
    end
  end
  object qryExibirColunas: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from usuario_exibir_coluna')
    SQLConnection = BancoDados.Conexao
    Left = 91
    Top = 66
    object qryExibirColunasUSUARIO_EXIBIR_COLUNA_ID: TLargeintField
      FieldName = 'USUARIO_EXIBIR_COLUNA_ID'
    end
    object qryExibirColunasUSUARIO_EXIBIR_ID: TLargeintField
      FieldName = 'USUARIO_EXIBIR_ID'
    end
    object qryExibirColunasINDICE: TSmallintField
      FieldName = 'INDICE'
    end
    object qryExibirColunasCOLUNA_NOME: TStringField
      FieldName = 'COLUNA_NOME'
      Size = 60
    end
    object qryExibirColunasCOLUNA_LABEL: TStringField
      FieldName = 'COLUNA_LABEL'
      Size = 60
    end
    object qryExibirColunasVISIVEL: TSmallintField
      FieldName = 'VISIVEL'
    end
    object qryExibirColunasTAMANHO: TSmallintField
      FieldName = 'TAMANHO'
    end
  end
  object qryExecutar: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = BancoDados.Conexao
    Left = 88
    Top = 16
  end
end
