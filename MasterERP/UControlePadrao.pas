unit UControlePadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, AppEvnts, DBClient, Provider, Menus, SqlExpr, Grids,
  DBGrids, ComCtrls, Buttons, JvExControls, JvGradientHeaderPanel, ExtCtrls,
  ComObj, ActnList;

type
  TControlePadraoForm = class(TForm)
    Panel1: TPanel;
    GHPPrincipal: TJvGradientHeaderPanel;
    BTNovo: TSpeedButton;
    BTAlterar: TSpeedButton;
    BTExcluir: TSpeedButton;
    BTExportar: TSpeedButton;
    BTSair: TSpeedButton;
    SBPrincipal: TStatusBar;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    qryConsulta: TSQLQuery;
    PopupMenu1: TPopupMenu;
    ExibirColunas1: TMenuItem;
    ReconfigurarColunas1: TMenuItem;
    qryExportar: TSQLQuery;
    DSPConsulta: TDataSetProvider;
    qryCsExibirColuna: TSQLQuery;
    DSPExportar: TDataSetProvider;
    CDSConsulta: TClientDataSet;
    ApplicationEvents: TApplicationEvents;
    CDSExportar: TClientDataSet;
    DSConsulta: TDataSource;
    qryControleAcesso: TSQLQuery;
    qryControleAcessoUSUARIO_ACESSO_ID: TIntegerField;
    qryControleAcessoUSUARIO_ID: TIntegerField;
    qryControleAcessoTABELA: TStringField;
    qryControleAcessoDESCRICAO: TStringField;
    qryControleAcessoVALOR: TSmallintField;
    qryControleAcessoTIPO: TStringField;
    ActionList: TActionList;
    ANovo: TAction;
    AAlterar: TAction;
    AExcluir: TAction;
    AExportar: TAction;
    ASair: TAction;
    procedure CDSConsultaReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure ExibirColunas1Click(Sender: TObject);
    procedure ReconfigurarColunas1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEventsHint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTAlterarClick(Sender: TObject);
    procedure BTExcluirClick(Sender: TObject);
    procedure BTExportarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BTSairClick(Sender: TObject);
  private
    { Private declarations }
    Id : Integer;
    Descricao : ShortString;
    procedure CarregaPermissoes;
  public
    { Public declarations }
  end;

var
  ControlePadraoForm: TControlePadraoForm;

implementation
uses Base, UFuncoes, UFuncaoExibirColuna, UsuarioExibirColuna;
{$R *.dfm}

procedure TControlePadraoForm.ApplicationEventsHint(Sender: TObject);
begin
  if (BancoDados.ExibeStatus) then
    SBPrincipal.Panels[0].Text := Application.Hint;
end;

procedure TControlePadraoForm.BTAlterarClick(Sender: TObject);
begin
  if (CDSConsulta.IsEmpty) then
    begin
      Mensagem('Não há Registro a ser Alterado!', mtWarning,[mbOk],mrOK,0);
      Abort;
    end;
end;

procedure TControlePadraoForm.BTExcluirClick(Sender: TObject);
begin
  try
    GeraTrace(BancoDados.Tabela,'Excluindo Registros');
    BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
    if (Mensagem('Deseja realmente Excluir este Registro?',mtConfirmation,[mbYES,mbNO],mrNO,0) = idYES) then
      begin
        CDSConsulta.Delete;
        CDSConsulta.ApplyUpdates(0);
        BancoDados.Conexao.Commit(BancoDados.Transacao);
      end
    else
      Abort;
    GeraTrace(BancoDados.Tabela,'Exclusão Concluida');
  except
      CDSConsulta.Cancel;
      BancoDados.Conexao.Rollback(BancoDados.Transacao);
  end;
end;

procedure TControlePadraoForm.BTExportarClick(Sender: TObject);
var
  Linha, Coluna : integer;
  Planilha: Variant;
  ValorCampoEx: ShortString;
begin
  CDSExportar.Close;
  qryExportar.SQL.Text := 'select * from ' + BancoDados.Tabela;
  CDSExportar.Open;

  if not (CDSExportar.IsEmpty) then
    begin
      GeraTrace(BancoDados.Tabela,'Exportando Dados para o Excel');
      Planilha := CreateOleObject('Excel.Application');
      Planilha.workBooks.add(1);
      Planilha.caption := 'Exportação de dados para excel' ;
      Planilha.visible := True;
      CDSExportar.First;

      for Linha := 0 to CDSExportar.RecordCount - 1 do
        begin
          for coluna := 1 to CDSExportar.FieldCount do
            begin
              ValorCampoEx := CDSExportar.Fields[coluna - 1].AsString;
              Planilha.cells[Linha + 2, Coluna] := ValorCampoEx;
            end;
         CDSExportar.Next;
        end;

      for coluna := 1 to CDSExportar.FieldCount do
        begin
          ValorCampoEx := CDSExportar.Fields[coluna - 1].DisplayLabel;
          Planilha.cells[1, Coluna] := ValorCampoEx;
        end;

      Planilha.columns.Autofit;

      GeraTrace(BancoDados.Tabela,'Dados Exportados com Sucesso');
      Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, BancoDados.Tabela,
        'Registro Exportado: ' + IntToStr(Id) + '/' + Descricao + '.');
    end
  else
    Mensagem('Não há itens para exportar !', mtWarning,[mbOk],mrOK,0);
end;

procedure TControlePadraoForm.BTSairClick(Sender: TObject);
begin
  Close;
end;

procedure TControlePadraoForm.CarregaPermissoes;
const
  Privilegios: Array[1..5] of String = ('Formulario', 'Novo', 'Excluir', 'Editar', 'Exportar');
var
  i : Integer;
begin
  GeraTrace(BancoDados.Tabela,'Carregando Permissões do Usuário');

  BancoDados.CDSPrivilegio.Close;
  BancoDados.qryPrivilegio.SQL.Text := 'select * from privilegio where tabela = ' +
    QuotedStr(BancoDados.Tabela);
  BancoDados.CDSPrivilegio.Open;

  for i := 1 to 5 do
    begin
      BancoDados.CDSPrivilegio.First;
      while not BancoDados.CDSPrivilegio.Eof do
        begin
          if (BancoDados.CDSPrivilegioABREVIACAO.Value = Privilegios[i]) then
            begin
              with BancoDados.qryExecute do
                begin
                  Close;
                  SQL.Clear;
                  SQL.Add('select acesso from usuario_privilegio where usuario_id = ' +
                    IntToStr(BancoDados.qryLoginUSUARIO_ID.Value) + ' and privilegio_id = ' +
                    IntToStr(BancoDados.CDSPrivilegioPRIVILEGIO_ID.Value));
                  Open;
                end;
              if (Privilegios[i] = 'Formulario') then
                BancoDados.LiberaFormulario := (BancoDados.qryExecute.Fields[0].Value = 1)
              else if (Privilegios[i] = 'Novo') then
                BTNovo.Enabled := (BancoDados.qryExecute.Fields[0].Value = 1)
              else if (Privilegios[i] = 'Excluir') then
                BTExcluir.Enabled := (BancoDados.qryExecute.Fields[0].Value = 1)
              else if (Privilegios[i] = 'Editar') then
                begin
                  if (BancoDados.qryExecute.Fields[0].Value = 1) then
                    begin
                      BTAlterar.Caption := 'Alterar';
                      BancoDados.LiberaAlterar := True;
                    end
                  else
                    begin
                      BTAlterar.Caption := 'Visualizar';
                      BancoDados.LiberaAlterar := False;
                    end;
                end
              else if (Privilegios[i] = 'Exportar') then
                begin
                  if (BancoDados.qryExecute.Fields[0].Value = 1) then
                    begin
                      BTExportar.Enabled := True;
                      BancoDados.LiberaExportar := True;
                    end
                  else
                    begin
                      BTExportar.Enabled := False;
                      BancoDados.LiberaExportar := False;
                    end;
                end;
            end;
          BancoDados.CDSPrivilegio.Next;
        end;
    end;
  GeraTrace(BancoDados.Tabela,'Permissões do Usuário Carregadas');
end;

procedure TControlePadraoForm.CDSConsultaReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  if (Pos('FOREIGN KEY', E.Message) > 0) then
    begin
      Mensagem('Não foi possível excluir este Registro: ' + #13 +
        'Existem lançamentos feitos apartir do mesmo!', mtWarning,[mbOk],mrOK,0);
    end;

  DataSet.Cancel;
  CDSConsulta.Close;
  CDSConsulta.Open;
end;

procedure TControlePadraoForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check : Integer;
  R: TRect;
begin
  if (Column.FieldName = 'ATIVO') then
    begin
      DBGrid1.Canvas.FillRect(Rect);
      Check := 0;
      if (CDSConsulta.FieldByName('ATIVO').Value = 1) then
        Check := DFCS_CHECKED
      else
        Check := 0;
      R := Rect;
      InflateRect(R,-3,-3);
      DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
    end
  else if (Column.FieldName = 'CANCELADO') then
    begin
      DBGrid1.Canvas.FillRect(Rect);
      Check := 0;
      if (CDSConsulta.FieldByName('CANCELADO').Value = 1) then
        Check := DFCS_CHECKED
      else
        Check := 0;
      R := Rect;
      InflateRect(R,-3,-3);
      DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
    end
  else if (Column.FieldName = 'FINALIZADO') then
    begin
      DBGrid1.Canvas.FillRect(Rect);
      Check := 0;
      if (CDSConsulta.FieldByName('FINALIZADO').Value = 1) then
        Check := DFCS_CHECKED
      else
        Check := 0;
      R := Rect;
      InflateRect(R,-3,-3);
      DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
    end;
end;

procedure TControlePadraoForm.ExibirColunas1Click(Sender: TObject);
begin
  try
    GeraTrace(BancoDados.Tabela,'Alterando Configurações da Grade');
    BancoDados.ExibeStatus := False;

    if not Assigned(UsuarioExibirColunaForm) then
      UsuarioExibirColunaForm := TUsuarioExibirColunaForm.Create(Application);
    UsuarioExibirColunaForm.ShowModal;
    UsuarioExibirColunaForm.TabelaFuncao := 0;
  finally
    BancoDados.ExibeStatus := True;
    ConfiguraGrade(DBGrid1, BancoDados.qryLoginUSUARIO_ID.Value, 0, BancoDados.Tabela);

    UsuarioExibirColunaForm.Free;
    UsuarioExibirColunaForm := nil;
    GeraTrace(BancoDados.Tabela,'Configurações da Grade Alteradas');
  end;
end;

procedure TControlePadraoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  Valor : Integer;
begin
  qryConsulta.Close;
  qryControleAcesso.Close;
  BancoDados.LiberaFormulario := False;
  BancoDados.LiberaAlterar := False;
  BancoDados.LiberaExportar := False;
  BancoDados.Operacao := '';
  BancoDados.Tabela := '';

  GeraTrace(BancoDados.Tabela,'Formulário de Consulta Encerrado');
  GeraTrace(BancoDados.Tabela,CriaLinha(110));
end;

procedure TControlePadraoForm.FormCreate(Sender: TObject);
begin
  ApplicationEvents.Activate;
  CarregaPermissoes;
end;

procedure TControlePadraoForm.FormShow(Sender: TObject);
var
  Valor : Boolean;
begin
  AtivaTrace := (Trace(BancoDados.qryExecute, BancoDados.Tabela) = 1);
  GeraTrace(BancoDados.Tabela,CriaLinha(110));
  GeraTrace(BancoDados.Tabela,'Abrindo Formulário de Consulta');

  BancoDados.Operacao := '';

  BancoDados.ExibeStatus := True;

  BancoDados.CDSTabela.Close;
  BancoDados.qryTabela.SQL.Text := 'select * from tabela where tabela = ' +
    QuotedStr(BancoDados.Tabela);
  BancoDados.CDSTabela.Open;

  Caption := 'MasterERP - ' + BancoDados.CDSTabelaDESCRICAO_REDUZIDA.Value;
  GHPPrincipal.LabelCaption := BancoDados.CDSTabelaDESCRICAO_REDUZIDA.Value;

  ConfiguraGrade(DBGrid1, BancoDados.qryLoginUSUARIO_ID.Value, 0, BancoDados.Tabela);
  GeraTrace(BancoDados.Tabela,'Formulário de Consulta');
end;

procedure TControlePadraoForm.ReconfigurarColunas1Click(Sender: TObject);
begin
  try
    GeraTrace(BancoDados.Tabela,'Alterando Configurações da Grade');
    BancoDados.CDSUsuarioExibir.Close;
    BancoDados.qryUsuarioExibir.SQL.Text := 'select * from usuario_exibir ' +
      ' where usuario_id = ' + IntToStr(BancoDados.qryLoginUSUARIO_ID.Value) +
      ' and tabela = ' + QuotedStr(BancoDados.Tabela) + ' and tabela_funcao = ' +
      IntToStr(0);
    BancoDados.CDSUsuarioExibir.Open;

    BancoDados.Conexao.StartTransaction(BancoDados.Transacao);

    BancoDados.qryExecute.SQL.Text := 'delete from usuario_exibir_coluna where usuario_exibir_id = ' +
      IntToStr(BancoDados.CDSUsuarioExibirUSUARIO_EXIBIR_ID.Value) + ';';
    BancoDados.qryExecute.ExecSQL(True);

    BancoDados.qryExecute.SQL.Text := 'delete from usuario_exibir where usuario_exibir_id = ' +
      IntToStr(BancoDados.CDSUsuarioExibirUSUARIO_EXIBIR_ID.Value) + ';';
    BancoDados.qryExecute.ExecSQL(True);

    BancoDados.Conexao.Commit(BancoDados.Transacao);

    ConfiguraGrade(DBGrid1, BancoDados.qryLoginUSUARIO_ID.Value, 0, BancoDados.Tabela);

    Mensagem('Alterações gravadas com Sucesso!', mtInformation,[mbOk],mrOK,0);

    GeraTrace(BancoDados.Tabela,'Configurações da Grade Alteradas');

  except
    Mensagem('Erro ao tentar Reconfigurar a Grade!', mtWarning,[mbOk],mrOK,0);
    BancoDados.Conexao.Rollback(BancoDados.Transacao);
    Abort;
  end;
end;

end.
