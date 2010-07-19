unit UTroco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, JvExControls, JvGradientHeaderPanel, ExtCtrls, ComCtrls,
  ActnList, StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit;

type
  TTrocoForm = class(TForm)
    SBPrincipal: TStatusBar;
    Panel2: TPanel;
    JvGradientHeaderPanel1: TJvGradientHeaderPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    ActionList1: TActionList;
    Action1: TAction;
    Label4: TLabel;
    Shape4: TShape;
    EditAReceber: TJvValidateEdit;
    Label1: TLabel;
    Shape1: TShape;
    EditValorRecebido: TJvValidateEdit;
    LBTroco: TLabel;
    Label2: TLabel;
    BTConfirmar: TBitBtn;
    procedure Action1Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditValorRecebidoKeyPress(Sender: TObject; var Key: Char);
    procedure BTConfirmarClick(Sender: TObject);
    procedure EditValorRecebidoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TrocoForm: TTrocoForm;

implementation
uses Base, UFuncoes, UFinalizadora, UCupomNaoFiscal, UVenda;
{$R *.dfm}

procedure TTrocoForm.Action1Execute(Sender: TObject);
begin
  BTConfirmarClick(Sender);
end;

procedure TTrocoForm.BTConfirmarClick(Sender: TObject);
begin
  try
    with BancoDados.qryAuxiliar do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select COALESCE(sum(desconto), 0.0) as desconto from negociacao ' +
          'where venda_id = ' + IntToStr(BancoDados.VendaID));
        Open;
      end;

    try
      DecimalSeparator := '.';
      BancoDados.qryExecute.SQL.Text := 'update venda set fechado = 1, desconto = ' +
        FloatToStr(BancoDados.qryAuxiliar.Fields[0].Value) + ' where venda_id = ' +
        IntToStr(BancoDados.VendaID) + ';';
      BancoDados.qryExecute.ExecSQL(True);
    finally
      DecimalSeparator := ',';
    end;

    if (Mensagem('Deseja Imprimir Comprovante Não Fiscal?', mtConfirmation,[mbYES,mbNO],mrYes,0) = mrYes) then
      ImprimeCupom(EditValorRecebido.Value, (EditValorRecebido.Value - EditAReceber.Value), BancoDados.VendaID);

    BancoDados.VendaConcluida := True;
    Close;
  except
    BancoDados.VendaConcluida := False;
  end;
end;

procedure TTrocoForm.EditValorRecebidoChange(Sender: TObject);
begin
  LBTroco.Caption := FormatFloat('R$ ,0.00',(EditValorRecebido.Value - EditAReceber.Value));
end;

procedure TTrocoForm.EditValorRecebidoKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
   BTConfirmar.SetFocus;
end;

procedure TTrocoForm.FormShow(Sender: TObject);
begin
  EditValorRecebido.SetFocus;
end;

end.
