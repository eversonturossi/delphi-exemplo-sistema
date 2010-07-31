unit UControleNotaEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UControlePadrao, FMTBcd, DB, AppEvnts, DBClient, Provider, Menus,
  SqlExpr, Grids, DBGrids, ComCtrls, Buttons, JvExControls,
  JvGradientHeaderPanel, ExtCtrls;

type
  TControleNotaEntradaForm = class(TControlePadraoForm)
    CDSConsultaNOTA_ENTRADA_ID: TIntegerField;
    CDSConsultaEMPRESA_ID: TIntegerField;
    CDSConsultaFORNECEDOR_ID: TIntegerField;
    CDSConsultaDATA_CADASTRO: TSQLTimeStampField;
    CDSConsultaDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSConsultaDATA_ENTRADA: TSQLTimeStampField;
    CDSConsultaTRANSPORTADORA_ID: TIntegerField;
    CDSConsultaCANCELADO: TSmallintField;
    CDSConsultaVALOR_FRETE: TFloatField;
    CDSConsultaVALOR_PRODUTOS: TFloatField;
    CDSConsultaVALOR_NOTA: TFloatField;
    CDSConsultaFINALIZADO: TSmallintField;
    CDSConsultacalc_fornecedor_nome: TStringField;
    CDSConsultacalc_transportadora_nome: TStringField;
    procedure CDSConsultaCalcFields(DataSet: TDataSet);
    procedure BTNovoClick(Sender: TObject);
    procedure BTAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ControleNotaEntradaForm: TControleNotaEntradaForm;

implementation
uses Base, ULancamentoNotaentrada;
{$R *.dfm}

procedure TControleNotaEntradaForm.BTAlterarClick(Sender: TObject);
begin
  inherited; //Herança

  try
    if not Assigned(LancamentoNotaEntradaForm) then
      LancamentoNotaEntradaForm := TLancamentoNotaEntradaForm.Create(Application);
    BancoDados.Operacao := 'Alterar';
    BancoDados.Id := CDSConsultaNOTA_ENTRADA_ID.Value;
    SBPrincipal.Panels[0].Text := '';
    LancamentoNotaEntradaForm.ShowModal;
  finally
    CDSConsulta.Close;
    CDSConsulta.Open;
    LancamentoNotaEntradaForm.Free;
    LancamentoNotaEntradaForm := nil;
  end;
end;

procedure TControleNotaEntradaForm.BTNovoClick(Sender: TObject);
begin
  try
    if not Assigned(LancamentoNotaEntradaForm) then
      LancamentoNotaEntradaForm := TLancamentoNotaEntradaForm.Create(Application);
    BancoDados.Operacao := 'Inserir';
    SBPrincipal.Panels[0].Text := '';
    LancamentoNotaEntradaForm.ShowModal;
  finally
    CDSConsulta.Close;
    CDSConsulta.Open;
    LancamentoNotaEntradaForm.Free;
    LancamentoNotaEntradaForm := nil;
  end;
end;

procedure TControleNotaEntradaForm.CDSConsultaCalcFields(DataSet: TDataSet);
begin
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
      SQL.Text := 'select nome from pessoa where pessoa_id in(' +
        'select pessoa_id from transportadora where transportadora_id = ' +
        IntToStr(CDSConsultaTRANSPORTADORA_ID.Value) + ')';
      Open;
    end;
  if not (BancoDados.qryAuxiliar.IsEmpty) then
    CDSConsultacalc_transportadora_nome.Value := BancoDados.qryAuxiliar.Fields[0].Value
  else
    CDSConsultacalc_transportadora_nome.Value := '<Desconhecida>';
end;

end.
