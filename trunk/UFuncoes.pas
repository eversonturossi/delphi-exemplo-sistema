unit UFuncoes;
interface
uses
  SysUtils, Classes, ZConnection, DB, ZAbstractRODataset, ZDataset, ZSqlUpdate,
  ZAbstractDataset, Messages, Dialogs, Forms, StdCtrls, ExtCtrls, Windows, Variants,
  Controls, ZSqlProcessor, IniFiles, ZStoredProcedure;

  function RCopy(Original, Sub: String): String;
  function TestaInteiro(Valor : ShortString): Boolean;
  procedure GravaHistorico(Conexao : TZConnection ; descricao, ip, host : String ;
      Modulo, Usuario, Acao : Integer);
  function GeraSequenciador(EstProcedure : TZStoredProc ; Tabela, Campo : ShortString): Integer;
  procedure GravaSequenciador(Conexao : TZConnection ; Tabela, Campo : String ; IdAtual : Integer);
  procedure AbreTabela(Query : TZReadOnlyQuery ; Tabela : ShortString);
  procedure CriaForm(frmClass: TFormClass; out NewObj);

type
  TTipoOperacao = (toInsere, toAltera, toNenhuma);
  TTipoPreco = (poAtacado, poVarejo, poNenhum);

var
  TipoOperacao : TTipoOperacao;
  TipoPreco : TTipoPreco;

implementation
uses Base, Base64;
function RCopy(Original, Sub: String): String;
var
  Aux: String;
begin
  Aux := '';
  while pos(Sub, Original) > 0 Do Begin
    Aux := Aux + copy(Original, 1, Pos(Sub, Original));
    Delete(Original, 1, Pos(Sub, Original));
  end;

  Result := Aux;
end;
function TestaInteiro(Valor : ShortString): Boolean;
begin
  try
    StrToInt(Valor);
    Result := True;
  except
    Result := False;
  end; 
end;
procedure GravaHistorico(Conexao : TZConnection ; descricao, ip, host : String ;
      Modulo, Usuario, Acao : Integer);
var
  Script : TZSqlProcessor;
begin
  try
    Script := TZSqlProcessor.Create(nil);
    Script.Connection := Conexao;
    try
      Script.Script.Text := 'insert into lanhistorico(descricao,ip,host,idmodulo,idusuario,acao)values ('+
          QuotedStr(descricao)          +
          QuotedStr(ip)                 +
          QuotedStr(host)               +
          QuotedStr(IntToStr(modulo))   +
          QuotedStr(IntToStr(usuario))  +
          QuotedStr(IntToStr(acao))     +
          ');';
      Script.Execute;
    except
      MessageDlg('Erro ao gravar o Histórico.',mtWarning,[mbOK],0);
    end;

  finally
     FreeAndNil(Script);
  end;
end;
function GeraSequenciador(EstProcedure : TZStoredProc ; Tabela, Campo : ShortString): Integer;
begin
  with EstProcedure do
    begin
      try
        Params[0].Value := Tabela;
        Params[1].Value := Campo;
        Result := Params[2].Value;
      except
        Result := 0;
      end;
    end;

end;
procedure GravaSequenciador(Conexao : TZConnection ; Tabela, Campo : String ; IdAtual : Integer);
var
  Script : TZSqlProcessor;
begin
  try
    Script := TZSqlProcessor.Create(nil);
    Script.Connection := conexao;

    try
      Script.Script.Text := 'update cadsequenciador set idatual = ' +
          QuotedStr(IntToStr(IdAtual)) + ' where tabela = ' + QuotedStr(tabela) +
          ' and campo = ' + QuotedStr(Campo) + ';';
      Script.Execute;
    except
      MessageDlg('Erro ao atualizar o Sequenciador.',mtWarning,[mbOK],0);
    end;

  finally
     FreeAndNil(Script);
  end;
end;
procedure AbreTabela(Query : TZReadOnlyQuery ; Tabela : ShortString);
begin
  with Query do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from ' + Tabela);
      Open;
      Last;
      First;
    end;
end;
procedure CriaForm(frmClass: TFormClass; out NewObj);
begin
  try
    TForm(NewObj) := FrmClass.create(Application);
    TForm(NewObj).ShowModal;
  finally
    FreeAndNil(NewObj);
  end;
end;
end.
