object AjudaForm: TAjudaForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'MasterRestaurante - Ajuda'
  ClientHeight = 441
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object SBPrincipal: TStatusBar
    Left = 0
    Top = 422
    Width = 530
    Height = 19
    Panels = <
      item
        Width = 200
      end>
    ExplicitLeft = -32
    ExplicitTop = 314
    ExplicitWidth = 450
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 121
    Height = 422
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
    ExplicitHeight = 314
    object JvGradientHeaderPanel1: TJvGradientHeaderPanel
      Left = 1
      Top = 1
      Width = 119
      Height = 420
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
      ExplicitHeight = 312
    end
  end
  object Panel1: TPanel
    Left = 121
    Top = 0
    Width = 409
    Height = 422
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 256
    ExplicitTop = 136
    ExplicitWidth = 185
    ExplicitHeight = 41
    object MAjuda: TMemo
      Left = 1
      Top = 1
      Width = 407
      Height = 365
      Align = alClient
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        ''
        'F1 - Ajuda'
        'F2 - Controle de Mesas'
        'F3 - Venda Direta'
        'F4 - Pesquisar Produtos'
        'F5 - Abrir Comanda'
        'F6 - Alterar Comanda'
        'F7 - Imprimir Comanda (Espelho de Conferencia)'
        'F8 - Encerrar Comanda')
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      ExplicitLeft = 48
      ExplicitTop = 24
      ExplicitWidth = 185
      ExplicitHeight = 89
    end
    object Panel3: TPanel
      Left = 1
      Top = 366
      Width = 407
      Height = 55
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 258
      ExplicitWidth = 327
      object BTConformar: TSpeedButton
        Left = 279
        Top = 5
        Width = 123
        Height = 45
        Hint = 'Fechar Ajuda'
        Caption = 'Fechar'
        Layout = blGlyphTop
        OnClick = BTConformarClick
      end
    end
  end
end
