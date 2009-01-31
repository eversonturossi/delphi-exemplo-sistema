object CadProdutoForm: TCadProdutoForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Produtos'
  ClientHeight = 626
  ClientWidth = 960
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
  PixelsPerInch = 96
  TextHeight = 13
  object AbaSuperior: TPageControl
    Left = 0
    Top = 0
    Width = 960
    Height = 626
    ActivePage = tsManutencao
    Align = alClient
    TabOrder = 0
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      OnShow = tsConsultaShow
      object Panel1: TPanel
        Left = 0
        Top = 564
        Width = 952
        Height = 34
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 0
        object Label1: TLabel
          Left = 32
          Top = 9
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
        object Label2: TLabel
          Left = 307
          Top = 10
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
        object BTPesquisar: THTMLButton
          Left = 819
          Top = 5
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
          Left = 84
          Top = 5
          Width = 189
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
          Text = 'Descri'#231#227'o'
          OnChange = CBPesquisarChange
          Items.Strings = (
            'C'#243'digo'
            'Descri'#231#227'o'
            'Descri'#231#227'o Reduzida'
            'Referencia')
        end
        object EditPesquisar: TEdit
          Left = 359
          Top = 6
          Width = 418
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
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 56
        Width = 951
        Height = 504
        Color = 13619151
        DataSource = BancoDeDados.DSqryCsProduto
        FixedColor = 8673536
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
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
            FieldName = 'idproduto'
            Title.Caption = 'Produto I.D'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'referencia'
            Title.Caption = 'Referencia'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 280
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao_reduzida'
            Title.Caption = 'Descri'#231#227'o Reduzida'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'data_cadastro'
            Title.Caption = 'Data Cadastro'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'saldo_minimo'
            Title.Caption = 'Saldo M'#237'nimo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_saldo_atual'
            Title.Caption = 'Saldo Atual'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 90
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
      object Label28: TLabel
        Left = 496
        Top = 23
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
      object Panel4: TPanel
        Left = 144
        Top = 6
        Width = 200
        Height = 49
        Color = 8673536
        ParentBackground = False
        TabOrder = 0
        object Label5: TLabel
          Left = 16
          Top = 15
          Width = 48
          Height = 13
          Caption = 'Produto:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText1: TDBText
          Left = 74
          Top = 12
          Width = 112
          Height = 17
          DataField = 'idproduto'
          DataSource = BancoDeDados.DSqryCadProduto
          Font.Charset = ANSI_CHARSET
          Font.Color = clSilver
          Font.Height = -16
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object DBCheckBox2: TDBCheckBox
        Left = 384
        Top = 22
        Width = 65
        Height = 17
        TabStop = False
        Caption = 'Ativo'
        DataField = 'ativo'
        DataSource = BancoDeDados.DSqryCadProduto
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object Panel3: TPanel
        Left = 0
        Top = 543
        Width = 952
        Height = 55
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 2
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
      object tsPrincipal: TTabSet
        Left = 0
        Top = 522
        Width = 952
        Height = 21
        Align = alBottom
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Tabs.Strings = (
          'Principal'
          'Impostos/Encargos'
          'Fornecedores/Localiza'#231#227'o')
        TabIndex = 0
        OnClick = tsPrincipalClick
      end
      object NBManutencao: TNotebook
        Left = 2
        Top = 61
        Width = 947
        Height = 458
        TabOrder = 4
        object TPage
          Left = 0
          Top = 0
          Caption = 'Principal'
          object Label3: TLabel
            Left = 67
            Top = 31
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descri'#231#227'o:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label4: TLabel
            Left = 26
            Top = 119
            Width = 92
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grupo de Produtos:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label7: TLabel
            Left = 10
            Top = 149
            Width = 108
            Height = 13
            Alignment = taRightJustify
            Caption = 'SubGrupo de Produtos'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label10: TLabel
            Left = 19
            Top = 89
            Width = 99
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descri'#231#227'o Reduzida:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label16: TLabel
            Left = 53
            Top = 179
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Classifica'#231#227'o:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label18: TLabel
            Left = 36
            Top = 209
            Width = 82
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unidade Compra:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object BTGrupo: TSpeedButton
            Left = 235
            Top = 114
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
            OnClick = BTGrupoClick
          end
          object BTSubGrupo: TSpeedButton
            Left = 235
            Top = 144
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
            OnClick = BTSubGrupoClick
          end
          object BTClassificacao: TSpeedButton
            Left = 235
            Top = 174
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
            OnClick = BTClassificacaoClick
          end
          object Label20: TLabel
            Left = 63
            Top = 268
            Width = 55
            Height = 13
            Caption = 'Peso Bruto:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label21: TLabel
            Left = 52
            Top = 298
            Width = 66
            Height = 13
            Caption = 'Peso L'#237'quido:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBText2: TDBText
            Left = 288
            Top = 119
            Width = 257
            Height = 17
            DataField = 'calc_nome_grupo'
            DataSource = BancoDeDados.DSqryCadProduto
            Font.Charset = ANSI_CHARSET
            Font.Color = 5869567
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText3: TDBText
            Left = 288
            Top = 149
            Width = 257
            Height = 17
            DataField = 'calc_nome_subgrupo'
            DataSource = BancoDeDados.DSqryCadProduto
            Font.Charset = ANSI_CHARSET
            Font.Color = 5869567
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText4: TDBText
            Left = 288
            Top = 179
            Width = 257
            Height = 17
            DataField = 'calc_nome_classificacao'
            DataSource = BancoDeDados.DSqryCadProduto
            Font.Charset = ANSI_CHARSET
            Font.Color = 5869567
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object BTUnidadecompra: TSpeedButton
            Left = 235
            Top = 204
            Width = 25
            Height = 24
            Caption = '...'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = BTUnidadecompraClick
          end
          object BTUnidadeVenda: TSpeedButton
            Left = 235
            Top = 233
            Width = 25
            Height = 24
            Caption = '...'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = BTUnidadeVendaClick
          end
          object Label8: TLabel
            Left = 41
            Top = 238
            Width = 77
            Height = 13
            Caption = 'Unidade Venda:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 63
            Top = 60
            Width = 55
            Height = 13
            Caption = 'Referencia:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Shape1: TShape
            Left = 554
            Top = 27
            Width = 388
            Height = 88
            Brush.Color = 8673536
            Pen.Color = 11114608
            Shape = stRoundRect
          end
          object Label22: TLabel
            Left = 567
            Top = 20
            Width = 33
            Height = 13
            Caption = 'Pre'#231'o'
            Font.Charset = ANSI_CHARSET
            Font.Color = 5869567
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object BTPrecoAtacado: TSpeedButton
            Left = 718
            Top = 58
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
            OnClick = BTPrecoAtacadoClick
          end
          object Label23: TLabel
            Left = 574
            Top = 63
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Atacado:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object BTPrecoVarejo: TSpeedButton
            Left = 902
            Top = 58
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
            OnClick = BTPrecoVarejoClick
          end
          object Label30: TLabel
            Left = 770
            Top = 63
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Varejo:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBEditNome: TDBEdit
            Left = 141
            Top = 26
            Width = 391
            Height = 24
            CharCase = ecUpperCase
            DataField = 'descricao'
            DataSource = BancoDeDados.DSqryCadProduto
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEditGrupo: TDBEdit
            Left = 141
            Top = 114
            Width = 92
            Height = 24
            DataField = 'idgrupo'
            DataSource = BancoDeDados.DSqryCadProduto
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnDblClick = DBEditGrupoDblClick
            OnExit = DBEditGrupoExit
          end
          object DBEditSubGrupo: TDBEdit
            Left = 141
            Top = 144
            Width = 92
            Height = 24
            DataField = 'idsubgrupo'
            DataSource = BancoDeDados.DSqryCadProduto
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnDblClick = DBEditSubGrupoDblClick
            OnExit = DBEditSubGrupoExit
          end
          object DBEdit6: TDBEdit
            Left = 141
            Top = 84
            Width = 217
            Height = 24
            DataField = 'descricao_reduzida'
            DataSource = BancoDeDados.DSqryCadProduto
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBEditClassificacao: TDBEdit
            Left = 141
            Top = 174
            Width = 92
            Height = 24
            DataField = 'idclassificacao'
            DataSource = BancoDeDados.DSqryCadProduto
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnDblClick = DBEditClassificacaoDblClick
            OnExit = DBEditClassificacaoExit
          end
          object DBEditUnidadecompra: TDBEdit
            Left = 141
            Top = 204
            Width = 92
            Height = 24
            DataField = 'unidade_compra'
            DataSource = BancoDeDados.DSqryCadProduto
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            OnDblClick = DBEditUnidadecompraDblClick
            OnExit = DBEditUnidadecompraExit
          end
          object DBEdit15: TDBEdit
            Left = 141
            Top = 263
            Width = 92
            Height = 24
            DataField = 'peso_bruto'
            DataSource = BancoDeDados.DSqryCadProduto
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object DBEdit16: TDBEdit
            Left = 141
            Top = 293
            Width = 92
            Height = 24
            DataField = 'peso_liquido'
            DataSource = BancoDeDados.DSqryCadProduto
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
          end
          object DBEditUnidadeVenda: TDBEdit
            Left = 141
            Top = 233
            Width = 92
            Height = 24
            DataField = 'unidade_venda'
            DataSource = BancoDeDados.DSqryCadProduto
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            OnDblClick = DBEditUnidadeVendaDblClick
            OnExit = DBEditUnidadeVendaExit
          end
          object DBEdit1: TDBEdit
            Left = 141
            Top = 55
            Width = 217
            Height = 24
            DataField = 'referencia'
            DataSource = BancoDeDados.DSqryCadProduto
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object EditPrecoAtacado: TCurrencyEdit
            Left = 636
            Top = 58
            Width = 80
            Height = 24
            Margins.Left = 1
            Margins.Top = 1
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
          end
          object EditPrecoVarejo: TCurrencyEdit
            Left = 820
            Top = 58
            Width = 80
            Height = 24
            Margins.Left = 4
            Margins.Top = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'Encargos'
          object GroupBox1: TGroupBox
            Left = 62
            Top = 16
            Width = 355
            Height = 393
            Caption = 'Impostos'
            Font.Charset = ANSI_CHARSET
            Font.Color = 5869567
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label6: TLabel
              Left = 43
              Top = 42
              Width = 148
              Height = 13
              Caption = 'Base de C'#225'lculo ICMS(Interno):'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label12: TLabel
              Left = 40
              Top = 70
              Width = 151
              Height = 13
              Caption = 'Base de C'#225'lculo ICMS(Externo):'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label14: TLabel
              Left = 18
              Top = 98
              Width = 173
              Height = 13
              Caption = 'Base de C'#225'lculo ICMS(Substitui'#231#227'o):'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label17: TLabel
              Left = 95
              Top = 126
              Width = 96
              Height = 13
              Caption = 'Base de C'#225'lculo IPI:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label24: TLabel
              Left = 271
              Top = 20
              Width = 14
              Height = 13
              Caption = '(%)'
              Font.Charset = ANSI_CHARSET
              Font.Color = 5869567
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label11: TLabel
              Left = 87
              Top = 154
              Width = 104
              Height = 13
              Caption = 'Base de C'#225'lculo TVA:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label13: TLabel
              Left = 91
              Top = 182
              Width = 100
              Height = 13
              Caption = 'Base de C'#225'lculo PIS:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label31: TLabel
              Left = 79
              Top = 210
              Width = 112
              Height = 13
              Caption = 'Base de C'#225'lculo Cofins:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label25: TLabel
              Left = 99
              Top = 267
              Width = 92
              Height = 13
              Caption = 'Situa'#231#227'o Tribut'#225'ria:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label32: TLabel
              Left = 125
              Top = 295
              Width = 66
              Height = 13
              Caption = 'C'#243'digo Fiscal:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label33: TLabel
              Left = 112
              Top = 238
              Width = 79
              Height = 13
              Caption = 'Outros Impostos:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object DBEdit14: TDBEdit
              Left = 246
              Top = 37
              Width = 70
              Height = 24
              AutoSize = False
              DataField = 'perc_icms_interno'
              DataSource = BancoDeDados.DSqryCadProduto
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 246
              Top = 65
              Width = 70
              Height = 24
              DataField = 'perc_icms_externo'
              DataSource = BancoDeDados.DSqryCadProduto
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object DBEdit8: TDBEdit
              Left = 246
              Top = 93
              Width = 70
              Height = 24
              DataField = 'perc_icms_substituicao'
              DataSource = BancoDeDados.DSqryCadProduto
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object DBEdit10: TDBEdit
              Left = 246
              Top = 121
              Width = 70
              Height = 24
              DataField = 'perc_ipi'
              DataSource = BancoDeDados.DSqryCadProduto
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object DBEdit3: TDBEdit
              Left = 246
              Top = 149
              Width = 70
              Height = 24
              DataField = 'perc_tva'
              DataSource = BancoDeDados.DSqryCadProduto
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object DBEdit5: TDBEdit
              Left = 246
              Top = 177
              Width = 70
              Height = 24
              DataField = 'perc_pis'
              DataSource = BancoDeDados.DSqryCadProduto
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object DBEdit4: TDBEdit
              Left = 246
              Top = 205
              Width = 70
              Height = 24
              DataField = 'perc_cofins'
              DataSource = BancoDeDados.DSqryCadProduto
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
            end
            object DBEdit7: TDBEdit
              Left = 246
              Top = 262
              Width = 70
              Height = 24
              DataField = 'st'
              DataSource = BancoDeDados.DSqryCadProduto
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
            end
            object DBEdit17: TDBEdit
              Left = 246
              Top = 290
              Width = 70
              Height = 24
              DataField = 'ecf'
              DataSource = BancoDeDados.DSqryCadProduto
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 9
            end
            object DBEdit18: TDBEdit
              Left = 246
              Top = 233
              Width = 70
              Height = 24
              DataField = 'perc_outros_impostos'
              DataSource = BancoDeDados.DSqryCadProduto
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
            end
          end
          object GroupBox4: TGroupBox
            Left = 534
            Top = 16
            Width = 355
            Height = 229
            Caption = 'Encargos'
            Font.Charset = ANSI_CHARSET
            Font.Color = 5869567
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label26: TLabel
              Left = 201
              Top = 17
              Width = 14
              Height = 13
              Caption = '(%)'
              Font.Charset = ANSI_CHARSET
              Font.Color = 5869567
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label29: TLabel
              Left = 97
              Top = 38
              Width = 27
              Height = 13
              Caption = 'Frete:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label15: TLabel
              Left = 76
              Top = 66
              Width = 48
              Height = 13
              Caption = 'Comiss'#227'o:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label27: TLabel
              Left = 274
              Top = 17
              Width = 20
              Height = 13
              Caption = '(R$)'
              Font.Charset = ANSI_CHARSET
              Font.Color = 5869567
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label34: TLabel
              Left = 72
              Top = 94
              Width = 52
              Height = 13
              Caption = 'Custo Fixo:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object DBEdit21: TDBEdit
              Left = 251
              Top = 33
              Width = 70
              Height = 24
              TabStop = False
              Color = 8673536
              DataField = 'vl_frete'
              DataSource = BancoDeDados.DSqryCadProduto
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object DBEdit22: TDBEdit
              Left = 174
              Top = 33
              Width = 70
              Height = 24
              DataField = 'perc_frete'
              DataSource = BancoDeDados.DSqryCadProduto
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBEdit9: TDBEdit
              Left = 174
              Top = 61
              Width = 70
              Height = 24
              DataField = 'perc_comissao'
              DataSource = BancoDeDados.DSqryCadProduto
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object DBEdit11: TDBEdit
              Left = 251
              Top = 61
              Width = 70
              Height = 24
              TabStop = False
              Color = 8673536
              DataField = 'vl_comissao'
              DataSource = BancoDeDados.DSqryCadProduto
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object DBEdit19: TDBEdit
              Left = 174
              Top = 89
              Width = 70
              Height = 24
              DataField = 'perc_custo_fixo'
              DataSource = BancoDeDados.DSqryCadProduto
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object DBEdit20: TDBEdit
              Left = 251
              Top = 89
              Width = 70
              Height = 24
              TabStop = False
              Color = 8673536
              DataField = 'vl_custo_fixo'
              DataSource = BancoDeDados.DSqryCadProduto
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
          end
          object GroupBox2: TGroupBox
            Left = 534
            Top = 266
            Width = 355
            Height = 143
            Caption = 'Dedu'#231#245'es'
            Font.Charset = ANSI_CHARSET
            Font.Color = 5869567
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object Label35: TLabel
              Left = 201
              Top = 17
              Width = 14
              Height = 13
              Caption = '(%)'
              Font.Charset = ANSI_CHARSET
              Font.Color = 5869567
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label36: TLabel
              Left = 274
              Top = 17
              Width = 20
              Height = 13
              Caption = '(R$)'
              Font.Charset = ANSI_CHARSET
              Font.Color = 5869567
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label37: TLabel
              Left = 70
              Top = 37
              Width = 54
              Height = 13
              Caption = 'Descontos:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object DBEdit25: TDBEdit
              Left = 174
              Top = 32
              Width = 70
              Height = 24
              DataField = 'perc_desconto'
              DataSource = BancoDeDados.DSqryCadProduto
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBEdit26: TDBEdit
              Left = 251
              Top = 32
              Width = 70
              Height = 24
              TabStop = False
              Color = 8673536
              DataField = 'vl_desconto'
              DataSource = BancoDeDados.DSqryCadProduto
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'Fornecedores'
          object GroupBox5: TGroupBox
            Left = 7
            Top = 3
            Width = 935
            Height = 206
            Caption = 'Fornecedores'
            Font.Charset = ANSI_CHARSET
            Font.Color = 5869567
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object DBGrid2: TDBGrid
              Left = 25
              Top = 22
              Width = 896
              Height = 172
              Color = 13619151
              DataSource = BancoDeDados.DSqryCsProdutoFornecedor
              FixedColor = 8673536
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              PopupMenu = PMenuFornecedor
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = 5869567
              TitleFont.Height = -13
              TitleFont.Name = 'Microsoft Sans Serif'
              TitleFont.Style = [fsBold]
              OnDblClick = Adicionar1Click
              Columns = <
                item
                  Expanded = False
                  FieldName = 'idfornecedor'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Microsoft Sans Serif'
                  Font.Style = []
                  Title.Caption = 'Fornecedor I.D'
                  Title.Font.Charset = ANSI_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Microsoft Sans Serif'
                  Title.Font.Style = []
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'calc_nome_razaosocial'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Microsoft Sans Serif'
                  Font.Style = []
                  Title.Caption = 'Raz'#227'o Social'
                  Title.Font.Charset = ANSI_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Microsoft Sans Serif'
                  Title.Font.Style = []
                  Width = 450
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'calc_nome_nomefantasia'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Microsoft Sans Serif'
                  Font.Style = []
                  Title.Caption = 'Nome Fantasia'
                  Title.Font.Charset = ANSI_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Microsoft Sans Serif'
                  Title.Font.Style = []
                  Width = 300
                  Visible = True
                end>
            end
          end
          object GroupBox6: TGroupBox
            Left = 7
            Top = 208
            Width = 935
            Height = 209
            Caption = 'Localiza'#231#227'o'
            Font.Charset = ANSI_CHARSET
            Font.Color = 5869567
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object DBGrid3: TDBGrid
              Left = 25
              Top = 16
              Width = 896
              Height = 181
              Color = 13619151
              DataSource = BancoDeDados.DSqryCsLocalizacao
              FixedColor = 8673536
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              PopupMenu = PMenuLocalizacao
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = 5869567
              TitleFont.Height = -13
              TitleFont.Name = 'Microsoft Sans Serif'
              TitleFont.Style = [fsBold]
              OnDblClick = Adicionar2Click
              Columns = <
                item
                  Expanded = False
                  FieldName = 'idlocalizacao'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Microsoft Sans Serif'
                  Font.Style = []
                  Title.Caption = 'Localizacao I.D'
                  Title.Font.Charset = ANSI_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Microsoft Sans Serif'
                  Title.Font.Style = []
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'idproduto'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Microsoft Sans Serif'
                  Font.Style = []
                  Title.Caption = 'Produto I.D'
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
                  FieldName = 'calc_produto_descricao'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Microsoft Sans Serif'
                  Font.Style = []
                  Title.Caption = 'Descri'#231#227'o'
                  Title.Font.Charset = ANSI_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Microsoft Sans Serif'
                  Title.Font.Style = []
                  Width = 230
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'calc_nome_unidadeestoque'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Microsoft Sans Serif'
                  Font.Style = []
                  Title.Caption = 'Unidade de Estoque'
                  Title.Font.Charset = ANSI_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Microsoft Sans Serif'
                  Title.Font.Style = []
                  Width = 230
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'corredor'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Microsoft Sans Serif'
                  Font.Style = []
                  Title.Caption = 'Corredor'
                  Title.Font.Charset = ANSI_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Microsoft Sans Serif'
                  Title.Font.Style = []
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'estante'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Microsoft Sans Serif'
                  Font.Style = []
                  Title.Caption = 'Estante'
                  Title.Font.Charset = ANSI_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Microsoft Sans Serif'
                  Title.Font.Style = []
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'prateleira'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Microsoft Sans Serif'
                  Font.Style = []
                  Title.Caption = 'Prateleira'
                  Title.Font.Charset = ANSI_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Microsoft Sans Serif'
                  Title.Font.Style = []
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'bandeja'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Microsoft Sans Serif'
                  Font.Style = []
                  Title.Caption = 'Bandeja'
                  Title.Font.Charset = ANSI_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Microsoft Sans Serif'
                  Title.Font.Style = []
                  Width = 60
                  Visible = True
                end>
            end
          end
        end
      end
      object DBDateEdit1: TDBDateEdit
        Left = 579
        Top = 18
        Width = 110
        Height = 24
        Margins.Left = 1
        Margins.Top = 1
        DataField = 'data_cadastro'
        DataSource = BancoDeDados.DSqryCadProduto
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 5
      end
    end
  end
  object PMenuFornecedor: TPopupMenu
    Left = 56
    Top = 40
    object Adicionar1: TMenuItem
      Caption = 'Adicionar'
      OnClick = Adicionar1Click
    end
    object Excluir1: TMenuItem
      Caption = 'Excluir'
      OnClick = Excluir1Click
    end
  end
  object PMenuLocalizacao: TPopupMenu
    Left = 104
    Top = 40
    object Adicionar2: TMenuItem
      Caption = 'Adicionar'
      OnClick = Adicionar2Click
    end
    object Excluir2: TMenuItem
      Caption = 'Excluir'
      OnClick = Excluir2Click
    end
  end
end
