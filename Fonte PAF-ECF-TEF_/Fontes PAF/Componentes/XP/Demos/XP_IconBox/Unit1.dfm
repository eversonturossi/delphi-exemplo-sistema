object Form1: TForm1
  Left = 401
  Top = 184
  BorderStyle = bsDialog
  Caption = 'Form1'
  ClientHeight = 339
  ClientWidth = 383
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 296
    Top = 8
    Width = 75
    Height = 25
    Caption = 'explorer'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 296
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Shell32'
    TabOrder = 1
    OnClick = Button2Click
  end
  object cc: TStaticText
    Left = 320
    Top = 72
    Width = 16
    Height = 17
    BorderStyle = sbsSunken
    Caption = 'cc'
    TabOrder = 2
  end
  object IcoBox: TtfXPIconBox
    Left = 0
    Top = 0
    Width = 289
    Height = 339
    Colors.BackColor = clWindow
    Align = alLeft
    DragKind = dkDock
    ItemIndex = -1
    TabOrder = 3
    OnClick = IcoboxClick
  end
end
