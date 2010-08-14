object FAgBancaria: TFAgBancaria
  Left = 189
  Top = 131
  Width = 454
  Height = 393
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'AG'#202'NCIA BANC'#193'RIA'
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
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 341
    Width = 446
    Height = 18
    Color = clWhite
    Panels = <
      item
        Width = 120
      end>
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 0
    Width = 446
    Height = 29
    ButtonHeight = 23
    Caption = 'ToolBar2'
    Color = clWhite
    ParentColor = False
    TabOrder = 1
    object EProcuraNome: TEdit
      Left = 0
      Top = 2
      Width = 444
      Height = 23
      CharCase = ecUpperCase
      Color = clSilver
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      MaxLength = 45
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnEnter = EProcuraNomeEnter
      OnExit = EProcuraNomeExit
      OnKeyUp = EProcuraNomeKeyUp
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 29
    Width = 446
    Height = 312
    Align = alClient
    Color = clWhite
    Ctl3D = True
    DataSource = DSAgBancaria
    FixedColor = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -12
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    OnKeyPress = DBGridKeyPress
    OnKeyUp = DBGridKeyUp
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Caption = 'C'#211'DIGO'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Width = 350
        Visible = True
      end>
  end
  object DSAgBancaria: TDataSource
    AutoEdit = False
    DataSet = DM.TAgBancaria
    Left = 196
    Top = 167
  end
end
