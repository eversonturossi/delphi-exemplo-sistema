object FCartao_Deb_Cred: TFCartao_Deb_Cred
  Left = 230
  Top = 185
  Width = 159
  Height = 110
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'D'#233'bito/Cr'#233'dito'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 151
    Height = 76
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object RBDebito: TRadioButton
    Left = 7
    Top = 42
    Width = 113
    Height = 17
    Caption = 'D'#233'bito'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object RBCredito: TRadioButton
    Left = 7
    Top = 13
    Width = 113
    Height = 17
    Caption = 'Cr'#233'dito'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
end
