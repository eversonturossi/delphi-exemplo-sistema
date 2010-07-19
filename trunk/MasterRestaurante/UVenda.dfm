object VendaForm: TVendaForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'VendaForm'
  ClientHeight = 606
  ClientWidth = 1017
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 34
    Top = 159
    Width = 93
    Height = 29
    Caption = 'C'#243'digo:'
    Font.Charset = ANSI_CHARSET
    Font.Color = 6590965
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape2: TShape
    Left = 34
    Top = 191
    Width = 154
    Height = 47
    Pen.Color = 11114608
    Shape = stRoundRect
  end
  object Label2: TLabel
    Left = 194
    Top = 159
    Width = 125
    Height = 29
    Caption = 'Descri'#231#227'o:'
    Font.Charset = ANSI_CHARSET
    Font.Color = 6590965
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape1: TShape
    Left = 194
    Top = 191
    Width = 554
    Height = 47
    Pen.Color = 11114608
    Shape = stRoundRect
  end
  object Label3: TLabel
    Left = 783
    Top = 159
    Width = 143
    Height = 29
    Caption = 'Quantidade:'
    Font.Charset = ANSI_CHARSET
    Font.Color = 6590965
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape3: TShape
    Left = 777
    Top = 191
    Width = 170
    Height = 47
    Pen.Color = 11114608
    Shape = stRoundRect
  end
  object Label4: TLabel
    Left = 783
    Top = 506
    Width = 28
    Height = 13
    Caption = 'Total:'
  end
  object LBTotal: TLabel
    Left = 783
    Top = 525
    Width = 164
    Height = 42
    AutoSize = False
    Caption = 'R$ 0,00'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -37
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 34
    Top = 91
    Width = 62
    Height = 16
    Caption = 'Venda I.D:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 282
    Top = 91
    Width = 44
    Height = 16
    Caption = 'Cliente:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LBVendaID: TLabel
    Left = 106
    Top = 91
    Width = 105
    Height = 16
    AutoSize = False
    Caption = '0000000000'
    Font.Charset = ANSI_CHARSET
    Font.Color = 6590965
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LBCliente: TLabel
    Left = 344
    Top = 91
    Width = 313
    Height = 16
    AutoSize = False
    Font.Charset = ANSI_CHARSET
    Font.Color = 6590965
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BTFecharVenda: TSpeedButton
    Left = 448
    Top = 506
    Width = 135
    Height = 75
    Hint = 'Fechar Venda (F8)'
    Caption = 'Fechar Venda (F8)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Layout = blGlyphTop
    ParentFont = False
    OnClick = BTFecharVendaClick
  end
  object BTNovaVenda: TSpeedButton
    Left = 34
    Top = 506
    Width = 135
    Height = 75
    Hint = 'Nova Venda (F5)'
    Caption = 'Nova Venda (F5)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Layout = blGlyphTop
    ParentFont = False
    OnClick = BTNovaVendaClick
  end
  object BTCancelarItem: TSpeedButton
    Left = 310
    Top = 506
    Width = 135
    Height = 75
    Hint = 'Cancelar Item (F10)'
    Caption = 'Cancelar Item (F10)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Layout = blGlyphTop
    ParentFont = False
    OnClick = BTCancelarItemClick
  end
  object BTCancelarVenda: TSpeedButton
    Left = 172
    Top = 506
    Width = 135
    Height = 75
    Hint = 'Cancelar Venda (Ctrl + L)'
    Caption = 'Cancelar (Ctrl + L)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Layout = blGlyphTop
    ParentFont = False
    OnClick = BTCancelarVendaClick
  end
  object BTSair: TSpeedButton
    Left = 586
    Top = 506
    Width = 135
    Height = 75
    Hint = 'Sair'
    Caption = 'Sair'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Layout = blGlyphTop
    ParentFont = False
    OnClick = BTSairClick
  end
  object EditCodigo: TEdit
    Left = 40
    Top = 198
    Width = 144
    Height = 32
    Hint = 'C'#243'digo do Produto (F4)'
    AutoSize = False
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyPress = EditCodigoKeyPress
  end
  object EditDescricao: TEdit
    Left = 201
    Top = 198
    Width = 538
    Height = 32
    Hint = 'Descri'#231#227'o do Produto'
    TabStop = False
    AutoSize = False
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object EditQtd: TJvValidateEdit
    Left = 787
    Top = 198
    Width = 153
    Height = 32
    Hint = 'Quantidade do Item'
    AutoSize = False
    BorderStyle = bsNone
    CriticalPoints.MaxValueIncluded = False
    CriticalPoints.MinValueIncluded = False
    DisplayFormat = dfFloat
    DecimalPlaces = 4
    EditText = '1'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnKeyPress = EditQtdKeyPress
  end
  object DBGrid2: TDBGrid
    Left = 34
    Top = 247
    Width = 913
    Height = 253
    DataSource = BancoDados.DSVendaItem
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid2DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'ITEM'
        Title.Caption = 'Item'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUTO_ID'
        Title.Caption = 'Produto I.D'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'calc_descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIDADE'
        Title.Caption = 'Unidade'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO'
        Title.Caption = 'Pre'#231'o (R$)'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE'
        Title.Caption = 'Quantidade'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Title.Caption = 'Total (R$)'
        Width = 100
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1017
    Height = 78
    Align = alTop
    Caption = 'MasterRestaurante - Controle de Vendas'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object SBPrincipal: TStatusBar
    Left = 0
    Top = 587
    Width = 1017
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 150
      end
      item
        Width = 250
      end
      item
        Width = 400
      end>
  end
  object TimerPrincipal: TTimer
    OnTimer = TimerPrincipalTimer
    Left = 968
    Top = 152
  end
  object ActionList1: TActionList
    Left = 704
    Top = 88
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 116
      OnExecute = Action1Execute
    end
    object Action3: TAction
      Caption = 'Action3'
      ShortCut = 121
      OnExecute = Action3Execute
    end
    object Action4: TAction
      Caption = 'Action4'
      ShortCut = 119
      OnExecute = Action4Execute
    end
    object Action5: TAction
      Caption = 'Action5'
      ShortCut = 16453
      OnExecute = Action5Execute
    end
  end
end
