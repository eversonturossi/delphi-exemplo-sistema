inherited ConsultaFornecedorForm: TConsultaFornecedorForm
  Caption = 'ConsultaFornecedorForm'
  ClientHeight = 507
  ExplicitWidth = 854
  ExplicitHeight = 533
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 488
    ExplicitHeight = 488
    inherited GHPPrincipal: TJvGradientHeaderPanel
      Height = 486
      ExplicitHeight = 486
      inherited BTNovo: TSpeedButton
        OnClick = BTNovoClick
      end
    end
  end
  inherited Panel2: TPanel
    Height = 488
    ExplicitHeight = 488
    inherited DBGrid1: TDBGrid
      Height = 390
      Columns = <
        item
          Expanded = False
          FieldName = 'FORNECEDOR_ID'
          Title.Caption = 'Fornecedor I.D'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ATIVO'
          Title.Caption = 'Ativo'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 60
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'calc_filial'
          Title.Caption = 'Filial'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_RAZAO'
          Title.Caption = 'Nome / Raz'#227'o Social'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 350
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_APELIDO_FANTASIA'
          Title.Caption = 'Apelido / Nome Fantasia'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 350
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_CADASTRO'
          Title.Caption = 'Data Cadastro / Data Abertura'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_ULTIMA_ALTERACAO'
          Title.Caption = #218'ltima Altera'#231#227'o'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calc_tipo'
          Title.Caption = 'Tipo'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNPJ_CPF'
          Title.Caption = 'CPF / CNPJ'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IE_IDENTIDADE'
          Title.Caption = 'Identidade / Inscri'#231#227'o Estadual'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IM'
          Title.Caption = 'Inscri'#231#227'o Municipal'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
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
    Top = 488
    ExplicitTop = 488
    ExplicitWidth = 0
  end
  inherited qryConsulta: TSQLQuery
    SQL.Strings = (
      'select p.PESSOA_ID, f.ATIVO, f.DATA_CADASTRO,'
      
        '     f.DATA_ULTIMA_ALTERACAO, p.NOME_RAZAO, p.NOME_APELIDO_FANTA' +
        'SIA, f.FORNECEDOR_ID,'
      '     f.CNPJ_CPF, f.TIPO, f.IE_IDENTIDADE, f.IM, f.EMPRESA_ID'
      
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
    object CDSConsultacalc_tipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tipo'
      Calculated = True
    end
    object CDSConsultaEMPRESA_ID: TIntegerField
      FieldName = 'EMPRESA_ID'
    end
    object CDSConsultacalc_filial: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'calc_filial'
      Calculated = True
    end
  end
end
