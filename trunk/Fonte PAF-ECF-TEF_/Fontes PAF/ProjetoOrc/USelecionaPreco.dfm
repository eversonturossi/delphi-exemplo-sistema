object FClassificaPreco: TFClassificaPreco
  Left = 261
  Top = 267
  Width = 162
  Height = 90
  BorderIcons = []
  Caption = 'Classifica Tabela Pre'#231'o'
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
    Left = 4
    Top = 8
    Width = 146
    Height = 17
    Caption = 'A VISTA'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object RBPrecoPrazo: TRadioButton
    Left = 4
    Top = 29
    Width = 146
    Height = 17
    Caption = 'A PRAZO'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
end
