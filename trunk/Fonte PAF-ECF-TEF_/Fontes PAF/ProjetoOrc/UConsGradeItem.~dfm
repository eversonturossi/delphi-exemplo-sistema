object FConsultaGradeItem: TFConsultaGradeItem
  Left = 75
  Top = 130
  Width = 660
  Height = 380
  BorderIcons = [biSystemMenu]
  Caption = 'CONSULTA GRADE DO ITEN'
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
  object LProduto: TLabel
    Left = 0
    Top = 0
    Width = 652
    Height = 16
    Align = alTop
    Caption = 'LProduto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 327
    Width = 652
    Height = 19
    Panels = <>
    ParentColor = True
  end
  object G_Grade: TGroupBox
    Left = 0
    Top = 17
    Width = 652
    Height = 308
    Caption = 'GRADE'
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clTeal
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    object DBGrid: TDBGrid
      Left = 2
      Top = 17
      Width = 648
      Height = 289
      Align = alClient
      DataSource = dsGrade
      FixedColor = 8421440
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -12
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = DBGridDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'VARIACAO'
          Title.Caption = 'VARIA'#199#195'O'
          Width = 169
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_COR'
          Title.Caption = 'COR'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_TAMANHO'
          Title.Caption = 'TAMANHO'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_BARRA'
          Title.Caption = 'C'#211'D.BARRA'
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REFERENCIA'
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDE'
          Width = 76
          Visible = True
        end>
    end
  end
  object dsGrade: TDataSource
    DataSet = DM.TConsultaOrcGrade
    Left = 304
    Top = 173
  end
end
