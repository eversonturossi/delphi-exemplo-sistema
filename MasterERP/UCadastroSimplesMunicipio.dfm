inherited CadastroSimplesMunicipioForm: TCadastroSimplesMunicipioForm
  Caption = 'CadastroSimplesMunicipioForm'
  ClientHeight = 402
  ClientWidth = 667
  ExplicitWidth = 683
  ExplicitHeight = 438
  PixelsPerInch = 96
  TextHeight = 13
  inherited SBPrincipal: TStatusBar
    Top = 383
    Width = 667
    ExplicitTop = 383
    ExplicitWidth = 667
  end
  inherited Panel1: TPanel
    Height = 383
    ExplicitHeight = 383
    inherited JvGradientHeaderPanel1: TJvGradientHeaderPanel
      Height = 381
      ExplicitHeight = 381
    end
  end
  inherited Panel2: TPanel
    Width = 546
    Height = 383
    ExplicitWidth = 546
    ExplicitHeight = 383
    inherited DBGrid1: TDBGrid
      Width = 544
      Height = 332
      ReadOnly = False
      Columns = <
        item
          Expanded = False
          FieldName = 'MUNICIPIO_ID'
          Title.Caption = 'Cidade I.D'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Cidade'
          Width = 400
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UF_ID'
          Title.Caption = 'UF I.D'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'UF'
          Visible = True
        end>
    end
    inherited Panel3: TPanel
      Top = 333
      Width = 544
      Height = 49
      ExplicitTop = 333
      ExplicitWidth = 544
      ExplicitHeight = 49
      inherited BTSair: TSpeedButton
        Left = 456
        Top = 2
        ExplicitLeft = 456
        ExplicitTop = 2
      end
      object Label1: TLabel
        Left = 16
        Top = 2
        Width = 37
        Height = 13
        Caption = 'Cidade:'
      end
      object Label2: TLabel
        Left = 361
        Top = 2
        Width = 17
        Height = 13
        Caption = 'UF:'
      end
      object EditCidade: TEdit
        Left = 16
        Top = 17
        Width = 321
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = EditCidadeKeyPress
      end
      object CBUF: TComboBox
        Left = 361
        Top = 17
        Width = 46
        Height = 22
        Style = csOwnerDrawFixed
        TabOrder = 1
        OnSelect = CBUFSelect
      end
    end
  end
  inherited CDSCadastro: TClientDataSet
    BeforePost = CDSCadastroBeforePost
    object CDSCadastroMUNICIPIO_ID: TIntegerField
      FieldName = 'MUNICIPIO_ID'
    end
    object CDSCadastroNOME: TStringField
      FieldName = 'NOME'
      Size = 121
    end
    object CDSCadastroUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object CDSCadastroUF_ID: TIntegerField
      FieldName = 'UF_ID'
      DisplayFormat = '0000000000'
    end
  end
  inherited qryCadastro: TSQLQuery
    SQL.Strings = (
      'select * from municipio where municipio_id = 0')
  end
  object CDSUF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPUF'
    Left = 153
    Top = 161
    object CDSUFUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object DSPUF: TDataSetProvider
    DataSet = qryUF
    Left = 153
    Top = 116
  end
  object qryUF: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select uf from municipio where municipio_id = 0 group by uf')
    SQLConnection = BancoDados.Conexao
    Left = 153
    Top = 72
  end
end
