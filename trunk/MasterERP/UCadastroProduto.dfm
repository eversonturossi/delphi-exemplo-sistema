inherited CadastroProdutoForm: TCadastroProdutoForm
  Caption = 'CadastroProdutoForm'
  ClientHeight = 528
  ExplicitWidth = 776
  ExplicitHeight = 554
  PixelsPerInch = 96
  TextHeight = 13
  inherited SBPrincipal: TStatusBar
    Top = 509
    ExplicitTop = 509
  end
  inherited Panel1: TPanel
    Height = 509
    ExplicitHeight = 509
    inherited JvGradientHeaderPanel1: TJvGradientHeaderPanel
      Height = 507
      ExplicitHeight = 507
    end
  end
  inherited PPrincipal: TPanel
    Height = 509
    ExplicitHeight = 509
    inherited Panel3: TPanel
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
      Width = 611
      Height = 424
      ActivePage = TSFornecedorBarras
      Align = alClient
      TabOrder = 1
      object TSCadastro: TTabSheet
        Caption = 'Cadastro'
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
      end
      object TSFornecedorBarras: TTabSheet
        Caption = 'Fornecedores / C'#243'd. Barras'
        ImageIndex = 1
        object Label6: TLabel
          Left = 53
          Top = 21
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
          Top = 207
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
        object DBGrid1: TDBGrid
          Left = 53
          Top = 38
          Width = 532
          Height = 150
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
          Top = 223
          Width = 532
          Height = 157
          DataSource = BancoDados.DSProdutoBarra
          FixedColor = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clDefault
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
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
    object CDSCadastroPRECO: TFloatField
      FieldName = 'PRECO'
      DisplayFormat = ',0.00'
    end
    object CDSCadastroPRODUTO_GRUPO_ID: TIntegerField
      FieldName = 'PRODUTO_GRUPO_ID'
    end
    object CDSCadastroPRODUTO_SUBGRUPO_ID: TIntegerField
      FieldName = 'PRODUTO_SUBGRUPO_ID'
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
end
