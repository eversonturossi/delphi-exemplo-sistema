object FDescAcresc_Item: TFDescAcresc_Item
  Left = 169
  Top = 224
  Width = 405
  Height = 172
  BorderIcons = []
  Caption = 'Desconto / Acr'#233'scimo no Item'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RGTipo: TRadioGroup
    Left = 8
    Top = 63
    Width = 141
    Height = 59
    Caption = 'Tipo de Opera'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Desconto'
      'Acr'#233'scimo')
    ParentFont = False
    TabOrder = 1
  end
  object RGValor_Perc: TRadioGroup
    Left = 149
    Top = 63
    Width = 92
    Height = 59
    Caption = 'Tipo'
    Columns = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'R$'
      '%')
    ParentFont = False
    TabOrder = 2
  end
  object GValor: TGroupBox
    Left = 242
    Top = 63
    Width = 145
    Height = 59
    Caption = 'Valor'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object EValor: TCurrencyEdit
      Left = 10
      Top = 20
      Width = 121
      Height = 26
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnEnter = EValorEnter
      OnExit = EValorExit
      OnKeyPress = EValorKeyPress
    end
  end
  object GItem: TGroupBox
    Left = 8
    Top = 7
    Width = 380
    Height = 53
    Caption = 'N'#186' do Item'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object LItem: TLabel
      Left = 74
      Top = 21
      Width = 297
      Height = 16
      AutoSize = False
      Caption = 'LItem'
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ENumItem: TEdit
      Left = 10
      Top = 19
      Width = 61
      Height = 22
      TabOrder = 0
      Text = 'ENumItem'
      OnEnter = EValorEnter
      OnExit = ENumItemExit
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer1Timer
    Left = 296
    Top = 23
  end
end
