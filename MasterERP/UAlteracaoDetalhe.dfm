object AlteracaoDetalheForm: TAlteracaoDetalheForm
  Left = 0
  Top = 0
  Caption = 'MasterERP - Detalhes da Altera'#231#227'o'
  ClientHeight = 451
  ClientWidth = 750
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 24
    Top = 8
    Width = 703
    Height = 53
    Caption = 'Identifica'#231#227'o'
    TabOrder = 0
    object Label3: TLabel
      Left = 16
      Top = 24
      Width = 36
      Height = 13
      Caption = 'Tabela:'
    end
    object Label4: TLabel
      Left = 242
      Top = 24
      Width = 40
      Height = 13
      Caption = 'Usu'#225'rio:'
    end
    object DBText1: TDBText
      Left = 58
      Top = 24
      Width = 167
      Height = 17
      DataField = 'TABELA'
      DataSource = BancoDados.DSAlteracao
      Font.Charset = ANSI_CHARSET
      Font.Color = 6590965
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 290
      Top = 24
      Width = 218
      Height = 17
      DataField = 'calc_nome_usuario'
      DataSource = BancoDados.DSAlteracao
      Font.Charset = ANSI_CHARSET
      Font.Color = 6590965
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 526
      Top = 24
      Width = 27
      Height = 13
      Caption = 'Data:'
    end
    object DBText3: TDBText
      Left = 562
      Top = 24
      Width = 120
      Height = 17
      DataField = 'DATA_CADASTRO'
      DataSource = BancoDados.DSAlteracao
      Font.Charset = ANSI_CHARSET
      Font.Color = 6590965
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 400
    Width = 750
    Height = 51
    Align = alBottom
    TabOrder = 1
    object BTFechar: TSpeedButton
      Left = 621
      Top = 8
      Width = 116
      Height = 35
      Caption = 'Fechar'
      OnClick = BTFecharClick
    end
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 67
    Width = 750
    Height = 333
    TabStop = False
    Align = alBottom
    Color = clWhite
    DataSource = BancoDados.DSAlteracao
    FixedColor = clGray
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ALTERACAO_ID'
        Title.Caption = 'Altera'#231#227'o I.D'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ATIVO'
        Title.Caption = 'Ativa'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECUPERADA'
        Title.Caption = 'Recuperada'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_RECUPERACAO'
        Title.Caption = 'Data Da Recupera'#231#227'o'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 150
        Visible = True
      end>
  end
end
