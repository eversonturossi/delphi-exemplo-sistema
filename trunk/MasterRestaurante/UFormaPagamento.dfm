object FormaPagamentoForm: TFormaPagamentoForm
  Left = 0
  Top = 0
  Caption = 'FormaPagamentoForm'
  ClientHeight = 493
  ClientWidth = 601
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 121
    Height = 474
    Align = alLeft
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitTop = -95
    ExplicitHeight = 495
    object JvGradientHeaderPanel1: TJvGradientHeaderPanel
      Left = 1
      Top = 1
      Width = 119
      Height = 472
      GradientStartColor = 6930170
      GradientStyle = grVertical
      LabelTop = 30
      LabelCaption = 'MasterSoft'
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWhite
      LabelFont.Height = -16
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = [fsBold]
      LabelAlignment = taCenter
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 493
    end
  end
  object SBPrincipal: TStatusBar
    Left = 0
    Top = 474
    Width = 601
    Height = 19
    Panels = <
      item
        Width = 200
      end>
    ExplicitLeft = -123
    ExplicitTop = 399
    ExplicitWidth = 707
  end
  object Panel1: TPanel
    Left = 121
    Top = 0
    Width = 480
    Height = 474
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 320
    ExplicitTop = 168
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label4: TLabel
      Left = 130
      Top = 9
      Width = 125
      Height = 29
      Caption = 'Total (R$):'
      Font.Charset = ANSI_CHARSET
      Font.Color = 6590965
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape4: TShape
      Left = 130
      Top = 41
      Width = 247
      Height = 60
      Pen.Color = 11114608
      Shape = stRoundRect
    end
    object Label1: TLabel
      Left = 130
      Top = 107
      Width = 125
      Height = 29
      Caption = 'Total (R$):'
      Font.Charset = ANSI_CHARSET
      Font.Color = 6590965
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape1: TShape
      Left = 130
      Top = 139
      Width = 247
      Height = 60
      Pen.Color = 11114608
      Shape = stRoundRect
    end
    object EditTotal: TJvValidateEdit
      Left = 143
      Top = 48
      Width = 221
      Height = 43
      Hint = 'Quantidade do Item'
      AutoSize = False
      BorderStyle = bsNone
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      EditText = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object JvValidateEdit1: TJvValidateEdit
      Left = 143
      Top = 146
      Width = 221
      Height = 43
      Hint = 'Quantidade do Item'
      AutoSize = False
      BorderStyle = bsNone
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      EditText = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
end
