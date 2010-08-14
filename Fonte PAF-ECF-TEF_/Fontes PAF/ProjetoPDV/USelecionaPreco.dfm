object FClassificaPreco: TFClassificaPreco
  Left = 261
  Top = 267
  Width = 182
  Height = 93
  BorderIcons = []
  Caption = 'CLASSIFICA PRE'#199'O'
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
  object RBPrecoVista: TRadioButton
    Left = 16
    Top = 8
    Width = 146
    Height = 17
    Caption = 'PRE'#199'O A VISTA'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object RBPrecoPrazo: TRadioButton
    Left = 16
    Top = 27
    Width = 146
    Height = 17
    Caption = 'PRE'#199'O A PRAZO'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
end
