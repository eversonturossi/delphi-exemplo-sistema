object CadUnidadeForm: TCadUnidadeForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Unidades'
  ClientHeight = 344
  ClientWidth = 583
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
    Width = 583
    Height = 344
    ActivePage = tsConsulta
    Align = alClient
    TabOrder = 0
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      OnShow = tsConsultaShow
      object Label6: TLabel
        Left = 317
        Top = 18
        Width = 29
        Height = 13
        Caption = 'Tipo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel1: TPanel
        Left = 0
        Top = 282
        Width = 575
        Height = 34
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 0
        object Label1: TLabel
          Left = 17
          Top = 9
          Width = 42
          Height = 13
          Caption = 'Campo:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 212
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
          Left = 450
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
          Left = 69
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
          Text = 'Descri'#231#227'o'
          OnChange = CBPesquisarChange
          Items.Strings = (
            'C'#243'digo'
            'Descri'#231#227'o'
            'Abrevia'#231#227'o'
            'Tipo')
        end
        object EditPesquisar: TEdit
          Left = 264
          Top = 6
          Width = 162
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
        Width = 598
        Height = 224
        Color = 13619151
        DataSource = BancoDeDados.DSqryCsUnidade
        FixedColor = 8673536
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
            FieldName = 'idunidade'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            Title.Caption = 'Unidade I.D'
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
            FieldName = 'descricao'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'abreviacao'
            Title.Caption = 'Abrevia'#231#227'o'
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
            FieldName = 'calc_nome_tipo'
            Title.Caption = 'Tipo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Microsoft Sans Serif'
            Title.Font.Style = []
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
      object CBTipo: TComboBox
        Left = 356
        Top = 13
        Width = 98
        Height = 23
        BevelKind = bkFlat
        Style = csDropDownList
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        TabOrder = 3
        Text = 'Compra'
        Items.Strings = (
          'Compra'
          'Venda')
      end
    end
    object tsManutencao: TTabSheet
      Caption = 'Manuten'#231#227'o'
      ImageIndex = 1
      OnShow = tsManutencaoShow
      object Label3: TLabel
        Left = 7
        Top = 97
        Width = 51
        Height = 13
        Alignment = taRightJustify
        Caption = 'Descri'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label28: TLabel
        Left = 309
        Top = 40
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
      object Label4: TLabel
        Left = 1
        Top = 125
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'Abrevia'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 34
        Top = 154
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Panel4: TPanel
        Left = 83
        Top = 22
        Width = 166
        Height = 49
        Color = 8673536
        ParentBackground = False
        TabOrder = 3
        object Label5: TLabel
          Left = 17
          Top = 16
          Width = 51
          Height = 13
          Caption = 'Unidade:'
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
          Width = 79
          Height = 17
          DataField = 'idunidade'
          DataSource = BancoDeDados.DSqryCadUnidade
          Font.Charset = ANSI_CHARSET
          Font.Color = clSilver
          Font.Height = -16
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object DBEditNome: TDBEdit
        Left = 83
        Top = 92
        Width = 437
        Height = 24
        CharCase = ecUpperCase
        DataField = 'descricao'
        DataSource = BancoDeDados.DSqryCadUnidade
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 0
        Top = 262
        Width = 575
        Height = 54
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 4
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
      object DBDateEdit1: TDBDateEdit
        Left = 399
        Top = 35
        Width = 121
        Height = 24
        Margins.Left = 4
        Margins.Top = 1
        TabStop = False
        DataField = 'data_cadastro'
        DataSource = BancoDeDados.DSqryCadUnidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 5
      end
      object DBEdit1: TDBEdit
        Left = 83
        Top = 120
        Width = 98
        Height = 24
        CharCase = ecUpperCase
        DataField = 'abreviacao'
        DataSource = BancoDeDados.DSqryCadUnidade
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object CBTipoGrava: TComboBox
        Left = 83
        Top = 149
        Width = 98
        Height = 23
        BevelKind = bkFlat
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        TabOrder = 2
        Text = 'Compra'
        Items.Strings = (
          'Compra'
          'Venda')
      end
    end
  end
end
