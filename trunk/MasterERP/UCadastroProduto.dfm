inherited CadastroProdutoForm: TCadastroProdutoForm
  Caption = 'CadastroProdutoForm'
  ClientHeight = 507
  ClientWidth = 796
  ExplicitWidth = 802
  ExplicitHeight = 533
  PixelsPerInch = 96
  TextHeight = 13
  inherited SBPrincipal: TStatusBar
    Top = 488
    Width = 796
    ExplicitTop = 509
  end
  inherited Panel1: TPanel
    Height = 488
    ExplicitHeight = 509
    inherited JvGradientHeaderPanel1: TJvGradientHeaderPanel
      Height = 486
      ExplicitHeight = 507
    end
  end
  inherited PPrincipal: TPanel
    Width = 639
    Height = 488
    ExplicitHeight = 509
    inherited Panel3: TPanel
      Width = 637
      inherited Label1: TLabel
        Left = 66
        ExplicitLeft = 66
      end
      inherited DBText1: TDBText
        Left = 154
        ExplicitLeft = 154
      end
      inherited Label2: TLabel
        Left = 57
        ExplicitLeft = 57
      end
      inherited DBText2: TDBText
        Left = 154
        ExplicitLeft = 154
      end
      inherited DBCAtivo: TDBCheckBox
        Left = 154
        ExplicitLeft = 154
      end
    end
    object PCPrincipal: TPageControl
      Left = 1
      Top = 84
      Width = 637
      Height = 403
      ActivePage = TSCadastro
      Align = alClient
      TabOrder = 1
      ExplicitHeight = 424
      object TSCadastro: TTabSheet
        Caption = 'Cadastro'
        ExplicitWidth = 660
        ExplicitHeight = 396
        object Label8: TLabel
          Left = 76
          Top = 24
          Width = 57
          Height = 13
          Alignment = taRightJustify
          Caption = 'Produto I.D:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 82
          Top = 51
          Width = 51
          Height = 13
          Alignment = taRightJustify
          Caption = 'Descri'#231#227'o:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 34
          Top = 78
          Width = 99
          Height = 13
          Alignment = taRightJustify
          Caption = 'Descri'#231#227'o Reduzida:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 78
          Top = 105
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Refer'#234'ncia:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 90
          Top = 132
          Width = 43
          Height = 13
          Alignment = taRightJustify
          Caption = 'Unidade:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 41
          Top = 160
          Width = 92
          Height = 13
          Alignment = taRightJustify
          Caption = 'Grupo de Produtos:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 22
          Top = 187
          Width = 111
          Height = 13
          Alignment = taRightJustify
          Caption = 'SubGrupo de Produtos:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 53
          Top = 213
          Width = 80
          Height = 13
          Alignment = taRightJustify
          Caption = 'Estoque M'#237'nimo:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit1: TDBEdit
          Left = 150
          Top = 21
          Width = 117
          Height = 21
          TabStop = False
          Color = clScrollBar
          DataField = 'PRODUTO_ID'
          DataSource = DSCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEditNome: TDBEdit
          Left = 150
          Top = 48
          Width = 409
          Height = 21
          DataField = 'DESCRICAO'
          DataSource = DSCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnExit = RemoveAcento
        end
        object DBEditLogin: TDBEdit
          Left = 150
          Top = 75
          Width = 193
          Height = 21
          DataField = 'DESCRICAO_REDUZIDA'
          DataSource = DSCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnExit = RemoveAcento
        end
        object DBEditReferencia: TDBEdit
          Left = 150
          Top = 102
          Width = 193
          Height = 21
          DataField = 'REFERENCIA'
          DataSource = DSCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnExit = RemoveAcento
        end
        object DBLCUnidade: TDBLookupComboBox
          Left = 150
          Top = 129
          Width = 193
          Height = 21
          DataField = 'UNIDADE_ID'
          DataSource = DSCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'UNIDADE_ID'
          ListField = 'DESCRICAO'
          ListSource = BancoDados.DSUnidade
          ParentFont = False
          TabOrder = 4
        end
        object DBLCGrupoProduto: TDBLookupComboBox
          Left = 150
          Top = 156
          Width = 193
          Height = 21
          DataField = 'PRODUTO_GRUPO_ID'
          DataSource = DSCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'PRODUTO_GRUPO_ID'
          ListField = 'DESCRICAO'
          ListSource = BancoDados.DSGrupoProduto
          ParentFont = False
          TabOrder = 5
          OnClick = DBLCGrupoProdutoClick
        end
        object DBLCSubGrupoProduto: TDBLookupComboBox
          Left = 150
          Top = 183
          Width = 193
          Height = 21
          DataField = 'PRODUTO_SUBGRUPO_ID'
          DataSource = DSCadastro
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'PRODUTO_SUBGRUPO_ID'
          ListField = 'DESCRICAO'
          ListSource = BancoDados.DSSubGrupoProduto
          ParentFont = False
          TabOrder = 6
        end
        object DBEditEstoqueMinimo: TDBEdit
          Left = 150
          Top = 210
          Width = 117
          Height = 21
          DataField = 'ESTOQUE_MINIMO'
          DataSource = DSCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnExit = RemoveAcento
        end
      end
      object TSComplemento: TTabSheet
        Caption = 'Complemento'
        ImageIndex = 1
        ExplicitTop = 23
        ExplicitHeight = 396
        object Label6: TLabel
          Left = 53
          Top = 5
          Width = 78
          Height = 13
          Caption = 'Fornecedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = 6590965
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 53
          Top = 96
          Width = 98
          Height = 13
          Caption = 'C'#243'digo de Barras'
          Font.Charset = ANSI_CHARSET
          Font.Color = 6590965
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 53
          Top = 187
          Width = 40
          Height = 13
          Caption = 'Pre'#231'os'
          Font.Charset = ANSI_CHARSET
          Font.Color = 6590965
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 53
          Top = 280
          Width = 55
          Height = 13
          Caption = 'Empresas'
          Font.Charset = ANSI_CHARSET
          Font.Color = 6590965
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBGrid1: TDBGrid
          Left = 53
          Top = 20
          Width = 532
          Height = 70
          DataSource = BancoDados.DSProdutoFornecedor
          FixedColor = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clDefault
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          PopupMenu = PopupMenu1
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'FORNECEDOR_ID'
              Title.Caption = 'Fornecedor I.D'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'calc_fornecedor_nome'
              Title.Caption = 'Nome / Raz'#227'o Social'
              Width = 370
              Visible = True
            end>
        end
        object DBGrid2: TDBGrid
          Left = 53
          Top = 112
          Width = 532
          Height = 70
          DataSource = BancoDados.DSProdutoBarra
          FixedColor = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clDefault
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          PopupMenu = PopupMenu2
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'EAN'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FORNECEDOR_ID'
              Title.Caption = 'Fornecedor I.D'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'calc_fornecedor_nome'
              Title.Caption = 'Nome / Raz'#227'o Social'
              Width = 250
              Visible = True
            end>
        end
        object DBGrid3: TDBGrid
          Left = 53
          Top = 203
          Width = 532
          Height = 70
          DataSource = BancoDados.DSProdutoPreco
          FixedColor = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clDefault
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          PopupMenu = PopupMenu3
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 200
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ATIVO'
              Title.Caption = 'Ativo'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'calc_unidade_descricao'
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
              FieldName = 'MARGEM_LUCRO'
              Title.Caption = 'Margem Lucro (%)'
              Width = 100
              Visible = True
            end>
        end
        object DBGrid4: TDBGrid
          Left = 53
          Top = 296
          Width = 532
          Height = 70
          DataSource = BancoDados.DSProdutoEmpresa
          FixedColor = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clDefault
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          PopupMenu = PopupMenu4
          ReadOnly = True
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'EMPRESA_ID'
              Title.Caption = 'Empresa I.D'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'calc_empresa_descricao'
              Title.Caption = 'Nome / Raz'#227'o Social'
              Width = 370
              Visible = True
            end>
        end
      end
    end
  end
  inherited CDSCadastro: TClientDataSet
    object CDSCadastroPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
      DisplayFormat = '0000000000'
    end
    object CDSCadastroATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object CDSCadastroDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object CDSCadastroDATA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
    end
    object CDSCadastroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CDSCadastroDESCRICAO_REDUZIDA: TStringField
      FieldName = 'DESCRICAO_REDUZIDA'
      Size = 60
    end
    object CDSCadastroREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 60
    end
    object CDSCadastroUNIDADE_ID: TIntegerField
      FieldName = 'UNIDADE_ID'
    end
    object CDSCadastroPRODUTO_GRUPO_ID: TIntegerField
      FieldName = 'PRODUTO_GRUPO_ID'
    end
    object CDSCadastroPRODUTO_SUBGRUPO_ID: TIntegerField
      FieldName = 'PRODUTO_SUBGRUPO_ID'
    end
    object CDSCadastroESTOQUE_MINIMO: TFloatField
      FieldName = 'ESTOQUE_MINIMO'
      DisplayFormat = ',0.00'
    end
  end
  inherited qryCadastro: TSQLQuery
    SQL.Strings = (
      'select * from produto where produto_id = 0')
  end
  object PopupMenu1: TPopupMenu
    Left = 625
    Top = 42
    object AdicionarFornecedor1: TMenuItem
      Caption = 'Adicionar Fornecedor'
      OnClick = AdicionarFornecedor1Click
    end
    object ExcluirFornecedor1: TMenuItem
      Caption = 'Excluir Fornecedor'
      OnClick = ExcluirFornecedor1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 663
    Top = 42
    object AdicionarCdigodeBarras1: TMenuItem
      Caption = 'Adicionar C'#243'digo de Barras'
      OnClick = AdicionarCdigodeBarras1Click
    end
    object DetalhesdoCdigodeBarras1: TMenuItem
      Caption = 'Detalhes do C'#243'digo de Barras'
      OnClick = DetalhesdoCdigodeBarras1Click
    end
    object ExcluirCdigodeBarras1: TMenuItem
      Caption = 'Excluir C'#243'digo de Barras'
      OnClick = ExcluirCdigodeBarras1Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 700
    object AdicionarPreo1: TMenuItem
      Caption = 'Adicionar Pre'#231'o'
      OnClick = AdicionarPreo1Click
    end
    object DetalhesdoPreo1: TMenuItem
      Caption = 'Detalhes do Pre'#231'o'
      OnClick = DetalhesdoPreo1Click
    end
    object ExcluirPreo1: TMenuItem
      Caption = 'Excluir Pre'#231'o'
      OnClick = ExcluirPreo1Click
    end
  end
  object PopupMenu4: TPopupMenu
    Left = 701
    Top = 43
    object AdicionarEmpresa1: TMenuItem
      Caption = 'Adicionar Empresa'
      OnClick = AdicionarEmpresa1Click
    end
    object ExcluirEmpresa1: TMenuItem
      Caption = 'Excluir Empresa'
      OnClick = ExcluirEmpresa1Click
    end
  end
end
