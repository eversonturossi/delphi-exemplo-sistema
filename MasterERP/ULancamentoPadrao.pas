unit ULancamentoPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, JvExControls, JvGradientHeaderPanel, ExtCtrls, ComCtrls,
  FMTBcd, AppEvnts, ActnList, DB, DBClient, Provider, SqlExpr, ComObj;

type
  TLancamentoPadraoForm = class(TForm)
    Panel1: TPanel;
    GHPPrincipal: TJvGradientHeaderPanel;
    BTSalvar: TSpeedButton;
    BTCancelar: TSpeedButton;
    BTExcluir: TSpeedButton;
    BTSair: TSpeedButton;
    SBPrincipal: TStatusBar;
    PPrincipal: TPanel;
    qryCadastro: TSQLQuery;
    DSPCadastro: TDataSetProvider;
    CDSCadastro: TClientDataSet;
    DSCadastro: TDataSource;
    ActionList: TActionList;
    ANovo: TAction;
    AAlterar: TAction;
    AExcluir: TAction;
    AExportar: TAction;
    ASair: TAction;
    ApplicationEvents: TApplicationEvents;
    qryExportar: TSQLQuery;
    DSPExportar: TDataSetProvider;
    CDSExportar: TClientDataSet;
    procedure ApplicationEventsHint(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure BTExcluirClick(Sender: TObject);
    procedure BTSairClick(Sender: TObject);
    procedure BTSalvarClick(Sender: TObject);
    procedure CDSCadastroAfterCancel(DataSet: TDataSet);
    procedure CDSCadastroAfterDelete(DataSet: TDataSet);
    procedure CDSCadastroAfterInsert(DataSet: TDataSet);
    procedure CDSCadastroAfterPost(DataSet: TDataSet);
    procedure CDSCadastroBeforeCancel(DataSet: TDataSet);
    procedure CDSCadastroBeforeDelete(DataSet: TDataSet);
    procedure CDSCadastroBeforePost(DataSet: TDataSet);
    procedure CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Id : Integer;
    Descricao : ShortString;
    LiberaSalvar, FUtilizaMaiuscula : Boolean;
    procedure CarregaBotoes(Salvar, Cancelar, Excluir, Sair : Boolean);
  public
    { Public declarations }
  end;

var
  LancamentoPadraoForm: TLancamentoPadraoForm;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TLancamentoPadraoForm.ApplicationEventsHint(Sender: TObject);
begin
  SBPrincipal.Panels[0].Text := Application.Hint;
end;

procedure TLancamentoPadraoForm.BTCancelarClick(Sender: TObject);
begin
  GeraTrace(BancoDados.Tabela,'Cancelando Alterações');
  CDSCadastro.Cancel;
  ModalResult := mrCancel;
  GeraTrace(BancoDados.Tabela,'Alterações Canceladas');

  Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, BancoDados.Tabela,
    'Ação Cancelada pelo Operador: ' + IntToStr(Id) + '/' + Descricao + '.');
end;

procedure TLancamentoPadraoForm.BTExcluirClick(Sender: TObject);
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

procedure TLancamentoPadraoForm.BTSairClick(Sender: TObject);
begin
  Close;
end;

procedure TLancamentoPadraoForm.BTSalvarClick(Sender: TObject);
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

procedure TLancamentoPadraoForm.CarregaBotoes(Salvar, Cancelar, Excluir, Sair : Boolean);
begin
  BTSalvar.Enabled := Salvar;
  BTCancelar.Enabled := Cancelar;
  BTExcluir.Enabled := Excluir;
  BTSair.Enabled := Sair;
end;
procedure TLancamentoPadraoForm.CDSCadastroAfterCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.Rollback(BancoDados.Transacao);
end;

procedure TLancamentoPadraoForm.CDSCadastroAfterDelete(DataSet: TDataSet);
begin
  CDSCadastro.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TLancamentoPadraoForm.CDSCadastroAfterInsert(DataSet: TDataSet);
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
    CDSCadastro.FieldByName('DATA_CADASTRO').Value := Now;
    CDSCadastro.FieldByName('DATA_ULTIMA_ALTERACAO').Value := Now;
  except
    Mensagem('Falha ao Tentar Gerar o I.D!', mtInformation,[mbOk],mrOK,0);
  end;
end;

procedure TLancamentoPadraoForm.CDSCadastroAfterPost(DataSet: TDataSet);
begin
  CDSCadastro.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TLancamentoPadraoForm.CDSCadastroBeforeCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TLancamentoPadraoForm.CDSCadastroBeforeDelete(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TLancamentoPadraoForm.CDSCadastroBeforePost(DataSet: TDataSet);
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

procedure TLancamentoPadraoForm.CDSCadastroReconcileError(
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

procedure TLancamentoPadraoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  BancoDados.Id := 0;
  BancoDados.ExibeStatus := True;

  if (CDSCadastro.State in [dsInsert, dsEdit]) then
    BTCancelarClick(Sender);
  CDSCadastro.Close;
end;

procedure TLancamentoPadraoForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    begin
      key := #0;
      Perform(WM_NextDlgCtl,0,0)
    end;
  if (key = #27) then
    begin
      key := #0;
      Close;
    end;
end;

procedure TLancamentoPadraoForm.FormShow(Sender: TObject);
var
  Exportar : Boolean;
begin
  GeraTrace(BancoDados.Tabela,CriaLinha(110));
  GeraTrace(BancoDados.Tabela,'Iniciando Cadastro');

  SBPrincipal.Panels[0].Text := 'Usuario Logado: ' + BancoDados.qryLoginLOGIN.Value;
  BTSalvar.Enabled := LiberaSalvar;
  Caption := 'MasterERP - Ferramenta de Cadastro do Módulo ' + BancoDados.Tabela + '.';

  BancoDados.ExibeStatus := False;
  Exportar := ((BancoDados.LiberaExportar) and (not (CDSCadastro.State in [dsInsert])));

  if (BancoDados.Operacao = 'Inserir') then
    begin
      CDSCadastro.Open;
      CarregaBotoes(True, True, False, True);
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
        CarregaBotoes((BancoDados.LiberaAlterar), (BancoDados.LiberaAlterar), (BancoDados.LiberaAlterar), True);
      end;

  BancoDados.CDSTabela.Close;
  BancoDados.qryTabela.SQL.Text := 'select * from tabela where tabela = ' +
    QuotedStr(BancoDados.Tabela);
  BancoDados.CDSTabela.Open;

  Caption := 'MasterERP - ' + BancoDados.CDSTabelaDESCRICAO_REDUZIDA.Value;
  GHPPrincipal.LabelCaption := BancoDados.CDSTabelaDESCRICAO_REDUZIDA.Value;

  Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, BancoDados.Tabela,
    'Acessando o Registro: ' + IntToStr(Id) + '/' + Descricao + '.');

  GeraTrace(BancoDados.Tabela,'Formulário de Cadastro');
end;

end.
