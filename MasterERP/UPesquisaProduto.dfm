inherited PesquisaProdutoForm: TPesquisaProdutoForm
  Caption = 'PesquisaProdutoForm'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited Panel3: TPanel
      inherited EditValor: TEdit
        OnChange = EditValorChange
      end
    end
  end
  inherited qryConsulta: TSQLQuery
    SQL.Strings = (
      'select * from produto where produto_id = 0')
  end
  inherited CDSConsulta: TClientDataSet
    OnCalcFields = CDSConsultaCalcFields
    object CDSConsultaPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
      Required = True
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
    object CDSConsultaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CDSConsultaDESCRICAO_REDUZIDA: TStringField
      FieldName = 'DESCRICAO_REDUZIDA'
      Size = 60
    end
    object CDSConsultaREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 60
    end
    object CDSConsultaUNIDADE_ID: TIntegerField
      FieldName = 'UNIDADE_ID'
    end
    object CDSConsultaPRODUTO_GRUPO_ID: TIntegerField
      FieldName = 'PRODUTO_GRUPO_ID'
    end
    object CDSConsultaPRODUTO_SUBGRUPO_ID: TIntegerField
      FieldName = 'PRODUTO_SUBGRUPO_ID'
    end
    object CDSConsultaESTOQUE_MINIMO: TFloatField
      FieldName = 'ESTOQUE_MINIMO'
    end
    object CDSConsultacalc_unidade_descricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_unidade_descricao'
      Calculated = True
    end
    object CDSConsultacalc_grupo_descricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_grupo_descricao'
      Size = 60
      Calculated = True
    end
    object CDSConsultacalc_subgrupo_descricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_subgrupo_descricao'
      Size = 60
      Calculated = True
    end
  end
end
