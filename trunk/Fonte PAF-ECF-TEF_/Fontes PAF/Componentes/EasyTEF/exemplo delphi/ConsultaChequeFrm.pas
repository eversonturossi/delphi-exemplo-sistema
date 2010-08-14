unit ConsultaChequeFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,

  {$IFDEF DELPHI_6_UP}
  Variants,
  {$ENDIF}

  Dialogs, StdCtrls, Buttons, Mask, ComCtrls, ExtCtrls, EasyTEFDiscado;

type
  TDadosConsultaCheque = record
    houveConsulta: Boolean;
    consultaOk: Boolean;
    cupomTEF: TStringList;
    identificacao: string;
    nomeRede: string;
    nsu: string;
    finalizacao: string;
    docFiscalVinculado: string;
    valor: Double;
  end;//TDadosConfirmacaoCheque

  TConsultaChequeForm = class(TForm)
    Panel1: TPanel;
    lbValor: TLabel;
    lbBanco: TLabel;
    lbAgencia: TLabel;
    lbPraca: TLabel;
    lbCheque: TLabel;
    lbBompara: TLabel;
    lbNome: TLabel;
    lbRegistro: TLabel;
    lbContaCorrente: TLabel;
    edtValor: TEdit;
    edtBanco: TEdit;
    edtAgencia: TEdit;
    edtPraca: TEdit;
    edtCheque: TEdit;
    edtNome: TEdit;
    edtRegistro: TEdit;
    edtContaCorrente: TEdit;
    dtpBomPara: TDateTimePicker;
    Panel2: TPanel;
    btnConsultarCheque: TSpeedButton;
    btnConfirmar: TSpeedButton;
    btnCancelar: TSpeedButton;
    EasyTEF: TEasyTEFDiscado;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConsultarChequeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EasyTEFGerarIdentificador(var identificacao: Integer);
  private
    { Private declarations }
    procedure consultarCheque;
    procedure iniciarDadosConsultaCheque;
  public
    { Public declarations }
    dadosConsultaCheque: TDadosConsultaCheque;
  end;

var
  consultaChequeForm: TConsultaChequeForm;

implementation

uses ConstTefDiscado;

{$R *.dfm}

procedure TConsultaChequeForm.btnConfirmarClick(Sender: TObject);
begin
  SetFocus;
  if edtValor.Text = '' then begin
    if StrToFloat(edtValor.Text) = 0 then
      raise Exception.Create('Valor inválido');
  end;//if
  ModalResult := mrOk;
end;

procedure TConsultaChequeForm.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TConsultaChequeForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = []) then
    case Key of
      VK_Escape: btnCancelar.Click;
      VK_Return: btnConfirmar.Click;
      VK_F5: consultarCheque;
    end;
end;

procedure TConsultaChequeForm.consultarCheque;
begin
  Screen.Cursor := crHourGlass;
  try
    // esta é uma aplicação exemplo, por isso não está sendo passada uma
    // identificação para esta operação TEF
    EasyTEF.consultarCheque(StrToFloat(edtValor.Text), '', '',
      'F', edtRegistro.Text, dtpBomPara.Date, edtBanco.Text,
      edtAgencia.Text, '', edtContaCorrente.Text, '', edtCheque.Text, '');

      with dadosConsultaCheque do begin
        houveConsulta := EasyTEF.valorCampo011_000 = CONSULTA_CHEQUE;
        consultaOk := EasyTEF.transacaoAprovada;
        cupomTef.Assign(EasyTEF.imagemCupomTef);
        identificacao := EasyTEF.valorCampo001_000;
        nomeRede := EasyTEF.valorCampo010_000;
        nsu := EasyTEF.valorCampo012_000;
        finalizacao := EasyTEF.valorCampo027_000;
        docFiscalVinculado := EasyTEF.valorCampo002_000;
        valor := StrToFloat(edtValor.Text);
      end;//with

    if EasyTEF.transacaoAprovada then
      modalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TConsultaChequeForm.btnConsultarChequeClick(Sender: TObject);
begin
  consultarCheque;
end;

procedure TConsultaChequeForm.iniciarDadosConsultaCheque;
begin
  with dadosConsultaCheque do begin
    houveConsulta := False;
    consultaOk := False;
    cupomTef := TStringList.Create;
    identificacao := '';
    nomeRede := '';
    nsu := '';
    finalizacao := '';
    docFiscalVinculado := '';
  end;//with
end;

procedure TConsultaChequeForm.FormCreate(Sender: TObject);
begin
  iniciarDadosConsultaCheque;
end;

procedure TConsultaChequeForm.EasyTEFGerarIdentificador(
  var identificacao: Integer);
begin
  Randomize;
  identificacao := Random(999999);
end;

end.
