inherited ControleNotaEntradaForm: TControleNotaEntradaForm
  Caption = 'ControleNotaEntradaForm'
  ClientHeight = 516
  ClientWidth = 934
  ExplicitWidth = 950
  ExplicitHeight = 552
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 497
    ExplicitHeight = 497
    inherited GHPPrincipal: TJvGradientHeaderPanel
      Height = 495
      ExplicitHeight = 495
      inherited BTNovo: TSpeedButton
        OnClick = BTNovoClick
      end
    end
  end
  inherited SBPrincipal: TStatusBar
    Top = 497
    Width = 934
    ExplicitTop = 497
    ExplicitWidth = 934
  end
  inherited Panel2: TPanel
    Width = 775
    Height = 497
    ExplicitWidth = 775
    ExplicitHeight = 497
    inherited DBGrid1: TDBGrid
      Top = 190
      Width = 773
      Height = 306
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
          FieldName = 'NOTA_FISCAL'
          Title.Caption = 'Nota Fiscal'
          Width = 100
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
      Height = 189
      ExplicitWidth = 773
      ExplicitHeight = 189
      object Label1: TLabel
        Left = 55
        Top = 71
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fornecedor:'
      end
      object LBFornecedorNome: TLabel
        Left = 259
        Top = 71
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
        Left = 224
        Top = 67
        Width = 23
        Height = 22
        OnClick = BTFornecedorClick
      end
      object Label3: TLabel
        Left = 35
        Top = 98
        Width = 79
        Height = 13
        Alignment = taRightJustify
        Caption = 'Transportadora:'
      end
      object LBTransportadoraNome: TLabel
        Left = 259
        Top = 98
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
        Left = 224
        Top = 94
        Width = 23
        Height = 22
        OnClick = BTTransportadoraClick
      end
      object BTPesquisar: TSpeedButton
        Left = 506
        Top = 147
        Width = 130
        Height = 30
        Hint = 'Pesquisar Registros'
        Caption = 'Pesquisar'
        OnClick = BTPesquisarClick
      end
      object Label5: TLabel
        Left = 58
        Top = 43
        Width = 56
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nota Fiscal:'
      end
      object Label6: TLabel
        Left = 28
        Top = 16
        Width = 86
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nota Entrada I.D:'
      end
      object GroupBox1: TGroupBox
        Left = 136
        Top = 125
        Width = 341
        Height = 52
        TabOrder = 6
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
        Left = 136
        Top = 68
        Width = 89
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        TabOrder = 2
        ZeroEmpty = True
      end
      object EditTransportadora: TJvValidateEdit
        Left = 136
        Top = 95
        Width = 89
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        TabOrder = 3
        ZeroEmpty = True
      end
      object RGCondicao: TRadioGroup
        Left = 506
        Top = 13
        Width = 185
        Height = 53
        Caption = 'Condi'#231#227'o'
        Columns = 2
        Items.Strings = (
          'Cancelada'
          'Finalizada')
        TabOrder = 5
      end
      object CHPeriodo: TCheckBox
        Left = 144
        Top = 117
        Width = 57
        Height = 17
        Caption = 'Per'#237'odo'
        TabOrder = 4
        OnClick = CHPeriodoClick
      end
      object EditNotaFiscal: TJvValidateEdit
        Left = 136
        Top = 40
        Width = 89
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        TabOrder = 1
        ZeroEmpty = True
      end
      object EditNotaEntrada: TJvValidateEdit
        Left = 136
        Top = 13
        Width = 89
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        TabOrder = 0
        ZeroEmpty = True
      end
    end
  end
  inherited qryConsulta: TSQLQuery
    SQL.Strings = (
      'select * from nota_entrada where nota_entrada_id = 0')
    Left = 256
    Top = 232
  end
  inherited PopupMenu1: TPopupMenu
    Left = 292
    Top = 232
  end
  inherited qryExportar: TSQLQuery
    Left = 330
    Top = 233
  end
  inherited DSPConsulta: TDataSetProvider
    Left = 256
    Top = 280
  end
  inherited qryCsExibirColuna: TSQLQuery
    Left = 295
    Top = 280
  end
  inherited DSPExportar: TDataSetProvider
    Left = 330
    Top = 280
  end
  inherited CDSConsulta: TClientDataSet
    OnCalcFields = CDSConsultaCalcFields
    Left = 256
    Top = 327
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
    object CDSConsultaNOTA_FISCAL: TIntegerField
      FieldName = 'NOTA_FISCAL'
      DisplayFormat = '0000000000'
    end
  end
  inherited ApplicationEvents: TApplicationEvents
    Left = 295
    Top = 327
  end
  inherited CDSExportar: TClientDataSet
    Left = 331
    Top = 325
  end
  inherited DSConsulta: TDataSource
    Left = 256
    Top = 374
  end
  inherited qryControleAcesso: TSQLQuery
    Left = 294
    Top = 374
  end
  inherited ActionList: TActionList
    Left = 336
    Top = 374
  end
end
