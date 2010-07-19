unit UVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, JvExStdCtrls, JvEdit, JvValidateEdit,
  StdCtrls, ComCtrls, ActnList, Buttons;

type
  TVendaForm = class(TForm)
    Label1: TLabel;
    Shape2: TShape;
    EditCodigo: TEdit;
    Label2: TLabel;
    EditDescricao: TEdit;
    Shape1: TShape;
    Label3: TLabel;
    EditQtd: TJvValidateEdit;
    Shape3: TShape;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    Label4: TLabel;
    LBTotal: TLabel;
    SBPrincipal: TStatusBar;
    TimerPrincipal: TTimer;
    Label5: TLabel;
    Label8: TLabel;
    LBVendaID: TLabel;
    LBCliente: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    BTFecharVenda: TSpeedButton;
    BTNovaVenda: TSpeedButton;
    BTCancelarItem: TSpeedButton;
    BTCancelarVenda: TSpeedButton;
    BTSair: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure TimerPrincipalTimer(Sender: TObject);
    procedure EditCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure EditQtdKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Action1Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure BTFecharVendaClick(Sender: TObject);
    procedure BTCancelarVendaClick(Sender: TObject);
    procedure BTCancelarItemClick(Sender: TObject);
    procedure BTNovaVendaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Comanda : Boolean;
  end;

var
  VendaForm: TVendaForm;

implementation
uses Base, UFuncoes, UPrincipal, UPesquisaProduto, UItem, UFinalizadora;
{$R *.dfm}

procedure TVendaForm.Action1Execute(Sender: TObject);
begin
  BTNovaVendaClick(Sender);
end;

procedure TVendaForm.Action3Execute(Sender: TObject);
begin
  BTCancelarItemClick(Sender);
end;

procedure TVendaForm.Action4Execute(Sender: TObject);
begin
  BTFecharVendaClick(Sender);
end;

procedure TVendaForm.Action5Execute(Sender: TObject);
begin
  BTCancelarVendaClick(Sender);
end;

procedure TVendaForm.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (BancoDados.CDSVendaItemCANCELADO.Value = 1) then
    DBGrid2.Canvas.Font.Color := clRed
  else
    DBGrid2.Canvas.Font.Color := clWindowText;

  if (DBGrid2.SelectedRows.CurrentRowSelected) then
    DBGrid2.Canvas.Font.Color := clWhite;

  DBGrid2.DefaultDrawDataCell(Rect, DBGrid2.columns[datacol].field, State);
end;

procedure TVendaForm.EditCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    begin
      if (EditCodigo.Text <> '') then
        begin
          if (TestaInteiro(EditCodigo.Text)) then
            begin
              BancoDados.CDSUnidade.Close;
              BancoDados.qryUnidade.SQL.Text := 'select * from unidade';
              BancoDados.CDSUnidade.Open;

              BancoDados.CDSProduto.Close;
              BancoDados.qryProduto.SQL.Text := 'select * from produto where produto_id = ' +
                EditCodigo.Text;
              BancoDados.CDSProduto.Open;

              if (BancoDados.CDSProduto.IsEmpty) then
                begin
                  Mensagem('Produto não Encontrado!', mtWarning,[mbOk],mrOK,0);
                  EditCodigo.SetFocus;
                  Abort;
                end
              else
                begin
                  EditCodigo.Text := FormatFloat('0000000000', BancoDados.CDSProdutoPRODUTO_ID.Value);
                  EditDescricao.Text := BancoDados.CDSProdutoDESCRICAO.Value;
                  EditQtd.Value := 1;
                  EditQtd.SetFocus;
                end;
            end;
        end
      else
        begin
          try
            if not Assigned(PesquisaProdutoForm) then
              PesquisaProdutoForm := TPesquisaProdutoForm.Create(Application);
            if (PesquisaProdutoForm.ShowModal = mrOk) then
              EditCodigo.Text := FormatFloat('0000000000', BancoDados.CDSProdutoPRODUTO_ID.Value);
            EditCodigo.SetFocus;
          finally
            PesquisaProdutoForm.Free;
            PesquisaProdutoForm := nil;
          end;
        end;
    end;
end;

procedure TVendaForm.EditQtdKeyPress(Sender: TObject; var Key: Char);
var
  item : Integer;
begin
  if (Key = #13) then
    begin
      if (EditQtd.Value > 0) then
        begin
          try
            if (BancoDados.CDSVenda.IsEmpty) then
              Action1Execute(Sender);

            BancoDados.CDSVendaItem.DisableControls;
            BancoDados.CDSVendaItem.Close;
            BancoDados.qryVendaItem.SQL.Text := 'select * from venda_item ' +
              'where venda_id = ' +
              IntToStr((BancoDados.CDSVendaVENDA_ID.Value));
            BancoDados.CDSVendaItem.Open;
            BancoDados.CDSVendaItem.Last;
            BancoDados.CDSVendaItem.First;
            item := BancoDados.CDSVendaItem.RecordCount + 1;
            try
              BancoDados.CDSVendaItem.Append;

              BancoDados.CDSVendaItemVENDA_ID.Value := BancoDados.VendaID;
              BancoDados.CDSVendaItemPRODUTO_ID.Value := BancoDados.CDSProdutoPRODUTO_ID.Value;
              BancoDados.CDSVendaItemUND.Value := BancoDados.CDSProdutol_unidade.Value;
              BancoDados.CDSVendaItemPRECO.Value := BancoDados.CDSProdutoPRECO.Value;
              BancoDados.CDSVendaItemQUANTIDADE.Value := EditQtd.Value;
              BancoDados.CDSVendaItemTOTAL.Value := (BancoDados.CDSProdutoPRECO.Value * EditQtd.Value);
              BancoDados.CDSVendaItemITEM.Value := item;
              BancoDados.CDSVendaItem.Post;

              with BancoDados.qryAuxiliar do
                begin
                  Close;
                  SQL.Clear;
                  SQL.Add('select COALESCE(sum(total), 0.0) as total from venda_item ' +
                    'where cancelado = 0 and venda_id = ' + IntToStr(BancoDados.CDSVendaVENDA_ID.Value));
                  Open;
                end;
              LBTotal.Caption := FormatFloat('R$ ,0.00', BancoDados.qryAuxiliar.Fields[0].Value);
            except
              Mensagem('Falha ao Tentar inserir um novo Produto!', mtWarning,[mbOk],mrOK,0);
            end;

            EditQtd.Value := 1;
            EditDescricao.Text := '';
            EditCodigo.Text := '';
            EditCodigo.SetFocus;
          finally
            BancoDados.CDSVendaItem.EnableControls;
          end;
        end
      else
        begin
          Mensagem('Informe uma Quantidade maior que zero!', mtWarning,[mbOk],mrOK,0);
          EditQtd.SetFocus;
          Abort;
        end;
    end;
end;

procedure TVendaForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BancoDados.CDSVendaItem.Close;
  BancoDados.CDSVenda.Close;
  BancoDados.VendaConcluida := False;
end;

procedure TVendaForm.FormShow(Sender: TObject);
begin
  if not (Comanda) then
    Action1Execute(Sender)
  else
    begin
      BancoDados.VendaID := BancoDados.CDSVendaVENDA_ID.Value;

      LBVendaID.Caption := FormatFloat('0000000000', BancoDados.VendaID);
      LBCliente.Caption := 'Cliente Balcão';
    end;

  Caption := 'MasterRestaurante - Venda';
  SBPrincipal.Panels[0].Text := ' Empresa: ';
  SBPrincipal.Panels[1].Text := ' Vendedor: ' + BancoDados.qryLoginLOGIN.Value;
  SBPrincipal.Panels[2].Text := ' Data: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',Now);
  EditCodigo.SetFocus;
end;

procedure TVendaForm.BTCancelarItemClick(Sender: TObject);
begin
  try
    if not Assigned(ItemForm) then
      ItemForm := TItemForm.Create(Application);
    BancoDados.CDSVendaItem.DisableControls;

    if (ItemForm.ShowModal = mrOk) then
      begin
        if (ItemForm.EditItem.Value > 0) then
          begin
            BancoDados.CDSVendaItem.Close;
            BancoDados.qryVendaItem.SQL.Text := 'select * from venda_item ' +
              'where cancelado = 0 and item = ' + IntToStr(ItemForm.EditItem.Value) +
              ' and venda_id = ' +
              IntToStr(BancoDados.CDSVendaVENDA_ID.Value);
            BancoDados.CDSVendaItem.Open;

            if (BancoDados.CDSVendaItem.IsEmpty) then
              Mensagem('Item informado inexistente!', mtWarning,[mbOk],mrOK,0)
            else
              begin
                BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
                BancoDados.qryExecute.SQL.Text := 'update venda_item set cancelado = 1' +
                  ' where item = ' + IntToStr(ItemForm.EditItem.Value) + ' and venda_id = ' +
                  IntToStr(BancoDados.CDSVendaVENDA_ID.Value) + ';';
                BancoDados.qryExecute.ExecSQL(true);
                BancoDados.Conexao.Commit(BancoDados.Transacao);
              end;

            BancoDados.CDSVendaItem.Close;
            BancoDados.qryVendaItem.SQL.Text := 'select * from venda_item ' +
              'where venda_id = ' +
              IntToStr((BancoDados.CDSVendaVENDA_ID.Value));
            BancoDados.CDSVendaItem.Open;

            with BancoDados.qryAuxiliar do
              begin
                Close;
                SQL.Clear;
                SQL.Add('select COALESCE(sum(total), 0.0) as total from venda_item ' +
                  'where cancelado = 0 and venda_id = ' + IntToStr(BancoDados.CDSVendaVENDA_ID.Value));
                Open;
              end;
            LBTotal.Caption := FormatFloat('R$ ,0.00', BancoDados.qryAuxiliar.Fields[0].Value);
          end;
      end;
  finally
    ItemForm.Free;
    ItemForm := nil;
    BancoDados.CDSVendaItem.EnableControls;
  end;
end;

procedure TVendaForm.BTCancelarVendaClick(Sender: TObject);
begin
  if (Mensagem('Deseja cancelar esta Venda?', mtConfirmation,[mbYES,mbNO],mrNO,0) = mrYes) then
    begin
      try
        try
          BancoDados.CDSVendaItem.DisableControls;
          BancoDados.qryExecute.SQL.Text := 'delete from venda_item where venda_id = ' +
            IntToStr(BancoDados.VendaID) + ';';
          BancoDados.qryExecute.ExecSQL(True);

          BancoDados.CDSVendaItem.Close;
          BancoDados.CDSVenda.Delete;
          BancoDados.CDSVenda.Close;
          LBVendaID.Caption := '0000000000';
          LBCliente.Caption := '';
          LBTotal.Caption := 'R$ 0,00';
          BancoDados.VendaID := 0;
          if (Comanda) then
            Close
          else
            Action1Execute(Sender);
          Comanda := False;
        finally
          BancoDados.CDSVendaItem.EnableControls;
        end;
      except
        Mensagem('Falha ao tentar Cancelar a Venda!', mtWarning,[mbOk],mrOK,0);
      end;
    end;
end;

procedure TVendaForm.BTFecharVendaClick(Sender: TObject);
begin
  try
    if not Assigned(FinalizadoraForm) then
      FinalizadoraForm := TFinalizadoraForm.Create(Application);
    FinalizadoraForm.ShowModal;
    if (BancoDados.VendaConcluida) then
      begin
        BancoDados.CDSVendaItem.Close;
        BancoDados.CDSVenda.Close;
        LBVendaID.Caption := '0000000000';
        LBCliente.Caption := '';
        LBTotal.Caption := 'R$ 0,00';
        BancoDados.VendaID := 0;

        if (Comanda) then
          Close
        else
          Action1Execute(Sender);
        Comanda := False;
      end
    else
      begin
        Mensagem('Venda não Finalizada!', mtWarning,[mbOk],mrOK,0);
        Abort;
      end;
  finally
    FinalizadoraForm.Free;
    FinalizadoraForm := nil;
  end;
end;

procedure TVendaForm.BTNovaVendaClick(Sender: TObject);
begin
  if (BancoDados.CDSVenda.Active) then
    if ((BancoDados.CDSVendaFECHADO.Value <> 1) and (BancoDados.CDSVendaCANCELADO.Value <> 1)) then
      begin
        Mensagem('Há uma Venda em Aberto na Tela!', mtWarning,[mbOk],mrOK,0);
        Abort;
      end;

  BancoDados.CDSVendaItem.Close;
  BancoDados.qryVendaItem.SQL.Text := 'select * from venda_item where venda_id = 0';
  BancoDados.CDSVendaItem.Open;
  BancoDados.CDSVenda.Close;
  BancoDados.CDSVenda.Open;

  with BancoDados.qryAuxiliar do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select cliente_id from cliente where pessoa_id' +
        ' in(select pessoa_id from pessoa where nome = ' +
        QuotedStr('Cliente Balcão') + ')');
      Open;
    end;

  BancoDados.CDSVenda.Append;
  BancoDados.CDSVendaVENDEDOR_ID.Value := VendedorID;
  BancoDados.VendaID := BancoDados.CDSVendaVENDA_ID.Value;
  BancoDados.CDSVendaCLIENTE_ID.Value := BancoDados.qryAuxiliar.Fields[0].Value;
  BancoDados.CDSVenda.Post;

  BancoDados.CDSVenda.Close;
  BancoDados.qryVenda.SQL.Text := 'select * from venda where venda_id = ' +
    IntToStr(BancoDados.VendaID);
  BancoDados.CDSVenda.Open;

  LBVendaID.Caption := FormatFloat('0000000000', BancoDados.VendaID);
  LBCliente.Caption := 'Cliente Balcão';

  EditCodigo.Text := '';
  EditDescricao.Text := '';
  EditQtd.Value := 0;
  EditCodigo.SetFocus;
end;

procedure TVendaForm.BTSairClick(Sender: TObject);
begin
  Close;
end;

procedure TVendaForm.TimerPrincipalTimer(Sender: TObject);
begin
  SBPrincipal.Panels[2].Text := ' Data: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',Now);
end;

end.
