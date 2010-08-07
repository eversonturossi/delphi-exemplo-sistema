inherited LancamentoPedidoForm: TLancamentoPedidoForm
  Caption = 'LancamentoPedidoForm'
  ClientHeight = 589
  ClientWidth = 890
  ExplicitLeft = -94
  ExplicitTop = -80
  ExplicitWidth = 906
  ExplicitHeight = 625
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 570
    inherited GHPPrincipal: TJvGradientHeaderPanel
      Height = 568
    end
  end
  inherited SBPrincipal: TStatusBar
    Top = 570
    Width = 890
  end
  inherited PPrincipal: TPanel
    Width = 733
    Height = 570
    object Label16: TLabel
      Left = 58
      Top = 114
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pedido I.D:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 74
      Top = 141
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente:'
    end
    object LBClienteNome: TLabel
      Left = 237
      Top = 141
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
      Left = 61
      Top = 168
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor:'
    end
    object LBVendedorNome: TLabel
      Left = 237
      Top = 168
      Width = 241
      Height = 13
      AutoSize = False
      Caption = 'Vendedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6590965
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 196
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Produto I.D'
    end
    object Label7: TLabel
      Left = 93
      Top = 196
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o'
    end
    object Label14: TLabel
      Left = 376
      Top = 196
      Width = 43
      Height = 13
      Alignment = taRightJustify
      Caption = 'Unidade:'
    end
    object Label8: TLabel
      Left = 472
      Top = 196
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Qtd.'
    end
    object Label9: TLabel
      Left = 551
      Top = 196
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor Unit'#225'rio:'
    end
    object Label10: TLabel
      Left = 630
      Top = 196
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total:'
    end
    object Label11: TLabel
      Left = 8
      Top = 515
      Width = 100
      Height = 13
      Alignment = taRightJustify
      Caption = '(+) Acr'#233'scimos (R$):'
    end
    object Label12: TLabel
      Left = 304
      Top = 515
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = '(-) Descontos (R$):'
    end
    object Label13: TLabel
      Left = 606
      Top = 475
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'SubTotal (R$):'
    end
    object DBTextSubTotal: TDBText
      Left = 606
      Top = 487
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
    object Label15: TLabel
      Left = 606
      Top = 519
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total (R$):'
    end
    object DBTextTotal: TDBText
      Left = 606
      Top = 532
      Width = 118
      Height = 25
      DataField = 'VALOR_NOTA'
      DataSource = DSCadastro
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 731
      Height = 103
      Align = alTop
      TabOrder = 0
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
      object DBTextDataCadastro: TDBText
        Left = 127
        Top = 37
        Width = 210
        Height = 17
        Hint = 'Data/Hora em que foi efetuado o Cadastro'
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
      object DBTextUltimaAlteracao: TDBText
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
      object EditaDataEntrada: TJvDBDateEdit
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
    object DBEditCodigo: TDBEdit
      Left = 128
      Top = 111
      Width = 94
      Height = 21
      TabStop = False
      Color = clScrollBar
      DataField = 'NOTA_ENTRADA_ID'
      DataSource = DSCadastro
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object EditCliente: TJvValidateEdit
      Left = 128
      Top = 138
      Width = 94
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 2
      ZeroEmpty = True
    end
    object EditVendedor: TJvValidateEdit
      Left = 128
      Top = 165
      Width = 94
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 3
      ZeroEmpty = True
    end
    object EditProduto: TJvValidateEdit
      Left = 8
      Top = 212
      Width = 81
      Height = 21
      TabStop = False
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      TabOrder = 4
    end
    object EditDescricao: TEdit
      Left = 93
      Top = 212
      Width = 278
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 5
    end
    object CBUnidade: TComboBox
      Left = 376
      Top = 212
      Width = 91
      Height = 21
      TabOrder = 6
      TabStop = False
      Text = 'CBUnidade'
    end
    object EditQuantidade: TJvValidateEdit
      Left = 472
      Top = 212
      Width = 75
      Height = 21
      TabStop = False
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 7
    end
    object EditValorUnitario: TJvValidateEdit
      Left = 551
      Top = 212
      Width = 75
      Height = 21
      TabStop = False
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 8
    end
    object EditTotal: TJvValidateEdit
      Left = 630
      Top = 212
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
    object DBGrid1: TDBGrid
      Left = 8
      Top = 240
      Width = 716
      Height = 227
      FixedColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clDefault
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
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
    object DBEditAcrescimo: TDBEdit
      Left = 8
      Top = 532
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
      TabOrder = 11
    end
    object DBEditDesconto: TDBEdit
      Left = 304
      Top = 532
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
      TabOrder = 12
    end
  end
end
