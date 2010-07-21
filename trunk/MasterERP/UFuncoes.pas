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
  function Parametro(Query : TSQLQuery ; Parametro : Integer ; ValorPadrao : String) : String;
  function TestaCNPJ(Numero: ShortString): Boolean;
  function TestaCPF(Numero: ShortString): Boolean;
  function RetornaNumeros(Numero : ShortString) : ShortString;
  function TabelaDescricaoReduzida(Tabela : ShortString): ShortString;
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
    if (BancoDados.LiberaFormulario) then
      TForm(NewObj).ShowModal
    else
      Mensagem('O Usu·rio n„o tem privilÈgios de Acesso para este MÛdulo!', mtWarning,[mbOk],mrOK,0);
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

function Parametro(Query : TSQLQuery ; Parametro : Integer ; ValorPadrao : String) : String;
begin
  try
    with Query do
      begin
        Close;
        SQL.Text := ' select valor from parametro where ativo = 1' +
          ' and parametro = ' + IntToStr(Parametro);
        Open;
      end;
    if not (Query.IsEmpty) then
      Result := Query.Fields[0].Value
    else
      Result := ValorPadrao;
  except
    Result := ValorPadrao;
  end;
end;

function TestaCNPJ(Numero: ShortString): Boolean;
var
  n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,d1,d2 : integer;
  Digitado, Calculado : ShortString;
begin
  try
    if (Length(Numero) = 14) then
      begin
        n1 := StrToInt(Numero[1]);
        n2 := StrToInt(Numero[2]);
        n3 := StrToInt(Numero[3]);
        n4 := StrToInt(Numero[4]);
        n5 := StrToInt(Numero[5]);
        n6 := StrToInt(Numero[6]);
        n7 := StrToInt(Numero[7]);
        n8 := StrToInt(Numero[8]);
        n9 := StrToInt(Numero[9]);
        n10 := StrToInt(Numero[10]);
        n11 := StrToInt(Numero[11]);
        n12 := StrToInt(Numero[12]);
        d1 := (n12 * 2) + (n11 * 3) + (n10 * 4) + (n9 * 5) + (n8 * 6) + (n7 * 7) +
          (n6 * 8) + (n5 * 9) + (n4 * 2) + (n3 * 3) + (n2 * 4) + (n1 * 5);
        d1 := 11 - (d1 mod 11);
        if (d1 >= 10) then
          d1 := 0;
        d2 := (d1 * 2) + (n12 * 3) + (n11 * 4) + (n10 * 5) + (n9 * 6) + (n8 * 7) +
          (n7 * 8) + (n6 * 9) + (n5 * 2) + (n4 * 3) + (n3 * 4) + (n2 * 5) + (n1 * 6);
        d2 := 11 - (d2 mod 11);
        if (d2 >= 10) then
          d2 := 0;
        Calculado := IntToStr(d1) + IntTostr(d2);
        Digitado := Numero[13] + Numero[14];
        if (Calculado = Digitado) then
          Result := True
        else
          Result := False;
      end
    else
      Result := False;
  except
    Result := False;
  end;
end;

function TestaCPF(Numero: ShortString): Boolean;
var
  n1,n2,n3,n4,n5,n6,n7,n8,n9,d1,d2 : integer;
  Digitado, Calculado : ShortString;
begin
  try
    if (Length(Numero) = 11) then
      begin
        n1 := StrToInt(Numero[1]);
        n2 := StrToInt(Numero[2]);
        n3 := StrToInt(Numero[3]);
        n4 := StrToInt(Numero[4]);
        n5 := StrToInt(Numero[5]);
        n6 := StrToInt(Numero[6]);
        n7 := StrToInt(Numero[7]);
        n8 := StrToInt(Numero[8]);
        n9 := StrToInt(Numero[9]);
        d1 := (n9 * 2) + (n8 * 3) + (n7 * 4) + (n6 * 5) + (n5 * 6) + (n4 * 7) +
          (n3 * 8) + (n2 * 9) + (n1 * 10);
        d1 := 11 - (d1 mod 11);
        if (d1 >= 10) then
          d1 := 0;
        d2 := (d1 * 2) + (n9 * 3) + (n8 * 4) + (n7 * 5) + (n6 * 6) + (n5 * 7) +
          (n4 * 8) + (n3 * 9) + (n2 * 10) + (n1*11);
        d2 := 11 - (d2 mod 11);
        if (d2 >= 10) then
          d2 := 0;
        Calculado := IntToStr(d1) + IntTostr(d2);
        Digitado := Numero[10] + Numero[11];
        if (Calculado = Digitado) then
          Result := True
        else
          Result := False;
      end
    else
      Result := False;
  except
    Result := False;
  end;
end;

function RetornaNumeros(Numero : ShortString) : ShortString;
var
  i, x : integer;
  Temp, Letras : ShortString;
begin
  Letras := '0123456789';
  Temp := '';
  if (Numero <> '') then
    begin
      for x := 1 to Length(Numero) do
        for i := 1 to Length(Letras) do
          if (Numero[x] = Letras[i]) then
            Temp := Temp + Numero[x];
      Result := Trim(Temp);
    end
  else
    Result := '';
end;

function TabelaDescricaoReduzida(Tabela : ShortString): ShortString;
begin
  with BancoDados.qryAuxiliar do
    begin
      Close;
      SQL.Text := 'select descricao_reduzida from tabela where tabela = ' +
        QuotedStr(Tabela);
      Open;
    end;
  if not (BancoDados.qryAuxiliar.IsEmpty) then
    Result := BancoDados.qryAuxiliar.Fields[0].Value
  else
    Result := '';
end;
end.
