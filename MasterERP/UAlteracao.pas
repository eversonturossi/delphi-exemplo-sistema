unit UAlteracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, ComCtrls, Buttons, DBCtrls, Menus,
  FMTBcd, DB, SqlExpr, Provider, DBClient;

type
  TAlteracaoForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    DTAte: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    DTDe: TDateTimePicker;
    Label2: TLabel;
    CBPeriodo: TCheckBox;
    CBAtiva: TCheckBox;
    CBRecuperada: TCheckBox;
    BTFechar: TSpeedButton;
    BTRestaurar: TSpeedButton;
    DBLCTabela: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    DBLCUsuario: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    qryPesquisaAlteracao: TSQLQuery;
    DSCDSPesquisaTabela: TDataSource;
    qryPesquisaAlteracaoALTERACAO_ID: TIntegerField;
    qryPesquisaAlteracaoTABELA: TStringField;
    qryPesquisaAlteracaoUSUARIO_ID: TIntegerField;
    qryPesquisaAlteracaoDATA_CADASTRO: TSQLTimeStampField;
    qryPesquisaAlteracaoDADOS: TMemoField;
    qryPesquisaAlteracaoRECUPERADA: TSmallintField;
    qryPesquisaAlteracaoDATA_RECUPERACAO: TSQLTimeStampField;
    qryPesquisaAlteracaoATIVO: TSmallintField;
    qryPesquisaAlteracaocalc_nome_usuario: TStringField;
    qryPesquisaAlteracaocalc_descricao_tabela: TStringField;
    CDSPesquisaTabela: TClientDataSet;
    DSPPesquisaTabela: TDataSetProvider;
    CDSPesquisaTabelaALTERACAO_ID: TIntegerField;
    CDSPesquisaTabelaTABELA: TStringField;
    CDSPesquisaTabelaUSUARIO_ID: TIntegerField;
    CDSPesquisaTabelaDATA_CADASTRO: TSQLTimeStampField;
    CDSPesquisaTabelaDADOS: TMemoField;
    CDSPesquisaTabelaRECUPERADA: TSmallintField;
    CDSPesquisaTabelaDATA_RECUPERACAO: TSQLTimeStampField;
    CDSPesquisaTabelaATIVO: TSmallintField;
    CDSPesquisaTabelacalc_nome_usuario: TStringField;
    CDSPesquisaTabelacalc_descricao_tabela: TStringField;
    CDSInformacao: TClientDataSet;
    DSCDSInformacao: TDataSource;
    CDSInformacaoATUALIZA: TBooleanField;
    CDSInformacaoTABELA: TStringField;
    CDSInformacaoVALOR_ANTERIOR: TStringField;
    CDSInformacaoVALOR_ATUAL: TStringField;
    CDSInformacaoCAMPO: TStringField;
    procedure Detalhes1Click(Sender: TObject);
    procedure CBPeriodoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTRestaurarClick(Sender: TObject);
    procedure DBLCTabelaClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
    procedure Pesquisar;
  public
    { Public declarations }
  end;

var
  AlteracaoForm: TAlteracaoForm;

implementation
uses Base, UAlteracaoDetalhe, UFuncoes, USupervisaoUsuario;
{$R *.dfm}

procedure TAlteracaoForm.Pesquisar;
begin
  BancoDados.CDSAlteracao.Close;
  with BancoDados.qryAlteracao do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from alteracao');

      if (CBAtiva.Checked) then
        SQL.Add(' where ativo = 1');

      if (DBLCTabela.KeyValue > 0) then
        if (Pos('where', SQL.GetText) > 0) then
          SQL.Add(' and tabela = ' + QuotedStr(DBLCTabela.KeyValue))
        else
          SQL.Add(' where tabela = ' + QuotedStr(DBLCTabela.KeyValue));

      if (DBLCUsuario.KeyValue > 0) then
        if (Pos('where', SQL.GetText) > 0) then
          SQL.Add(' and usuario_id = ' + IntToStr(DBLCUsuario.KeyValue))
        else
          SQL.Add(' where usuario_id = ' + IntToStr(DBLCUsuario.KeyValue));


      if (CBRecuperada.Checked) then
        if (Pos('where', SQL.GetText) > 0) then
          SQL.Add(' and recuperada = 1')
        else
          SQL.Add(' where recuperada = 1');

      if (CBPeriodo.Checked) then
        if (Pos('where', SQL.GetText) > 0) then
          SQL.Add(' and data_cadastro between ' +
            QuotedStr(FormatDateTime('dd.mm.yyyy 00:00:00', DTDe.Date)) +
            QuotedStr(FormatDateTime('dd.mm.yyyy 00:00:00', DTAte.Date)))
        else
          SQL.Add(' where data_cadastro between ' +
            QuotedStr(FormatDateTime('dd.mm.yyyy 00:00:00', DTDe.Date)) +
            QuotedStr(FormatDateTime('dd.mm.yyyy 00:00:00', DTAte.Date)));

      SQL.Add('order by data_cadastro, tabela, usuario_id Desc');
      Open;
    end;
  BancoDados.CDSAlteracao.Open;
  BancoDados.CDSAlteracao.First;
end;

procedure TAlteracaoForm.BTRestaurarClick(Sender: TObject);
var
  i : Integer;
  Dados : TMemo;
begin
  //Dados.Text := BancoDados.CDSAlterarDADOS.Value;

  //for i := 0 to Dados.Lines.Count do
    //begin

    //end;
end;

procedure TAlteracaoForm.CBPeriodoClick(Sender: TObject);
begin
  DTDe.Enabled := CBPeriodo.Checked;
  DTAte.Enabled := CBPeriodo.Checked;
end;

procedure TAlteracaoForm.DBGrid1CellClick(Column: TColumn);
var
  i, Tamanho, Campo, Valor : Integer;
  Dados : TMemo;
  Tabela : ShortString;
begin
  CDSInformacao.Close;
  Dados.Lines.Text := CDSPesquisaTabelaDADOS.Value;

  for i := 1 to Dados.Lines.Count do
    begin
      Tamanho := Length(Dados.Lines[i]);
      Campo := Pos('|',Dados.Lines[i]);

      if (Copy(Dados.Lines[i],1,1) = '#')  then
        Tabela := Copy(Dados.Lines[i],2,Tamanho)
      else
        if (Copy(Dados.Lines[i],1,1) = '*')  then
          begin
            CDSInformacao.Append;

            CDSInformacaoTABELA.Value := Tabela;
            CDSInformacaoCAMPO.Value := Copy(Dados.Lines[i], 2, Campo - 1);
          end;
    end;
end;

procedure TAlteracaoForm.DBLCTabelaClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TAlteracaoForm.Detalhes1Click(Sender: TObject);
begin
  CriaForm(TAlteracaoDetalheForm, AlteracaoDetalheForm);
end;

procedure TAlteracaoForm.FormShow(Sender: TObject);
begin
  DTDe.Date := Date;
  DTAte.Date := Date;
  BTFechar.Glyph.LoadFromFile(BancoDados.imgFechar);
  BTRestaurar.Glyph.LoadFromFile(BancoDados.imgOk);

  BancoDados.CDSAlteracao.Close;
  with BancoDados.qryAlteracao do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from alteracao order by data_cadastro, tabela, usuario_id Desc');
      Open;
    end;
  BancoDados.CDSAlteracao.Open;
  BancoDados.CDSAlteracao.First;

  BancoDados.CDSUsuario.Close;
  with BancoDados.qryUsuario do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from usuario order by login');
      Open;
    end;
  BancoDados.CDSUsuario.Open;
  BancoDados.CDSUsuario.First;

  BancoDados.CDSTabela.Close;
  with BancoDados.qryTabela do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tabela order by descricao');
      Open;
    end;
  BancoDados.CDSTabela.Open;
  BancoDados.CDSTabela.First;
end;

end.
