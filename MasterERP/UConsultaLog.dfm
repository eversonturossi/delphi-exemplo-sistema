object ConsultaLogForm: TConsultaLogForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'ConsultaLogForm'
  ClientHeight = 565
  ClientWidth = 965
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 153
    Height = 546
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
    object JvGradientHeaderPanel1: TJvGradientHeaderPanel
      Left = 1
      Top = 1
      Width = 151
      Height = 544
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
  object SBPrincipal: TStatusBar
    Left = 0
    Top = 546
    Width = 965
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object Panel2: TPanel
    Left = 153
    Top = 0
    Width = 812
    Height = 546
    Align = alClient
    TabOrder = 2
    object Panel3: TPanel
      Left = 1
      Top = 480
      Width = 810
      Height = 65
      Align = alBottom
      TabOrder = 0
      object BTFechar: TSpeedButton
        Left = 673
        Top = 1
        Width = 136
        Height = 63
        Align = alRight
        Caption = 'Fechar'
        Layout = blGlyphTop
        OnClick = BTFecharClick
        ExplicitLeft = 672
        ExplicitHeight = 62
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 810
      Height = 150
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 28
        Top = 21
        Width = 40
        Height = 13
        Caption = 'Usu'#225'rio:'
      end
      object Label2: TLabel
        Left = 30
        Top = 49
        Width = 38
        Height = 13
        Caption = 'M'#243'dulo:'
      end
      object BTPesquisar: TSpeedButton
        Left = 455
        Top = 82
        Width = 178
        Height = 52
        Caption = 'Pesquisar'
        Layout = blGlyphTop
        OnClick = BTPesquisarClick
      end
      object CBUsuario: TComboBox
        Left = 84
        Top = 18
        Width = 237
        Height = 22
        Hint = 'Usu'#225'rio a ser Pesquisado'
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 0
        Text = '<selecione>'
        Items.Strings = (
          '<selecione>')
      end
      object CBModulo: TComboBox
        Left = 84
        Top = 46
        Width = 237
        Height = 22
        Hint = 'M'#243'dulo a ser Pesquisado'
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 1
        Text = '<selecione>'
        Items.Strings = (
          '<selecione>')
      end
      object GroupBox1: TGroupBox
        Left = 84
        Top = 82
        Width = 341
        Height = 52
        TabOrder = 2
        object Label3: TLabel
          Left = 20
          Top = 20
          Width = 29
          Height = 13
          Caption = 'In'#237'cio:'
        end
        object Label4: TLabel
          Left = 186
          Top = 20
          Width = 26
          Height = 13
          Caption = 'Final:'
        end
        object EditDe: TJvDateEdit
          Left = 57
          Top = 17
          Width = 105
          Height = 21
          Enabled = False
          TabOrder = 0
        end
        object EditAte: TJvDateEdit
          Left = 221
          Top = 17
          Width = 105
          Height = 21
          Enabled = False
          TabOrder = 1
        end
      end
      object CHPeriodo: TCheckBox
        Left = 96
        Top = 74
        Width = 57
        Height = 17
        Caption = 'Per'#237'odo'
        TabOrder = 3
        OnClick = CHPeriodoClick
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 151
      Width = 810
      Height = 329
      Align = alClient
      DataSource = DSLogOperacao
      FixedColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clDefault
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'calc_usuario_login'
          Title.Caption = 'Usu'#225'rio'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calc_tabela_descricao_reduzida'
          Title.Caption = 'M'#243'dulo'
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
          FieldName = 'DATA_LANCAMENTO'
          Title.Caption = 'Data/Hora'
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
          FieldName = 'OPERACAO'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 750
          Visible = True
        end>
    end
  end
  object DSLogOperacao: TDataSource
    DataSet = CDSLogOperacao
    Left = 280
    Top = 362
  end
  object CDSLogOperacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPLogOperacao'
    OnCalcFields = CDSLogOperacaoCalcFields
    Left = 280
    Top = 317
    object CDSLogOperacaoUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
      DisplayFormat = '0000000000'
    end
    object CDSLogOperacaoDATA_LANCAMENTO: TSQLTimeStampField
      FieldName = 'DATA_LANCAMENTO'
    end
    object CDSLogOperacaoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 120
    end
    object CDSLogOperacaocalc_usuario_login: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_usuario_login'
      Size = 60
      Calculated = True
    end
    object CDSLogOperacaocalc_tabela_descricao_reduzida: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tabela_descricao_reduzida'
      Size = 60
      Calculated = True
    end
    object CDSLogOperacaoTABELA: TStringField
      FieldName = 'TABELA'
      Size = 60
    end
  end
  object DSPLogOperacao: TDataSetProvider
    DataSet = qryLogOperacao
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 280
    Top = 270
  end
  object qryLogOperacao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from log_operacao where log_operacao_id = 0')
    SQLConnection = BancoDados.Conexao
    Left = 280
    Top = 224
  end
end
