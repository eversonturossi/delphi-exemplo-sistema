object FrenteCaixaF: TFrenteCaixaF
  Left = 80
  Top = 130
  Width = 640
  Height = 480
  Caption = 'Exemplo TEF Discado - Tela de Frente de Caixa'
  Color = clBtnFace
  Constraints.MinHeight = 480
  Constraints.MinWidth = 640
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 14
  object pnlBotoes: TPanel
    Left = 0
    Top = 405
    Width = 632
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnFechar: TBitBtn
      Left = 549
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 4
      Kind = bkClose
    end
    object btnNovo: TBitBtn
      Left = 7
      Top = 8
      Width = 121
      Height = 25
      Caption = 'Nova Venda [F4]'
      TabOrder = 0
      OnClick = btnNovoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
    end
    object btnCancelarItem: TBitBtn
      Left = 128
      Top = 8
      Width = 136
      Height = 25
      Caption = 'Cancelar Item [F5]'
      Enabled = False
      TabOrder = 1
      OnClick = btnCancelarItemClick
      Kind = bkCancel
    end
    object btnCancelarVenda: TBitBtn
      Left = 264
      Top = 8
      Width = 143
      Height = 25
      Cancel = True
      Caption = 'Cancelar Venda [F6]'
      Enabled = False
      ModalResult = 2
      TabOrder = 2
      OnClick = btnCancelarVendaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
    end
    object btnEncerrarVenda: TBitBtn
      Left = 407
      Top = 8
      Width = 142
      Height = 25
      Caption = 'Encerrar Venda [F7]'
      Enabled = False
      ModalResult = 6
      TabOrder = 3
      OnClick = btnEncerrarVendaClick
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
  end
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 405
    Align = alClient
    BorderWidth = 4
    TabOrder = 0
    object mmoCupomFiscal: TMemo
      Left = 264
      Top = 5
      Width = 363
      Height = 395
      TabStop = False
      Align = alRight
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object grbItem: TGroupBox
      Left = 5
      Top = 5
      Width = 251
      Height = 364
      TabOrder = 0
      object Label1: TLabel
        Left = 11
        Top = 20
        Width = 107
        Height = 14
        Alignment = taRightJustify
        Caption = 'C'#243'digo do Produto:'
      end
      object Label2: TLabel
        Left = 63
        Top = 44
        Width = 55
        Height = 14
        Alignment = taRightJustify
        Caption = 'Descri'#231#227'o:'
      end
      object Label3: TLabel
        Left = 70
        Top = 69
        Width = 48
        Height = 14
        Alignment = taRightJustify
        Caption = 'Al'#237'quota:'
      end
      object Label4: TLabel
        Left = 8
        Top = 96
        Width = 4
        Height = 14
      end
      object edtCodigo: TEdit
        Left = 121
        Top = 16
        Width = 121
        Height = 22
        MaxLength = 13
        TabOrder = 0
        Text = '0123456789'
      end
      object edtDescricao: TEdit
        Left = 121
        Top = 40
        Width = 121
        Height = 22
        MaxLength = 16
        TabOrder = 1
        Text = 'Produto de Teste'
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 96
        Width = 105
        Height = 105
        Caption = 'Quantidade'
        TabOrder = 3
        object Label5: TLabel
          Left = 8
          Top = 76
          Width = 32
          Height = 14
          Caption = 'Qtde:'
        end
        object rbtInteira: TRadioButton
          Left = 8
          Top = 24
          Width = 65
          Height = 17
          Caption = 'Inteira'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object rbtFracionaria: TRadioButton
          Left = 8
          Top = 48
          Width = 89
          Height = 17
          Caption = 'Fracion'#225'ria'
          TabOrder = 1
        end
        object edtQtd: TEdit
          Left = 48
          Top = 72
          Width = 41
          Height = 22
          TabOrder = 2
          Text = '1'
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 208
        Width = 234
        Height = 113
        Caption = 'Valor Unit'#225'rio'
        TabOrder = 5
        object Label6: TLabel
          Left = 8
          Top = 78
          Width = 31
          Height = 14
          Caption = 'Valor:'
        end
        object rbt2Casas: TRadioButton
          Left = 8
          Top = 24
          Width = 121
          Height = 17
          Caption = '2 Casas Decimais'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object rbt3Casas: TRadioButton
          Left = 8
          Top = 48
          Width = 121
          Height = 17
          Caption = '3 casa decimais'
          TabOrder = 1
        end
        object edtValorUnit: TEdit
          Left = 48
          Top = 72
          Width = 73
          Height = 22
          TabOrder = 2
          Text = '23,67'
        end
      end
      object GroupBox4: TGroupBox
        Left = 121
        Top = 96
        Width = 121
        Height = 105
        Caption = 'Desconto'
        TabOrder = 4
        object Label7: TLabel
          Left = 8
          Top = 76
          Width = 31
          Height = 14
          Caption = 'Valor:'
        end
        object rbtPercentual: TRadioButton
          Left = 8
          Top = 24
          Width = 105
          Height = 17
          Caption = 'Por Percentual'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object rbtValor: TRadioButton
          Left = 8
          Top = 48
          Width = 105
          Height = 17
          Caption = 'Por Valor'
          TabOrder = 1
        end
        object edtValorDesc: TEdit
          Left = 48
          Top = 72
          Width = 57
          Height = 22
          TabOrder = 2
          Text = '0'
        end
      end
      object edtAliquota: TEdit
        Left = 121
        Top = 65
        Width = 41
        Height = 22
        TabOrder = 2
        Text = 'II'
      end
      object btnAdicionarItem: TButton
        Left = 8
        Top = 328
        Width = 177
        Height = 25
        Caption = 'Adicionar Item ao Cupom [F3]'
        Enabled = False
        TabOrder = 6
        OnClick = btnAdicionarItemClick
      end
    end
    object btnAdm: TButton
      Left = 8
      Top = 374
      Width = 121
      Height = 25
      Caption = '&Administra'#231#227'o TEF'
      TabOrder = 2
      OnClick = btnAdmClick
    end
  end
  object EasyTEF: TEasyTEFDiscado
    formMsgOperador.altura = 110
    formMsgOperador.largura = 400
    formMsgOperador.font.Charset = ANSI_CHARSET
    formMsgOperador.font.Color = clWindowText
    formMsgOperador.font.Height = -12
    formMsgOperador.font.Name = 'Tahoma'
    formMsgOperador.font.Style = []
    formMsgOperador.botaoOK.altura = 25
    formMsgOperador.botaoOK.largura = 75
    OnAbrirComprovanteNaoFiscalVinculado = EasyTEFAbrirComprovanteNaoFiscalVinculado
    OnEfetuarFormaPagamento = EasyTEFEfetuarFormaPagamento
    OnEncerrarCupomFiscal = EasyTEFEncerrarCupomFiscal
    OnFecharComprovanteNaoFiscalVinculado = EasyTEFFecharComprovanteNaoFiscalVinculado
    OnFecharRelatorioGerencial = EasyTEFFecharRelatorioGerencial
    OnGerarIdentificador = EasyTEFGerarIdentificador
    OnImpressoraTemPapel = EasyTEFImpressoraTemPapel
    OnImprimirLeituraX = EasyTEFImprimirLeituraX
    OnImprimirRelatorioGerencial = EasyTEFImprimirRelatorioGerencial
    OnIniciarFechamentoCupomFiscal = EasyTEFIniciarFechamentoCupomFiscal
    OnTerminarFechamentoCupom = EasyTEFTerminarFechamentoCupom
    OnTerminarCancelamentoMultiplosCartoes = EasyTEFTerminarCancelamentoMultiplosCartoes
    OnUsarComprovanteNaoFiscalVinculado = EasyTEFUsarComprovanteNaoFiscalVinculado
    OnSubTotalizarCupom = EasyTEFSubTotalizarCupom
    OnValorPersonalizadoReq = EasyTEFValorPersonalizadoReq
    Left = 584
    Top = 16
  end
end
