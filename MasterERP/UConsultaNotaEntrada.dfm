inherited ConsultaNotaEntradaForm: TConsultaNotaEntradaForm
  Caption = 'ConsultaNotaEntradaForm'
  ExplicitWidth = 854
  ExplicitHeight = 534
  PixelsPerInch = 96
  TextHeight = 13
  inherited qryConsulta: TSQLQuery
    SQL.Strings = (
      'select * from nota_entrada where nota_entrada_id = 0')
  end
  inherited CDSConsulta: TClientDataSet
    OnCalcFields = CDSConsultaCalcFields
    object CDSConsultaNOTA_ENTRADA_ID: TIntegerField
      FieldName = 'NOTA_ENTRADA_ID'
      DisplayFormat = '0000000000'
    end
    object CDSConsultaEMPRESA_ID: TIntegerField
      FieldName = 'EMPRESA_ID'
    end
    object CDSConsultaFORNECEDOR_ID: TIntegerField
      FieldName = 'FORNECEDOR_ID'
    end
    object CDSConsultaDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object CDSConsultaDATA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
    end
    object CDSConsultaDATA_ENTRADA: TSQLTimeStampField
      FieldName = 'DATA_ENTRADA'
    end
    object CDSConsultaTRANSPORTADORA_ID: TIntegerField
      FieldName = 'TRANSPORTADORA_ID'
    end
    object CDSConsultaCANCELADO: TSmallintField
      FieldName = 'CANCELADO'
    end
    object CDSConsultacalc_empresa_nome: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_empresa_nome'
      Size = 60
      Calculated = True
    end
    object CDSConsultacalc_fornecedor_nome: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_fornecedor_nome'
      Size = 60
      Calculated = True
    end
    object CDSConsultacalc_transportadora_nome: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_transportadora_nome'
      Size = 60
      Calculated = True
    end
  end
end
