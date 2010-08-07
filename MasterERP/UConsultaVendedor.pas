unit UConsultaVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UConsultaPadrao, FMTBcd, Menus, AppEvnts, DBClient, Provider,
  ActnList, DB, SqlExpr, ComCtrls, StdCtrls, Grids, DBGrids, Buttons,
  JvExControls, JvGradientHeaderPanel, ExtCtrls;

type
  TConsultaVendedorForm = class(TConsultaPadraoForm)
    CDSConsultaVENDEDOR_ID: TIntegerField;
    CDSConsultaATIVO: TSmallintField;
    CDSConsultaDATA_CADASTRO: TSQLTimeStampField;
    CDSConsultaDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSConsultaNOME: TStringField;
    CDSConsultaVENDEDOR_FUNCAO_ID: TIntegerField;
    CDSConsultaCOMISSAO: TFloatField;
    CDSConsultaLOGIN: TStringField;
    CDSConsultaSENHA: TStringField;
    CDSConsultacalc_vendedor_funcao_descricao: TStringField;
    Label5: TLabel;
    CBFuncao: TComboBox;
    procedure CDSConsultaCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure BTExcluirClick(Sender: TObject);
    procedure BTPesquisarClick(Sender: TObject);
    procedure CBCriterioSelect(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisar;
    procedure CarregaHint;
  public
    { Public declarations }
  end;

var
  ConsultaVendedorForm: TConsultaVendedorForm;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TConsultaVendedorForm.Pesquisar;
var
  Criterio, Condicao, Campo, Valor, SqlConsulta : ShortString;
begin
  try
    CDSConsulta.DisableControls;
    Valor := Trim(UpperCase(EditValor.Text));
    SqlConsulta := 'select * vendedor';

    if (Valor <> '') then
      begin
        case CBCriterio.ItemIndex of
          1: Campo := 'VENDEDOR_ID';
          2: Campo := 'NOME';
          3: Campo := 'LOGIN';
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

        SqlConsulta := SqlConsulta + Condicao;
      end;

    if (CBSituacao.ItemIndex in [0,1]) then
      begin
        if (Pos('where', SqlConsulta) > 0) then
          SqlConsulta := SqlConsulta + ' and ATIVO = ' + IntToStr(CBSituacao.ItemIndex)
        else
          SqlConsulta := SqlConsulta + ' where ATIVO = ' + IntToStr(CBSituacao.ItemIndex);
      end;

    CDSConsulta.Close;
    qryConsulta.SQL.Text := SqlConsulta;
    CDSConsulta.Open;

    CDSConsulta.Last;
    CDSConsulta.First;
    SBPrincipal.Panels[0].Text := IntToStr(CDSConsulta.RecordCount) + ' Registro(s) Encontrado(s).';
  finally
    CDSConsulta.EnableControls;
  end;
end;

procedure TConsultaVendedorForm.BTExcluirClick(Sender: TObject);
begin
  try
    CDSConsulta.DisableControls;
    try
      GeraTrace(BancoDados.Tabela,'Excluindo Registros');
      BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
      if (Mensagem('Deseja realmente Excluir este Registro?',mtConfirmation,[mbYES,mbNO],mrNO,0) = idYES) then
        begin
          BancoDados.qryExecute.SQL.Text := 'delete from vendedor where vendedor_id = ' +
            IntToStr(CDSConsultaVENDEDOR_ID.Value) + ';';
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

procedure TConsultaVendedorForm.BTPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TConsultaVendedorForm.CarregaHint;
begin
  CBCriterio.Hint := 'Campo a ser pesquisado';
  CBCondicao.Hint := 'Condição para pesquisa';
  EditValor.Hint := 'Valor a ser pesquisado';
  CBSituacao.Hint := 'Situação do Registro (Ativo/Inativo)';
  CBFuncao.Hint := 'Função do Vendedor';
  DBGrid1.Hint := 'Registro da Pesquisa';
  BTPesquisar.Hint := 'Execure a Pesquisa';
  BTNovo.Hint := 'Insira um novo Vendedor';
  BTAlterar.Hint := 'Altere o Vendedor selecionado';
  BTExportar.Hint := 'Exporte os Dados do Vendedor selecionado';
  BTSair.Hint := 'Sair da Tela de Consulta de Vendedores';
end;

procedure TConsultaVendedorForm.CBCriterioSelect(Sender: TObject);
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

procedure TConsultaVendedorForm.CDSConsultaCalcFields(DataSet: TDataSet);
begin
  with BancoDados.qryAuxiliar do
    begin
      Close;
      SQL.Text := 'select descricao where vendedor_funcao where vendedor_funcao_id = ' +
        IntToStr(CDSConsultaVENDEDOR_FUNCAO_ID.Value);
      Open;
    end;
  if not (BancoDados.qryAuxiliar.IsEmpty) then
    CDSConsultacalc_vendedor_funcao_descricao.Value := BancoDados.qryAuxiliar.Fields[0].Value;
end;

procedure TConsultaVendedorForm.FormShow(Sender: TObject);
begin
  inherited; //Herança

  BancoDados.CDSVendedorFuncao.Close;
  BancoDados.qryVendedorFuncao.SQL.Text := 'select * from vendedor_funcao where ativo = 1';
  BancoDados.CDSVendedorFuncao.Open;

  CBFuncao.Items.Clear;
  CBFuncao.Items.Add('<selecione>');

  BancoDados.CDSVendedorFuncao.First;
  while not BancoDados.CDSVendedorFuncao.EOF do
    begin
      CBFuncao.Items.Add(BancoDados.CDSVendedorFuncaoDESCRICAO.Value);
      BancoDados.CDSVendedorFuncao.Next;
    end;

  CarregaHint;
end;

end.
