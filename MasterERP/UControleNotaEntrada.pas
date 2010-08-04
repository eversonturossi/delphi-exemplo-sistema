unit UControleNotaEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UControlePadrao, FMTBcd, DB, AppEvnts, DBClient, Provider, Menus,
  SqlExpr, Grids, DBGrids, ComCtrls, Buttons, JvExControls,
  JvGradientHeaderPanel, ExtCtrls, StdCtrls, JvExStdCtrls, JvEdit,
  JvValidateEdit, Mask, JvExMask, JvToolEdit, ActnList;

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
    CDSConsultaNOTA_FISCAL: TIntegerField;
    Label6: TLabel;
    EditNotaEntrada: TJvValidateEdit;
    procedure CDSConsultaCalcFields(DataSet: TDataSet);
    procedure BTNovoClick(Sender: TObject);
    procedure BTAlterarClick(Sender: TObject);
    procedure BTFornecedorClick(Sender: TObject);
    procedure BTTransportadoraClick(Sender: TObject);
    procedure BTPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CHPeriodoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaHint;
  public
    { Public declarations }
  end;

var
  ControleNotaEntradaForm: TControleNotaEntradaForm;

implementation
uses Base, UFuncoes, ULancamentoNotaentrada, UPesquisaFornecedor,
  UPesquisaTransportadora;
{$R *.dfm}

procedure TControleNotaEntradaForm.CarregaHint;
begin
  EditNotaFiscal.Hint := 'Informe o número da Nota de Entrada';
  EditNotaFiscal.Hint := 'Informe o número da Nota Fiscal';
  EditFornecedor.Hint := 'Informe o Fornecedor';
  EditTransportadora.Hint := 'Informe a Transportadora';
  BTFornecedor.Hint := 'Pesquisar um Fornecedor';
  BTTransportadora.Hint := 'Pesquisar uma Transportadora';
  CHPeriodo.Hint := 'Habilite/Desabilite consulta por período';
  RGCondicao.Hint := 'Especifique as condições especiais (Nota Cancelada / Nota Finalizada)';
  BTPesquisar.Hint := 'Execure a Pesquisa';
  BTNovo.Hint := 'Insira uma nova Nota';
  BTAlterar.Hint := 'Altere a Nota selecionada';
  BTExportar.Hint := 'Exporte os Dados da Nota selecionada';
  BTSair.Hint := 'Sair da Tela de Controle de Notas de Entrada';
  LBFornecedorNome.Hint := 'Nome do Fornecedor informado';
  LBTransportadoraNome.Hint := 'Nome da Transportadora informada';
  EditDe.Hint := 'Data de início para Consulta';
  EditAte.Hint := 'Data de final para Consulta';
end;

procedure TControleNotaEntradaForm.BTAlterarClick(Sender: TObject);
begin
  inherited; //Herança

  try
    BarraStatus := False;
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
    BarraStatus := True;
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
    BarraStatus := False;
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
    BarraStatus := True;
  end;
end;

procedure TControleNotaEntradaForm.BTPesquisarClick(Sender: TObject);
var
  Consulta : String;
begin
  try
    CDSConsulta.DisableControls;
    Consulta := 'select * from nota_entrada';

    if (EditNotaEntrada.Value > 0) then
      Consulta := Consulta + ' where nota_entrada_id = ' + IntToStr(EditNotaEntrada.Value);

    if (EditNotaFiscal.Value > 0) then
      if (Pos('where', Consulta) > 0)  then
        Consulta := Consulta + ' and nota_fiscal = ' + IntToStr(EditNotaFiscal.Value)
      else
        Consulta := Consulta + ' where nota_fiscal = ' + IntToStr(EditNotaFiscal.Value);

    if (EditFornecedor.Value > 0) then
      if (Pos('where', Consulta) > 0)  then
        Consulta := Consulta + ' and fornecedor_id = ' + IntToStr(EditFornecedor.Value)
      else
        Consulta := Consulta + ' where fornecedor_id = ' + IntToStr(EditFornecedor.Value);

    if (EditTransportadora.Value > 0) then
      if (Pos('where', Consulta) > 0)  then
        Consulta := Consulta + ' and transportadora_id = ' + IntToStr(EditTransportadora.Value)
      else
        Consulta := Consulta + ' where transportadora_id = ' + IntToStr(EditTransportadora.Value);

    if (CHPeriodo.Checked) then
      begin
        if not (EditDe.Date > 0) then
          begin
            Mensagem('Informe a Data Inicial!', mtWarning,[mbOk],mrOK,0);
            EditDe.SetFocus;
            Abort;
          end;

        if not (EditAte.Date > 0) then
          begin
            Mensagem('Informe a Data Final!', mtWarning,[mbOk],mrOK,0);
            EditAte.SetFocus;
            Abort;
          end;

        if (EditDe.Date > Date) then
          begin
            Mensagem('A Data Inicial não pode ser maior do que a Data de Hoje!', mtWarning,[mbOk],mrOK,0);
            EditDe.SetFocus;
            Abort;
          end;

        if (EditAte.Date > Date) then
          begin
            Mensagem('A Data Final não pode ser maior do que a Data de Hoje!', mtWarning,[mbOk],mrOK,0);
            EditAte.SetFocus;
            Abort;
          end;

        if (EditDe.Date > EditAte.Date) then
          begin
            Mensagem('A Data Inicial não pode ser maior do que a Data Final!', mtWarning,[mbOk],mrOK,0);
            Abort;
          end;


        if (Pos('where', Consulta) > 0)  then
          Consulta := Consulta + ' and data_lancamento between (' +
            QuotedStr(FormatDateTime('dd.mm.yyyy 00:00:00', EditDe.Date)) + ') and (' +
            QuotedStr(FormatDateTime('dd.mm.yyyy 23:59:59', EditAte.Date)) + ')'
        else
          Consulta := Consulta + ' where data_lancamento between (' +
            QuotedStr(FormatDateTime('dd.mm.yyyy 00:00:00', EditDe.Date)) + ') and (' +
            QuotedStr(FormatDateTime('dd.mm.yyyy 23:59:59', EditAte.Date)) + ')';
      end;

    CDSConsulta.Close;
    qryConsulta.SQL.Text := Consulta;
    CDSConsulta.Open;

    CDSConsulta.Last;
    CDSConsulta.First;
    SBPrincipal.Panels[0].Text := IntToStr(CDSConsulta.RecordCount) + ' Registro(s) Encontrado(s).';
  finally
    CDSConsulta.EnableControls;
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

procedure TControleNotaEntradaForm.CHPeriodoClick(Sender: TObject);
begin
  EditDe.Enabled := CHPeriodo.Checked;
  EditAte.Enabled := CHPeriodo.Checked;
end;

procedure TControleNotaEntradaForm.FormCreate(Sender: TObject);
begin
  BancoDados.Tabela := 'NOTA_ENTRADA';
  BancoDados.SqlConsulta := '';

  inherited; //Herança
end;

procedure TControleNotaEntradaForm.FormShow(Sender: TObject);
begin
  inherited; //Herança

  EditDe.Date := Now;
  EditAte.Date := Now;
  CarregaHint;
end;

end.
