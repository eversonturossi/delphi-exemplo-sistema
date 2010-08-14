object FMenuFiscal: TFMenuFiscal
  Left = 340
  Top = 220
  Width = 552
  Height = 348
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Menu Fiscal'
  Color = clInfoBk
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 536
    Height = 312
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object Label7: TLabel
    Left = 4
    Top = 270
    Width = 104
    Height = 13
    Caption = 'Arquivo Salvo em:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RGFaixaDados: TRadioGroup
    Left = 4
    Top = 5
    Width = 147
    Height = 92
    Caption = 'Faixa de Dados'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      '0 - Per'#237'odo'
      '1 - CRZ'
      '2 - COO')
    ParentFont = False
    TabOrder = 0
    OnClick = RGFaixaDadosClick
  end
  object GCRZ_COO: TGroupBox
    Left = 4
    Top = 99
    Width = 147
    Height = 79
    Caption = 'COO'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label5: TLabel
      Left = 7
      Top = 23
      Width = 37
      Height = 13
      Caption = 'Inicial:'
    end
    object Label6: TLabel
      Left = 16
      Top = 48
      Width = 29
      Height = 13
      Caption = 'Final:'
    end
    object ECOO_CRZI: TEdit
      Left = 48
      Top = 21
      Width = 89
      Height = 21
      TabOrder = 0
      Text = 'ECOO_CRZI'
      OnExit = ECOO_CRZIExit
    end
    object ECOO_CRZF: TEdit
      Left = 48
      Top = 45
      Width = 89
      Height = 21
      TabOrder = 1
      Text = 'ECOO_CRZF'
      OnExit = ECOO_CRZFExit
    end
  end
  object GPeriodo: TGroupBox
    Left = 4
    Top = 99
    Width = 147
    Height = 79
    Caption = 'Per'#237'odo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 11
      Top = 23
      Width = 18
      Height = 13
      Caption = 'De:'
    end
    object Label2: TLabel
      Left = 12
      Top = 47
      Width = 10
      Height = 13
      Caption = #225':'
    end
    object EDataI: TDateEdit
      Left = 31
      Top = 19
      Width = 101
      Height = 21
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 0
    end
    object EDataF: TDateEdit
      Left = 31
      Top = 45
      Width = 101
      Height = 21
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 1
    end
  end
  object BtLX: TBitBtn
    Left = 159
    Top = 10
    Width = 177
    Height = 25
    Cursor = crHandPoint
    Hint = 'Leitura X'
    Caption = 'LX'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = BtLXClick
  end
  object BtLMFC: TBitBtn
    Left = 159
    Top = 46
    Width = 177
    Height = 25
    Cursor = crHandPoint
    Hint = 'Leitura da mem'#243'ria fiscal Completa'
    Caption = 'LMFC'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = BtLMFCClick
  end
  object BtLMFS: TBitBtn
    Left = 159
    Top = 83
    Width = 177
    Height = 25
    Cursor = crHandPoint
    Hint = 'Leitura da mem'#243'ria fiscal Simplificada'
    Caption = 'LMFS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = BtLMFSClick
  end
  object BtEspelhoMFD: TBitBtn
    Left = 159
    Top = 119
    Width = 177
    Height = 25
    Cursor = crHandPoint
    Caption = 'Espelho MFD'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = BtEspelhoMFDClick
  end
  object BtArqMFD: TBitBtn
    Left = 159
    Top = 155
    Width = 177
    Height = 25
    Cursor = crHandPoint
    Caption = 'Arq. MFD'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = BtArqMFDClick
  end
  object BtTabProd: TBitBtn
    Left = 343
    Top = 10
    Width = 177
    Height = 25
    Cursor = crHandPoint
    Caption = 'Tab. Prod.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = BtTabProdClick
  end
  object BtEstoque: TBitBtn
    Left = 343
    Top = 46
    Width = 177
    Height = 25
    Cursor = crHandPoint
    Caption = 'Estoque'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = BtEstoqueClick
  end
  object BtMovtoECF: TBitBtn
    Left = 343
    Top = 83
    Width = 177
    Height = 25
    Cursor = crHandPoint
    Caption = 'Movimento por ECF'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = BtMovtoECFClick
  end
  object BtMeiosPagto: TBitBtn
    Left = 343
    Top = 119
    Width = 177
    Height = 25
    Cursor = crHandPoint
    Caption = 'Meios de Pagto.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = BtMeiosPagtoClick
  end
  object BtPAF_ECF: TBitBtn
    Left = 159
    Top = 188
    Width = 362
    Height = 25
    Cursor = crHandPoint
    Caption = 'Identifica'#231#227'o do PAF-ECF'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnClick = BtPAF_ECFClick
  end
  object BtFechar: TBitBtn
    Left = 159
    Top = 222
    Width = 362
    Height = 25
    Cursor = crHandPoint
    Caption = 'F10 - Fechar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    OnClick = BtFecharClick
  end
  object RGSaida: TRadioGroup
    Left = 3
    Top = 188
    Width = 147
    Height = 68
    Caption = 'Tipo de Sa'#237'da'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      '0 - Impressora'
      '1 - Arquivo')
    ParentFont = False
    TabOrder = 14
  end
  object BtTabIndiceTecnico: TBitBtn
    Left = 159
    Top = 252
    Width = 177
    Height = 25
    Cursor = crHandPoint
    Caption = 'Tab. '#205'ndice T'#233'cnico Produ'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    OnClick = BtTabIndiceTecnicoClick
  end
  object BtVendasPeriodo: TBitBtn
    Left = 343
    Top = 156
    Width = 177
    Height = 25
    Cursor = crHandPoint
    Caption = 'Vendas do Per'#237'odo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
    OnClick = BtVendasPeriodoClick
  end
  object BtDAVEmitidos: TBitBtn
    Left = 343
    Top = 251
    Width = 177
    Height = 25
    Cursor = crHandPoint
    Caption = 'DAV Emitidos'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
    OnClick = BtDAVEmitidosClick
  end
  object Panel1: TPanel
    Left = 5
    Top = 285
    Width = 524
    Height = 27
    BevelOuter = bvNone
    Color = clInfoBk
    Enabled = False
    ParentBackground = False
    TabOrder = 18
    object EArquivo: TEdit
      Left = 2
      Top = 1
      Width = 519
      Height = 21
      TabOrder = 0
    end
  end
end
