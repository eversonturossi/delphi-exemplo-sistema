object LoginForm: TLoginForm
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Master ERP - Login'
  ClientHeight = 384
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 163
    Top = 8
    Width = 265
    Height = 41
    Caption = 'MASTERSOFT'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel5: TPanel
    Left = 163
    Top = 72
    Width = 265
    Height = 49
    Caption = 'Sistema para automa'#231#227'o de Vendas'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object Panel6: TPanel
    Left = 163
    Top = 56
    Width = 265
    Height = 9
    TabOrder = 2
  end
  object Panel7: TPanel
    Left = 163
    Top = 128
    Width = 265
    Height = 9
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 157
    Height = 384
    Align = alLeft
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
    ExplicitLeft = 23
    ExplicitTop = -136
    ExplicitHeight = 500
    object JvGradientHeaderPanel1: TJvGradientHeaderPanel
      Left = 1
      Top = 1
      Width = 155
      Height = 382
      GradientStartColor = 6930170
      GradientStyle = grVertical
      LabelTop = 30
      LabelCaption = 'MasterSoft'
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWhite
      LabelFont.Height = -21
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = [fsBold]
      LabelAlignment = taCenter
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitHeight = 498
    end
  end
  object Panel8: TPanel
    Left = 163
    Top = 143
    Width = 266
    Height = 236
    TabOrder = 5
    object Panel2: TPanel
      Left = 1
      Top = 59
      Width = 264
      Height = 105
      Align = alTop
      TabOrder = 0
      ExplicitTop = 113
      ExplicitWidth = 265
      object Label4: TLabel
        Left = 11
        Top = 6
        Width = 44
        Height = 19
        Caption = 'Login'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label5: TLabel
        Left = 8
        Top = 55
        Width = 49
        Height = 19
        Caption = 'Senha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object EditLogin: TEdit
        Left = 7
        Top = 31
        Width = 250
        Height = 21
        Hint = 'Digite seu Login'
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        CharCase = ecUpperCase
        MaxLength = 15
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnKeyPress = EditLoginKeyPress
      end
      object EditSenha: TEdit
        Left = 7
        Top = 76
        Width = 250
        Height = 21
        Hint = 'Digite sua Senha (M'#225'ximo 8 D'#237'ditos)'
        TabStop = False
        BevelKind = bkFlat
        CharCase = ecLowerCase
        MaxLength = 7
        PasswordChar = '*'
        TabOrder = 1
        OnKeyPress = EditSenhaKeyPress
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 164
      Width = 264
      Height = 65
      Align = alTop
      TabOrder = 1
      ExplicitTop = 213
      ExplicitWidth = 265
      object BTCancelar: TBitBtn
        Left = 155
        Top = 8
        Width = 105
        Height = 45
        Hint = 'Sair do Sistema'
        Caption = 'Cancelar'
        DoubleBuffered = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = blGlyphTop
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = False
        OnClick = BTCancelarClick
      end
      object BTOk: TBitBtn
        Left = 47
        Top = 8
        Width = 104
        Height = 45
        Hint = 'Confirmar'
        BiDiMode = bdLeftToRight
        Caption = 'Acessar'
        DoubleBuffered = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = blGlyphTop
        ParentBiDiMode = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TabStop = False
        OnClick = BTOkClick
      end
    end
    object PEmpresa: TPanel
      Left = 1
      Top = 1
      Width = 264
      Height = 58
      Align = alTop
      TabOrder = 2
      Visible = False
      object Label1: TLabel
        Left = 11
        Top = 6
        Width = 53
        Height = 13
        Caption = 'Empresa:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object CBEmpresa: TComboBox
        Left = 11
        Top = 25
        Width = 246
        Height = 21
        TabOrder = 0
      end
    end
  end
end
