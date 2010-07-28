inherited PesquisaFornecedorForm: TPesquisaFornecedorForm
  Caption = 'PesquisaFornecedorForm'
  ExplicitWidth = 843
  ExplicitHeight = 480
  PixelsPerInch = 96
  TextHeight = 13
  inherited SBPrincipal: TStatusBar
    ExplicitWidth = 827
  end
  inherited Panel1: TPanel
    inherited GHPPrincipal: TJvGradientHeaderPanel
      ExplicitWidth = 153
    end
  end
  inherited Panel2: TPanel
    ExplicitLeft = 155
    ExplicitWidth = 672
    inherited Panel3: TPanel
      ExplicitWidth = 670
    end
  end
  inherited qryConsulta: TSQLQuery
    SQL.Strings = (
      'select p.PESSOA_ID, f.ATIVO, f.DATA_CADASTRO,'
      
        '     f.DATA_ULTIMA_ALTERACAO, p.NOME_RAZAO, p.NOME_APELIDO_FANTA' +
        'SIA, f.FORNECEDOR_ID,'
      '     f.CNPJ_CPF, f.TIPO, f.IE_IDENTIDADE, f.IM, f.FILIAL'
      
        '     from PESSOA p, FORNECEDOR f where (f.PESSOA_ID = p.PESSOA_I' +
        'D)')
  end
  inherited CDSConsulta: TClientDataSet
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
    object CDSConsultaFORNECEDOR_ID: TIntegerField
      FieldName = 'FORNECEDOR_ID'
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
  end
end
