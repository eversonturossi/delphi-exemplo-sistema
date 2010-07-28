unit UConsultaLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvExControls, JvGradientHeaderPanel, ExtCtrls, Grids,
  DBGrids, Buttons, FMTBcd, DB, SqlExpr, Provider, DBClient, StdCtrls, Mask,
  JvExMask, JvToolEdit;

type
  TConsultaLogForm = class(TForm)
    Panel1: TPanel;
    JvGradientHeaderPanel1: TJvGradientHeaderPanel;
    SBPrincipal: TStatusBar;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    BTFechar: TSpeedButton;
    DSLogOperacao: TDataSource;
    CDSLogOperacao: TClientDataSet;
    DSPLogOperacao: TDataSetProvider;
    qryLogOperacao: TSQLQuery;
    CDSLogOperacaoUSUARIO_ID: TIntegerField;
    CDSLogOperacaoDATA_LANCAMENTO: TSQLTimeStampField;
    CDSLogOperacaoOPERACAO: TStringField;
    CDSLogOperacaocalc_usuario_login: TStringField;
    CDSLogOperacaocalc_tabela_descricao_reduzida: TStringField;
    CDSLogOperacaoTABELA: TStringField;
    Label1: TLabel;
    CBUsuario: TComboBox;
    Label2: TLabel;
    CBModulo: TComboBox;
    GroupBox1: TGroupBox;
    CHPeriodo: TCheckBox;
    EditDe: TJvDateEdit;
    Label3: TLabel;
    EditAte: TJvDateEdit;
    Label4: TLabel;
    BTPesquisar: TSpeedButton;
    procedure BTFecharClick(Sender: TObject);
    procedure CDSLogOperacaoCalcFields(DataSet: TDataSet);
    procedure CHPeriodoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisar;
  public
    { Public declarations }
  end;

var
  ConsultaLogForm: TConsultaLogForm;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TConsultaLogForm.Pesquisar;
var
  Consulta : String;
begin
  try
    CDSLogOperacao.DisableControls;

    CDSLogOperacao.Close;
    Consulta := 'select * from log_operacao';

    if (CBUsuario.ItemIndex > 0) then
      Consulta := Consulta + ' where usuario_id in(select usuario_id' +
        ' from usuario where login = ' + QuotedStr(CBUsuario.Text) + ')';

    if (CBModulo.ItemIndex > 0) then
      if (Pos('where', Consulta) > 0)  then
        Consulta := Consulta + ' and tabela in(select tabela from tabela' +
          ' where descricao_reduzida = ' + QuotedStr(CBModulo.Text) + ')'
      else
        Consulta := Consulta + ' where tabela in(select tabela from tabela' +
          ' where descricao_reduzida = ' + QuotedStr(CBModulo.Text) + ')';

    if (CHPeriodo.Checked) then
      begin
        if not (EditDe.Date > 0) then
          begin
            Mensagem('Informe a Data Inicial!', mtWarning,[mbOk],mrOK,0);
            EditDe.SetFocus;
            Abort;
          end;

        if not (EditAte.Date > 0) then
          begin
            Mensagem('Informe a Data Final!', mtWarning,[mbOk],mrOK,0);
            EditAte.SetFocus;
            Abort;
          end;

        if (EditDe.Date > Date) then
          begin
            Mensagem('A Data Inicial não pode ser maior do que a Data de Hoje!', mtWarning,[mbOk],mrOK,0);
            EditDe.SetFocus;
            Abort;
          end;

        if (EditAte.Date > Date) then
          begin
            Mensagem('A Data Final não pode ser maior do que a Data de Hoje!', mtWarning,[mbOk],mrOK,0);
            EditAte.SetFocus;
            Abort;
          end;

        if (EditDe.Date > EditAte.Date) then
          begin
            Mensagem('A Data Inicial não pode ser maior do que a Data Final!', mtWarning,[mbOk],mrOK,0);
            Abort;
          end;


        if (Pos('where', Consulta) > 0)  then
          Consulta := Consulta + ' and data_lancamento between (' +
            QuotedStr(FormatDateTime('dd.mm.yyyy 00:00:00', EditDe.Date)) + ') and (' +
            QuotedStr(FormatDateTime('dd.mm.yyyy 23:59:59', EditAte.Date)) + ')'
        else
          Consulta := Consulta + ' where data_lancamento between (' +
            QuotedStr(FormatDateTime('dd.mm.yyyy 00:00:00', EditDe.Date)) + ') and (' +
            QuotedStr(FormatDateTime('dd.mm.yyyy 23:59:59', EditAte.Date)) + ')';
      end;

    qryLogOperacao.SQL.Text := Consulta;
    CDSLogOperacao.Open;

    CDSLogOperacao.Last;
    CDSLogOperacao.First;
    SBPrincipal.Panels[0].Text := IntToStr(CDSLogOperacao.RecordCount) + ' Registro(s) Encontrado(s).';
  finally
    CDSLogOperacao.EnableControls;
  end;
end;

procedure TConsultaLogForm.BTFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TConsultaLogForm.BTPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TConsultaLogForm.CDSLogOperacaoCalcFields(DataSet: TDataSet);
begin
  with BancoDados.qryAuxiliar do
    begin
      Close;
      SQL.Text := 'select login from usuario where usuario_id = ' +
        IntToStr(CDSLogOperacaoUSUARIO_ID.Value);
      Open;
    end;
  if not (BancoDados.qryAuxiliar.IsEmpty) then
    CDSLogOperacaocalc_usuario_login.Value := BancoDados.qryAuxiliar.Fields[0].Value;

  with BancoDados.qryAuxiliar do
    begin
      Close;
      SQL.Text := 'select descricao_reduzida from tabela where tabela = ' +
        QuotedStr(CDSLogOperacaoTABELA.Value);
      Open;
    end;
  if not (BancoDados.qryAuxiliar.IsEmpty) then
    CDSLogOperacaocalc_tabela_descricao_reduzida.Value := BancoDados.qryAuxiliar.Fields[0].Value;
end;

procedure TConsultaLogForm.CHPeriodoClick(Sender: TObject);
begin
  EditDe.Enabled := CHPeriodo.Checked;
  EditAte.Enabled := CHPeriodo.Checked;
end;

procedure TConsultaLogForm.FormShow(Sender: TObject);
begin
  BancoDados.CDSUsuario.Close;
  BancoDados.qryUsuario.SQL.Text := 'select * from usuario where ativo = 1';
  BancoDados.CDSUsuario.Open;

  CBUsuario.Items.Clear;
  CBUsuario.Items.Add('<selecione>');

  BancoDados.CDSUsuario.First;
  while not BancoDados.CDSUsuario.Eof do
    begin
      CBUsuario.Items.Add(BancoDados.CDSUsuarioLOGIN.Value);
      BancoDados.CDSUsuario.Next;
    end;
  CBUsuario.ItemIndex := 0;

  BancoDados.CDSTabela.Close;
  BancoDados.qryTabela.SQL.Text := 'select * from tabela';
  BancoDados.CDSTabela.Open;

  CBModulo.Items.Clear;
  CBModulo.Items.Add('<selecione>');

  BancoDados.CDSTabela.First;
  while not BancoDados.CDSTabela.Eof do
    begin
      CBModulo.Items.Add(BancoDados.CDSTabelaDESCRICAO_REDUZIDA.Value);
      BancoDados.CDSTabela.Next;
    end;
  CBModulo.ItemIndex := 0;

  EditDe.Date := Date;
  EditAte.Date := Date;
end;

end.
