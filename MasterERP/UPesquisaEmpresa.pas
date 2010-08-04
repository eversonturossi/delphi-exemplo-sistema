unit UPesquisaEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPesquisaPadrao, FMTBcd, ActnList, Menus, AppEvnts, DB, DBClient,
  Provider, SqlExpr, Grids, DBGrids, StdCtrls, Buttons, JvExControls,
  JvGradientHeaderPanel, ExtCtrls, ComCtrls;

type
  TPesquisaEmpresaForm = class(TPesquisaPadraoForm)
    CDSConsultaPESSOA_ID: TIntegerField;
    CDSConsultaATIVO: TSmallintField;
    CDSConsultaDATA_CADASTRO: TSQLTimeStampField;
    CDSConsultaDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSConsultaNOME: TStringField;
    CDSConsultaNOME_APELIDO_FANTASIA: TStringField;
    CDSConsultaEMPRESA_ID: TIntegerField;
    CDSConsultaCNPJ_CPF: TStringField;
    CDSConsultaTIPO: TStringField;
    CDSConsultaIE_IDENTIDADE: TStringField;
    CDSConsultaIM: TStringField;
    CDSConsultaFILIAL: TSmallintField;
    CDSConsultacalc_tipo: TStringField;
    procedure CDSConsultaCalcFields(DataSet: TDataSet);
    procedure CBCriterioSelect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditValorChange(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisar;
  public
    { Public declarations }
  end;

var
  PesquisaEmpresaForm: TPesquisaEmpresaForm;

implementation
uses Base;
{$R *.dfm}

procedure TPesquisaEmpresaForm.Pesquisar;
var
  Criterio, Condicao, Campo, Valor : ShortString;
  SqlConsulta : String;
begin
  try
    CDSConsulta.DisableControls;
    Valor := Trim(UpperCase(EditValor.Text));
    SqlConsulta := 'select p.PESSOA_ID, p.ATIVO, p.DATA_CADASTRO, ' +
      'p.DATA_ULTIMA_ALTERACAO, p.NOME, p.NOME_APELIDO_FANTASIA, e.EMPRESA_ID, ' +
      'e.CNPJ_CPF, e.TIPO, e.IE_IDENTIDADE, e.IM, e.FILIAL ' +
      'from PESSOA p, EMPRESA e where (e.PESSOA_ID = p.PESSOA_ID)';

    if (Valor <> '') then
      begin
        case CBCriterio.ItemIndex of
          1: Campo := 'e.EMPRESA_ID';
          2: Campo := 'p.NOME';
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

        SqlConsulta := SqlConsulta + Condicao;
      end;

    if (CBSituacao.ItemIndex in [0,1]) then
      begin
        if (Pos('where', SqlConsulta) > 0) then
          SqlConsulta := SqlConsulta + ' and p.ATIVO = ' + IntToStr(CBSituacao.ItemIndex)
        else
          SqlConsulta := SqlConsulta + ' where p.ATIVO = ' + IntToStr(CBSituacao.ItemIndex);
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

procedure TPesquisaEmpresaForm.CBCriterioSelect(Sender: TObject);
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

procedure TPesquisaEmpresaForm.CDSConsultaCalcFields(DataSet: TDataSet);
begin
  if (CDSConsultaTIPO.Value = 'J') then
    CDSConsultacalc_tipo.Value := 'Pessoa Jurídica'
  else if (CDSConsultaTIPO.Value = 'F') then
    CDSConsultacalc_tipo.Value := 'Pessoa Física';
end;

procedure TPesquisaEmpresaForm.EditValorChange(Sender: TObject);
begin
  Pesquisar;
end;

procedure TPesquisaEmpresaForm.FormCreate(Sender: TObject);
begin
  Tabela := 'EMPRESA';
  CampoID := 'empresa_id';
  CampoNome := 'Nome_Razao';
end;

end.
