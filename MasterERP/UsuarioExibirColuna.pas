unit UsuarioExibirColuna;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, ExtCtrls, ComCtrls, StdCtrls, Spin, FMTBcd,
  DB, SqlExpr, Provider, DBClient, AppEvnts, JPEG, ActnList, JvExControls,
  JvGradientHeaderPanel;

type
  TUsuarioExibirColunaForm = class(TForm)
    SBPrincipal: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    CBFonte: TComboBox;
    Label2: TLabel;
    SEFontTamanho: TSpinEdit;
    ApplicationEvents: TApplicationEvents;
    CBMarcar: TCheckBox;
    ActionList: TActionList;
    ASalvar: TAction;
    ALimpar: TAction;
    ACancelar: TAction;
    ASair: TAction;
    JvGradientHeaderPanel1: TJvGradientHeaderPanel;
    BTSalvar: TSpeedButton;
    BTLimpar: TSpeedButton;
    BTCancelar: TSpeedButton;
    BTSair: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure SEFontTamanhoChange(Sender: TObject);
    procedure ApplicationEventsHint(Sender: TObject);
    procedure CBMarcarClick(Sender: TObject);
    procedure BTSalvarClick(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure BTSairClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure CBFonteChange(Sender: TObject);
    procedure BTLimparClick(Sender: TObject);
    procedure ASalvarExecute(Sender: TObject);
    procedure ALimparExecute(Sender: TObject);
    procedure ACancelarExecute(Sender: TObject);
    procedure ASairExecute(Sender: TObject);
    procedure BTSalvarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    FTabelaFuncao : Integer;
  public
    { Public declarations }
  published
    { Published declarations }
    property TabelaFuncao: Integer read FTabelaFuncao write FTabelaFuncao;
  end;

var
  UsuarioExibirColunaForm: TUsuarioExibirColunaForm;

implementation
uses Base, UFuncoes, UFuncaoExibirColuna;
{$R *.dfm}

procedure TUsuarioExibirColunaForm.ASairExecute(Sender: TObject);
begin
  BTSairClick(Sender);
end;

procedure TUsuarioExibirColunaForm.ASalvarExecute(Sender: TObject);
begin
  BTSalvarClick(Sender);
end;

procedure TUsuarioExibirColunaForm.BTCancelarClick(Sender: TObject);
begin
  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
  BancoDados.CDSUsuarioExibirColuna.Cancel;
  BancoDados.CDSUsuarioExibirColuna.ApplyUpdates(0);
  BancoDados.Conexao.Rollback(BancoDados.Transacao);
  Close;
end;

procedure TUsuarioExibirColunaForm.BTLimparClick(Sender: TObject);
begin
  SEFontTamanho.Value := 8;
  CBFonte.Text := 'MS Sans Serif';
  DBGrid1.Font.Size := SEFontTamanho.Value;
  DBGrid1.Font.Name := CBFonte.Text;
  CBMarcar.Checked := True;
  CBMarcarClick(Sender);
end;

procedure TUsuarioExibirColunaForm.BTSairClick(Sender: TObject);
begin
  Close;
end;

procedure TUsuarioExibirColunaForm.BTSalvarClick(Sender: TObject);
begin
  try
    BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
    AtualizaFonte(BancoDados.qryLoginUSUARIO_ID.Value, FTabelaFuncao, SEFontTamanho.Value,
      BancoDados.Tabela, Trim(CBFonte.Text));
    BancoDados.CDSUsuarioExibirColuna.ApplyUpdates(0);
    BancoDados.Conexao.Commit(BancoDados.Transacao);
  except
    Mensagem('Falha ao tentar Gravar as alterações da Grade!', mtWarning,[mbOk],mrOK,0);
    BancoDados.CDSUsuarioExibirColuna.Cancel;
    BancoDados.Conexao.Rollback(BancoDados.Transacao);
  end;
  Close;
end;

procedure TUsuarioExibirColunaForm.BTSalvarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  SBPrincipal.Panels[0].Text := (Sender as TSpeedButton).Hint;
end;

procedure TUsuarioExibirColunaForm.CBFonteChange(Sender: TObject);
begin
  DBGrid1.Font.Name := CBFonte.Text;
end;

procedure TUsuarioExibirColunaForm.CBMarcarClick(Sender: TObject);
begin
  try
    with BancoDados.CDSUsuarioExibirColuna do
      begin
        DisableControls;
        First;
        while not Eof do
          begin
            Application.ProcessMessages;
            Edit;
            if (CBMarcar.Checked) then
              BancoDados.CDSUsuarioExibirColunaVISIVEL.Value := 1
            else
              BancoDados.CDSUsuarioExibirColunaVISIVEL.Value := 0;
            Post;
            Next;
          end;
      end;
  finally
    if (CBMarcar.Checked) then
      CBMarcar.Caption := 'Desmarcar Todos'
    else
      CBMarcar.Caption := 'Marcar Todos';
    BancoDados.CDSUsuarioExibirColuna.First;
    BancoDados.CDSUsuarioExibirColuna.EnableControls;
    DBGrid1.Refresh;
  end;
end;

procedure TUsuarioExibirColunaForm.DBGrid1CellClick(Column: TColumn);
begin
  if (DBGrid1.SelectedField.FieldName = 'VISIVEL') then
    begin
      try
        BancoDados.CDSUsuarioExibirColuna.DisableControls;
        BancoDados.CDSUsuarioExibirColuna.Edit;
        if (BancoDados.CDSUsuarioExibirColunaVISIVEL.Value = 1) then
          BancoDados.CDSUsuarioExibirColunaVISIVEL.Value := 0
        else
          BancoDados.CDSUsuarioExibirColunaVISIVEL.Value := 1;
      BancoDados.CDSUsuarioExibirColuna.Post;
      finally
        BancoDados.CDSUsuarioExibirColuna.EnableControls;
      end;
    end;
end;

procedure TUsuarioExibirColunaForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'VISIVEL' then
    begin
      DBGrid1.Canvas.FillRect(Rect);
      Check := 0;
      if (BancoDados.CDSUsuarioExibirColunaVISIVEL.Value = 1) then
        Check := DFCS_CHECKED
      else
        Check := 0;
      R := Rect;
      InflateRect(R,-3,-3);
      DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
    end;
end;

procedure TUsuarioExibirColunaForm.ACancelarExecute(Sender: TObject);
begin
  BTCancelarClick(Sender);
end;

procedure TUsuarioExibirColunaForm.ALimparExecute(Sender: TObject);
begin
  BTLimparClick(Sender);
end;

procedure TUsuarioExibirColunaForm.ApplicationEventsHint(Sender: TObject);
begin
  SBPrincipal.Panels[0].Text := Application.Hint;
end;

procedure TUsuarioExibirColunaForm.FormShow(Sender: TObject);
var
  i : Integer;
  Temp : TStrings;
begin
  try
    Temp := TStrings.Create;
    Temp := Screen.Fonts;
    CBFonte.Items.Clear;
    for i := 0 to Temp.Count - 1 do
      CBFonte.Items.Add(Temp[i]);

    BancoDados.CDSUsuarioExibirColuna.Close;
    BancoDados.qryUsuarioExibirColuna.SQL.Text := 'select * from usuario_exibir_coluna ' +
      ' where usuario_exibir_id in(select usuario_exibir_id from usuario_exibir where tabela = ' +
        QuotedStr(BancoDados.Tabela) + ' and usuario_id = ' +
        IntToStr(BancoDados.qryLoginUSUARIO_ID.Value) + ' and tabela_funcao = ' +
        IntToStr(FTabelaFuncao) + ')';
    BancoDados.CDSUsuarioExibirColuna.Open;

    CBFonte.Text := BancoDados.CDSUsuarioExibirFONTE_NOME.Value;
    SEFontTamanho.Value := BancoDados.CDSUsuarioExibirFONTE_TAMANHO.Value;
  finally
    Temp := nil;
  end;
end;

procedure TUsuarioExibirColunaForm.SEFontTamanhoChange(Sender: TObject);
begin
  DBGrid1.Font.Size := SEFontTamanho.Value;
end;

end.
