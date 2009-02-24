object LanMovimentoEstoqueForm: TLanMovimentoEstoqueForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Movimentos de Estoque'
  ClientHeight = 573
  ClientWidth = 955
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
    Width = 955
    Height = 573
    ActivePage = tsConsulta
    Align = alClient
    TabOrder = 0
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      OnShow = tsConsultaShow
      object Panel1: TPanel
        Left = 0
        Top = 511
        Width = 947
        Height = 34
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 0
        object Label1: TLabel
          Left = 17
          Top = 10
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
          Left = 274
          Top = 11
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
          Left = 817
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
          Left = 69
          Top = 6
          Width = 164
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
          TabOrder = 1
          Text = 'C'#243'digo'
          OnChange = CBPesquisarChange
          Items.Strings = (
            'C'#243'digo'
            'Nome')
        end
        object EditPesquisar: TEdit
          Left = 328
          Top = 9
          Width = 441
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
        Left = 1
        Top = 54
        Width = 945
        Height = 455
        Color = 13619151
        DataSource = BancoDeDados.DSqryCsMovimentoEstoque
        FixedColor = 8673536
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = PopupMenu2
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'idmovimento_estoque'
            Title.Caption = 'Mov. Estoque I.D'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'data_cadastro'
            Title.Caption = 'Data'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_nome_operacao'
            Title.Caption = 'Opera'#231#227'o'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_nome_unidade_origem'
            Title.Caption = 'Origem'
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
            FieldName = 'calc_nome_unidade_destino'
            Title.Caption = 'Destino'
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
            FieldName = 'calc_nome_fornecedor'
            Title.Caption = 'Fornecedor'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 250
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
        Left = 522
        Top = 34
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
        Left = 148
        Top = 18
        Width = 254
        Height = 49
        Color = 8673536
        ParentBackground = False
        TabOrder = 1
        object Label5: TLabel
          Left = 17
          Top = 16
          Width = 133
          Height = 13
          Caption = 'Movimento de Estoque:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText1: TDBText
          Left = 162
          Top = 13
          Width = 79
          Height = 17
          DataField = 'idmovimento_estoque'
          DataSource = BancoDeDados.DSqryCadMovimentoEstoque
          Font.Charset = ANSI_CHARSET
          Font.Color = clSilver
          Font.Height = -16
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object DBCheckBox2: TDBCheckBox
        Left = 433
        Top = 33
        Width = 65
        Height = 17
        TabStop = False
        Caption = 'Ativo'
        DataField = 'ativo'
        DataSource = BancoDeDados.DSqryCadMovimentoEstoque
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
      object Panel3: TPanel
        Left = 0
        Top = 491
        Width = 947
        Height = 54
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 3
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
        Left = 599
        Top = 30
        Width = 121
        Height = 24
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'data_cadastro'
        DataSource = BancoDeDados.DSqryCadMovimentoEstoque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 4
      end
      object DBGItens: TDBGrid
        Left = 0
        Top = 174
        Width = 946
        Height = 314
        Color = 13619151
        DataSource = BancoDeDados.DSqryCadMovimentoEstoqueItens
        FixedColor = 8673536
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = PopupMenu1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnColExit = DBGItensColExit
        OnEditButtonClick = DBGItensEditButtonClick
        OnKeyDown = DBGItensKeyDown
        Columns = <
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'idproduto'
            Title.Caption = 'Produto I.D'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Visible = True
          end
          item
            ButtonStyle = cbsNone
            Expanded = False
            FieldName = 'referencia'
            Title.Caption = 'Referencia'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 150
            Visible = True
          end
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'descricao'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'unidade'
            Title.Caption = 'Unidade'
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
            FieldName = 'quantidade'
            Title.Caption = 'Quantidade'
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
            FieldName = 'preco_unitario'
            Title.Caption = 'Pre'#231'o Unitario'
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
            FieldName = 'calc_total'
            ReadOnly = True
            Title.Caption = 'Total'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 80
            Visible = True
          end>
      end
      object GroupBox1: TGroupBox
        Left = 1
        Top = 74
        Width = 945
        Height = 97
        TabOrder = 5
        object Label3: TLabel
          Left = 362
          Top = 26
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
        object Label4: TLabel
          Left = 359
          Top = 54
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
        object Label6: TLabel
          Left = 60
          Top = 26
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = 'Opera'#231#227'o:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object BTFornecedor: TSpeedButton
          Left = 239
          Top = 49
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
          OnClick = BTFornecedorClick
        end
        object DBText2: TDBText
          Left = 146
          Top = 77
          Width = 311
          Height = 17
          DataField = 'calc_nome_fornecedor'
          DataSource = BancoDeDados.DSqryCadMovimentoEstoque
          Font.Charset = ANSI_CHARSET
          Font.Color = 5869567
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 691
          Top = 26
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Caption = 'Solicitante:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 74
          Top = 53
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
        object Label9: TLabel
          Left = 719
          Top = 54
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBLUnidadeEstoqueOrigem: TDBLookupComboBox
          Left = 415
          Top = 20
          Width = 254
          Height = 24
          DataField = 'idunidade_estoque_origem'
          DataSource = BancoDeDados.DSqryCadMovimentoEstoque
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          KeyField = 'idunidadeestoque'
          ListField = 'nome'
          ListSource = BancoDeDados.DSqryCsUnidadeEstoque
          ParentFont = False
          TabOrder = 2
        end
        object DBLUnidadeEstoqueDestino: TDBLookupComboBox
          Left = 415
          Top = 49
          Width = 254
          Height = 24
          DataField = 'idunidade_estoque_destino'
          DataSource = BancoDeDados.DSqryCadMovimentoEstoque
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          KeyField = 'idunidadeestoque'
          ListField = 'nome'
          ListSource = BancoDeDados.DSqryCsUnidadeEstoque
          ParentFont = False
          TabOrder = 3
        end
        object DBLTipoOperacao: TDBLookupComboBox
          Left = 145
          Top = 19
          Width = 181
          Height = 24
          DataField = 'idoperacao_estoque'
          DataSource = BancoDeDados.DSqryCadMovimentoEstoque
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          KeyField = 'idoperacao_estoque'
          ListField = 'descricao'
          ListSource = BancoDeDados.DSqryCsOperacaoEstoque
          ParentFont = False
          TabOrder = 0
        end
        object DBEditFornecedor: TDBEdit
          Left = 145
          Top = 49
          Width = 92
          Height = 24
          DataField = 'idfornecedor'
          DataSource = BancoDeDados.DSqryCadMovimentoEstoque
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnDblClick = DBEditFornecedorDblClick
        end
        object DBEdit1: TDBEdit
          Left = 754
          Top = 22
          Width = 181
          Height = 24
          CharCase = ecUpperCase
          DataField = 'solicitante'
          DataSource = BancoDeDados.DSqryCadMovimentoEstoque
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object CBTipo: TComboBox
          Left = 754
          Top = 49
          Width = 135
          Height = 24
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ItemHeight = 16
          ParentFont = False
          TabOrder = 5
          OnChange = CBTipoChange
          OnKeyDown = CBTipoKeyDown
          Items.Strings = (
            'Entrada'
            'Saida')
        end
      end
    end
  end
  object ActionList1: TActionList
    Left = 400
    Top = 8
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 45
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 113
      OnExecute = Action2Execute
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 368
    Top = 8
    object ExcluirItem1: TMenuItem
      Caption = 'Excluir Item'
      OnClick = ExcluirItem1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 368
    Top = 40
    object ProcessarLanamento1: TMenuItem
      Caption = 'Processar Lan'#231'amento'
      OnClick = ProcessarLanamento1Click
    end
    object DesprocessarLanamento1: TMenuItem
      Caption = 'Desprocessar Lan'#231'amento'
      OnClick = DesprocessarLanamento1Click
    end
  end
end
