unit UFuncoes;
interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, DBCtrls, StdCtrls, SqlExpr, ExtCtrls;

  function RCopy(Original, Sub: String): String;
  procedure CriaForm(frmClass: TFormClass; out NewObj);
  function Mensagem(const Msg: ShortString; AType: TMsgDlgType; AButtons: TMsgDlgButtons;
    DefButton : TModalResult; HelpCtx: Longint): Word;
  procedure Log(Query : TSQLQuery ; UsuarioID : Integer ; Tabela, Operacao : ShortString);
  procedure Alteracao(Query : TSQLQuery ; UsuarioID : Integer ; Tabela : ShortString ; Dados : TMemo);
  procedure GeraTrace(Modulo: ShortString; Mensagem : String);
  function CriaLinha(Digitos : Integer): String;
  function LerOpcaoUsuario(Query : TSQLQuery ; Usuario, Item : Integer ; Descricao, Default, Tabela : ShortString): ShortString;
  procedure GravarOpcaoUsuario(Query : TSQLQuery ; Usuario, Item : Integer ; Valor, Tabela : ShortString);
  function Trace(Query : TSQLQuery ; Tabela : ShortString): Integer;
  procedure GerarPrivilegios(Conexao : TSQLConnection ; UsuarioID : Integer ; Nivel : ShortString);
  function RetornaSemAcento(Texto : String) : String;
  function RetornaMaiuscula(Texto : String) : String;
  function TestaInteiro(Valor : ShortString): Boolean;
  function Repl(C: ShortString; Tamanho: integer): ShortString;
  function PreencheEspaco(Texto : String; Tamanho : Integer; Preenchimento, Sentido : Char): String;
var
  AtivaTrace : Boolean = False;

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

procedure CriaForm(frmClass: TFormClass; out NewObj);
begin
  try
    TForm(NewObj) := FrmClass.create(Application);
    TForm(NewObj).ShowModal
  finally
    FreeAndNil(NewObj);
  end;
end;

function Mensagem(const Msg: ShortString; AType: TMsgDlgType; AButtons: TMsgDlgButtons;
  DefButton : TModalResult; HelpCtx: Longint): Word;
var
  i : Integer;
begin
  with CreateMessageDialog(Msg,AType,AButtons) do
    try
      Case Atype of
        mtInformation : Caption:='InformaÁ„o';
        mtError : Caption:='Erro!';
        mtWarning : Caption:='AdvertÍncia';
        mtConfirmation : Caption:='ConfirmaÁ„o';
      end;
      HelpContext := HelpCtx;
      for i := 0 to ComponentCount - 1 do
        begin
          if (Components[i] is TButton) then
            with TButton(Components[i]) do
              case ModalResult of
                mrYes : Caption := '&Sim';
                mrNo : Caption := '&N„o';
                mrCancel : Caption:='&Cancelar';
              end;
          if (Components[i] is TButton) and (TButton(Components[i]).ModalResult = DefButton) then
            ActiveControl := TButton(Components[i]);
        end;
      Result := ShowModal;
    finally
      Free;
    end;
end;

procedure Log(Query : TSQLQuery ; UsuarioID : Integer ; Tabela, Operacao : ShortString);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
  with Query do
    begin
      SQL.Text := 'insert into LOG_OPERACAO(USUARIO_ID, DATA_LANCAMENTO,TABELA,OPERACAO)VALUES(' +
        IntToStr(UsuarioID) + ', ' +
        QuotedStr(FormatDateTime('dd.mm.yyyy hh:mm:ss', Now)) + ', ' +
        QuotedStr(Tabela) + ', ' +
        QuotedStr(Operacao) + ');';
      ExecSQL(True);
    end;
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure Alteracao(Query : TSQLQuery ; UsuarioID : Integer ; Tabela : ShortString ; Dados : TMemo);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
  with Query do
    begin
      SQL.Text := 'insert into ALTERACAO(DATA_CADASTRO, ATIVO, RECUPERADA,' +
        'USUARIO_ID, DADOS, TABELA)VALUES(' +
        QuotedStr(FormatDateTime('dd.mm.yyyy hh:mm:ss', Now)) + ', ' +
        IntToStr(1) + ', ' +
        IntToStr(0) + ', ' +
        IntToStr(UsuarioID) + ', ' +
        QuotedStr(Dados.Lines.Text) + ', ' +
        QuotedStr(Tabela) + ');';
      ExecSQL(True);
    end;
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure GeraTrace(Modulo : ShortString; Mensagem : String);
const SubDiretorio : ShortString = '\trace\';
var
 F : TextFile;
 ArquivoApagar : ShortString;
 vai : Boolean;
begin
 if (AtivaTrace) then
   begin
     if not (DirectoryExists(ExtractFilePath(Application.ExeName) + SubDiretorio)) then
       if not (CreateDir(ExtractFilePath(Application.ExeName) + SubDiretorio)) then
         Vai := True
       else
         Vai := False;

     if (Vai) then
       begin
         try
           ArquivoApagar := ExtractFilePath(Application.ExeName) + SubDiretorio + 'trace-' +
             FormatDateTime('yyyymmdd',Date - 10) + '-' + LowerCase(Modulo)+'.trace';
           try
              AssignFile(F,ExtractFilePath(Application.ExeName) + SubDiretorio + 'trace-' +
                FormatDateTime('yyyymmdd',date) + '-' + LowerCase(Modulo) + '.trace');
              {$i-}
              Reset(F);
              {$i+}
              if (IOResult <> 0) then
                Rewrite(F);

              Append(F);
              Write(f,'');
              Writeln(F, Base64EncodeStr(FormatDateTime('yyyy-mm-dd hh:mm:ss',Now) + ' - ' +
                Mensagem));

              if (FileExists(ArquivoApagar)) then
                begin
                  try
                    DeleteFile(ArquivoApagar);
                  except
                    Writeln(F, Base64EncodeStr(FormatDateTime('yyyy-mm-dd hh:mm:ss',Now) + ' - ' +
                      'Problemas na tentativa de apagar o arquivo ' + ArquivoApagar));
                  end;
                end;
           finally
             CloseFile(F);
           end;
         except
           UFuncoes.Mensagem('Erro ao tentar gravar o Trace', mtWarning,[mbOk],mrOK,0);
         end;
       end
     else
       UFuncoes.Mensagem('Erro inesperado ao tentar criar a SubPasta ' + SubDiretorio + '!' + #13 +
         ' Verifique as permissıes da pasta Base.', mtWarning,[mbOk],mrOK,0);
   end;
end;

function CriaLinha(Digitos : Integer): String; export;
var
  i : Integer;
begin
  Result:='';
  for i := Length(Result) to Digitos -1 do
    Result := Result + '-';
end;

function LerOpcaoUsuario(Query : TSQLQuery ; Usuario, Item : Integer ; Descricao, Default, Tabela : ShortString): ShortString;
begin
  GeraTrace(BancoDados.Tabela,'Lendo Dados da Preferencia (Item): ' + IntToStr(Item) + '.');
  with Query do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select valor from usuario_preferencia where usuario_id = ' +
        IntToStr(Usuario) + ' and tabela = ' + QuotedStr(Tabela) +
        ' and item = ' + IntToStr(Item));
      Open;
    end;

  if not (Query.IsEmpty) then
     Result := Query.Fields[0].Value
  else
    begin
      Result := Default;
      BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
      Query.SQL.Text := 'insert into usuario_preferencia(Usuario_id,item,descricao,valor,tabela)' +
        'values(' +
        IntToStr(Usuario) + ', ' +
        IntToStr(Item) + ', ' +
        QuotedStr(Descricao) + ', ' +
        QuotedStr(Default) + ', ' +
        QuotedStr(Tabela) +');';
      Query.ExecSQL;
      BancoDados.Conexao.Commit(BancoDados.Transacao);
    end;
  GeraTrace(BancoDados.Tabela,'Dados da Preferencia Lidos (Item): ' + IntToStr(Item) + '.');
end;

procedure GravarOpcaoUsuario(Query : TSQLQuery ; Usuario, Item : Integer ; Valor, Tabela : ShortString);
begin
  GeraTrace(BancoDados.Tabela,'Gravando Dados da Preferencia (Item): ' + IntToStr(Item) + '.');
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
  Query.SQL.Text := 'update usuario_preferencia set ' +
    'valor = ' + QuotedStr(Valor) +
    ' where usuario_id = ' + IntToStr(Usuario) + ' and tabela = ' +
    QuotedStr(Tabela) + ' and item = ' + IntToStr(Item) + ';';
  Query.ExecSQL;
  BancoDados.Conexao.Commit(BancoDados.Transacao);
  GeraTrace(BancoDados.Tabela,'Dados da Preferencia Gravados (Item): ' + IntToStr(Item) + '.');
end;

function Trace(Query : TSQLQuery ; Tabela : ShortString): Integer;
begin
  with Query do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ativar_trace from tabela where tabela = ' +
        QuotedStr(Tabela));
      Open;
    end;
  if not (Query.IsEmpty) then
    Result := Query.Fields[0].Value
  else
    Result := 0;
end;
procedure GerarPrivilegios(Conexao : TSQLConnection ; UsuarioID : Integer ; Nivel : ShortString);
var
  Script : TStrings;
  qryPrivilegio, qryUsuarioPrivilegio, qryExecute : TSQLQuery;
  Acesso : Integer;
begin
  try
    GeraTrace(BancoDados.Tabela,'Verificando informaÁıes de PrivilÈgio do Usu·rio');
    qryUsuarioPrivilegio := TSQLQuery.Create(nil);
    qryUsuarioPrivilegio.SQLConnection := Conexao;

    with qryUsuarioPrivilegio do
      begin
        SQL.Text := 'select * from usuario_privilegio where usuario_id = ' +
          IntToStr(UsuarioID);
        Open;
      end;

    try
      Script := TStringList.Create;
      qryPrivilegio := TSQLQuery.Create(nil);
      qryPrivilegio.SQLConnection := Conexao;

      qryPrivilegio := TSQLQuery.Create(nil);
      qryPrivilegio.SQLConnection := Conexao;

      GeraTrace(BancoDados.Tabela,'Consultando PrivilÈgios a serem Inseridos');
      with qryPrivilegio do
        begin
          SQL.Text := 'select * from privilegio';
          Open;
          First;

          if not (IsEmpty) then
            begin
              try
                qryExecute := TSQLQuery.Create(nil);
                qryExecute.SQLConnection := Conexao;

                Conexao.StartTransaction(BancoDados.Transacao);
                while not Eof do
                  begin
                    qryUsuarioPrivilegio.First;
                    if not (qryUsuarioPrivilegio.Locate('PRIVILEGIO_ID',
                      qryPrivilegio.FieldByName('PRIVILEGIO_ID').Value,[])) then
                      begin
                        if (Nivel = 'ADM') then
                          Acesso := 1
                        else
                          Acesso := 0;
                        qryExecute.SQL.Text := 'insert into usuario_privilegio(usuario_id,privilegio_id,acesso)' +
                          'values(' +
                          IntToStr(UsuarioID) + ', ' +
                          QuotedStr(qryPrivilegio.FieldByName('PRIVILEGIO_ID').Value) + ', ' +
                          IntToStr(Acesso) + ');';
                        qryExecute.ExecSQL(True);
                      end;
                    Next;
                  end;
              finally
                Conexao.Commit(BancoDados.Transacao);
                qryExecute.Free;
                qryExecute := nil;
              end;
            end;
        end;
    finally
      Script.Free;
      qryPrivilegio.Free;
      qryPrivilegio := nil;
    end;
    GeraTrace(BancoDados.Tabela,'InformaÁıes de PrivilÈgio do Usu·rio Verificadas!');
  finally
    qryUsuarioPrivilegio.Free;
    qryUsuarioPrivilegio := nil;
  end;
end;
function RetornaSemAcento(Texto : String) : String;
const
  ComAcentuacao = ' ‡·‚„‰ËÈÍÎÏÌÓÔÚÛÙıˆ˘˙˚¸Á¿¡¬√ƒ»… ÀÃÕŒœ“”‘’÷Ÿ⁄€‹«@#$&*ß~^¥`'+'''';
  SemAcentuacao = ' aaaaaeeeeiiiiooooouuuucAAAAAEEEEIIIIOOOOOUUUUC               ';
var
  i : Integer;
begin
  try
    if (Texto <> '') then
      begin
        for i := 1 to Length(Texto) do
          if (Pos(Texto[i], ComAcentuacao) <> 0) then
            Texto[i] := SemAcentuacao[Pos(Texto[i],ComAcentuacao)];
      Result := Trim(Texto);
      end
    else
      Result := '';
  except
    Result := '';
  end;
end;
function RetornaMaiuscula(Texto : String) : String;
const
  Minuscula = ' abcdefghijklmnopqrstuvwxyz';
  Maiuscula = ' ABCDEFGHIJKLMNOPQRSTUVWXYZ';
var
  i : Integer;
begin
  try
    if (Texto <> '') then
      begin
        for i := 1 to Length(Texto) do
          if (Pos(Texto[i], Minuscula) <> 0) then
            Texto[i] := Maiuscula[Pos(Texto[i],Minuscula)];
      Result := Trim(Texto);
      end
    else
      Result := '';
  except
    Result := '';
  end;
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

function Repl(C: ShortString; Tamanho: integer): ShortString;
var
  Conteudo: string;
  Contar: integer;
begin
  Conteudo := '';
  for Contar := 1 to Tamanho do
  begin
    Conteudo := Conteudo + C;
    Application.ProcessMessages;
  end;
  Repl := Conteudo;
end;

function PreencheEspaco(Texto : String; Tamanho : Integer; Preenchimento, Sentido : Char): String;
var
  i, cont : integer;
  s : String;
begin
  cont := Length(Texto);
  s := '';
  if UpCase(Sentido) = 'E' then
    begin
      for i:=1 to Tamanho - cont do
        s := s + Preenchimento;
      s := s + Texto;
    end
  else
    if UpCase(Sentido) = 'D' then
      begin
        for i:=1 to Tamanho - cont do
          s := s + Preenchimento;
        s := Texto + s;
      end
    else
      begin
        MessageDlg('Parametro incorreto!',mtWarning,[mbOk],0);
        Result := '';
      end;
  Result := copy(s,1,Tamanho);
end;
end.
