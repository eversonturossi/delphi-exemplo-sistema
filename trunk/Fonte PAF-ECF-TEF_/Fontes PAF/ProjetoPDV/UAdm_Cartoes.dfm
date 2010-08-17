object FAdm_Cartoes: TFAdm_Cartoes
  Left = 385
  Top = 179
  Width = 512
  Height = 359
  BorderIcons = [biSystemMenu]
  Caption = 'Administradoras de Cart'#245'es'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SB: TStatusBar
    Left = 0
    Top = 304
    Width = 496
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    ParentColor = True
  end
  object PageControl: TPageControl
    Left = 2
    Top = 1
    Width = 491
    Height = 269
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Lista'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 483
        Height = 241
        Align = alClient
        Color = clWhite
        Ctl3D = True
        DataSource = dsAdm_Cartoes
        FixedColor = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnKeyPress = DBGrid1KeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 224
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_REDE'
            Title.Caption = 'REDE'
            Width = 225
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Dados'
      ImageIndex = 1
      object Label2: TLabel
        Left = 53
        Top = 28
        Width = 55
        Height = 14
        Caption = 'Descri'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 55
        Top = 52
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
      object Label3: TLabel
        Left = 243
        Top = 52
        Width = 22
        Height = 14
        Caption = 'Fax:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 53
        Top = 78
        Width = 55
        Height = 14
        Caption = 'Web Site:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 74
        Top = 102
        Width = 34
        Height = 14
        Caption = 'E-Mail:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 6
        Top = 126
        Width = 102
        Height = 14
        Caption = '% Taxa Desc.D'#233'b:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 40
        Top = 176
        Width = 68
        Height = 14
        Caption = 'Nome Rede:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 3
        Top = 153
        Width = 105
        Height = 14
        Caption = '% Taxa Desc.Cr'#233'd:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit_Nome: TDBEdit
        Left = 110
        Top = 27
        Width = 289
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'DESCRICAO'
        DataSource = dsAdm_Cartoes
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnEnter = DBEdit_NomeEnter
        OnExit = DBEdit_NomeExit
      end
      object DBEdit1: TDBEdit
        Left = 110
        Top = 51
        Width = 121
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'TELEFONE'
        DataSource = dsAdm_Cartoes
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnEnter = DBEdit_NomeEnter
        OnExit = DBEdit_NomeExit
      end
      object DBEdit2: TDBEdit
        Left = 269
        Top = 51
        Width = 130
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'FAX'
        DataSource = dsAdm_Cartoes
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnEnter = DBEdit_NomeEnter
        OnExit = DBEdit_NomeExit
      end
      object DBEdit3: TDBEdit
        Left = 110
        Top = 77
        Width = 350
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'WEB_SITE'
        DataSource = dsAdm_Cartoes
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        OnEnter = DBEdit_NomeEnter
        OnExit = DBEdit_NomeExit
      end
      object DBEdit4: TDBEdit
        Left = 110
        Top = 101
        Width = 350
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'E_MAIL'
        DataSource = dsAdm_Cartoes
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnEnter = DBEdit_NomeEnter
        OnExit = DBEdit_NomeExit
      end
      object DBEdit5: TDBEdit
        Left = 110
        Top = 125
        Width = 99
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'TAXA_DESC_DEB'
        DataSource = dsAdm_Cartoes
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        OnEnter = DBEdit_NomeEnter
        OnExit = DBEdit_NomeExit
      end
      object DBEdit6: TDBEdit
        Left = 110
        Top = 149
        Width = 99
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'TAXA_DESC_CRED'
        DataSource = dsAdm_Cartoes
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        OnEnter = DBEdit_NomeEnter
        OnExit = DBEdit_NomeExit
      end
      object DBComboBox1: TDBComboBox
        Left = 110
        Top = 174
        Width = 187
        Height = 21
        DataField = 'NOME_REDE'
        DataSource = dsAdm_Cartoes
        ItemHeight = 13
        Items.Strings = (
          'AMEX'
          'REDECARD'
          'VISANET')
        TabOrder = 7
        OnKeyPress = DBComboBox1KeyPress
      end
      object BTSalvar: TBitBtn
        Left = 271
        Top = 200
        Width = 95
        Height = 30
        Cursor = crHandPoint
        Hint = 'Salvar registro'
        Caption = 'F10 - Salvar'
        Enabled = False
        TabOrder = 8
        OnClick = BTSalvarClick
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
        Left = 365
        Top = 200
        Width = 95
        Height = 30
        Cursor = crHandPoint
        Hint = 'Cancelar opera'#231#245'es'
        Caption = 'Esc - Cancel'
        Enabled = False
        TabOrder = 9
        OnClick = BTCancelaClick
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000430B0000430B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7070705050505050505050505050
          50505050707070FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070505050559CB791C1D4
          96C2D38ABDCF7BB4CA54A2BF317994505050707070FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7070705050505897B3EE
          F5F8DDECF2CCE3EBBBDAE6AAD1DF99C8D985BDD274B4CC5FA9C5358EAF505050
          707070FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA15897
          B3D9EEF5F6FBFCEEF5F8DDECF2CCE3EBBBDAE6AAD1DF99C8D985BDD274B4CC63
          ABC652A2C04199BA1F81A7505050FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF267FA1C4E7F2E2F4FAF6FBFCEEF5F8DDECF2CCE3EBBBDAE6AAD1DF99C8
          D985BDD274B4CC63ABC652A2C04199BA3090B3505050FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF267FA1CBECF7E2F4FAF6FBFCEEF5F8DDECF2CCE3EB
          BBDAE6AAD1DF99C8D985BDD274B4CC63ABC652A2C04199BA3090B3505050FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA1C5E8F4D0E8F1E0EDF2B3
          D1DE8BB9CD75ACC26AA5BE61A0BB569BB74E98B54E9AB8509FBD4C9FBE3C96B8
          2F8FB3505050FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA19AC7
          DA87B6CB8BB7CB9EC6D7B6D7E5CCE3EBBBDAE6AAD1DF99C8D984BDD163ABC640
          99BB3593B72A8CB1288BB0505050FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF267FA19FC9DADAEDF4F6FBFCEEF5F8DDECF2CCE3EBBBDAE6AAD1DF99C8
          D985BDD274B4CC63ABC652A2C04199BA278BAF505050FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF267FA1CBECF7E2F4FAF6FBFCEEF5F8DDECF2CCE3EB
          BBDAE6AAD1DF99C8D985BDD274B4CC63ABC652A2C04199BA3090B3505050FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA1CBECF7E2F4FAF6FBFCEE
          F5F8DDECF2CCE3EBBBDAE6AAD1DF99C8D985BDD274B4CC63ABC652A2C04199BA
          3090B3505050B45E2FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA1CBEC
          F7E2F4FAF6FBFCC3DBE593BDCF75ACC26AA5BE61A0BB569BB74E98B5529CB957
          A3C052A2C04199BA3090B3505050B45E2F983000FF00FFFF00FFFF00FFFF00FF
          FF00FF267FA19FCCDE77ACC475A9C18EBCD0AED3E2CCE3EBBBDAE6AAD1DF99C8
          D983BCD160A9C53D97B83391B4268AAF2A8CB1505050B45E2F983000FF00FFFF
          00FFFF00FFFF00FFFF00FF267FA194C0D2D8EBF3F6FBFCEEF5F8DDECF2CCE3EB
          BBDAE6AAD1DF99C8D985BDD274B4CC63ABC652A2C04199BA258AAE505050B45E
          2F983000FF00FFFF00FFFF00FFFF00FFFF00FF267FA1CBECF7E2F4FAF6FBFCEE
          F5F8DDECF2CCE3EBBBDAE6AAD1DF99C8D985BDD274B4CCB45E2F52A2C04199BA
          3090B3C37348B45E2F983000FF00FFFF00FFFF00FFFF00FFFF00FF267FA1CBEC
          F7E2F4FAF6FBFCEEF5F8DDECF2CCE3EBBBDAE6AAD1DF99C8D985BDD2B45E2F98
          300052A2C04199BA3090B3983000B76335983000FF00FFFF00FFFF00FFFF00FF
          FF00FF267FA1CBECF7E2F4FAEFF6F9CADFE89FC5D583B5C977AEC56DA8C161A3
          BCB45E2FB45E2F98300050A1BF4199BA983000BF6E42BB683BB76335FF00FFFF
          00FFFF00FFFF00FFFF00FF267FA1AAD5E679AEC573A8C086B8CD96C7DB9ACEE2
          91CCE485C9E4B45E2FB45E2FD38B64983000983000983000C7794FC373489830
          00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA190B9CCE4EEF3F4F9FDE4
          F4FBD5EEF8C5E8F6B5E2F4B45E2FB45E2FD8946ED69069D38B64D0875FCD835A
          CA7E55983000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA1AAC8
          D8FCFDFFFBFCFEF4F9FDE6F4FBD6EEF8C5E8F6B45E2FE4A582DB9873D8946ED6
          9069D38B64B45E2F983000006890FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF267FA181B0C5AAC8D8FCFDFFFAFCFEF4F9FDE7F5FBD7EFF8C7E9F6B45E
          2FE4A582DB9873983000983000B45E2F40B4E0267FA1FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF2D93BD267FA181B0C5AAC8D8FAFCFEF4F9FD
          E8F5FBD8EFF9C8EAF7B45E2FE4A58298300056BCE3267FA12D93BDFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2D93BD26
          7FA181B0C5A3C5D5B1CEDCB5D2E19AC3D57AB1C9B45E2F9830002D93BDFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF2D93BD267FA1267FA1267FA1267FA1267FA12D93BDB4
          5E2FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Spacing = 0
      end
    end
  end
  object BTincluir: TBitBtn
    Left = 1
    Top = 272
    Width = 95
    Height = 30
    Cursor = crHandPoint
    Hint = 'Incluir registro'
    Caption = 'Ins - Novo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BTincluirClick
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000430B0000430B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF7070705050505050505050505050505050
      50707070FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070505050559CB791C1D496C2D3
      8ABDCF7BB4CA54A2BF317994505050707070FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7070705050505897B3EEF5F8DD
      ECF2CCE3EBBBDAE6AAD1DF99C8D985BDD274B4CC5FA9C5358EAF505050707070
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA15897B3D9EE
      F5F6FBFCEEF5F8DDECF2CCE3EBBBDAE6AAD1DF99C8D985BDD274B4CC63ABC652
      A2C04199BA1F81A7505050FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      267FA1C4E7F2E2F4FAF6FBFCEEF5F8DDECF2CCE3EBBBDAE6AAD1DF99C8D985BD
      D274B4CC63ABC652A2C04199BA3090B3505050FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF267FA1CBECF7E2F4FAF6FBFCEEF5F8DDECF2CCE3EBBBDAE6
      AAD1DF99C8D985BDD274B4CC63ABC652A2C04199BA3090B3505050FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA1C5E8F4D0E8F1E0EDF2B3D1DE8B
      B9CD75ACC26AA5BE61A0BB569BB74E98B54E9AB8509FBD4C9FBE3C96B82F8FB3
      505050FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA19AC7DA87B6
      CB8BB7CB9EC6D7B6D7E5CCE3EBBBDAE6AAD1DF99C8D984BDD163ABC64099BB35
      93B72A8CB1288BB0505050FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      267FA19FC9DADAEDF4F6FBFCEEF5F8DDECF2CCE3EBBBDAE6AAD1DF99C8D985BD
      D274B4CC63ABC652A2C04199BA278BAF505050FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF267FA1CBECF7E2F4FAF6FBFCEEF5F8DDECF2CCE3EBBBDAE6
      AAD1DF99C8D985BDD274B4CC63ABC652A2C04199BA3090B3505050FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA1CBECF7E2F4FAF6FBFCEEF5F8DD
      ECF2CCE3EBBBDAE6AAD1DF99C8D985BDD274B4CC63ABC652A2C04199BA3090B3
      505050FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA1CBECF7E2F4
      FAF6FBFCC3DBE593BDCF75ACC26AA5BE61A0BB569BB74E98B5529CB957A3C052
      A2C04199BA3090B3505050FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      267FA19FCCDE77ACC475A9C18EBCD0AED3E2CCE3EBBBDAE6AAD1DF99C8D983BC
      D160A9C53D97B83391B4268AAF2A8CB1505050FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF267FA194C0D2D8EBF3F6FBFCEEF5F8DDECF2CCE3EBBBDAE6
      AAD1DF99C8D985BDD274B4CC63ABC652A2C04199BA258AAE505050FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA1CBECF7E2F4FAF6FBFCEEF5F8DD
      ECF2CCE3EBBBDAE6AAD1DF99C8D985BDD274B4CC63ABC652A2C04199BA3090B3
      505050FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA1CBECF7E2F4
      FAF6FBFCEEF5F8DDECF2CCE3EBBBDAE6AAD1DF99C8D985BDD274B4CC63ABC652
      A2C04199BA3090B3006000006000006000FF00FFFF00FFFF00FFFF00FFFF00FF
      267FA1CBECF7E2F4FAEFF6F9CADFE89FC5D583B5C977AEC56DA8C161A3BC579E
      BA57A0BC58A3C050A1BF4199BA3090B300600020B832006000FF00FFFF00FFFF
      00FFFF00FFFF00FF267FA1AAD5E679AEC573A8C086B8CD96C7DB9ACEE291CCE4
      85C9E473C2DF60B8DA49A9CE3397BE2688AF2785A92D8CB000600030C84C0060
      00FF00FFFF00FFFF00FFFF00FFFF00FF267FA190B9CCE4EEF3F4F9FDE4F4FBD5
      EEF8C5E8F6B5E2F4A4DCF195D7F082D0EE70CAEB5FC3E9006000006000006000
      00600045DD6D006000006000006000006000FF00FFFF00FF267FA1AAC8D8FCFD
      FFFBFCFEF4F9FDE6F4FBD6EEF8C5E8F6B5E3F4A6DDF294D6F083D0EE72CAEB00
      600060F89860F89860F89853EB8345DD6D37CF5728C03F006000FF00FFFF00FF
      267FA181B0C5AAC8D8FCFDFFFAFCFEF4F9FDE7F5FBD7EFF8C7E9F6B7E3F5A5DC
      F295D7F084D1EE00600000600000600000600060F89800600000600000600000
      6000FF00FFFF00FFFF00FF2D93BD267FA181B0C5AAC8D8FAFCFEF4F9FDE8F5FB
      D8EFF9C8EAF7B5E3F4A6DDF283D0ED56BCE3267FA12D93BD00600060F8980060
      00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2D93BD267FA181
      B0C5A3C5D5B1CEDCB5D2E19AC3D57AB1C962A5C0267FA12D93BDFF00FFFF00FF
      00600060F898006000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FF2D93BD267FA1267FA1267FA1267FA1267FA12D93BDFF00FFFF
      00FFFF00FFFF00FF006000006000006000FF00FFFF00FFFF00FF}
  end
  object BTAlterar: TBitBtn
    Left = 95
    Top = 272
    Width = 95
    Height = 30
    Cursor = crHandPoint
    Hint = 'Editar registro'
    Caption = 'F2 - Alterar'
    TabOrder = 3
    OnClick = BTAlterarClick
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000430B0000430B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF7070705050505050505050505050505050
      50707070FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070505050559CB791C1D496C2D3
      8ABDCF7BB4CA54A2BF317994505050707070FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7070705050505897B3EEF5F8DD
      ECF2CCE3EBBBDAE6AAD1DF99C8D985BDD274B4CC5FA9C5358EAF505050707070
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA15897B3D9EE
      F5F6FBFCEEF5F82D2D2D6094A8BBDAE6AAD1DF99C8D985BDD274B4CC63ABC652
      A2C04199BA1F81A7505050FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      267FA1C4E7F2E2F4FAF6FBFCEEF5F856524F2D2D2D2C424C6094A899C8D985BD
      D274B4CC63ABC652A2C04199BA3090B3505050FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF267FA1CBECF7E2F4FAF6FBFCEEF5F86094A8215A73428CDE
      396BAD215A7385BDD274B4CC63ABC652A2C04199BA3090B3505050FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA1C5E8F4D0E8F1E0EDF2B3D1DE8B
      B9CD54777B5AB5EF3173CE396BAD424D5A4E9AB8509FBD4C9FBE3C96B82F8FB3
      505050FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA19AC7DA87B6
      CB8BB7CB9EC6D7B6D7E56094A854777B396BADA376760098C81C1C1C4099BB35
      93B72A8CB1288BB0505050FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      267FA19FC9DADAEDF4F6FBFCEEF5F8DDECF2CCE3EB54777BA376764ABEDF30A8
      D00098C81C1C1C52A2C04199BA278BAF505050FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF267FA1CBECF7E2F4FAF6FBFCEEF5F8DDECF2CCE3EB68A0C0
      94E4F660C8F84ABEDF30A8D00098C81C1C1C4199BA3090B3505050FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA1CBECF7E2F4FAF6FBFCEEF5F8DD
      ECF2CCE3EBBBDAE668A0C094E4F660C8F84ABEDF30A8D00098C81C1C1C3090B3
      505050FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA1CBECF7E2F4
      FAF6FBFCC3DBE593BDCF75ACC26AA5BE61A0BB68A0C094E4F660C8F84ABEDF30
      A8D00098C81C1C1C505050FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      267FA19FCCDE77ACC475A9C18EBCD0AED3E2CCE3EBBBDAE6AAD1DF99C8D968A0
      C094E4F660C8F84ABEDF30A8D00098C81C1C1CFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF267FA194C0D2D8EBF3F6FBFCEEF5F8DDECF2CCE3EBBBDAE6
      AAD1DF99C8D985BDD268A0C094E4F660C8F84ABEDF30A8D00098C81C1C1CFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF267FA1CBECF7E2F4FAF6FBFCEEF5F8DD
      ECF2CCE3EBBBDAE6AAD1DF99C8D985BDD274B4CC68A0C094E4F660C8F84ABEDF
      30A8D09898981C1C1CFF00FFFF00FFFF00FFFF00FFFF00FF267FA1CBECF7E2F4
      FAF6FBFCEEF5F8DDECF2CCE3EBBBDAE6AAD1DF99C8D985BDD274B4CC63ABC668
      A0C094E4F660C8F8989898B0B0B09898981C1C1CFF00FFFF00FFFF00FFFF00FF
      267FA1CBECF7E2F4FAEFF6F9CADFE89FC5D583B5C977AEC56DA8C161A3BC579E
      BA57A0BC58A3C050A1BF68A0C0989898D0D0D0BBC0BF0130B10018C600009AFF
      00FFFF00FFFF00FF267FA1AAD5E679AEC573A8C086B8CD96C7DB9ACEE291CCE4
      85C9E473C2DF60B8DA49A9CE3397BE2688AF2785A999A8ACE8E8E81464C60031
      FF1029D61029D600009AFF00FFFF00FF267FA190B9CCE4EEF3F4F9FDE4F4FBD5
      EEF8C5E8F6B5E2F4A4DCF195D7F082D0EE70CAEB5FC3E94FBDE738AEDB1C8DB9
      99A8AC0018C6106BFF0031FF1029D600009AFF00FFFF00FF267FA1AAC8D8FCFD
      FFFBFCFEF4F9FDE6F4FBD6EEF8C5E8F6B5E3F4A6DDF294D6F083D0EE72CAEB61
      C4E94FBEE73FB8E50068900018C66D8AFD106BFF00009AFF00FFFF00FFFF00FF
      267FA181B0C5AAC8D8FCFDFFFAFCFEF4F9FDE7F5FBD7EFF8C7E9F6B7E3F5A5DC
      F295D7F084D1EE73CBEC58C1E840B4E0267FA1FF00FF7823DF00009AFF00FFFF
      00FFFF00FFFF00FFFF00FF2D93BD267FA181B0C5AAC8D8FAFCFEF4F9FDE8F5FB
      D8EFF9C8EAF7B5E3F4A6DDF283D0ED56BCE3267FA12D93BDFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2D93BD267FA181
      B0C5A3C5D5B1CEDCB5D2E19AC3D57AB1C962A5C0267FA12D93BDFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FF2D93BD267FA1267FA1267FA1267FA1267FA12D93BDFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object BTSair: TBitBtn
    Left = 189
    Top = 272
    Width = 95
    Height = 30
    Cursor = crHandPoint
    Hint = 'Sair da janela'
    Caption = 'Esc - Sair'
    TabOrder = 4
    OnClick = BTSairClick
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
  object dsAdm_Cartoes: TDataSource
    AutoEdit = False
    DataSet = DM.TCartao_Adm
    Left = 240
    Top = 120
  end
end
