unit UPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Buttons, FMTBcd, Provider, DBClient, DB, SqlExpr,
  ComObj, StdCtrls, DBCtrls, AppEvnts, ActnList;

type
  TPadraoForm = class(TForm)
    PGPrincipal: TPageControl;
    SBPrincipal: TStatusBar;
    SQLQuery: TSQLQuery;
    DataSource: TDataSource;
    ClientDataSet: TClientDataSet;
    DataSetProvider: TDataSetProvider;
    Timer: TTimer;
    ApplicationEvents: TApplicationEvents;
    ActionList: TActionList;
    ANovo: TAction;
    AAlterar: TAction;
    AExcluir: TAction;
    AReverter: TAction;
    ASalvar: TAction;
    AExportar: TAction;
    ASair: TAction;
    AAjudaAtalhos: TAction;
    qryControleAcesso: TSQLQuery;
    qryControleAcessoVALOR: TSmallintField;
    qryControleAcessoTIPO: TStringField;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    LBUltimaAlteração: TLabel;
    CBAtivo: TCheckBox;
    DTCadastro: TDateTimePicker;
    Panel1: TPanel;
    BTNovo: TSpeedButton;
    BTAlterar: TSpeedButton;
    BTExcluir: TSpeedButton;
    BTReverter: TSpeedButton;
    BTSalvar: TSpeedButton;
    BTExportar: TSpeedButton;
    BTSair: TSpeedButton;
    PCadastro: TPanel;
    Atalhos: TMemo;
    procedure FormShow(Sender: TObject);
    procedure BTNovoClick(Sender: TObject);
    procedure BTAlterarClick(Sender: TObject);
    procedure BTExcluirClick(Sender: TObject);
    procedure ClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure ClientDataSetAfterDelete(DataSet: TDataSet);
    procedure ClientDataSetBeforePost(DataSet: TDataSet);
    procedure ClientDataSetAfterPost(DataSet: TDataSet);
    procedure ClientDataSetBeforeCancel(DataSet: TDataSet);
    procedure ClientDataSetAfterCancel(DataSet: TDataSet);
    procedure BTSalvarClick(Sender: TObject);
    procedure BTExportarClick(Sender: TObject);
    procedure BTSairClick(Sender: TObject);
    procedure ClientDataSetAfterInsert(DataSet: TDataSet);
    procedure BTReverterClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure ApplicationEventsHint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ANovoExecute(Sender: TObject);
    procedure AAlterarExecute(Sender: TObject);
    procedure AExcluirExecute(Sender: TObject);
    procedure ASalvarExecute(Sender: TObject);
    procedure AReverterExecute(Sender: TObject);
    procedure AExportarExecute(Sender: TObject);
    procedure ASairExecute(Sender: TObject);
    procedure AAjudaAtalhosExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SQLQueryAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    LiberaFormulario, LiberaNovo, LiberaEditar,
    LiberaExcluir, LiberaExportar : Boolean;
    procedure ExibirBotoes(Novo, Alterar, Excluir, Reverter, Salvar, Exportar, Sair : Boolean);
    procedure CarregaImagens;
  public
    { Public declarations }
  end;

var
  PadraoForm: TPadraoForm;
  Tabela, Descricao : ShortString;
  Id : Integer;

implementation
uses Base, UFuncoes, UAjudaAtalhos;

{$R *.dfm}

procedure TPadraoForm.ExibirBotoes(Novo, Alterar, Excluir, Reverter, Salvar, Exportar, Sair : Boolean);
begin
  Atalhos.Lines.Clear;


  if (LiberaNovo) then
    BTNovo.Enabled := Novo
  else
    BTNovo.Enabled := False;

  if (LiberaEditar) then
    BTAlterar.Enabled := Alterar
  else
    BTAlterar.Enabled := False;

  if (LiberaExcluir) then
    BTExcluir.Enabled := Excluir
  else
    BTExcluir.Enabled := False;

  if (LiberaExportar) then
    BTExportar.Enabled := Exportar
  else
    BTExportar.Enabled := False;

  BTReverter.Enabled := Reverter;
  BTSalvar.Enabled := Salvar;
  BTSair.Enabled := Sair;

  if (BTNovo.Enabled) then
    Atalhos.Lines.Add('Novo - Ctrl + N');
  if (BTAlterar.Enabled) then
    Atalhos.Lines.Add('Alterar - Ctrl + A');
  if (BTExcluir.Enabled) then
    Atalhos.Lines.Add('Excluir - Ctrl + E');
  if (BTReverter.Enabled) then
    Atalhos.Lines.Add('Reverter - Ctrl + R');
  if (BTSalvar.Enabled) then
    Atalhos.Lines.Add('Salvar - Ctrl + S');
  if (BTExportar.Enabled) then
    Atalhos.Lines.Add('Exportar - Ctrl + R');
  if (BTSair.Enabled) then
    Atalhos.Lines.Add('Sair - Ctrl + I');
end;

procedure TPadraoForm.CarregaImagens;
begin
  try
    BTNovo.Glyph.LoadFromFile(BancoDados.imgNovo);
    BTAlterar.Glyph.LoadFromFile(BancoDados.imgAlterar);
    BTExcluir.Glyph.LoadFromFile(BancoDados.imgReverter);
    BTReverter.Glyph.LoadFromFile(BancoDados.imgExcluir);
    BTSalvar.Glyph.LoadFromFile(BancoDados.imgSalvar);
    BTExportar.Glyph.LoadFromFile(BancoDados.imgExcel);
    BTSair.Glyph.LoadFromFile(BancoDados.imgSair);
  except end;
end;

procedure TPadraoForm.AAjudaAtalhosExecute(Sender: TObject);
begin
  try
    if not Assigned(AjudaAtalhosForm) then
      AjudaAtalhosForm := TAjudaAtalhosForm.Create(Application);
    AjudaAtalhosForm.Memo.Text := Atalhos.Text;
    AjudaAtalhosForm.ShowModal;
  finally
    AjudaAtalhosForm.Free;
    AjudaAtalhosForm := nil;
  end;
end;

procedure TPadraoForm.AAlterarExecute(Sender: TObject);
begin
  BTAlterarClick(Sender);
end;

procedure TPadraoForm.AExportarExecute(Sender: TObject);
begin
  BTExportarClick(Sender);
end;

procedure TPadraoForm.AExcluirExecute(Sender: TObject);
begin
  BTExcluirClick(Sender);
end;

procedure TPadraoForm.ANovoExecute(Sender: TObject);
begin
  BTNovoClick(Sender);
end;

procedure TPadraoForm.ApplicationEventsHint(Sender: TObject);
begin
  SBPrincipal.Panels[2].Text := Application.Hint;
end;

procedure TPadraoForm.AReverterExecute(Sender: TObject);
begin
  BTReverterClick(Sender);
end;

procedure TPadraoForm.ASairExecute(Sender: TObject);
begin
  BTSairClick(Sender);
end;

procedure TPadraoForm.ASalvarExecute(Sender: TObject);
begin
  BTSalvarClick(Sender);
end;

procedure TPadraoForm.BTAlterarClick(Sender: TObject);
begin
  ClientDataSet.Edit;
  CBAtivo.Checked := (ClientDataSet.FieldByName('ATIVO').Value = 1);
  DTCadastro.Date := ClientDataSet.FieldByName('DATA_CADASTRO').Value;
  LBUltimaAlteração.Caption := FormatDateTime('dd/mm/yyyy hh:mm:ss', ClientDataSet.FieldByName('DATA_ULTIMA_ALTERACAO').Value);
  ExibirBotoes(False, False, False, True, True, False, False);
  SBPrincipal.Panels[2].Text := 'Alterando o Registro: ' + IntToStr(Id) + '/' + Descricao + '.';
  PCadastro.Enabled := True;
end;

procedure TPadraoForm.BTExcluirClick(Sender: TObject);
begin
  try
    try
      if (Mensagem('Deseja Excluir este Registro?', mtConfirmation,[mbYES,mbNO],mrNO,0) = mrYes) then
        ClientDataSet.Delete;
    except
      BancoDados.Conexao.Rollback(BancoDados.Transacao);
      Mensagem('A Exclusão do Registro foi Abortada.', mtInformation,[mbOk],mrOK,0);
    end;
  finally
    ExibirBotoes(True, True, True, False, False, True, True);
    PCadastro.Enabled := False;
  end;
end;

procedure TPadraoForm.BTExportarClick(Sender: TObject);
var
  linha, coluna: integer;
  planilha: Variant;
  ValorCampoEx: ShortString;
begin
  if not (ClientDataSet.IsEmpty) then
    begin
      planilha := CreateOleObject('Excel.Application');
      planilha.workBooks.add(1);
      planilha.caption := 'Exportação de dados para excel' ;
      planilha.visible := True;
      ClientDataSet.First;

      for linha := 0 to ClientDataSet.RecordCount - 1 do
        begin
          for coluna := 1 to ClientDataSet.FieldCount do
            begin
              ValorCampoEx := ClientDataSet.Fields[coluna-1].AsString;
              planilha.cells[linha+2, coluna] := ValorCampoEx;
            end;
         ClientDataSet.Next;
        end;

      for coluna := 1 to ClientDataSet.FieldCount do
        begin
          ValorCampoEx := ClientDataSet.Fields[coluna-1].DisplayLabel;
          planilha.cells[1,coluna]:= ValorCampoEx;
        end;
      planilha.columns.Autofit;
    end
  else
    Mensagem('Não há itens para exportar !', mtWarning,[mbOk],mrOK,0);

  ExibirBotoes(True, True, True, False, False, True, True);
  Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, Tabela,
    'Registro Exportado: ' + IntToStr(Id) + '/' + Descricao + '.');
end;

procedure TPadraoForm.BTNovoClick(Sender: TObject);
begin
  ClientDataSet.Append;
  LBUltimaAlteração.Caption := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
  DTCadastro.DateTime := Now;
  SBPrincipal.Panels[2].Text := 'Inserindo novo Registro!';
  ExibirBotoes(False, False, False, True, True, False, False);
  PCadastro.Enabled := True;
end;

procedure TPadraoForm.BTReverterClick(Sender: TObject);
begin
  try
    ClientDataSet.Cancel;
    Mensagem('Operação Cancelada pelo Usuário.', mtInformation,[mbOk],mrOK,0);
  finally
    ExibirBotoes(True, True, True, False, False, True, True);
    PCadastro.Enabled := False;
  end;
end;

procedure TPadraoForm.BTSairClick(Sender: TObject);
begin
  ClientDataSet.Close;
  SQLQuery.Close;
  Close;
end;

procedure TPadraoForm.BTSalvarClick(Sender: TObject);
begin
  try
    try
      ClientDataSet.FieldByName('DATA_ULTIMA_ALTERACAO').Value := Now;
      if (ClientDataSet.State in [dsEdit, dsInsert]) then
        ClientDataSet.Post;
      ClientDataSet.ApplyUpdates(0);
      BancoDados.Conexao.Rollback(BancoDados.Transacao);
    except
      ClientDataSet.Cancel;
      ClientDataSet.ApplyUpdates(0);
      BancoDados.Conexao.Rollback(BancoDados.Transacao);
      Mensagem('Falha ao Tentar Gravar o Registro.', mtInformation,[mbOk],mrOK,0);
    end;
  finally
    ExibirBotoes(True, True, True, False, False, True, True);
    PCadastro.Enabled := False;
  end;
end;

procedure TPadraoForm.ClientDataSetAfterCancel(DataSet: TDataSet);
begin
  ClientDataSet.ApplyUpdates(0);
  BancoDados.Conexao.Rollback(BancoDados.Transacao);
end;

procedure TPadraoForm.ClientDataSetAfterDelete(DataSet: TDataSet);
begin
  ClientDataSet.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
  Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, Tabela,
    'Registro Excluído: ' + IntToStr(Id) + '/' + Descricao + '.');
end;

procedure TPadraoForm.ClientDataSetAfterInsert(DataSet: TDataSet);
begin
  ClientDataSet.FieldByName('ATIVO').Value := 1;
  ClientDataSet.FieldByName('DATA_CADASTRO').Value := Now;
  DTCadastro.Date := Date;
  CBAtivo.Checked := True;
end;

procedure TPadraoForm.ClientDataSetAfterPost(DataSet: TDataSet);
begin
  ClientDataSet.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TPadraoForm.ClientDataSetBeforeCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TPadraoForm.ClientDataSetBeforeDelete(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TPadraoForm.ClientDataSetBeforePost(DataSet: TDataSet);
var
  Dados : TMemo;
  Coluna : Integer;
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
  if (ClientDataSet.State in [dsInsert]) then
    Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, Tabela,
      'Registro Inserido: ' + Descricao + '.')
  else
    if (ClientDataSet.State in [dsEdit]) then
      begin
        Dados.Lines.Clear;
        Dados.Lines.Add('#' + Tabela);

        for Coluna := 1 to ClientDataSet.FieldCount do
          Dados.Lines.Add('*' + ClientDataSet.Fields[Coluna - 1].FieldName + '|' +
            ClientDataSet.Fields[Coluna - 1].AsString);

        Alteracao(BancoDados.qryExecute, BancoDados.qryUsuarioUSUARIO_ID.Value,
          Tabela, Dados);

        Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, Tabela,
          'Registro Alterado: ' + IntToStr(Id) + '/' + Descricao + '.');
      end;
end;

procedure TPadraoForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer.Enabled := False;
  ClientDataSet.Close;
  SQLQuery.Close;
end;

procedure TPadraoForm.FormCreate(Sender: TObject);
begin
  with qryControleAcesso do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from usuario_acesso where tabela = ' +
        QuotedStr(Tabela) + ' and usuario_id = ' +
        IntToStr(BancoDados.qryLoginUSUARIO_ID.Value));
      Open;
      First;
    end;
  while not qryControleAcesso.Eof do
    begin
      if (qryControleAcessoTIPO.Value = 'Formulario') then
        LiberaFormulario := (qryControleAcessoVALOR.Value = 1)
      else if (qryControleAcessoTIPO.Value = 'Novo') then
        LiberaNovo := (qryControleAcessoVALOR.Value = 1)
      else if (qryControleAcessoTIPO.Value = 'Excluir') then
        LiberaExcluir := (qryControleAcessoVALOR.Value = 1)
      else if (qryControleAcessoTIPO.Value = 'Editar') then
        LiberaEditar := (qryControleAcessoVALOR.Value = 1)
      else if (qryControleAcessoTIPO.Value = 'Exportar') then
        LiberaExportar := (qryControleAcessoVALOR.Value = 1);

      qryControleAcesso.Next;
    end;
  if not (LiberaFormulario) then
    begin
      Mensagem('O Usuário não possui Acesso a este Formulário.', mtInformation,[mbOk],mrOK,0);
      Close;
    end;
end;

procedure TPadraoForm.FormShow(Sender: TObject);
begin
  BancoDados.Transacao.TransactionID := 1;
  BancoDados.Transacao.IsolationLevel := xilREPEATABLEREAD;
  PGPrincipal.TabIndex := 0;
  SBPrincipal.Panels[0].Text := 'Usuario Logado: ' + BancoDados.qryLoginLOGIN.Value;
  Timer.Enabled := True;
  LBUltimaAlteração.Caption := '';
  PCadastro.Enabled := False;
  ExibirBotoes(True, False, False, False, False, False, True);
  CarregaImagens;
end;

procedure TPadraoForm.SQLQueryAfterOpen(DataSet: TDataSet);
begin
  ClientDataSet.Close;
  ClientDataSet.Open;
end;

procedure TPadraoForm.TimerTimer(Sender: TObject);
begin
  SBPrincipal.Panels[1].Text := 'Data/Hora: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
end;

end.
