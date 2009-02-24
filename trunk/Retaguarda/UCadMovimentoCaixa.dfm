object CadMovimentoCaixaForm: TCadMovimentoCaixaForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Lan'#231'amentos de Caixa'
  ClientHeight = 471
  ClientWidth = 819
  Color = 8673536
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object AbaSuperior: TPageControl
    Left = 0
    Top = 0
    Width = 819
    Height = 471
    ActivePage = tsManutencao
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 749
    ExplicitHeight = 457
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      OnShow = tsConsultaShow
      ExplicitWidth = 741
      ExplicitHeight = 429
      object Panel1: TPanel
        Left = 0
        Top = 362
        Width = 811
        Height = 81
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 0
        object Label1: TLabel
          Left = 46
          Top = 8
          Width = 42
          Height = 13
          Caption = 'Campo:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 281
          Top = 8
          Width = 44
          Height = 13
          Caption = 'Crit'#233'rio:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 39
          Top = 49
          Width = 49
          Height = 13
          Caption = 'Per'#237'odo:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object BTPesquisar: THTMLButton
          Left = 681
          Top = 3
          Width = 121
          Height = 25
          Hint = 'BtnLimpar'
          Caption = 'Pesquisar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = BTPesquisarClick
          Alignment = haCenter
          Background = stNormal
          BorderColor = clGray
          Color = 11114608
          DownColor = 8673536
          Flat = True
          HoverColor = 8673536
          VAlignment = vaCenter
          Version = '1.4.5.1'
        end
        object CBPesquisar: TComboBox
          Left = 98
          Top = 4
          Width = 122
          Height = 23
          BevelKind = bkFlat
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ItemHeight = 15
          ItemIndex = 1
          ParentFont = False
          TabOrder = 1
          Text = 'Nome'
          OnChange = CBPesquisarChange
          Items.Strings = (
            'C'#243'digo'
            'Nome')
        end
        object EditPesquisar: TEdit
          Left = 338
          Top = 6
          Width = 310
          Height = 19
          AutoSize = False
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = EditPesquisarChange
        end
        object GroupBox1: TGroupBox
          Left = 273
          Top = 31
          Width = 375
          Height = 46
          TabOrder = 3
          Visible = False
          object Label4: TLabel
            Left = 35
            Top = 18
            Width = 20
            Height = 13
            Caption = 'De:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 207
            Top = 18
            Width = 23
            Height = 13
            Caption = 'At'#233':'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DatDe: TDateEdit
            Left = 66
            Top = 15
            Width = 120
            Height = 21
            DefaultToday = True
            NumGlyphs = 2
            TabOrder = 0
            Text = '22/02/2009'
          end
          object DatAte: TDateEdit
            Left = 241
            Top = 15
            Width = 120
            Height = 21
            DefaultToday = True
            NumGlyphs = 2
            TabOrder = 1
            Text = '22/02/2009'
          end
        end
        object CBPeriodo: TComboBox
          Left = 98
          Top = 44
          Width = 122
          Height = 23
          BevelKind = bkFlat
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ItemHeight = 15
          ItemIndex = 0
          ParentFont = False
          TabOrder = 4
          Text = 'Hoje'
          OnChange = CBPesquisarChange
          Items.Strings = (
            'Hoje'
            'Semana Passada'
            'M'#234's'
            'M'#234's Passado')
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 56
        Width = 973
        Height = 304
        Color = 13619151
        DataSource = BancoDeDados.DSqryCsMovimentoCaixa
        FixedColor = 8673536
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'idmovimento_caixa'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            Title.Caption = 'M. Caixa I.D'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'historico'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            Title.Caption = 'Hist'#243'rico'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'data_lancamento'
            Title.Caption = 'Data'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_nome_cliente'
            Title.Caption = 'Cliente'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'entrada'
            Title.Caption = 'Entrada'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'saida'
            Title.Caption = 'Sa'#237'da'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 100
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 296
        Height = 53
        BevelKind = bkFlat
        BevelOuter = bvNone
        Color = 8673536
        ParentBackground = False
        TabOrder = 2
        object BTInserir: THTMLButton
          Left = 1
          Top = 1
          Width = 94
          Height = 46
          Hint = 'BtnLimpar'
          Caption = 'Inserir'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = BTInserirClick
          Alignment = haCenter
          Background = stNormal
          BorderColor = clGray
          Color = 13619151
          DownColor = 8673536
          Flat = True
          HoverColor = 11114608
          VAlignment = vaCenter
          Version = '1.4.5.1'
        end
        object BTAlterar: THTMLButton
          Left = 97
          Top = 1
          Width = 96
          Height = 46
          Hint = 'BtnLimpar'
          Caption = 'Alterar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = BTAlterarClick
          Alignment = haCenter
          Background = stNormal
          BorderColor = clGray
          Color = 13619151
          DownColor = 8673536
          Flat = True
          HoverColor = 11114608
          VAlignment = vaCenter
          Version = '1.4.5.1'
        end
        object BTSair: THTMLButton
          Left = 195
          Top = 1
          Width = 96
          Height = 46
          Hint = 'BtnLimpar'
          Caption = 'Sair'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = BTSairClick
          Alignment = haCenter
          Background = stNormal
          BorderColor = clGray
          Color = 13619151
          DownColor = 8673536
          Flat = True
          HoverColor = 11114608
          VAlignment = vaCenter
          Version = '1.4.5.1'
        end
      end
      object CHApenasAtivos: TCheckBox
        Left = 320
        Top = 17
        Width = 121
        Height = 17
        Caption = 'Exibir Apenas Ativos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    object tsManutencao: TTabSheet
      Caption = 'Manuten'#231#227'o'
      ImageIndex = 1
      OnShow = tsManutencaoShow
      ExplicitLeft = 0
      ExplicitTop = 28
      object Shape2: TShape
        Left = 552
        Top = 88
        Width = 241
        Height = 122
        Brush.Color = 8673536
        Pen.Color = 11114608
        Shape = stRoundRect
      end
      object Shape1: TShape
        Left = 83
        Top = 159
        Width = 436
        Height = 122
        Brush.Color = 8673536
        Pen.Color = 11114608
        Shape = stRoundRect
      end
      object Label3: TLabel
        Left = 14
        Top = 97
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hist'#243'rico:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label28: TLabel
        Left = 322
        Top = 38
        Width = 71
        Height = 13
        Caption = 'Data Cadastro:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object BTCliente: TSpeedButton
        Left = 176
        Top = 122
        Width = 25
        Height = 24
        Caption = '...'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 211
        Top = 127
        Width = 308
        Height = 17
        DataField = 'calc_nome_cliente'
        DataSource = BancoDeDados.DSqryCadMovimentoCaixa
        Font.Charset = ANSI_CHARSET
        Font.Color = 5869567
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 23
        Top = 127
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cliente:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label22: TLabel
        Left = 100
        Top = 151
        Width = 33
        Height = 13
        Caption = 'Conta'
        Font.Charset = ANSI_CHARSET
        Font.Color = 5869567
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 156
        Top = 190
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Origem:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 153
        Top = 230
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Destino:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 568
        Top = 79
        Width = 41
        Height = 16
        Caption = 'Saldo'
        Font.Charset = ANSI_CHARSET
        Font.Color = 5869567
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEditSaldo: TDBText
        Left = 568
        Top = 126
        Width = 209
        Height = 46
        Alignment = taCenter
        DataField = 'calc_nome_cliente'
        DataSource = BancoDeDados.DSqryCadMovimentoCaixa
        Font.Charset = ANSI_CHARSET
        Font.Color = 5869567
        Font.Height = -37
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel4: TPanel
        Left = 83
        Top = 22
        Width = 166
        Height = 49
        Color = 8673536
        ParentBackground = False
        TabOrder = 1
        object Label5: TLabel
          Left = 10
          Top = 16
          Width = 53
          Height = 13
          Caption = 'M. Caixa:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText1: TDBText
          Left = 74
          Top = 13
          Width = 79
          Height = 17
          DataField = 'idgrupo'
          DataSource = BancoDeDados.DSqryCadMovimentoCaixa
          Font.Charset = ANSI_CHARSET
          Font.Color = clSilver
          Font.Height = -16
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object DBCheckBox2: TDBCheckBox
        Left = 257
        Top = 35
        Width = 65
        Height = 17
        TabStop = False
        Caption = 'Ativo'
        DataField = 'ativo'
        DataSource = BancoDeDados.DSqryCadMovimentoCaixa
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object DBEditNome: TDBEdit
        Left = 83
        Top = 92
        Width = 437
        Height = 24
        CharCase = ecUpperCase
        DataField = 'historico'
        DataSource = BancoDeDados.DSqryCadMovimentoCaixa
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 0
        Top = 389
        Width = 811
        Height = 54
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 3
        ExplicitTop = 375
        ExplicitWidth = 741
        object BTGravar: THTMLButton
          Left = 3
          Top = 5
          Width = 94
          Height = 46
          Hint = 'BtnLimpar'
          Caption = 'Gravar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = BTGravarClick
          Alignment = haCenter
          Background = stNormal
          BorderColor = clGray
          Color = 11114608
          DownColor = 8673536
          Flat = True
          HoverColor = 8673536
          VAlignment = vaCenter
          Version = '1.4.5.1'
        end
        object BTCancelar: THTMLButton
          Left = 100
          Top = 5
          Width = 94
          Height = 46
          Hint = 'BTCancelar'
          Caption = 'Cancelar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          TabStop = False
          OnClick = BTCancelarClick
          Alignment = haCenter
          Background = stNormal
          BorderColor = clGray
          Color = 11114608
          DownColor = 8673536
          Flat = True
          HoverColor = 8673536
          VAlignment = vaCenter
          Version = '1.4.5.1'
        end
        object BTExcluir: THTMLButton
          Left = 197
          Top = 5
          Width = 94
          Height = 46
          Hint = 'BTExcluir'
          Caption = 'Excluir'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          TabStop = False
          OnClick = BTExcluirClick
          Alignment = haCenter
          Background = stNormal
          BorderColor = clGray
          Color = 11114608
          DownColor = 8673536
          Flat = True
          HoverColor = 8673536
          VAlignment = vaCenter
          Version = '1.4.5.1'
        end
      end
      object DBDateEdit1: TDBDateEdit
        Left = 399
        Top = 35
        Width = 121
        Height = 24
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'data_cadastro'
        DataSource = BancoDeDados.DSqryCadMovimentoCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 4
      end
      object DBEditCliente: TDBEdit
        Left = 83
        Top = 122
        Width = 92
        Height = 24
        CharCase = ecUpperCase
        DataField = 'idcliente'
        DataSource = BancoDeDados.DSqryCadMovimentoCaixa
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object DLBContaOrigem: TDBLookupComboBox
        Left = 216
        Top = 186
        Width = 236
        Height = 24
        DataField = 'idconta_origem'
        DataSource = BancoDeDados.DSqryCadMovimentoCaixa
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        KeyField = 'idconta_contabil'
        ListField = 'descricao'
        ListSource = BancoDeDados.DSqryCsContaContabil
        ParentFont = False
        TabOrder = 6
      end
      object DBLContaDestino: TDBLookupComboBox
        Left = 216
        Top = 226
        Width = 236
        Height = 24
        DataField = 'idconta_destino'
        DataSource = BancoDeDados.DSqryCadMovimentoCaixa
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        KeyField = 'idconta_contabil'
        ListField = 'descricao'
        ListSource = BancoDeDados.DSqryCsContaContabil
        ParentFont = False
        TabOrder = 7
      end
      object GroupBox2: TGroupBox
        Left = 83
        Top = 285
        Width = 436
        Height = 89
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5869567
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        object Label11: TLabel
          Left = 71
          Top = 30
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = 'Entrada:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 79
          Top = 60
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Sa'#237'da:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit1: TDBEdit
          Left = 133
          Top = 25
          Width = 177
          Height = 24
          CharCase = ecUpperCase
          DataField = 'entrada'
          DataSource = BancoDeDados.DSqryCadMovimentoCaixa
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 133
          Top = 55
          Width = 177
          Height = 24
          CharCase = ecUpperCase
          DataField = 'saida'
          DataSource = BancoDeDados.DSqryCadMovimentoCaixa
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 552
        Top = 216
        Width = 241
        Height = 158
        TabOrder = 9
        object Label14: TLabel
          Left = 44
          Top = 121
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Observa'#231#227'o:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 111
          Top = 116
          Width = 25
          Height = 24
          Caption = '...'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindow
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBCheckBox1: TDBCheckBox
          Left = 40
          Top = 16
          Width = 57
          Height = 17
          Caption = 'Fixo'
          DataField = 'fixo'
          DataSource = BancoDeDados.DSqryCadMovimentoCaixa
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox3: TDBCheckBox
          Left = 40
          Top = 39
          Width = 105
          Height = 17
          Caption = 'Cancelado'
          DataField = 'cancelado'
          DataSource = BancoDeDados.DSqryCadMovimentoCaixa
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object GroupBox4: TGroupBox
          Left = 40
          Top = 62
          Width = 185
          Height = 48
          Caption = 'Tipo do Lan'#231'amento'
          Font.Charset = ANSI_CHARSET
          Font.Color = 5869567
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object DBText4: TDBText
            Left = 19
            Top = 20
            Width = 151
            Height = 17
            Alignment = taCenter
            DataField = 'calc_nome_tipo'
            DataSource = BancoDeDados.DSqryCadMovimentoCaixa
            Font.Charset = ANSI_CHARSET
            Font.Color = 12114019
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
  end
end
