object ConexaoForm: TConexaoForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Configura'#231#227'o para Conex'#227'o'
  ClientHeight = 169
  ClientWidth = 495
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
  object Label1: TLabel
    Left = 56
    Top = 32
    Width = 44
    Height = 13
    Caption = 'Servidor:'
  end
  object Label2: TLabel
    Left = 19
    Top = 62
    Width = 81
    Height = 13
    Caption = 'Banco de Dados:'
  end
  object Label3: TLabel
    Left = 71
    Top = 92
    Width = 29
    Height = 13
    Caption = 'Login:'
  end
  object Label4: TLabel
    Left = 66
    Top = 122
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object BTOk: TSpeedButton
    Left = 352
    Top = 27
    Width = 121
    Height = 24
    Caption = 'Ok'
    OnClick = BTOkClick
  end
  object BTTestar: TSpeedButton
    Left = 352
    Top = 57
    Width = 121
    Height = 24
    Caption = 'Testar'
  end
  object BTLimpar: TSpeedButton
    Left = 352
    Top = 87
    Width = 121
    Height = 24
    Caption = 'Limpar Dados'
  end
  object BTCancelar: TSpeedButton
    Left = 352
    Top = 117
    Width = 121
    Height = 24
    Caption = 'Cancelar'
    OnClick = BTCancelarClick
  end
  object BTBancoDados: TSpeedButton
    Left = 281
    Top = 57
    Width = 24
    Height = 24
    OnClick = BTBancoDadosClick
  end
  object EditServidor: TEdit
    Left = 120
    Top = 27
    Width = 185
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object EditDB: TEdit
    Left = 120
    Top = 57
    Width = 162
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object EditLogin: TEdit
    Left = 120
    Top = 87
    Width = 185
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object EditSenha: TEdit
    Left = 120
    Top = 117
    Width = 185
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object ODBancoDados: TOpenDialog
    Left = 32
    Top = 120
  end
end
