inherited CadastroSimplesPessoaContatoTipoForm: TCadastroSimplesPessoaContatoTipoForm
  Caption = 'CadastroSimplesPessoaContatoTipoForm'
  ClientWidth = 546
  ExplicitWidth = 562
  ExplicitHeight = 401
  PixelsPerInch = 96
  TextHeight = 13
  inherited SBPrincipal: TStatusBar
    Width = 546
    ExplicitWidth = 546
  end
  inherited Panel2: TPanel
    Width = 425
    ExplicitWidth = 425
    inherited DBGrid1: TDBGrid
      Width = 423
      Height = 295
      ReadOnly = False
      Columns = <
        item
          Expanded = False
          FieldName = 'PESSOA_CONTATO_TIPO_ID'
          ReadOnly = True
          Title.Caption = 'P. Cont. Tipo I.D'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 280
          Visible = True
        end>
    end
    inherited Panel3: TPanel
      Top = 296
      Width = 423
      Height = 49
      ExplicitTop = 296
      ExplicitWidth = 423
      ExplicitHeight = 49
      inherited BTSair: TSpeedButton
        Left = 335
        Top = 2
        ExplicitLeft = 335
        ExplicitTop = 2
      end
    end
  end
  inherited CDSCadastro: TClientDataSet
    BeforePost = CDSCadastroBeforePost
    object CDSCadastroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CDSCadastroPESSOA_CONTATO_TIPO_ID: TIntegerField
      FieldName = 'PESSOA_CONTATO_TIPO_ID'
    end
  end
  inherited qryCadastro: TSQLQuery
    SQL.Strings = (
      
        'select * from pessoa_contato_tipo where pessoa_contato_tipo_id =' +
        ' 0')
  end
end
