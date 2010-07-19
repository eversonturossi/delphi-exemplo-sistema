unit UConcultaUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UConsultaPadrao, FMTBcd, Menus, AppEvnts, DBClient, Provider,
  ActnList, DB, ExtCtrls, SqlExpr, ComCtrls, Grids, DBGrids, StdCtrls, Buttons,
  SimpleDS, JvExControls, JvGradientHeaderPanel;

type
  TConcultaUsuarioForm = class(TConsultaPadraoForm)
    qryConsultaUSUARIO_ID: TIntegerField;
    qryConsultaNOME: TStringField;
    qryConsultaLOGIN: TStringField;
    qryConsultaSENHA: TStringField;
    qryConsultaATIVO: TSmallintField;
    qryConsultaDATA_CADASTRO: TSQLTimeStampField;
    qryConsultaNIVEL: TStringField;
    CDSConsultaUSUARIO_ID: TIntegerField;
    CDSConsultaNOME: TStringField;
    CDSConsultaLOGIN: TStringField;
    CDSConsultaSENHA: TStringField;
    CDSConsultaATIVO: TSmallintField;
    CDSConsultaDATA_CADASTRO: TSQLTimeStampField;
    CDSConsultaNIVEL: TStringField;
    qryConsultaDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSConsultaDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BTNovoClick(Sender: TObject);
    procedure BTAlterarClick(Sender: TObject);
    procedure CBCriterioSelect(Sender: TObject);
    procedure BTPesquisarClick(Sender: TObject);
    procedure EditValorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Pesquisar;
  public
    { Public declarations }
  end;

var
  ConcultaUsuarioForm: TConcultaUsuarioForm;

implementation
uses Base, UFuncoes, UCadastroUsuario;
{$R *.dfm}

procedure TConcultaUsuarioForm.Pesquisar;
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
          1: Campo := 'USUARIO_ID';
          2: Campo := 'NOME';
          3: Campo := 'LOGIN';
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

procedure TConcultaUsuarioForm.EditValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
    BTPesquisarClick(Sender);
end;

procedure TConcultaUsuarioForm.BTAlterarClick(Sender: TObject);
begin
  inherited; //Herança

  try
    if not Assigned(CadastroUsuarioForm) then
      CadastroUsuarioForm := TCadastroUsuarioForm.Create(Application);
    BancoDados.Operacao := 'Alterar';
    BancoDados.Id := CDSConsultaUSUARIO_ID.Value;
    SBPrincipal.Panels[0].Text := '';
    CadastroUsuarioForm.ShowModal;
  finally
    CDSConsulta.Close;
    CDSConsulta.Open;
    CadastroUsuarioForm.Free;
    CadastroUsuarioForm := nil;
  end;
end;

procedure TConcultaUsuarioForm.BTNovoClick(Sender: TObject);
begin
  try
    if not Assigned(CadastroUsuarioForm) then
      CadastroUsuarioForm := TCadastroUsuarioForm.Create(Application);
    BancoDados.Operacao := 'Inserir';
    SBPrincipal.Panels[0].Text := '';
    CadastroUsuarioForm.ShowModal;
  finally
    CDSConsulta.Close;
    CDSConsulta.Open;
    CadastroUsuarioForm.Free;
    CadastroUsuarioForm := nil;
  end;
end;

procedure TConcultaUsuarioForm.BTPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TConcultaUsuarioForm.CBCriterioSelect(Sender: TObject);
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

procedure TConcultaUsuarioForm.FormCreate(Sender: TObject);
begin
  BancoDados.Tabela := 'USUARIO';
  BancoDados.SqlConsulta := '';

  inherited; //Herança
end;

procedure TConcultaUsuarioForm.FormShow(Sender: TObject);
begin
  inherited; //Herança

  CBCriterioSelect(Sender);
  BTPesquisarClick(Sender);
end;

end.
