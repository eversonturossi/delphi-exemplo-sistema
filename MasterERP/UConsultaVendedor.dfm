inherited ConsultaVendedorForm: TConsultaVendedorForm
  Caption = 'ConsultaVendedorForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited DBGrid1: TDBGrid
      Top = 129
      Height = 359
    end
    inherited Panel3: TPanel
      Height = 128
      ExplicitHeight = 128
      inherited Label3: TLabel
        Top = 96
        ExplicitTop = 96
      end
      inherited BTPesquisar: TSpeedButton
        Top = 89
        OnClick = BTPesquisarClick
        ExplicitTop = 89
      end
      object Label5: TLabel [5]
        Left = 41
        Top = 68
        Width = 39
        Height = 13
        Caption = 'Fun'#231#227'o:'
      end
      inherited EditValor: TEdit
        Top = 93
        TabOrder = 3
        ExplicitTop = 93
      end
      inherited CBSituacao: TComboBox
        TabOrder = 4
      end
      object CBFuncao: TComboBox
        Left = 97
        Top = 65
        Width = 145
        Height = 22
        Hint = 'Fun'#231#227'o do Vendedor'
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 2
        Text = '<selecione>'
        OnSelect = CBCondicaoSelect
        Items.Strings = (
          '<selecione>')
      end
    end
  end
  inherited qryConsulta: TSQLQuery
    SQL.Strings = (
      'select * from vendedor where vendedor_id = 0')
  end
  inherited CDSConsulta: TClientDataSet
    OnCalcFields = CDSConsultaCalcFields
    object CDSConsultaVENDEDOR_ID: TIntegerField
      FieldName = 'VENDEDOR_ID'
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
    object CDSConsultaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object CDSConsultaVENDEDOR_FUNCAO_ID: TIntegerField
      FieldName = 'VENDEDOR_FUNCAO_ID'
    end
    object CDSConsultaCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
      DisplayFormat = ',0.00'
    end
    object CDSConsultaLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 25
    end
    object CDSConsultaSENHA: TStringField
      FieldName = 'SENHA'
      EditMask = '********;1;_'
      Size = 8
    end
    object CDSConsultacalc_vendedor_funcao_descricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_vendedor_funcao_descricao'
      Size = 60
      Calculated = True
    end
  end
end
