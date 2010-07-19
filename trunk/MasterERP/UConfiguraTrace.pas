unit UConfiguraTrace;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, ExtCtrls, Grids, DBGrids, ActnList, AppEvnts;

type
  TConfiguraTraceForm = class(TForm)
    Panel1: TPanel;
    BTSalvar: TSpeedButton;
    BTSair: TSpeedButton;
    SBPrincipal: TStatusBar;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    ApplicationEvents: TApplicationEvents;
    ActionList: TActionList;
    ASalvar: TAction;
    ASair: TAction;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTSairClick(Sender: TObject);
    procedure BTSalvarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure ApplicationEventsHint(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure CarregaImagens;
  public
    { Public declarations }
  end;

var
  ConfiguraTraceForm: TConfiguraTraceForm;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TConfiguraTraceForm.CarregaImagens;
begin
  try
    BTSalvar.Glyph.LoadFromFile(BancoDados.imgSalvar);
    BTSair.Glyph.LoadFromFile(BancoDados.imgSair);
  except end;
end;

procedure TConfiguraTraceForm.ApplicationEventsHint(Sender: TObject);
begin
  SBPrincipal.Panels[0].Text := Application.Hint;
end;

procedure TConfiguraTraceForm.BTSairClick(Sender: TObject);
begin
  BancoDados.CDSTabela.Cancel;
  BancoDados.Conexao.Rollback(BancoDados.Transacao);
  Close;
end;

procedure TConfiguraTraceForm.BTSalvarClick(Sender: TObject);
begin
  BancoDados.CDSTabela.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
  Close;
end;

procedure TConfiguraTraceForm.DBGrid1CellClick(Column: TColumn);
begin
  if (DBGrid1.SelectedField.FieldName = 'ATIVAR_TRACE') then
    begin
      try
        BancoDados.CDSTabela.DisableControls;
        BancoDados.CDSTabela.Edit;
        if (BancoDados.CDSTabelaATIVAR_TRACE.Value = 1) then
          BancoDados.CDSTabelaATIVAR_TRACE.Value := 0
        else
          BancoDados.CDSTabelaATIVAR_TRACE.Value := 1;
      BancoDados.CDSTabela.Post;
      finally
        BancoDados.CDSTabela.EnableControls;
      end;
    end;
end;

procedure TConfiguraTraceForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'ATIVAR_TRACE' then
    begin
      DBGrid1.Canvas.FillRect(Rect);
      Check := 0;
      if (BancoDados.CDSTabelaATIVAR_TRACE.Value = 1) then
        Check := DFCS_CHECKED
      else
        Check := 0;
      R := Rect;
      InflateRect(R,-3,-3);
      DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
    end;

end;

procedure TConfiguraTraceForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  BancoDados.CDSTabela.Close;
  BancoDados.qryTabela.Close;
end;

procedure TConfiguraTraceForm.FormShow(Sender: TObject);
begin
  BancoDados.CDSTabela.Close;
  with BancoDados.qryTabela do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tabela order by tabela');
      Open;
    end;
  BancoDados.CDSTabela.Open;
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
  CarregaImagens;
end;

end.
