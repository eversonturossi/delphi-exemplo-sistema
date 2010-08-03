inherited LancamentoNotaEntradaForm: TLancamentoNotaEntradaForm
  Caption = 'LancamentoNotaentradaForm'
  ClientHeight = 583
  ClientWidth = 890
  ExplicitLeft = -61
  ExplicitWidth = 906
  ExplicitHeight = 619
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 564
    ExplicitHeight = 564
    inherited GHPPrincipal: TJvGradientHeaderPanel
      Height = 562
      ExplicitHeight = 562
    end
  end
  inherited SBPrincipal: TStatusBar
    Top = 564
    Width = 890
    ExplicitTop = 564
    ExplicitWidth = 890
  end
  inherited PPrincipal: TPanel
    Width = 733
    Height = 564
    ExplicitWidth = 733
    ExplicitHeight = 564
    object Label1: TLabel
      Left = 52
      Top = 157
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fornecedor:'
    end
    object LBFornecedorNome: TLabel
      Left = 227
      Top = 157
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
    object Label3: TLabel
      Left = 32
      Top = 184
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Transportadora:'
    end
    object LBTransportadoraNome: TLabel
      Left = 227
      Top = 184
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
    object Label6: TLabel
      Left = 8
      Top = 219
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Produto I.D'
    end
    object Label7: TLabel
      Left = 93
      Top = 219
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o'
    end
    object Label8: TLabel
      Left = 472
      Top = 219
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Qtd.'
    end
    object Label9: TLabel
      Left = 551
      Top = 219
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor Unit'#225'rio:'
    end
    object Label10: TLabel
      Left = 630
      Top = 219
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total:'
    end
    object Label11: TLabel
      Left = 8
      Top = 500
      Width = 96
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor do Frete (R$):'
    end
    object DBText3: TDBText
      Left = 298
      Top = 519
      Width = 118
      Height = 25
      DataField = 'VALOR_NOTA'
      DataSource = DSCadastro
      Font.Charset = ANSI_CHARSET
      Font.Color = 6590965
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 298
      Top = 500
      Width = 118
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor dos Produtos (R$):'
    end
    object Label13: TLabel
      Left = 577
      Top = 500
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor da Nota (R$):'
    end
    object DBText4: TDBText
      Left = 577
      Top = 517
      Width = 130
      Height = 25
      DataField = 'VALOR_NOTA'
      DataSource = DSCadastro
      Font.Charset = ANSI_CHARSET
      Font.Color = 6590965
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 376
      Top = 219
      Width = 43
      Height = 13
      Alignment = taRightJustify
      Caption = 'Unidade:'
    end
    object Label15: TLabel
      Left = 29
      Top = 130
      Width = 82
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nota Fiscal (I.D):'
    end
    object EditFornecedor: TJvValidateEdit
      Left = 128
      Top = 154
      Width = 89
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 1
      OnExit = EditFornecedorExit
      OnKeyDown = EditFornecedorKeyDown
    end
    object EditTransportadora: TJvValidateEdit
      Left = 128
      Top = 181
      Width = 89
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 2
      OnExit = EditTransportadoraExit
      OnKeyDown = EditTransportadoraKeyDown
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 731
      Height = 120
      Align = alTop
      TabOrder = 3
      object Label4: TLabel
        Left = 39
        Top = 37
        Width = 71
        Height = 13
        Caption = 'Data Cadastro:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 127
        Top = 37
        Width = 210
        Height = 17
        Hint = 'Data em que o Registro foi Inserido'
        DataField = 'DATA_CADASTRO'
        DataSource = DSCadastro
        Font.Charset = ANSI_CHARSET
        Font.Color = 6590965
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 30
        Top = 58
        Width = 80
        Height = 13
        Caption = #218'ltima Altera'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 127
        Top = 58
        Width = 210
        Height = 17
        Hint = 'Data da '#250'ltima Altera'#231#227'o efetuada no Registro'
        DataField = 'DATA_ULTIMA_ALTERACAO'
        DataSource = DSCadastro
        Font.Charset = ANSI_CHARSET
        Font.Color = 6590965
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 44
        Top = 78
        Width = 66
        Height = 13
        Caption = 'Data Entrada:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBCCancelado: TDBCheckBox
        Left = 127
        Top = 14
        Width = 65
        Height = 17
        TabStop = False
        Caption = 'Cancelado'
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCFinalizado: TDBCheckBox
        Left = 231
        Top = 14
        Width = 65
        Height = 17
        TabStop = False
        Caption = 'Finalizado'
        TabOrder = 1
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object JvDBDateEdit1: TJvDBDateEdit
        Left = 127
        Top = 75
        Width = 121
        Height = 21
        TabStop = False
        DataField = 'DATA_ENTRADA'
        DataSource = DSCadastro
        TabOrder = 2
      end
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 262
      Width = 716
      Height = 229
      DataSource = DSNotaEntradaItem
      FixedColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clDefault
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'FORNECEDOR_ID'
          Title.Caption = 'Fornecedor I.D'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calc_fornecedor_nome'
          Title.Caption = 'Nome / Raz'#227'o Social'
          Width = 370
          Visible = True
        end>
    end
    object EditProduto: TJvValidateEdit
      Left = 8
      Top = 235
      Width = 81
      Height = 21
      TabStop = False
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 5
      OnExit = EditProdutoExit
      OnKeyDown = EditProdutoKeyDown
    end
    object EditDescricao: TEdit
      Left = 93
      Top = 235
      Width = 278
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 6
    end
    object EditQuantidade: TJvValidateEdit
      Left = 472
      Top = 235
      Width = 75
      Height = 21
      TabStop = False
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 7
      OnKeyDown = EditQuantidadeKeyDown
    end
    object EditValorUnitario: TJvValidateEdit
      Left = 551
      Top = 235
      Width = 75
      Height = 21
      TabStop = False
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 8
      OnExit = EditValorUnitarioExit
      OnKeyDown = EditValorUnitarioKeyDown
    end
    object EditTotal: TJvValidateEdit
      Left = 630
      Top = 235
      Width = 94
      Height = 21
      TabStop = False
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      ReadOnly = True
      TabOrder = 9
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 517
      Width = 155
      Height = 28
      TabStop = False
      DataField = 'VALOR_FRETE'
      DataSource = DSCadastro
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnExit = DBEdit1Exit
    end
    object CBUnidade: TComboBox
      Left = 376
      Top = 235
      Width = 91
      Height = 21
      TabOrder = 11
      TabStop = False
      Text = 'CBUnidade'
      OnKeyDown = CBUnidadeKeyDown
    end
    object EditNotaFiscal: TJvValidateEdit
      Left = 128
      Top = 127
      Width = 89
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 0
      OnExit = EditNotaFiscalExit
      OnKeyDown = EditNotaFiscalKeyDown
    end
  end
  inherited qryCadastro: TSQLQuery
    SQL.Strings = (
      'select * from nota_entrada where nota_entrada_id = 0')
  end
  inherited CDSCadastro: TClientDataSet
    object CDSCadastroNOTA_ENTRADA_ID: TIntegerField
      FieldName = 'NOTA_ENTRADA_ID'
      DisplayFormat = '0000000000'
    end
    object CDSCadastroEMPRESA_ID: TIntegerField
      FieldName = 'EMPRESA_ID'
    end
    object CDSCadastroFORNECEDOR_ID: TIntegerField
      FieldName = 'FORNECEDOR_ID'
      DisplayFormat = '0000000000'
    end
    object CDSCadastroDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object CDSCadastroDATA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
    end
    object CDSCadastroDATA_ENTRADA: TSQLTimeStampField
      FieldName = 'DATA_ENTRADA'
    end
    object CDSCadastroTRANSPORTADORA_ID: TIntegerField
      FieldName = 'TRANSPORTADORA_ID'
      DisplayFormat = '0000000000'
    end
    object CDSCadastroCANCELADO: TSmallintField
      FieldName = 'CANCELADO'
    end
    object CDSCadastroVALOR_FRETE: TFloatField
      FieldName = 'VALOR_FRETE'
      DisplayFormat = ',0.00'
    end
    object CDSCadastroVALOR_PRODUTOS: TFloatField
      FieldName = 'VALOR_PRODUTOS'
      DisplayFormat = ',0.00'
    end
    object CDSCadastroVALOR_NOTA: TFloatField
      FieldName = 'VALOR_NOTA'
      DisplayFormat = ',0.00'
    end
    object CDSCadastroFINALIZADO: TSmallintField
      FieldName = 'FINALIZADO'
    end
  end
  inherited ApplicationEvents: TApplicationEvents
    Left = 786
    Top = 0
  end
  object DSNotaEntradaItem: TDataSource
    DataSet = CDSNotaEntradaItem
    Left = 472
    Top = 400
  end
  object CDSNotaEntradaItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPNotaEntradaItem'
    OnCalcFields = CDSNotaEntradaItemCalcFields
    Left = 472
    Top = 354
    object CDSNotaEntradaItemNOTA_ENTRADA_ITEM_ID: TIntegerField
      FieldName = 'NOTA_ENTRADA_ITEM_ID'
    end
    object CDSNotaEntradaItemNOTA_ENTRADA_ID: TIntegerField
      FieldName = 'NOTA_ENTRADA_ID'
    end
    object CDSNotaEntradaItemPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
      DisplayFormat = '0000000000'
    end
    object CDSNotaEntradaItemVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
      DisplayFormat = ',0.00'
    end
    object CDSNotaEntradaItemQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      DisplayFormat = ',0.00'
    end
    object CDSNotaEntradaItemcalc_total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_total'
      Calculated = True
    end
    object CDSNotaEntradaItemUNIDADE_ID: TIntegerField
      FieldName = 'UNIDADE_ID'
    end
    object CDSNotaEntradaItemcalc_unidade_descricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_unidade_descricao'
      Calculated = True
    end
  end
  object DSPNotaEntradaItem: TDataSetProvider
    DataSet = qryNotaEntradaItem
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 472
    Top = 308
  end
  object qryNotaEntradaItem: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from nota_entrada_item where nota_entrada_item_id = 0')
    SQLConnection = BancoDados.Conexao
    Left = 472
    Top = 264
  end
  object PopupMenu1: TPopupMenu
    Left = 787
    Top = 45
    object ExcluirItem1: TMenuItem
      Caption = 'Excluir Item'
      OnClick = ExcluirItem1Click
    end
  end
end
