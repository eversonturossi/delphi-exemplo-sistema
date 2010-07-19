object TrocoForm: TTrocoForm
  Left = 0
  Top = 0
  Caption = 'TrocoForm'
  ClientHeight = 330
  ClientWidth = 450
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SBPrincipal: TStatusBar
    Left = 0
    Top = 311
    Width = 450
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 121
    Height = 311
    Align = alLeft
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object JvGradientHeaderPanel1: TJvGradientHeaderPanel
      Left = 1
      Top = 1
      Width = 119
      Height = 309
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
    end
  end
  object Panel1: TPanel
    Left = 121
    Top = 0
    Width = 329
    Height = 311
    Align = alClient
    TabOrder = 2
    object Label4: TLabel
      Left = 45
      Top = 23
      Width = 176
      Height = 20
      Caption = 'Valor '#224' Receber (R$):'
      Font.Charset = ANSI_CHARSET
      Font.Color = 6590965
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape4: TShape
      Left = 45
      Top = 47
      Width = 204
      Height = 50
      Pen.Color = 11114608
      Shape = stRoundRect
    end
    object Label1: TLabel
      Left = 45
      Top = 106
      Width = 169
      Height = 20
      Caption = 'Valor Recebido (R$):'
      Font.Charset = ANSI_CHARSET
      Font.Color = 6590965
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape1: TShape
      Left = 45
      Top = 130
      Width = 204
      Height = 50
      Pen.Color = 11114608
      Shape = stRoundRect
    end
    object LBTroco: TLabel
      Left = 102
      Top = 199
      Width = 147
      Height = 29
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'R$ 0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 45
      Top = 204
      Width = 51
      Height = 20
      Caption = 'Troco:'
      Font.Charset = ANSI_CHARSET
      Font.Color = 6590965
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel3: TPanel
      Left = 1
      Top = 231
      Width = 327
      Height = 79
      Align = alBottom
      TabOrder = 0
      object BTConfirmar: TBitBtn
        Left = 180
        Top = 11
        Width = 140
        Height = 63
        Hint = 'Confirmar Venda (F5)'
        Caption = 'Confirmar Venda (F5)'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = BTConfirmarClick
      end
    end
    object EditAReceber: TJvValidateEdit
      Left = 56
      Top = 55
      Width = 182
      Height = 35
      Hint = 'Valor '#224' Receber'
      AutoSize = False
      BorderStyle = bsNone
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      EditText = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object EditValorRecebido: TJvValidateEdit
      Left = 56
      Top = 138
      Width = 182
      Height = 35
      Hint = 'Valor Recebido'
      AutoSize = False
      BorderStyle = bsNone
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      EditText = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnChange = EditValorRecebidoChange
      OnKeyPress = EditValorRecebidoKeyPress
    end
  end
  object ActionList1: TActionList
    Left = 384
    Top = 16
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 116
      OnExecute = Action1Execute
    end
  end
end
