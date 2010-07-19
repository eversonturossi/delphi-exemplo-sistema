object PesquisaProdutoForm: TPesquisaProdutoForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'PesquisaProdutoForm'
  ClientHeight = 508
  ClientWidth = 777
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SBPrincipal: TStatusBar
    Left = 0
    Top = 489
    Width = 777
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 121
    Height = 489
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
      Height = 487
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
  object Panel2: TPanel
    Left = 121
    Top = 0
    Width = 656
    Height = 489
    Align = alClient
    TabOrder = 2
    object Panel4: TPanel
      Left = 1
      Top = 412
      Width = 654
      Height = 76
      Align = alBottom
      TabOrder = 0
      object BTCancelar: TSpeedButton
        Left = 524
        Top = 3
        Width = 125
        Height = 70
        Hint = 'Cancelar opera'#231#227'o'
        Caption = 'Cancelar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = blGlyphTop
        ParentFont = False
        OnClick = BTCancelarClick
      end
      object Label1: TLabel
        Left = 14
        Top = 41
        Width = 50
        Height = 13
        Caption = 'Pesquisar:'
      end
      object Label2: TLabel
        Left = 25
        Top = 9
        Width = 39
        Height = 13
        Caption = 'Crit'#233'rio:'
      end
      object Label3: TLabel
        Left = 224
        Top = 9
        Width = 143
        Height = 13
        Caption = 'F2 <C'#243'digo> | F3 <Descri'#231#227'o>'
        Font.Charset = ANSI_CHARSET
        Font.Color = 6590965
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EditPesquisar: TEdit
        Left = 70
        Top = 36
        Width = 371
        Height = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = EditPesquisarChange
      end
      object CBCriterio: TComboBox
        Left = 73
        Top = 6
        Width = 136
        Height = 22
        Style = csOwnerDrawFixed
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 1
        ParentFont = False
        TabOrder = 1
        Text = 'Descri'#231#227'o'
        OnSelect = CBCriterioSelect
        Items.Strings = (
          'C'#243'digo'
          'Descri'#231#227'o')
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 654
      Height = 411
      Align = alClient
      DataSource = BancoDados.DSProduto
      FixedColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clDefault
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'PRODUTO_ID'
          Title.Caption = 'Produto I.D'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'l_unidade'
          Title.Caption = 'Unidade'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO'
          Title.Caption = 'Pre'#231'o (R$)'
          Width = 100
          Visible = True
        end>
    end
  end
  object ActionList1: TActionList
    Left = 184
    Top = 56
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 113
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 114
      OnExecute = Action2Execute
    end
  end
end
