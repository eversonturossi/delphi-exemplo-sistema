object LoginForm: TLoginForm
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Master ERP - Login'
  ClientHeight = 364
  ClientWidth = 614
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
  object Image1: TImage
    Left = 8
    Top = 5
    Width = 325
    Height = 352
    AutoSize = True
  end
  object Panel2: TPanel
    Left = 341
    Top = 144
    Width = 265
    Height = 105
    TabOrder = 0
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
    Left = 341
    Top = 252
    Width = 265
    Height = 105
    TabOrder = 1
    object BTCancelar: TBitBtn
      Left = 152
      Top = 8
      Width = 105
      Height = 89
      Hint = 'Sair do Sistema'
      Caption = 'Cancelar'
      DoubleBuffered = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
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
      Left = 9
      Top = 8
      Width = 104
      Height = 89
      Hint = 'Confirmar'
      BiDiMode = bdLeftToRight
      Caption = 'Acessar'
      DoubleBuffered = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
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
  object Panel4: TPanel
    Left = 341
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
    TabOrder = 2
  end
  object Panel5: TPanel
    Left = 341
    Top = 72
    Width = 265
    Height = 49
    Caption = 'Sistema para automa'#231#227'o de Vendas'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object Panel6: TPanel
    Left = 341
    Top = 56
    Width = 265
    Height = 9
    TabOrder = 4
  end
  object Panel7: TPanel
    Left = 341
    Top = 128
    Width = 265
    Height = 9
    TabOrder = 5
  end
end
