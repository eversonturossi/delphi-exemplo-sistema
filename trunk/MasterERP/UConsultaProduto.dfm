inherited ConsultaProdutoForm: TConsultaProdutoForm
  Caption = 'ConsultaProdutoForm'
  ClientHeight = 557
  ClientWidth = 769
  ExplicitWidth = 775
  ExplicitHeight = 583
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 538
    ExplicitHeight = 538
    inherited GHPPrincipal: TJvGradientHeaderPanel
      Height = 536
      ExplicitHeight = 536
      inherited BTNovo: TSpeedButton
        OnClick = BTNovoClick
      end
    end
  end
  inherited Panel2: TPanel
    Width = 610
    Height = 538
    ExplicitWidth = 610
    ExplicitHeight = 538
    inherited DBGrid1: TDBGrid
      Width = 608
      Height = 440
      Columns = <
        item
          Expanded = False
          FieldName = 'PRODUTO_ID'
          Title.Caption = 'Produto I.D'
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
          FieldName = 'DESCRICAO_REDUZIDA'
          Title.Caption = 'Descri'#231#227'o Reduzida'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REFERENCIA'
          Title.Caption = 'Refer'#234'ncia'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'l_unidade'
          Title.Caption = 'Unidade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO'
          Title.Caption = 'Pre'#231'o'
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
      Width = 608
      ExplicitWidth = 608
      inherited BTPesquisar: TSpeedButton
        OnClick = BTPesquisarClick
      end
      inherited CBCriterio: TComboBox
        Items.Strings = (
          '<selecione>'
          'Produto I.D'
          'Descri'#231#227'o'
          'Descri'#231#227'o Reduzida')
      end
      inherited EditValor: TEdit
        OnKeyPress = EditValorKeyPress
      end
    end
  end
  inherited SBPrincipal: TStatusBar
    Top = 538
    Width = 769
    ExplicitTop = 538
    ExplicitWidth = 769
  end
  inherited qryConsulta: TSQLQuery
    SQL.Strings = (
      'select * from produto where produto_id = 0')
  end
  inherited CDSConsulta: TClientDataSet
    OnCalcFields = CDSConsultaCalcFields
    object CDSConsultaPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
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
    object CDSConsultaPRECO: TFloatField
      FieldName = 'PRECO'
      DisplayFormat = 'R$ ,0.00'
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
