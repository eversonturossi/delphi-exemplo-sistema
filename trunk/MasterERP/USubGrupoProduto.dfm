inherited ConsultaSubGrupoProdutoForm: TConsultaSubGrupoProdutoForm
  Caption = 'ConsultaSubGrupoProdutoForm'
  ClientHeight = 509
  ExplicitWidth = 854
  ExplicitHeight = 535
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 490
    inherited JvGradientHeaderPanel1: TJvGradientHeaderPanel
      Height = 488
    end
  end
  inherited Panel2: TPanel
    Height = 490
    inherited DBGrid1: TDBGrid
      Height = 392
    end
    inherited Panel3: TPanel
      inherited BTPesquisar: TSpeedButton
        OnClick = BTPesquisarClick
      end
      inherited EditValor: TEdit
        OnKeyPress = EditValorKeyPress
      end
    end
  end
  inherited SBPrincipal: TStatusBar
    Top = 490
    ExplicitTop = -19
    ExplicitWidth = 0
  end
end
