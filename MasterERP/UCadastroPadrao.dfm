object CadastroPadraoForm: TCadastroPadraoForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'CadastroPadraoForm'
  ClientHeight = 495
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SBPrincipal: TStatusBar
    Left = 0
    Top = 476
    Width = 770
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 157
    Height = 476
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
      Width = 155
      Height = 474
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
        Top = 256
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
  object PPrincipal: TPanel
    Left = 157
    Top = 0
    Width = 613
    Height = 476
    Align = alClient
    TabOrder = 2
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 611
      Height = 83
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 39
        Top = 37
        Width = 71
        Height = 13
        Caption = 'Data Cadastro:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 127
        Top = 58
        Width = 210
        Height = 17
        Hint = 'Data da '#250'ltima Altera'#231#227'o efetuada no Registro'
        DataField = 'DATA_ULTIMA_ALTERACAO'
        DataSource = DSCadastro
        Font.Charset = ANSI_CHARSET
        Font.Color = 6590965
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 30
        Top = 58
        Width = 80
        Height = 13
        Caption = #218'ltima Altera'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 127
        Top = 37
        Width = 210
        Height = 17
        Hint = 'Data em que o Registro foi Inserido'
        DataField = 'DATA_CADASTRO'
        DataSource = DSCadastro
        Font.Charset = ANSI_CHARSET
        Font.Color = 6590965
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBCAtivo: TDBCheckBox
        Left = 127
        Top = 10
        Width = 41
        Height = 17
        Hint = 'Indica se o Registro est'#225' ativo ou n'#227'o'
        TabStop = False
        Caption = 'Ativo'
        DataField = 'ATIVO'
        DataSource = DSCadastro
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
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
    Left = 502
    Top = 1
  end
  object DSCadastro: TDataSource
    DataSet = CDSCadastro
    Left = 543
    Top = 2
  end
  object DSPCadastro: TDataSetProvider
    DataSet = qryCadastro
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 454
    Top = 1
  end
  object qryCadastro: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = BancoDados.Conexao
    Left = 406
    Top = 1
  end
  object qryExportar: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = BancoDados.Conexao
    Left = 406
    Top = 43
  end
  object DSPExportar: TDataSetProvider
    DataSet = qryExportar
    Left = 456
    Top = 44
  end
  object CDSExportar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPExportar'
    Left = 503
    Top = 44
  end
  object ApplicationEvents: TApplicationEvents
    OnHint = ApplicationEventsHint
    Left = 665
  end
  object ActionList: TActionList
    Left = 624
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
end
