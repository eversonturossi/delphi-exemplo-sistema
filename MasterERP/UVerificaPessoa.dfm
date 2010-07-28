object VerificaPessoaForm: TVerificaPessoaForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'VerificaPessoaForm'
  ClientHeight = 465
  ClientWidth = 892
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = EditValorKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 163
    Height = 446
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
      Width = 161
      Height = 444
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
      ExplicitWidth = 119
    end
  end
  object SBPrincipal: TStatusBar
    Left = 0
    Top = 446
    Width = 892
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object Panel2: TPanel
    Left = 163
    Top = 0
    Width = 729
    Height = 446
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 121
    ExplicitWidth = 771
    object Panel4: TPanel
      Left = 1
      Top = 396
      Width = 727
      Height = 49
      Align = alBottom
      TabOrder = 0
      ExplicitWidth = 769
      object Label3: TLabel
        Left = 31
        Top = 18
        Width = 102
        Height = 13
        Caption = 'Nome:/Raz'#227'o Social:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EditValor: TEdit
        Left = 152
        Top = 13
        Width = 369
        Height = 24
        Hint = 'Valor a ser Pesquisado'
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = EditValorChange
        OnKeyDown = EditValorKeyDown
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 727
      Height = 395
      Align = alClient
      DataSource = DSPessoa
      FixedColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clDefault
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME_RAZAO'
          Title.Caption = 'Nome/Raz'#227'o Social'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 280
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calc_utlizado'
          Title.Caption = 'Utilizado'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 400
          Visible = True
        end>
    end
  end
  object DSPessoa: TDataSource
    DataSet = CDSPessoa
    Left = 272
    Top = 264
  end
  object CDSPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPessoa'
    OnCalcFields = CDSPessoaCalcFields
    Left = 272
    Top = 216
    object CDSPessoaPESSOA_ID: TIntegerField
      FieldName = 'PESSOA_ID'
      DisplayFormat = '0000000000'
    end
    object CDSPessoaNOME_RAZAO: TStringField
      FieldName = 'NOME_RAZAO'
      Size = 60
    end
    object CDSPessoacalc_utlizado: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_utlizado'
      Size = 255
      Calculated = True
    end
  end
  object DSPPessoa: TDataSetProvider
    DataSet = qryPessoa
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 272
    Top = 168
  end
  object qryPessoa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from pessoa where pessoa_id = 0')
    SQLConnection = BancoDados.Conexao
    Left = 272
    Top = 120
  end
end
