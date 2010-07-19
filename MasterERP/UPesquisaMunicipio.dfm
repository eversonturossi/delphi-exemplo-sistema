inherited PesquisaMunicipioForm: TPesquisaMunicipioForm
  Caption = 'PesquisaMunicipioForm'
  ClientWidth = 711
  ExplicitWidth = 727
  ExplicitHeight = 480
  PixelsPerInch = 96
  TextHeight = 13
  inherited SBPrincipal: TStatusBar
    Width = 711
    ExplicitWidth = 711
  end
  inherited Panel2: TPanel
    Width = 590
    ExplicitWidth = 590
    inherited Panel3: TPanel
      Width = 588
      ExplicitWidth = 588
      inherited BTPesquisar: TSpeedButton
        OnClick = BTPesquisarClick
      end
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
      inherited EditValor: TEdit
        OnKeyPress = EditValorKeyPress
      end
      inherited CBSituacao: TComboBox
        Visible = False
      end
    end
    inherited DBGrid1: TDBGrid
      Width = 588
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
    inherited Panel4: TPanel
      Width = 588
      ExplicitWidth = 588
      inherited BTConfirmar: TSpeedButton
        Left = 373
        ExplicitLeft = 373
      end
      inherited BTCancelar: TSpeedButton
        Left = 480
        ExplicitLeft = 480
      end
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
