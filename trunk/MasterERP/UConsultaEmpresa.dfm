inherited ConsultaEmpresaForm: TConsultaEmpresaForm
  Caption = 'ConsultaEmpresaForm'
  ClientHeight = 510
  ClientWidth = 844
  ExplicitWidth = 850
  ExplicitHeight = 536
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 491
    ExplicitHeight = 491
    inherited JvGradientHeaderPanel1: TJvGradientHeaderPanel
      Height = 489
      ExplicitHeight = 489
      inherited BTNovo: TSpeedButton
        OnClick = BTNovoClick
      end
    end
  end
  inherited Panel2: TPanel
    Width = 685
    Height = 491
    ExplicitWidth = 685
    ExplicitHeight = 491
    inherited DBGrid1: TDBGrid
      Width = 683
      Height = 393
      Columns = <
        item
          Expanded = False
          FieldName = 'EMPRESA_ID'
          Title.Caption = 'Empresa I.D'
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ATIVO'
          Title.Caption = 'Ativa'
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
      Width = 683
      ExplicitWidth = 683
      inherited BTPesquisar: TSpeedButton
        OnClick = BTPesquisarClick
      end
      inherited CBCriterio: TComboBox
        Items.Strings = (
          '<selecione>'
          'Empresa I.D'
          'Nome/Raz'#227'o'
          'Apelido/Nome Fantasia')
      end
      inherited EditValor: TEdit
        OnKeyPress = EditValorKeyPress
      end
    end
  end
  inherited SBPrincipal: TStatusBar
    Top = 491
    Width = 844
    ExplicitTop = 491
    ExplicitWidth = 844
  end
  inherited qryConsulta: TSQLQuery
    SQL.Strings = (
      'select p.PESSOA_ID, e.ATIVO, e.DATA_CADASTRO,'
      
        '     e.DATA_ULTIMA_ALTERACAO, p.NOME_RAZAO, p.NOME_APELIDO_FANTA' +
        'SIA, e.EMPRESA_ID,'
      '     e.CNPJ_CPF, e.TIPO, e.IE_IDENTIDADE, e.IM, e.FILIAL'
      '     from PESSOA p, EMPRESA e where (e.PESSOA_ID = p.PESSOA_ID)')
  end
  inherited CDSConsulta: TClientDataSet
    OnCalcFields = CDSConsultaCalcFields
    object CDSConsultacalc_tipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tipo'
      Calculated = True
    end
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
    object CDSConsultaNOME_APELIDO_FANTASIA: TStringField
      FieldName = 'NOME_APELIDO_FANTASIA'
      Size = 60
    end
    object CDSConsultaEMPRESA_ID: TIntegerField
      FieldName = 'EMPRESA_ID'
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
    object CDSConsultaFILIAL: TSmallintField
      FieldName = 'FILIAL'
    end
    object CDSConsultaIM: TStringField
      FieldName = 'IM'
      Size = 25
    end
    object CDSConsultaNOME_RAZAO: TStringField
      FieldName = 'NOME_RAZAO'
      Size = 60
    end
  end
end
