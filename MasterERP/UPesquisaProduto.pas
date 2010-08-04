unit UPesquisaProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPesquisaPadrao, FMTBcd, ActnList, Menus, AppEvnts, DB, DBClient,
  Provider, SqlExpr, Grids, DBGrids, StdCtrls, JvExControls,
  JvGradientHeaderPanel, ExtCtrls, ComCtrls;

type
  TPesquisaProdutoForm = class(TPesquisaPadraoForm)
    CDSConsultaPRODUTO_ID: TIntegerField;
    CDSConsultaATIVO: TSmallintField;
    CDSConsultaDATA_CADASTRO: TSQLTimeStampField;
    CDSConsultaDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSConsultaDESCRICAO: TStringField;
    CDSConsultaDESCRICAO_REDUZIDA: TStringField;
    CDSConsultaREFERENCIA: TStringField;
    CDSConsultaUNIDADE_ID: TIntegerField;
    CDSConsultaPRODUTO_GRUPO_ID: TIntegerField;
    CDSConsultaPRODUTO_SUBGRUPO_ID: TIntegerField;
    CDSConsultaESTOQUE_MINIMO: TFloatField;
    CDSConsultacalc_unidade_descricao: TStringField;
    CDSConsultacalc_grupo_descricao: TStringField;
    CDSConsultacalc_subgrupo_descricao: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure CBCriterioSelect(Sender: TObject);
    procedure EditValorChange(Sender: TObject);
    procedure CDSConsultaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure Pesquisar;
  public
    { Public declarations }
  end;

var
  PesquisaProdutoForm: TPesquisaProdutoForm;

implementation
uses Base;
{$R *.dfm}

procedure TPesquisaProdutoForm.Pesquisar;
var
  Criterio, Condicao, Campo, Valor : ShortString;
  SqlConsulta : String;
begin
  try
    CDSConsulta.DisableControls;
    Valor := Trim(UpperCase(EditValor.Text));

    SqlConsulta := 'select * from produto';

    if (Valor <> '') then
      begin
        case CBCriterio.ItemIndex of
          1: Campo := 'PRODUTO_ID';
          2: Campo := 'DESCRICAO';
          3: Campo := 'DESCRICAO_REDUZIDA';
        end;

        case CBCriterio.ItemIndex of
          1: begin
            case CBCondicao.ItemIndex of
              0: Condicao := ' where ' + Campo + ' < '   + Valor;
              1: Condicao := ' where ' + Campo + ' <= '  + Valor;
              2: Condicao := ' where ' + Campo + ' >= '  + Valor;
              3: Condicao := ' where ' + Campo + ' > '   + Valor;
              4: Condicao := ' where ' + Campo + ' = '   + Valor;
              5: Condicao := ' where ' + Campo + ' <> '  + Valor;
            end;
          end;
          2,3: begin
            case CBCondicao.ItemIndex of
              0: Condicao := ' where Upper(' + Campo + ') = '      + QuotedStr(UpperCase(Valor));
              1: Condicao := ' where Upper(' + Campo + ') <> '     + QuotedStr(UpperCase(Valor));
              2: Condicao := ' where Upper(' + Campo + ') like '   + QuotedStr(UpperCase(Valor) + '%');
              3: Condicao := ' where Upper(' + Campo + ') like '   + QuotedStr('%' + UpperCase(Valor) + '%');
              4: Condicao := ' where Upper(' + Campo + ') like '   + QuotedStr(UpperCase(Valor) + '%');
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

procedure TPesquisaProdutoForm.CBCriterioSelect(Sender: TObject);
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

procedure TPesquisaProdutoForm.CDSConsultaCalcFields(DataSet: TDataSet);
begin
  with BancoDados.qryAuxiliar do
    begin
      Close;
      SQL.Text := 'select descricao from unidade where unidade_id = ' +
        IntToStr(CDSConsultaUNIDADE_ID.Value);
      Open;
    end;
  if not (BancoDados.qryAuxiliar.IsEmpty) then
    CDSConsultacalc_unidade_descricao.Value := BancoDados.qryAuxiliar.Fields[0].Value;

  with BancoDados.qryAuxiliar do
    begin
      Close;
      SQL.Text := 'select descricao from produto_grupo where produto_grupo_id = ' +
        IntToStr(CDSConsultaPRODUTO_GRUPO_ID.Value);
      Open;
    end;
  if not (BancoDados.qryAuxiliar.IsEmpty) then
    CDSConsultacalc_grupo_descricao.Value := BancoDados.qryAuxiliar.Fields[0].Value;

  with BancoDados.qryAuxiliar do
    begin
      Close;
      SQL.Text := 'select descricao from produto_subgrupo where produto_subgrupo_id = ' +
        IntToStr(CDSConsultaPRODUTO_SUBGRUPO_ID.Value);
      Open;
    end;
  if not (BancoDados.qryAuxiliar.IsEmpty) then
    CDSConsultacalc_subgrupo_descricao.Value := BancoDados.qryAuxiliar.Fields[0].Value;
end;

procedure TPesquisaProdutoForm.EditValorChange(Sender: TObject);
begin
  Pesquisar;
end;

procedure TPesquisaProdutoForm.FormCreate(Sender: TObject);
begin
  Tabela := 'PRODUTO';
  CampoID := 'produto_id';
  CampoNome := 'descricao';
end;

end.
