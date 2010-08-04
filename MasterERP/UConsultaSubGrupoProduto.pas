unit UConsultaSubGrupoProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UConsultaPadrao, FMTBcd, Menus, AppEvnts, DBClient, Provider,
  ActnList, DB, SqlExpr, ComCtrls, StdCtrls, Grids, DBGrids, Buttons,
  JvExControls, JvGradientHeaderPanel, ExtCtrls;

type
  TConsultaSubGrupoProdutoForm = class(TConsultaPadraoForm)
    CDSConsultaPRODUTO_SUBGRUPO_ID: TIntegerField;
    CDSConsultaATIVO: TSmallintField;
    CDSConsultaDATA_CADASTRO: TSQLTimeStampField;
    CDSConsultaDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSConsultaPRODUTO_GRUPO_ID: TIntegerField;
    CDSConsultaDESCRICAO: TStringField;
    CDSConsultal_grupo_descricao: TStringField;
    procedure BTPesquisarClick(Sender: TObject);
    procedure CBCriterioSelect(Sender: TObject);
    procedure EditValorKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTNovoClick(Sender: TObject);
    procedure BTAlterarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisar;
    procedure CarregaHint;
  public
    { Public declarations }
  end;

var
  ConsultaSubGrupoProdutoForm: TConsultaSubGrupoProdutoForm;

implementation
uses Base, UFuncoes, UCadastroSubGrupoProduto;
{$R *.dfm}

procedure TConsultaSubGrupoProdutoForm.CarregaHint;
begin
  CBCriterio.Hint := 'Campo a ser pesquisado';
  CBCondicao.Hint := 'Condição para pesquisa';
  EditValor.Hint := 'Valor a ser pesquisado';
  CBSituacao.Hint := 'Situação do Registro (Ativo/Inativo)';
  DBGrid1.Hint := 'Registro da Pesquisa';
  BTPesquisar.Hint := 'Execure a Pesquisa';
  BTNovo.Hint := 'Insira um novo SubGrupo de Produtos';
  BTAlterar.Hint := 'Altere o SubGrupo de Produtos selecionado';
  BTExportar.Hint := 'Exporte os Dados do SubGrupo de Produtos selecionado';
  BTSair.Hint := 'Sair da Tela de Consulta do SubGrupo de Produtos';
end;

procedure TConsultaSubGrupoProdutoForm.Pesquisar;
var
  Criterio, Condicao, Campo, Valor : ShortString;
begin
  try
    CDSConsulta.DisableControls;
    Valor := Trim(UpperCase(EditValor.Text));

    BancoDados.SqlConsulta := 'select * from ' + BancoDados.Tabela;

    if (Valor <> '') then
      begin
        case CBCriterio.ItemIndex of
          1: Campo := 'PRODUTO_SUBGRUPO_ID';
          2: Campo := 'DESCRICAO';
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
          2: begin
            case CBCondicao.ItemIndex of
              0: Condicao := ' where Upper(' + Campo + ') = '       + QuotedStr(Valor);
              1: Condicao := ' where Upper(' + Campo + ') <> '      + QuotedStr(Valor);
              2: Condicao := ' where Upper(' + Campo + ') like '    + QuotedStr(Valor + '%');
              3: Condicao := ' where Upper(' + Campo + ') like '    + QuotedStr('%' + Valor + '%');
              4: Condicao := ' where Upper(' + Campo + ') like '    + QuotedStr(Valor + '%');
            end;
          end;
        end;

        BancoDados.SqlConsulta := BancoDados.SqlConsulta + Condicao;
      end;

    if (CBSituacao.ItemIndex in [0,1]) then
      begin
        if (Pos('where', BancoDados.SqlConsulta) > 0) then
          BancoDados.SqlConsulta := BancoDados.SqlConsulta + ' and ATIVO = ' + IntToStr(CBSituacao.ItemIndex)
        else
          BancoDados.SqlConsulta := BancoDados.SqlConsulta + ' where ATIVO = ' + IntToStr(CBSituacao.ItemIndex);
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

procedure TConsultaSubGrupoProdutoForm.BTAlterarClick(Sender: TObject);
begin
  inherited; //Herança

  try
    if not Assigned(CadastroSubGrupoProdutoForm) then
      CadastroSubGrupoProdutoForm := TCadastroSubGrupoProdutoForm.Create(Application);
    BancoDados.Operacao := 'Alterar';
    BancoDados.Id := CDSConsultaPRODUTO_GRUPO_ID.Value;
    SBPrincipal.Panels[0].Text := '';
    CadastroSubGrupoProdutoForm.ShowModal;
  finally
    CDSConsulta.Close;
    CDSConsulta.Open;
    CadastroSubGrupoProdutoForm.Free;
    CadastroSubGrupoProdutoForm := nil;
  end;
end;

procedure TConsultaSubGrupoProdutoForm.BTNovoClick(Sender: TObject);
begin
  try
    BarraStatus := False;
    if not Assigned(CadastroSubGrupoProdutoForm) then
      CadastroSubGrupoProdutoForm := TCadastroSubGrupoProdutoForm.Create(Application);
    BancoDados.Operacao := 'Inserir';
    SBPrincipal.Panels[0].Text := '';
    CadastroSubGrupoProdutoForm.ShowModal;
  finally
    CDSConsulta.Close;
    CDSConsulta.Open;
    CadastroSubGrupoProdutoForm.Free;
    CadastroSubGrupoProdutoForm := nil;
    BarraStatus := True;
  end;
end;

procedure TConsultaSubGrupoProdutoForm.BTPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TConsultaSubGrupoProdutoForm.CBCriterioSelect(Sender: TObject);
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
    2: begin
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

procedure TConsultaSubGrupoProdutoForm.EditValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
    BTPesquisarClick(Sender);
end;

procedure TConsultaSubGrupoProdutoForm.FormCreate(Sender: TObject);
begin
  BancoDados.Tabela := 'PRODUTO_SUBGRUPO';
  BancoDados.SqlConsulta := '';

  inherited; //Herança
end;

procedure TConsultaSubGrupoProdutoForm.FormShow(Sender: TObject);
begin

  inherited; //Herança

  CBCriterioSelect(Sender);
  BTPesquisarClick(Sender);
  CarregaHint;
end;
end.
