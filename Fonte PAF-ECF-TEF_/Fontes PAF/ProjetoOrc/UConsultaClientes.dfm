object FPesquisaClientes: TFPesquisaClientes
  Left = 2
  Top = 28
  Width = 798
  Height = 504
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta Cadastro de Clientes'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SB: TStatusBar
    Left = 0
    Top = 451
    Width = 790
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 46
    Width = 790
    Height = 405
    Cursor = crHandPoint
    Align = alClient
    Color = clWhite
    Ctl3D = True
    DataSource = DM.dsPesquisaClientes
    FixedColor = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -12
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = DBGridDrawColumnCell
    OnKeyPress = DBGridKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'C.D.C'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'RAZ'#195'O SOCIAL'
        Width = 284
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_FANTASIA'
        Title.Caption = 'FANTASIA'
        Width = 280
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO'
        Title.Caption = 'ENDERE'#199'O'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAIRRO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_CIDADE'
        Title.Caption = 'CIDADE'
        Width = 261
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CGC'
        Title.Caption = 'CNPJ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CELULAR'
        Visible = True
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 790
    Height = 46
    ButtonHeight = 39
    Caption = 'ToolBar1'
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 0
      Top = 2
      Width = 789
      Height = 39
      Color = clWhite
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      object BtConsulta: TSpeedButton
        Left = 760
        Top = 10
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
      object CPesquisa: TComboBox
        Left = 7
        Top = 10
        Width = 154
        Height = 24
        Style = csDropDownList
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 16
        ItemIndex = 0
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Text = 'NOME'
        Items.Strings = (
          'NOME'
          'C'#211'DIGO')
      end
      object EPesquisa: TMaskEdit
        Left = 161
        Top = 10
        Width = 597
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
  end
end
