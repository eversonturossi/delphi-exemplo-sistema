inherited CadastroGrupoProdutoForm: TCadastroGrupoProdutoForm
  Caption = 'CadastroGrupoProdutoForm'
  ClientHeight = 428
  ClientWidth = 718
  KeyPreview = True
  ExplicitWidth = 724
  ExplicitHeight = 454
  PixelsPerInch = 96
  TextHeight = 13
  inherited SBPrincipal: TStatusBar
    Top = 409
    Width = 718
    ExplicitTop = 409
    ExplicitWidth = 718
  end
  inherited Panel1: TPanel
    Height = 409
    ExplicitHeight = 409
    inherited GHPPrincipal: TJvGradientHeaderPanel
      Height = 407
    end
  end
  inherited PPrincipal: TPanel
    Width = 561
    Height = 409
    ExplicitWidth = 561
    ExplicitHeight = 409
    object Label8: TLabel [0]
      Left = 22
      Top = 108
      Width = 89
      Height = 13
      Alignment = taRightJustify
      Caption = 'Produto Grupo I.D:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel [1]
      Left = 60
      Top = 135
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    inherited Panel3: TPanel
      Width = 559
      TabOrder = 1
      ExplicitWidth = 559
    end
    object DBEditCodigo: TDBEdit
      Left = 128
      Top = 105
      Width = 117
      Height = 21
      TabStop = False
      Color = clScrollBar
      DataField = 'PRODUTO_GRUPO_ID'
      DataSource = DSCadastro
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBEditDescricao: TDBEdit
      Left = 128
      Top = 132
      Width = 329
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = DSCadastro
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = RemoveAcento
    end
  end
  inherited CDSCadastro: TClientDataSet
    object CDSCadastroPRODUTO_GRUPO_ID: TIntegerField
      FieldName = 'PRODUTO_GRUPO_ID'
      DisplayFormat = '0000000000'
    end
    object CDSCadastroATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object CDSCadastroDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object CDSCadastroDATA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
    end
    object CDSCadastroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  inherited qryCadastro: TSQLQuery
    SQL.Strings = (
      'select * from produto_grupo where produto_grupo_id = 0')
  end
end
