unit UCadastroPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, FMTBcd, DB, SqlExpr, Provider,
  DBClient, DBCtrls, ComObj, AppEvnts, ActnList, JvExControls,
  JvGradientHeaderPanel;

type
  {TParametroForm = record
    UtilizaMaiuscula: Boolean;
  end;}
  TCadastroPadraoForm = class(TForm)
    SBPrincipal: TStatusBar;
    Panel1: TPanel;
    PPrincipal: TPanel;
    Panel3: TPanel;
    CDSCadastro: TClientDataSet;
    DSCadastro: TDataSource;
    DSPCadastro: TDataSetProvider;
    qryCadastro: TSQLQuery;
    DBCAtivo: TDBCheckBox;
    Label1: TLabel;
    DBText1: TDBText;
    qryExportar: TSQLQuery;
    DSPExportar: TDataSetProvider;
    CDSExportar: TClientDataSet;
    ApplicationEvents: TApplicationEvents;
    ActionList: TActionList;
    ANovo: TAction;
    AAlterar: TAction;
    AExcluir: TAction;
    AExportar: TAction;
    ASair: TAction;
    Label2: TLabel;
    DBText2: TDBText;
    JvGradientHeaderPanel1: TJvGradientHeaderPanel;
    BTSalvar: TSpeedButton;
    BTCancelar: TSpeedButton;
    BTExcluir: TSpeedButton;
    BTExportar: TSpeedButton;
    BTSair: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure BTSalvarClick(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure BTExportarClick(Sender: TObject);
    procedure CDSCadastroBeforePost(DataSet: TDataSet);
    procedure CDSCadastroAfterPost(DataSet: TDataSet);
    procedure CDSCadastroBeforeDelete(DataSet: TDataSet);
    procedure CDSCadastroAfterDelete(DataSet: TDataSet);
    procedure CDSCadastroAfterCancel(DataSet: TDataSet);
    procedure CDSCadastroAfterInsert(DataSet: TDataSet);
    procedure BTExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTSairClick(Sender: TObject);
    procedure CDSCadastroBeforeCancel(DataSet: TDataSet);
    procedure ApplicationEventsHint(Sender: TObject);
    procedure CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    LiberaSalvar, LiberaExportar, FUtilizaMaiuscula : Boolean;
    Id : Integer;
    Descricao : ShortString;
    //FUtilizaMaiuscula: TParametroForm;
    procedure CarregaBotoes(Salvar, Cancelar, Excluir, Exportar, Sair : Boolean);
  public
    { Public declarations }
  published
    { Published declarations }
    property UtilizaMaiuscula: Boolean read FUtilizaMaiuscula write FUtilizaMaiuscula;
  end;

var
  CadastroPadraoForm: TCadastroPadraoForm;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TCadastroPadraoForm.CarregaBotoes(Salvar, Cancelar, Excluir, Exportar, Sair : Boolean);
begin
  BTSalvar.Enabled := Salvar;
  BTCancelar.Enabled := Cancelar;
  BTExcluir.Enabled := Excluir;
  BTExportar.Enabled := Exportar;
  BTSair.Enabled := Sair;
end;

procedure TCadastroPadraoForm.ApplicationEventsHint(Sender: TObject);
begin
  SBPrincipal.Panels[0].Text := Application.Hint;
end;

procedure TCadastroPadraoForm.BTCancelarClick(Sender: TObject);
begin
  GeraTrace(BancoDados.Tabela,'Cancelando Alterações');
  CDSCadastro.Cancel;
  ModalResult := mrCancel;
  GeraTrace(BancoDados.Tabela,'Alterações Canceladas');

  Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, BancoDados.Tabela,
    'Ação Cancelada pelo Operador: ' + IntToStr(Id) + '/' + Descricao + '.');
end;

procedure TCadastroPadraoForm.BTExcluirClick(Sender: TObject);
begin
  try
    GeraTrace(BancoDados.Tabela,'Excluindo Registros');
    BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
    if (Mensagem('Deseja realmente Excluir este Registro?',mtConfirmation,[mbYES,mbNO],mrNO,0) = idYES) then
      begin
        CDSCadastro.Delete;
        CDSCadastro.ApplyUpdates(0);
        BancoDados.Conexao.Commit(BancoDados.Transacao);
        ModalResult := mrOk;
      end
    else
      Abort;

    GeraTrace(BancoDados.Tabela,'Exclusão Concluida');
  except
    CDSCadastro.Cancel;
    ModalResult := mrCancel;
    BancoDados.Conexao.Rollback(BancoDados.Transacao);
  end;
end;

procedure TCadastroPadraoForm.BTExportarClick(Sender: TObject);
var
  linha, coluna: integer;
  planilha: Variant;
  ValorCampoEx: ShortString;
begin
  if not (CDSExportar.IsEmpty) then
    begin
      GeraTrace(BancoDados.Tabela,'Exportando Dados para o Excel');
      planilha := CreateOleObject('Excel.Application');
      planilha.workBooks.add(1);
      planilha.caption := 'Exportação de dados para excel' ;
      planilha.visible := True;
      CDSExportar.First;

      for linha := 0 to CDSExportar.RecordCount - 1 do
        begin
          for coluna := 1 to CDSExportar.FieldCount do
            begin
              ValorCampoEx := CDSExportar.Fields[coluna - 1].AsString;
              planilha.cells[linha + 2, coluna] := ValorCampoEx;
            end;
         CDSExportar.Next;
        end;

      for coluna := 1 to CDSExportar.FieldCount do
        begin
          ValorCampoEx := CDSExportar.Fields[coluna - 1].DisplayLabel;
          planilha.cells[1, coluna] := ValorCampoEx;
        end;
      planilha.columns.Autofit;
      GeraTrace(BancoDados.Tabela,'Dados Exportados com Sucesso');
    end
  else
    Mensagem('Não há itens para exportar !', mtWarning,[mbOk],mrOK,0);

  Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, BancoDados.Tabela,
    'Registro Exportado: ' + IntToStr(Id) + '/' + Descricao + '.');
end;

procedure TCadastroPadraoForm.BTSairClick(Sender: TObject);
begin
  Close;
end;

procedure TCadastroPadraoForm.BTSalvarClick(Sender: TObject);
begin
  try
    GeraTrace(BancoDados.Tabela,'Gravando Alterações');
    CDSCadastro.Post;

    ModalResult := mrOk;
    GeraTrace(BancoDados.Tabela,'Alterações Gravadas');
  except
    CDSCadastro.Cancel;
    BancoDados.Conexao.Rollback(BancoDados.Transacao);
    Mensagem('Falha ao Tentar Gravar os Dados!', mtInformation,[mbOk],mrOK,0);
    ModalResult := mrCancel;
  end;
end;

procedure TCadastroPadraoForm.CDSCadastroAfterCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.Rollback(BancoDados.Transacao);
end;

procedure TCadastroPadraoForm.CDSCadastroAfterDelete(DataSet: TDataSet);
begin
  CDSCadastro.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TCadastroPadraoForm.CDSCadastroAfterInsert(DataSet: TDataSet);
begin
  try
    with BancoDados.qryGeraID do
      begin
        GeraTrace(BancoDados.Tabela,'Inicia Geração de ID');
        Close;
        SQL.Clear;
        SQL.Add('select gen_id( GEN_' + BancoDados.Tabela + '_ID, 1 ) from RDB$DATABASE');
        Open;
        CDSCadastro.FieldByName(BancoDados.Tabela + '_ID').Value :=
          BancoDados.qryGeraID.Fields[0].Value;
        GeraTrace(BancoDados.Tabela,'ID Gerado');
      end;
    CDSCadastro.FieldByName('ATIVO').Value := 1;
    CDSCadastro.FieldByName('DATA_CADASTRO').Value := Now;
    CDSCadastro.FieldByName('DATA_ULTIMA_ALTERACAO').Value := Now;

  except
    Mensagem('Falha ao Tentar Gerar o I.D!', mtInformation,[mbOk],mrOK,0);
  end;
end;

procedure TCadastroPadraoForm.CDSCadastroAfterPost(DataSet: TDataSet);
begin
  CDSCadastro.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TCadastroPadraoForm.CDSCadastroBeforeCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TCadastroPadraoForm.CDSCadastroBeforeDelete(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TCadastroPadraoForm.CDSCadastroBeforePost(DataSet: TDataSet);
begin
  CDSCadastro.FieldByName('DATA_ULTIMA_ALTERACAO').Value := Now;
  if (CDSCadastro.State in [dsEdit]) then
      Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, BancoDados.Tabela,
        'Registro Alterado: ' + IntToStr(Id) + '/' + Descricao + '.')
    else
      if (CDSCadastro.State in [dsInsert]) then
        Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, BancoDados.Tabela,
          'Registro Inserido: ' + IntToStr(Id) + '/' + Descricao + '.');

  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TCadastroPadraoForm.CDSCadastroReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  if (Pos('FOREIGN KEY', E.Message) > 0) then
    begin
      Mensagem('Não foi possível excluir este Registro: ' + #13 +
        'Existem lançamentos feitos apartir do mesmo!', mtWarning,[mbOk],mrOK,0);
    end;

  DataSet.Cancel;
  CDSCadastro.Close;
  CDSCadastro.Open;
end;

procedure TCadastroPadraoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  BancoDados.Id := 0;
  BancoDados.ExibeStatus := True;

  if (CDSCadastro.State in [dsInsert, dsEdit]) then
    BTCancelarClick(Sender);
  CDSCadastro.Close;
end;

procedure TCadastroPadraoForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #27) then
    begin
      key := #0;
      Close;
    end;
end;

procedure TCadastroPadraoForm.FormShow(Sender: TObject);
var
  Exportar : Boolean;
begin
  GeraTrace(BancoDados.Tabela,CriaLinha(110));
  GeraTrace(BancoDados.Tabela,'Iniciando Cadastro');

  SBPrincipal.Panels[0].Text := 'Usuario Logado: ' + BancoDados.qryLoginLOGIN.Value;
  BTSalvar.Enabled := LiberaSalvar;
  BTExportar.Enabled := LiberaExportar;
  CadastroPadraoForm.Caption := 'MasterERP - Ferramenta de Cadastro do Módulo ' +
    BancoDados.Tabela + '.';

  BancoDados.ExibeStatus := False;
  Exportar := ((BancoDados.LiberaExportar) and (not (CDSCadastro.State in [dsInsert])));

  if (BancoDados.Operacao = 'Inserir') then
    begin
      CDSCadastro.Open;
      CarregaBotoes(True, True, False, False, True);
      CDSCadastro.Append;
    end
  else
    if (BancoDados.Operacao = 'Alterar') then
      begin
        CDSCadastro.Close;
        qryCadastro.SQL.Text := 'select * from ' + BancoDados.Tabela + ' where ' +
          BancoDados.Tabela + '_ID = ' + IntToStr(BancoDados.Id);
        CDSCadastro.Open;
        DSCadastro.Edit;
        CarregaBotoes((BancoDados.LiberaAlterar), (BancoDados.LiberaAlterar), (BancoDados.LiberaAlterar), Exportar, True);
      end;
  FUtilizaMaiuscula := (Parametro(BancoDados.qryAuxiliar, 1, 'NAO') = 'SIM');

  BancoDados.CDSTabela.Close;
  BancoDados.qryTabela.SQL.Text := 'select * from tabela where tabela = ' +
    QuotedStr(BancoDados.Tabela);
  BancoDados.CDSTabela.Open;

  Caption := BancoDados.CDSTabelaDESCRICAO.Value;

  Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, BancoDados.Tabela,
    'Acessando o Registro: ' + IntToStr(Id) + '/' + Descricao + '.');

  GeraTrace(BancoDados.Tabela,'Formulário de Cadastro');
end;

end.
