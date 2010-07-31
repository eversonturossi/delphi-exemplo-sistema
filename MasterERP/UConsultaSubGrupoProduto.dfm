inherited ConsultaSubGrupoProdutoForm: TConsultaSubGrupoProdutoForm
  Caption = 'ConsultaSubGrupoProdutoForm'
  ClientHeight = 505
  ExplicitWidth = 854
  ExplicitHeight = 531
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 486
    ExplicitHeight = 488
    inherited GHPPrincipal: TJvGradientHeaderPanel
      Height = 484
      ExplicitHeight = 486
      inherited BTNovo: TSpeedButton
        OnClick = BTNovoClick
      end
    end
  end
  inherited Panel2: TPanel
    Height = 486
    ExplicitHeight = 488
    inherited DBGrid1: TDBGrid
      Height = 388
      Columns = <
        item
          Expanded = False
          FieldName = 'PRODUTO_SUBGRUPO_ID'
          Title.Caption = 'Produto SubGrupo I.D'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ATIVO'
          Title.Caption = 'Ativo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'l_grupo_descricao'
          Title.Caption = 'Grupo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_CADASTRO'
          Title.Caption = 'Data Cadastro'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_ULTIMA_ALTERACAO'
          Title.Caption = 'Data '#218'ltima Altera'#231#227'o'
          Visible = True
        end>
    end
    inherited Panel3: TPanel
      inherited BTPesquisar: TSpeedButton
        OnClick = BTPesquisarClick
      end
      inherited EditValor: TEdit
        OnKeyPress = EditValorKeyPress
      end
    end
  end
  inherited SBPrincipal: TStatusBar
    Top = 486
    ExplicitTop = 488
    ExplicitWidth = 0
  end
  inherited qryConsulta: TSQLQuery
    SQL.Strings = (
      'select * from produto_subgrupo where produto_subgrupo_id = 0')
  end
  inherited CDSConsulta: TClientDataSet
    object CDSConsultaPRODUTO_SUBGRUPO_ID: TIntegerField
      FieldName = 'PRODUTO_SUBGRUPO_ID'
      DisplayFormat = '0000000000'
    end
    object CDSConsultaATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object CDSConsultaDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object CDSConsultaDATA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
    end
    object CDSConsultaPRODUTO_GRUPO_ID: TIntegerField
      FieldName = 'PRODUTO_GRUPO_ID'
    end
    object CDSConsultaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CDSConsultal_grupo_descricao: TStringField
      FieldKind = fkLookup
      FieldName = 'l_grupo_descricao'
      LookupDataSet = BancoDados.CDSGrupoProduto
      LookupKeyFields = 'PRODUTO_GRUPO_ID'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PRODUTO_GRUPO_ID'
      Lookup = True
    end
  end
end
