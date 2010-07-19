object PrincipalForm: TPrincipalForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'PrincipalForm'
  ClientHeight = 659
  ClientWidth = 991
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenuPrincipal
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PAtalhos: TPanel
    Left = 0
    Top = 0
    Width = 991
    Height = 80
    Align = alTop
    TabOrder = 1
    object BTFechar: TSpeedButton
      Left = 270
      Top = 2
      Width = 130
      Height = 75
      Hint = 'Fechar'
      Caption = 'Fechar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      OnClick = BTFecharClick
    end
    object Bevel1: TBevel
      Left = 265
      Top = 2
      Width = 2
      Height = 75
      Shape = bsRightLine
      Style = bsRaised
    end
    object BTControleMesa: TSpeedButton
      Left = 1
      Top = 2
      Width = 130
      Height = 75
      Hint = 'Controle de Mesas (F2)'
      Caption = 'Mesas (F2)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      OnClick = BTControleMesaClick
    end
    object BTVenda: TSpeedButton
      Left = 133
      Top = 2
      Width = 130
      Height = 75
      Hint = 'Venda (F3)'
      Caption = 'Venda (F3)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      OnClick = BTVendaClick
    end
  end
  object SBPrincipal: TStatusBar
    Left = 0
    Top = 640
    Width = 991
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 150
      end
      item
        Width = 250
      end
      item
        Width = 400
      end>
  end
  object NBPrincipal: TNotebook
    Left = 0
    Top = 80
    Width = 991
    Height = 560
    Align = alClient
    TabOrder = 2
    OnPageChanged = NBPrincipalPageChanged
    object TPage
      Left = 0
      Top = 0
      Caption = 'Mesas'
      object Panel1: TPanel
        Left = 792
        Top = 0
        Width = 199
        Height = 560
        Align = alRight
        BorderStyle = bsSingle
        TabOrder = 0
        object BTCadastrarItensComanda: TSpeedButton
          Left = 8
          Top = 51
          Width = 179
          Height = 45
          Hint = 'Itens cadastrados na Comanda (F6)'
          Caption = 'Cadastrar Itens (F6)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = BTCadastrarItensComandaClick
        end
        object BTAbrirComanda: TSpeedButton
          Left = 8
          Top = 3
          Width = 179
          Height = 45
          Hint = 'Abrir Comanda de mesa (F5)'
          Caption = 'Abrir Comanda (F5)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = BTAbrirComandaClick
        end
        object BTEncerrarComanda: TSpeedButton
          Left = 8
          Top = 148
          Width = 179
          Height = 45
          Hint = 'Encerrar Comanda F8)'
          Caption = 'Encerrar Comanda (F8)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = BTEncerrarComandaClick
        end
        object BTComandaEmAberto: TSpeedButton
          Left = 8
          Top = 294
          Width = 179
          Height = 45
          Hint = 'Comandas em Aberto (F11)'
          Caption = 'Comandas em Aberto (F11)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
          OnClick = BTComandaEmAbertoClick
        end
        object BTImprimeComanda: TSpeedButton
          Left = 8
          Top = 100
          Width = 179
          Height = 45
          Hint = 'Imprimir Comanda (F7)'
          Caption = 'Imprimir Comanda (F7)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = BTImprimeComandaClick
        end
        object BTCancelaComanda: TSpeedButton
          Left = 8
          Top = 197
          Width = 179
          Height = 45
          Hint = 'Cancelar Comanda (Ctrl + L)'
          Caption = 'Cancelar Comanda (Ctrl + L)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = BTCancelaComandaClick
        end
        object BTFecharConta: TSpeedButton
          Left = 8
          Top = 246
          Width = 179
          Height = 45
          Hint = 'Fechar Conta (F11)'
          Caption = 'Fechar Conta (F11)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = BTFecharContaClick
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 792
        Height = 560
        Align = alClient
        DataSource = BancoDados.DSRestauranteMesa
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMERO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Caption = 'N'#186' Mesa'
            Width = 50
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'STATUS'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'c_mesa_garcon_nome'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Caption = 'Gar'#231'on'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_total_mesa'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Caption = 'Total (R$)'
            Visible = True
          end>
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Itens'
      object Panel2: TPanel
        Left = 0
        Top = 480
        Width = 991
        Height = 80
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object BTEncerrarComanda1: TSpeedButton
          Left = 34
          Top = 1
          Width = 130
          Height = 75
          Hint = 'Concluir movimento da Comanda (F8)'
          Caption = 'Encerrar (F8)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          OnClick = BTEncerrarComanda1Click
        end
        object BTImprimir1: TSpeedButton
          Left = 167
          Top = 1
          Width = 130
          Height = 75
          Hint = 'Imprimir Comanda (F7)'
          Caption = 'Imprimir (F7)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          OnClick = BTImprimir1Click
        end
        object BTExcluirItem: TSpeedButton
          Left = 300
          Top = 1
          Width = 130
          Height = 75
          Hint = 'Excluir Item (F10)'
          Caption = 'Excluir Item (F10)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Layout = blGlyphTop
          ParentFont = False
          OnClick = BTExcluirItemClick
        end
        object Label4: TLabel
          Left = 759
          Top = 4
          Width = 28
          Height = 13
          Caption = 'Total:'
        end
        object LBTotal: TLabel
          Left = 759
          Top = 16
          Width = 170
          Height = 37
          AutoSize = False
          Caption = 'R$ 0,00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -37
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 142
        Width = 991
        Height = 338
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object DBGrid2: TDBGrid
          Left = 33
          Top = 0
          Width = 896
          Height = 338
          Align = alLeft
          DataSource = BancoDados.DSCDSItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnTitleClick = DBGrid2TitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'PRODUTO_ID'
              Title.Caption = 'Produto I.D'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 350
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UND'
              Title.Caption = 'Unidade'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECO'
              Title.Caption = 'Pre'#231'o (R$)'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QUANTIDADE'
              Title.Caption = 'Quantidade'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL'
              Title.Caption = 'Total (R$)'
              Width = 100
              Visible = True
            end>
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 33
          Height = 338
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 991
        Height = 142
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Label7: TLabel
          Left = 34
          Top = 16
          Width = 73
          Height = 20
          Caption = 'Comanda:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LBComanda: TLabel
          Left = 113
          Top = 15
          Width = 111
          Height = 24
          AutoSize = False
          Caption = '0000000000'
          Font.Charset = ANSI_CHARSET
          Font.Color = 6590965
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 352
          Top = 16
          Width = 43
          Height = 20
          Caption = 'Mesa:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LBMesa: TLabel
          Left = 401
          Top = 15
          Width = 37
          Height = 24
          AutoSize = False
          Caption = '000'
          Font.Charset = ANSI_CHARSET
          Font.Color = 6590965
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 581
          Top = 16
          Width = 57
          Height = 20
          Caption = 'Gar'#231'on:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LBGarcon: TLabel
          Left = 644
          Top = 15
          Width = 69
          Height = 24
          Caption = 'Gar'#231'on'
          Font.Charset = ANSI_CHARSET
          Font.Color = 6590965
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 34
          Top = 59
          Width = 148
          Height = 29
          Caption = 'C'#243'digo (F4):'
          Font.Charset = ANSI_CHARSET
          Font.Color = 6590965
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 194
          Top = 59
          Width = 125
          Height = 29
          Caption = 'Descri'#231#227'o:'
          Font.Charset = ANSI_CHARSET
          Font.Color = 6590965
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape2: TShape
          Left = 34
          Top = 91
          Width = 154
          Height = 47
          Pen.Color = 11114608
          Shape = stRoundRect
        end
        object Shape1: TShape
          Left = 194
          Top = 91
          Width = 559
          Height = 47
          Pen.Color = 11114608
          Shape = stRoundRect
        end
        object Shape3: TShape
          Left = 759
          Top = 91
          Width = 170
          Height = 47
          Pen.Color = 11114608
          Shape = stRoundRect
        end
        object Label3: TLabel
          Left = 759
          Top = 59
          Width = 143
          Height = 29
          Caption = 'Quantidade:'
          Font.Charset = ANSI_CHARSET
          Font.Color = 6590965
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EditCodigo: TEdit
          Left = 40
          Top = 98
          Width = 144
          Height = 32
          Hint = 'C'#243'digo do Produto (F4)'
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -29
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnExit = EditCodigoExit
          OnKeyPress = EditCodigoKeyPress
        end
        object EditDescricao: TEdit
          Left = 201
          Top = 98
          Width = 545
          Height = 32
          Hint = 'Descri'#231#227'o do Produto'
          TabStop = False
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -29
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object EditQtd: TJvValidateEdit
          Left = 768
          Top = 98
          Width = 153
          Height = 32
          Hint = 'Quantidade do Item'
          AutoSize = False
          BorderStyle = bsNone
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          DisplayFormat = dfFloat
          DecimalPlaces = 4
          EditText = '1'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -29
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnKeyPress = EditQtdKeyPress
        end
      end
    end
  end
  object MainMenuPrincipal: TMainMenu
    Images = ImageListPrincipal
    Left = 456
    Top = 32
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object rocarUsurio1: TMenuItem
        Action = ATrocarUsuario
      end
      object SomenteMesasemuso1: TMenuItem
        AutoCheck = True
        Caption = 'Somente Mesas em uso'
        OnClick = SomenteMesasemuso1Click
      end
      object CadastrarGaronsMesa1: TMenuItem
        Caption = 'Cadastrar Gar'#231'ons/Mesa'
        OnClick = CadastrarGaronsMesa1Click
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
        ImageIndex = 1
        ShortCut = 27
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object VendasporPerodo1: TMenuItem
        Caption = 'Vendas por Per'#237'odo'
        OnClick = VendasporPerodo1Click
      end
    end
    object Ajuda1: TMenuItem
      Action = AAjuda
    end
  end
  object ActionListPrincipal: TActionList
    Left = 496
    Top = 32
    object ATrocarUsuario: TAction
      Category = 'Arquivo'
      Caption = 'Trocar Usu'#225'rio'
      ImageIndex = 0
      OnExecute = ATrocarUsuarioExecute
    end
    object Action1: TAction
      Category = 'Arquivo'
      Caption = 'Action1'
      ShortCut = 113
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Category = 'Arquivo'
      Caption = 'Action2'
      ShortCut = 114
      OnExecute = Action2Execute
    end
    object Action3: TAction
      Category = 'Arquivo'
      Caption = 'Action3'
      ShortCut = 116
      OnExecute = Action3Execute
    end
    object Action4: TAction
      Category = 'Arquivo'
      Caption = 'Action4'
      ShortCut = 117
      OnExecute = Action4Execute
    end
    object Action5: TAction
      Category = 'Arquivo'
      Caption = 'Action5'
      ShortCut = 118
      OnExecute = Action5Execute
    end
    object Action6: TAction
      Category = 'Arquivo'
      Caption = 'Action6'
      ShortCut = 119
      OnExecute = Action6Execute
    end
    object Action7: TAction
      Category = 'Arquivo'
      Caption = 'Action7'
      ShortCut = 16460
      OnExecute = Action7Execute
    end
    object Action8: TAction
      Category = 'Arquivo'
      Caption = 'Action8'
      ShortCut = 121
      OnExecute = Action8Execute
    end
    object Action9: TAction
      Category = 'Arquivo'
      Caption = 'Action9'
      ShortCut = 115
      OnExecute = Action9Execute
    end
    object AAjuda: TAction
      Category = 'Arquivo'
      Caption = 'Ajuda'
      ShortCut = 112
      OnExecute = AAjudaExecute
    end
    object Action10: TAction
      Category = 'Arquivo'
      Caption = 'Action10'
      OnExecute = Action10Execute
    end
    object Action11: TAction
      Category = 'Arquivo'
      Caption = 'Action11'
      ShortCut = 122
      OnExecute = Action11Execute
    end
  end
  object TimerPrincipal: TTimer
    Interval = 1
    OnTimer = TimerPrincipalTimer
    Left = 536
    Top = 32
  end
  object ImageListPrincipal: TImageList
    Left = 576
    Top = 32
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063636300636363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      6300636363005A525A0094949400949494007B737B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDB5BD00BDB5
      BD00ADADAD005A525A00ADADAD00949494007B737B0000000000000000000000
      0000000000000000000094949400BDB5BD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400949494005A525A0094949400949494007B737B0000000000000000000000
      0000000000005A525A0000D6DE00183939000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094949400ADAD
      AD00949494005A525A00ADADAD00949494007B737B0000000000000000000000
      000039949C0000D6DE0039737B00001818000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400949494007B737B00CECECE00949494007B737B000000000000000000185A
      5A0000B5BD0039737B0000393900BDB5BD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094949400ADAD
      AD00949494007B737B00CECECE00949494007B737B000000000039B5BD0000F7
      FF0039737B0000393900BDB5BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDB5BD00CECE
      CE0094949400CECECE00ADA5AD005A525A001818180039737B0000F7FF003973
      7B0000393900BDB5BD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDB5BD00BDB5
      BD00CECECE004A4A4A0039737B0039B5BD0039B5BD0018D6DE0039737B000039
      3900BDB5BD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDB5BD00CECECE00BDB5
      BD005A525A0018D6DE0000F7FF0029E7EF0029E7EF005AD6DE0029A5AD007B73
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDB5BD00CECECE00DED6DE00BDB5
      BD0018949C0000F7FF0000B5BD0000737B0029A5AD005AD6DE0029A5AD007B73
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDB5BD00BDBDBD00DED6DE004A4A
      4A0039B5BD0000F7FF0039B5BD0000737B0000737B0029A5AD0029A5AD007B73
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDB5BD00BDBDBD0063636300ADA5
      AD0039B5BD0000737B00ADA5AD005A525A0000B5BD005AD6DE00003939000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CECECE00949494003939
      39004A4A4A0039737B001818180039737B0000D6DE00296B6B00BDB5BD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDB5BD005A52
      5A00949494007B737B00949494009494940039525A00BDB5BD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B73
      7B00BDB5BD000000000039393900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FCFFFFFF00000000E07FFFFF00000000
      C07CFFFF00000000E078E7FF00000000C070C38F00000000E060F10700000000
      C041F81F00000000C003FC7F00000000C007F83F00000000800FF11F00000000
      000FF30F00000000000FF38F00000000001FFBFF00000000801FFFFF00000000
      C03FFFFF00000000E5FFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object ApplicationEvents: TApplicationEvents
    OnHint = ApplicationEventsHint
    Left = 617
    Top = 32
  end
end
