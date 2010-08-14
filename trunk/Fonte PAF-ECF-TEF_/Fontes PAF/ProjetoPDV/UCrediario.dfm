object FCrediario: TFCrediario
  Left = 70
  Top = 113
  AutoScroll = False
  BorderIcons = [biSystemMenu]
  Caption = 'LAN'#199'AMENTO DE CREDI'#193'RIO'
  ClientHeight = 356
  ClientWidth = 661
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label9: TLabel
    Left = 108
    Top = 93
    Width = 119
    Height = 13
    Caption = '[ F2 ] - Edita Parcelas'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GCliente: TGroupBox
    Left = 4
    Top = 0
    Width = 490
    Height = 44
    Caption = 'CLIENTE'
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    object LCliente: TmyLabel3d
      Left = 5
      Top = 17
      Width = 468
      Height = 16
      AutoSize = False
      Caption = 'CLIENTE'
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      AShadeLTSet = False
    end
  end
  object GValorCompra: TGroupBox
    Left = 494
    Top = 0
    Width = 162
    Height = 44
    Caption = 'VALOR DA COMPRA'
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    object EValor_Crediario: TCurrencyEdit
      Left = 5
      Top = 14
      Width = 152
      Height = 26
      AutoSize = False
      BorderStyle = bsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object GCarteira: TGroupBox
    Left = 3
    Top = 45
    Width = 134
    Height = 44
    Caption = 'CARTEIRA'
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    object ECarteira: TCurrencyEdit
      Left = 5
      Top = 14
      Width = 120
      Height = 28
      AutoSize = False
      BorderStyle = bsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnEnter = ECarteiraEnter
      OnExit = ECarteiraExit
      OnKeyUp = ECarteiraKeyUp
    end
  end
  object GCheque: TGroupBox
    Left = 2
    Top = 176
    Width = 134
    Height = 44
    Caption = 'CHEQUE PR'#201
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 5
    object ECheque: TCurrencyEdit
      Left = 5
      Top = 15
      Width = 120
      Height = 24
      AutoSize = False
      BorderStyle = bsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnEnter = EChequeEnter
      OnExit = EChequeExit
      OnKeyUp = ECarteiraKeyUp
    end
  end
  object SB: TStatusBar
    Left = 0
    Top = 337
    Width = 661
    Height = 19
    Panels = <>
    ParentColor = True
  end
  object GParcelas: TGroupBox
    Left = 137
    Top = 45
    Width = 94
    Height = 44
    Caption = 'N'#186' PARCELAS'
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 3
    object ENumParcelas: TCurrencyEdit
      Left = 2
      Top = 14
      Width = 89
      Height = 28
      Alignment = taCenter
      AutoSize = False
      BorderStyle = bsNone
      DisplayFormat = '00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Value = 1.000000000000000000
      OnEnter = ECarteiraEnter
      OnExit = ENumParcelasExit
      OnKeyUp = ECarteiraKeyUp
    end
  end
  object GNumCheques: TGroupBox
    Left = 136
    Top = 176
    Width = 94
    Height = 44
    Caption = 'N'#186' CHEQUES'
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 6
    object ENumCheques: TCurrencyEdit
      Left = 2
      Top = 14
      Width = 88
      Height = 28
      Alignment = taCenter
      AutoSize = False
      BorderStyle = bsNone
      DisplayFormat = '00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Value = 1.000000000000000000
      OnEnter = ECarteiraEnter
      OnExit = ENumChequesExit
      OnKeyPress = ENumChequesKeyPress
      OnKeyUp = ECarteiraKeyUp
    end
  end
  object DBGridCarteira: TDBGrid
    Left = 232
    Top = 51
    Width = 423
    Height = 120
    Ctl3D = True
    DataSource = dsCarteira
    FixedColor = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -12
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnEnter = DBGridCarteiraEnter
    OnExit = DBGridCarteiraExit
    OnKeyDown = DBGridCarteiraKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'VENCIMENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PARCELA'
        Visible = True
      end>
  end
  object PCheque: TPanel
    Left = 231
    Top = 173
    Width = 424
    Height = 120
    Color = clWhite
    TabOrder = 7
    object Label1: TLabel
      Left = 2
      Top = 2
      Width = 37
      Height = 14
      Caption = 'Banco'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 41
      Top = 2
      Width = 48
      Height = 14
      Caption = 'Ag'#234'ncia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 96
      Top = 2
      Width = 55
      Height = 14
      Caption = 'N'#186' Conta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 160
      Top = 2
      Width = 64
      Height = 14
      Caption = 'N'#186' Cheque'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 229
      Top = 2
      Width = 62
      Height = 14
      Caption = 'Bom para:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 335
      Top = 2
      Width = 31
      Height = 14
      Caption = 'Valor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGridCheque: TDBGrid
      Left = 1
      Top = 41
      Width = 417
      Height = 77
      Ctl3D = True
      DataSource = dsCheque
      FixedColor = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'CODBANCO'
          Title.Caption = 'BANCO'
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AGENCIA'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTA'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CHEQUE'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VENCIMENTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Width = 68
          Visible = True
        end>
    end
    object ECodBanco: TEdit
      Left = 2
      Top = 18
      Width = 39
      Height = 21
      AutoSize = False
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Text = 'ECodBanco'
      OnEnter = ECodBancoEnter
      OnExit = ECodBancoExit
      OnKeyUp = ECarteiraKeyUp
    end
    object EAgencia: TEdit
      Left = 41
      Top = 18
      Width = 55
      Height = 21
      AutoSize = False
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      Text = 'EAgencia'
      OnEnter = EAgenciaEnter
      OnExit = EAgenciaExit
      OnKeyUp = ECarteiraKeyUp
    end
    object EConta: TEdit
      Left = 96
      Top = 18
      Width = 64
      Height = 21
      AutoSize = False
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      Text = 'EConta'
      OnEnter = EContaEnter
      OnExit = EContaExit
      OnKeyUp = ECarteiraKeyUp
    end
    object ENumCheque: TEdit
      Left = 160
      Top = 18
      Width = 68
      Height = 21
      AutoSize = False
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      Text = 'ENumCheque'
      OnEnter = ENumChequeEnter
      OnExit = ENumChequeExit
      OnKeyUp = ECarteiraKeyUp
    end
    object EVencimentoCheque: TDateEdit
      Left = 228
      Top = 18
      Width = 107
      Height = 21
      CheckOnExit = True
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      OnEnter = EVencimentoChequeEnter
      OnExit = EVencimentoChequeExit
      OnKeyUp = ECarteiraKeyUp
    end
    object EValorCheque: TCurrencyEdit
      Left = 336
      Top = 18
      Width = 82
      Height = 21
      AutoSize = False
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
      OnEnter = EValorChequeEnter
      OnExit = EValorChequeExit
      OnKeyPress = EValorChequeKeyPress
      OnKeyUp = ECarteiraKeyUp
    end
  end
  object BTOk: TBitBtn
    Left = 120
    Top = 297
    Width = 193
    Height = 35
    Cursor = crHandPoint
    Caption = 'F10 - Confirma'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = BTOkClick
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000330B0000330B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF69473169473169473169473169
      4731694731694731694731694731694731694731694731694731694731694731
      6947316947313C511CFF00FFFF00FFFF00FFFF00FFFF00FF00900072D28A0060
      0000600000600000600000600000600000600000600000600000600000600000
      6000006000006000006000006000006000694731FF00FFFF00FFFF00FFFF00FF
      009000FFFFFF41C15E3CBE5837BB5032B84A2EB5432AB23D25AF3620AC2F1BA9
      2716A62011A2190CA012089D0C039905009800009800006000694731FF00FFFF
      00FFFF00FFFF00FF009000FFFFFF45C46441C15E3BBE5737BB5032B84A2EB543
      2AB23D25AF361FAC2E1BA92716A62011A2190CA012089D0C0299040098000060
      00694731FF00FFFF00FFFF00FFFF00FF009000FFFFFF4CC86E46C56641C15E3C
      BE5838BB5229A63C178A212BB33E26B03720AC2F1BA92817A62112A31A0DA013
      089D0C039905006000694731FF00FFFF00FFFF00FFFF00FF009000FFFFFF51CB
      754CC86E47C56743C26131AC48FFFFFF046706188B232CB44026B03721AC301C
      AA2917A72212A31B0DA013089D0C006000694731FF00FFFF00FFFF00FFFF00FF
      009000FFFFFF55CE7B51CB754CC86D39B052FFFFFFFFFFFFFFFFFF046706188A
      222CB44027B13922AD321DAB2B19A72414A41C0EA115006000694731FF00FFFF
      00FFFF00FFFF00FF009000FFFFFF57CF7F55CE7B40B55CFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF046706188A222CB44027B13922AD321DAB2B18A72314A41C0060
      00694731FF00FFFF00FFFF00FFFF00FF009000FFFFFF58D08045B865FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF046706188A222CB44027B13922AD32
      1DAA2A18A723006000694731FF00FFFF00FFFF00FFFF00FF009000FFFFFF58D0
      80FFFFFFFFFFFFFFFFFFFFFFFF3DB357FFFFFFFFFFFFFFFFFFFFFFFF04670618
      8A222CB44027B13921AD311DAA2A006000694731FF00FFFF00FFFF00FFFF00FF
      009000FFFFFF58D08058D080FFFFFFFFFFFF44B86452CC774EC971FFFFFFFFFF
      FFFFFFFFFFFFFF046706188B232DB44128B13A22AD32006000694731FF00FFFF
      00FFFF00FFFF00FF009000FFFFFF58D08058D08058D08058D08058D08056CF7D
      52CC774EC971FFFFFFFFFFFFFFFFFFFFFFFF056707198B242DB54229B13B0060
      00694731FF00FFFF00FFFF00FFFF00FF009000FFFFFF58D08058D08058D08058
      D08058D08058D08056CF7D52CC774EC970FFFFFFFFFFFFFFFFFFFFFFFF056707
      198B242DB543006000694731FF00FFFF00FFFF00FFFF00FF009000FFFFFF58D0
      8058D08058D08058D08058D08058D08058D08056CF7D52CC774EC970FFFFFFFF
      FFFFFFFFFFFFFFFF046707198B24006000694731FF00FFFF00FFFF00FFFF00FF
      009000FFFFFF58D08058D08058D08058D08058D08058D08058D08058D08056CF
      7D52CC774EC970FFFFFFFFFFFFFFFFFFFFFFFF2BA840006000694731FF00FFFF
      00FFFF00FFFF00FF009000FFFFFF58D08058D08058D08058D08058D08058D080
      58D08058D08057CF7F56CF7D52CC774EC970FFFFFFFFFFFF32AC493BBD560060
      00694731FF00FFFF00FFFF00FFFF00FF009000FFFFFF58D08058D08058D08058
      D08058D08058D08058D08058D08058D08058D08057CF7E54CE7A50CB744CC86D
      46C46640C15D006000694731FF00FFFF00FFFF00FFFF00FF009000FFFFFF58D0
      8058D08058D08058D08058D08058D08058D08058D08058D08058D08058D08057
      CF7E54CE7A50CB744BC86C47C566006000694731FF00FFFF00FFFF00FFFF00FF
      009000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF76D48F694731FF00FFFF
      00FFFF00FFFF00FFFF00FF009000009000009000009000009000009000009000
      0090000090000090000090000090000090000090000090000090000090000090
      00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object BTCancela: TBitBtn
    Left = 326
    Top = 297
    Width = 193
    Height = 35
    Cursor = crHandPoint
    Caption = 'Esc - Retorna'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
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
  object PEditaParcela: TPanel
    Left = 297
    Top = 84
    Width = 284
    Height = 56
    BorderStyle = bsSingle
    Color = clWhite
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 11
    Visible = False
    object Label7: TLabel
      Left = 9
      Top = 5
      Width = 78
      Height = 14
      Caption = 'VENCIMENTO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 153
      Top = 5
      Width = 63
      Height = 14
      Caption = 'R$:VALOR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EVencimento: TDateEdit
      Left = 9
      Top = 20
      Width = 121
      Height = 24
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ButtonWidth = 20
      NumGlyphs = 2
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnEnter = EVencimentoEnter
      OnExit = EVencimentoExit
    end
    object EValor: TCurrencyEdit
      Left = 153
      Top = 20
      Width = 121
      Height = 23
      AutoSize = False
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnEnter = EValorEnter
      OnExit = EValorExit
      OnKeyPress = EValorKeyPress
    end
  end
  object dsCarteira: TDataSource
    DataSet = TParcelasCarteira
    Left = 603
    Top = 94
  end
  object dsCheque: TDataSource
    DataSet = TParcelasCheque
    Left = 467
    Top = 257
  end
  object TParcelasCheque: TClientDataSet
    Active = True
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 438
    Top = 257
    Data = {
      910000009619E0BD010000001800000006000000000003000000910008434F44
      42414E434F0400010000000000074147454E4349410100490000000100055749
      445448020002000F0005434F4E54410100490000000100055749445448020002
      000F000643484551554504000100000000000A56454E43494D454E544F040006
      00000000000556414C4F5208000400000000000000}
    object TParcelasChequeCODBANCO: TIntegerField
      FieldName = 'CODBANCO'
      DisplayFormat = '000'
    end
    object TParcelasChequeAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 15
    end
    object TParcelasChequeCONTA: TStringField
      FieldName = 'CONTA'
      Size = 15
    end
    object TParcelasChequeCHEQUE: TIntegerField
      FieldName = 'CHEQUE'
    end
    object TParcelasChequeVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object TParcelasChequeVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '##,###0.00'
    end
    object TParcelasChequeTOTAL: TAggregateField
      FieldName = 'TOTAL'
      Active = True
      Expression = 'SUM(VALOR)'
    end
  end
  object TParcelasCarteira: TClientDataSet
    Active = True
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 574
    Top = 94
    Data = {
      A80000009619E0BD020000001800000004000000000003000000A80002494404
      0001000200010007535542545950450200490008004175746F696E63000A5645
      4E43494D454E544F04000600000000000556414C4F5212001200000002000844
      4543494D414C530200020002000557494454480200020020000750415243454C
      41010049000000010005574944544802000200050001000C4155544F494E4356
      414C55450400010001000000}
    object TParcelasCarteiraID: TAutoIncField
      FieldName = 'ID'
    end
    object TParcelasCarteiraVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      EditMask = '!##/##/####;1; '
    end
    object TParcelasCarteiraVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '##,###0.00'
      Size = 2
    end
    object TParcelasCarteiraPARCELA: TStringField
      FieldName = 'PARCELA'
      Size = 5
    end
    object TParcelasCarteiraSOMA: TAggregateField
      FieldName = 'SOMA'
      Active = True
      Expression = 'SUM(VALOR)'
    end
  end
end
