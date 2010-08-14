object FPesqClienteBalcao: TFPesqClienteBalcao
  Left = 26
  Top = 120
  Width = 755
  Height = 391
  BorderIcons = [biSystemMenu]
  Caption = 'PESQUISA CLIENTES'
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWhite
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object GCliente: TGroupBox
    Left = 17
    Top = 6
    Width = 456
    Height = 61
    Caption = 'C'#211'DIGO DO CLIENTE'
    Color = clWhite
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    object ECodCliente: TEdit
      Left = 14
      Top = 22
      Width = 65
      Height = 26
      CharCase = ecUpperCase
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      MaxLength = 6
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = 'ECODCLIENTE'
      OnChange = ECodClienteChange
      OnEnter = ECodClienteEnter
      OnExit = ECodClienteExit
      OnKeyPress = ECodClienteKeyPress
    end
    object ENomeCliente: TPanel
      Left = 78
      Top = 22
      Width = 330
      Height = 24
      Alignment = taLeftJustify
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Caption = 'ENomeCliente'
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
    object BTPesqCliente: TBitBtn
      Left = 408
      Top = 23
      Width = 31
      Height = 23
      TabOrder = 2
      OnClick = BTPesqClienteClick
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777000000070000000007777777000000070FFFFFFF07777700000000070F7
        7777F07777000000000070F77777F07770007000000070F77780008700077000
        000070F7700FFF0000777000000070F708FFFF0807777000000070F80E000F07
        08777000000070F0EFEFEF0770777000000070F0F0000F077077700000007000
        EFEFFF0770777000000077780000000708777000000077770077777807777000
        0000777770077700777770000000777777800087777770000000777777777777
        777770000000}
    end
  end
  object GEndereco: TGroupBox
    Left = 17
    Top = 67
    Width = 456
    Height = 140
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 1
    object Label1: TLabel
      Left = 9
      Top = 20
      Width = 68
      Height = 14
      Caption = 'ENDERE'#199'O:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 23
      Top = 48
      Width = 51
      Height = 14
      Caption = 'CIDADE:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 12
      Top = 106
      Width = 63
      Height = 14
      Caption = 'CPF/CNPJ:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 252
      Top = 106
      Width = 40
      Height = 14
      Caption = 'IE/RG:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 268
      Top = 47
      Width = 18
      Height = 14
      Caption = 'UF:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 320
      Top = 47
      Width = 27
      Height = 14
      Caption = 'CEP:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 12
      Top = 76
      Width = 62
      Height = 14
      Caption = 'TELEFONE:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 224
      Top = 76
      Width = 59
      Height = 14
      Caption = 'CELULAR:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object PEndereco: TPanel
      Left = 78
      Top = 14
      Width = 369
      Height = 25
      Alignment = taLeftJustify
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object PCidade: TPanel
      Left = 78
      Top = 42
      Width = 187
      Height = 25
      Alignment = taLeftJustify
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
    object PCPF_CNPJ: TPanel
      Left = 78
      Top = 100
      Width = 171
      Height = 25
      Alignment = taLeftJustify
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
    object PRG_IE: TPanel
      Left = 294
      Top = 100
      Width = 152
      Height = 25
      Alignment = taLeftJustify
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
    end
    object PUF: TPanel
      Left = 290
      Top = 41
      Width = 28
      Height = 25
      Alignment = taLeftJustify
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
    end
    object PCep: TPanel
      Left = 350
      Top = 41
      Width = 96
      Height = 25
      Alignment = taLeftJustify
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
    end
    object PTelefone: TPanel
      Left = 78
      Top = 70
      Width = 136
      Height = 25
      Alignment = taLeftJustify
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
    end
    object PCelular: TPanel
      Left = 285
      Top = 70
      Width = 161
      Height = 25
      Alignment = taLeftJustify
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 7
    end
  end
  object GSituacao: TGroupBox
    Left = 17
    Top = 210
    Width = 456
    Height = 98
    Caption = 'SITUA'#199#195'O DO CLIENTE'
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    object LInfo: TmyLabel3d
      Left = 7
      Top = 17
      Width = 322
      Height = 25
      AutoSize = False
      Caption = 'LINFO'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      AShadeLTSet = False
    end
    object Vencida: TPanel
      Left = 9
      Top = 50
      Width = 122
      Height = 15
      BevelOuter = bvNone
      Caption = 'NOTAS VENCIDAS'
      Color = clWhite
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object PVencido: TPanel
      Left = 13
      Top = 67
      Width = 115
      Height = 21
      Alignment = taRightJustify
      BevelOuter = bvNone
      Caption = '0,00'
      Color = clWhite
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
    object Vencer: TPanel
      Left = 174
      Top = 50
      Width = 119
      Height = 15
      BevelOuter = bvNone
      Caption = 'NOTAS A VENCER'
      Color = clWhite
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
    object PVencer: TPanel
      Left = 177
      Top = 67
      Width = 115
      Height = 21
      Alignment = taRightJustify
      BevelOuter = bvNone
      Caption = '0,00'
      Color = clWhite
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
    end
    object Total: TPanel
      Left = 335
      Top = 50
      Width = 102
      Height = 15
      BevelOuter = bvNone
      Caption = 'TOTAL LIQUIDO'
      Color = clWhite
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
    end
    object PGeral: TPanel
      Left = 334
      Top = 67
      Width = 103
      Height = 21
      Alignment = taRightJustify
      BevelOuter = bvNone
      Caption = '0,00'
      Color = clWhite
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
    end
  end
  object BTOk: TBitBtn
    Left = 48
    Top = 314
    Width = 193
    Height = 31
    Cursor = crHandPoint
    Caption = 'F10 - Confirma'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BTOkClick
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000430B0000430B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF7070705050505050505050505050506D42
      2F6D422F6D422F6D422F6D422F6D422F6D422F6D422F6D422F6D422F6D422F6D
      422FFF00FFFF00FFFF00FFFF00FFFF00FF707070505050559CB791C1D496C2D3
      8ABDCFCE726FD19893715A48EFF0F2ECEDF1E2E3E9DADCE4D0D2DCCBCDD88C76
      679443409443406D422FFF00FFFF00FFFF00FF7070705050505897B3EEF5F8DD
      ECF2CCE3EBBBDAE6AAD1DFCE726FD8A19D715A480000005F5046ECEDF1E2E3E9
      DADCE4D5D7E08C76679747449443406D422FFF00FFFF00FF267FA15897B3D9EE
      F5F6FBFCEEF5F8DDECF2CCE3EBBBDAE6AAD1DFCE726FDFABA6715A4800000000
      0000EFF0F2ECEDF1E7E8EDDDDEE58C76679D504D9747446D422FFF00FFFF00FF
      267FA1C4E7F2E2F4FAF6FBFCEEF5F8DDECF2CCE3EBBBDAE6AAD1DFCE726FE9B8
      B3715A48715A48715A48715A48715A48715A48715A488C7667A55A579D504D6D
      422FFF00FFFF00FF267FA1CBECF7E2F4FAF6FBFCEEF5F8DDECF2CCE3EBBBDAE6
      AAD1DFCE726FEFBFBAEAB9B4E3AFAADBA6A1D49B97CD928DC58782BE7D79B671
      6DAC6461A55A576D422FFF00FFFF00FF267FA1C5E8F4D0E8F1E0EDF2B3D1DE8B
      B9CD75ACC26AA5BE61A0BBCE726FEFBFBAF0C1BCCE726FCE726FCE726FCE726F
      CE726FCE726FCE726FC16F69B169656D422FFF00FFFF00FF267FA19AC7DA87B6
      CB8BB7CB9EC6D7B6D7E5CCE3EBBBDAE6AAD1DFCE726FEAB3AECE726FFCF2F1F9
      E9E7F7E0DEF5D6D3F2CCC8F0C2BDF0C2BDCE726FBB6E696D422FFF00FFFF00FF
      267FA19FC9DADAEDF4F6FBFCEEF5F8DDECF2CCE3EBBBDAE6AAD1DFCE726FEAB3
      AECE726FFEFBFAE9BE9FE9BE9FE9BE9FE9BE9FE9BE9FF1C7C2CE726FC175706D
      422FFF00FFFF00FF267FA1CBECF7E2F4FAF6FBFCEEF5F8DDECF2CCE3EBBBDAE6
      AAD1DFCE726FEAB3AECE726FFFFFFFFEFBFAFDF6F5FAEDECF8E4E2F6DBD9F4D1
      CECE726FC67C776D422FFF00FFFF00FF267FA1CBECF7E2F4FAF6FBFCEEF5F8DD
      ECF2CCE3EBBBDAE6AAD1DFCE726FEAB3AECE726FFFFFFFE9BE9FE9BE9FE9BE9F
      E9BE9FE9BE9FF6DBD9CE726FCC85806D422FFF00FFFF00FF267FA1CBECF7E2F4
      FAF6FBFCC3DBE593BDCF75ACC26AA5BE61A0BBCE726FEAB3AECE726FFFFFFFFF
      FFFFFFFFFFFFFFFFFDF6F5FAEDECF8E4E2CE726F0000006D422FFF00FFFF00FF
      267FA19FCCDE77ACC475A9C18EBCD0AED3E2CCE3EBBBDAE6AAD1DFCE726FE6AA
      A5CE726FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF6F5FAEDECCE726FC87D786D
      422FFF00FFFF00FF267FA194C0D2D8EBF3F6FBFCEEF5F8DDECF2CCE3EBBBDAE6
      AAD1DFCE726FCE726FCE726FCE726FCE726FCE726FCE726FCE726FCE726FCE72
      6FCE726FCE726FCE726FFF00FFFF00FF267FA1CBECF7E2F4FAF6FBFCEEF5F8DD
      ECF2CCE3EBBBDAE6AAD1DF99C8D985BDD274B4CC63ABC652A2C04199BA3090B3
      505050FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA1CBECF7E2F4
      FAF6FBFCEEF5F8DDECF2CCE3EBBBDAE6AAD1DF99C8D985BDD274B4CC63ABC652
      A2C04199BA3090B3505050FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      267FA1CBECF7E2F4FAEFF6F9CADFE89FC5D583B5C977AEC56DA8C161A3BC579E
      BA57A0BC58A3C050A1BF4199BA3090B3505050FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF267FA1AAD5E679AEC573A8C086B8CD96C7DB9ACEE291CCE4
      85C9E473C2DF60B8DA49A9CE3397BE2688AF2785A92D8CB0505050FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA190B9CCE4EEF3F4F9FDE4F4FBD5
      EEF8C5E8F6B5E2F4A4DCF195D7F082D0EE70CAEB5FC3E94FBDE738AEDB1C8DB9
      505050FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA1AAC8D8FCFD
      FFFBFCFEF4F9FDE6F4FBD6EEF8C5E8F6B5E3F4A6DDF294D6F083D0EE72CAEB61
      C4E94FBEE73FB8E5006890FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      267FA181B0C5AAC8D8FCFDFFFAFCFEF4F9FDE7F5FBD7EFF8C7E9F6B7E3F5A5DC
      F295D7F084D1EE73CBEC58C1E840B4E0267FA1FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF2D93BD267FA181B0C5AAC8D8FAFCFEF4F9FDE8F5FB
      D8EFF9C8EAF7B5E3F4A6DDF283D0ED56BCE3267FA12D93BDFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2D93BD267FA181
      B0C5A3C5D5B1CEDCB5D2E19AC3D57AB1C962A5C0267FA12D93BDFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FF2D93BD267FA1267FA1267FA1267FA1267FA12D93BDFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object BTCancela: TBitBtn
    Left = 254
    Top = 314
    Width = 193
    Height = 31
    Cursor = crHandPoint
    Caption = 'Esc - Retorna'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = BTCancelaClick
    Glyph.Data = {
      36090000424D3609000000000000360000002800000018000000180000000100
      20000000000000090000120B0000120B00000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000FF8F96
      91FF36473BFF3C5442FF445E4AFF4A6751FF506F58FF53735BFF54745CFF5474
      5CFF54745CFF54745CFF54745CFF54745CFF54745CFF000000FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000FFD8DA
      DAFFBDBFBFFF787D7AFF303C33FF324537FF3A5040FF415A47FF48634FFF4C69
      53FF4E6C56FF4E6C56FF4F6D57FF4F6D57FF4F6D57FF000000FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000FFEEF0
      F0FFE3E5E5FFC3C6C6FFABACACFF8A8B8BFF2F3932FF28372CFF324537FF3A50
      3FFF405846FF445E4BFF47634EFF496550FF496550FF000000FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000FFD7D7D7FF000000FFEFF1
      F1FFE4E6E6FFD8DBDBFFCED0D0FFB7BABAFF9B9D9DFF767777FF303832FF1F2C
      23FF2D3E31FF364A3BFF3D5543FF425B48FF445E4AFF000000FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000FF000000FF000000FFEFF1
      F1FFE4E6E6FFD8DBDBFFCED0D0FFC2C5C5FFB7B9B9FFACAEAEFF9B9D9DFF5556
      56FF1E2A21FF28382CFF324537FF3A5040FF3E5543FF000000FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000FF000050FF000000FFCBCD
      CDFFE4E6E6FFD8DBDBFFCED0D0FFC2C5C5FFB7B9B9FFB7B9B9FFB7B9B9FF6263
      63FF19231BFF223025FF2D3E30FF344939FF384E3DFF000000FFFFFFFF000000
      00FF000000FF000000FF000000FF000000FF000000FF000072FF000058FF0000
      00FFC3C5C5FFD8DBDBFFCED0D0FFC2C5C5FFB7B9B9FFB7B9B9FFB7B9B9FF6263
      63FF1C261EFF243227FF2C3D30FF324537FF344839FF000000FFFFFFFF000000
      00FF43437CFF00006AFF00006AFF00006AFF00006AFF000072FF000099FF0000
      58FF000000FFBBBDBDFFCED0D0FFC2C5C5FFB7B9B9FFB7B9B9FFB7B9B9FF6263
      63FF202C23FF26352AFF2B3C30FF2E4033FF2E4033FF000000FFFFFFFF000000
      00FF8484CDFF000099FF000099FF000099FF000099FF000099FF000099FF0000
      99FF000058FF000000FFB3B5B5FFC2C5C5FFB7B9B9FFB7B9B9FFB7B9B9FF6263
      63FF1F2B22FF263429FF29392DFF2A3A2EFF2A3A2EFF000000FFFFFFFF000000
      00FF8484CDFF000099FF000099FF000099FF000099FF000099FF000099FF0000
      99FF000099FF00004FFF000000FFABAEAEFFB7B9B9FFB7B9B9FFB7B9B9FF6263
      63FF1B261DFF212E24FF243227FF253328FF253328FF000000FFFFFFFF000000
      00FF8484CDFF000099FF000099FF000099FF000099FF000099FF000099FF0000
      99FF000099FF000099FF161670FF000000FFA5A6A6FF0C0C0CFFB7B9B9FF6263
      63FF161E18FF1B261EFF1E2A21FF1F2B22FF1F2B22FF000000FFFFFFFF000000
      00FF92A3EFFF1E42DFFF1E42DFFF1E42DFFF1E42DFFF1E42DFFF1E42DFFF1E42
      DFFF1E42DFFF5670E6FF000000FFB4B7B7FFB7B9B9FF5C5D5DFF0C0C0CFF6263
      63FF121914FF172019FF19231CFF1A241DFF1A241DFF000000FFFFFFFF000000
      00FF92A3EFFF1E42DFFF1E42DFFF1E42DFFF1E42DFFF1E42DFFF1E42DFFF1E42
      DFFF5670E6FF000000FFBDBFBFFFC2C5C5FFB7B9B9FF5C5D5DFFB7B9B9FF6263
      63FF0F1510FF121914FF141C16FF151D17FF151D17FF000000FFFFFFFF000000
      00FFA1B0F0FF627BE8FF627BE8FF627BE8FF627BE8FF778DEBFF1E42DFFF667E
      E9FF000000FFC8CBCBFFCED0D0FFC2C5C5FFB7B9B9FFB7B9B9FFB7B9B9FF6263
      63FF0B0F0CFF0D130FFF0E1410FF0F1511FF0F1511FF000000FFFFFFFF000000
      00FF000000FF000000FF000000FF000000FF000000FF627BE8FF5670E6FF0000
      00FFD3D5D5FFD8DBDBFFCED0D0FFC2C5C5FFB7B9B9FFB7B9B9FFB7B9B9FF6263
      63FF070A08FF090C0AFF090D0AFF0A0E0BFF0A0E0BFF000000FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000FF6C83E9FF000000FFDCDE
      DEFFE4E6E6FFD7DADAFFCDCFCFFFC2C5C5FFB7B9B9FFB7B9B9FFB7B9B9FF6263
      63FF040504FF040604FF050705FF050705FF050705FF000000FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000FF000000FF000000FFEFF1
      F1FFE4E6E6FFD7DADAFFCDCFCFFFC1C4C4FFB7B9B9FFB7B9B9FFB7B9B9FF4041
      41FF000000FF000000FF000000FF000000FF000000FF000000FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000FFFFFFFF00000000FFEFF1
      F1FFE4E6E6FFD7DADAFFCDCFCFFFC1C4C4FFB7B9B9FFACAEAEFF8D8F8FFF2626
      26FF000000FF000000FF000000FF000000FF000000FF000000FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000FFEFF1
      F1FFE4E6E6FFD7DADAFFCDCFCFFFC1C4C4FFA5A8A8FF747676FF747777FF1D1E
      1EFF000000FF000000FF000000FF000000FF000000FF000000FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000FFD4D6
      D6FFBCBDBDFFA4A8A8FF8F9292FF707372FF5E6161FF5E6161FF5E6161FF1F20
      20FF000000FF000000FF000000FF000000FF000000FF000000FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FFFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
  end
  object GroupBox1: TGroupBox
    Left = 475
    Top = 6
    Width = 262
    Height = 301
    Caption = 'Observa'#231#245'es'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object MObs: TMemo
      Left = 2
      Top = 16
      Width = 258
      Height = 283
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Lines.Strings = (
        'MObs')
      ParentFont = False
      TabOrder = 0
    end
  end
end
