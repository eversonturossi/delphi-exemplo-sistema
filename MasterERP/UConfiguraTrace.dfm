object ConfiguraTraceForm: TConfiguraTraceForm
  Left = 0
  Top = 0
  Caption = 'MasterERP - Configurar Trace'
  ClientHeight = 292
  ClientWidth = 721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 121
    Height = 273
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
    ExplicitHeight = 366
    object BTSalvar: TSpeedButton
      Left = 23
      Top = 65
      Width = 73
      Height = 65
      Hint = 'Inserir Novo Registro (Ctrl+End)'
      Caption = 'Salvar'
      Layout = blGlyphTop
      OnClick = BTSalvarClick
    end
    object BTSair: TSpeedButton
      Left = 23
      Top = 130
      Width = 73
      Height = 65
      Hint = 'Sair (Esc)'
      Caption = 'Sair'
      Layout = blGlyphTop
      OnClick = BTSairClick
    end
  end
  object SBPrincipal: TStatusBar
    Left = 0
    Top = 273
    Width = 721
    Height = 19
    Panels = <
      item
        Width = 200
      end>
    ExplicitTop = 336
    ExplicitWidth = 666
  end
  object Panel2: TPanel
    Left = 121
    Top = 0
    Width = 600
    Height = 273
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 280
    ExplicitTop = 128
    ExplicitWidth = 185
    ExplicitHeight = 41
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 598
      Height = 271
      Align = alClient
      BorderStyle = bsNone
      DataSource = BancoDados.DSTabela
      FixedColor = clSilver
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
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
          FieldName = 'TABELA'
          ReadOnly = True
          Title.Caption = 'Tabela'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o'
          Width = 300
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ATIVAR_TRACE'
          Title.Caption = 'Trace'
          Width = 50
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
      OnExecute = BTSalvarClick
    end
    object ASair: TAction
      Caption = 'ASair'
      ShortCut = 27
      OnExecute = BTSairClick
    end
  end
end
