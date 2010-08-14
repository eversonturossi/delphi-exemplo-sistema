object FPesquisaCliente: TFPesquisaCliente
  Left = 5
  Top = 162
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'CONSULTANDO CADASTRO DE CLIENTES'
  ClientHeight = 433
  ClientWidth = 786
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid: TDBGrid
    Left = 0
    Top = 46
    Width = 786
    Height = 366
    Align = alClient
    Color = clWhite
    Ctl3D = True
    DataSource = dsPesqCliente
    FixedColor = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridDrawColumnCell
    OnKeyPress = DBGridKeyPress
    OnKeyUp = DBGridKeyUp
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 269
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 197
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CGC'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Title.Caption = 'CNPJ'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 122
        Visible = True
      end>
  end
  object SB: TStatusBar
    Left = 0
    Top = 412
    Width = 786
    Height = 21
    Panels = <
      item
        Width = 120
      end
      item
        Text = 'Insert - Cadastra novo Cliente'
        Width = 155
      end
      item
        Text = 
          '{ Consultas } ->  F3 - Por Nome  /  F4 - Por CPF  /  F5 - Por CN' +
          'PJ  /  F6 - Por C'#243'digo'
        Width = 50
      end>
    ParentColor = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 786
    Height = 46
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object BtConsulta: TSpeedButton
      Left = 757
      Top = 18
      Width = 25
      Height = 24
      Cursor = crHandPoint
      Flat = True
      Glyph.Data = {
        F6000000424DF60000000000000076000000280000000E000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888800
        88008888888884EC0800880000004ECC000088788884ECC88000887FFF4ECC8F
        80008870078CC8FF8000878E80778FFF80007FE8E808FFFF80007EFE8E08FFFF
        80007FEFE808FFFF800087FEF08FFFFF8000887708FFFFFF8000887FFFFFFF00
        0000887FFFFFFF8F7800887FFFFFFF8788008877777777788800}
      OnClick = BtConsultaClick
    end
    object Label1: TLabel
      Left = 3
      Top = 1
      Width = 82
      Height = 13
      Caption = 'Pesquisar por:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CPesquisa: TComboBox
      Left = 2
      Top = 18
      Width = 125
      Height = 24
      Style = csDropDownList
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnKeyPress = CPesquisaKeyPress
      Items.Strings = (
        'NOME'
        'CPF'
        'CNPJ'
        'C'#211'DIGO')
    end
    object EPesquisa: TMaskEdit
      Left = 127
      Top = 18
      Width = 630
      Height = 24
      CharCase = ecUpperCase
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnChange = EPesquisaChange
      OnEnter = EPesquisaEnter
      OnExit = EPesquisaExit
      OnKeyPress = EPesquisaKeyPress
      OnKeyUp = EPesquisaKeyUp
    end
  end
  object dsPesqCliente: TDataSource
    AutoEdit = False
    DataSet = DM.TPesqCliente
    Left = 360
    Top = 208
  end
end
