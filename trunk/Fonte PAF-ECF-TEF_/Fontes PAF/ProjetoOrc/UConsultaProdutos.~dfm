object FPesquisaProdutos: TFPesquisaProdutos
  Left = 5
  Top = 54
  Width = 791
  Height = 511
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta Cadastro de Produtos'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid: TDBGrid
    Left = 0
    Top = 47
    Width = 783
    Height = 316
    Cursor = crHandPoint
    Align = alClient
    Color = clWhite
    Ctl3D = True
    DataSource = dsPesqProdutos
    FixedColor = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -12
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = DBGridDrawColumnCell
    OnKeyPress = DBGridKeyPress
    OnKeyUp = DBGridKeyUp
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'C'#211'D. INTERNO'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'DESCRI'#199#195'O'
        Width = 388
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MED'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALDO'
        Title.Caption = 'ESTOQUE'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECOVENDA'
        Title.Caption = 'R$:P.VISTA'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECOPRAZO'
        Title.Caption = 'R$:P.PRAZO'
        Width = 82
        Visible = True
      end>
  end
  object SB: TStatusBar
    Left = 0
    Top = 456
    Width = 783
    Height = 21
    Panels = <
      item
        Width = 250
      end>
    ParentColor = True
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 783
    Height = 47
    ButtonHeight = 39
    Caption = 'ToolBar1'
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 0
      Top = 2
      Width = 779
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
        Left = 749
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
        Text = 'DESCRI'#199#195'O'
        OnKeyPress = CPesquisaKeyPress
        Items.Strings = (
          'DESCRI'#199#195'O'
          'REFER'#202'NCIA'
          'C'#211'DIGO DE BARRAS'
          'C'#211'DIGO INTERNO')
      end
      object EPesquisa: TMaskEdit
        Left = 161
        Top = 10
        Width = 587
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
  object Panel1: TPanel
    Left = 0
    Top = 363
    Width = 783
    Height = 93
    Align = alBottom
    BorderStyle = bsSingle
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    object RxLabel1: TRxLabel
      Left = 5
      Top = 71
      Width = 764
      Height = 13
      Caption = 
        '[ F6 ] - PESQ. PELA DESCRI'#199#195'O / [ F7 ] - PESQ. PELA REFER'#202'NCIA /' +
        ' [ F8 ] - PESQ. PELO C'#211'DIGO DE BARRAS / [ F9 ] - PESQ. PELO C'#211'DI' +
        'GO INT.'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 25
      Top = 46
      Width = 41
      Height = 14
      Caption = 'Grupo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText5: TDBText
      Left = 68
      Top = 46
      Width = 317
      Height = 17
      DataField = 'NOME'
      DataSource = dsPesqProdutos
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 396
      Top = 46
      Width = 40
      Height = 14
      Caption = 'Se'#231#227'o:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText6: TDBText
      Left = 438
      Top = 46
      Width = 317
      Height = 17
      DataField = 'NOME_1'
      DataSource = dsPesqProdutos
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 26
      Top = 26
      Width = 40
      Height = 14
      Caption = 'Marca:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText4: TDBText
      Left = 68
      Top = 26
      Width = 311
      Height = 17
      DataField = 'NOME_2'
      DataSource = dsPesqProdutos
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 2
      Top = 6
      Width = 64
      Height = 14
      Caption = 'C'#243'd.Barra:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText8: TDBText
      Left = 68
      Top = 6
      Width = 153
      Height = 17
      DataField = 'CODBARRA'
      DataSource = dsPesqProdutos
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 227
      Top = 6
      Width = 68
      Height = 14
      Caption = 'Refer'#234'ncia:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 298
      Top = 6
      Width = 153
      Height = 17
      DataField = 'REFERENCIA'
      DataSource = dsPesqProdutos
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 1
      Top = 65
      Width = 781
      Height = 2
    end
  end
  object dsPesqProdutos: TDataSource
    AutoEdit = False
    DataSet = DM.TPesqProduto
    Left = 376
    Top = 176
  end
end
