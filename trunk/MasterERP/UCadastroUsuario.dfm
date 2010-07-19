inherited CadastroUsuarioForm: TCadastroUsuarioForm
  Caption = 'CadastroUsuarioForm'
  ClientHeight = 519
  ClientWidth = 788
  KeyPreview = True
  ExplicitWidth = 794
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited SBPrincipal: TStatusBar
    Top = 500
    Width = 788
    ExplicitTop = 500
    ExplicitWidth = 788
  end
  inherited Panel1: TPanel
    Height = 500
    ExplicitHeight = 500
    inherited JvGradientHeaderPanel1: TJvGradientHeaderPanel
      Height = 498
      ExplicitHeight = 498
    end
  end
  inherited PPrincipal: TPanel
    Width = 631
    Height = 500
    ExplicitWidth = 631
    ExplicitHeight = 500
    inherited Panel3: TPanel
      Width = 629
      ExplicitWidth = 629
    end
    object PCPrincipal: TPageControl
      Left = 1
      Top = 84
      Width = 629
      Height = 415
      ActivePage = TSCadastro
      Align = alClient
      TabOrder = 1
      object TSCadastro: TTabSheet
        Caption = 'Cadastro'
        object Label3: TLabel
          Left = 75
          Top = 47
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nome:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 77
          Top = 74
          Width = 29
          Height = 13
          Alignment = taRightJustify
          Caption = 'Login:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 77
          Top = 102
          Width = 29
          Height = 13
          Alignment = taRightJustify
          Caption = 'N'#237'vel:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 50
          Top = 20
          Width = 56
          Height = 13
          Alignment = taRightJustify
          Caption = 'Usu'#225'rio I.D:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object GroupBox1: TGroupBox
          Left = 123
          Top = 130
          Width = 329
          Height = 86
          Caption = 'Cadastrar Senha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = -1
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = True
          object Label6: TLabel
            Left = 54
            Top = 30
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nova Senha:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label7: TLabel
            Left = 36
            Top = 57
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'Confirmar Senha:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object EditNovaSenha: TEdit
            Left = 152
            Top = 27
            Width = 121
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = -1
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            PasswordChar = '*'
            TabOrder = 0
            Text = '********'
          end
          object EditConfirmarSenha: TEdit
            Left = 152
            Top = 54
            Width = 121
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = -1
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            PasswordChar = '*'
            TabOrder = 1
            Text = '********'
            OnChange = EditConfirmarSenhaChange
          end
        end
        object DBEditNome: TDBEdit
          Left = 123
          Top = 44
          Width = 329
          Height = 21
          DataField = 'NOME'
          DataSource = DSCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object DBEditLogin: TDBEdit
          Left = 123
          Top = 71
          Width = 193
          Height = 21
          CharCase = ecUpperCase
          DataField = 'LOGIN'
          DataSource = DSCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnExit = DBEditLoginExit
        end
        object DBLCNivel: TDBLookupComboBox
          Left = 123
          Top = 98
          Width = 193
          Height = 21
          DataField = 'NIVEL'
          DataSource = DSCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'ABREVIACAO'
          ListField = 'DESCRICAO'
          ListSource = DSCDSUsuarioNivel
          ParentFont = False
          TabOrder = 3
          OnExit = DBLCNivelExit
        end
        object DBEdit1: TDBEdit
          Left = 123
          Top = 17
          Width = 117
          Height = 21
          TabStop = False
          Color = clScrollBar
          DataField = 'USUARIO_ID'
          DataSource = DSCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
      end
      object TSPrivilegio: TTabSheet
        Caption = 'Privilegio'
        ImageIndex = 1
        object Label9: TLabel
          Left = 67
          Top = 20
          Width = 38
          Height = 13
          Caption = 'M'#243'dulo:'
        end
        object DBGrid1: TDBGrid
          Left = 3
          Top = 48
          Width = 615
          Height = 332
          DataSource = DSUsuarioPrivilegio
          FixedColor = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clDefault
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
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
              FieldName = 'calc_tabela_descricao'
              Title.Caption = 'M'#243'dulo'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'look_abreviacao'
              Title.Caption = 'Privil'#233'gio'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'look_descricao'
              Title.Caption = 'Descri'#231#227'o'
              Width = 210
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ACESSO'
              Title.Caption = 'Acesso'
              Width = 50
              Visible = True
            end>
        end
        object CBModulo: TComboBox
          Left = 123
          Top = 17
          Width = 182
          Height = 22
          Hint = 'Condi'#231#227'o utilizada para Pesquisa'
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 1
          Text = '<selecione>'
          OnSelect = CBModuloSelect
          Items.Strings = (
            '<selecione>')
        end
        object CBMarcar: TCheckBox
          Left = 517
          Top = 19
          Width = 116
          Height = 17
          Hint = 'Marcar/Desmarcar Todos'
          Caption = 'Marcar Todos'
          TabOrder = 2
          OnClick = CBMarcarClick
        end
      end
    end
  end
  inherited CDSCadastro: TClientDataSet
    object CDSCadastroUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
      DisplayFormat = '0000000000'
    end
    object CDSCadastroNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object CDSCadastroLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 25
    end
    object CDSCadastroSENHA: TStringField
      FieldName = 'SENHA'
      Size = 8
    end
    object CDSCadastroATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object CDSCadastroDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object CDSCadastroNIVEL: TStringField
      FieldName = 'NIVEL'
      Size = 5
    end
    object CDSCadastroDATA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
    end
  end
  inherited qryCadastro: TSQLQuery
    SQL.Strings = (
      'select * from usuario where usuario_id = 0')
    object qryCadastroUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
    end
    object qryCadastroNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryCadastroLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 25
    end
    object qryCadastroSENHA: TStringField
      FieldName = 'SENHA'
      Size = 8
    end
    object qryCadastroATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object qryCadastroDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object qryCadastroNIVEL: TStringField
      FieldName = 'NIVEL'
      Size = 5
    end
    object qryCadastroDATA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
    end
  end
  object qryCsUsuarioNivel: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from usuario_nivel where usuario_id = 0')
    SQLConnection = BancoDados.Conexao
    Left = 544
    Top = 44
    object qryCsUsuarioNivelABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      Required = True
      Size = 5
    end
    object qryCsUsuarioNivelDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object DSCDSUsuarioNivel: TDataSource
    DataSet = CDSUsuarioNivel
    Left = 663
    Top = 44
  end
  object DSPUsuarioNivel: TDataSetProvider
    DataSet = qryCsUsuarioNivel
    Left = 584
    Top = 44
  end
  object CDSUsuarioNivel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPUsuarioNivel'
    Left = 625
    Top = 44
  end
  object qryCsPrivilegio: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from privilegio where privilegio_id = 0')
    SQLConnection = BancoDados.Conexao
    Left = 656
    Top = 296
    object qryCsPrivilegioTABELA: TStringField
      FieldName = 'TABELA'
      Size = 60
    end
    object qryCsPrivilegioPRIVILEGIO_ID: TIntegerField
      FieldName = 'PRIVILEGIO_ID'
      Required = True
    end
    object qryCsPrivilegioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object qryCsPrivilegioABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      Size = 15
    end
  end
  object DSPPrivilegio: TDataSetProvider
    DataSet = qryCsPrivilegio
    Left = 656
    Top = 341
  end
  object CDSPrivilegio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPrivilegio'
    Left = 658
    Top = 384
    object CDSPrivilegioTABELA: TStringField
      FieldName = 'TABELA'
      Size = 60
    end
    object CDSPrivilegioPRIVILEGIO_ID: TIntegerField
      FieldName = 'PRIVILEGIO_ID'
    end
    object CDSPrivilegioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object CDSPrivilegioABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      Size = 15
    end
  end
  object CDSUsuarioPrivilegio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPUsuarioPrivilegio'
    OnCalcFields = CDSUsuarioPrivilegioCalcFields
    Left = 704
    Top = 384
    object CDSUsuarioPrivilegioUSUARIO_PRIVILEGIO_ID: TLargeintField
      FieldName = 'USUARIO_PRIVILEGIO_ID'
    end
    object CDSUsuarioPrivilegioUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
    end
    object CDSUsuarioPrivilegioPRIVILEGIO_ID: TIntegerField
      FieldName = 'PRIVILEGIO_ID'
    end
    object CDSUsuarioPrivilegioACESSO: TSmallintField
      FieldName = 'ACESSO'
    end
    object CDSUsuarioPrivilegiolook_descricao: TStringField
      FieldKind = fkLookup
      FieldName = 'look_descricao'
      LookupDataSet = CDSPrivilegio
      LookupKeyFields = 'PRIVILEGIO_ID'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PRIVILEGIO_ID'
      Size = 40
      Lookup = True
    end
    object CDSUsuarioPrivilegiolook_abreviacao: TStringField
      FieldKind = fkLookup
      FieldName = 'look_abreviacao'
      LookupDataSet = CDSPrivilegio
      LookupKeyFields = 'PRIVILEGIO_ID'
      LookupResultField = 'ABREVIACAO'
      KeyFields = 'PRIVILEGIO_ID'
      Size = 40
      Lookup = True
    end
    object CDSUsuarioPrivilegiocalc_tabela_descricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tabela_descricao'
      Size = 40
      Calculated = True
    end
  end
  object DSPUsuarioPrivilegio: TDataSetProvider
    DataSet = qryCsUsuarioPrivilegio
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 704
    Top = 341
  end
  object qryCsUsuarioPrivilegio: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from usuario_privilegio where usuario_id = 0')
    SQLConnection = BancoDados.Conexao
    Left = 704
    Top = 297
    object qryCsUsuarioPrivilegioUSUARIO_PRIVILEGIO_ID: TLargeintField
      FieldName = 'USUARIO_PRIVILEGIO_ID'
    end
    object qryCsUsuarioPrivilegioUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
    end
    object qryCsUsuarioPrivilegioPRIVILEGIO_ID: TIntegerField
      FieldName = 'PRIVILEGIO_ID'
    end
    object qryCsUsuarioPrivilegioACESSO: TSmallintField
      FieldName = 'ACESSO'
    end
  end
  object DSUsuarioPrivilegio: TDataSource
    DataSet = CDSUsuarioPrivilegio
    Left = 704
    Top = 432
  end
  object qryTabela: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from tabela where tabela = '#39#39)
    SQLConnection = BancoDados.Conexao
    Left = 614
    Top = 297
    object qryTabelaTABELA: TStringField
      FieldName = 'TABELA'
      Size = 60
    end
    object qryTabelaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryTabelaATIVAR_TRACE: TSmallintField
      FieldName = 'ATIVAR_TRACE'
    end
    object qryTabelaDESCRICAO_REDUZIDA: TStringField
      FieldName = 'DESCRICAO_REDUZIDA'
      Size = 60
    end
  end
  object DSPTabela: TDataSetProvider
    DataSet = qryTabela
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 615
    Top = 340
  end
  object CDSTabela: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPTabela'
    Left = 616
    Top = 384
    object CDSTabelaTABELA: TStringField
      FieldName = 'TABELA'
      Size = 60
    end
    object CDSTabelaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CDSTabelaATIVAR_TRACE: TSmallintField
      FieldName = 'ATIVAR_TRACE'
    end
    object CDSTabelaDESCRICAO_REDUZIDA: TStringField
      FieldName = 'DESCRICAO_REDUZIDA'
      Size = 60
    end
  end
  object DSTabela: TDataSource
    DataSet = CDSTabela
    Left = 616
    Top = 432
  end
end
