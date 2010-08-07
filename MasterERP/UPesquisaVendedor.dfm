inherited PesquisaVendedorForm: TPesquisaVendedorForm
  Caption = 'PesquisaVendedorForm'
  ExplicitWidth = 843
  ExplicitHeight = 480
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited Panel3: TPanel
      Height = 128
      ExplicitHeight = 128
      inherited Label3: TLabel
        Top = 96
        ExplicitTop = 96
      end
      object Label5: TLabel [4]
        Left = 28
        Top = 68
        Width = 39
        Height = 13
        Caption = 'Fun'#231#227'o:'
      end
      inherited CBCriterio: TComboBox
        Items.Strings = (
          '<selecione>'
          'Vendedor I.D'
          'Nome'
          'Login')
      end
      inherited EditValor: TEdit
        Top = 93
        TabOrder = 4
        OnChange = EditValorChange
        ExplicitTop = 93
      end
      object CBFuncao: TComboBox
        Left = 84
        Top = 65
        Width = 145
        Height = 22
        Hint = 'Fun'#231#227'o do Vendedor'
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 3
        Text = '<selecione>'
        OnSelect = CBCondicaoSelect
        Items.Strings = (
          '<selecione>')
      end
    end
    inherited DBGrid1: TDBGrid
      Top = 129
      Height = 295
      Columns = <
        item
          Expanded = False
          FieldName = 'VENDEDOR_ID'
          Title.Caption = 'Vendedor I.D'
          Width = 90
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
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 350
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOGIN'
          Title.Caption = 'Login'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SENHA'
          Title.Caption = 'Senha'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calc_vendedor_funcao_descricao'
          Title.Caption = 'Fun'#231#227'o'
          Width = 350
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_CADASTRO'
          Title.Caption = 'Data Cadastro'
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
          FieldName = 'COMISSAO'
          Title.Caption = 'Comiss'#227'o (%)'
          Width = 80
          Visible = True
        end>
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
