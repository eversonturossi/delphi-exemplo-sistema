inherited CadastroEmpresaForm: TCadastroEmpresaForm
  Caption = 'CadastroEmpresaForm'
  ClientHeight = 554
  ClientWidth = 814
  KeyPreview = True
  ExplicitWidth = 820
  ExplicitHeight = 580
  PixelsPerInch = 96
  TextHeight = 13
  inherited SBPrincipal: TStatusBar
    Top = 535
    Width = 814
    ExplicitTop = 535
    ExplicitWidth = 814
  end
  inherited Panel1: TPanel
    Height = 535
    ExplicitHeight = 535
    inherited JvGradientHeaderPanel1: TJvGradientHeaderPanel
      Height = 533
      ExplicitHeight = 533
    end
  end
  inherited PPrincipal: TPanel
    Width = 657
    Height = 535
    ExplicitWidth = 657
    ExplicitHeight = 535
    inherited Panel3: TPanel
      Width = 655
      ExplicitWidth = 655
      inherited DBText1: TDBText
        DataSource = BancoDados.DSPessoa
      end
      inherited DBText2: TDBText
        DataSource = BancoDados.DSPessoa
      end
      inherited DBCAtivo: TDBCheckBox
        DataSource = BancoDados.DSPessoa
      end
    end
    object PCPrincipal: TPageControl
      Left = 1
      Top = 84
      Width = 655
      Height = 450
      ActivePage = TSCadastro
      Align = alClient
      TabOrder = 1
      OnChange = PCPrincipalChange
      object TSCadastro: TTabSheet
        Caption = 'Cadastro'
        object Label8: TLabel
          Left = 45
          Top = 20
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Empresa I.D:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LBNome: TLabel
          Left = 75
          Top = 68
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
        object LBApelido: TLabel
          Left = 68
          Top = 95
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = 'Apelido:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LBDocumento: TLabel
          Left = 78
          Top = 122
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'CNPJ:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LBIE: TLabel
          Left = 16
          Top = 149
          Width = 90
          Height = 13
          Alignment = taRightJustify
          Caption = 'Inscri'#231#227'o Estadual:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LBIM: TLabel
          Left = 12
          Top = 176
          Width = 94
          Height = 13
          Alignment = taRightJustify
          Caption = 'Inscri'#231#227'o Municipal:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LBDataNascimento: TLabel
          Left = 21
          Top = 203
          Width = 85
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data Nascimento:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label12: TLabel
          Left = 367
          Top = 21
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object BTSalvarImagem: TSpeedButton
          Left = 355
          Top = 217
          Width = 91
          Height = 22
          Caption = 'Salvar'
          OnClick = BTSalvarImagemClick
        end
        object BTLimparImagem: TSpeedButton
          Left = 446
          Top = 217
          Width = 91
          Height = 22
          Caption = 'Limpar'
          OnClick = BTLimparImagemClick
        end
        object Label3: TLabel
          Left = 83
          Top = 250
          Width = 23
          Height = 13
          Alignment = taRightJustify
          Caption = 'Filial:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 186
          Top = 250
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Matriz:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object BTMatriz: TSpeedButton
          Left = 319
          Top = 245
          Width = 25
          Height = 24
          OnClick = BTMatrizClick
        end
        object DBText3: TDBText
          Left = 352
          Top = 250
          Width = 212
          Height = 17
          Hint = 'Data da '#250'ltima Altera'#231#227'o'
          DataField = 'calc_nome_matriz'
          DataSource = DSCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = 6590965
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 542
          Top = 68
          Width = 90
          Height = 13
          Alignment = taRightJustify
          Caption = 'Verificar Nome (F2)'
          Font.Charset = ANSI_CHARSET
          Font.Color = 6590965
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit1: TDBEdit
          Left = 123
          Top = 17
          Width = 94
          Height = 21
          TabStop = False
          Color = clScrollBar
          DataField = 'EMPRESA_ID'
          DataSource = DSCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object DBEditNome: TDBEdit
          Left = 123
          Top = 65
          Width = 414
          Height = 21
          DataField = 'NOME_RAZAO'
          DataSource = BancoDados.DSPessoa
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnExit = RemoveAcento
        end
        object DBEditApelido: TDBEdit
          Left = 123
          Top = 92
          Width = 414
          Height = 21
          DataField = 'NOME_APELIDO_FANTASIA'
          DataSource = BancoDados.DSPessoa
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnExit = RemoveAcento
        end
        object DBEditDocumento: TDBEdit
          Left = 123
          Top = 119
          Width = 182
          Height = 21
          DataField = 'CNPJ_CPF'
          DataSource = DSCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnExit = DBEditDocumentoExit
        end
        object DBEditIE: TDBEdit
          Left = 123
          Top = 146
          Width = 182
          Height = 21
          DataField = 'IE_IDENTIDADE'
          DataSource = DSCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object DBEditIM: TDBEdit
          Left = 123
          Top = 173
          Width = 182
          Height = 21
          DataField = 'IM'
          DataSource = DSCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object DBDataNascimento: TJvDBDateEdit
          Left = 123
          Top = 200
          Width = 129
          Height = 21
          TabStop = False
          DataField = 'DATA_NASCIMENTO'
          DataSource = DSCadastro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Visible = False
        end
        object CBTipo: TComboBox
          Left = 408
          Top = 17
          Width = 129
          Height = 22
          Style = csOwnerDrawFixed
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 7
          TabStop = False
          Text = 'Pessoa F'#237'sica'
          OnSelect = CBTipoSelect
          Items.Strings = (
            'Pessoa F'#237'sica'
            'Pessoa Jur'#237'dica')
        end
        object DSSFilial: TJvDBSpinEdit
          Left = 123
          Top = 247
          Width = 39
          Height = 21
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnChange = DSSFilialChange
          DataField = 'FILIAL'
          DataSource = DSCadastro
        end
        object DBEditMatriz: TDBEdit
          Left = 230
          Top = 247
          Width = 90
          Height = 21
          DataField = 'EMPRESA_MATRIZ'
          DataSource = DSCadastro
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object PImagem: TPanel
          Left = 355
          Top = 119
          Width = 182
          Height = 97
          BorderStyle = bsSingle
          Caption = 'Imagem'
          TabOrder = 10
          object DBImage: TDBImage
            Left = -11
            Top = -8
            Width = 193
            Height = 105
            DataField = 'IMAGEM'
            DataSource = BancoDados.DSPessoaImagem
            Stretch = True
            TabOrder = 0
          end
        end
      end
      object TSEnderecoContato: TTabSheet
        Caption = 'Endere'#231'os/Contatos'
        ImageIndex = 1
        object Label14: TLabel
          Left = 49
          Top = 205
          Width = 81
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo de Contato:'
        end
        object GroupBox1: TGroupBox
          Left = 51
          Top = 18
          Width = 572
          Height = 151
          TabOrder = 1
          object Label6: TLabel
            Left = 64
            Top = 54
            Width = 15
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186':'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label5: TLabel
            Left = 189
            Top = 54
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Complemento:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label7: TLabel
            Left = 49
            Top = 81
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bairro:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 396
            Top = 81
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'CEP:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label10: TLabel
            Left = 43
            Top = 108
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cidade:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object BTMunicipio: TSpeedButton
            Left = 422
            Top = 103
            Width = 25
            Height = 24
            OnClick = BTMunicipioClick
          end
          object Label11: TLabel
            Left = 488
            Top = 108
            Width = 17
            Height = 13
            Alignment = taRightJustify
            Caption = 'UF:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBText4: TDBText
            Left = 516
            Top = 108
            Width = 21
            Height = 17
            Hint = 'Data da '#250'ltima Altera'#231#227'o'
            DataField = 'calc_municipio_uf'
            DataSource = BancoDados.DSPessoaEndereco
            Font.Charset = ANSI_CHARSET
            Font.Color = 6590965
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 30
            Top = 27
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Endere'#231'o:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBEditNumero: TDBEdit
            Left = 96
            Top = 51
            Width = 65
            Height = 21
            DataField = 'NUMERO'
            DataSource = BancoDados.DSPessoaEndereco
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnExit = RemoveAcento
          end
          object DBEditComplemento: TDBEdit
            Left = 276
            Top = 51
            Width = 261
            Height = 21
            DataField = 'COMPLEMENTO'
            DataSource = BancoDados.DSPessoaEndereco
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnExit = RemoveAcento
          end
          object DBEditBairro: TDBEdit
            Left = 96
            Top = 78
            Width = 257
            Height = 21
            DataField = 'BAIRRO'
            DataSource = BancoDados.DSPessoaEndereco
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnExit = RemoveAcento
          end
          object DBEditCEP: TDBEdit
            Left = 440
            Top = 78
            Width = 97
            Height = 21
            DataField = 'CEP'
            DataSource = BancoDados.DSPessoaEndereco
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object DBEdit7: TDBEdit
            Left = 96
            Top = 105
            Width = 327
            Height = 21
            TabStop = False
            DataField = 'calc_municipio_nome'
            DataSource = BancoDados.DSPessoaEndereco
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object DBEditEndereco: TDBEdit
            Left = 96
            Top = 24
            Width = 441
            Height = 21
            DataField = 'ENDERECO'
            DataSource = BancoDados.DSPessoaEndereco
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
        object DBNEndereco: TDBNavigator
          Left = 395
          Top = 169
          Width = 228
          Height = 25
          DataSource = BancoDados.DSPessoaEndereco
          VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbPost, nbCancel]
          Hints.Strings = (
            'Primeiro Registro'
            'Registro Anterior'
            'Pr'#243'ximo Registro'
            #218'ltimo Registro'
            'Inserir Registro'
            'Excluir Registro'
            'Alterar Registro'
            'Salvar Registro'
            'Cancelar Altera'#231#227'o'
            'Atualizar Registros')
          ConfirmDelete = False
          TabOrder = 0
          OnClick = DBNEnderecoClick
        end
        object CBPessoaContatoTipo: TComboBox
          Left = 147
          Top = 202
          Width = 150
          Height = 22
          Hint = 'Condi'#231#227'o utilizada para Pesquisa'
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 2
          Text = '<selecione>'
          OnSelect = CBPessoaContatoTipoSelect
          Items.Strings = (
            '<selecione>')
        end
        object DBGrid1: TDBGrid
          Left = 147
          Top = 231
          Width = 476
          Height = 178
          DataSource = BancoDados.DSPessoaContato
          FixedColor = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clDefault
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          PopupMenu = PopupMenu1
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'calc_contato_tipo_descricao'
              ReadOnly = True
              Title.Caption = 'Tipo de Contato'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Title.Caption = 'Contato'
              Width = 300
              Visible = True
            end>
        end
      end
      object TSUsuario: TTabSheet
        Caption = 'Usu'#225'rios'
        ImageIndex = 2
        object DBGrid2: TDBGrid
          Left = 51
          Top = 41
          Width = 566
          Height = 360
          DataSource = DSEmpresaUsuario
          FixedColor = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clDefault
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          PopupMenu = PopupMenu1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = DBGrid2CellClick
          OnDrawColumnCell = DBGrid2DrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'USUARIO_ID'
              ReadOnly = True
              Title.Caption = 'Usuario I.D'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              ReadOnly = True
              Title.Caption = 'Nome'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOGIN'
              ReadOnly = True
              Title.Caption = 'Login'
              Width = 120
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'LIBERADO'
              Title.Caption = 'Liberado'
              Visible = True
            end>
        end
        object CBMarcar: TCheckBox
          Left = 533
          Top = 23
          Width = 84
          Height = 17
          Hint = 'Marcar/Desmarcar Todos'
          Caption = 'Marcar Todos'
          TabOrder = 1
          OnClick = CBMarcarClick
        end
      end
    end
  end
  inherited CDSCadastro: TClientDataSet
    OnCalcFields = CDSCadastroCalcFields
    object CDSCadastroEMPRESA_ID: TIntegerField
      FieldName = 'EMPRESA_ID'
      DisplayFormat = '0000000000'
    end
    object CDSCadastroPESSOA_ID: TIntegerField
      FieldName = 'PESSOA_ID'
    end
    object CDSCadastroCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 14
    end
    object CDSCadastroIE_IDENTIDADE: TStringField
      FieldName = 'IE_IDENTIDADE'
      Size = 14
    end
    object CDSCadastroFILIAL: TSmallintField
      FieldName = 'FILIAL'
    end
    object CDSCadastroTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object CDSCadastroDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
    end
    object CDSCadastroIM: TStringField
      FieldName = 'IM'
      Size = 25
    end
    object CDSCadastrocalc_nome_matriz: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nome_matriz'
      Calculated = True
    end
    object CDSCadastroEMPRESA_MATRIZ: TIntegerField
      FieldName = 'EMPRESA_MATRIZ'
    end
  end
  inherited qryCadastro: TSQLQuery
    SQL.Strings = (
      'select * from empresa where empresa_id = 0')
  end
  inherited ActionList: TActionList
    object AVerificarNome: TAction
      Caption = 'AVerificarNome'
      ShortCut = 113
      OnExecute = AVerificarNomeExecute
    end
  end
  object SDPessoaImagem: TSaveDialog
    Left = 700
  end
  object PopupMenu1: TPopupMenu
    Left = 544
    Top = 45
    object ExcluirContato1: TMenuItem
      Caption = 'Excluir Contato'
      OnClick = ExcluirContato1Click
    end
  end
  object qryEmpresaUsuario: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from usuario where usuario_id = 0')
    SQLConnection = BancoDados.Conexao
    Left = 580
    Top = 45
  end
  object DSPEmpresaUsuario: TDataSetProvider
    DataSet = qryEmpresaUsuario
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 615
    Top = 46
  end
  object CDSEmpresaUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPEmpresaUsuario'
    Left = 649
    Top = 46
    object CDSEmpresaUsuarioUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
      Required = True
      DisplayFormat = '0000000000'
    end
    object CDSEmpresaUsuarioNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object CDSEmpresaUsuarioLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 25
    end
    object CDSEmpresaUsuarioLIBERADO: TSmallintField
      FieldName = 'LIBERADO'
    end
  end
  object DSEmpresaUsuario: TDataSource
    DataSet = CDSEmpresaUsuario
    Left = 684
    Top = 46
  end
  object CDSEmpresaFilial: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPEmpresaFilial'
    Left = 649
    Top = 89
  end
  object DSPEmpresaFilial: TDataSetProvider
    DataSet = qryEmpresaFilial
    Options = [poAutoRefresh, poUseQuoteChar]
    Left = 616
    Top = 89
  end
  object qryEmpresaFilial: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from empresa where empresa_matrix = 0')
    SQLConnection = BancoDados.Conexao
    Left = 580
    Top = 88
  end
end
