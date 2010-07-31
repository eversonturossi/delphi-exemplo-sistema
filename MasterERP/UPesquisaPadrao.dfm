object PesquisaPadraoForm: TPesquisaPadraoForm
  Left = 0
  Top = 0
  Caption = 'PesquisaPadraoForm'
  ClientHeight = 444
  ClientWidth = 827
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SBPrincipal: TStatusBar
    Left = 0
    Top = 425
    Width = 827
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 155
    Height = 425
    Align = alLeft
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object GHPPrincipal: TJvGradientHeaderPanel
      Left = 1
      Top = 1
      Width = 153
      Height = 423
      GradientStartColor = 6930170
      GradientStyle = grVertical
      LabelTop = 30
      LabelCaption = 'MasterSoft'
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWhite
      LabelFont.Height = -16
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = [fsBold]
      LabelAlignment = taCenter
      Align = alClient
      AutoSize = True
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 155
    Top = 0
    Width = 672
    Height = 425
    Align = alClient
    TabOrder = 2
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 670
      Height = 98
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 28
        Top = 13
        Width = 39
        Height = 13
        Caption = 'Crit'#233'rio:'
      end
      object Label2: TLabel
        Left = 19
        Top = 40
        Width = 48
        Height = 13
        Caption = 'Condi'#231#227'o:'
      end
      object Label4: TLabel
        Left = 273
        Top = 13
        Width = 45
        Height = 13
        Caption = 'Situa'#231#227'o:'
      end
      object Label3: TLabel
        Left = 39
        Top = 68
        Width = 28
        Height = 13
        Caption = 'Valor:'
      end
      object CBCriterio: TComboBox
        Left = 84
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
        Left = 84
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
      object CBSituacao: TComboBox
        Left = 336
        Top = 10
        Width = 81
        Height = 22
        Hint = 'Campo utilizado para Pesquisa'
        Style = csOwnerDrawFixed
        ItemIndex = 2
        TabOrder = 2
        Text = 'Todos'
        OnSelect = CBSituacaoSelect
        Items.Strings = (
          'Inativo'
          'Ativo'
          'Todos')
      end
      object EditValor: TEdit
        Left = 84
        Top = 65
        Width = 333
        Height = 21
        Hint = 'Valor a ser Pesquisado'
        TabOrder = 3
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 99
      Width = 670
      Height = 325
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
  end
  object qryConsulta: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = BancoDados.Conexao
    Left = 423
    Top = 144
  end
  object DSPConsulta: TDataSetProvider
    DataSet = qryConsulta
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 424
    Top = 190
  end
  object CDSConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPConsulta'
    Left = 425
    Top = 235
  end
  object DSqryConsulta: TDataSource
    DataSet = CDSConsulta
    Left = 425
    Top = 281
  end
  object ApplicationEvents: TApplicationEvents
    OnHint = ApplicationEventsHint
    Left = 465
    Top = 144
  end
  object PopupMenu1: TPopupMenu
    Left = 465
    Top = 190
    object ExibirColunas1: TMenuItem
      Caption = 'Exibir Colunas'
      OnClick = ExibirColunas1Click
    end
    object ReconfigurarColunas1: TMenuItem
      Caption = 'Reconfigurar Colunas'
      OnClick = ReconfigurarColunas1Click
    end
  end
  object ActionList: TActionList
    Left = 467
    Top = 235
  end
end
