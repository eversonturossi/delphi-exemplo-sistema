object ffechamentovenda_tef: Tffechamentovenda_tef
  Left = 300
  Top = 120
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Fechamento da Venda'
  ClientHeight = 536
  ClientWidth = 792
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
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 792
    Height = 515
    Align = alClient
    Picture.Data = {
      0A544A504547496D61676584020000FFD8FFE000104A46494600010200006400
      640000FFEC00114475636B79000100040000003C0000FFEE002641646F626500
      64C0000000010300150403060A0D000001C8000001E90000023D00000282FFDB
      0084000604040405040605050609060506090B080606080B0C0A0A0B0A0A0C10
      0C0C0C0C0C0C100C0E0F100F0E0C1313141413131C1B1B1B1C1F1F1F1F1F1F1F
      1F1F1F010707070D0C0D181010181A1511151A1F1F1F1F1F1F1F1F1F1F1F1F1F
      1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
      1F1F1F1FFFC2001108002C002A03011100021101031101FFC400800001010101
      0100000000000000000000000004010306010100030101000000000000000000
      0000000102030405100101010101000000000000000000000000121150201101
      0000000000000000000000000000005012010000000000000000000000000000
      00501301010101010100000000000000000000001120715051FFDA000C030100
      02110311000001F57E97380069467600014E7600014E7200029CEC00D074AC80
      00FFDA000801010001050294A529625294B1894A5294A5294A5294A5294FBFFF
      DA0008010200010502E27FFFDA0008010300010502E27FFFDA0008010202063F
      0213FFDA0008010302063F0213FFDA0008010101063F0213FFDA000801010301
      3F21F1010C0000FFDA0008010203013F21AAAAAAAAAAAAAAAAAAAAAAAAAAAAAB
      BFFFDA0008010303013F21F13FFFDA000C030100021103110000107FFEFF00FF
      00F4B699FF00FD494024924FFFDA0008010103013F10872A5297F331CB9421CA
      94ADA10843952B7FFFDA0008010203013F10F13CE0872CFFDA0008010303013F
      10888888888888888888888888888889BFFFD9}
    Stretch = True
  end
  object Shape1: TShape
    Left = 3
    Top = 4
    Width = 785
    Height = 65
    Brush.Style = bsHorizontal
    Pen.Color = 12615680
    Pen.Style = psInsideFrame
    Shape = stRoundRect
  end
  object LSubTotal: TmyLabel3d
    Left = 199
    Top = 6
    Width = 375
    Height = 63
    AutoSize = False
    Caption = 'FECHAMENTO'
    Color = clWindow
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -48
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold, fsUnderline]
    ParentColor = False
    ParentFont = False
    Transparent = True
    AStyle3D = Shadowed3d
    AShadeRightBottom = clWhite
    AShadeLTSet = False
  end
  object Shape2: TShape
    Left = 173
    Top = 73
    Width = 613
    Height = 59
    Pen.Color = 12615680
    Pen.Style = psInsideFrame
    Shape = stRoundRect
  end
  object myLabel3d1: TmyLabel3d
    Left = 312
    Top = 87
    Width = 192
    Height = 38
    Caption = 'SUBTOTAL:'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -32
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    AStyle3D = Shadowed3d
    AShadeRightBottom = clSilver
    AShadeLTSet = False
  end
  object Shape3: TShape
    Left = 173
    Top = 135
    Width = 613
    Height = 59
    Pen.Color = 12615680
    Pen.Style = psInsideFrame
    Shape = stRoundRect
  end
  object myLabel3d5: TmyLabel3d
    Left = 222
    Top = 150
    Width = 282
    Height = 38
    Caption = 'TOTAL L'#205'QUIDO:'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -32
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    AStyle3D = Shadowed3d
    AShadeRightBottom = clSilver
    AShadeLTSet = False
  end
  object Shape4: TShape
    Left = 172
    Top = 197
    Width = 613
    Height = 59
    Pen.Color = 12615680
    Pen.Style = psInsideFrame
    Shape = stRoundRect
  end
  object myLabel3d2: TmyLabel3d
    Left = 183
    Top = 210
    Width = 321
    Height = 38
    Caption = 'VALOR RECEBIDO:'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -32
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    AStyle3D = Shadowed3d
    AShadeRightBottom = clSilver
    AShadeLTSet = False
  end
  object Shape5: TShape
    Left = 172
    Top = 262
    Width = 613
    Height = 59
    Pen.Color = 12615680
    Pen.Style = psInsideFrame
    Shape = stRoundRect
  end
  object myLabel3d7: TmyLabel3d
    Left = 310
    Top = 274
    Width = 194
    Height = 38
    Caption = 'RESTANTE:'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -32
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    AStyle3D = Shadowed3d
    AShadeRightBottom = clSilver
    AShadeLTSet = False
  end
  object Shape6: TShape
    Left = 172
    Top = 326
    Width = 613
    Height = 59
    Pen.Color = 12615680
    Pen.Style = psInsideFrame
    Shape = stRoundRect
  end
  object myLabel3d3: TmyLabel3d
    Left = 370
    Top = 337
    Width = 134
    Height = 38
    Caption = 'TROCO:'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -32
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    AStyle3D = Shadowed3d
    AShadeRightBottom = clSilver
    AShadeLTSet = False
  end
  object myLabel3d4: TmyLabel3d
    Left = 309
    Top = 390
    Width = 166
    Height = 32
    Caption = 'Formas de Pagamentos'#13#10'                  selecionada'
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    AStyle3D = Raised3d
    AShadeLTSet = False
  end
  object Shape7: TShape
    Left = 480
    Top = 385
    Width = 305
    Height = 138
    Pen.Color = 12615680
    Shape = stRoundRect
  end
  object myLabel3d6: TmyLabel3d
    Left = 7
    Top = 365
    Width = 161
    Height = 16
    Caption = 'Formas de pagametos:'
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    AStyle3D = Raised3d
    AShadeLTSet = False
  end
  object Shape8: TShape
    Left = 2
    Top = 385
    Width = 182
    Height = 138
    Pen.Color = 12615680
    Shape = stRoundRect
  end
  object LEncerramento1: TmyLabel3d
    Left = 136
    Top = 521
    Width = 511
    Height = 28
    Caption = 'TECLE ENTER PARA O ENCERRAMENTO'
    Color = clWindow
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    Visible = False
    AShadeRightBottom = clBlack
    AShadeLTSet = False
  end
  object LEncerramento: TmyLabel3d
    Left = 136
    Top = 521
    Width = 511
    Height = 28
    Caption = 'TECLE ENTER PARA O ENCERRAMENTO'
    Color = clWindow
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -24
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    Visible = False
    AShadeRightBottom = clBlack
    AShadeLTSet = False
  end
  object ERecebido: TCurrencyEdit
    Left = 509
    Top = 199
    Width = 269
    Height = 55
    AutoSize = False
    BorderStyle = bsNone
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -40
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    OnEnter = ERecebidoEnter
    OnExit = ERecebidoExit
    OnKeyPress = ERecebidoKeyPress
    OnKeyUp = ESubTotalKeyUp
  end
  object ETroco: TCurrencyEdit
    Left = 509
    Top = 327
    Width = 269
    Height = 55
    AutoSize = False
    BorderStyle = bsNone
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -40
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    OnKeyUp = ESubTotalKeyUp
  end
  object DBGrid1: TDBGrid
    Left = 9
    Top = 392
    Width = 165
    Height = 126
    BorderStyle = bsNone
    Color = clWhite
    Ctl3D = False
    DataSource = dsForma_Pgto
    FixedColor = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ATALHO'
        Width = 23
        Visible = True
      end>
  end
  object ERestante: TCurrencyEdit
    Left = 509
    Top = 263
    Width = 269
    Height = 55
    AutoSize = False
    BorderStyle = bsNone
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -40
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    OnKeyUp = ESubTotalKeyUp
  end
  object PMensagem: TPanel
    Left = 71
    Top = 236
    Width = 645
    Height = 64
    BevelInner = bvLowered
    BevelWidth = 3
    BorderStyle = bsSingle
    Caption = 'Finalizando'
    Color = clInfoBk
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 4
    Visible = False
  end
  object ESubTotal: TCurrencyEdit
    Left = 509
    Top = 75
    Width = 269
    Height = 55
    AutoSize = False
    BorderStyle = bsNone
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -40
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    OnKeyUp = ESubTotalKeyUp
  end
  object ETotalLiquido: TCurrencyEdit
    Left = 509
    Top = 138
    Width = 269
    Height = 55
    AutoSize = False
    BorderStyle = bsNone
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -40
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
    OnKeyUp = ESubTotalKeyUp
  end
  object DBGrid: TDBGrid
    Left = 486
    Top = 392
    Width = 290
    Height = 126
    BorderStyle = bsNone
    Color = clWhite
    Ctl3D = False
    DataSource = dsFormaPgto
    FixedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgTabs, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'DESCRI'#199#195'O'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TROCO'
        Width = 68
        Visible = True
      end>
  end
  object PRodape: TPanel
    Left = 0
    Top = 515
    Width = 792
    Height = 21
    Align = alBottom
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clWhite
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 8
    object myLabel3d11: TmyLabel3d
      Left = 5
      Top = 1
      Width = 147
      Height = 15
      Caption = 'F10 - Classifica o Cliente  /'
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      AShadeLTSet = False
    end
    object myLabel3d10: TmyLabel3d
      Left = 160
      Top = 1
      Width = 321
      Height = 15
      Caption = 'F11 - Descontos ou Acr'#233'scimos na totaliza'#231#227'o do cupom'
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      AShadeLTSet = False
    end
  end
  object Panel1: TPanel
    Left = 151
    Top = 390
    Width = 24
    Height = 129
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 9
  end
  object dsFormaPgto: TDataSource
    DataSet = TFormaPgto
    Left = 616
    Top = 441
  end
  object TFormaPgto: TClientDataSet
    Active = True
    Aggregates = <
      item
        Active = True
        GroupingLevel = 1
        IndexName = 'ID'
        Visible = False
      end>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'COD_PGTO'
        DataType = ftInteger
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'TROCO'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'ID'
        Fields = 'ID'
        GroupingLevel = 1
      end>
    IndexName = 'ID'
    Params = <>
    StoreDefs = True
    Left = 646
    Top = 441
    Data = {
      6B0000009619E0BD0100000018000000050000000000030000006B0002494404
      0001000000000008434F445F5047544F0400010000000000045449504F010049
      00000001000557494454480200020014000556414C4F52080004000000000005
      54524F434F08000400000000000000}
    object TFormaPgtoID: TIntegerField
      FieldName = 'ID'
    end
    object TFormaPgtoCOD_PGTO: TIntegerField
      FieldName = 'COD_PGTO'
    end
    object TFormaPgtoTIPO: TStringField
      FieldName = 'TIPO'
    end
    object TFormaPgtoVALOR: TFloatField
      DisplayWidth = 22
      FieldName = 'VALOR'
      DisplayFormat = '##,###0.00'
    end
    object TFormaPgtoTROCO: TFloatField
      FieldName = 'TROCO'
      DisplayFormat = '##,###0.00'
    end
    object TFormaPgtoTOTAL: TAggregateField
      FieldName = 'TOTAL'
      Active = True
      Expression = 'SUM(VALOR)'
    end
  end
  object dsForma_Pgto: TDataSource
    DataSet = DM.TForma_Pgto
    Left = 72
    Top = 248
  end
  object EasyTEFDiscado: TEasyTEFDiscado
    autoVerificarTEF = False
    autoAtivarGerenciador = False
    formMsgOperador.altura = 110
    formMsgOperador.largura = 400
    formMsgOperador.font.Charset = ANSI_CHARSET
    formMsgOperador.font.Color = clWindowText
    formMsgOperador.font.Height = -13
    formMsgOperador.font.Name = 'Bookman Old Style'
    formMsgOperador.font.Style = [fsBold]
    formMsgOperador.botaoOK.altura = 25
    formMsgOperador.botaoOK.largura = 75
    OnAbrirComprovanteNaoFiscalVinculado = EasyTEFDiscadoAbrirComprovanteNaoFiscalVinculado
    OnEfetuarFormaPagamento = EasyTEFDiscadoEfetuarFormaPagamento
    OnEncerrarCupomFiscal = EasyTEFDiscadoEncerrarCupomFiscal
    OnFecharComprovanteNaoFiscalVinculado = EasyTEFDiscadoFecharComprovanteNaoFiscalVinculado
    OnFecharRelatorioGerencial = EasyTEFDiscadoFecharRelatorioGerencial
    OnGerarIdentificador = EasyTEFDiscadoGerarIdentificador
    OnImpressoraTemPapel = EasyTEFDiscadoImpressoraTemPapel
    OnImprimirLeituraX = EasyTEFDiscadoImprimirLeituraX
    OnImprimirRelatorioGerencial = EasyTEFDiscadoImprimirRelatorioGerencial
    OnIniciarFechamentoCupomFiscal = EasyTEFDiscadoIniciarFechamentoCupomFiscal
    OnTerminarFechamentoCupom = EasyTEFDiscadoTerminarFechamentoCupom
    OnUsarComprovanteNaoFiscalVinculado = EasyTEFDiscadoUsarComprovanteNaoFiscalVinculado
    OnSubTotalizarCupom = EasyTEFDiscadoSubTotalizarCupom
    OnValorPersonalizadoReq = EasyTEFDiscadoValorPersonalizadoReq
    Left = 16
    Top = 24
  end
  object TFoco: TTimer
    Enabled = False
    Interval = 10
    OnTimer = TFocoTimer
    Left = 48
    Top = 24
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 78
    Top = 24
  end
end
