object CadastroProdutoPrecoForm: TCadastroProdutoPrecoForm
  Left = 0
  Top = 0
  Caption = 'CadastroProdutoPrecoForm'
  ClientHeight = 313
  ClientWidth = 556
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 163
    Height = 294
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
    ExplicitHeight = 273
    object JvGradientHeaderPanel1: TJvGradientHeaderPanel
      Left = 1
      Top = 1
      Width = 161
      Height = 292
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
      ExplicitHeight = 271
    end
  end
  object SBPrincipal: TStatusBar
    Left = 0
    Top = 294
    Width = 556
    Height = 19
    Panels = <
      item
        Width = 200
      end>
    ExplicitTop = 273
    ExplicitWidth = 544
  end
  object Panel2: TPanel
    Left = 163
    Top = 0
    Width = 393
    Height = 294
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 381
    ExplicitHeight = 273
    object Label1: TLabel
      Left = 62
      Top = 122
      Width = 55
      Height = 13
      Caption = 'Pre'#231'o (R$):'
    end
    object Label3: TLabel
      Left = 74
      Top = 94
      Width = 43
      Height = 13
      Caption = 'Unidade:'
    end
    object Label4: TLabel
      Left = 67
      Top = 67
      Width = 50
      Height = 13
      Caption = 'Descri'#231#227'o:'
    end
    object Label5: TLabel
      Left = 9
      Top = 149
      Width = 108
      Height = 13
      Caption = 'Margem de Lucro (%):'
    end
    object Panel3: TPanel
      Left = 1
      Top = 247
      Width = 391
      Height = 46
      Align = alBottom
      TabOrder = 5
      ExplicitTop = 275
      ExplicitWidth = 379
      object BTConfirmar: TSpeedButton
        Left = 163
        Top = 1
        Width = 113
        Height = 44
        Caption = 'Confirmar'
        OnClick = BTConfirmarClick
      end
      object BTCancelar: TSpeedButton
        Left = 276
        Top = 1
        Width = 113
        Height = 44
        Caption = 'Cancelar'
        OnClick = BTCancelarClick
      end
    end
    object CBUnidade: TComboBox
      Left = 143
      Top = 91
      Width = 105
      Height = 22
      Hint = 'Campo utilizado para Pesquisa'
      Style = csOwnerDrawFixed
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 2
      Text = '<selecione>'
      Items.Strings = (
        '<selecione>'
        'EAN 8'
        'EAN 13')
    end
    object EditPreco: TJvValidateEdit
      Left = 143
      Top = 119
      Width = 105
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object CBAtivo: TCheckBox
      Left = 143
      Top = 15
      Width = 41
      Height = 17
      Hint = 'Marcar/Desmarcar Todos'
      Caption = 'Ativo'
      TabOrder = 0
    end
    object EditDescricao: TEdit
      Left = 143
      Top = 64
      Width = 233
      Height = 21
      TabOrder = 1
    end
    object EditMargemLucro: TJvValidateEdit
      Left = 143
      Top = 146
      Width = 105
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      EditText = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
  end
end
