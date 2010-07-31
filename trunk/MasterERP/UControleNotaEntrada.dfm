inherited ControleNotaEntradaForm: TControleNotaEntradaForm
  Caption = 'ControleNotaEntradaForm'
  ExplicitWidth = 796
  ExplicitHeight = 551
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited GHPPrincipal: TJvGradientHeaderPanel
      inherited BTNovo: TSpeedButton
        OnClick = BTNovoClick
      end
    end
  end
  inherited Panel2: TPanel
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'NOTA_ENTRADA_ID'
          Title.Caption = 'NotaEntrada I.D'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calc_fornecedor_nome'
          Title.Caption = 'Fornecedor'
          Width = 350
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calc_transportadora_nome'
          Title.Caption = 'Transportadora'
          Width = 350
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_CADASTRO'
          Title.Caption = 'Data Cadastro'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_ENTRADA'
          Title.Caption = 'Data Entrada'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_ULTIMA_ALTERACAO'
          Title.Caption = #218'ltima Altera'#231#227'o'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANCELADO'
          Title.Caption = 'Cancelada'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FINALIZADO'
          Title.Caption = 'Finalizada'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_FRETE'
          Title.Caption = 'Valor Frete (R$)'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_PRODUTOS'
          Title.Caption = 'Valor Produtos (R$)'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_NOTA'
          Title.Caption = 'Valor Nota (R$)'
          Width = 100
          Visible = True
        end>
    end
  end
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
      DisplayFormat = '0000000000'
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
      DisplayFormat = '0000000000'
    end
    object CDSConsultaCANCELADO: TSmallintField
      FieldName = 'CANCELADO'
    end
    object CDSConsultaVALOR_FRETE: TFloatField
      FieldName = 'VALOR_FRETE'
      DisplayFormat = ',0.00'
    end
    object CDSConsultaVALOR_PRODUTOS: TFloatField
      FieldName = 'VALOR_PRODUTOS'
      DisplayFormat = ',0.00'
    end
    object CDSConsultaVALOR_NOTA: TFloatField
      FieldName = 'VALOR_NOTA'
      DisplayFormat = ',0.00'
    end
    object CDSConsultaFINALIZADO: TSmallintField
      FieldName = 'FINALIZADO'
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
