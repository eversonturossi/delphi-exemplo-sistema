inherited ControlePedidoForm: TControlePedidoForm
  Caption = 'ControlePedidoForm'
  ClientHeight = 514
  ClientWidth = 908
  ExplicitTop = -5
  ExplicitWidth = 924
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 495
    inherited GHPPrincipal: TJvGradientHeaderPanel
      Height = 493
    end
  end
  inherited SBPrincipal: TStatusBar
    Top = 495
    Width = 908
    ExplicitTop = -19
    ExplicitWidth = 908
  end
  inherited Panel2: TPanel
    Width = 749
    Height = 495
    ExplicitWidth = 749
    inherited DBGrid1: TDBGrid
      Top = 164
      Width = 747
      Height = 330
      Columns = <
        item
          Expanded = False
          FieldName = 'PEDIDO_ID'
          Title.Caption = 'Pedido I.D'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calc_cliente_nome'
          Title.Caption = 'Cliente'
          Width = 350
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calc_vendedor_nome'
          Title.Caption = 'Vendedor'
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
          FieldName = 'DATA_LANCAMENTO'
          Title.Caption = 'Data Lan'#231'amento'
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
          Alignment = taCenter
          Expanded = False
          FieldName = 'CANCELADO'
          Title.Caption = 'Cancelado'
          Width = 60
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'FINALIZADO'
          Title.Caption = 'Finalizado'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACRESCIMO'
          Title.Caption = 'Acr'#233'scimos (R$)'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCONTO'
          Title.Caption = 'Desconto (R$)'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUBTOTAL'
          Title.Caption = 'SubTotal (R$)'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calc_total'
          Title.Caption = 'Total (R$)'
          Width = 100
          Visible = True
        end>
    end
    inherited Panel3: TPanel
      Width = 747
      Height = 163
      ExplicitWidth = 747
      ExplicitHeight = 163
      object Label5: TLabel
        Left = 56
        Top = 16
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'Pedido I.D:'
      end
      object Label1: TLabel
        Left = 73
        Top = 44
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cliente:'
      end
      object BTCliente: TSpeedButton
        Left = 220
        Top = 40
        Width = 23
        Height = 22
      end
      object LBClienteNome: TLabel
        Left = 255
        Top = 44
        Width = 241
        Height = 13
        AutoSize = False
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6590965
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 60
        Top = 71
        Width = 50
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vendedor:'
      end
      object BTVendedor: TSpeedButton
        Left = 220
        Top = 67
        Width = 23
        Height = 22
      end
      object LBVendedorNome: TLabel
        Left = 255
        Top = 71
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
      object BTPesquisar: TSpeedButton
        Left = 513
        Top = 120
        Width = 130
        Height = 30
        Hint = 'Pesquisar Registros'
        Caption = 'Pesquisar'
      end
      object EditPedido: TJvValidateEdit
        Left = 132
        Top = 13
        Width = 89
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        TabOrder = 0
        ZeroEmpty = True
      end
      object EditCliente: TJvValidateEdit
        Left = 132
        Top = 41
        Width = 89
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        TabOrder = 1
        ZeroEmpty = True
      end
      object EditVendedor: TJvValidateEdit
        Left = 132
        Top = 68
        Width = 89
        Height = 21
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        TabOrder = 2
        ZeroEmpty = True
      end
      object GroupBox1: TGroupBox
        Left = 132
        Top = 98
        Width = 341
        Height = 52
        TabOrder = 3
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
      object CHPeriodo: TCheckBox
        Left = 144
        Top = 90
        Width = 57
        Height = 17
        Caption = 'Per'#237'odo'
        TabOrder = 4
      end
      object RGCondicao: TRadioGroup
        Left = 513
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
    end
  end
  inherited qryConsulta: TSQLQuery
    SQL.Strings = (
      'select * from pedido where pedido_id = 0')
  end
  inherited CDSConsulta: TClientDataSet
    OnCalcFields = CDSConsultaCalcFields
    object CDSConsultaPEDIDO_ID: TIntegerField
      FieldName = 'PEDIDO_ID'
      DisplayFormat = '0000000000'
    end
    object CDSConsultaDATA_LANCAMENTO: TSQLTimeStampField
      FieldName = 'DATA_LANCAMENTO'
    end
    object CDSConsultaCANCELADO: TSmallintField
      FieldName = 'CANCELADO'
    end
    object CDSConsultaCLIENTE_ID: TIntegerField
      FieldName = 'CLIENTE_ID'
    end
    object CDSConsultaACRESCIMO: TFloatField
      FieldName = 'ACRESCIMO'
    end
    object CDSConsultaDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object CDSConsultaSUBTOTAL: TFloatField
      FieldName = 'SUBTOTAL'
    end
    object CDSConsultacalc_cliente_nome: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_cliente_nome'
      Size = 60
      Calculated = True
    end
    object CDSConsultacalc_vendedor_nome: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_vendedor_nome'
      Size = 60
      Calculated = True
    end
    object CDSConsultaDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object CDSConsultaDATA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
    end
    object CDSConsultaEMPRESA_ID: TIntegerField
      FieldName = 'EMPRESA_ID'
    end
    object CDSConsultaFINALIZADO: TSmallintField
      FieldName = 'FINALIZADO'
    end
    object CDSConsultacalc_total: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'calc_total'
      Calculated = True
    end
    object CDSConsultaVENDEDOR_ID: TIntegerField
      FieldName = 'VENDEDOR_ID'
    end
  end
end
