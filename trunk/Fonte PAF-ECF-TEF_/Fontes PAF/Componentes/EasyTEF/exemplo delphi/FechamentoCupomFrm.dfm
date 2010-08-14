
object FechamentoCupomForm: TFechamentoCupomForm
  Left = 444
  Top = 196
  BorderStyle = bsDialog
  Caption = 'Fechamento do Cupom Fiscal'
  ClientHeight = 246
  ClientWidth = 352
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  object pnlBotoes: TPanel
    Left = 0
    Top = 205
    Width = 352
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnOk: TBitBtn
      Left = 194
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&OK'
      TabOrder = 0
      Kind = bkOK
    end
    object btnFechar: TBitBtn
      Left = 269
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Fechar'
      TabOrder = 1
      Kind = bkClose
    end
    object btnDadosCheque: TButton
      Left = 8
      Top = 8
      Width = 121
      Height = 25
      Caption = '&Dados do Cheque'
      Enabled = False
      TabOrder = 2
      OnClick = btnDadosChequeClick
    end
  end
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 352
    Height = 205
    Align = alClient
    BorderWidth = 4
    TabOrder = 0
    object DBNavigator: TDBNavigator
      Left = 5
      Top = 5
      Width = 342
      Height = 25
      DataSource = dtsFechamentoCupom
      Align = alTop
      Flat = True
      TabOrder = 0
    end
    object DBGrid: TDBGrid
      Left = 5
      Top = 30
      Width = 342
      Height = 170
      Align = alClient
      DataSource = dtsFechamentoCupom
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Forma'
          PickList.Strings = (
            'Dinheiro'
            'Cart'#227'o'
            'Cheque')
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Valor'
          Width = 100
          Visible = True
        end>
    end
  end
  object dtsFechamentoCupom: TDataSource
    DataSet = cdsFechamentoCupom
    OnStateChange = dtsFechamentoCupomStateChange
    OnDataChange = dtsFechamentoCupomDataChange
    OnUpdateData = dtsFechamentoCupomUpdateData
    Left = 268
    Top = 80
  end
  object cdsFechamentoCupom: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    AfterInsert = cdsFechamentoCupomAfterInsert
    Left = 296
    Top = 80
    object cdsFechamentoCupomForma: TStringField
      FieldName = 'Forma'
      Required = True
    end
    object cdsFechamentoCupomValor: TFloatField
      FieldName = 'Valor'
      Required = True
      OnValidate = cdsFechamentoCupomValorValidate
      currency = True
    end
    object cdsFechamentoCupomTotal: TAggregateField
      FieldName = 'Total'
      Visible = True
      Active = True
      currency = True
      Expression = 'SUM(Valor)'
    end
  end
end
