inherited PesquisaEmpresaForm: TPesquisaEmpresaForm
  Caption = 'PesquisaEmpresaForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited Panel3: TPanel
      inherited EditValor: TEdit
        OnKeyPress = EditValorKeyPress
      end
    end
    inherited DBGrid1: TDBGrid
      DataSource = DSqryConsulta
      Columns = <
        item
          Expanded = False
          FieldName = 'EMPRESA_ID'
          Title.Caption = 'Empresa I.D'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Raz'#227'o Social/Nome'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_APELIDO_FANTASIA'
          Title.Caption = 'Nome Fantasia/Apelido'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ATIVO'
          Title.Caption = 'Ativa'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FILIAL'
          Title.Caption = 'Filial'
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
          Title.Caption = #218'ltima Altera'#231#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calc_tipo'
          Title.Caption = 'Tipo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNPJ_CPF'
          Title.Caption = 'CNPJ/CPF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IE_IDENTIDADE'
          Title.Caption = 'Inscri'#231#227'o Estadual/Identidade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IM'
          Title.Caption = 'Inscri'#231#227'o Municipal'
          Visible = True
        end>
    end
  end
  inherited qryConsulta: TSQLQuery
    SQL.Strings = (
      'select p.PESSOA_ID, p.ATIVO, p.DATA_CADASTRO,'
      
        '     p.DATA_ULTIMA_ALTERACAO, p.NOME, p.NOME_APELIDO_FANTASIA, e' +
        '.EMPRESA_ID,'
      '     e.CNPJ_CPF, e.TIPO, e.IE_IDENTIDADE, e.IM, e.FILIAL'
      '     from PESSOA p, EMPRESA e where (e.PESSOA_ID = p.PESSOA_ID)')
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
    object CDSConsultaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object CDSConsultaNOME_APELIDO_FANTASIA: TStringField
      FieldName = 'NOME_APELIDO_FANTASIA'
      Size = 60
    end
    object CDSConsultaEMPRESA_ID: TIntegerField
      FieldName = 'EMPRESA_ID'
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
    object CDSConsultaFILIAL: TSmallintField
      FieldName = 'FILIAL'
    end
    object CDSConsultacalc_tipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tipo'
      Calculated = True
    end
  end
end
