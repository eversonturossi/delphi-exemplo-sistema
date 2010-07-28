object UsuarioExibirColunaForm: TUsuarioExibirColunaForm
  Left = 0
  Top = 0
  Caption = 'MasterERP - Configura as Colunas a Serem Exibidas'
  ClientHeight = 385
  ClientWidth = 666
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
    Width = 145
    Height = 366
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
      Width = 143
      Height = 364
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
      ExplicitLeft = -10
      ExplicitTop = 0
      ExplicitWidth = 161
      ExplicitHeight = 444
      object BTSalvar: TSpeedButton
        Left = 37
        Top = 83
        Width = 73
        Height = 65
        Hint = 'Inserir Novo Registro (Ctrl+End)'
        Caption = 'Salvar'
        Layout = blGlyphTop
        OnClick = BTSalvarClick
        OnMouseMove = BTSalvarMouseMove
      end
      object BTLimpar: TSpeedButton
        Left = 37
        Top = 148
        Width = 73
        Height = 65
        Hint = 'Limpar Configura'#231#245'es (Ctrl+Ins)'
        Caption = 'Limpar'
        Layout = blGlyphTop
        OnClick = BTLimparClick
      end
      object BTCancelar: TSpeedButton
        Left = 37
        Top = 213
        Width = 73
        Height = 65
        Hint = 'Cancelar Altera'#231#245'es (Ctrl+BkSp)'
        Caption = 'Cancelar'
        Layout = blGlyphTop
        OnClick = BTCancelarClick
      end
      object BTSair: TSpeedButton
        Left = 37
        Top = 278
        Width = 73
        Height = 65
        Hint = 'Sair (Esc)'
        Caption = 'Sair'
        Layout = blGlyphTop
        OnClick = BTSairClick
      end
    end
  end
  object SBPrincipal: TStatusBar
    Left = 0
    Top = 366
    Width = 666
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object Panel2: TPanel
    Left = 145
    Top = 0
    Width = 521
    Height = 366
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 121
    ExplicitWidth = 545
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 519
      Height = 72
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 543
      object Label1: TLabel
        Left = 82
        Top = 13
        Width = 26
        Height = 13
        Caption = 'Font:'
      end
      object Label2: TLabel
        Left = 20
        Top = 40
        Width = 88
        Height = 13
        Caption = 'Tamanho da Font:'
      end
      object CBFonte: TComboBox
        Left = 132
        Top = 10
        Width = 269
        Height = 21
        Hint = 'Tipo da Fonte'
        ItemIndex = 0
        TabOrder = 0
        TabStop = False
        Text = '<selecione>'
        OnChange = CBFonteChange
        Items.Strings = (
          '<selecione>')
      end
      object SEFontTamanho: TSpinEdit
        Left = 132
        Top = 37
        Width = 49
        Height = 22
        Hint = 'Tamanho da Fonte'
        TabStop = False
        MaxValue = 30
        MinValue = 8
        TabOrder = 1
        Value = 8
        OnChange = SEFontTamanhoChange
      end
      object CBMarcar: TCheckBox
        Left = 296
        Top = 39
        Width = 105
        Height = 17
        Hint = 'Marcar/Desmarcar Todos'
        Caption = 'Marcar Todos'
        TabOrder = 2
        OnClick = CBMarcarClick
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 73
      Width = 519
      Height = 292
      Align = alClient
      BorderStyle = bsNone
      DataSource = BancoDados.DSCDSUsuarioExibirColuna
      FixedColor = clSilver
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'INDICE'
          ReadOnly = True
          Title.Caption = #205'ndice'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COLUNA_LABEL'
          ReadOnly = True
          Title.Caption = 'Campo'
          Width = 380
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VISIVEL'
          Title.Caption = 'Vis'#237'vel'
          Visible = True
        end>
    end
  end
  object ApplicationEvents: TApplicationEvents
    OnHint = ApplicationEventsHint
    Left = 353
    Top = 160
  end
  object ActionList: TActionList
    Left = 352
    Top = 208
    object ASalvar: TAction
      Caption = 'ASalvar'
      ShortCut = 16419
      OnExecute = ASalvarExecute
    end
    object ALimpar: TAction
      Caption = 'ALimpar'
      ShortCut = 16429
      OnExecute = ALimparExecute
    end
    object ACancelar: TAction
      Caption = 'ACancelar'
      ShortCut = 16392
      OnExecute = ACancelarExecute
    end
    object ASair: TAction
      Caption = 'ASair'
      ShortCut = 27
      OnExecute = ASairExecute
    end
  end
end
