unit UFuncaoExibirColuna;

interface
uses
  SysUtils, Forms, Dialogs, Messages, Controls, DBGrids, Classes;

  function ConsultaExibir(Grid : TDBGrid ; UsuarioID, TabelaFuncao : Integer ; Tabela : ShortString): Integer;
  procedure ConfiguraGrade(Grid : TDBGrid ; UsuarioID, TabelaFuncao : Integer ; Tabela : ShortString);
  procedure MarcarTodos(UsuarioID, TabelaFuncao : Integer ; Tabela : ShortString ; Marcar : Boolean);
  procedure AtualizaFonte(UsuarioID, TabelaFuncao, FonteTamanho : Integer ; Tabela, FonteNome : ShortString);
implementation
uses Base, UFuncoes;

function ConsultaExibir(Grid : TDBGrid ; UsuarioID, TabelaFuncao : Integer ; Tabela : ShortString): Integer;
begin
  BancoDados.CDSUsuarioExibir.Close;
  BancoDados.qryUsuarioExibir.SQL.Text := 'select * from usuario_exibir where usuario_id = ' +
    IntToStr(UsuarioID) + ' and tabela = ' + QuotedStr(Tabela) + ' and tabela_funcao = ' +
    IntToStr(TabelaFuncao);
  BancoDados.CDSUsuarioExibir.Open;

  if (BancoDados.CDSUsuarioExibir.IsEmpty) then
    begin
      try
        BancoDados.Conexao.StartTransaction(BancoDados.Transacao);

        BancoDados.CDSUsuarioExibir.Append;

        BancoDados.CDSUsuarioExibirUSUARIO_ID.Value := UsuarioID;
        BancoDados.CDSUsuarioExibirTABELA.Value := Tabela;
        BancoDados.CDSUsuarioExibirFONTE_NOME.Value := Grid.Font.Name;
        BancoDados.CDSUsuarioExibirFONTE_TAMANHO.Value := Grid.Font.Size;
        BancoDados.CDSUsuarioExibirTABELA_FUNCAO.Value := TabelaFuncao;

        BancoDados.CDSUsuarioExibir.Post;
        BancoDados.CDSUsuarioExibir.ApplyUpdates(0);
        BancoDados.Conexao.Commit(BancoDados.Transacao);

        BancoDados.CDSUsuarioExibir.Close;
        BancoDados.CDSUsuarioExibir.Open;
        Result := BancoDados.CDSUsuarioExibirUSUARIO_EXIBIR_ID.Value;
      except
        BancoDados.CDSUsuarioExibir.Cancel;
        BancoDados.Conexao.Rollback(BancoDados.Transacao);
        Result := 0;
      end;
    end
  else
    Result := BancoDados.CDSUsuarioExibirUSUARIO_EXIBIR_ID.Value;
end;

procedure ConfiguraGrade(Grid : TDBGrid ; UsuarioID, TabelaFuncao : Integer ; Tabela : ShortString);
var
  Id, i : Integer;
begin
  GeraTrace(BancoDados.Tabela,'Consultando Dados da Tabela EXIBIR');
  Id := ConsultaExibir(Grid, UsuarioID, TabelaFuncao, Tabela);
  BancoDados.CDSUsuarioExibirColuna.Close;
  BancoDados.qryUsuarioExibirColuna.SQL.Text := 'select * from usuario_exibir_coluna ' +
    ' where usuario_exibir_id = ' + IntToStr(Id);
  BancoDados.CDSUsuarioExibirColuna.Open;
  GeraTrace(BancoDados.Tabela,'Retornado Dados da Tabela EXIBIR');

  GeraTrace(BancoDados.Tabela,'Carregando Dados da Tabela EXIBIR no Grid');
  if not (BancoDados.CDSUsuarioExibirColuna.IsEmpty) then
    begin
      try
        with BancoDados.CDSUsuarioExibirColuna do
          begin
            DisableControls;
            First;
            while not Eof do
              begin
                Application.ProcessMessages;
                if (RecNo <= Grid.Columns.Count) then
                  begin
                    Grid.Columns[RecNo - 1].FieldName        :=  BancoDados.CDSUsuarioExibirColunaCOLUNA_NOME.Value;
                    Grid.Columns[RecNo - 1].Title.Caption    :=  BancoDados.CDSUsuarioExibirColunaCOLUNA_LABEL.Value;
                    Grid.Columns[RecNo - 1].Visible          :=  (BancoDados.CDSUsuarioExibirColunaVISIVEL.Value = 1);
                    Grid.Columns[RecNo - 1].Width            :=  BancoDados.CDSUsuarioExibirColunaTAMANHO.Value;

                    if (BancoDados.CDSUsuarioExibirColunaALINHAMENTO.Value = 'CENTRO') then
                      Grid.Columns[RecNo - 1].Alignment := taCenter
                    else if (BancoDados.CDSUsuarioExibirColunaALINHAMENTO.Value = 'ESQUERDA') then
                      Grid.Columns[RecNo - 1].Alignment := taLeftJustify
                    else if (BancoDados.CDSUsuarioExibirColunaALINHAMENTO.Value = 'DIREITA') then
                      Grid.Columns[RecNo - 1].Alignment := taRightJustify;
                  end;
                Next;
              end;
          end;
        Grid.Font.Name := BancoDados.CDSUsuarioExibirFONTE_NOME.Value;
        Grid.Font.Size := BancoDados.CDSUsuarioExibirFONTE_TAMANHO.Value;
      finally
        BancoDados.CDSUsuarioExibirColuna.EnableControls;
      end;
    end
  else
    begin
      try
        with BancoDados.CDSUsuarioExibirColuna do
          begin
            BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
            DisableControls;
            First;
            for i := 0 to Grid.Columns.Count - 1 do
              begin
                Application.ProcessMessages;
                Append;
                BancoDados.CDSUsuarioExibirColunaUSUARIO_EXIBIR_ID.Value := Id;
                BancoDados.CDSUsuarioExibirColunaINDICE.Value := Grid.Columns[i].Index;
                BancoDados.CDSUsuarioExibirColunaCOLUNA_NOME.Value := Grid.Columns[i].FieldName;
                BancoDados.CDSUsuarioExibirColunaCOLUNA_LABEL.Value := Grid.Columns[i].Title.Caption;

                if (Grid.Columns[i].Visible) then
                  BancoDados.CDSUsuarioExibirColunaVISIVEL.Value := 1
                else
                  BancoDados.CDSUsuarioExibirColunaVISIVEL.Value := 0;

                BancoDados.CDSUsuarioExibirColunaTAMANHO.Value := Grid.Columns[i].Width;

                case Grid.Columns[i].Alignment of
                  taCenter: BancoDados.CDSUsuarioExibirColunaALINHAMENTO.Value := 'CENTRO';
                  taLeftJustify: BancoDados.CDSUsuarioExibirColunaALINHAMENTO.Value := 'ESQUERDA';
                  taRightJustify: BancoDados.CDSUsuarioExibirColunaALINHAMENTO.Value := 'DIREITA';
                end;

                Post;
              end;
            ApplyUpdates(0);
            BancoDados.Conexao.Commit(BancoDados.Transacao);
          end;
      finally
        BancoDados.CDSUsuarioExibirColuna.EnableControls;
      end;
    end;
  GeraTrace(BancoDados.Tabela,'Dados da Tabela EXIBIR Carregados');
end;

procedure MarcarTodos(UsuarioID, TabelaFuncao : Integer ; Tabela : ShortString ; Marcar : Boolean);
var
  Visivel : Integer;
begin
  GeraTrace(BancoDados.Tabela,'Alterando o Campo VISIVEL');
  if (Marcar) then
    Visivel := 1
  else
    Visivel := 0;
  try
    BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
    BancoDados.qryExecute.SQL.Text := 'update usuario_exibir_coluna set visivel = ' +
      IntToStr(Visivel) + ' where exists(' +
      'select * from usuario_exibir where tabela = ' + QuotedStr(Tabela) +
      ' and tabela_funcao = ' + IntToStr(TabelaFuncao) + ' and usuario_id = ' +
      IntToStr(UsuarioID) + ');';
    BancoDados.qryExecute.ExecSQL(True);
    BancoDados.Conexao.Commit(BancoDados.Transacao);
  except
    Mensagem('Falha ao tentar alterar Visibilidade das Colunas!', mtWarning,[mbOk],mrOK,0);
    BancoDados.Conexao.Rollback(BancoDados.Transacao);
  end;
  GeraTrace(BancoDados.Tabela,'Campo VISIVEL Alterado');
end;

procedure AtualizaFonte(UsuarioID, TabelaFuncao, FonteTamanho : Integer ; Tabela, FonteNome : ShortString);
begin
  try
    GeraTrace(BancoDados.Tabela,'Atualizando os Campos FONTE');
    BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
    BancoDados.qryExecute.SQL.Text := 'update usuario_exibir set fonte_nome = ' +
      QuotedStr(FonteNome) + ', fonte_tamanho = ' + IntToStr(FonteTamanho) +
      ' where tabela = ' + QuotedStr(Tabela) + ' and usuario_id = ' +
      IntToStr(UsuarioID) + ' and tabela_funcao = ' + IntToStr(TabelaFuncao) + ';';
    BancoDados.qryExecute.ExecSQL(True);
    BancoDados.Conexao.Commit(BancoDados.Transacao);
    GeraTrace(BancoDados.Tabela,'Campos FONTE Atualizado');
  except
    Mensagem('Falha ao tentar alterar as configurações de Font do Grid!', mtWarning,[mbOk],mrOK,0);
    BancoDados.Conexao.Rollback(BancoDados.Transacao);
  end;
end;
end.
