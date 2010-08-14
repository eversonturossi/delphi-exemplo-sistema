object FPesquisaVendedores: TFPesquisaVendedores
  Left = 153
  Top = 136
  Width = 458
  Height = 375
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta Cadastro de Vendedores'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 322
    Width = 450
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 450
    Height = 28
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 3
      Top = 5
      Width = 56
      Height = 15
      Caption = 'Pesquisa:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EPesquisa: TEdit
      Left = 62
      Top = 2
      Width = 384
      Height = 23
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      MaxLength = 50
      ParentFont = False
      TabOrder = 0
      Text = 'EPESQUISA'
      OnChange = EPesquisaChange
      OnEnter = EPesquisaEnter
      OnExit = EPesquisaExit
      OnKeyPress = EPesquisaKeyPress
      OnKeyUp = EPesquisaKeyUp
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 28
    Width = 450
    Height = 294
    Align = alClient
    DataSource = DM.dsPesqVendedores
    FixedColor = 8421440
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -12
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = DBGridDrawColumnCell
    OnKeyPress = DBGridKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Visible = True
      end>
  end
end
