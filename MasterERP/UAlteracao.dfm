object AlteracaoForm: TAlteracaoForm
  Left = 0
  Top = 0
  Caption = 'MasterERP - Altera'#231#245'es'
  ClientHeight = 524
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 770
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 496
      Top = 35
      Width = 19
      Height = 13
      Caption = 'At'#233':'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 352
      Top = 35
      Width = 17
      Height = 13
      Caption = 'De:'
    end
    object Label3: TLabel
      Left = 24
      Top = 20
      Width = 36
      Height = 13
      Caption = 'Tabela:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 21
      Top = 47
      Width = 39
      Height = 13
      Caption = 'Usu'#225'rio:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object RadioGroup1: TRadioGroup
      Left = 336
      Top = 16
      Width = 297
      Height = 48
      TabOrder = 1
    end
    object DTAte: TDateTimePicker
      Left = 525
      Top = 32
      Width = 97
      Height = 21
      Hint = 'Data de Cadastro'
      Date = 40278.096922812500000000
      Time = 40278.096922812500000000
      Enabled = False
      TabOrder = 0
      OnClick = DBLCTabelaClick
    end
    object DTDe: TDateTimePicker
      Left = 379
      Top = 32
      Width = 97
      Height = 21
      Hint = 'Data de Cadastro'
      Date = 40278.096922812500000000
      Time = 40278.096922812500000000
      Enabled = False
      TabOrder = 2
    end
    object CBPeriodo: TCheckBox
      Left = 344
      Top = 9
      Width = 51
      Height = 17
      Caption = 'Per'#237'odo'
      TabOrder = 3
      OnClick = CBPeriodoClick
    end
    object CBAtiva: TCheckBox
      Left = 655
      Top = 19
      Width = 51
      Height = 17
      Caption = 'Ativa'
      TabOrder = 4
      OnClick = DBLCTabelaClick
    end
    object CBRecuperada: TCheckBox
      Left = 655
      Top = 42
      Width = 85
      Height = 17
      Caption = 'Recuperada'
      TabOrder = 5
      OnClick = DBLCTabelaClick
    end
    object DBLCTabela: TDBLookupComboBox
      Left = 77
      Top = 16
      Width = 229
      Height = 21
      KeyField = 'TABELA'
      ListField = 'DESCRICAO'
      ListSource = BancoDados.DSTabela
      TabOrder = 6
      OnClick = DBLCTabelaClick
    end
    object DBLCUsuario: TDBLookupComboBox
      Left = 77
      Top = 43
      Width = 229
      Height = 21
      KeyField = 'USUARIO_ID'
      ListField = 'LOGIN'
      ListSource = BancoDados.DSUsuario
      TabOrder = 7
      OnClick = DBLCTabelaClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 473
    Width = 770
    Height = 51
    Align = alBottom
    TabOrder = 1
    object BTFechar: TSpeedButton
      Left = 647
      Top = 6
      Width = 116
      Height = 35
      Caption = 'Fechar'
    end
    object BTRestaurar: TSpeedButton
      Left = 527
      Top = 6
      Width = 116
      Height = 35
      Caption = 'Restaurar'
      OnClick = BTRestaurarClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 93
    Width = 770
    Height = 180
    TabStop = False
    Align = alClient
    Color = clWhite
    DataSource = DSCDSPesquisaTabela
    FixedColor = clGray
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ALTERACAO_ID'
        Title.Caption = 'Altera'#231#227'o I.D'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ATIVO'
        Title.Caption = 'Ativa'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_CADASTRO'
        Title.Caption = 'Data Lan'#231'amento'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECUPERADA'
        Title.Caption = 'Recup.'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_RECUPERACAO'
        Title.Caption = 'Data Recupera'#231#227'o'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'calc_descricao_tabela'
        Title.Caption = 'Tabela'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'calc_nome_usuario'
        Title.Caption = 'Usu'#225'rio'
        Width = 150
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 73
    Width = 770
    Height = 20
    Align = alTop
    Caption = 'Tabelas Alteradas'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 293
    Width = 770
    Height = 180
    TabStop = False
    Align = alBottom
    Color = clWhite
    DataSource = DSCDSInformacao
    FixedColor = clGray
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ATUALIZA'
        Title.Caption = 'Atualiza'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TABELA'
        Title.Caption = 'Tabela'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAMPO'
        Title.Caption = 'Campo'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_ANTERIOR'
        Title.Caption = 'Valor Anterior'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_ATUAL'
        Title.Caption = 'Valor Atual'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = True
      end>
  end
  object Panel4: TPanel
    Left = 0
    Top = 273
    Width = 770
    Height = 20
    Align = alBottom
    Caption = 'Informa'#231#245'es Alteradas'
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
  end
  object qryPesquisaAlteracao: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'select * from alteracao')
    SQLConnection = BancoDados.Conexao
    Left = 648
    Top = 80
    object qryPesquisaAlteracaoALTERACAO_ID: TIntegerField
      FieldName = 'ALTERACAO_ID'
    end
    object qryPesquisaAlteracaoTABELA: TStringField
      FieldName = 'TABELA'
      Size = 60
    end
    object qryPesquisaAlteracaoUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
    end
    object qryPesquisaAlteracaoDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object qryPesquisaAlteracaoDADOS: TMemoField
      FieldName = 'DADOS'
      BlobType = ftMemo
      Size = 1
    end
    object qryPesquisaAlteracaoRECUPERADA: TSmallintField
      FieldName = 'RECUPERADA'
    end
    object qryPesquisaAlteracaoDATA_RECUPERACAO: TSQLTimeStampField
      FieldName = 'DATA_RECUPERACAO'
    end
    object qryPesquisaAlteracaoATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object qryPesquisaAlteracaocalc_nome_usuario: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nome_usuario'
      LookupDataSet = BancoDados.qryUsuario
      LookupKeyFields = 'USUARIO_ID'
      LookupResultField = 'LOGIN'
      KeyFields = 'USUARIO_ID'
      Lookup = True
    end
    object qryPesquisaAlteracaocalc_descricao_tabela: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_descricao_tabela'
      LookupDataSet = BancoDados.qryTabela
      LookupKeyFields = 'TABELA'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TABELA'
      Lookup = True
    end
  end
  object DSCDSPesquisaTabela: TDataSource
    DataSet = CDSPesquisaTabela
    Left = 648
    Top = 213
  end
  object CDSPesquisaTabela: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPesquisaTabela'
    Left = 648
    Top = 168
    object CDSPesquisaTabelaALTERACAO_ID: TIntegerField
      FieldName = 'ALTERACAO_ID'
    end
    object CDSPesquisaTabelaTABELA: TStringField
      FieldName = 'TABELA'
      Size = 60
    end
    object CDSPesquisaTabelaUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
    end
    object CDSPesquisaTabelaDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object CDSPesquisaTabelaDADOS: TMemoField
      FieldName = 'DADOS'
      BlobType = ftMemo
      Size = 1
    end
    object CDSPesquisaTabelaRECUPERADA: TSmallintField
      FieldName = 'RECUPERADA'
    end
    object CDSPesquisaTabelaDATA_RECUPERACAO: TSQLTimeStampField
      FieldName = 'DATA_RECUPERACAO'
    end
    object CDSPesquisaTabelaATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object CDSPesquisaTabelacalc_nome_usuario: TStringField
      FieldName = 'calc_nome_usuario'
      ReadOnly = True
    end
    object CDSPesquisaTabelacalc_descricao_tabela: TStringField
      FieldName = 'calc_descricao_tabela'
      ReadOnly = True
    end
  end
  object DSPPesquisaTabela: TDataSetProvider
    DataSet = qryPesquisaAlteracao
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 648
    Top = 120
  end
  object CDSInformacao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 648
    Top = 336
    object CDSInformacaoATUALIZA: TBooleanField
      FieldName = 'ATUALIZA'
    end
    object CDSInformacaoTABELA: TStringField
      FieldName = 'TABELA'
    end
    object CDSInformacaoVALOR_ANTERIOR: TStringField
      FieldName = 'VALOR_ANTERIOR'
    end
    object CDSInformacaoVALOR_ATUAL: TStringField
      FieldName = 'VALOR_ATUAL'
    end
    object CDSInformacaoCAMPO: TStringField
      FieldName = 'CAMPO'
    end
  end
  object DSCDSInformacao: TDataSource
    DataSet = CDSInformacao
    Left = 648
    Top = 381
  end
end
