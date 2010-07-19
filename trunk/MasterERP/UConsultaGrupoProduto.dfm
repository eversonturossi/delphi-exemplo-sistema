inherited ConsultaGrupoProdutoForm: TConsultaGrupoProdutoForm
  Caption = 'ConsultaGrupoProdutoForm'
  ClientHeight = 509
  ClientWidth = 821
  ExplicitWidth = 827
  ExplicitHeight = 535
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 490
    ExplicitHeight = 490
    inherited JvGradientHeaderPanel1: TJvGradientHeaderPanel
      Height = 488
      ExplicitHeight = 488
      inherited BTNovo: TSpeedButton
        OnClick = BTNovoClick
      end
    end
  end
  inherited Panel2: TPanel
    Width = 662
    Height = 490
    ExplicitWidth = 662
    ExplicitHeight = 490
    inherited DBGrid1: TDBGrid
      Width = 660
      Height = 392
      Columns = <
        item
          Expanded = False
          FieldName = 'PRODUTO_GRUPO_ID'
          Title.Caption = 'Grupo Produto I.D'
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
          FieldName = 'DATA_CADASTRO'
          Title.Caption = 'Data Cadastro'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_ULTIMA_ALTERACAO'
          Title.Caption = 'Data '#218'ltima Altera'#231#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Visible = True
        end>
    end
    inherited Panel3: TPanel
      Width = 660
      ExplicitWidth = 660
      inherited BTPesquisar: TSpeedButton
        OnClick = BTPesquisarClick
      end
      inherited CBCriterio: TComboBox
        Items.Strings = (
          '<selecione>'
          'Grupo Produto I.D'
          'Descri'#231#227'o')
      end
      inherited EditValor: TEdit
        OnKeyPress = EditValorKeyPress
      end
    end
  end
  inherited SBPrincipal: TStatusBar
    Top = 490
    Width = 821
    ExplicitTop = 490
    ExplicitWidth = 821
  end
  inherited qryConsulta: TSQLQuery
    SQL.Strings = (
      'select * from produto_grupo where produto_grupo_id = 0')
  end
  inherited CDSConsulta: TClientDataSet
    object CDSConsultaPRODUTO_GRUPO_ID: TIntegerField
      FieldName = 'PRODUTO_GRUPO_ID'
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
  end
end
