inherited PesquisaMunicipioForm: TPesquisaMunicipioForm
  Caption = 'PesquisaMunicipioForm'
  ClientWidth = 711
  ExplicitWidth = 727
  PixelsPerInch = 96
  TextHeight = 13
  inherited SBPrincipal: TStatusBar
    Width = 711
    ExplicitWidth = 711
  end
  inherited Panel2: TPanel
    Width = 556
    ExplicitWidth = 556
    inherited Panel3: TPanel
      Width = 554
      ExplicitWidth = 554
      inherited Label4: TLabel
        Visible = False
      end
      inherited CBCriterio: TComboBox
        Items.Strings = (
          '<selecione>'
          'Cidade I.D'
          'Nome'
          'UF')
      end
      inherited CBSituacao: TComboBox
        Visible = False
      end
      inherited EditValor: TEdit
        OnKeyPress = EditValorKeyPress
      end
    end
    inherited DBGrid1: TDBGrid
      Width = 554
      DataSource = DSqryConsulta
      Columns = <
        item
          Expanded = False
          FieldName = 'MUNICIPIO_ID'
          Title.Caption = 'Municipio I.D'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 450
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UF'
          Visible = True
        end>
    end
  end
  inherited qryConsulta: TSQLQuery
    SQL.Strings = (
      'select * from municipio where municipio_id = 0')
  end
  inherited CDSConsulta: TClientDataSet
    object CDSConsultaMUNICIPIO_ID: TIntegerField
      FieldName = 'MUNICIPIO_ID'
    end
    object CDSConsultaNOME: TStringField
      FieldName = 'NOME'
      Size = 121
    end
    object CDSConsultaUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object CDSConsultaUF_ID: TIntegerField
      FieldName = 'UF_ID'
    end
  end
end
