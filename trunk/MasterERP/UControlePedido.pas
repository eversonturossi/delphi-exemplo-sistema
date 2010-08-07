unit UControlePedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UControlePadrao, FMTBcd, ActnList, DB, AppEvnts, DBClient, Provider,
  Menus, SqlExpr, Grids, DBGrids, ComCtrls, Buttons, JvExControls,
  JvGradientHeaderPanel, ExtCtrls, StdCtrls, Mask, JvExMask, JvToolEdit,
  JvExStdCtrls, JvEdit, JvValidateEdit;

type
  TControlePedidoForm = class(TControlePadraoForm)
    CDSConsultaPEDIDO_ID: TIntegerField;
    CDSConsultaDATA_LANCAMENTO: TSQLTimeStampField;
    CDSConsultaCANCELADO: TSmallintField;
    CDSConsultaCLIENTE_ID: TIntegerField;
    CDSConsultaACRESCIMO: TFloatField;
    CDSConsultaDESCONTO: TFloatField;
    CDSConsultaSUBTOTAL: TFloatField;
    CDSConsultacalc_cliente_nome: TStringField;
    CDSConsultacalc_vendedor_nome: TStringField;
    CDSConsultaDATA_CADASTRO: TSQLTimeStampField;
    CDSConsultaDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSConsultaEMPRESA_ID: TIntegerField;
    CDSConsultaFINALIZADO: TSmallintField;
    CDSConsultacalc_total: TCurrencyField;
    Label5: TLabel;
    EditPedido: TJvValidateEdit;
    Label1: TLabel;
    EditCliente: TJvValidateEdit;
    BTCliente: TSpeedButton;
    LBClienteNome: TLabel;
    Label3: TLabel;
    EditVendedor: TJvValidateEdit;
    BTVendedor: TSpeedButton;
    LBVendedorNome: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    EditDe: TJvDateEdit;
    EditAte: TJvDateEdit;
    CHPeriodo: TCheckBox;
    RGCondicao: TRadioGroup;
    BTPesquisar: TSpeedButton;
    CDSConsultaVENDEDOR_ID: TIntegerField;
    procedure CDSConsultaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ControlePedidoForm: TControlePedidoForm;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TControlePedidoForm.CDSConsultaCalcFields(DataSet: TDataSet);
begin
  with BancoDados.qryAuxiliar do
    begin
      Close;
      SQL.Text := 'select nome_razao from pessoa where pessoa_id in(' +
        '(select pessoa_id from cliente where cliente_id = ' +
        IntToStr(CDSConsultaCLIENTE_ID.Value) + ')';
      Open;
    end;
  if not (BancoDados.qryAuxiliar.IsEmpty) then
    CDSConsultacalc_cliente_nome.Value := BancoDados.qryAuxiliar.Fields[0].Value;

  with BancoDados.qryAuxiliar do
    begin
      Close;
      SQL.Text := 'select nome from vendedor where vendedor_id = ' +
        IntToStr(CDSConsultaVENDEDOR_ID.Value);
      Open;
    end;
  if not (BancoDados.qryAuxiliar.IsEmpty) then
    CDSConsultacalc_vendedor_nome.Value := BancoDados.qryAuxiliar.Fields[0].Value;

  CDSConsultacalc_total.Value := (CDSConsultaSUBTOTAL.Value + CDSConsultaACRESCIMO.Value -
    CDSConsultaDESCONTO.Value);
end;

end.
