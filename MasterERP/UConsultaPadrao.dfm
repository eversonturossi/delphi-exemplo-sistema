object ConsultaPadraoForm: TConsultaPadraoForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'ConsultaPadraoForm'
  ClientHeight = 508
  ClientWidth = 848
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 159
    Height = 489
    Align = alLeft
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object GHPPrincipal: TJvGradientHeaderPanel
      Left = 1
      Top = 1
      Width = 157
      Height = 487
      GradientStartColor = 6930170
      GradientStyle = grVertical
      LabelLeft = 30
      LabelTop = 30
      LabelCaption = 'MasterSoft'
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWhite
      LabelFont.Height = -21
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = [fsBold]
      LabelAlignment = taLeftJustify
      Align = alClient
      TabOrder = 0
      object BTNovo: TSpeedButton
        Left = 3
        Top = 125
        Width = 149
        Height = 50
        Hint = 'Inserir Novo Registro (Ctrl+Ins)'
        Caption = 'Novo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = blGlyphTop
        ParentFont = False
      end
      object BTAlterar: TSpeedButton
        Left = 3
        Top = 175
        Width = 149
        Height = 50
        Hint = 'Alterar Registro (Ctrl+A)'
        Caption = 'Alterar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = blGlyphTop
        ParentFont = False
        OnClick = BTAlterarClick
      end
      object BTExcluir: TSpeedButton
        Left = 3
        Top = 225
        Width = 149
        Height = 50
        Hint = 'Excluir Registro (Shift+Del)'
        Caption = 'Excluir'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = blGlyphTop
        ParentFont = False
        OnClick = BTExcluirClick
      end
      object BTExportar: TSpeedButton
        Left = 3
        Top = 275
        Width = 149
        Height = 50
        Hint = 'Exportar Registros  (Ctrl+X)'
        Caption = 'Exportar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = blGlyphTop
        ParentFont = False
        OnClick = BTExportarClick
      end
      object BTSair: TSpeedButton
        Left = 3
        Top = 325
        Width = 149
        Height = 50
        Hint = 'Sair  (Esc)'
        Caption = 'Sair'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = blGlyphTop
        ParentFont = False
        OnClick = BTSairClick
      end
    end
  end
  object Panel2: TPanel
    Left = 159
    Top = 0
    Width = 689
    Height = 489
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 97
      Width = 687
      Height = 391
      Align = alClient
      DataSource = DSqryConsulta
      FixedColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clDefault
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 687
      Height = 96
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 41
        Top = 13
        Width = 39
        Height = 13
        Caption = 'Crit'#233'rio:'
      end
      object Label2: TLabel
        Left = 32
        Top = 40
        Width = 48
        Height = 13
        Caption = 'Condi'#231#227'o:'
      end
      object Label3: TLabel
        Left = 52
        Top = 67
        Width = 28
        Height = 13
        Caption = 'Valor:'
      end
      object BTPesquisar: TSpeedButton
        Left = 443
        Top = 60
        Width = 130
        Height = 30
        Hint = 'Pesquisar Registros'
        Caption = 'Pesquisar'
      end
      object Label4: TLabel
        Left = 286
        Top = 13
        Width = 45
        Height = 13
        Caption = 'Situa'#231#227'o:'
      end
      object CBCriterio: TComboBox
        Left = 97
        Top = 10
        Width = 145
        Height = 22
        Hint = 'Campo utilizado para Pesquisa'
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 0
        Text = '<selecione>'
        OnSelect = CBCriterioSelect
        Items.Strings = (
          '<selecione>')
      end
      object CBCondicao: TComboBox
        Left = 97
        Top = 37
        Width = 145
        Height = 22
        Hint = 'Condi'#231#227'o utilizada para Pesquisa'
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 1
        Text = '<selecione>'
        OnSelect = CBCondicaoSelect
        Items.Strings = (
          '<selecione>')
      end
      object EditValor: TEdit
        Left = 97
        Top = 64
        Width = 333
        Height = 21
        Hint = 'Valor a ser Pesquisado'
        CharCase = ecUpperCase
        TabOrder = 2
      end
      object CBSituacao: TComboBox
        Left = 349
        Top = 10
        Width = 81
        Height = 22
        Hint = 'Campo utilizado para Pesquisa'
        Style = csOwnerDrawFixed
        ItemIndex = 2
        TabOrder = 3
        Text = 'Todos'
        OnSelect = CBCriterioSelect
        Items.Strings = (
          'Inativo'
          'Ativo'
          'Todos')
      end
    end
  end
  object SBPrincipal: TStatusBar
    Left = 0
    Top = 489
    Width = 848
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object qryConsulta: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = BancoDados.Conexao
    Left = 271
    Top = 192
  end
  object DSqryConsulta: TDataSource
    DataSet = CDSConsulta
    Left = 328
    Top = 240
  end
  object qryControleAcesso: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from usuario_acesso')
    SQLConnection = BancoDados.Conexao
    Left = 328
    Top = 285
    object qryControleAcessoUSUARIO_ACESSO_ID: TIntegerField
      FieldName = 'USUARIO_ACESSO_ID'
    end
    object qryControleAcessoUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
    end
    object qryControleAcessoTABELA: TStringField
      FieldName = 'TABELA'
      Size = 60
    end
    object qryControleAcessoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryControleAcessoVALOR: TSmallintField
      FieldName = 'VALOR'
    end
    object qryControleAcessoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 12
    end
  end
  object ActionList: TActionList
    Left = 376
    Top = 240
    object ASair: TAction
      Caption = 'Sair'
      ShortCut = 27
      OnExecute = ASairExecute
    end
  end
  object qryExportar: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = BancoDados.Conexao
    Left = 214
    Top = 193
  end
  object DSPExportar: TDataSetProvider
    DataSet = qryExportar
    Left = 214
    Top = 240
  end
  object CDSExportar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPExportar'
    Left = 215
    Top = 285
  end
  object ApplicationEvents: TApplicationEvents
    OnHint = ApplicationEventsHint
    Left = 377
    Top = 285
  end
  object PopupMenu1: TPopupMenu
    Left = 376
    Top = 193
    object ExibirColunas1: TMenuItem
      Caption = 'Exibir Colunas'
      OnClick = ExibirColunas1Click
    end
    object ReconfigurarColunas1: TMenuItem
      Caption = 'Reconfigurar Colunas'
      OnClick = ReconfigurarColunas1Click
    end
  end
  object DSPConsulta: TDataSetProvider
    DataSet = qryConsulta
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 271
    Top = 240
  end
  object CDSConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPConsulta'
    OnReconcileError = CDSConsultaReconcileError
    Left = 272
    Top = 285
  end
  object qryCsExibirColuna: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = BancoDados.Conexao
    Left = 327
    Top = 193
  end
end
