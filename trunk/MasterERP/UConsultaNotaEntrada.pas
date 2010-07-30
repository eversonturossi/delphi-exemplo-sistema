unit UConsultaNotaEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UConsultaPadrao, FMTBcd, Menus, AppEvnts, DBClient, Provider,
  ActnList, DB, SqlExpr, ComCtrls, StdCtrls, Grids, DBGrids, Buttons,
  JvExControls, JvGradientHeaderPanel, ExtCtrls;

type
  TConsultaNotaEntradaForm = class(TConsultaPadraoForm)
    CDSConsultaNOTA_ENTRADA_ID: TIntegerField;
    CDSConsultaEMPRESA_ID: TIntegerField;
    CDSConsultaFORNECEDOR_ID: TIntegerField;
    CDSConsultaDATA_CADASTRO: TSQLTimeStampField;
    CDSConsultaDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSConsultaDATA_ENTRADA: TSQLTimeStampField;
    CDSConsultaTRANSPORTADORA_ID: TIntegerField;
    CDSConsultaCANCELADO: TSmallintField;
    CDSConsultacalc_empresa_nome: TStringField;
    CDSConsultacalc_fornecedor_nome: TStringField;
    CDSConsultacalc_transportadora_nome: TStringField;
    procedure CDSConsultaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConsultaNotaEntradaForm: TConsultaNotaEntradaForm;

implementation
uses Base;
{$R *.dfm}

procedure TConsultaNotaEntradaForm.CDSConsultaCalcFields(DataSet: TDataSet);
begin
  with BancoDados.qryAuxiliar do
    begin
      Close;
      SQL.Text := 'select nome from pessoa where pessoa_id in(' +
        'select pessoa_id from empresa where empresa_id = ' +
        IntToStr(CDSConsultaEMPRESA_ID.Value) + ')';
      Open;
    end;
  if not (BancoDados.qryAuxiliar.IsEmpty) then
    CDSConsultacalc_empresa_nome.Value := BancoDados.qryAuxiliar.Fields[0].Value
  else
    CDSConsultacalc_empresa_nome.Value := '<Desconhecida>';

  with BancoDados.qryAuxiliar do
    begin
      Close;
      SQL.Text := 'select nome from pessoa where pessoa_id in(' +
        'select pessoa_id from fornecedor where fornecedor_id = ' +
        IntToStr(CDSConsultaFORNECEDOR_ID.Value) + ')';
      Open;
    end;
  if not (BancoDados.qryAuxiliar.IsEmpty) then
    CDSConsultacalc_fornecedor_nome.Value := BancoDados.qryAuxiliar.Fields[0].Value
  else
    CDSConsultacalc_fornecedor_nome.Value := '<Desconhecido>';

  with BancoDados.qryAuxiliar do
    begin
      Close;
      SQL.Text := 'select nome_fantasia from pessoa where pessoa_id in(' +
        'select pessoa_id from fornecedor where transportadora_id = ' +
        IntToStr(CDSConsultaTRANSPORTADORA_ID.Value) + ')';
      Open;
    end;
  if not (BancoDados.qryAuxiliar.IsEmpty) then
    CDSConsultacalc_transportadora_nome.Value := BancoDados.qryAuxiliar.Fields[0].Value
  else
    CDSConsultacalc_transportadora_nome.Value := '<Desconhecida>';
end;

end.
