unit UConsultaTransportadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UConsultaPadrao, FMTBcd, Menus, AppEvnts, DBClient, Provider,
  ActnList, DB, SqlExpr, ComCtrls, StdCtrls, Grids, DBGrids, Buttons,
  JvExControls, JvGradientHeaderPanel, ExtCtrls;

type
  TConsultaTransportadoraForm = class(TConsultaPadraoForm)
    CDSConsultaPESSOA_ID: TIntegerField;
    CDSConsultaATIVO: TSmallintField;
    CDSConsultaDATA_CADASTRO: TSQLTimeStampField;
    CDSConsultaDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSConsultaNOME_RAZAO: TStringField;
    CDSConsultaNOME_APELIDO_FANTASIA: TStringField;
    CDSConsultaTRANSPORTADORA_ID: TIntegerField;
    CDSConsultaCNPJ_CPF: TStringField;
    CDSConsultaTIPO: TStringField;
    CDSConsultaIE_IDENTIDADE: TStringField;
    CDSConsultaIM: TStringField;
    CDSConsultacalc_tipo: TStringField;
    CDSConsultaEMPRESA_ID: TIntegerField;
    CDSConsultacalc_filial: TSmallintField;
    procedure BTAlterarClick(Sender: TObject);
    procedure BTExcluirClick(Sender: TObject);
    procedure BTNovoClick(Sender: TObject);
    procedure BTPesquisarClick(Sender: TObject);
    procedure CBCriterioSelect(Sender: TObject);
    procedure CDSConsultaCalcFields(DataSet: TDataSet);
    procedure EditValorKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisar;
    procedure CarregaHint;
  public
    { Public declarations }
  end;

var
  ConsultaTransportadoraForm: TConsultaTransportadoraForm;

implementation
uses Base, UFuncoes, UCadastroTransportadora;
{$R *.dfm}

procedure TConsultaTransportadoraForm.CarregaHint;
begin
  CBCriterio.Hint := 'Campo a ser pesquisado';
  CBCondicao.Hint := 'Condição para pesquisa';
  EditValor.Hint := 'Valor a ser pesquisado';
  CBSituacao.Hint := 'Situação do Registro (Ativo/Inativo)';
  DBGrid1.Hint := 'Registro da Pesquisa';
  BTPesquisar.Hint := 'Execure a Pesquisa';
  BTNovo.Hint := 'Insira uma nova Transportadora';
  BTAlterar.Hint := 'Altere a Transportadora selecionada';
  BTExportar.Hint := 'Exporte os Dados da Transportadora selecionada';
  BTSair.Hint := 'Sair da Tela de Consulta de Transportadoras';
end;

procedure TConsultaTransportadoraForm.BTAlterarClick(Sender: TObject);
begin
  inherited; //Herança

  try
    if not Assigned(CadastroTransportadoraForm) then
      CadastroTransportadoraForm := TCadastroTransportadoraForm.Create(Application);
    BancoDados.Operacao := 'Alterar';
    BancoDados.Id := CDSConsultaTRANSPORTADORA_ID.Value;
    SBPrincipal.Panels[0].Text := '';
    CadastroTransportadoraForm.ShowModal;
  finally
    CDSConsulta.Close;
    CDSConsulta.Open;
    CadastroTransportadoraForm.Free;
    CadastroTransportadoraForm := nil;
  end;
end;

procedure TConsultaTransportadoraForm.BTExcluirClick(Sender: TObject);
begin
  try
    CDSConsulta.DisableControls;
    try
      GeraTrace(BancoDados.Tabela,'Excluindo Registros');
      BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
      if (Mensagem('Deseja realmente Excluir este Registro?',mtConfirmation,[mbYES,mbNO],mrNO,0) = idYES) then
        begin
          BancoDados.qryExecute.SQL.Text := 'delete from transportadora where transportadora_id = ' +
            IntToStr(CDSConsultaTRANSPORTADORA_ID.Value) + ';';
          BancoDados.qryExecute.ExecSQL(True);
          BancoDados.Conexao.Commit(BancoDados.Transacao);
        end
      else
        Abort;
      GeraTrace(BancoDados.Tabela,'Exclusão Concluida');
    except
        BancoDados.Conexao.Rollback(BancoDados.Transacao);
    end;
    CDSConsulta.Close;
    CDSConsulta.Open;
  finally
    CDSConsulta.EnableControls;
  end;
end;

procedure TConsultaTransportadoraForm.BTNovoClick(Sender: TObject);
begin
  try
    BarraStatus := False;
    if not Assigned(CadastroTransportadoraForm) then
      CadastroTransportadoraForm := TCadastroTransportadoraForm.Create(Application);
    BancoDados.Operacao := 'Inserir';
    SBPrincipal.Panels[0].Text := '';
    CadastroTransportadoraForm.ShowModal;
  finally
    CDSConsulta.Close;
    CDSConsulta.Open;
    CadastroTransportadoraForm.Free;
    CadastroTransportadoraForm := nil;
    BarraStatus := True;
  end;
end;

procedure TConsultaTransportadoraForm.BTPesquisarClick(Sender: TObject);
begin
    Pesquisar;
end;

procedure TConsultaTransportadoraForm.CBCriterioSelect(Sender: TObject);
begin
  case CBCriterio.ItemIndex of
    1: begin
      CBCondicao.Items.Clear;
      CBCondicao.Items.Add('<  (Menor que:)');
      CBCondicao.Items.Add('<= (Menor ou igual:)');
      CBCondicao.Items.Add('>= (Maior ou igual:)');
      CBCondicao.Items.Add('>  (Maior:)');
      CBCondicao.Items.Add('=  (Igual:)');
      CBCondicao.Items.Add('<> (Diferente:)');
      CBCondicao.ItemIndex := 4;
    end;
    2,3: begin
      CBCondicao.Items.Clear;
      CBCondicao.Items.Add('= (Igual:)');
      CBCondicao.Items.Add('<> (Diferente:)');
      CBCondicao.Items.Add('Iniciado por');
      CBCondicao.Items.Add('Contendo');
      CBCondicao.Items.Add('Terminado por');
      CBCondicao.ItemIndex := 2;
    end;
  end;

  inherited; //Herança
end;

procedure TConsultaTransportadoraForm.CDSConsultaCalcFields(DataSet: TDataSet);
begin
  if (CDSConsultaTIPO.Value = 'J') then
    CDSConsultacalc_tipo.Value := 'Pessoa Jurídica'
  else if (CDSConsultaTIPO.Value = 'F') then
    CDSConsultacalc_tipo.Value := 'Pessoa Física';

  with BancoDados.qryAuxiliar do
    begin
      Close;
      SQL.Text := 'select filial where empresa where empresa_id = ' +
        IntToStr(CDSConsultaEMPRESA_ID.Value);
      Open;
    end;
  if not (BancoDados.qryAuxiliar.IsEmpty) then
    CDSConsultacalc_filial.Value := BancoDados.qryAuxiliar.Fields[0].Value;
end;

procedure TConsultaTransportadoraForm.EditValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
    BTPesquisarClick(Sender);
end;

procedure TConsultaTransportadoraForm.FormCreate(Sender: TObject);
begin
  BancoDados.Tabela := 'TRANSPORTADORA';
  BancoDados.SqlConsulta := '';

  inherited; //Herança
end;

procedure TConsultaTransportadoraForm.FormShow(Sender: TObject);
begin
  inherited; //Herança

  CBCriterioSelect(Sender);
  BTPesquisarClick(Sender);
  CarregaHint;
end;

procedure TConsultaTransportadoraForm.Pesquisar;
var
  Criterio, Condicao, Campo, Valor : ShortString;
begin
  try
    CDSConsulta.DisableControls;
    Valor := Trim(UpperCase(EditValor.Text));
    BancoDados.SqlConsulta := 'select p.PESSOA_ID, t.ATIVO, t.DATA_CADASTRO, ' +
      't.DATA_ULTIMA_ALTERACAO, p.NOME_RAZAO, p.NOME_APELIDO_FANTASIA, t.TRANSPORTADORA_ID, ' +
      't.CNPJ_CPF, t.TIPO, t.IE_IDENTIDADE, t.IM, t.FILIAL ' +
      'from PESSOA p, TRANSPORTADORA t where (t.PESSOA_ID = p.PESSOA_ID)';

    if (Valor <> '') then
      begin
        case CBCriterio.ItemIndex of
          1: Campo := 't.TRANSPORTADORA_ID';
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
          BancoDados.SqlConsulta := BancoDados.SqlConsulta + ' and t.ATIVO = ' + IntToStr(CBSituacao.ItemIndex)
        else
          BancoDados.SqlConsulta := BancoDados.SqlConsulta + ' where t.ATIVO = ' + IntToStr(CBSituacao.ItemIndex);
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

end.
