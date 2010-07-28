inherited ConsultaFornecedorForm: TConsultaFornecedorForm
  Caption = 'ConsultaFornecedorForm'
  ClientHeight = 511
  ExplicitWidth = 854
  ExplicitHeight = 537
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 492
    ExplicitHeight = 490
    inherited JvGradientHeaderPanel1: TJvGradientHeaderPanel
      Height = 490
      ExplicitHeight = 488
      inherited BTNovo: TSpeedButton
        OnClick = BTNovoClick
      end
    end
  end
  inherited Panel2: TPanel
    Height = 492
    ExplicitHeight = 490
    inherited DBGrid1: TDBGrid
      Height = 394
      Columns = <
        item
          Expanded = False
          FieldName = 'FORNECEDOR_ID'
          Title.Caption = 'Fornecedor I.D'
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ATIVO'
          Title.Caption = 'Ativo'
          Width = 60
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'FILIAL'
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
          FieldName = 'calc_tipo'
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
    inherited Panel3: TPanel
      inherited BTPesquisar: TSpeedButton
        OnClick = BTPesquisarClick
      end
      inherited EditValor: TEdit
        OnKeyPress = EditValorKeyPress
      end
    end
  end
  inherited SBPrincipal: TStatusBar
    Top = 492
    ExplicitTop = 490
    ExplicitWidth = 0
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
    object CDSConsultaFORNECEDOR_ID: TIntegerField
      FieldName = 'FORNECEDOR_ID'
      Required = True
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
