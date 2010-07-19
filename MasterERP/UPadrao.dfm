object PadraoForm: TPadraoForm
  Left = 0
  Top = 0
  ClientHeight = 550
  ClientWidth = 711
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PGPrincipal: TPageControl
    Left = 127
    Top = 32
    Width = 584
    Height = 499
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 711
    ExplicitHeight = 531
  end
  object SBPrincipal: TStatusBar
    Left = 0
    Top = 531
    Width = 711
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 400
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 711
    Height = 32
    Align = alTop
    TabOrder = 2
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 703
    object Label1: TLabel
      Left = 216
      Top = 9
      Width = 86
      Height = 13
      Caption = 'Data do Cadastro:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 454
      Top = 9
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
    object LBUltimaAlteração: TLabel
      Left = 540
      Top = 9
      Width = 132
      Height = 13
      AutoSize = False
      Caption = 'dd/mm/yyyy hh:mm:ss'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = 6590965
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object CBAtivo: TCheckBox
      Left = 148
      Top = 8
      Width = 49
      Height = 17
      Hint = 'Ativar Registro'
      Caption = 'Ativo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object DTCadastro: TDateTimePicker
      Left = 310
      Top = 6
      Width = 97
      Height = 21
      Hint = 'Data de Cadastro'
      Date = 40278.096922812500000000
      Time = 40278.096922812500000000
      Enabled = False
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 32
    Width = 127
    Height = 499
    Align = alLeft
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
    ExplicitHeight = 468
    object BTNovo: TSpeedButton
      Left = 24
      Top = 1
      Width = 73
      Height = 65
      Hint = 'Inserir Novo Registro (Ctrl+N)'
      Caption = '&Novo'
      Flat = True
      Layout = blGlyphTop
      OnClick = BTNovoClick
    end
    object BTAlterar: TSpeedButton
      Left = 24
      Top = 66
      Width = 73
      Height = 65
      Hint = 'Alterar Registro (Ctrl+A)'
      Caption = '&Alterar'
      Flat = True
      Layout = blGlyphTop
      OnClick = BTAlterarClick
    end
    object BTExcluir: TSpeedButton
      Left = 24
      Top = 131
      Width = 73
      Height = 65
      Hint = 'Excluir Registro (Ctrl+E)'
      Caption = '&Excluir'
      Flat = True
      Layout = blGlyphTop
      OnClick = BTExcluirClick
    end
    object BTReverter: TSpeedButton
      Left = 24
      Top = 196
      Width = 73
      Height = 65
      Hint = 'Cancelar Opera'#231#227'o  (Ctrl+R)'
      Caption = '&Reverter'
      Flat = True
      Layout = blGlyphTop
      OnClick = BTReverterClick
    end
    object BTSalvar: TSpeedButton
      Left = 24
      Top = 261
      Width = 73
      Height = 65
      Hint = 'Salvar Altera'#231#245'es  (Ctrl+S)'
      Caption = '&Salvar'
      Flat = True
      Layout = blGlyphTop
      OnClick = BTSalvarClick
    end
    object BTExportar: TSpeedButton
      Left = 24
      Top = 326
      Width = 73
      Height = 65
      Hint = 'Exportar Registros  (Ctrl+X)'
      Caption = 'E&xportar'
      Flat = True
      Layout = blGlyphTop
      OnClick = BTExportarClick
    end
    object BTSair: TSpeedButton
      Left = 24
      Top = 391
      Width = 73
      Height = 65
      Hint = 'Sair  (Ctrl+I)'
      Caption = 'Sa&ir'
      Flat = True
      Layout = blGlyphTop
      OnClick = BTSairClick
    end
  end
  object PCadastro: TPanel
    Left = 127
    Top = 32
    Width = 584
    Height = 499
    Align = alClient
    Enabled = False
    TabOrder = 4
    ExplicitWidth = 576
    ExplicitHeight = 468
    object Atalhos: TMemo
      Left = 1
      Top = 422
      Width = 582
      Height = 76
      Align = alBottom
      Color = clBtnFace
      Lines.Strings = (
        '')
      TabOrder = 0
      ExplicitTop = 391
      ExplicitWidth = 574
    end
  end
  object SQLQuery: TSQLQuery
    AfterOpen = SQLQueryAfterOpen
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      '')
    SQLConnection = BancoDados.Conexao
    Left = 653
  end
  object DataSource: TDataSource
    DataSet = ClientDataSet
    Left = 656
    Top = 142
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider'
    AfterInsert = ClientDataSetAfterInsert
    BeforePost = ClientDataSetBeforePost
    AfterPost = ClientDataSetAfterPost
    BeforeCancel = ClientDataSetBeforeCancel
    AfterCancel = ClientDataSetAfterCancel
    BeforeDelete = ClientDataSetBeforeDelete
    AfterDelete = ClientDataSetAfterDelete
    Left = 656
    Top = 94
  end
  object DataSetProvider: TDataSetProvider
    DataSet = SQLQuery
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 653
    Top = 48
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 8
    Top = 24
  end
  object ApplicationEvents: TApplicationEvents
    OnHint = ApplicationEventsHint
    Left = 8
    Top = 72
  end
  object ActionList: TActionList
    Left = 8
    Top = 120
    object ANovo: TAction
      Caption = 'Novo'
      ShortCut = 16462
      OnExecute = ANovoExecute
    end
    object AAlterar: TAction
      Caption = 'Alterar'
      ShortCut = 16449
      OnExecute = AAlterarExecute
    end
    object AExcluir: TAction
      Caption = 'Excluir'
      ShortCut = 16453
      OnExecute = AExcluirExecute
    end
    object AReverter: TAction
      Caption = 'Reverter'
      ShortCut = 16467
      OnExecute = AReverterExecute
    end
    object ASalvar: TAction
      Caption = 'Salvar'
      ShortCut = 16467
      OnExecute = ASalvarExecute
    end
    object AExportar: TAction
      Caption = 'Exportar'
      ShortCut = 16472
      OnExecute = AExportarExecute
    end
    object ASair: TAction
      Caption = 'Sair'
      ShortCut = 16457
      OnExecute = ASairExecute
    end
    object AAjudaAtalhos: TAction
      Caption = 'Atalhos'
      ShortCut = 112
      OnExecute = AAjudaAtalhosExecute
    end
  end
  object qryControleAcesso: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from usuario_acesso')
    SQLConnection = BancoDados.Conexao
    Left = 8
    Top = 168
    object qryControleAcessoVALOR: TSmallintField
      FieldName = 'VALOR'
    end
    object qryControleAcessoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 12
    end
  end
end
