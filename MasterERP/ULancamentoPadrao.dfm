object LancamentoPadraoForm: TLancamentoPadraoForm
  Left = 0
  Top = 0
  Caption = 'LancamentoPadraoForm'
  ClientHeight = 500
  ClientWidth = 803
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 157
    Height = 481
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
      Width = 155
      Height = 479
      GradientStartColor = 6930170
      GradientStyle = grVertical
      LabelTop = 30
      LabelCaption = 'MasterSoft'
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWhite
      LabelFont.Height = -21
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = [fsBold]
      LabelAlignment = taCenter
      Align = alClient
      TabOrder = 0
      object BTSalvar: TSpeedButton
        Left = 3
        Top = 104
        Width = 149
        Height = 50
        Hint = 'Salvar altera'#231#245'es efetuadas no Registro'
        Caption = 'Salvar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = blGlyphTop
        ParentFont = False
        OnClick = BTSalvarClick
      end
      object BTCancelar: TSpeedButton
        Left = 3
        Top = 154
        Width = 149
        Height = 50
        Hint = 'Cancelar altera'#231#245'es realizadas'
        Caption = 'Cancelar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = blGlyphTop
        ParentFont = False
        OnClick = BTCancelarClick
      end
      object BTExcluir: TSpeedButton
        Left = 3
        Top = 205
        Width = 149
        Height = 50
        Hint = 'Excluir Registro'
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
      object BTSair: TSpeedButton
        Left = 3
        Top = 257
        Width = 149
        Height = 50
        Hint = 'Sair da tela de Cadastro'
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
  object SBPrincipal: TStatusBar
    Left = 0
    Top = 481
    Width = 803
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object PPrincipal: TPanel
    Left = 157
    Top = 0
    Width = 646
    Height = 481
    Align = alClient
    TabOrder = 2
  end
  object qryCadastro: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = BancoDados.Conexao
    Left = 629
  end
  object DSPCadastro: TDataSetProvider
    DataSet = qryCadastro
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 668
  end
  object CDSCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPCadastro'
    AfterInsert = CDSCadastroAfterInsert
    BeforePost = CDSCadastroBeforePost
    AfterPost = CDSCadastroAfterPost
    BeforeCancel = CDSCadastroBeforeCancel
    AfterCancel = CDSCadastroAfterCancel
    BeforeDelete = CDSCadastroBeforeDelete
    AfterDelete = CDSCadastroAfterDelete
    OnReconcileError = CDSCadastroReconcileError
    Left = 708
  end
  object DSCadastro: TDataSource
    DataSet = CDSCadastro
    Left = 749
  end
  object ActionList: TActionList
    Left = 751
    Top = 44
    object ANovo: TAction
      Caption = 'Novo'
      ShortCut = 16462
    end
    object AAlterar: TAction
      Caption = 'Alterar'
      ShortCut = 16449
    end
    object AExcluir: TAction
      Caption = 'Excluir'
      ShortCut = 16453
    end
    object AExportar: TAction
      Caption = 'Exportar'
      ShortCut = 16472
    end
    object ASair: TAction
      Caption = 'Sair'
      ShortCut = 16457
    end
  end
  object ApplicationEvents: TApplicationEvents
    OnHint = ApplicationEventsHint
    Left = 746
    Top = 88
  end
  object qryExportar: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = BancoDados.Conexao
    Left = 629
    Top = 43
  end
  object DSPExportar: TDataSetProvider
    DataSet = qryExportar
    Left = 672
    Top = 44
  end
  object CDSExportar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPExportar'
    Left = 711
    Top = 44
  end
end
