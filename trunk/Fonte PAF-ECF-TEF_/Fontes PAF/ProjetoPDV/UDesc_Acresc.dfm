object FDesc_Acresc: TFDesc_Acresc
  Left = 141
  Top = 75
  Width = 512
  Height = 450
  BorderIcons = [biSystemMenu]
  Caption = 'Descontos / Acr'#233'scimos Global'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object myLabel3d3: TmyLabel3d
    Left = 16
    Top = 217
    Width = 211
    Height = 41
    Caption = 'SUBTOTAL:'
    Color = clWindow
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -35
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    AShadeRightBottom = clSilver
    AShadeLTSet = False
  end
  object myLabel3d4: TmyLabel3d
    Left = 16
    Top = 304
    Width = 137
    Height = 41
    Caption = 'TOTAL:'
    Color = clWindow
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -35
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    AShadeRightBottom = clSilver
    AShadeLTSet = False
  end
  object myLabel3d1: TmyLabel3d
    Left = 21
    Top = 72
    Width = 85
    Height = 56
    Caption = 'R$:'
    Color = clWindow
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -48
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    AShadeRightBottom = clSilver
    AShadeLTSet = False
  end
  object myLabel3d2: TmyLabel3d
    Left = 42
    Top = 130
    Width = 61
    Height = 56
    Caption = '%:'
    Color = clWindow
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -48
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    AShadeRightBottom = clSilver
    AShadeLTSet = False
  end
  object Bevel1: TBevel
    Left = 17
    Top = 201
    Width = 473
    Height = 1
    Style = bsRaised
  end
  object RGTipo: TRadioGroup
    Left = 16
    Top = 7
    Width = 469
    Height = 59
    Caption = 'Tipo da Opera'#231#227'o'
    Columns = 2
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'DESCONTO'
      'ACR'#201'SCIMOS')
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
  end
  object ed_descontoPerc: TCurrencyEdit
    Left = 107
    Top = 133
    Width = 349
    Height = 45
    Alignment = taCenter
    AutoSize = False
    Ctl3D = True
    DecimalPlaces = 3
    DisplayFormat = '% ,0.000;-% ,0.000'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    OnEnter = ed_descontoPercEnter
    OnExit = ed_descontoPercExit
    OnKeyPress = ed_descontoPercKeyPress
  end
  object ed_desconto: TCurrencyEdit
    Left = 107
    Top = 75
    Width = 349
    Height = 45
    Alignment = taCenter
    AutoSize = False
    Ctl3D = True
    DecimalPlaces = 3
    DisplayFormat = 'R$ ,0.000;-R$ ,0.000'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    OnEnter = ed_descontoEnter
    OnExit = ed_descontoExit
  end
  object ESubTotal: TCurrencyEdit
    Left = 107
    Top = 255
    Width = 349
    Height = 45
    Alignment = taCenter
    AutoSize = False
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -32
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object ETotal: TCurrencyEdit
    Left = 107
    Top = 342
    Width = 349
    Height = 45
    Alignment = taCenter
    AutoSize = False
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -32
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
end
