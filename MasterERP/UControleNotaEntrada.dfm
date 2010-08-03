inherited ControleNotaEntradaForm: TControleNotaEntradaForm
  Caption = 'ControleNotaEntradaForm'
  ClientWidth = 934
  ExplicitLeft = -20
  ExplicitWidth = 950
  ExplicitHeight = 551
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited GHPPrincipal: TJvGradientHeaderPanel
      inherited BTNovo: TSpeedButton
        OnClick = BTNovoClick
      end
    end
  end
  inherited SBPrincipal: TStatusBar
    Width = 934
  end
  inherited Panel2: TPanel
    Width = 775
    inherited DBGrid1: TDBGrid
      Top = 153
      Width = 773
      Height = 342
      Columns = <
        item
          Expanded = False
          FieldName = 'NOTA_ENTRADA_ID'
          Title.Caption = 'NotaEntrada I.D'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calc_fornecedor_nome'
          Title.Caption = 'Fornecedor'
          Width = 350
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calc_transportadora_nome'
          Title.Caption = 'Transportadora'
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
          FieldName = 'DATA_ENTRADA'
          Title.Caption = 'Data Entrada'
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
          FieldName = 'CANCELADO'
          Title.Caption = 'Cancelada'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FINALIZADO'
          Title.Caption = 'Finalizada'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_FRETE'
          Title.Caption = 'Valor Frete (R$)'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_PRODUTOS'
          Title.Caption = 'Valor Produtos (R$)'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_NOTA'
          Title.Caption = 'Valor Nota (R$)'
          Width = 100
          Visible = True
        end>
    end
    inherited Panel3: TPanel
      Width = 773
      Height = 152
      ExplicitWidth = 773
      ExplicitHeight = 152
      object Label1: TLabel
        Left = 31
        Top = 39
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fornecedor:'
      end
      object LBFornecedorNome: TLabel
        Left = 235
        Top = 39
        Width = 241
        Height = 13
        AutoSize = False
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6590965
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object BTFornecedor: TSpeedButton
        Left = 200
        Top = 35
        Width = 23
        Height = 22
        OnClick = BTFornecedorClick
      end
      object Label3: TLabel
        Left = 11
        Top = 66
        Width = 79
        Height = 13
        Alignment = taRightJustify
        Caption = 'Transportadora:'
      end
      object LBTransportadoraNome: TLabel
        Left = 235
        Top = 66
        Width = 241
        Height = 13
        AutoSize = False
        Caption = 'Transportadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6590965
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object BTTransportadora: TSpeedButton
        Left = 200
        Top = 62
        Width = 23
        Height = 22
        OnClick = BTTransportadoraClick
      end
      object BTPesquisar: TSpeedButton
        Left = 504
        Top = 115
        Width = 130
        Height = 30
        Hint = 'Pesquisar Registros'
        Caption = 'Pesquisar'
        OnClick = BTPesquisarClick
      end
      object Label5: TLabel
        Left = 8
        Top = 11
        Width = 82
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nota Fiscal (I.D):'
      end
      object GroupBox1: TGroupBox
        Left = 112
        Top = 93
        Width = 341
        Height = 52
        TabOrder = 4
        object Label2: TLabel
          Left = 20
          Top = 20
          Width = 29
          Height = 13
          Caption = 'In'#237'cio:'
        end
        object Label4: TLabel
          Left = 186
          Top = 20
          Width = 26
          Height = 13
          Caption = 'Final:'
        end
        object EditDe: TJvDateEdit
          Left = 57
          Top = 17
          Width = 105
          Height = 21
          Enabled = False
          TabOrder = 0
        end
        object EditAte: TJvDateEdit
          Left = 221
          Top = 17
          Width = 105
          Height = 21
          Enabled = False
          TabOrder = 1
        end
      end
      object EditFornecedor: TJvValidateEdit
        Left = 112
        Top = 36
        Width = 89
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        TabOrder = 0
      end
      object EditTransportadora: TJvValidateEdit
        Left = 112
        Top = 63
        Width = 89
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        TabOrder = 1
      end
      object RGCondicao: TRadioGroup
        Left = 504
        Top = 8
        Width = 185
        Height = 53
        Caption = 'Condi'#231#227'o'
        Columns = 2
        Items.Strings = (
          'Cancelada'
          'Finalizada')
        TabOrder = 2
      end
      object CHPeriodo: TCheckBox
        Left = 120
        Top = 85
        Width = 57
        Height = 17
        Caption = 'Per'#237'odo'
        TabOrder = 3
      end
      object EditNotaFiscal: TJvValidateEdit
        Left = 112
        Top = 8
        Width = 89
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        TabOrder = 5
      end
    end
  end
  inherited qryConsulta: TSQLQuery
    SQL.Strings = (
      'select * from nota_entrada where nota_entrada_id = 0')
  end
  inherited CDSConsulta: TClientDataSet
    OnCalcFields = CDSConsultaCalcFields
    object CDSConsultaNOTA_ENTRADA_ID: TIntegerField
      FieldName = 'NOTA_ENTRADA_ID'
      DisplayFormat = '0000000000'
    end
    object CDSConsultaEMPRESA_ID: TIntegerField
      FieldName = 'EMPRESA_ID'
    end
    object CDSConsultaFORNECEDOR_ID: TIntegerField
      FieldName = 'FORNECEDOR_ID'
      DisplayFormat = '0000000000'
    end
    object CDSConsultaDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object CDSConsultaDATA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
    end
    object CDSConsultaDATA_ENTRADA: TSQLTimeStampField
      FieldName = 'DATA_ENTRADA'
    end
    object CDSConsultaTRANSPORTADORA_ID: TIntegerField
      FieldName = 'TRANSPORTADORA_ID'
      DisplayFormat = '0000000000'
    end
    object CDSConsultaCANCELADO: TSmallintField
      FieldName = 'CANCELADO'
    end
    object CDSConsultaVALOR_FRETE: TFloatField
      FieldName = 'VALOR_FRETE'
      DisplayFormat = ',0.00'
    end
    object CDSConsultaVALOR_PRODUTOS: TFloatField
      FieldName = 'VALOR_PRODUTOS'
      DisplayFormat = ',0.00'
    end
    object CDSConsultaVALOR_NOTA: TFloatField
      FieldName = 'VALOR_NOTA'
      DisplayFormat = ',0.00'
    end
    object CDSConsultaFINALIZADO: TSmallintField
      FieldName = 'FINALIZADO'
    end
    object CDSConsultacalc_fornecedor_nome: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_fornecedor_nome'
      Size = 60
      Calculated = True
    end
    object CDSConsultacalc_transportadora_nome: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_transportadora_nome'
      Size = 60
      Calculated = True
    end
  end
end
