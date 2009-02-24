object CadFornecedorForm: TCadFornecedorForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Fornecedores'
  ClientHeight = 532
  ClientWidth = 749
  Color = 8673536
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object AbaSuperior: TPageControl
    Left = 0
    Top = 0
    Width = 749
    Height = 532
    ActivePage = tsConsulta
    Align = alClient
    TabOrder = 0
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      OnShow = tsConsultaShow
      object Panel1: TPanel
        Left = 0
        Top = 470
        Width = 741
        Height = 34
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 0
        object Label1: TLabel
          Left = 60
          Top = 9
          Width = 44
          Height = 13
          Caption = 'Crit'#233'rio:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 271
          Top = 10
          Width = 44
          Height = 13
          Caption = 'Crit'#233'rio:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object BTPesquisar: THTMLButton
          Left = 613
          Top = 5
          Width = 121
          Height = 25
          Hint = 'BtnLimpar'
          Caption = 'Pesquisar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = BTPesquisarClick
          Alignment = haCenter
          Background = stNormal
          BorderColor = clGray
          Color = 11114608
          DownColor = 8673536
          Flat = True
          HoverColor = 8673536
          VAlignment = vaCenter
          Version = '1.4.5.1'
        end
        object CBPesquisar: TComboBox
          Left = 112
          Top = 5
          Width = 122
          Height = 23
          BevelKind = bkFlat
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ItemHeight = 15
          ItemIndex = 1
          ParentFont = False
          TabOrder = 1
          Text = 'Raz'#227'o Social'
          OnChange = CBPesquisarChange
          Items.Strings = (
            'C'#243'digo'
            'Raz'#227'o Social'
            'Nome Fantasia'
            'Tel. Comercial'
            'Fax')
        end
        object EditPesquisar: TEdit
          Left = 323
          Top = 6
          Width = 254
          Height = 19
          AutoSize = False
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = EditPesquisarChange
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 56
        Width = 740
        Height = 413
        Color = 13619151
        DataSource = BancoDeDados.DSqryCsFornecedor
        FixedColor = 8673536
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'idfornecedor'
            Title.Caption = 'Fornec. I.D'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'razao_social'
            Title.Caption = 'Raz'#227'o Social'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 320
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefone_comercial'
            Title.Caption = 'Tel. Comercial'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefone_fax'
            Title.Caption = 'Fax'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 150
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 296
        Height = 53
        BevelKind = bkFlat
        BevelOuter = bvNone
        Color = 8673536
        ParentBackground = False
        TabOrder = 2
        object BTInserir: THTMLButton
          Left = 1
          Top = 1
          Width = 94
          Height = 46
          Hint = 'BtnLimpar'
          Caption = 'Inserir'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = BTInserirClick
          Alignment = haCenter
          Background = stNormal
          BorderColor = clGray
          Color = 13619151
          DownColor = 8673536
          Flat = True
          HoverColor = 11114608
          VAlignment = vaCenter
          Version = '1.4.5.1'
        end
        object BTAlterar: THTMLButton
          Left = 97
          Top = 1
          Width = 96
          Height = 46
          Hint = 'BtnLimpar'
          Caption = 'Alterar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = BTAlterarClick
          Alignment = haCenter
          Background = stNormal
          BorderColor = clGray
          Color = 13619151
          DownColor = 8673536
          Flat = True
          HoverColor = 11114608
          VAlignment = vaCenter
          Version = '1.4.5.1'
        end
        object BTSair: THTMLButton
          Left = 195
          Top = 1
          Width = 96
          Height = 46
          Hint = 'BtnLimpar'
          Caption = 'Sair'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = BTSairClick
          Alignment = haCenter
          Background = stNormal
          BorderColor = clGray
          Color = 13619151
          DownColor = 8673536
          Flat = True
          HoverColor = 11114608
          VAlignment = vaCenter
          Version = '1.4.5.1'
        end
      end
      object CHApenasAtivos: TCheckBox
        Left = 326
        Top = 17
        Width = 121
        Height = 17
        Caption = 'Exibir Apenas Ativos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    object tsManutencao: TTabSheet
      Caption = 'Manuten'#231#227'o'
      ImageIndex = 1
      OnShow = tsManutencaoShow
      object Label28: TLabel
        Left = 477
        Top = 25
        Width = 71
        Height = 13
        Caption = 'Data Cadastro:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Panel4: TPanel
        Left = 128
        Top = 6
        Width = 213
        Height = 49
        Color = 8673536
        ParentBackground = False
        TabOrder = 0
        object Label5: TLabel
          Left = 16
          Top = 15
          Width = 68
          Height = 13
          Caption = 'Fornecedor:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText1: TDBText
          Left = 96
          Top = 12
          Width = 112
          Height = 17
          DataField = 'idsubgrupo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clSilver
          Font.Height = -16
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object DBCheckBox2: TDBCheckBox
        Left = 368
        Top = 22
        Width = 65
        Height = 17
        TabStop = False
        Caption = 'Ativo'
        DataField = 'ativo'
        DataSource = BancoDeDados.DSqryCadFornecedor
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object Panel3: TPanel
        Left = 0
        Top = 450
        Width = 741
        Height = 54
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 2
        object BTGravar: THTMLButton
          Left = 3
          Top = 5
          Width = 94
          Height = 46
          Hint = 'BtnLimpar'
          Caption = 'Gravar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = BTGravarClick
          Alignment = haCenter
          Background = stNormal
          BorderColor = clGray
          Color = 11114608
          DownColor = 8673536
          Flat = True
          HoverColor = 8673536
          VAlignment = vaCenter
          Version = '1.4.5.1'
        end
        object BTCancelar: THTMLButton
          Left = 100
          Top = 5
          Width = 94
          Height = 46
          Hint = 'BTCancelar'
          Caption = 'Cancelar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          TabStop = False
          OnClick = BTCancelarClick
          Alignment = haCenter
          Background = stNormal
          BorderColor = clGray
          Color = 11114608
          DownColor = 8673536
          Flat = True
          HoverColor = 8673536
          VAlignment = vaCenter
          Version = '1.4.5.1'
        end
        object BTExcluir: THTMLButton
          Left = 197
          Top = 5
          Width = 94
          Height = 46
          Hint = 'BTExcluir'
          Caption = 'Excluir'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          TabStop = False
          OnClick = BTExcluirClick
          Alignment = haCenter
          Background = stNormal
          BorderColor = clGray
          Color = 11114608
          DownColor = 8673536
          Flat = True
          HoverColor = 8673536
          VAlignment = vaCenter
          Version = '1.4.5.1'
        end
      end
      object tsPrincipal: TTabSet
        Left = 0
        Top = 429
        Width = 741
        Height = 21
        Align = alBottom
        AutoScroll = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Tabs.Strings = (
          'Principal'
          'Complemento')
        TabIndex = 0
        OnClick = tsPrincipalClick
      end
      object NBManutencao: TNotebook
        Left = 3
        Top = 61
        Width = 739
        Height = 365
        TabOrder = 4
        object TPage
          Left = 0
          Top = 0
          Caption = 'Principal'
          object Label3: TLabel
            Left = 32
            Top = 29
            Width = 66
            Height = 13
            Caption = 'Raz'#227'o Social:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label4: TLabel
            Left = 32
            Top = 89
            Width = 66
            Height = 13
            Caption = 'Endere'#231'o/N'#186':'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label6: TLabel
            Left = 595
            Top = 89
            Width = 5
            Height = 13
            Caption = '/'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label7: TLabel
            Left = 31
            Top = 119
            Width = 67
            Height = 13
            Caption = 'Complemento:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label8: TLabel
            Left = 68
            Top = 149
            Width = 30
            Height = 13
            Caption = 'Bairro:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 62
            Top = 179
            Width = 36
            Height = 13
            Caption = 'Cidade:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label10: TLabel
            Left = 24
            Top = 59
            Width = 74
            Height = 13
            Caption = 'Nome Fantasia:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label11: TLabel
            Left = 74
            Top = 209
            Width = 24
            Height = 13
            Caption = 'CEP:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label12: TLabel
            Left = 399
            Top = 209
            Width = 61
            Height = 13
            Caption = 'Caixa Postal:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label13: TLabel
            Left = 28
            Top = 239
            Width = 70
            Height = 13
            Caption = 'Tel. Comercial:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label14: TLabel
            Left = 406
            Top = 239
            Width = 20
            Height = 13
            Caption = 'Fax:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label15: TLabel
            Left = 58
            Top = 269
            Width = 40
            Height = 13
            Caption = 'Contato:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label16: TLabel
            Left = 67
            Top = 299
            Width = 31
            Height = 13
            Caption = 'E-mail:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label17: TLabel
            Left = 570
            Top = 179
            Width = 17
            Height = 13
            Caption = 'UF:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label18: TLabel
            Left = 39
            Top = 329
            Width = 59
            Height = 13
            Caption = 'Home Page:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBEditNome: TDBEdit
            Left = 126
            Top = 24
            Width = 546
            Height = 24
            CharCase = ecUpperCase
            DataField = 'razao_social'
            DataSource = BancoDeDados.DSqryCadFornecedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEdit1: TDBEdit
            Left = 126
            Top = 84
            Width = 461
            Height = 24
            DataField = 'endereco'
            DataSource = BancoDeDados.DSqryCadFornecedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBEdit2: TDBEdit
            Left = 607
            Top = 84
            Width = 65
            Height = 24
            DataField = 'numero'
            DataSource = BancoDeDados.DSqryCadFornecedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object DBEdit3: TDBEdit
            Left = 126
            Top = 114
            Width = 409
            Height = 24
            DataField = 'complemento'
            DataSource = BancoDeDados.DSqryCadFornecedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object DBEdit4: TDBEdit
            Left = 126
            Top = 144
            Width = 409
            Height = 24
            DataField = 'bairro'
            DataSource = BancoDeDados.DSqryCadFornecedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object DBEdit5: TDBEdit
            Left = 126
            Top = 174
            Width = 409
            Height = 24
            DataField = 'cidade'
            DataSource = BancoDeDados.DSqryCadFornecedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object DBEdit6: TDBEdit
            Left = 126
            Top = 54
            Width = 546
            Height = 24
            DataField = 'nome_fantasia'
            DataSource = BancoDeDados.DSqryCadFornecedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBEdit7: TDBEdit
            Left = 126
            Top = 204
            Width = 185
            Height = 24
            DataField = 'cep'
            DataSource = BancoDeDados.DSqryCadFornecedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object DBEdit8: TDBEdit
            Left = 487
            Top = 204
            Width = 185
            Height = 24
            DataField = 'caixa_postal'
            DataSource = BancoDeDados.DSqryCadFornecedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
          end
          object DBEdit9: TDBEdit
            Left = 126
            Top = 234
            Width = 217
            Height = 24
            DataField = 'telefone_comercial'
            DataSource = BancoDeDados.DSqryCadFornecedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
          end
          object DBEdit10: TDBEdit
            Left = 455
            Top = 234
            Width = 217
            Height = 24
            DataField = 'telefone_fax'
            DataSource = BancoDeDados.DSqryCadFornecedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
          end
          object DBEdit11: TDBEdit
            Left = 126
            Top = 264
            Width = 409
            Height = 24
            DataField = 'contato'
            DataSource = BancoDeDados.DSqryCadFornecedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
          end
          object DBEdit12: TDBEdit
            Left = 126
            Top = 294
            Width = 409
            Height = 24
            DataField = 'email'
            DataSource = BancoDeDados.DSqryCadFornecedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
          end
          object DBEdit13: TDBEdit
            Left = 126
            Top = 324
            Width = 409
            Height = 24
            DataField = 'homepage'
            DataSource = BancoDeDados.DSqryCadFornecedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 14
          end
          object DBComboBox1: TDBComboBox
            Left = 607
            Top = 174
            Width = 65
            Height = 24
            DataField = 'uf'
            DataSource = BancoDeDados.DSqryCadFornecedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ItemHeight = 16
            Items.Strings = (
              'AC'
              'AL'
              'AM'
              'AP'
              'BA'
              'CE'
              'DF'
              'ES'
              'GO'
              'MA'
              'MG'
              'MS'
              'MT'
              'PA'
              'PB'
              'PE'
              'PI'
              'PN'
              'PR'
              'RJ'
              'RO'
              'RN'
              'RS'
              'SC'
              'SE'
              'SP'
              'TO')
            ParentFont = False
            TabOrder = 7
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'Complemento'
          object Label19: TLabel
            Left = 67
            Top = 29
            Width = 31
            Height = 13
            Caption = 'C.G.C:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label20: TLabel
            Left = 362
            Top = 29
            Width = 70
            Height = 13
            Caption = 'Insc. Estadual:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label21: TLabel
            Left = 14
            Top = 59
            Width = 84
            Height = 13
            Caption = 'Limite de Compra:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label22: TLabel
            Left = 295
            Top = 59
            Width = 71
            Height = 13
            Caption = 'Ultima Compra:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBEdit14: TDBEdit
            Left = 126
            Top = 24
            Width = 217
            Height = 24
            DataField = 'cgc'
            DataSource = BancoDeDados.DSqryCadFornecedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEdit15: TDBEdit
            Left = 456
            Top = 24
            Width = 216
            Height = 24
            DataField = 'insc'
            DataSource = BancoDeDados.DSqryCadFornecedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBEdit16: TDBEdit
            Left = 126
            Top = 54
            Width = 120
            Height = 24
            DataField = 'limite_compra'
            DataSource = BancoDeDados.DSqryCadFornecedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBCheckBox1: TDBCheckBox
            Left = 126
            Top = 85
            Width = 97
            Height = 17
            Caption = 'Preferencial'
            DataField = 'preferencial'
            DataSource = BancoDeDados.DSqryCadFornecedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DTUltimaCompra: TDBEdit
            Left = 392
            Top = 54
            Width = 121
            Height = 24
            TabStop = False
            DataField = 'ultima_compra'
            DataSource = BancoDeDados.DSqryCadFornecedor
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
        end
      end
      object DBDateEdit1: TDBDateEdit
        Left = 554
        Top = 21
        Width = 121
        Height = 24
        Margins.Left = 4
        Margins.Top = 1
        DataField = 'data_cadastro'
        DataSource = BancoDeDados.DSqryCadFornecedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 5
      end
    end
  end
end
