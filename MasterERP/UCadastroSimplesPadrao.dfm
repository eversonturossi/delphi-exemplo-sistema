object CadastroSimplesPadraoForm: TCadastroSimplesPadraoForm
  Left = 0
  Top = 0
  Caption = 'CadastroSimplesPadraoForm'
  ClientHeight = 365
  ClientWidth = 571
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
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SBPrincipal: TStatusBar
    Left = 0
    Top = 346
    Width = 571
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 121
    Height = 346
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
    object JvGradientHeaderPanel1: TJvGradientHeaderPanel
      Left = 1
      Top = 1
      Width = 119
      Height = 344
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
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 121
    Top = 0
    Width = 450
    Height = 346
    Align = alClient
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 448
      Height = 293
      Align = alClient
      DataSource = DSCadastro
      FixedColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clDefault
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object Panel3: TPanel
      Left = 1
      Top = 294
      Width = 448
      Height = 51
      Align = alBottom
      TabOrder = 1
      object BTSair: TSpeedButton
        Left = 358
        Top = 3
        Width = 85
        Height = 44
        Caption = 'Sair'
        Layout = blGlyphTop
        OnClick = BTSairClick
      end
    end
  end
  object DSCadastro: TDataSource
    DataSet = CDSCadastro
    Left = 193
    Top = 207
  end
  object CDSCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPCadastro'
    AfterInsert = CDSCadastroAfterInsert
    AfterPost = CDSCadastroAfterDelete
    BeforeCancel = CDSCadastroBeforeCancel
    AfterCancel = CDSCadastroAfterCancel
    BeforeDelete = CDSCadastroBeforeCancel
    AfterDelete = CDSCadastroAfterDelete
    Left = 193
    Top = 162
  end
  object DSPCadastro: TDataSetProvider
    DataSet = qryCadastro
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 192
    Top = 116
  end
  object qryCadastro: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = BancoDados.Conexao
    Left = 192
    Top = 72
  end
  object PopupMenu1: TPopupMenu
    Left = 239
    Top = 73
    object ExibirColunas1: TMenuItem
      Caption = 'Excluir Registro'
      OnClick = ExibirColunas1Click
    end
  end
  object ActionList: TActionList
    Left = 241
    Top = 116
    object AExcluir: TAction
      Caption = 'Excluir'
      OnExecute = AExcluirExecute
    end
  end
end
