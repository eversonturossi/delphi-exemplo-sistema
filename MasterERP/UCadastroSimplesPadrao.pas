unit UCadastroSimplesPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvGradientHeaderPanel, ExtCtrls, ComCtrls, Grids,
  DBGrids, Buttons, FMTBcd, DB, SqlExpr, Provider, DBClient, ActnList, Menus;

type
  TCadastroSimplesPadraoForm = class(TForm)
    SBPrincipal: TStatusBar;
    Panel1: TPanel;
    JvGradientHeaderPanel1: TJvGradientHeaderPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BTSair: TSpeedButton;
    DSCadastro: TDataSource;
    CDSCadastro: TClientDataSet;
    DSPCadastro: TDataSetProvider;
    qryCadastro: TSQLQuery;
    PopupMenu1: TPopupMenu;
    ExibirColunas1: TMenuItem;
    ActionList: TActionList;
    AExcluir: TAction;
    procedure AExcluirExecute(Sender: TObject);
    procedure CDSCadastroAfterCancel(DataSet: TDataSet);
    procedure CDSCadastroAfterDelete(DataSet: TDataSet);
    procedure CDSCadastroBeforeCancel(DataSet: TDataSet);
    procedure BTSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure CDSCadastroAfterInsert(DataSet: TDataSet);
    procedure ExibirColunas1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure CarregaPermissoes;
  public
    { Public declarations }
  end;

var
  CadastroSimplesPadraoForm: TCadastroSimplesPadraoForm;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TCadastroSimplesPadraoForm.CarregaPermissoes;
const
  Privilegios: Array[1..4] of String = ('Formulario', 'Novo', 'Excluir', 'Editar');
var
  i : Integer;
begin
  GeraTrace(BancoDados.Tabela,'Carregando Permissões do Usuário');

  BancoDados.CDSPrivilegio.Close;
  BancoDados.qryPrivilegio.SQL.Text := 'select * from privilegio where tabela = ' +
    QuotedStr(BancoDados.Tabela);
  BancoDados.CDSPrivilegio.Open;

  for i := 1 to 4 do
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
                DBGrid1.Enabled := (BancoDados.qryExecute.Fields[0].Value = 1)
              else if (Privilegios[i] = 'Excluir') then
                DBGrid1.Enabled := (BancoDados.qryExecute.Fields[0].Value = 1)
              else if (Privilegios[i] = 'Editar') then
                DBGrid1.Enabled := (BancoDados.qryExecute.Fields[0].Value = 1);
            end;
          BancoDados.CDSPrivilegio.Next;
        end;
    end;
  GeraTrace(BancoDados.Tabela,'Permissões do Usuário Carregadas');
end;

procedure TCadastroSimplesPadraoForm.AExcluirExecute(Sender: TObject);
begin
  if (Mensagem('Deseja realmente Excluir este Registro?',mtConfirmation,[mbYES,mbNO],mrNO,0) = idYES) then
    begin
      try
        CDSCadastro.DisableControls;
        CDSCadastro.Delete;
      finally
        CDSCadastro.Close;
        CDSCadastro.Open;
        CDSCadastro.EnableControls;
      end;
    end;
end;

procedure TCadastroSimplesPadraoForm.BTSairClick(Sender: TObject);
begin
  Close;
end;

procedure TCadastroSimplesPadraoForm.CDSCadastroAfterCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.Rollback(BancoDados.Transacao);
end;

procedure TCadastroSimplesPadraoForm.CDSCadastroAfterDelete(DataSet: TDataSet);
begin
  CDSCadastro.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TCadastroSimplesPadraoForm.CDSCadastroAfterInsert(DataSet: TDataSet);
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
  except
    Mensagem('Falha ao Tentar Gerar o I.D!', mtInformation,[mbOk],mrOK,0);
  end;
end;

procedure TCadastroSimplesPadraoForm.CDSCadastroBeforeCancel(DataSet: TDataSet);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
end;

procedure TCadastroSimplesPadraoForm.ExibirColunas1Click(Sender: TObject);
begin
  if (Mensagem('Deseja realmente Excluir este Registro?',mtConfirmation,[mbYES,mbNO],mrNO,0) = idYES) then
    CDSCadastro.Delete;
end;

procedure TCadastroSimplesPadraoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (CDSCadastro.State in [dsInsert, dsEdit]) then
    CDSCadastro.Cancel;
  BancoDados.Tabela := '';
  GeraTrace(BancoDados.Tabela,'Formulário de Cadastro Encerrado');
  GeraTrace(BancoDados.Tabela,CriaLinha(110));
end;

procedure TCadastroSimplesPadraoForm.FormCreate(Sender: TObject);
begin
  CarregaPermissoes;
end;

procedure TCadastroSimplesPadraoForm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #27) then
    if (CDSCadastro.State in [dsInsert, dsEdit]) then
      CDSCadastro.Cancel;
end;

procedure TCadastroSimplesPadraoForm.FormShow(Sender: TObject);
begin
  AtivaTrace := (Trace(BancoDados.qryExecute, BancoDados.Tabela) = 1);
  GeraTrace(BancoDados.Tabela,CriaLinha(110));
  GeraTrace(BancoDados.Tabela,'Abrindo Formulário de Cadastro');
  GeraTrace(BancoDados.Tabela,'Formulário de Cadastro');
end;

end.
