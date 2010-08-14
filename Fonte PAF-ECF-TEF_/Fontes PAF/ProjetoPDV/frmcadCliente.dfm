object FCadCliente: TFCadCliente
  Left = 146
  Top = 98
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Clientes'
  ClientHeight = 393
  ClientWidth = 486
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 486
    Height = 357
    ActivePage = TDados
    TabOrder = 0
    object TDados: TTabSheet
      Caption = 'Ficha'
      object Label2: TLabel
        Left = 49
        Top = 48
        Width = 36
        Height = 14
        Caption = 'Nome:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 29
        Top = 72
        Width = 56
        Height = 14
        Caption = 'Endere'#231'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 51
        Top = 96
        Width = 34
        Height = 14
        Caption = 'Bairro:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 45
        Top = 122
        Width = 40
        Height = 14
        Caption = 'Cidade:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 347
        Top = 123
        Width = 18
        Height = 14
        Caption = 'UF:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 60
        Top = 147
        Width = 25
        Height = 14
        Caption = 'CEP:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 32
        Top = 171
        Width = 53
        Height = 14
        Caption = 'Telefone:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 44
        Top = 194
        Width = 39
        Height = 14
        Caption = 'Celular:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 60
        Top = 221
        Width = 24
        Height = 14
        Caption = 'CPF:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 64
        Top = 244
        Width = 19
        Height = 14
        Caption = 'RG:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 52
        Top = 271
        Width = 31
        Height = 14
        Caption = 'CNPJ:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 68
        Top = 296
        Width = 15
        Height = 14
        Caption = 'IE:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 225
        Top = 208
        Width = 63
        Height = 14
        Caption = 'Observa'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 44
        Top = 24
        Width = 41
        Height = 14
        Caption = 'C'#243'digo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object BTPesqClientes: TSpeedButton
        Left = 164
        Top = 19
        Width = 43
        Height = 22
        Cursor = crHandPoint
        Caption = 'F5'
        Flat = True
        Glyph.Data = {
          F6000000424DF60000000000000076000000280000000E000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888800
          88008888888884EC0800880000004ECC000088788884ECC88000887FFF4ECC8F
          80008870078CC8FF8000878E80778FFF80007FE8E808FFFF80007EFE8E08FFFF
          80007FEFE808FFFF800087FEF08FFFFF8000887708FFFFFF8000887FFFFFFF00
          0000887FFFFFFF8F7800887FFFFFFF8788008877777777788800}
        OnClick = BTPesqClientesClick
      end
      object Label15: TLabel
        Left = 219
        Top = 24
        Width = 39
        Height = 14
        Caption = 'Status:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LStatus: TRxLabel
        Left = 264
        Top = 24
        Width = 50
        Height = 14
        Caption = 'LStatus'
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 88
        Top = 44
        Width = 353
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'NOME'
        DataSource = dsCadCliente
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnEnter = DBEdit1Enter
        OnExit = DBEdit1Exit
        OnKeyUp = ECodigoKeyUp
      end
      object DBEdit2: TDBEdit
        Left = 88
        Top = 69
        Width = 353
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'ENDERECO'
        DataSource = dsCadCliente
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnEnter = DBEdit1Enter
        OnExit = DBEdit1Exit
        OnKeyUp = ECodigoKeyUp
      end
      object DBEdit3: TDBEdit
        Left = 88
        Top = 93
        Width = 353
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'BAIRRO'
        DataSource = dsCadCliente
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        OnEnter = DBEdit1Enter
        OnExit = DBEdit1Exit
        OnKeyUp = ECodigoKeyUp
      end
      object DBEdit4: TDBEdit
        Left = 88
        Top = 118
        Width = 250
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'CIDADE'
        DataSource = dsCadCliente
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnEnter = DBEdit1Enter
        OnExit = DBEdit1Exit
        OnKeyUp = ECodigoKeyUp
      end
      object DBEdit5: TDBEdit
        Left = 368
        Top = 118
        Width = 42
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'UF'
        DataSource = dsCadCliente
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        OnEnter = DBEdit1Enter
        OnExit = DBEdit1Exit
        OnKeyUp = ECodigoKeyUp
      end
      object DBEdit6: TDBEdit
        Left = 88
        Top = 143
        Width = 122
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'CEP'
        DataSource = dsCadCliente
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        OnEnter = DBEdit1Enter
        OnExit = DBEdit1Exit
        OnKeyUp = ECodigoKeyUp
      end
      object DBEdit7: TDBEdit
        Left = 88
        Top = 168
        Width = 122
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'TELEFONE'
        DataSource = dsCadCliente
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
        OnEnter = DBEdit1Enter
        OnExit = DBEdit1Exit
        OnKeyUp = ECodigoKeyUp
      end
      object DBEdit8: TDBEdit
        Left = 88
        Top = 193
        Width = 122
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'CELULAR'
        DataSource = dsCadCliente
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
        OnEnter = DBEdit1Enter
        OnExit = DBEdit1Exit
        OnKeyUp = ECodigoKeyUp
      end
      object DBEdit9: TDBEdit
        Left = 88
        Top = 218
        Width = 122
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'CPF'
        DataSource = dsCadCliente
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 9
        OnEnter = DBEdit1Enter
        OnExit = DBEdit1Exit
        OnKeyUp = ECodigoKeyUp
      end
      object DBEdit10: TDBEdit
        Left = 88
        Top = 243
        Width = 122
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'RG'
        DataSource = dsCadCliente
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 10
        OnEnter = DBEdit1Enter
        OnExit = DBEdit1Exit
        OnKeyUp = ECodigoKeyUp
      end
      object DBEdit11: TDBEdit
        Left = 88
        Top = 267
        Width = 122
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'CGC'
        DataSource = dsCadCliente
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 11
        OnEnter = DBEdit1Enter
        OnExit = DBEdit1Exit
        OnKeyUp = ECodigoKeyUp
      end
      object DBEdit12: TDBEdit
        Left = 88
        Top = 292
        Width = 122
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'IE'
        DataSource = dsCadCliente
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 12
        OnEnter = DBEdit1Enter
        OnExit = DBEdit1Exit
        OnKeyUp = ECodigoKeyUp
      end
      object DBMemo1: TDBMemo
        Left = 224
        Top = 224
        Width = 222
        Height = 89
        Ctl3D = True
        DataField = 'OBS'
        DataSource = dsCadCliente
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 13
        OnEnter = DBMemo1Enter
        OnExit = DBMemo1Exit
        OnKeyPress = DBMemo1KeyPress
        OnKeyUp = ECodigoKeyUp
      end
      object ECodigo: TEdit
        Left = 87
        Top = 22
        Width = 74
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = True
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 0
        OnEnter = ECodigoEnter
        OnExit = ECodigoExit
        OnKeyDown = ECodigoKeyDown
        OnKeyPress = ECodigoKeyPress
        OnKeyUp = ECodigoKeyUp
      end
    end
  end
  object btn_salvar: TBitBtn
    Left = 275
    Top = 360
    Width = 102
    Height = 30
    Cursor = crHandPoint
    Caption = 'F10 - Salvar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btn_salvarClick
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
  object btn_sair: TBitBtn
    Left = 383
    Top = 360
    Width = 100
    Height = 30
    Cursor = crHandPoint
    Caption = 'Esc - Sair'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btn_sairClick
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
  object dsCadCliente: TDataSource
    DataSet = DM.TClientes
    Left = 244
    Top = 176
  end
end
