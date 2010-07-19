object FinalizadoraForm: TFinalizadoraForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FinalizadoraForm'
  ClientHeight = 481
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 121
    Top = 0
    Width = 741
    Height = 462
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 469
      Top = 8
      Width = 118
      Height = 20
      Caption = 'SubTotal (R$):'
      Font.Charset = ANSI_CHARSET
      Font.Color = 6590965
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape2: TShape
      Left = 469
      Top = 32
      Width = 204
      Height = 50
      Pen.Color = 11114608
      Shape = stRoundRect
    end
    object Label2: TLabel
      Left = 469
      Top = 238
      Width = 131
      Height = 20
      Caption = 'Valor '#224' Receber'
      Font.Charset = ANSI_CHARSET
      Font.Color = 6590965
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape1: TShape
      Left = 469
      Top = 260
      Width = 204
      Height = 50
      Pen.Color = 11114608
      Shape = stRoundRect
    end
    object Label3: TLabel
      Left = 469
      Top = 314
      Width = 92
      Height = 20
      Caption = 'Descontos:'
      Font.Charset = ANSI_CHARSET
      Font.Color = 6590965
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape3: TShape
      Left = 469
      Top = 336
      Width = 204
      Height = 50
      Pen.Color = 11114608
      Shape = stRoundRect
    end
    object Label4: TLabel
      Left = 469
      Top = 86
      Width = 86
      Height = 20
      Caption = 'Total (R$):'
      Font.Charset = ANSI_CHARSET
      Font.Color = 6590965
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape4: TShape
      Left = 469
      Top = 108
      Width = 204
      Height = 50
      Pen.Color = 11114608
      Shape = stRoundRect
    end
    object LBTipoDesconto: TLabel
      Left = 680
      Top = 350
      Width = 54
      Height = 20
      Caption = 'R$ (F2)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 469
      Top = 165
      Width = 178
      Height = 20
      Caption = 'Forma de Pagamento:'
      Font.Charset = ANSI_CHARSET
      Font.Color = 6590965
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel3: TPanel
      Left = 1
      Top = 388
      Width = 739
      Height = 73
      Align = alBottom
      TabOrder = 0
      object BTCancelar: TSpeedButton
        Left = 596
        Top = 5
        Width = 140
        Height = 63
        Hint = 'Cancelar fechamento de Venda (F4)'
        Caption = 'Cancelar (F4)'
        Layout = blGlyphTop
        OnClick = BTCancelarClick
      end
      object BTExcluirNegociacao: TSpeedButton
        Left = 453
        Top = 5
        Width = 140
        Height = 63
        Hint = 'Excluir Negociacao (F10)'
        Caption = 'Excluir Negociacao (F10)'
        Layout = blGlyphTop
        OnClick = BTExcluirNegociacaoClick
      end
      object BTConfirmar: TBitBtn
        Left = 310
        Top = 5
        Width = 140
        Height = 63
        Hint = 'Confirmar Negocia'#231#227'o (F5)'
        Caption = 'Confirmar (F5)'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = BTFecharClick
      end
    end
    object EditSubTotal: TJvValidateEdit
      Left = 479
      Top = 39
      Width = 182
      Height = 35
      Hint = 'SubTotal da Venda'
      AutoSize = False
      BorderStyle = bsNone
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      EditText = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      OnChange = EditSubTotalChange
    end
    object EditValorAReceber: TJvValidateEdit
      Left = 482
      Top = 269
      Width = 182
      Height = 35
      Hint = 'Valor '#224' Receber'
      AutoSize = False
      BorderStyle = bsNone
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      EditText = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnKeyPress = EditValorAReceberKeyPress
    end
    object EditDesconto: TJvValidateEdit
      Left = 482
      Top = 345
      Width = 182
      Height = 35
      Hint = 'Desconto Concedido'
      AutoSize = False
      BorderStyle = bsNone
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      EditText = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnKeyPress = EditDescontoKeyPress
    end
    object EditTotal: TJvValidateEdit
      Left = 482
      Top = 115
      Width = 182
      Height = 35
      Hint = 'Total da Negocia'#231#227'o'
      AutoSize = False
      BorderStyle = bsNone
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      EditText = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      OnChange = EditTotalChange
    end
    object CBFormaPagamento: TComboBox
      Left = 469
      Top = 189
      Width = 204
      Height = 40
      Hint = 'Forma de Pagamento'
      Style = csDropDownList
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 5
      Text = 'teste'
      OnKeyPress = CBFormaPagamentoKeyPress
      Items.Strings = (
        'teste')
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 32
      Width = 439
      Height = 354
      DataSource = BancoDados.DSNegociacao
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'l_forma_pagamento'
          Title.Caption = 'Forma de Pagamento'
          Width = 140
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Caption = 'Valor (R$)'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCONTO'
          Title.Caption = 'Desconto (R$)'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Title.Caption = 'Total (R$)'
          Width = 80
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 121
    Height = 462
    Align = alLeft
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object JvGradientHeaderPanel1: TJvGradientHeaderPanel
      Left = 1
      Top = 1
      Width = 119
      Height = 460
      GradientStartColor = 6930170
      GradientStyle = grVertical
      LabelTop = 30
      LabelCaption = 'MasterSoft'
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWhite
      LabelFont.Height = -16
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = [fsBold]
      LabelAlignment = taCenter
      Align = alClient
      TabOrder = 0
    end
  end
  object SBPrincipal: TStatusBar
    Left = 0
    Top = 462
    Width = 862
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object ActionList1: TActionList
    Left = 680
    Top = 8
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 113
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 115
      OnExecute = Action2Execute
    end
    object Action3: TAction
      Caption = 'Action3'
      ShortCut = 116
      OnExecute = Action3Execute
    end
    object Action4: TAction
      Caption = 'Action4'
      ShortCut = 121
      OnExecute = Action4Execute
    end
  end
end
