object PesquisaComandaForm: TPesquisaComandaForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'MasterRestaurante - Pesquisa de Comandas'
  ClientHeight = 468
  ClientWidth = 781
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 121
    Height = 449
    Align = alLeft
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object JvGradientHeaderPanel1: TJvGradientHeaderPanel
      Left = 1
      Top = 1
      Width = 119
      Height = 447
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
    Top = 449
    Width = 781
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object Panel2: TPanel
    Left = 121
    Top = 0
    Width = 660
    Height = 449
    Align = alClient
    TabOrder = 2
    object Panel4: TPanel
      Left = 1
      Top = 372
      Width = 658
      Height = 76
      Align = alBottom
      TabOrder = 0
      object BTConfirmar: TSpeedButton
        Left = 439
        Top = 29
        Width = 105
        Height = 45
        Hint = 'Confirmar Produto pesquisado (F10)'
        Caption = 'Confirmar (F10)'
        Layout = blGlyphTop
        OnClick = BTConfirmarClick
      end
      object BTCancelar: TSpeedButton
        Left = 546
        Top = 29
        Width = 105
        Height = 45
        Hint = 'Cancelar opera'#231#227'o (F8)'
        Caption = 'Cancelar (F8)'
        Layout = blGlyphTop
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
        Width = 289
        Height = 13
        Caption = 'F2 <Comanda> | F3 <Venda> | F4 <Gar'#231'on> | F5 <Vendedor>'
        Font.Charset = ANSI_CHARSET
        Font.Color = 6590965
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EditPesquisar: TEdit
        Left = 73
        Top = 38
        Width = 304
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = EditPesquisarKeyPress
      end
      object CBCriterio: TComboBox
        Left = 73
        Top = 6
        Width = 136
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 1
        Text = 'Comanda'
        Items.Strings = (
          'Comanda'
          'Venda'
          'Gar'#231'on'
          'Vendedor')
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 658
      Height = 371
      Align = alClient
      DataSource = BancoDados.DSRestauranteComanda
      FixedColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clDefault
      Font.Height = -11
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
          FieldName = 'RESTAURANTE_COMANDA_ID'
          Title.Caption = 'Comanda I.D'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VENDA_ID'
          Title.Caption = 'Venda I.D'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'l_gargon_nome'
          Title.Caption = 'Gar'#231'on'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'l_vendedor_nome'
          Title.Caption = 'Vendedor'
          Width = 200
          Visible = True
        end>
    end
  end
  object ActionList1: TActionList
    Left = 296
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
    object Action3: TAction
      Caption = 'Action3'
      ShortCut = 115
      OnExecute = Action3Execute
    end
    object Action4: TAction
      Caption = 'Action4'
      ShortCut = 116
      OnExecute = Action4Execute
    end
    object Action5: TAction
      Caption = 'Action5'
      ShortCut = 119
      OnExecute = Action5Execute
    end
    object Action6: TAction
      Caption = 'Action6'
      ShortCut = 121
      OnExecute = Action6Execute
    end
  end
end
