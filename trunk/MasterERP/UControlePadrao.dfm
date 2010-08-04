object ControlePadraoForm: TControlePadraoForm
  Left = 0
  Top = 0
  Caption = 'ControlePadraoForm'
  ClientHeight = 515
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
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
    Height = 496
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
      Height = 494
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
  object SBPrincipal: TStatusBar
    Left = 0
    Top = 496
    Width = 780
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object Panel2: TPanel
    Left = 159
    Top = 0
    Width = 621
    Height = 496
    Align = alClient
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 97
      Width = 619
      Height = 398
      Align = alClient
      DataSource = DSConsulta
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
      Width = 619
      Height = 96
      Align = alTop
      TabOrder = 0
    end
  end
  object qryConsulta: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = BancoDados.Conexao
    Left = 224
    Top = 160
  end
  object PopupMenu1: TPopupMenu
    Left = 260
    Top = 160
    object ExibirColunas1: TMenuItem
      Caption = 'Exibir Colunas'
      OnClick = ExibirColunas1Click
    end
    object ReconfigurarColunas1: TMenuItem
      Caption = 'Reconfigurar Colunas'
      OnClick = ReconfigurarColunas1Click
    end
  end
  object qryExportar: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = BancoDados.Conexao
    Left = 298
    Top = 161
  end
  object DSPConsulta: TDataSetProvider
    DataSet = qryConsulta
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 224
    Top = 208
  end
  object qryCsExibirColuna: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = BancoDados.Conexao
    Left = 263
    Top = 208
  end
  object DSPExportar: TDataSetProvider
    DataSet = qryExportar
    Left = 298
    Top = 208
  end
  object CDSConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPConsulta'
    OnReconcileError = CDSConsultaReconcileError
    Left = 224
    Top = 255
  end
  object ApplicationEvents: TApplicationEvents
    OnHint = ApplicationEventsHint
    Left = 263
    Top = 255
  end
  object CDSExportar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPExportar'
    Left = 299
    Top = 253
  end
  object DSConsulta: TDataSource
    DataSet = CDSConsulta
    Left = 224
    Top = 302
  end
  object qryControleAcesso: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from usuario_acesso')
    SQLConnection = BancoDados.Conexao
    Left = 262
    Top = 302
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
    Left = 304
    Top = 303
    object ANovo: TAction
      Caption = 'Novo'
      ShortCut = 16429
    end
    object AAlterar: TAction
      Caption = 'Alterar'
      ShortCut = 16449
    end
    object AExcluir: TAction
      Caption = 'Excluir'
      ShortCut = 8238
    end
    object AExportar: TAction
      Caption = 'Exportar'
      ShortCut = 16472
      OnExecute = BTExportarClick
    end
    object ASair: TAction
      Caption = 'Sair'
      ShortCut = 27
      OnExecute = BTSairClick
    end
  end
end
