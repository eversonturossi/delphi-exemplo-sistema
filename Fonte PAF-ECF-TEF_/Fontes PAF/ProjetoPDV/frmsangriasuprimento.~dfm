object fsangriasuprimento: Tfsangriasuprimento
  Left = 309
  Top = 199
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Sangria/Suprimento de caixa'
  ClientHeight = 203
  ClientWidth = 241
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 11
    Top = 2
    Width = 220
    Height = 55
    Caption = 'Sangria'
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 42
      Height = 16
      Caption = 'Valor:'
    end
    object ed_valorSangria: TCurrencyEdit
      Left = 110
      Top = 16
      Width = 96
      Height = 28
      AutoSize = False
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnChange = ed_valorSangriaChange
      OnKeyPress = ed_valorSangriaKeyPress
    end
  end
  object GSuprimento: TGroupBox
    Left = 11
    Top = 64
    Width = 220
    Height = 96
    Caption = 'Suprmento'
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 26
      Width = 42
      Height = 16
      Caption = 'Valor:'
    end
    object Label3: TLabel
      Left = 8
      Top = 66
      Width = 98
      Height = 16
      Caption = 'Forma Pagto.:'
    end
    object ed_ValorSuprimento: TCurrencyEdit
      Left = 110
      Top = 20
      Width = 98
      Height = 28
      AutoSize = False
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnKeyPress = ed_ValorSuprimentoKeyPress
    end
    object cb_formapagto: TComboBox
      Left = 110
      Top = 60
      Width = 99
      Height = 26
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 18
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnKeyPress = cb_formapagtoKeyPress
      Items.Strings = (
        'Dinheiro'
        'Cheque')
    end
  end
  object btn_ok: TBitBtn
    Left = 41
    Top = 166
    Width = 75
    Height = 25
    Caption = '&Ok'
    ModalResult = 1
    TabOrder = 2
    OnClick = btn_okClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btn_cancela: TBitBtn
    Left = 129
    Top = 166
    Width = 75
    Height = 25
    Caption = '&Cancela'
    TabOrder = 3
    OnClick = btn_cancelaClick
    Kind = bkCancel
  end
end
