unit FechamentoCupomFrm;

interface

{$I DelphiVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,

  {$IFDEF DELPHI_6_UP}
  Variants,
  {$ENDIF}

  Dialogs, ExtCtrls, DB, DBClient, StdCtrls, Buttons, Grids, DBGrids,
  DBCtrls, ConsultaChequeFrm;

type
  TFechamentoCupomForm = class(TForm)
    pnlBotoes: TPanel;
    pnlPrincipal: TPanel;
    dtsFechamentoCupom: TDataSource;
    cdsFechamentoCupom: TClientDataSet;
    DBNavigator: TDBNavigator;
    DBGrid: TDBGrid;
    btnOk: TBitBtn;
    btnFechar: TBitBtn;
    cdsFechamentoCupomForma: TStringField;
    cdsFechamentoCupomValor: TFloatField;
    cdsFechamentoCupomTotal: TAggregateField;
    btnDadosCheque: TButton;
    procedure cdsFechamentoCupomAfterInsert(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cdsFechamentoCupomValorValidate(Sender: TField);
    procedure dtsFechamentoCupomDataChange(Sender: TObject; Field: TField);
    procedure dtsFechamentoCupomStateChange(Sender: TObject);
    procedure dtsFechamentoCupomUpdateData(Sender: TObject);
    procedure btnDadosChequeClick(Sender: TObject);
  private
    { Private declarations }
    total: Double;
    FnumCartoes: Integer;
    procedure habilitarCheque;
    function  nuloOuVazio(v: Variant): Boolean;
    procedure tratarDepoisDeInserir;
    function  validarFormaPgto: Boolean;
    procedure consultarCheque;
  public
    { Public declarations }
    dadosConsultaCheque: TDadosConsultaCheque;
    constructor Create(AOwner: TComponent; valorTotal: Double); reintroduce;
    property numCartoes: Integer read FnumCartoes;
  end;

const
  FORMA_PGTO_CARTAO = 'Cartão';
  FORMA_PGTO_CHEQUE = 'Cheque';
var
  FechamentoCupomForm: TFechamentoCupomForm;

implementation

{$R *.dfm}

constructor TFechamentoCupomForm.Create(AOwner: TComponent; valorTotal: Double);
begin
  inherited Create(AOwner);
  total := valorTotal;
  cdsFechamentoCupom.CreateDataSet;
  FnumCartoes := 0;
end;


procedure TFechamentoCupomForm.cdsFechamentoCupomAfterInsert(
  DataSet: TDataSet);
begin
  tratarDepoisDeInserir;
end;

function TFechamentoCupomForm.validarFormaPgto: Boolean;
var count: Integer;
begin
  count := 0;
  cdsFechamentoCupom.First;
  while not cdsFechamentoCupom.Eof do begin
    if cdsFechamentoCupomForma.Value = FORMA_PGTO_CARTAO then
      count := count + 1;
    cdsFechamentoCupom.Next;
  end;//while

  FnumCartoes := count;

  if not nuloOuVazio(cdsFechamentoCupomTotal.Value) then
    Result := cdsFechamentoCupomTotal.Value >= total
  else
    Result := False;
end;

procedure TFechamentoCupomForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := validarFormaPgto;
  if not CanClose then
    MessageDlg('Por favor, informe o valor total da compra.',
      mtWarning, [mbOK], 0)
  else begin
    if cdsFechamentoCupom.State in dsEditModes then
      cdsFechamentoCupom.Post;
  end;
end;

procedure TFechamentoCupomForm.cdsFechamentoCupomValorValidate(
  Sender: TField);
begin
  if not Sender.IsNull then
    if (cdsFechamentoCupomForma.Value = FORMA_PGTO_CARTAO) then begin
      if (Sender.AsFloat > total) then
        raise Exception.Create('Não é permitido troco na forma de pagamento ''' +
          FORMA_PGTO_CARTAO )
      else if Sender.AsFloat <= 0 then
        raise Exception.Create('Não é permitido valor menor ou igual a zero(0) com a forma de pagamento ''' +
          FORMA_PGTO_CARTAO);
    end;//if
end;

procedure TFechamentoCupomForm.tratarDepoisDeInserir;
begin
  DBGrid.SetFocus;
  DBGrid.SelectedIndex := 0;
  keybd_event(VK_RETURN, 0, 0, 0);

  if not nuloOuVazio(cdsFechamentoCupomTotal.Value) then
    cdsFechamentoCupomValor.Value := total - cdsFechamentoCupomTotal.Value
  else
    cdsFechamentoCupomValor.Value := total;
end;

function TFechamentoCupomForm.nuloOuVazio(v: Variant): Boolean;
begin
  {$IFDEF DELPHI_5}
  Result := (v = null) or VarIsEmpty(v);
  {$ELSE}
  Result := VarIsNull(v) or VarIsEmpty(v);
  {$ENDIF}
end;

procedure TFechamentoCupomForm.dtsFechamentoCupomDataChange(
  Sender: TObject; Field: TField);
begin
  if not (Field = nil) then
    btnDadosCheque.Enabled := (field.FieldName = 'Forma') and
      (field.AsString = 'Cheque');
end;

procedure TFechamentoCupomForm.habilitarCheque;
begin
  if cdsFechamentoCupom.Active then
    btnDadosCheque.Enabled := (cdsFechamentoCupomForma.AsString = 'Cheque');
end;


procedure TFechamentoCupomForm.dtsFechamentoCupomStateChange(
  Sender: TObject);
begin
  habilitarCheque;
end;

procedure TFechamentoCupomForm.dtsFechamentoCupomUpdateData(
  Sender: TObject);
begin
  habilitarCheque;
end;

procedure TFechamentoCupomForm.consultarCheque;
var myForm: TConsultaChequeForm;
begin
  myForm := TConsultaChequeForm.Create(Self);
  myForm.edtValor.Text := FormatFloat('#,#00.00', cdsFechamentoCupomValor.Value);
  myForm.ShowModal;
  dadosConsultaCheque := myForm.dadosConsultaCheque;
  if myForm.EasyTEF.transacaoAprovada then
    ModalResult := mrOk;
end;


procedure TFechamentoCupomForm.btnDadosChequeClick(Sender: TObject);
begin
  consultarCheque;
end;

end.
