unit ULancamentoNotaentrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ULancamentoPadrao, FMTBcd, AppEvnts, ActnList, DB, DBClient,
  Provider, SqlExpr, ComCtrls, Buttons, JvExControls, JvGradientHeaderPanel,
  ExtCtrls, StdCtrls, DBCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, Mask,
  JvExMask, JvToolEdit, JvDBControls, Grids, DBGrids, Menus;

type
  TLancamentoNotaEntradaForm = class(TLancamentoPadraoForm)
    Label1: TLabel;
    EditFornecedor: TJvValidateEdit;
    LBFornecedorNome: TLabel;
    Label3: TLabel;
    EditTransportadora: TJvValidateEdit;
    LBTransportadoraNome: TLabel;
    CDSCadastroNOTA_ENTRADA_ID: TIntegerField;
    CDSCadastroEMPRESA_ID: TIntegerField;
    CDSCadastroFORNECEDOR_ID: TIntegerField;
    CDSCadastroDATA_CADASTRO: TSQLTimeStampField;
    CDSCadastroDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSCadastroDATA_ENTRADA: TSQLTimeStampField;
    CDSCadastroTRANSPORTADORA_ID: TIntegerField;
    CDSCadastroCANCELADO: TSmallintField;
    CDSCadastroVALOR_FRETE: TFloatField;
    CDSCadastroVALOR_PRODUTOS: TFloatField;
    CDSCadastroVALOR_NOTA: TFloatField;
    CDSCadastroFINALIZADO: TSmallintField;
    Panel2: TPanel;
    Label4: TLabel;
    DBText2: TDBText;
    Label5: TLabel;
    DBText1: TDBText;
    DBCCancelado: TDBCheckBox;
    DBCFinalizado: TDBCheckBox;
    Label2: TLabel;
    JvDBDateEdit1: TJvDBDateEdit;
    DBGrid1: TDBGrid;
    EditProduto: TJvValidateEdit;
    Label6: TLabel;
    EditDescricao: TEdit;
    Label7: TLabel;
    DSNotaEntradaItem: TDataSource;
    CDSNotaEntradaItem: TClientDataSet;
    DSPNotaEntradaItem: TDataSetProvider;
    qryNotaEntradaItem: TSQLQuery;
    CDSNotaEntradaItemNOTA_ENTRADA_ITEM_ID: TIntegerField;
    CDSNotaEntradaItemNOTA_ENTRADA_ID: TIntegerField;
    CDSNotaEntradaItemPRODUTO_ID: TIntegerField;
    CDSNotaEntradaItemVALOR_UNITARIO: TFloatField;
    CDSNotaEntradaItemQUANTIDADE: TFloatField;
    CDSNotaEntradaItemcalc_total: TFloatField;
    EditQuantidade: TJvValidateEdit;
    Label8: TLabel;
    Label9: TLabel;
    EditValorUnitario: TJvValidateEdit;
    Label10: TLabel;
    EditTotal: TJvValidateEdit;
    DBEdit1: TDBEdit;
    Label11: TLabel;
    DBText3: TDBText;
    Label12: TLabel;
    Label13: TLabel;
    DBText4: TDBText;
    CBUnidade: TComboBox;
    Label14: TLabel;
    CDSNotaEntradaItemUNIDADE_ID: TIntegerField;
    CDSNotaEntradaItemcalc_unidade_descricao: TStringField;
    PopupMenu1: TPopupMenu;
    ExcluirItem1: TMenuItem;
    procedure CDSNotaEntradaItemCalcFields(DataSet: TDataSet);
    procedure DBEdit1Exit(Sender: TObject);
    procedure EditProdutoExit(Sender: TObject);
    procedure EditProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBUnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditQuantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditValorUnitarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditValorUnitarioExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTSalvarClick(Sender: TObject);
    procedure EditFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditFornecedorExit(Sender: TObject);
    procedure CDSCadastroAfterInsert(DataSet: TDataSet);
    procedure BTExcluirClick(Sender: TObject);
    procedure ExcluirItem1Click(Sender: TObject);
    procedure EditTransportadoraExit(Sender: TObject);
    procedure EditTransportadoraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure LimpaCampos;
  public
    { Public declarations }
  end;

var
  LancamentoNotaEntradaForm: TLancamentoNotaEntradaForm;

implementation
uses Base, UFuncoes, UPesquisaProduto, UPesquisaFornecedor,
  UPesquisaTransportadora;
{$R *.dfm}

procedure TLancamentoNotaEntradaForm.LimpaCampos;
begin
  EditProduto.Value := 0;
  EditDescricao.Text := '';
  CBUnidade.Text := '<selecione>';
  EditQuantidade.Value := 0;
  EditValorUnitario.Value := 0;
  EditTotal.Value := 0;

  EditProduto.SetFocus;
end;
procedure TLancamentoNotaEntradaForm.BTExcluirClick(Sender: TObject);
begin
  inherited; //Herança

  try
    GeraTrace(BancoDados.Tabela, 'Excluindo Registro');
    BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
    CDSNotaEntradaItem.Delete;
    CDSNotaEntradaItem.ApplyUpdates(0);
    BancoDados.Conexao.Commit(BancoDados.Transacao);
    GeraTrace(BancoDados.Tabela,'Exclusão Concluida');
  except
    CDSNotaEntradaItem.Cancel;
    ModalResult := mrCancel;
    BancoDados.Conexao.Rollback(BancoDados.Transacao);
  end;
end;

procedure TLancamentoNotaEntradaForm.BTSalvarClick(Sender: TObject);
begin
  if not (CDSCadastroFORNECEDOR_ID.Value > 0) then
    begin
      Mensagem('Informe um Fornecedor!', mtWarning,[mbOk],mrOK,0);
      EditFornecedor.SetFocus;
      Abort;
    end;

  inherited; //Herança

  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
  CDSNotaEntradaItem.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TLancamentoNotaEntradaForm.CBUnidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) then
    EditQuantidade.SetFocus;
end;

procedure TLancamentoNotaEntradaForm.CDSCadastroAfterInsert(DataSet: TDataSet);
begin
  inherited; //Herança

  CDSCadastroCANCELADO.Value := 0;
  CDSCadastroFINALIZADO.Value := 0;
end;

procedure TLancamentoNotaEntradaForm.CDSNotaEntradaItemCalcFields(
  DataSet: TDataSet);
begin
  with BancoDados.qryAuxiliar do
    begin
      Close;
      SQL.Text := 'select descricao from unidade where unidade_id = ' +
        IntToStr(CDSNotaEntradaItemUNIDADE_ID.Value);
      Open;
    end;
  if not (BancoDados.qryAuxiliar.IsEmpty) then
    CDSNotaEntradaItemcalc_unidade_descricao.Value := BancoDados.qryAuxiliar.Fields[0].Value;

  CDSNotaEntradaItemcalc_total.Value := (CDSNotaEntradaItemQUANTIDADE.Value *
    CDSNotaEntradaItemVALOR_UNITARIO.Value);
end;

procedure TLancamentoNotaEntradaForm.DBEdit1Exit(Sender: TObject);
begin
  if not (CDSCadastro.State in [dsEdit, dsInsert]) then
    CDSCadastro.Edit;
  CDSCadastroVALOR_NOTA.Value := (CDSCadastroVALOR_PRODUTOS.Value + CDSCadastroVALOR_FRETE.Value);
end;

procedure TLancamentoNotaEntradaForm.EditFornecedorExit(Sender: TObject);
begin
  BancoDados.CDSFornecedor.Close;
  BancoDados.qryFornecedor.SQL.Text := 'select * from fornecedor where Fornecedor_id = ' +
    IntToStr(EditFornecedor.Value);
  BancoDados.CDSFornecedor.Open;

  if not (BancoDados.CDSFornecedor.IsEmpty) then
    begin
      EditFornecedor.Value := BancoDados.CDSFornecedorFORNECEDOR_ID.Value;
      LBFornecedorNome.Caption := BancoDados.CDSFornecedorNOME_RAZAO.Value;
    end;
end;

procedure TLancamentoNotaEntradaForm.EditFornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) then
    begin
      if not (EditFornecedor.Value > 0) then
        begin
          try
            if not Assigned(PesquisaFornecedorForm) then
              PesquisaFornecedorForm := TPesquisaFornecedorForm.Create(Application);
            if (PesquisaFornecedorForm.ShowModal = mrOk) then
              EditFornecedor.Value := PesquisaFornecedorForm.ID;
            EditFornecedor.SetFocus;
            Abort;
          finally
            PesquisaFornecedorForm.Free;
            PesquisaFornecedorForm := nil;
          end;
        end
      else
        EditTransportadora.SetFocus;
    end;
end;

procedure TLancamentoNotaEntradaForm.EditProdutoExit(Sender: TObject);
begin
  BancoDados.CDSProduto.Close;
  BancoDados.qryProduto.SQL.Text := 'select * from produto where produto_id = ' +
    IntToStr(EditProduto.Value);
  BancoDados.CDSProduto.Open;

  if not (BancoDados.CDSProduto.IsEmpty) then
    begin
      EditDescricao.Text := BancoDados.CDSProdutoDESCRICAO.Value;
      with BancoDados.qryAuxiliar do
        begin
          Close;
          SQL.Text := 'select descricao where unidade_id = ' +
            IntToStr(BancoDados.CDSProdutoUNIDADE_ID.Value);
          Open;
        end;
      if not (BancoDados.qryAuxiliar.IsEmpty) then
        CBUnidade.Text := BancoDados.qryAuxiliar.Fields[0].Value;
    end;
end;

procedure TLancamentoNotaEntradaForm.EditProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) then
    begin
      if not (EditProduto.Value > 0) then
        begin
          try
            if not Assigned(PesquisaProdutoForm) then
              PesquisaProdutoForm := TPesquisaProdutoForm.Create(Application);
            if (PesquisaProdutoForm.ShowModal = mrOk) then
              EditProduto.Value := PesquisaProdutoForm.ID;
            EditProduto.SetFocus;
            Abort;
          finally
            PesquisaProdutoForm.Free;
            PesquisaProdutoForm := nil;
          end;
        end
      else
        CBUnidade.SetFocus;
    end;
end;

procedure TLancamentoNotaEntradaForm.EditQuantidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) then
    begin
      if not (EditQuantidade.Value > 0) then
        begin
          Mensagem('O Valor da Quantidade deve ser maior que Zero!', mtWarning,[mbOk],mrOK,0);
          EditQuantidade.SetFocus;
          Abort;
        end
      else
        begin
          EditTotal.Value := (EditQuantidade.Value * EditValorUnitario.Value);
          EditValorUnitario.SetFocus;
        end;
    end;
end;

procedure TLancamentoNotaEntradaForm.EditTransportadoraExit(Sender: TObject);
begin
  BancoDados.CDSTransportadora.Close;
  BancoDados.qryTransportadora.SQL.Text := 'select * from transportadora where transportadora_id = ' +
    IntToStr(EditTransportadora.Value);
  BancoDados.CDSTransportadora.Open;

  if not (BancoDados.CDSTransportadora.IsEmpty) then
    begin
      EditTransportadora.Value := BancoDados.CDSTransportadoraTRANSPORTADORA_ID.Value;
      LBTransportadoraNome.Caption := BancoDados.CDSTransportadoraNOME_RAZAO.Value;
    end;
end;

procedure TLancamentoNotaEntradaForm.EditTransportadoraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) then
    begin
      if not (EditTransportadora.Value > 0) then
        begin
          try
            if not Assigned(PesquisaTransportadoraForm) then
              PesquisaTransportadoraForm := TPesquisaTransportadoraForm.Create(Application);
            if (PesquisaTransportadoraForm.ShowModal = mrOk) then
              EditTransportadora.Value := PesquisaTransportadoraForm.ID;
            EditTransportadora.SetFocus;
            Abort;
          finally
            PesquisaTransportadoraForm.Free;
            PesquisaTransportadoraForm := nil;
          end;
        end
      else
        EditProduto.SetFocus;
    end;
end;

procedure TLancamentoNotaEntradaForm.EditValorUnitarioExit(Sender: TObject);
begin
  EditTotal.Value := (EditQuantidade.Value * EditValorUnitario.Value);
end;

procedure TLancamentoNotaEntradaForm.EditValorUnitarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) then
    begin
      if (not (CDSCadastroFINALIZADO.Value = 1) and not (CDSCadastroCANCELADO.Value = 1)) then
        begin
          if not (EditValorUnitario.Value > 0) then
            begin
              Mensagem('O Valor Unitário deve ser maior que Zero!', mtWarning,[mbOk],mrOK,0);
              EditValorUnitario.SetFocus;
              Abort;
            end
          else
            begin
              try
                CDSNotaEntradaItem.DisableControls;
                CDSNotaEntradaItem.Append;
                CDSNotaEntradaItemNOTA_ENTRADA_ID.Value := CDSCadastroNOTA_ENTRADA_ID.Value;
                with BancoDados.qryAuxiliar do
                  begin
                    Close;
                    SQL.Text := 'select unidade_id where descricao = ' +
                      QuotedStr(CBUnidade.Text);
                    Open;
                  end;
                if not (BancoDados.qryAuxiliar.IsEmpty) then
                  CDSNotaEntradaItemUNIDADE_ID.Value := BancoDados.qryAuxiliar.Fields[0].Value;

                CDSNotaEntradaItemPRODUTO_ID.Value := EditProduto.Value;
                CDSNotaEntradaItemQUANTIDADE.Value := EditQuantidade.Value;
                CDSNotaEntradaItemVALOR_UNITARIO.Value := EditValorUnitario.Value;
                CDSNotaEntradaItem.Post;

                if not (CDSCadastro.State in [dsEdit, dsInsert]) then
                  CDSCadastro.Edit;

                CDSCadastroVALOR_PRODUTOS.Value := (CDSCadastroVALOR_PRODUTOS.Value + EditTotal.Value);
                CDSCadastroVALOR_NOTA.Value := (CDSCadastroVALOR_PRODUTOS.Value - CDSCadastroVALOR_FRETE.Value);

                LimpaCampos;
              finally
                CDSNotaEntradaItem.EnableControls;
              end;
            end;
        end
      else
        begin
          Mensagem('A Nota corrente não pode ser mais Alterada!', mtWarning,[mbOk],mrOK,0);
          EditValorUnitario.SetFocus;
          Abort;
        end;
    end;
end;

procedure TLancamentoNotaEntradaForm.ExcluirItem1Click(Sender: TObject);
var
  ValorItem : Currency;
begin
  try
    CDSNotaEntradaItem.DisableControls;
    try
      GeraTrace(BancoDados.Tabela,'Excluindo Registros');
      if (Mensagem('Deseja realmente Excluir este Registro?',mtConfirmation,[mbYES,mbNO],mrNO,0) = idYES) then
        begin
          ValorItem := CDSNotaEntradaItemVALOR_UNITARIO.Value;
          CDSNotaEntradaItem.Delete;
          if not (CDSCadastro.State in [dsEdit, dsInsert]) then
            CDSCadastro.Edit;
          CDSCadastroVALOR_PRODUTOS.Value := (CDSCadastroVALOR_PRODUTOS.Value - ValorItem);
          CDSCadastroVALOR_NOTA.Value := (CDSCadastroVALOR_PRODUTOS.Value + CDSCadastroVALOR_FRETE.Value);
        end
      else
        Abort;
      GeraTrace(BancoDados.Tabela,'Exclusão Concluida');
    except
      CDSNotaEntradaItem.Cancel;
    end;
  finally
    CDSNotaEntradaItem.EnableControls;
  end;
end;

procedure TLancamentoNotaEntradaForm.FormShow(Sender: TObject);
begin
  inherited; //Herança

  BancoDados.CDSUnidade.Close;
  BancoDados.qryUnidade.SQL.Text := 'select * from unidade where ativo = 1';
  BancoDados.CDSUnidade.Open;
  BancoDados.CDSUnidade.First;

  CBUnidade.Items.Clear;
  CBUnidade.Items.Add('<selecione>');
  while not BancoDados.CDSUnidade.Eof do
    begin
      CBUnidade.Items.Add(BancoDados.CDSUnidadeDESCRICAO.Value);
      BancoDados.CDSUnidade.Next;
    end;

  CDSNotaEntradaItem.Close;
  qryNotaEntradaItem.SQL.Text := 'select * from nota_entrada_item where' +
    ' nota_entrada_id = ' + IntToStr(CDSCadastroNOTA_ENTRADA_ID.Value);
  CDSNotaEntradaItem.Open;

  DBGrid1.Enabled := (not (CDSCadastroFINALIZADO.Value = 1) and
    not (CDSCadastroCANCELADO.Value = 1));


  EditFornecedor.SetFocus;
end;

end.
