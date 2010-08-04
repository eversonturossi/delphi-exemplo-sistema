inherited ConcultaUsuarioForm: TConcultaUsuarioForm
  Caption = 'MasterERP - Consulta de Usu'#225'rios'
  ClientHeight = 506
  ClientWidth = 807
  ExplicitWidth = 813
  ExplicitHeight = 532
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 487
    ExplicitHeight = 487
    inherited GHPPrincipal: TJvGradientHeaderPanel
      Height = 485
    end
  end
  inherited Panel2: TPanel
    Width = 648
    Height = 487
    ExplicitWidth = 648
    ExplicitHeight = 487
    inherited DBGrid1: TDBGrid
      Width = 646
      Height = 389
      Columns = <
        item
          Expanded = False
          FieldName = 'USUARIO_ID'
          Title.Caption = 'Usu'#225'rio I.D'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOGIN'
          Title.Caption = 'Login'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SENHA'
          Title.Caption = 'Senha'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ATIVO'
          Title.Caption = 'Ativo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_CADASTRO'
          Title.Caption = 'Data Cadastro'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NIVEL'
          Title.Caption = 'N'#237'vel'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_ULTIMA_ALTERACAO'
          Title.Caption = #218'ltima Altera'#231#227'o'
          Visible = True
        end>
    end
    inherited Panel3: TPanel
      Width = 646
      ExplicitWidth = 646
      inherited BTPesquisar: TSpeedButton
        OnClick = BTPesquisarClick
      end
      inherited CBCriterio: TComboBox
        Items.Strings = (
          '<selecione>'
          'Usu'#225'rio I.D'
          'Nome'
          'Login')
      end
      inherited EditValor: TEdit
        OnKeyPress = EditValorKeyPress
      end
    end
  end
  inherited SBPrincipal: TStatusBar
    Top = 487
    Width = 807
    ExplicitTop = 487
    ExplicitWidth = 807
  end
  inherited qryConsulta: TSQLQuery
    SQL.Strings = (
      'select * from usuario where usuario_id = 0')
    object qryConsultaUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
    end
    object qryConsultaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryConsultaLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 25
    end
    object qryConsultaSENHA: TStringField
      FieldName = 'SENHA'
      Size = 8
    end
    object qryConsultaATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object qryConsultaDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object qryConsultaNIVEL: TStringField
      FieldName = 'NIVEL'
      Size = 5
    end
    object qryConsultaDATA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
    end
  end
  inherited DSqryConsulta: TDataSource
    Top = 285
  end
  inherited qryControleAcesso: TSQLQuery
    Top = 240
  end
  inherited CDSConsulta: TClientDataSet
    object CDSConsultaUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
      DisplayFormat = '0000000000'
    end
    object CDSConsultaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object CDSConsultaLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 25
    end
    object CDSConsultaSENHA: TStringField
      FieldName = 'SENHA'
      EditMask = '********;1;_'
      Size = 8
    end
    object CDSConsultaATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object CDSConsultaDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object CDSConsultaNIVEL: TStringField
      FieldName = 'NIVEL'
      Size = 5
    end
    object CDSConsultaDATA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
    end
  end
end
