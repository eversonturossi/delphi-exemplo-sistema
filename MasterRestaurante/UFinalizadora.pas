unit UFinalizadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvExControls, JvGradientHeaderPanel, ExtCtrls, Buttons,
  StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, ActnList, Grids, DBGrids,
  Menus;

type
  TFinalizadoraForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    JvGradientHeaderPanel1: TJvGradientHeaderPanel;
    SBPrincipal: TStatusBar;
    Panel3: TPanel;
    BTCancelar: TSpeedButton;
    Label1: TLabel;
    Shape2: TShape;
    EditSubTotal: TJvValidateEdit;
    Label2: TLabel;
    EditValorAReceber: TJvValidateEdit;
    Shape1: TShape;
    Label3: TLabel;
    Shape3: TShape;
    EditDesconto: TJvValidateEdit;
    Label4: TLabel;
    Shape4: TShape;
    EditTotal: TJvValidateEdit;
    LBTipoDesconto: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    CBFormaPagamento: TComboBox;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    Action2: TAction;
    Action3: TAction;
    BTConfirmar: TBitBtn;
    BTExcluirNegociacao: TSpeedButton;
    Action4: TAction;
    procedure FormShow(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure CBFormaPagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure EditValorAReceberKeyPress(Sender: TObject; var Key: Char);
    procedure EditDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure EditTotalChange(Sender: TObject);
    procedure EditSubTotalChange(Sender: TObject);
    procedure BTFecharVendaClick(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure BTFecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BTExcluirNegociacaoClick(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
  private
    { Private declarations }
    DescontoPorcentagem : Boolean;
    ValorDesconto : Currency;
  public
    { Public declarations }
  end;

var
  FinalizadoraForm: TFinalizadoraForm;

implementation
uses Base, UFuncoes, UTroco, UVenda;
{$R *.dfm}

procedure TFinalizadoraForm.Action2Execute(Sender: TObject);
begin
  BTCancelarClick(Sender);
end;

procedure TFinalizadoraForm.Action3Execute(Sender: TObject);
begin
  BTFecharVendaClick(Sender);
end;

procedure TFinalizadoraForm.Action4Execute(Sender: TObject);
begin
  BTExcluirNegociacaoClick(Sender);
end;

procedure TFinalizadoraForm.BTFecharClick(Sender: TObject);
begin
  if (EditTotal.Value = 0) then
    begin
      try
        if not Assigned(TrocoForm) then
          TrocoForm := TTrocoForm.Create(Application);
        Hide;
        with BancoDados.qryAuxiliar do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select COALESCE(sum(total), 0.0) as total from negociacao ' +
              'where venda_id = ' + IntToStr(BancoDados.CDSVendaVENDA_ID.Value));
            Open;
          end;

        TrocoForm.EditAReceber.Value := BancoDados.qryAuxiliar.Fields[0].Value;
        TrocoForm.ShowModal;
        Close;
      finally
        TrocoForm.Free;
        TrocoForm := nil;
      end;
    end
  else
    begin
      Mensagem('Ainda existe valores a serem negociados!', mtWarning,[mbOk],mrOK,0);
      Abort;
    end
end;

procedure TFinalizadoraForm.BTCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFinalizadoraForm.BTExcluirNegociacaoClick(Sender: TObject);
begin
  if not (BancoDados.CDSNegociacao.IsEmpty) then
    begin
      if (Mensagem('Deseja excluir este Lançamento?', mtConfirmation,[mbYES,mbNO],mrNO,0) = mrYes) then
        begin
          try
            BancoDados.CDSNegociacao.DisableControls;
            BancoDados.CDSNegociacao.Delete;
            BancoDados.CDSNegociacao.Close;
            BancoDados.CDSNegociacao.Open;

            EditDesconto.Value := 0;
            with BancoDados.qryAuxiliar do
              begin
                Close;
                SQL.Clear;
                SQL.Add('select COALESCE(sum(valor), 0.0) as valor from negociacao ' +
                  'where venda_id = ' + IntToStr(BancoDados.CDSVendaVENDA_ID.Value));
                Open;
              end;
            EditTotal.Value := EditSubTotal.Value - BancoDados.qryAuxiliar.Fields[0].Value;
            BTConfirmar.Enabled := (not EditTotal.Value > 0);

            CBFormaPagamento.SetFocus;
          finally
            BancoDados.CDSNegociacao.EnableControls;
          end;
        end;
    end;
end;

procedure TFinalizadoraForm.BTFecharVendaClick(Sender: TObject);
begin
  if (EditTotal.Value = 0) then
    begin
      try
        if not Assigned(TrocoForm) then
          TrocoForm := TTrocoForm.Create(Application);
        Hide;
        with BancoDados.qryAuxiliar do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select COALESCE(sum(total), 0.0) as total from negociacao ' +
              'where venda_id = ' + IntToStr(BancoDados.CDSVendaVENDA_ID.Value));
            Open;
          end;

        TrocoForm.EditAReceber.Value := BancoDados.qryAuxiliar.Fields[0].Value;
        TrocoForm.ShowModal;
        Close;
      finally
        TrocoForm.Free;
        TrocoForm := nil;
      end;
    end
  else
    begin
      Mensagem('Ainda existe valores a serem negociados!', mtWarning,[mbOk],mrOK,0);
      Abort;
    end
end;

procedure TFinalizadoraForm.CBFormaPagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
    begin
      if (CBFormaPagamento.ItemIndex < 0) then
        begin
          Mensagem('Informe uma Forma de Pagamento!', mtWarning,[mbOk],mrOK,0);
          Abort;
        end
      else
        begin
          if (EditTotal.Value = 0) then
            begin
              Mensagem('Todo o valor da Venda já foi negociado!', mtWarning,[mbOk],mrOK,0);
              Abort;
            end
          else
            EditValorAReceber.SetFocus;
        end;
    end;
end;

procedure TFinalizadoraForm.EditValorAReceberKeyPress(Sender: TObject;
  var Key: Char);
begin
 if (Key = #13) then
    begin
      if (CBFormaPagamento.ItemIndex < 0) then
        begin
          Mensagem('Informe uma Forma de Pagamento!', mtWarning,[mbOk],mrOK,0);
          Abort;
        end
      else
        begin
          if (EditTotal.Value = 0) then
            begin
              Mensagem('Todo o valor da Venda já foi negociado!', mtWarning,[mbOk],mrOK,0);
              Abort;
            end
          else
            EditDesconto.SetFocus;
        end;
    end;
end;

procedure TFinalizadoraForm.EditDescontoKeyPress(Sender: TObject;
  var Key: Char);
var
  FormaPagamentoID : Integer;
begin
 if (Key = #13) then
  begin
    try
      FormaPagamentoID := 0;
      if (EditTotal.Value = 0) then
        begin
          Mensagem('Todo o valor da Venda já foi negociado!', mtWarning,[mbOk],mrOK,0);
          Abort;
        end;

      with BancoDados.qryAuxiliar do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select forma_pagamento_id from forma_pagamento where descricao = ' +
            QuotedStr(CBFormaPagamento.Text));
          Open;
        end;

      if (BancoDados.qryAuxiliar.IsEmpty) then
        begin
          Mensagem('Forma de Pagamento não localizada!', mtWarning,[mbOk],mrOK,0);
          CBFormaPagamento.SetFocus;
          Abort;
        end
      else
        FormaPagamentoID := BancoDados.qryAuxiliar.Fields[0].Value;

      with BancoDados.qryAuxiliar do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select forma_pagamento_id from negociacao where forma_pagamento_id = ' +
            IntToStr(FormaPagamentoID) + ' and venda_id = ' +
            IntToStr(BancoDados.CDSVendaVENDA_ID.Value));
          Open;
        end;

      if not (BancoDados.qryAuxiliar.IsEmpty) then
        begin
          Mensagem('Forma de Pagamento já utilizada nesta venda!', mtWarning,[mbOk],mrOK,0);
          Abort;
        end;

      BancoDados.CDSNegociacao.Append;
      BancoDados.CDSNegociacaoVENDA_ID.Value := BancoDados.CDSVendaVENDA_ID.Value;
      BancoDados.CDSNegociacaoFORMA_PAGAMENTO_ID.Value := FormaPagamentoID;
      BancoDados.CDSNegociacaoVALOR.Value := EditValorAReceber.Value;
      if (DescontoPorcentagem) then
        BancoDados.CDSNegociacaoDESCONTO.Value := (EditValorAReceber.Value * (EditDesconto.Value / 100))
      else
        BancoDados.CDSNegociacaoDESCONTO.Value := EditDesconto.Value;
      BancoDados.CDSNegociacaoTOTAL.Value := (EditValorAReceber.Value - BancoDados.CDSNegociacaoDESCONTO.Value);
      BancoDados.CDSNegociacao.Post;

      with BancoDados.qryAuxiliar do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select COALESCE(sum(valor), 0.0) as valor from negociacao ' +
            'where venda_id = ' + IntToStr(BancoDados.CDSVendaVENDA_ID.Value));
          Open;
        end;

      EditTotal.Value := (EditSubTotal.Value - BancoDados.qryAuxiliar.Fields[0].Value);

      if (EditTotal.Value > EditSubTotal.Value)  then
        begin
          Mensagem('O valor está incorreto!', mtWarning,[mbOk],mrOK,0);
          with BancoDados.qryAuxiliar do
            begin
              Close;
              SQL.Clear;
              SQL.Add('select forma_pagamento_id from forma_pagamento where descricao = ' +
                QuotedStr(CBFormaPagamento.Text));
              Open;
            end;
          BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
          with BancoDados.qryExecute do
            begin
              Close;
              SQL.Text := 'delete from negociacao where venda_id = ' +
                IntToStr(BancoDados.VendaID) + 'and forma_pagamento_id = ' +
                IntToStr(BancoDados.qryAuxiliar.Fields[0].Value) + ';';
              ExecSQL(true);
            end;
          BancoDados.Conexao.Commit(BancoDados.Transacao);
          Abort;
        end;

      try
        BancoDados.CDSNegociacao.DisableControls;
        BancoDados.CDSNegociacao.Close;
        BancoDados.qryNegociacao.SQL.Text := 'select * from negociacao where venda_id = ' +
          IntToStr(BancoDados.CDSVendaVENDA_ID.Value);
        BancoDados.CDSNegociacao.Open;
      finally
        BancoDados.CDSNegociacao.EnableControls;
      end;

      if (EditTotal.Value > 0) then
        begin
          BTConfirmar.Enabled := False;
          CBFormaPagamento.SetFocus;
        end
      else
        begin
          BTConfirmar.Enabled := True;
          BTConfirmar.SetFocus;
        end;

      EditDesconto.Value := 0;
    except
      begin
        Mensagem('Falha ao tentar inserir a Forma de Pagamento!', mtWarning,[mbOk],mrOK,0);
      end;
    end;
  end;
end;

procedure TFinalizadoraForm.EditSubTotalChange(Sender: TObject);
begin
  EditTotal.Value := EditSubTotal.Value;
end;

procedure TFinalizadoraForm.EditTotalChange(Sender: TObject);
begin
  EditValorAReceber.Value := EditTotal.Value;
end;

procedure TFinalizadoraForm.Action1Execute(Sender: TObject);
begin
  DescontoPorcentagem := (not DescontoPorcentagem);
  if (DescontoPorcentagem) then
    LBTipoDesconto.Caption := '% (F2)'
  else
    LBTipoDesconto.Caption := 'R$ (F2)';
end;

procedure TFinalizadoraForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #38) then
    begin
      Key := #0;
      if not (BancoDados.CDSNegociacao.Bof) then
        BancoDados.CDSNegociacao.Prior;
    end
  else
    if (Key = #40) then
      begin
        Key := #0;
        if not (BancoDados.CDSNegociacao.Eof) then
          BancoDados.CDSNegociacao.Next;
      end;
end;

procedure TFinalizadoraForm.FormShow(Sender: TObject);
begin
  Caption := 'MasterRestaurante - Fechamento de Venda';
  DescontoPorcentagem := False;
  BancoDados.VendaConcluida := False;

  with BancoDados.qryAuxiliar do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select COALESCE(sum(total), 0.0) as total from venda_item ' +
        'where cancelado = 0 and venda_id = ' + IntToStr(BancoDados.CDSVendaVENDA_ID.Value));
      Open;
    end;

  EditSubTotal.Value := BancoDados.qryAuxiliar.Fields[0].Value;

  CBFormaPagamento.Items.Clear;

  BancoDados.CDSFormaPagamento.Close;
  BancoDados.qryFormaPagamento.SQL.Text := 'select * from forma_pagamento';
  BancoDados.CDSFormaPagamento.Open;

  BancoDados.CDSFormaPagamento.First;
  while not BancoDados.CDSFormaPagamento.Eof do
    begin
      CBFormaPagamento.Items.Add(BancoDados.CDSFormaPagamentoDESCRICAO.Value);
      BancoDados.CDSFormaPagamento.Next;
    end;
  CBFormaPagamento.ItemIndex := 0;
  CBFormaPagamento.SetFocus;

  BancoDados.CDSNegociacao.Close;
  BancoDados.qryNegociacao.SQL.Text := 'select * from negociacao where venda_id = ' +
    IntToStr(BancoDados.CDSVendaVENDA_ID.Value);
  BancoDados.CDSNegociacao.Open;
end;

end.
