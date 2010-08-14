object FVendedor: TFVendedor
  Left = 144
  Top = 106
  Width = 535
  Height = 432
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'PESQUISA VENDEDORES'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SB: TStatusBar
    Left = 0
    Top = 375
    Width = 527
    Height = 23
    Panels = <
      item
        Width = 120
      end>
    ParentColor = True
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 31
    Width = 527
    Height = 344
    ActivePage = TListar
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 1
    OnChanging = PageControl1Changing
    object TListar: TTabSheet
      Caption = 'Dados'
      object DBGrid: TDBGrid
        Left = 0
        Top = 0
        Width = 519
        Height = 316
        Align = alClient
        Color = clInfoBk
        Ctl3D = False
        DataSource = DsVendedor
        FixedColor = clTeal
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -13
        TitleFont.Name = 'Arial'
        TitleFont.Style = [fsBold]
        OnKeyPress = DBGridKeyPress
        OnKeyUp = DBGridKeyUp
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
            Title.Caption = 'NOME >>'
            Width = 397
            Visible = True
          end>
      end
    end
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 0
    Width = 527
    Height = 31
    ButtonHeight = 26
    Caption = 'ToolBar2'
    Color = clWhite
    ParentColor = False
    TabOrder = 2
    object EProcuraNome: TEdit
      Left = 0
      Top = 2
      Width = 525
      Height = 26
      AutoSize = False
      CharCase = ecUpperCase
      Color = clSilver
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -21
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
  object DsVendedor: TDataSource
    DataSet = DM.TVendedor
    Left = 224
    Top = 184
  end
end
