object AjudaAtalhosForm: TAjudaAtalhosForm
  Left = 0
  Top = 0
  Caption = 'MasterERP - Atalhos'
  ClientHeight = 337
  ClientWidth = 502
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Memo: TMemo
    Left = 0
    Top = 0
    Width = 502
    Height = 296
    Align = alClient
    ReadOnly = True
    TabOrder = 0
    ExplicitLeft = 136
    ExplicitTop = 96
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
  object Panel1: TPanel
    Left = 0
    Top = 296
    Width = 502
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 184
    ExplicitTop = 264
    ExplicitWidth = 185
    object BTFechar: TSpeedButton
      Left = 374
      Top = 1
      Width = 116
      Height = 35
      Caption = 'Fechar'
      OnClick = BTFecharClick
    end
  end
end
