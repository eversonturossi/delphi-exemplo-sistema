object CadClienteForm: TCadClienteForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Clientes...'
  ClientHeight = 493
  ClientWidth = 798
  Color = 8673536
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object AbaSuperior: TPageControl
    Left = 0
    Top = 0
    Width = 798
    Height = 493
    ActivePage = tsManutencao
    Align = alClient
    TabOrder = 0
    OnDrawTab = AbaSuperiorDrawTab
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      object Panel1: TPanel
        Left = 0
        Top = 431
        Width = 790
        Height = 34
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 0
        object Label1: TLabel
          Left = 48
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
          Left = 288
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
        object BTPesquisar: THTMLButton
          Left = 665
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
          Left = 100
          Top = 5
          Width = 145
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
          Text = 'Nome'
          OnChange = CBPesquisarChange
          Items.Strings = (
            'C'#243'digo'
            'Nome'
            'Raz'#227'o Social'
            'Tel. Celular'
            'Tel. Comercia'
            'Tel. Residencial'
            'CPF'
            'CGC'
            'RG'
            'Insc. Estadual')
        end
        object EditPesquisar: TEdit
          Left = 340
          Top = 8
          Width = 290
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
        Top = 58
        Width = 789
        Height = 372
        Color = 13619151
        FixedColor = 8673536
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'idcliente'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            Title.Caption = 'Cliente I.D'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            Title.Caption = 'Nome'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 270
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefone_celular'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            Title.Caption = 'Tel. Celular'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefone_comercial'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            Title.Caption = 'Tel. Comercial'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefone_residencial'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            Title.Caption = 'Tel. Residencial'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fax'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            Title.Caption = 'Fax'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 100
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
      object NBManutencao: TNotebook
        Left = 0
        Top = 0
        Width = 790
        Height = 411
        Align = alClient
        TabOrder = 0
        object TPage
          Left = 0
          Top = 0
          Caption = 'Fisica'
          object Label32: TLabel
            Left = 402
            Top = 20
            Width = 90
            Height = 16
            Caption = 'Data Cadastro:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Panel4: TPanel
            Left = 128
            Top = 6
            Width = 185
            Height = 49
            Color = 8673536
            ParentBackground = False
            TabOrder = 0
            object Label5: TLabel
              Left = 16
              Top = 16
              Width = 43
              Height = 13
              Caption = 'Cliente:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText1: TDBText
              Left = 74
              Top = 13
              Width = 97
              Height = 17
              DataField = 'idcliente'
              Font.Charset = ANSI_CHARSET
              Font.Color = clSilver
              Font.Height = -16
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object TSFisica: TTabSet
            Left = 0
            Top = 392
            Width = 790
            Height = 19
            Align = alBottom
            AutoScroll = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            StartMargin = 0
            TabHeight = 25
            Tabs.Strings = (
              'Principal'
              'Complemento')
            TabIndex = 0
            OnClick = TSFisicaClick
          end
          object NBFisicaCadastro: TNotebook
            Left = 1
            Top = 65
            Width = 788
            Height = 326
            TabOrder = 2
            object TPage
              Left = 0
              Top = 0
              Caption = 'Principal'
              object Label3: TLabel
                Left = 72
                Top = 8
                Width = 31
                Height = 13
                Alignment = taRightJustify
                Caption = 'Nome:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label4: TLabel
                Left = 612
                Top = 40
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
              object Label6: TLabel
                Left = 37
                Top = 40
                Width = 66
                Height = 13
                Alignment = taRightJustify
                Caption = 'Endere'#231'o/N'#186':'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label7: TLabel
                Left = 36
                Top = 70
                Width = 67
                Height = 13
                Alignment = taRightJustify
                Caption = 'Complemento:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label8: TLabel
                Left = 74
                Top = 100
                Width = 30
                Height = 13
                Alignment = taRightJustify
                Caption = 'Bairro:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label9: TLabel
                Left = 68
                Top = 130
                Width = 36
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cidade:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label10: TLabel
                Left = 589
                Top = 130
                Width = 17
                Height = 13
                Alignment = taRightJustify
                Caption = 'UF:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label11: TLabel
                Left = 80
                Top = 160
                Width = 24
                Height = 13
                Alignment = taRightJustify
                Caption = 'CEP:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label12: TLabel
                Left = 417
                Top = 160
                Width = 61
                Height = 13
                Alignment = taRightJustify
                Caption = 'Caixa Postal:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label13: TLabel
                Left = 25
                Top = 190
                Width = 79
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tel. Residencial:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label14: TLabel
                Left = 388
                Top = 190
                Width = 56
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tel. Celular:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label15: TLabel
                Left = 63
                Top = 220
                Width = 40
                Height = 13
                Alignment = taRightJustify
                Caption = 'Contato:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label16: TLabel
                Left = 72
                Top = 250
                Width = 31
                Height = 13
                Alignment = taRightJustify
                Caption = 'E-mail:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label17: TLabel
                Left = 45
                Top = 280
                Width = 59
                Height = 13
                Alignment = taRightJustify
                Caption = 'Home Page:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label34: TLabel
                Left = 476
                Top = 280
                Width = 85
                Height = 13
                Caption = 'Data Nascimento:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object DBEditFisicaNome: TDBEdit
                Left = 128
                Top = 5
                Width = 561
                Height = 24
                CharCase = ecUpperCase
                DataField = 'nome'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object DBEdit2: TDBEdit
                Left = 128
                Top = 35
                Width = 478
                Height = 24
                DataField = 'endereco'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object DBEdit3: TDBEdit
                Left = 624
                Top = 35
                Width = 65
                Height = 24
                DataField = 'numero'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
              object DBEdit4: TDBEdit
                Left = 128
                Top = 65
                Width = 409
                Height = 24
                DataField = 'complemento'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object DBEdit5: TDBEdit
                Left = 128
                Top = 95
                Width = 409
                Height = 24
                DataField = 'bairro'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
              end
              object DBEdit6: TDBEdit
                Left = 128
                Top = 125
                Width = 409
                Height = 24
                DataField = 'cidade'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
              object DBComboBox1: TDBComboBox
                Left = 624
                Top = 125
                Width = 65
                Height = 24
                DataField = 'estado'
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
                TabOrder = 6
              end
              object DBEdit7: TDBEdit
                Left = 128
                Top = 155
                Width = 185
                Height = 24
                DataField = 'cep'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 7
              end
              object DBEdit8: TDBEdit
                Left = 504
                Top = 155
                Width = 185
                Height = 24
                DataField = 'caixa_postal'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 8
              end
              object DBMemo1: TDBMemo
                Left = 128
                Top = 185
                Width = 217
                Height = 24
                DataField = 'telefone_residencial'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 9
              end
              object DBMemo2: TDBMemo
                Left = 472
                Top = 185
                Width = 217
                Height = 24
                DataField = 'telefone_celular'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 10
              end
              object DBEdit9: TDBEdit
                Left = 128
                Top = 215
                Width = 409
                Height = 24
                DataField = 'contato'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 11
              end
              object DBEdit10: TDBEdit
                Left = 128
                Top = 245
                Width = 409
                Height = 24
                DataField = 'email'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 12
              end
              object DBEdit11: TDBEdit
                Left = 128
                Top = 275
                Width = 316
                Height = 24
                DataField = 'homepage'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 13
              end
              object DTNascimento: TDateTimePicker
                Left = 578
                Top = 275
                Width = 111
                Height = 24
                Date = 39772.966502812500000000
                Time = 39772.966502812500000000
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 14
              end
            end
            object TPage
              Left = 0
              Top = 0
              Caption = 'Complemento'
              object Label18: TLabel
                Left = 84
                Top = 10
                Width = 22
                Height = 13
                Alignment = taRightJustify
                Caption = 'R.G:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label21: TLabel
                Left = 83
                Top = 40
                Width = 23
                Height = 13
                Alignment = taRightJustify
                Caption = 'CPF:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label22: TLabel
                Left = 530
                Top = 10
                Width = 17
                Height = 13
                Alignment = taRightJustify
                Caption = 'UF:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label23: TLabel
                Left = 379
                Top = 10
                Width = 32
                Height = 13
                Alignment = taRightJustify
                Caption = #211'rg'#227'o:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label25: TLabel
                Left = 34
                Top = 70
                Width = 72
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ref. Comercial:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label26: TLabel
                Left = 38
                Top = 100
                Width = 68
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ref. Banc'#225'ria:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label19: TLabel
                Left = 43
                Top = 130
                Width = 63
                Height = 13
                Caption = 'Naturalidade:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label24: TLabel
                Left = 523
                Top = 130
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
              object Label20: TLabel
                Left = 373
                Top = 160
                Width = 24
                Height = 13
                Caption = 'Esc.:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label27: TLabel
                Left = 35
                Top = 160
                Width = 71
                Height = 13
                Caption = 'Nacionalidade:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label28: TLabel
                Left = 64
                Top = 190
                Width = 42
                Height = 13
                Caption = 'Conjuge:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label29: TLabel
                Left = 493
                Top = 190
                Width = 67
                Height = 13
                Caption = 'Dependentes:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label30: TLabel
                Left = 201
                Top = 220
                Width = 26
                Height = 13
                Caption = 'Data:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label31: TLabel
                Left = 474
                Top = 219
                Width = 26
                Height = 13
                Caption = 'Data:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label33: TLabel
                Left = 446
                Top = 40
                Width = 27
                Height = 13
                Caption = 'Sexo:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object DBEdit12: TDBEdit
                Left = 128
                Top = 5
                Width = 212
                Height = 24
                DataField = 'rg'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object DBEdit13: TDBEdit
                Left = 430
                Top = 5
                Width = 61
                Height = 24
                DataField = 'rg_orgao'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object DBEdit14: TDBEdit
                Left = 128
                Top = 35
                Width = 212
                Height = 24
                DataField = 'cpf'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object DBEdit17: TDBEdit
                Left = 128
                Top = 65
                Width = 491
                Height = 24
                DataField = 'referencia_comercial'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
              object DBEdit18: TDBEdit
                Left = 128
                Top = 95
                Width = 491
                Height = 24
                DataField = 'referencia_comercial'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
              end
              object DBEdit19: TDBEdit
                Left = 128
                Top = 125
                Width = 332
                Height = 24
                DataField = 'naturalidade'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 7
              end
              object DBEdit20: TDBEdit
                Left = 576
                Top = 185
                Width = 43
                Height = 24
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 12
              end
              object DBEdit21: TDBEdit
                Left = 128
                Top = 155
                Width = 212
                Height = 24
                DataField = 'nacionalidade'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 9
              end
              object DBEdit24: TDBEdit
                Left = 127
                Top = 185
                Width = 322
                Height = 24
                DataField = 'conjuge'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 11
              end
              object DBComboBox2: TDBComboBox
                Left = 555
                Top = 125
                Width = 64
                Height = 24
                DataField = 'naturalidade_uf'
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
                TabOrder = 8
              end
              object DBComboBox3: TDBComboBox
                Left = 416
                Top = 155
                Width = 203
                Height = 24
                DataField = 'escolaridade'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ItemHeight = 16
                Items.Strings = (
                  '1'#186' Grau - Imcompleto'
                  '1'#186' Grau - Completo'
                  '2'#186' Grau - Imcompleto'
                  '2'#186' Grau - Completo'
                  'N'#237'vel Superior - Imcompleto'
                  'N'#237'vel Superior - Completo'
                  'P'#243's-Gradua'#231#227'o')
                ParentFont = False
                TabOrder = 10
              end
              object DBCheckBox1: TDBCheckBox
                Left = 374
                Top = 218
                Width = 81
                Height = 17
                Caption = 'SERASA'
                DataField = 'serasa'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 14
                ValueChecked = 'True'
                ValueUnchecked = 'False'
              end
              object DBComboBox4: TDBComboBox
                Left = 490
                Top = 35
                Width = 129
                Height = 24
                DataField = 'sexo'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ItemHeight = 16
                Items.Strings = (
                  'Masculino'
                  'Feminino')
                ParentFont = False
                TabOrder = 4
              end
              object DBComboBox5: TDBComboBox
                Left = 562
                Top = 5
                Width = 57
                Height = 24
                DataField = 'rg_uf'
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
                TabOrder = 2
              end
              object DBCheckBox3: TDBCheckBox
                Left = 128
                Top = 219
                Width = 53
                Height = 17
                Caption = 'SPC'
                DataField = 'spc'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 13
                ValueChecked = 'True'
                ValueUnchecked = 'False'
              end
              object DBDateEdit3: TDBDateEdit
                Left = 234
                Top = 217
                Width = 106
                Height = 21
                Margins.Left = 4
                Margins.Top = 1
                DataField = 'spc_data'
                NumGlyphs = 2
                TabOrder = 15
              end
              object DBDateEdit4: TDBDateEdit
                Left = 513
                Top = 215
                Width = 106
                Height = 21
                Margins.Left = 4
                Margins.Top = 1
                DataField = 'serasa_data'
                NumGlyphs = 2
                TabOrder = 16
              end
            end
          end
          object DBCheckBox2: TDBCheckBox
            Left = 319
            Top = 21
            Width = 65
            Height = 17
            Caption = 'Ativo'
            DataField = 'ativo'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBDateEdit2: TDBDateEdit
            Left = 499
            Top = 19
            Width = 121
            Height = 24
            Margins.Left = 4
            Margins.Top = 1
            DataField = 'data_cadastro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 4
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'Juridica'
          object Label36: TLabel
            Left = 460
            Top = 23
            Width = 90
            Height = 16
            Caption = 'Data Cadastro:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TSJuridica: TTabSet
            Left = 0
            Top = 392
            Width = 790
            Height = 19
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
            OnClick = TSJuridicaClick
          end
          object NBJuridicaCadastro: TNotebook
            Left = 3
            Top = 64
            Width = 788
            Height = 326
            TabOrder = 1
            object TPage
              Left = 0
              Top = 0
              Caption = 'Principal'
              object Label37: TLabel
                Left = 69
                Top = 12
                Width = 31
                Height = 13
                Alignment = taRightJustify
                Caption = 'Nome:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label38: TLabel
                Left = 33
                Top = 42
                Width = 66
                Height = 13
                Alignment = taRightJustify
                Caption = 'Raz'#227'o Social;'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label39: TLabel
                Left = 612
                Top = 73
                Width = 5
                Height = 13
                Alignment = taRightJustify
                Caption = '/'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label40: TLabel
                Left = 33
                Top = 72
                Width = 66
                Height = 13
                Alignment = taRightJustify
                Caption = 'Endere'#231'o/N'#186':'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label41: TLabel
                Left = 32
                Top = 102
                Width = 67
                Height = 13
                Alignment = taRightJustify
                Caption = 'Complemento;'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label42: TLabel
                Left = 69
                Top = 132
                Width = 30
                Height = 13
                Alignment = taRightJustify
                Caption = 'Bairro:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label43: TLabel
                Left = 587
                Top = 162
                Width = 17
                Height = 13
                Alignment = taRightJustify
                Caption = 'UF:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label44: TLabel
                Left = 63
                Top = 162
                Width = 36
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cidade:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label45: TLabel
                Left = 75
                Top = 192
                Width = 24
                Height = 13
                Alignment = taRightJustify
                Caption = 'CEP:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label46: TLabel
                Left = 29
                Top = 222
                Width = 70
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tel. Comercial:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label47: TLabel
                Left = 417
                Top = 192
                Width = 61
                Height = 13
                Alignment = taRightJustify
                Caption = 'Caixa Postal:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label48: TLabel
                Left = 416
                Top = 222
                Width = 23
                Height = 13
                Alignment = taRightJustify
                Caption = 'FAX:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label49: TLabel
                Left = 69
                Top = 253
                Width = 30
                Height = 13
                Alignment = taRightJustify
                Caption = 'CNPJ:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label50: TLabel
                Left = 382
                Top = 253
                Width = 64
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ins. Estadual:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object DBEditJuridicaNome: TDBEdit
                Left = 127
                Top = 7
                Width = 561
                Height = 24
                DataField = 'nome'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object DBEdit16: TDBEdit
                Left = 127
                Top = 37
                Width = 561
                Height = 24
                DataField = 'razao_social'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object DBEdit22: TDBEdit
                Left = 127
                Top = 67
                Width = 477
                Height = 24
                DataField = 'endereco'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
              object DBEdit23: TDBEdit
                Left = 623
                Top = 67
                Width = 65
                Height = 24
                DataField = 'numero'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object DBEdit25: TDBEdit
                Left = 127
                Top = 97
                Width = 409
                Height = 24
                DataField = 'complemento'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
              end
              object DBEdit26: TDBEdit
                Left = 127
                Top = 127
                Width = 409
                Height = 24
                DataField = 'bairro'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
              object DBEdit27: TDBEdit
                Left = 128
                Top = 157
                Width = 408
                Height = 24
                DataField = 'cidade'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
              end
              object DBEdit28: TDBEdit
                Left = 127
                Top = 187
                Width = 185
                Height = 24
                DataField = 'cep'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 8
              end
              object DBEdit29: TDBEdit
                Left = 503
                Top = 187
                Width = 185
                Height = 24
                DataField = 'caixa_postal'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 9
              end
              object DBEdit30: TDBEdit
                Left = 127
                Top = 217
                Width = 230
                Height = 24
                DataField = 'telefone_comercial'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 10
              end
              object DBComboBox7: TDBComboBox
                Left = 623
                Top = 157
                Width = 65
                Height = 24
                DataField = 'estado'
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
              object DBEdit31: TDBEdit
                Left = 458
                Top = 217
                Width = 230
                Height = 24
                DataField = 'fax'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 11
              end
              object DBEdit32: TDBEdit
                Left = 127
                Top = 248
                Width = 230
                Height = 24
                DataField = 'cgc'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 12
              end
              object DBEdit33: TDBEdit
                Left = 458
                Top = 248
                Width = 230
                Height = 24
                DataField = 'insc'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 13
              end
            end
            object TPage
              Left = 0
              Top = 0
              Caption = 'Complemento'
              ExplicitWidth = 0
              ExplicitHeight = 0
            end
          end
          object Panel5: TPanel
            Left = 128
            Top = 6
            Width = 185
            Height = 49
            Color = 8673536
            ParentBackground = False
            TabOrder = 2
            object Label35: TLabel
              Left = 17
              Top = 16
              Width = 43
              Height = 13
              Caption = 'Cliente:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText2: TDBText
              Left = 82
              Top = 14
              Width = 79
              Height = 17
              DataField = 'idcliente'
              Font.Charset = ANSI_CHARSET
              Font.Color = clSilver
              Font.Height = -16
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object DBCheckBox4: TDBCheckBox
            Left = 368
            Top = 24
            Width = 65
            Height = 17
            Caption = 'Ativo'
            DataField = 'ativo'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBDateEdit1: TDBDateEdit
            Left = 570
            Top = 21
            Width = 121
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            DataField = 'data_cadastro'
            NumGlyphs = 2
            TabOrder = 4
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 411
        Width = 790
        Height = 54
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 1
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
    end
    object tsFinanceiro: TTabSheet
      Caption = 'Financeiro'
      ImageIndex = 2
    end
    object tsCompras: TTabSheet
      Caption = 'Compras'
      ImageIndex = 3
    end
  end
end
