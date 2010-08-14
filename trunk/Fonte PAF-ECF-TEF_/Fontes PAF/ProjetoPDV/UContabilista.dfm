object FContabilista: TFContabilista
  Left = 111
  Top = 46
  Width = 591
  Height = 490
  BorderIcons = [biSystemMenu]
  Caption = 'Contabilista'
  Color = clInfoBk
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SB: TStatusBar
    Left = 0
    Top = 434
    Width = 583
    Height = 22
    Panels = <
      item
        Text = 'F10  - Cadastra / Altera Informa'#231#245'es'
        Width = 50
      end>
  end
  object GContabilista: TGroupBox
    Left = 0
    Top = 0
    Width = 583
    Height = 434
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 14
      Top = 61
      Width = 33
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 14
      Top = 101
      Width = 24
      Height = 13
      Caption = 'CPF'
      FocusControl = DBEdit2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 15
      Top = 18
      Width = 26
      Height = 13
      Caption = 'CRC'
      FocusControl = DBEdit3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 206
      Top = 101
      Width = 32
      Height = 13
      Caption = 'CNPJ'
      FocusControl = DBEdit4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 422
      Top = 190
      Width = 25
      Height = 13
      Caption = 'CEP'
      FocusControl = DBEdit5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 13
      Top = 147
      Width = 55
      Height = 13
      Caption = 'Endere'#231'o'
      FocusControl = DBEdit6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 422
      Top = 147
      Width = 44
      Height = 13
      Caption = 'N'#250'mero'
      FocusControl = DBEdit7
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 322
      Top = 239
      Width = 76
      Height = 13
      Caption = 'Complemento'
      FocusControl = DBEdit8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 14
      Top = 238
      Width = 34
      Height = 13
      Caption = 'Bairro'
      FocusControl = DBEdit9
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 14
      Top = 283
      Width = 29
      Height = 13
      Caption = 'Fone'
      FocusControl = DBEdit10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 230
      Top = 283
      Width = 21
      Height = 13
      Caption = 'Fax'
      FocusControl = DBEdit11
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 14
      Top = 331
      Width = 32
      Height = 13
      Caption = 'EMail'
      FocusControl = DBEdit12
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 14
      Top = 376
      Width = 136
      Height = 13
      Caption = 'C'#243'd. Municipio no IBGE'
      FocusControl = DBEdit13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 14
      Top = 190
      Width = 40
      Height = 13
      Caption = 'Cidade'
      FocusControl = DBEdit14
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LStatus: TLabel
      Left = 206
      Top = 36
      Width = 44
      Height = 13
      Caption = 'LStatus'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 14
      Top = 77
      Width = 554
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = dsContabilista
      TabOrder = 1
      OnEnter = DBEdit1Enter
      OnExit = DBEdit1Exit
    end
    object DBEdit2: TDBEdit
      Left = 14
      Top = 117
      Width = 186
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CPF'
      DataSource = dsContabilista
      TabOrder = 2
      OnEnter = DBEdit1Enter
      OnExit = DBEdit1Exit
    end
    object DBEdit3: TDBEdit
      Left = 15
      Top = 34
      Width = 178
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CRC'
      DataSource = dsContabilista
      TabOrder = 0
      OnEnter = DBEdit1Enter
      OnExit = DBEdit1Exit
    end
    object DBEdit4: TDBEdit
      Left = 206
      Top = 117
      Width = 186
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CNPJ'
      DataSource = dsContabilista
      TabOrder = 3
      OnEnter = DBEdit1Enter
      OnExit = DBEdit1Exit
    end
    object DBEdit5: TDBEdit
      Left = 422
      Top = 206
      Width = 146
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CEP'
      DataSource = dsContabilista
      TabOrder = 7
      OnEnter = DBEdit1Enter
      OnExit = DBEdit1Exit
    end
    object DBEdit6: TDBEdit
      Left = 13
      Top = 163
      Width = 408
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ENDERECO'
      DataSource = dsContabilista
      TabOrder = 4
      OnEnter = DBEdit1Enter
      OnExit = DBEdit1Exit
    end
    object DBEdit7: TDBEdit
      Left = 422
      Top = 163
      Width = 145
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NUMERO'
      DataSource = dsContabilista
      TabOrder = 5
      OnEnter = DBEdit1Enter
      OnExit = DBEdit1Exit
    end
    object DBEdit8: TDBEdit
      Left = 322
      Top = 255
      Width = 246
      Height = 21
      CharCase = ecUpperCase
      DataField = 'COMPLEMENTO'
      DataSource = dsContabilista
      TabOrder = 8
      OnEnter = DBEdit1Enter
      OnExit = DBEdit1Exit
    end
    object DBEdit9: TDBEdit
      Left = 14
      Top = 254
      Width = 305
      Height = 21
      CharCase = ecUpperCase
      DataField = 'BAIRRO'
      DataSource = dsContabilista
      TabOrder = 9
      OnEnter = DBEdit1Enter
      OnExit = DBEdit1Exit
    end
    object DBEdit10: TDBEdit
      Left = 14
      Top = 299
      Width = 212
      Height = 21
      CharCase = ecUpperCase
      DataField = 'FONE'
      DataSource = dsContabilista
      TabOrder = 10
      OnEnter = DBEdit1Enter
      OnExit = DBEdit1Exit
    end
    object DBEdit11: TDBEdit
      Left = 230
      Top = 299
      Width = 212
      Height = 21
      CharCase = ecUpperCase
      DataField = 'FAX'
      DataSource = dsContabilista
      TabOrder = 11
      OnEnter = DBEdit1Enter
      OnExit = DBEdit1Exit
    end
    object DBEdit12: TDBEdit
      Left = 14
      Top = 347
      Width = 554
      Height = 21
      CharCase = ecUpperCase
      DataField = 'EMAIL'
      DataSource = dsContabilista
      TabOrder = 12
      OnEnter = DBEdit1Enter
      OnExit = DBEdit1Exit
    end
    object DBEdit13: TDBEdit
      Left = 15
      Top = 393
      Width = 134
      Height = 21
      CharCase = ecUpperCase
      DataField = 'COD_MUNICIPIO'
      DataSource = dsContabilista
      TabOrder = 13
      OnEnter = DBEdit1Enter
      OnExit = DBEdit1Exit
    end
    object DBEdit14: TDBEdit
      Left = 14
      Top = 206
      Width = 405
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CIDADE'
      DataSource = dsContabilista
      TabOrder = 6
      OnEnter = DBEdit1Enter
      OnExit = DBEdit1Exit
    end
    object btn_salvar: TBitBtn
      Left = 353
      Top = 383
      Width = 102
      Height = 30
      Cursor = crHandPoint
      Caption = 'Salvar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
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
    object BtSair: TBitBtn
      Left = 465
      Top = 383
      Width = 102
      Height = 30
      Cursor = crHandPoint
      Caption = 'Esc - Sair'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
      OnClick = BtSairClick
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
  end
  object dsContabilista: TDataSource
    DataSet = DM.TContabilista
    Left = 456
    Top = 240
  end
end
