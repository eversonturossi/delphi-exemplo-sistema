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
    DBTextDataCadastro: TDBText;
    Label5: TLabel;
    DBTextUltimaAlteracao: TDBText;
    DBCCancelado: TDBCheckBox;
    DBCFinalizado: TDBCheckBox;
    Label2: TLabel;
    EditaDataEntrada: TJvDBDateEdit;
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
    DBEditFrete: TDBEdit;
    Label11: TLabel;
    DBTextValorProduto: TDBText;
    Label12: TLabel;
    Label13: TLabel;
    DBTextValorNota: TDBText;
    CBUnidade: TComboBox;
    Label14: TLabel;
    CDSNotaEntradaItemUNIDADE_ID: TIntegerField;
    CDSNotaEntradaItemcalc_unidade_descricao: TStringField;
    PopupMenu1: TPopupMenu;
    ExcluirItem1: TMenuItem;
    Label15: TLabel;
    EditNotaFiscal: TJvValidateEdit;
    Label16: TLabel;
    DBEditCodigo: TDBEdit;
    CDSCadastroNOTA_FISCAL: TIntegerField;
    procedure CDSNotaEntradaItemCalcFields(DataSet: TDataSet);
    procedure DBEditFreteExit(Sender: TObject);
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
    procedure EditNotaFiscalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditNotaFiscalExit(Sender: TObject);
    procedure CDSCadastroBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    procedure LimpaCampos;
    procedure CarregaHint;
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

procedure TLancamentoNotaEntradaForm.CarregaHint;
begin
  EditNotaFiscal.Hint := 'Informe o número da Nota Fiscal, caso exista';
  EditFornecedor.Hint := 'Informe um Fornecedor';
  EditTransportadora.Hint := 'Informe uma Transportadora';
  EditaDataEntrada.Hint := 'Informe a Data de Entrada da Nota';
  DBCCancelado.Hint := 'Nota Cancelada';
  DBCFinalizado.Hint := 'Nota Finalizada';
  EditProduto.Hint := 'Informe um Produto para Inserí-lo';
  EditDescricao.Hint := 'Descrição do Produto a ser Inserido';
  CBUnidade.Hint := 'Informe a Unidade do Produto a ser Inserido';
  EditQuantidade.Hint := 'Informe a Quantidade do Produto a ser Inserido';
  EditValorUnitario.Hint := 'Informe o Valor Unitário do Produto a ser Inserido';
  EditTotal.Hint := 'Valor Total do Item a ser Inserido';
  DBEditFrete.Hint := 'Valor Total do Fret da Nota';
  DBTextValorProduto.Hint := 'Valor Total dos Produtos';
  DBTextValorNota.Hint := 'Valor Total da Nota';
  LBFornecedorNome.Hint := 'Nome do Fornecedor informado';
  LBTransportadoraNome.Hint := 'Nome da Transportadora informada';
  DBTextUltimaAlteracao.Hint := 'Data/Hora da Última Alteração';
  DBTextDataCadastro.Hint := 'Data/Hora em que foi efetuado o Cadastro';
  BTSalvar.Hint := 'Salvar Registro';
  BTCancelar.Hint := 'Cancelar Alterações';
  BTExcluir.Hint := 'Excluir Registro';
  BTSair.Hint := 'Sair da Tela de Cadastro';
  DBEditCodigo.Hint := 'Código de identificação da Nota de Entrada';
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
var
  Itens : String;
begin
  if not (CDSCadastroFORNECEDOR_ID.Value > 0) then
    begin
      Mensagem('Informe um Fornecedor!', mtWarning,[mbOk],mrOK,0);
      EditFornecedor.SetFocus;
      Abort;
    end;

  if (not (CDSCadastroNOTA_ENTRADA_ID.Value > 0) and (EditNotaFiscal.Enabled))  then
    begin
      Mensagem('Informe um Número para a Nota de Entrada!', mtWarning,[mbOk],mrOK,0);
      EditNotaFiscal.SetFocus;
      Abort;
    end;

  if ((CDSCadastroFINALIZADO.Value <> 1) and (CDSCadastroCANCELADO.Value <> 1)) then
    if (Mensagem('Deseja Finalizar esta Nota?',mtConfirmation,[mbYES,mbNO],mrNO,0) = idYES) then
      begin
        if not (CDSCadastro.State in [dsEdit, dsInsert]) then
          CDSCadastro.Edit;
        CDSCadastroFINALIZADO.Value := 1;
      end;

  inherited; //Herança

  if (CDSCadastroFINALIZADO.Value = 1) then
    begin
      Itens := '';

      BancoDados.CDSProdutoFornecedor.Close;
      BancoDados.qryProdutoFornecedor.SQL.Text := 'select * from produto_fornecedor' +
            ' where empresa_id = ' + IntToStr(CDSCadastroEMPRESA_ID.Value) +
            ' and fornecedor_id = ' + IntToStr(CDSCadastroFORNECEDOR_ID.Value);
      BancoDados.CDSProdutoFornecedor.Open;

      CDSNotaEntradaItem.First;
      while not CDSNotaEntradaItem.Eof do
        begin
          BancoDados.CDSProdutoFornecedor.First;
          if not (BancoDados.CDSProdutoFornecedor.Locate('produto_id', CDSNotaEntradaItemPRODUTO_ID.Value, []))  then
            Itens := Itens + IntToStr(BancoDados.CDSProdutoFornecedorPRODUTO_ID.Value) + ',';

          CDSNotaEntradaItem.Next;
        end;

      Itens := Copy(Itens, 1, Length(Itens) - 1);

      if (Itens <> '') then
        begin
          if (Mensagem('Existem um ou mais Produtos não cadastrados para o Fornecedor informado.' + #13 +
            'Deseja incluir o Fornecedor para todos os Produtos?' ,mtConfirmation,[mbYES,mbNO],mrNO,0) = idYES) then
            begin
              BancoDados.CDSProduto.Close;
              BancoDados.qryProduto.SQL.Text := 'select * from produto where produto_id' +
                ' exists(' + Itens + ')';
              BancoDados.CDSProduto.Open;
              BancoDados.CDSProduto.First;
              while not BancoDados.CDSProduto.Eof do
                begin
                  BancoDados.qryExecute.SQL.Text := 'insert into produto_fornecedor(' +
                    'produto_id,fornecedor_id,empresa_id)values(' +
                    IntToStr(BancoDados.CDSProdutoPRODUTO_ID.Value) + ', ' +
                    IntToStr(CDSCadastroFORNECEDOR_ID.Value) + ', ' +
                    IntToStr(CDSCadastroEMPRESA_ID.Value) + ');';
                  BancoDados.qryExecute.ExecSQL(True);

                  BancoDados.CDSProduto.Next;
                end;
            end;
        end;
    end;

  with BancoDados.qryAuxiliar do
    begin
      Close;
      SQL.Text := 'select ';
    end;

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

procedure TLancamentoNotaEntradaForm.CDSCadastroBeforePost(DataSet: TDataSet);
begin
  inherited; //Herança

  CDSCadastroEMPRESA_ID.Value := BancoDados.EmpresaID;
  CDSCadastroFORNECEDOR_ID.Value := EditFornecedor.Value;
  CDSCadastroTRANSPORTADORA_ID.Value := EditTransportadora.Value;
  CDSCadastroNOTA_FISCAL.Value := EditNotaFiscal.Value;
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

procedure TLancamentoNotaEntradaForm.DBEditFreteExit(Sender: TObject);
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
            BarraStatus := False;
            if not Assigned(PesquisaFornecedorForm) then
              PesquisaFornecedorForm := TPesquisaFornecedorForm.Create(Application);
            if (PesquisaFornecedorForm.ShowModal = mrOk) then
              EditFornecedor.Value := PesquisaFornecedorForm.ID;
            EditFornecedor.SetFocus;
            Abort;
          finally
            PesquisaFornecedorForm.Free;
            PesquisaFornecedorForm := nil;
            BarraStatus := True;
          end;
        end
      else
        EditTransportadora.SetFocus;
    end;
end;

procedure TLancamentoNotaEntradaForm.EditNotaFiscalExit(Sender: TObject);
begin
  with BancoDados.qryAuxiliar do
    begin
      Close;
      SQL.Text := 'select nota_entrada_id from nota_entrada where nota_entrada_id = ' +
        IntToStr(EditNotaFiscal.Value);
      Open;
    end;

  if not (BancoDados.qryAuxiliar.IsEmpty) then
    begin
      Mensagem('Número da Nota de Entrada já existente!' + #13 +
        'Informe outro Número.', mtWarning,[mbOk],mrOK,0);
      EditQuantidade.SetFocus;
      Abort;
    end
  else
    CDSCadastroNOTA_ENTRADA_ID.Value := EditNotaFiscal.Value;
end;

procedure TLancamentoNotaEntradaForm.EditNotaFiscalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) then
    EditFornecedor.SetFocus;
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
            BarraStatus := False;
            if not Assigned(PesquisaProdutoForm) then
              PesquisaProdutoForm := TPesquisaProdutoForm.Create(Application);
            if (PesquisaProdutoForm.ShowModal = mrOk) then
              EditProduto.Value := PesquisaProdutoForm.ID;
            EditProduto.SetFocus;
            Abort;
          finally
            PesquisaProdutoForm.Free;
            PesquisaProdutoForm := nil;
            BarraStatus := True;
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
            BarraStatus := False;
            if not Assigned(PesquisaTransportadoraForm) then
              PesquisaTransportadoraForm := TPesquisaTransportadoraForm.Create(Application);
            if (PesquisaTransportadoraForm.ShowModal = mrOk) then
              EditTransportadora.Value := PesquisaTransportadoraForm.ID;
            EditTransportadora.SetFocus;
            Abort;
          finally
            PesquisaTransportadoraForm.Free;
            PesquisaTransportadoraForm := nil;
            BarraStatus := True;
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

  EditNotaFiscal.SetFocus;

  DBGrid1.Enabled := (not (CDSCadastroFINALIZADO.Value = 1) and
    not (CDSCadastroCANCELADO.Value = 1));
end;

end.
