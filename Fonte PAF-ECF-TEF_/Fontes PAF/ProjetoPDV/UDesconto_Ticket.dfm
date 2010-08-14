object FDesconto_Ticket: TFDesconto_Ticket
  Left = 306
  Top = 236
  BorderStyle = bsNone
  Caption = 'FDesconto_Ticket'
  ClientHeight = 64
  ClientWidth = 204
  Color = 14717952
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object P1: TPanel
    Left = -1
    Top = -1
    Width = 205
    Height = 26
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Caption = 'DESCONTO % NO TICKET'
    Color = 9982976
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
  end
  object EDesconto: TCurrencyEdit
    Left = -1
    Top = 26
    Width = 205
    Height = 37
    AutoSize = False
    Ctl3D = False
    DisplayFormat = '% ,0.00;-% ,0.00'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    OnKeyPress = EDescontoKeyPress
  end
end
