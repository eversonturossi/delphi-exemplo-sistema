unit UConsultaChequeSerasa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask,
  EasyTEFDiscado,  TiposTEFDiscado, rxCurrEdit, rxToolEdit;

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

  TFConsultaChequeSerasa = class(TForm)
    Panel1: TPanel;
    lbValor: TLabel;
    lbBanco: TLabel;
    lbAgencia: TLabel;
    lbPraca: TLabel;
    lbCheque: TLabel;
    lbBompara: TLabel;
    lbNome: TLabel;
    lbContaCorrente: TLabel;
    edtBanco: TEdit;
    edtAgencia: TEdit;
    edtPraca: TEdit;
    edtCheque: TEdit;
    edtNome: TEdit;
    edtContaCorrente: TEdit;
    EBomPara: TDateEdit;
    EDocumento: TEdit;
    Label1: TLabel;
    Panel2: TPanel;
    BtConsultar: TBitBtn;
    BtConfirma: TBitBtn;
    BtCancela: TBitBtn;
    EValorCheque: TCurrencyEdit;
    EasyTEFDiscado: TEasyTEFDiscado;
    RBFisica: TRadioButton;
    RBJuridica: TRadioButton;
    procedure EDocumentoEnter(Sender: TObject);
    procedure EDocumentoExit(Sender: TObject);
    procedure EValorChequeEnter(Sender: TObject);
    procedure EValorChequeExit(Sender: TObject);
    procedure EBomParaEnter(Sender: TObject);
    procedure EBomParaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtConsultarClick(Sender: TObject);
    procedure EasyTEFDiscadoGerarIdentificador(var identificacao: Integer);
    procedure BtConfirmaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtCancelaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtBancoKeyPress(Sender: TObject; var Key: Char);
    procedure edtAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure edtPracaKeyPress(Sender: TObject; var Key: Char);
    procedure edtContaCorrenteKeyPress(Sender: TObject; var Key: Char);
    procedure edtChequeKeyPress(Sender: TObject; var Key: Char);
    procedure EValorChequeKeyPress(Sender: TObject; var Key: Char);
    procedure EBomParaKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure EDocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure RBFisicaKeyPress(Sender: TObject; var Key: Char);
    procedure RBJuridicaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure iniciarDadosConsultaCheque;
    procedure consultarCheque;
  public
    { Public declarations }
    dadosConsultaCheque: TDadosConsultaCheque;
  end;

var
  FConsultaChequeSerasa: TFConsultaChequeSerasa;

implementation

uses ConstTefDiscado, checkout, UBarsa, lite_frmprincipal;

{$R *.dfm}

procedure TFConsultaChequeSerasa.EDocumentoEnter(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=$0080FFFF;
end;

procedure TFConsultaChequeSerasa.EDocumentoExit(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=clWhite;
end;

procedure TFConsultaChequeSerasa.EValorChequeEnter(Sender: TObject);
begin
     if (Sender is TCurrencyEdit) then
     TCurrencyEdit(Sender).Color:=$0080FFFF;
end;

procedure TFConsultaChequeSerasa.EValorChequeExit(Sender: TObject);
begin
     if (Sender is TCurrencyEdit) then
     TCurrencyEdit(Sender).Color:=clWhite;
end;

procedure TFConsultaChequeSerasa.EBomParaEnter(Sender: TObject);
begin
     if (Sender is TDateEdit) then
     TDateEdit(Sender).Color:=$0080FFFF;
end;

procedure TFConsultaChequeSerasa.EBomParaExit(Sender: TObject);
begin
    if (Sender is TDateEdit) then
    TDateEdit(Sender).Color:=clWhite;
end;

procedure TFConsultaChequeSerasa.FormShow(Sender: TObject);
begin
     RBFisica.Checked:=True;
     EBomPara.Date:=Date;
     edtBanco.SetFocus;
end;

procedure TFConsultaChequeSerasa.FormCreate(Sender: TObject);
begin
   iniciarDadosConsultaCheque;
end;

procedure TFConsultaChequeSerasa.iniciarDadosConsultaCheque;
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

procedure TFConsultaChequeSerasa.BtConsultarClick(Sender: TObject);
begin
  BtConsultar.Enabled:=False;
  BtConfirma.Enabled:=False;
  BtCancela.Enabled:=False;

  consultarCheque;

  BtConsultar.Enabled:=True;
  BtConfirma.Enabled:=True;
  BtCancela.Enabled:=True;
end;

procedure TFConsultaChequeSerasa.consultarCheque;
begin
  Screen.Cursor := crHourGlass;
  try
     // esta é uma aplicação exemplo, por isso não está sendo passada uma
    // identificação para esta operação TEF
    EasyTEFDiscado.consultarCheque(EValorCheque.Value, StrZero(nNumero_Cupom,6), '',
      'F', EDocumento.Text, EBomPara.Date, edtBanco.Text,
      edtAgencia.Text, '', edtContaCorrente.Text, '', edtCheque.Text, '');

      with dadosConsultaCheque
      do begin
         houveConsulta := EasyTEFDiscado.valorCampo011_000 = CONSULTA_CHEQUE;
         consultaOk := EasyTEFDiscado.transacaoAprovada;
         cupomTef.Assign(EasyTEFDiscado.imagemCupomTef);
         identificacao := EasyTEFDiscado.valorCampo001_000;
         nomeRede := EasyTEFDiscado.valorCampo010_000;
         nsu := EasyTEFDiscado.valorCampo012_000;
         finalizacao := EasyTEFDiscado.valorCampo027_000;
         docFiscalVinculado := EasyTEFDiscado.valorCampo002_000;
         valor := EValorCheque.Value;
         end;//with

    if EasyTEFDiscado.transacaoAprovada
    then modalResult := mrOk;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFConsultaChequeSerasa.EasyTEFDiscadoGerarIdentificador(
  var identificacao: Integer);
begin
     Randomize;
     identificacao := Random(999999);
end;

procedure TFConsultaChequeSerasa.BtConfirmaClick(Sender: TObject);
begin
     if EValorCheque.Value <= 0
     then raise Exception.Create('Valor do cheque inválido');
     ModalResult := mrOk;
end;

procedure TFConsultaChequeSerasa.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
     TabEnter(FConsultaChequeSerasa,Key);
end;

procedure TFConsultaChequeSerasa.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F5
     then BtConsultarClick(Sender);

     if Key=VK_F10
     then BtConfirmaClick(Sender);

     if Key=VK_Escape
     then BtCancelaClick(Sender);
end;

procedure TFConsultaChequeSerasa.BtCancelaClick(Sender: TObject);
begin
     ModalResult := mrCancel;
end;

procedure TFConsultaChequeSerasa.FormActivate(Sender: TObject);
begin
     if FrmPrincipal.Tef_Utilizado='Discado'
     then begin
          if FrmPrincipal.Gerenciador_Padrao='Banrisul'
          then EasyTEFDiscado.gerenciador:=tgBanrisul
          else if FrmPrincipal.Gerenciador_Padrao='Gerenciador Padrão'
          then EasyTEFDiscado.gerenciador:=tgGerenciadorPadrao
          else if FrmPrincipal.Gerenciador_Padrao='Hipercard'
          then EasyTEFDiscado.gerenciador:=tgHipercard
          else if FrmPrincipal.Gerenciador_Padrao='PayGo'
          then EasyTEFDiscado.gerenciador:=tgPayGo
          else if FrmPrincipal.Gerenciador_Padrao='TecBan'
          then EasyTEFDiscado.gerenciador:=tgTecBan;
          end;
end;

procedure TFConsultaChequeSerasa.edtBancoKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then edtAgencia.SetFocus;
end;

procedure TFConsultaChequeSerasa.edtAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then edtPraca.SetFocus;
end;

procedure TFConsultaChequeSerasa.edtPracaKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then edtContaCorrente.SetFocus;
end;

procedure TFConsultaChequeSerasa.edtContaCorrenteKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then edtCheque.SetFocus;
end;

procedure TFConsultaChequeSerasa.edtChequeKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then EValorCheque.SetFocus;
end;

procedure TFConsultaChequeSerasa.EValorChequeKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then EBompara.SetFocus;
end;

procedure TFConsultaChequeSerasa.EBomParaKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then edtNome.SetFocus;
end;

procedure TFConsultaChequeSerasa.edtNomeKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then RbFisica.SetFocus;
end;

procedure TFConsultaChequeSerasa.EDocumentoKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then BtConsultar.SetFocus;
end;

procedure TFConsultaChequeSerasa.RBFisicaKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then RBJuridica.SetFocus;
end;

procedure TFConsultaChequeSerasa.RBJuridicaKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then EDocumento.SetFocus;
end;

end.
