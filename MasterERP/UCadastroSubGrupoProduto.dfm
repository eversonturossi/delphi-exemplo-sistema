inherited CadastroSubGrupoProdutoForm: TCadastroSubGrupoProdutoForm
  Caption = 'CadastroSubGrupoProdutoForm'
  ClientHeight = 427
  ClientWidth = 689
  ExplicitWidth = 695
  ExplicitHeight = 453
  PixelsPerInch = 96
  TextHeight = 13
  inherited SBPrincipal: TStatusBar
    Top = 408
    Width = 689
    ExplicitTop = 408
    ExplicitWidth = 689
  end
  inherited Panel1: TPanel
    Height = 408
    ExplicitHeight = 408
    inherited JvGradientHeaderPanel1: TJvGradientHeaderPanel
      Height = 406
      ExplicitHeight = 406
    end
  end
  inherited PPrincipal: TPanel
    Width = 532
    Height = 408
    ExplicitWidth = 532
    ExplicitHeight = 408
    object Label8: TLabel [0]
      Left = 24
      Top = 108
      Width = 108
      Height = 13
      Alignment = taRightJustify
      Caption = 'Produto SubGrupo I.D:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel [1]
      Left = 81
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
    object Label7: TLabel [2]
      Left = 100
      Top = 162
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Grupo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    inherited Panel3: TPanel
      Width = 530
      TabOrder = 2
      ExplicitWidth = 530
      inherited Label1: TLabel
        Left = 60
        ExplicitLeft = 60
      end
      inherited DBText1: TDBText
        Left = 148
        ExplicitLeft = 148
      end
      inherited Label2: TLabel
        Left = 51
        ExplicitLeft = 51
      end
      inherited DBText2: TDBText
        Left = 148
        ExplicitLeft = 148
      end
      inherited DBCAtivo: TDBCheckBox
        Left = 148
        ExplicitLeft = 148
      end
    end
    object DBEdit1: TDBEdit
      Left = 149
      Top = 105
      Width = 117
      Height = 21
      TabStop = False
      Color = clScrollBar
      DataField = 'PRODUTO_SUBGRUPO_ID'
      DataSource = DSCadastro
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object DBEditDescricao: TDBEdit
      Left = 149
      Top = 132
      Width = 329
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
    object DBLCGrupo: TDBLookupComboBox
      Left = 149
      Top = 159
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
      TabOrder = 1
    end
  end
  inherited CDSCadastro: TClientDataSet
    object CDSCadastroPRODUTO_SUBGRUPO_ID: TIntegerField
      FieldName = 'PRODUTO_SUBGRUPO_ID'
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
    object CDSCadastroPRODUTO_GRUPO_ID: TIntegerField
      FieldName = 'PRODUTO_GRUPO_ID'
    end
    object CDSCadastroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  inherited qryCadastro: TSQLQuery
    SQL.Strings = (
      'select * from produto_subgrupo where produto_subgrupo_id = 0')
  end
end
