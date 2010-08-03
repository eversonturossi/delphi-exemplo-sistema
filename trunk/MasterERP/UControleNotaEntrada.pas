unit UControleNotaEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UControlePadrao, FMTBcd, DB, AppEvnts, DBClient, Provider, Menus,
  SqlExpr, Grids, DBGrids, ComCtrls, Buttons, JvExControls,
  JvGradientHeaderPanel, ExtCtrls, StdCtrls, JvExStdCtrls, JvEdit,
  JvValidateEdit, Mask, JvExMask, JvToolEdit;

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
    Label1: TLabel;
    EditFornecedor: TJvValidateEdit;
    LBFornecedorNome: TLabel;
    BTFornecedor: TSpeedButton;
    Label3: TLabel;
    EditTransportadora: TJvValidateEdit;
    LBTransportadoraNome: TLabel;
    BTTransportadora: TSpeedButton;
    RGCondicao: TRadioGroup;
    CHPeriodo: TCheckBox;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    EditDe: TJvDateEdit;
    EditAte: TJvDateEdit;
    BTPesquisar: TSpeedButton;
    Label5: TLabel;
    EditNotaFiscal: TJvValidateEdit;
    procedure CDSConsultaCalcFields(DataSet: TDataSet);
    procedure BTNovoClick(Sender: TObject);
    procedure BTAlterarClick(Sender: TObject);
    procedure BTFornecedorClick(Sender: TObject);
    procedure BTTransportadoraClick(Sender: TObject);
    procedure BTPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ControleNotaEntradaForm: TControleNotaEntradaForm;

implementation
uses Base, ULancamentoNotaentrada, UPesquisaFornecedor, UPesquisaTransportadora;
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

procedure TControleNotaEntradaForm.BTFornecedorClick(Sender: TObject);
begin
  try
    if not Assigned(PesquisaFornecedorForm) then
      PesquisaFornecedorForm := TPesquisaFornecedorForm.Create(Application);
    if (PesquisaFornecedorForm.ShowModal = mrOk) then
      begin
        EditFornecedor.Value := PesquisaFornecedorForm.ID;
        LBFornecedorNome.Caption := PesquisaFornecedorForm.Descricao;
      end;
    EditFornecedor.SetFocus;
    Abort;
  finally
    PesquisaFornecedorForm.Free;
    PesquisaFornecedorForm := nil;
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

procedure TControleNotaEntradaForm.BTPesquisarClick(Sender: TObject);
begin
  try
    CDSConsulta.DisableControls;
    qryConsulta.SQL.Text := 'select * from nota_entrada';

    if (EditNotaFiscal.Value > 0) then
      qryConsulta.SQL.Add(' where nota_entrada_id)

    if (Valor <> '') then
      begin
        case CBCriterio.ItemIndex of
          1: Campo := 'c.CLIENTE_ID';
          2: Campo := 'p.NOME_RAZAO';
          3: Campo := 'p.NOME_APELIDO_FANTASIA';
        end;

        case CBCriterio.ItemIndex of
          1: begin
            case CBCondicao.ItemIndex of
              0: Condicao := ' and ' + Campo + ' < '   + Valor;
              1: Condicao := ' and ' + Campo + ' <= '  + Valor;
              2: Condicao := ' and ' + Campo + ' >= '  + Valor;
              3: Condicao := ' and ' + Campo + ' > '   + Valor;
              4: Condicao := ' and ' + Campo + ' = '   + Valor;
              5: Condicao := ' and ' + Campo + ' <> '  + Valor;
            end;
          end;
          2,3: begin
            case CBCondicao.ItemIndex of
              0: Condicao := ' and Upper(' + Campo + ') = '       + QuotedStr(Valor);
              1: Condicao := ' and Upper(' + Campo + ') <> '      + QuotedStr(Valor);
              2: Condicao := ' and Upper(' + Campo + ') like '    + QuotedStr(Valor + '%');
              3: Condicao := ' and Upper(' + Campo + ') like '    + QuotedStr('%' + Valor + '%');
              4: Condicao := ' and Upper(' + Campo + ') like '    + QuotedStr(Valor + '%');
            end;
          end;
        end;

        BancoDados.SqlConsulta := BancoDados.SqlConsulta + Condicao;
      end;

    if (CBSituacao.ItemIndex in [0,1]) then
      begin
        if (Pos('where', BancoDados.SqlConsulta) > 0) then
          BancoDados.SqlConsulta := BancoDados.SqlConsulta + ' and c.ATIVO = ' + IntToStr(CBSituacao.ItemIndex)
        else
          BancoDados.SqlConsulta := BancoDados.SqlConsulta + ' where c.ATIVO = ' + IntToStr(CBSituacao.ItemIndex);
      end;

    CDSConsulta.Close;
    qryConsulta.SQL.Text := BancoDados.SqlConsulta;
    CDSConsulta.Open;

    CDSConsulta.Last;
    CDSConsulta.First;
    SBPrincipal.Panels[0].Text := IntToStr(CDSConsulta.RecordCount) + ' Registro(s) Encontrado(s).';
  finally
    CDSConsulta.EnableControls;
  end;
end;
end;

procedure TControleNotaEntradaForm.BTTransportadoraClick(Sender: TObject);
begin
  try
    if not Assigned(PesquisaTransportadoraForm) then
      PesquisaTransportadoraForm := TPesquisaTransportadoraForm.Create(Application);
    if (PesquisaTransportadoraForm.ShowModal = mrOk) then
      begin
        EditTransportadora.Value := PesquisaTransportadoraForm.ID;
        LBTransportadoraNome.Caption := PesquisaTransportadoraForm.Descricao;
      end;
    EditTransportadora.SetFocus;
    Abort;
  finally
    PesquisaTransportadoraForm.Free;
    PesquisaTransportadoraForm := nil;
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
