unit BaseExibir;

interface

uses
  SysUtils, Classes, WideStrings, DBXFirebird, DB, SqlExpr, FMTBcd, Provider,
  DBClient, DBGrids, Dialogs, Controls, Forms;

type
  TBancoDadosExibir = class(TDataModule)
    DSExibirColunas: TDataSource;
    CDSExibirColunas: TClientDataSet;
    DSPExibirColunas: TDataSetProvider;
    DSExibir: TDataSource;
    CDSExibir: TClientDataSet;
    DSPExibir: TDataSetProvider;
    qryExibir: TSQLQuery;
    qryExibirColunas: TSQLQuery;
    qryExibirUSUARIO_EXIBIR_ID: TLargeintField;
    qryExibirUSUARIO_ID: TIntegerField;
    qryExibirFONTE_NOME: TStringField;
    qryExibirFONTE_TAMANHO: TSmallintField;
    CDSExibirUSUARIO_EXIBIR_ID: TLargeintField;
    CDSExibirUSUARIO_ID: TIntegerField;
    CDSExibirFONTE_NOME: TStringField;
    CDSExibirFONTE_TAMANHO: TSmallintField;
    qryExibirColunasUSUARIO_EXIBIR_COLUNA_ID: TLargeintField;
    qryExibirColunasUSUARIO_EXIBIR_ID: TLargeintField;
    qryExibirColunasINDICE: TSmallintField;
    qryExibirColunasCOLUNA_NOME: TStringField;
    qryExibirColunasCOLUNA_LABEL: TStringField;
    qryExibirColunasVISIVEL: TSmallintField;
    qryExibirColunasTAMANHO: TSmallintField;
    CDSExibirColunasUSUARIO_EXIBIR_COLUNA_ID: TLargeintField;
    CDSExibirColunasUSUARIO_EXIBIR_ID: TLargeintField;
    CDSExibirColunasINDICE: TSmallintField;
    CDSExibirColunasCOLUNA_NOME: TStringField;
    CDSExibirColunasCOLUNA_LABEL: TStringField;
    CDSExibirColunasVISIVEL: TSmallintField;
    CDSExibirColunasTAMANHO: TSmallintField;
    qryExecutar: TSQLQuery;
    qryExibirTABELA: TStringField;
    CDSExibirTABELA: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    Inserindo : Boolean;
  public
    { Public declarations }
    Transacao: TTransactionDesc;
    procedure AtualizaFonte(Grid: TDBGrid; UsuarioID: Integer; Tabela: ShortString);
    procedure Configuracao(UsuarioID, FontTamanho: Integer ; Tabela,FontNome: ShortString);
    procedure SetValoresParaGrade(Grid: TDBGrid; UsuarioID: Integer; Tabela: ShortString);
    procedure SetValoresDaGrade(Grid: TDBGrid; UsuarioID: Integer; Tabela: ShortString);
    procedure MarcaDesmarcaTodos(Marca : Boolean);
  end;

var
  BancoDadosExibir: TBancoDadosExibir;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TBancoDadosExibir.AtualizaFonte(Grid: TDBGrid; UsuarioID: Integer; Tabela: ShortString);
begin
  try
    GeraTrace('USUARIO_EXIBIR','Atualizando Fonte');
    BancoDados.Conexao.StartTransaction(Transacao);
    qryExecutar.SQL.Text := 'update usuario_exibir set FONTE_NOME = ' +
      QuotedStr(Grid.Font.Name) + ', FONTE_TAMANHO = ' + IntToStr(Grid.Font.Size) +
      'where usuario_id = ' + IntToStr(UsuarioID) + ' and tabela = ' + QuotedStr(Tabela) + ';';
    qryExecutar.ExecSQL(True);
    BancoDados.Conexao.Commit(Transacao);
    qryExibir.Refresh;
    CDSExibir.Close;
    CDSExibir.Open;
    GeraTrace('USUARIO_EXIBIR','Fonte Atualizada');
  except
    Mensagem('Falha ao Tentar Excluir as Configurações das Colunas!', mtWarning,[mbOk],mrOK,0);
  end;
end;

procedure TBancoDadosExibir.Configuracao(UsuarioID, FontTamanho: Integer ; Tabela, FontNome: ShortString);
begin
  Inserindo := False;
  GeraTrace('USUARIO_EXIBIR','Buscando Configurações');
  CDSExibir.Close;
  with qryExibir do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from usuario_exibir where usuario_id = ' +
        IntToStr(UsuarioID) + ' and tabela = ' + QuotedStr(Tabela));
      Open;
    end;
  if (qryExibir.IsEmpty) then
    begin
      try
        Inserindo := True;
        BancoDados.Conexao.StartTransaction(Transacao);
        qryExecutar.SQL.Text := 'insert into usuario_exibir(usuario_id,tabela,fonte_nome,fonte_tamanho)values(' +
          IntToStr(UsuarioID) + ', ' +
          QuotedStr(Tabela) + ', ' +
          QuotedStr(FontNome) + ', ' +
          IntToStr(FontTamanho) + ');';
        qryExecutar.ExecSQL(True);
        BancoDados.Conexao.Commit(Transacao);
      Except
        Mensagem('Falha ao Tentar Gravar os Dados!', mtWarning,[mbOk],mrOK,0);
      end;
    end
  else
    qryExibir.Refresh;
  CDSExibir.Open;
  CDSExibirColunas.Close;
  with qryExibirColunas do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from usuario_exibir_coluna where usuario_exibir_id = ' +
        IntToStr(CDSExibirUSUARIO_EXIBIR_ID.Value));
      Open;
    end;
  CDSExibirColunas.Open;
  GeraTrace('USUARIO_EXIBIR','Configurações Carregadas');
end;

procedure TBancoDadosExibir.DataModuleCreate(Sender: TObject);
begin
  Transacao.TransactionID := 1;
  Transacao.IsolationLevel := xilREPEATABLEREAD;
end;

procedure TBancoDadosExibir.SetValoresParaGrade(Grid : TDBGrid; UsuarioID: Integer; Tabela: ShortString);
begin
  Configuracao(UsuarioID, Grid.Font.Size, Tabela, Grid.Font.Name);
  GeraTrace('USUARIO_EXIBIR','Enviando informações para o Grid');
  if not (qryExibirColunas.IsEmpty) then
    begin
      CDSExibirColunas.First;
      while CDSExibirColunas.Eof do
        begin
          if (CDSExibirColunas.RecNo <= Grid.Columns.Count) then
            begin
              Application.ProcessMessages;
              Grid.Columns[CDSExibirColunas.RecNo - 1].FieldName := CDSExibirColunasCOLUNA_NOME.Value;
              Grid.Columns[CDSExibirColunas.RecNo - 1].Title.Caption := CDSExibirColunasCOLUNA_LABEL.Value;
              Grid.Columns[CDSExibirColunas.RecNo - 1].Visible := (CDSExibirColunasVISIVEL.Value = 1);
              Grid.Columns[CDSExibirColunas.RecNo - 1].Width := CDSExibirColunasTAMANHO.Value;
            end;
           CDSExibirColunas.Next;
        end;
      Grid.Font.Name := qryExibirFONTE_NOME.Value;
      Grid.Font.Size := qryExibirFONTE_TAMANHO.Value;
    end;
  GeraTrace('USUARIO_EXIBIR','Grid preenchido');
end;
procedure TBancoDadosExibir.SetValoresDaGrade(Grid: TDBGrid; UsuarioID: Integer; Tabela: ShortString);
var
  i : Integer;
begin
  GeraTrace('USUARIO_EXIBIR','Salvando valores do Grid');
  with qryExibir do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from usuario_exibir where usuario_id = ' +
        IntToStr(UsuarioID) + ' and tabela = ' + QuotedStr(Tabela));
      Open;
    end;

  try
    BancoDados.Conexao.StartTransaction(Transacao);
    qryExecutar.SQL.Text := 'delete from usuario_exibir_coluna where usuario_exibir_id = ' +
      IntToStr(qryExibirUSUARIO_EXIBIR_ID.Value) + ';';
    qryExecutar.ExecSQL(True);
    BancoDados.Conexao.Commit(Transacao);
  except
    Mensagem('Falha ao Tentar Excluir as Configurações das Colunas!', mtWarning,[mbOk],mrOK,0);
  end;

  Configuracao(UsuarioID, Grid.Font.Size, Tabela, Grid.Font.Name);
  AtualizaFonte(Grid, UsuarioID, Tabela);

  try
    BancoDados.Conexao.StartTransaction(Transacao);

    for i := 0 to Grid.Columns.Count - 1 do
      begin
        Application.ProcessMessages;

        CDSExibirColunas.Last;
        CDSExibirColunas.Append;
        CDSExibirColunasUSUARIO_EXIBIR_ID.Value := qryExibirUSUARIO_EXIBIR_ID.Value;
        CDSExibirColunasINDICE.Value := Grid.Columns[i].Index;
        CDSExibirColunasCOLUNA_NOME.Value := Grid.Columns[i].FieldName;
        CDSExibirColunasCOLUNA_LABEL.Value := Grid.Columns[i].Title.Caption;
        CDSExibirColunasTAMANHO.Value := Grid.Columns[i].Width;
        if (Inserindo) then
          CDSExibirColunasVISIVEL.Value := 1
        else
          CDSExibirColunasVISIVEL.Value := 0;

        CDSExibirColunas.Post;
      end;
    CDSExibirColunas.ApplyUpdates(0);
    BancoDados.Conexao.Commit(Transacao);
  finally
    CDSExibirColunas.Refresh;
    CDSExibirColunas.First;
  end;
  GeraTrace('USUARIO_EXIBIR','Valores do Grid salvos');
end;

procedure TBancoDadosExibir.MarcaDesmarcaTodos(Marca : Boolean);
var
  Posicao, Operacao: Integer;
begin
  try
    GeraTrace('USUARIO_EXIBIR','Alterando marcações');
    if (Marca) then
      Operacao := 1
    else
      Operacao := 0;

    BancoDados.Conexao.StartTransaction(Transacao);
    qryExecutar.SQL.Text := 'update usuario_exibir_coluna set visivel = ' +
      IntToStr(Operacao) + 'where usuario_exibir_id = ' +
      IntToStr(qryExibirUSUARIO_EXIBIR_ID.Value) + ';';
    qryExecutar.ExecSQL(True);
    BancoDados.Conexao.Commit(Transacao);

    Posicao := CDSExibirColunas.RecNo;
    CDSExibirColunas.DisableControls;

    CDSExibirColunas.Close;
    with qryExibirColunas do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from usuario_exibir_coluna where usuario_exibir_coluna_id = ' +
          IntToStr(qryExibirUSUARIO_EXIBIR_ID.Value));
        Open;
      end;
    CDSExibirColunas.Open;

    if ((Posicao > 0) and (not (Posicao > CDSExibirColunas.RecordCount)))  then
      CDSExibirColunas.RecNo := Posicao;

    GeraTrace('USUARIO_EXIBIR','Marcações Alteradas');
  finally
    CDSExibirColunas.EnableConstraints;
  end;
end;
end.
