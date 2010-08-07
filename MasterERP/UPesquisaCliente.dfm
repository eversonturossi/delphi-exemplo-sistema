inherited PesquisaClienteForm: TPesquisaClienteForm
  Caption = 'PesquisaClienteForm'
  ExplicitWidth = 843
  ExplicitHeight = 480
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited Panel3: TPanel
      inherited CBCriterio: TComboBox
        Items.Strings = (
          '<selecione>'
          'Cliente I.D'
          'Nome / Raz'#227'o Social'
          'Apelido / Nome Fantasia')
      end
      inherited EditValor: TEdit
        OnChange = EditValorChange
      end
    end
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'CLIENTE_ID'
          Title.Caption = 'Cliente I.D'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ATIVO'
          Title.Caption = 'Ativo'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calc_filial'
          Title.Caption = 'Filial'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_RAZAO'
          Title.Caption = 'Nome / Raz'#227'o Social'
          Width = 350
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_APELIDO_FANTASIA'
          Title.Caption = 'Apelido / Nome Fantasia'
          Width = 350
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_CADASTRO'
          Title.Caption = 'Data Cadastro / Data Abertura'
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
          FieldName = 'calc_filial'
          Title.Caption = 'Tipo'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNPJ_CPF'
          Title.Caption = 'CPF / CNPJ'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IE_IDENTIDADE'
          Title.Caption = 'Identidade / Inscri'#231#227'o Estadual'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IM'
          Title.Caption = 'Inscri'#231#227'o Municipal'
          Width = 150
          Visible = True
        end>
    end
  end
  inherited qryConsulta: TSQLQuery
    SQL.Strings = (
      'select p.PESSOA_ID, c.ATIVO, c.DATA_CADASTRO,'
      
        '    c.DATA_ULTIMA_ALTERACAO, p.NOME_RAZAO, p.NOME_APELIDO_FANTAS' +
        'IA, c.CLIENTE_ID,'
      '     c.CNPJ_CPF, c.TIPO, c.IE_IDENTIDADE, c.IM, c.EMPRESA_ID'
      '     from PESSOA p, CLIENTE c where (c.PESSOA_ID = p.PESSOA_ID)')
  end
  inherited CDSConsulta: TClientDataSet
    OnCalcFields = CDSConsultaCalcFields
    object CDSConsultaPESSOA_ID: TIntegerField
      FieldName = 'PESSOA_ID'
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
    object CDSConsultaNOME_RAZAO: TStringField
      FieldName = 'NOME_RAZAO'
      Size = 60
    end
    object CDSConsultaNOME_APELIDO_FANTASIA: TStringField
      FieldName = 'NOME_APELIDO_FANTASIA'
      Size = 60
    end
    object CDSConsultaCLIENTE_ID: TIntegerField
      FieldName = 'CLIENTE_ID'
      DisplayFormat = '0000000000'
    end
    object CDSConsultaCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 14
    end
    object CDSConsultaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object CDSConsultaIE_IDENTIDADE: TStringField
      FieldName = 'IE_IDENTIDADE'
      Size = 14
    end
    object CDSConsultaIM: TStringField
      FieldName = 'IM'
      Size = 25
    end
    object CDSConsultaEMPRESA_ID: TIntegerField
      FieldName = 'EMPRESA_ID'
    end
    object CDSConsultacalc_tipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tipo'
      Calculated = True
    end
    object CDSConsultacalc_filial: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'calc_filial'
      Calculated = True
    end
  end
end
