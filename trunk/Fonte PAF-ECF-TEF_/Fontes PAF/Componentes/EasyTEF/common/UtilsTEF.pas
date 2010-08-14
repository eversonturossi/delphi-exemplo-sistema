{*******************************************************************************
  Autor......: EasyTEF Team - 16/05/2008
  Objetivo...: Implementar funções personalizadas e uteis para o componente
               TEasyTEFDiscado.
  Comentários:
  Alterações.:
*******************************************************************************}

unit UtilsTEF;

interface

{$I DelphiVer.inc}

uses
  Classes {$IFDEF DELPHI_6_UP}, Variants {$ENDIF};

// chamada a API do Windows para travar a entrada de dados pelo teclado
function blockInput(blk: Boolean): Boolean; stdcall; external 'user32.dll' name 'BlockInput';
function completarDireita(s: string; charToComplete: char; size: Integer): string;
function completarEsquerda(s: string; charToComplete: char; size: Integer): string;
function diasPorMes(mes, ano: Integer): Integer;
function isNumeric(s: string): Boolean;
function limparLetras(s: string): string;
function nuloOuVazio(v: Variant): Boolean;
function stringToStringList(s: string; separador: Char = ';'): TStringList;

implementation

uses SysUtils;

function isNumeric(s: string): Boolean;
var i: Integer;
begin
  Result := not (s = '');
  for i := 1 to Length(s) do begin
    Result := Result and (s[i] in ['0'..'9']);
    if not Result then
      Break;
  end;//for
end;//function

function stringToStringList(s: string; separador: Char = ';'): TStringList;
var p: Integer;
begin
  Result := TStringList.Create;
  p := Pos(separador, s);
  if p = 0 then
    Result.Add(s)
  else begin
    while not (p = 0) do begin
      Result.Add(Copy(s, 1, p - 1));
      Delete(s, 1, p);
      p := Pos(separador, s);
    end;//while
    Result.Add(s);
  end;//else
end;//function

function diasPorMes(mes, ano: Integer): Integer;
begin
  Result := 0;
  case mes of
    1,3,5,7,8,10,12: Result := 31;
    4,6,9,11: Result := 30;
    2: begin
      if IsLeapYear(ano) then
        Result := 29
      else
        Result := 28;
    end;
  end;
end;

function completarEsquerda(s: string; charToComplete: char; size: Integer): string;
var i: Integer;
begin
  Result := s;
  for i := Length(s) to size - 1 do
    Result := charToComplete + Result;
end;

function completarDireita(s: string; charToComplete: char; size: Integer): string;
var i: Integer;
begin
  Result := s;
  for i := Length(s) to size - 1 do
    Result := Result + charToComplete;
end;

function nuloOuVazio(v: Variant): Boolean;
begin
  Result := VarIsNull(v) or VarIsArray(v);
end;

function limparLetras(s: string): string;
var i: Integer;
begin
  Result := s;
  for i := 1 to Length(s) do begin
    if (s[i] in ['a'..'z']) or (s[i] in ['A'..'Z']) then
      Delete(s, i, 1);
  end;
end;


end.
