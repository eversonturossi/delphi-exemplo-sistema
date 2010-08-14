object ConsultaChequeForm: TConsultaChequeForm
  Left = 317
  Top = 262
  BorderStyle = bsDialog
  Caption = 'Dados do Cheque'
  ClientHeight = 157
  ClientWidth = 682
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 682
    Height = 115
    Align = alClient
    TabOrder = 0
    object lbValor: TLabel
      Left = 464
      Top = 8
      Width = 30
      Height = 16
      Caption = 'Valor'
    end
    object lbBanco: TLabel
      Left = 8
      Top = 8
      Width = 34
      Height = 16
      Caption = 'Banco'
    end
    object lbAgencia: TLabel
      Left = 64
      Top = 8
      Width = 45
      Height = 16
      Caption = 'Ag'#234'ncia'
    end
    object lbPraca: TLabel
      Left = 144
      Top = 8
      Width = 32
      Height = 16
      Caption = 'Pra'#231'a'
    end
    object lbCheque: TLabel
      Left = 384
      Top = 8
      Width = 43
      Height = 16
      Caption = 'Cheque'
    end
    object lbBompara: TLabel
      Left = 568
      Top = 8
      Width = 55
      Height = 16
      Caption = 'Bom para'
    end
    object lbNome: TLabel
      Left = 8
      Top = 56
      Width = 33
      Height = 16
      Caption = 'Nome'
    end
    object lbRegistro: TLabel
      Left = 520
      Top = 56
      Width = 22
      Height = 16
      Caption = 'CPF'
    end
    object lbContaCorrente: TLabel
      Left = 248
      Top = 8
      Width = 87
      Height = 16
      Caption = 'Conta Corrente'
    end
    object edtValor: TEdit
      Left = 464
      Top = 26
      Width = 97
      Height = 24
      TabOrder = 5
      Text = '0,00'
    end
    object edtBanco: TEdit
      Left = 8
      Top = 26
      Width = 49
      Height = 24
      TabOrder = 0
    end
    object edtAgencia: TEdit
      Left = 64
      Top = 26
      Width = 73
      Height = 24
      MaxLength = 6
      TabOrder = 1
    end
    object edtPraca: TEdit
      Left = 144
      Top = 26
      Width = 97
      Height = 24
      MaxLength = 20
      TabOrder = 2
    end
    object edtCheque: TEdit
      Left = 384
      Top = 26
      Width = 73
      Height = 24
      MaxLength = 6
      TabOrder = 4
    end
    object edtNome: TEdit
      Left = 8
      Top = 74
      Width = 505
      Height = 24
      MaxLength = 40
      TabOrder = 7
    end
    object edtRegistro: TEdit
      Left = 520
      Top = 74
      Width = 153
      Height = 24
      MaxLength = 11
      TabOrder = 8
    end
    object edtContaCorrente: TEdit
      Left = 248
      Top = 26
      Width = 129
      Height = 24
      MaxLength = 20
      TabOrder = 3
    end
    object dtpBomPara: TDateTimePicker
      Left = 568
      Top = 26
      Width = 97
      Height = 24
      CalAlignment = dtaLeft
      Date = 39601.9888292014
      Time = 39601.9888292014
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 115
    Width = 682
    Height = 42
    Align = alBottom
    TabOrder = 1
    TabStop = True
    DesignSize = (
      682
      42)
    object btnConsultarCheque: TSpeedButton
      Left = 352
      Top = 8
      Width = 145
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'C&onsultar Cheque'
      OnClick = btnConsultarChequeClick
    end
    object btnConfirmar: TSpeedButton
      Left = 496
      Top = 8
      Width = 89
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Confirmar'
      OnClick = btnConfirmarClick
    end
    object btnCancelar: TSpeedButton
      Left = 584
      Top = 8
      Width = 89
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'C&ancelar'
      OnClick = btnCancelarClick
    end
  end
  object EasyTEF: TEasyTEFDiscado
    formMsgOperador.altura = 100
    formMsgOperador.largura = 400
    formMsgOperador.font.Charset = ANSI_CHARSET
    formMsgOperador.font.Color = clWindowText
    formMsgOperador.font.Height = -13
    formMsgOperador.font.Name = 'Tahoma'
    formMsgOperador.font.Style = []
    formMsgOperador.botaoOK.altura = 25
    formMsgOperador.botaoOK.largura = 75
    OnGerarIdentificador = EasyTEFGerarIdentificador
    Left = 312
    Top = 120
  end
end
