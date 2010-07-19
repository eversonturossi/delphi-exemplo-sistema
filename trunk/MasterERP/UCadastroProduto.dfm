inherited CadastroProdutoForm: TCadastroProdutoForm
  Caption = 'CadastroProdutoForm'
  ExplicitWidth = 776
  ExplicitHeight = 521
  PixelsPerInch = 96
  TextHeight = 13
  inherited PPrincipal: TPanel
    object Label8: TLabel [0]
      Left = 81
      Top = 108
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
    object Label3: TLabel [1]
      Left = 87
      Top = 135
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
    object Label4: TLabel [2]
      Left = 39
      Top = 162
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
    object Label5: TLabel [3]
      Left = 83
      Top = 189
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
    object Label6: TLabel [4]
      Left = 84
      Top = 297
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pre'#231'o (R$):'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel [5]
      Left = 95
      Top = 216
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
    object Label9: TLabel [6]
      Left = 46
      Top = 244
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
    object Label10: TLabel [7]
      Left = 27
      Top = 271
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
    inherited Panel3: TPanel
      TabOrder = 7
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
    object DBEdit1: TDBEdit
      Left = 155
      Top = 105
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
      TabOrder = 8
    end
    object DBEditNome: TDBEdit
      Left = 155
      Top = 132
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
      TabOrder = 0
      OnExit = RemoveAcento
    end
    object DBEditLogin: TDBEdit
      Left = 155
      Top = 159
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
      TabOrder = 1
      OnExit = RemoveAcento
    end
    object DBEditReferencia: TDBEdit
      Left = 155
      Top = 186
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
      TabOrder = 2
      OnExit = RemoveAcento
    end
    object DBEdit3: TDBEdit
      Left = 155
      Top = 294
      Width = 105
      Height = 21
      DataField = 'PRECO'
      DataSource = DSCadastro
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnExit = RemoveAcento
    end
    object DBLCUnidade: TDBLookupComboBox
      Left = 155
      Top = 213
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
      TabOrder = 3
    end
    object DBLCGrupoProduto: TDBLookupComboBox
      Left = 155
      Top = 240
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
      TabOrder = 4
      OnClick = DBLCGrupoProdutoClick
    end
    object DBLCSubGrupoProduto: TDBLookupComboBox
      Left = 155
      Top = 267
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
      TabOrder = 5
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
end
