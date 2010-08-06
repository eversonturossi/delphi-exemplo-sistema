object CadastroProdutoBarrasForm: TCadastroProdutoBarrasForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'CadastroProdutoBarrasForm'
  ClientHeight = 322
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 163
    Height = 303
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
    object GHPPrincipal: TJvGradientHeaderPanel
      Left = 1
      Top = 1
      Width = 161
      Height = 301
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
  object SBPrincipal: TStatusBar
    Left = 0
    Top = 303
    Width = 553
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object Panel2: TPanel
    Left = 163
    Top = 0
    Width = 390
    Height = 303
    Align = alClient
    TabOrder = 2
    object Label1: TLabel
      Left = 28
      Top = 74
      Width = 75
      Height = 13
      Caption = 'Tipo de C'#243'digo:'
    end
    object Label3: TLabel
      Left = 44
      Top = 28
      Width = 59
      Height = 13
      Caption = 'Fornecedor:'
    end
    object LBFornecedorNome: TLabel
      Left = 122
      Top = 47
      Width = 241
      Height = 13
      AutoSize = False
      Caption = 'Fornecedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6590965
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 17
      Top = 102
      Width = 86
      Height = 13
      Caption = 'C'#243'digo de Barras:'
    end
    object BTExibirCodigoBarras: TSpeedButton
      Left = 337
      Top = 97
      Width = 23
      Height = 23
      OnClick = BTExibirCodigoBarrasClick
    end
    object Panel3: TPanel
      Left = 1
      Top = 256
      Width = 388
      Height = 46
      Align = alBottom
      TabOrder = 3
      object BTConfirmar: TSpeedButton
        Left = 160
        Top = 1
        Width = 113
        Height = 44
        Caption = 'Confirmar'
        OnClick = BTConfirmarClick
      end
      object BTCancelar: TSpeedButton
        Left = 273
        Top = 1
        Width = 113
        Height = 44
        Caption = 'Cancelar'
        OnClick = BTCancelarClick
      end
    end
    object CBTipoEAN: TComboBox
      Left = 120
      Top = 71
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
      TabOrder = 1
      Text = '<selecione>'
      Items.Strings = (
        '<selecione>'
        'EAN 8'
        'EAN 13')
    end
    object EditFornecedor: TJvValidateEdit
      Left = 120
      Top = 25
      Width = 105
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ZeroEmpty = True
      OnKeyDown = EditFornecedorKeyDown
    end
    object EditCodigoBarras: TJvValidateEdit
      Left = 120
      Top = 99
      Width = 217
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      ZeroEmpty = True
      OnExit = EditCodigoBarrasExit
    end
    object Panel4: TPanel
      Left = 120
      Top = 126
      Width = 241
      Height = 91
      Caption = 'Barras'
      TabOrder = 4
      object Imagem: TImage
        Left = 1
        Top = 1
        Width = 239
        Height = 89
        Align = alClient
        Center = True
        Stretch = True
        ExplicitLeft = 72
        ExplicitTop = 0
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
    end
  end
  object ApplicationEvents: TApplicationEvents
    OnHint = ApplicationEventsHint
    Left = 209
    Top = 136
  end
end
