unit UFuncoes;
interface
uses
  SysUtils, Classes, ZConnection, DB, ZAbstractRODataset, ZDataset, ZSqlUpdate,
  ZAbstractDataset, Messages, Dialogs, Forms, StdCtrls, ExtCtrls, Windows, Variants,
  Controls, ZSqlProcessor, IniFiles;

  function RCopy(Original, Sub: String): String;
  function TestaInteiro(Valor : ShortString): Boolean;
  function GravaHistorico(Conexao : TZConnection ; descricao, ip, host : String ;
      Modulo, Usuario, Acao : Integer): Boolean;
  function GeraSequenciador(Query : TZReadOnlyQuery ; Tabela, Campo : String): Integer;
  function GravaSequenciador(Conexao : TZConnection ; Tabela, Campo : String ; IdAtual : Integer): Boolean;

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
function GravaHistorico(Conexao : TZConnection ; descricao, ip, host : String ;
      Modulo, Usuario, Acao : Integer): Boolean;
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
      Result := False;
    end;

  finally
     Result := True;
     FreeAndNil(Script);
  end;
end;
function GeraSequenciador(Query : TZReadOnlyQuery ; Tabela, Campo : String): Integer;
begin
  try
    with Query do
      begin
        SQL.Text := 'select idatual from cadsequenciador where tabela = ' +
           QuotedStr(tabela) + ' and campo = ' + QuotedStr(Campo);
        Open;
      end;

    if not (Query.IsEmpty) then
      Result := Query.Fields[0].Value + 1;

  except
    Result := 0;
  end;
end;
function GravaSequenciador(Conexao : TZConnection ; Tabela, Campo : String ; IdAtual : Integer): Boolean;
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
      Result := False;
    end;

  finally
     Result := True;
     FreeAndNil(Script);
  end;
end;
end.
