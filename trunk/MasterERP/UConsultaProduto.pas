unit UConsultaProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UConsultaPadrao, FMTBcd, Menus, AppEvnts, DBClient, Provider,
  ActnList, DB, SqlExpr, ComCtrls, StdCtrls, Grids, DBGrids, Buttons,
  JvExControls, JvGradientHeaderPanel, ExtCtrls;

type
  TConsultaProdutoForm = class(TConsultaPadraoForm)
    CDSConsultaPRODUTO_ID: TIntegerField;
    CDSConsultaATIVO: TSmallintField;
    CDSConsultaDATA_CADASTRO: TSQLTimeStampField;
    CDSConsultaDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSConsultaDESCRICAO: TStringField;
    CDSConsultaDESCRICAO_REDUZIDA: TStringField;
    CDSConsultaREFERENCIA: TStringField;
    CDSConsultaUNIDADE_ID: TIntegerField;
    CDSConsultaPRECO: TFloatField;
    CDSConsultal_unidade: TStringField;
    procedure EditValorKeyPress(Sender: TObject; var Key: Char);
    procedure BTNovoClick(Sender: TObject);
    procedure BTPesquisarClick(Sender: TObject);
    procedure CBCriterioSelect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTAlterarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisar;
  public
    { Public declarations }
  end;

var
  ConsultaProdutoForm: TConsultaProdutoForm;

implementation
uses Base, UFuncoes, UCadastroProduto;
{$R *.dfm}

procedure TConsultaProdutoForm.Pesquisar;
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

procedure TConsultaProdutoForm.BTAlterarClick(Sender: TObject);
begin
  inherited; //Herança

  try
    if not Assigned(CadastroProdutoForm) then
      CadastroProdutoForm := TCadastroProdutoForm.Create(Application);
    BancoDados.Operacao := 'Alterar';
    BancoDados.Id := CDSConsultaPRODUTO_ID.Value;
    SBPrincipal.Panels[0].Text := '';
    CadastroProdutoForm.ShowModal;
  finally
    CDSConsulta.Close;
    CDSConsulta.Open;
    CadastroProdutoForm.Free;
    CadastroProdutoForm := nil;
  end;
end;

procedure TConsultaProdutoForm.BTNovoClick(Sender: TObject);
begin
  try
    if not Assigned(CadastroProdutoForm) then
      CadastroProdutoForm := TCadastroProdutoForm.Create(Application);
    BancoDados.Operacao := 'Inserir';
    SBPrincipal.Panels[0].Text := '';
    CadastroProdutoForm.ShowModal;
  finally
    CDSConsulta.Close;
    CDSConsulta.Open;
    CadastroProdutoForm.Free;
    CadastroProdutoForm := nil;
  end;
end;

procedure TConsultaProdutoForm.BTPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TConsultaProdutoForm.CBCriterioSelect(Sender: TObject);
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

procedure TConsultaProdutoForm.EditValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
    BTPesquisarClick(Sender);
end;

procedure TConsultaProdutoForm.FormCreate(Sender: TObject);
begin
  BancoDados.Tabela := 'PRODUTO';
  BancoDados.SqlConsulta := '';

  inherited; //Herança
end;

procedure TConsultaProdutoForm.FormShow(Sender: TObject);
begin
  BancoDados.CDSUnidade.Close;
  BancoDados.qryUnidade.SQL.Text := 'select * from unidade';
  BancoDados.CDSUnidade.Open;

  inherited; //Herança

  CBCriterioSelect(Sender);
  BTPesquisarClick(Sender);
end;

end.
