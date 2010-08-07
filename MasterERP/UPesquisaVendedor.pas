unit UPesquisaVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPesquisaPadrao, FMTBcd, ActnList, Menus, AppEvnts, DB, DBClient,
  Provider, SqlExpr, Grids, DBGrids, StdCtrls, JvExControls,
  JvGradientHeaderPanel, ExtCtrls, ComCtrls;

type
  TPesquisaVendedorForm = class(TPesquisaPadraoForm)
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
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBCriterioSelect(Sender: TObject);
    procedure EditValorChange(Sender: TObject);
    procedure CBCondicaoSelect(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisar;
    procedure CarregaHint;
  public
    { Public declarations }
  end;

var
  PesquisaVendedorForm: TPesquisaVendedorForm;

implementation
uses Base;
{$R *.dfm}

procedure TPesquisaVendedorForm.Pesquisar;
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

procedure TPesquisaVendedorForm.CarregaHint;
begin
  CBCriterio.Hint := 'Campo a ser pesquisado';
  CBCondicao.Hint := 'Condição para pesquisa';
  EditValor.Hint := 'Valor a ser pesquisado';
  CBSituacao.Hint := 'Situação do Registro (Ativo/Inativo)';
  CBFuncao.Hint := 'Função do Vendedor';
  DBGrid1.Hint := 'Registro da Pesquisa';
end;

procedure TPesquisaVendedorForm.CBCondicaoSelect(Sender: TObject);
begin
  if not (EditValor.Text <> '') then
    Pesquisar;
end;

procedure TPesquisaVendedorForm.CBCriterioSelect(Sender: TObject);
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

procedure TPesquisaVendedorForm.CDSConsultaCalcFields(DataSet: TDataSet);
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

procedure TPesquisaVendedorForm.EditValorChange(Sender: TObject);
begin
  Pesquisar;
end;

procedure TPesquisaVendedorForm.FormCreate(Sender: TObject);
begin
  Tabela := 'VENDEDOR';
  CampoID := 'vendedor_id';
  CampoNome := 'nome';
end;

procedure TPesquisaVendedorForm.FormShow(Sender: TObject);
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
