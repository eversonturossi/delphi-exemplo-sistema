unit ULanMovimentoEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, ExtCtrls, ComCtrls, Mask, DBCtrls, Grids, DBGrids, DB,
  rxToolEdit, RXDBCtrl, Buttons, ActnList, Menus;

type
  TLanMovimentoEstoqueForm = class(TForm)
    AbaSuperior: TPageControl;
    tsConsulta: TTabSheet;
    tsManutencao: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BTPesquisar: THTMLButton;
    CBPesquisar: TComboBox;
    EditPesquisar: TEdit;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    BTInserir: THTMLButton;
    BTAlterar: THTMLButton;
    BTSair: THTMLButton;
    Panel4: TPanel;
    Label5: TLabel;
    DBText1: TDBText;
    DBCheckBox2: TDBCheckBox;
    Panel3: TPanel;
    BTGravar: THTMLButton;
    BTCancelar: THTMLButton;
    BTExcluir: THTMLButton;
    Label28: TLabel;
    CHApenasAtivos: TCheckBox;
    DBDateEdit1: TDBDateEdit;
    DBGItens: TDBGrid;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    DBLUnidadeEstoqueOrigem: TDBLookupComboBox;
    DBLUnidadeEstoqueDestino: TDBLookupComboBox;
    Label4: TLabel;
    Label6: TLabel;
    DBLTipoOperacao: TDBLookupComboBox;
    DBEditFornecedor: TDBEdit;
    BTFornecedor: TSpeedButton;
    DBText2: TDBText;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    CBTipo: TComboBox;
    Action2: TAction;
    PopupMenu1: TPopupMenu;
    ExcluirItem1: TMenuItem;
    PopupMenu2: TPopupMenu;
    DesprocessarLanamento1: TMenuItem;
    ProcessarLanamento1: TMenuItem;
    procedure BTInserirClick(Sender: TObject);
    procedure BTAlterarClick(Sender: TObject);
    procedure BTSairClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure CBPesquisarChange(Sender: TObject);
    procedure EditPesquisarChange(Sender: TObject);
    procedure BTPesquisarClick(Sender: TObject);
    procedure BTGravarClick(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure BTExcluirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure tsConsultaShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tsManutencaoShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTFornecedorClick(Sender: TObject);
    procedure DBEditFornecedorDblClick(Sender: TObject);
    procedure DBGItensColExit(Sender: TObject);
    procedure DBGItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Action1Execute(Sender: TObject);
    procedure DBGItensEditButtonClick(Sender: TObject);
    procedure DBCTipoExit(Sender: TObject);
    procedure CBTipoChange(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure CBTipoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ExcluirItem1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DesprocessarLanamento1Click(Sender: TObject);
    procedure ProcessarLanamento1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LanMovimentoEstoqueForm: TLanMovimentoEstoqueForm;
  MovimentoEstoqueID : Integer;
implementation
uses Base, UFuncoes, UCsFornecedor, UCadOperacaoEstoque, UCadUnidadeEstoque, UCsProduto;
{$R *.dfm}

procedure TLanMovimentoEstoqueForm.Action1Execute(Sender: TObject);
begin
  if (DBLTipoOperacao.Focused) then
    begin
      try
        CriaForm(TCadOperacaoEstoqueForm, CadOperacaoEstoqueForm);
      finally
        BancoDeDados.qryCsOperacaoEstoque.Refresh;
        DBLTipoOperacao.SetFocus;
      end;
    end
  else
    if (DBLUnidadeEstoqueOrigem.Focused) then
      begin
        try
          CriaForm(TCadUnidadeEstoqueForm, CadUnidadeEstoqueForm);
        finally
          BancoDeDados.qryCsUnidadeEstoque.Refresh;
          DBLUnidadeEstoqueOrigem.SetFocus;
        end;
      end
    else
      if (DBLUnidadeEstoqueDestino.Focused) then
        begin
          try
            CriaForm(TCadUnidadeEstoqueForm, CadUnidadeEstoqueForm);
          finally
            BancoDeDados.qryCsUnidadeEstoque.Refresh;
            DBLUnidadeEstoqueDestino.SetFocus;
          end;
        end
      else
        if (AbaSuperior.TabIndex = 0) then
          BTInserirClick(Self);
end;

procedure TLanMovimentoEstoqueForm.Action2Execute(Sender: TObject);
begin
  if ((ActiveControl is TDBGrid) and (DBGItens.SelectedIndex = 0)) then
    DBGItensEditButtonClick(Self)
  else
    BTFornecedorClick(Self);
end;

procedure TLanMovimentoEstoqueForm.BTAlterarClick(Sender: TObject);
begin
  AbaSuperior.ActivePage := tsManutencao;
  DBLTipoOperacao.SetFocus;
end;

procedure TLanMovimentoEstoqueForm.BTCancelarClick(Sender: TObject);
begin
  BancoDeDados.qryCadMovimentoEstoqueItens.Cancel;
  BancoDeDados.qryCadMovimentoEstoque.Cancel;
  BancoDeDados.qryCsMovimentoEstoque.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TLanMovimentoEstoqueForm.BTExcluirClick(Sender: TObject);
begin
  try
    BancoDeDados.qryCadMovimentoEstoque.Delete;
  except on E: EDatabaseError do
      if (Pos('violates foreign key',e.message) > 0) then
        MessageDlg('Não foi possivel excluir este registros.'+#13+
          'Foram localizados lançamentos feitos para este registro.',mtWarning,[mbOK],0);
  end;
  BancoDeDados.qryCsMovimentoEstoque.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TLanMovimentoEstoqueForm.BTFornecedorClick(Sender: TObject);
begin
  try
    if not Assigned(CsFornecedorForm) then
      CsFornecedorForm := TCsFornecedorForm.Create(Application);

    if (TipoOperacao = toInsere) then
      begin
        if not (BancoDeDados.qryCadMovimentoEstoque.State in [dsEdit, dsInsert]) then
          BancoDeDados.qryCadMovimentoEstoque.Edit;
        if (CsFornecedorForm.ShowModal = mrOk) then
          BancoDeDados.qryCadMovimentoEstoqueidfornecedor.Value := BancoDeDados.qryCsFornecedoridfornecedor.Value;
      end;
  finally
    CsFornecedorForm.Release;
    CsFornecedorForm := nil;
  end;
end;
procedure TLanMovimentoEstoqueForm.BTGravarClick(Sender: TObject);
begin
  if not (BancoDeDados.qryCadMovimentoEstoqueprocessado.Value) then
    if (MessageDlg('Deseja Processar este lançamento.',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
      begin
        if (BancoDeDados.qryCadMovimentoEstoque.State in [dsEdit, dsInsert]) then
          BancoDeDados.qryCadMovimentoEstoque.Edit;
        BancoDeDados.qryCadMovimentoEstoqueprocessado.Value := True;
    end;  
  if (BancoDeDados.qryCadMovimentoEstoque.State in [dsEdit, dsInsert]) then
    BancoDeDados.qryCadMovimentoEstoque.Post;
  if (BancoDeDados.qryCadMovimentoEstoqueItens.State in [dsEdit, dsInsert]) then
    BancoDeDados.qryCadMovimentoEstoqueItens.Post;
  AbaSuperior.ActivePage := tsConsulta;
end;

procedure TLanMovimentoEstoqueForm.BTInserirClick(Sender: TObject);
begin
  if not (BancoDeDados.qryCadMovimentoEstoque.Active) then
    BancoDeDados.qryCadMovimentoEstoque.Open;
  if not (BancoDeDados.qryCadMovimentoEstoqueItens.Active) then
    BancoDeDados.qryCadMovimentoEstoqueItens.Open;
  BancoDeDados.qryCadMovimentoEstoque.Append;
  AbaSuperior.ActivePage := tsManutencao;
  DBLTipoOperacao.SetFocus;
end;

procedure TLanMovimentoEstoqueForm.BTPesquisarClick(Sender: TObject);
var
  Campo : ShortString;
begin
  case (CBPesquisar.ItemIndex) of
    0: Campo := 'idmovimento_estoque';
    1: Campo := 'nome';
  end;
  with BancodeDados.qryCsMovimentoEstoque do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from lanmovimento_estoque');
      if (CBPesquisar.ItemIndex in [0]) then
        begin
            if (EditPesquisar.Text <> '') then
              if (TestaInteiro(EditPesquisar.Text)) then
                SQL.Add(' where '+Campo+' = '+EditPesquisar.Text)
              else
                begin
                  MessageDlg('Para este filtro, são permitidos apenas números.',mtWarning,[mbOK],0);
                  EditPesquisar.SetFocus;
                  Abort;
                end;
        end
      else
        SQL.Add('where '+Campo+' ilike '+''''+EditPesquisar.Text+'%'+'''');
      if (CHApenasAtivos.Checked) then
        if (Pos('where',SQL.Text) > 0) then
          SQL.Add(' and ativo = '+QuotedStr('TRUE'))
        else
          SQL.Add(' where ativo = '+QuotedStr('TRUE'));
      SQL.Add('order by '+Campo);
      Open;
    end;
end;

procedure TLanMovimentoEstoqueForm.BTSairClick(Sender: TObject);
begin
  Close;
end;

procedure TLanMovimentoEstoqueForm.CBPesquisarChange(Sender: TObject);
begin
  EditPesquisar.Clear;
  EditPesquisar.SetFocus;
end;

procedure TLanMovimentoEstoqueForm.CBTipoChange(Sender: TObject);
begin
  if not (BancoDeDados.qryCadMovimentoEstoque.State in [dsEdit, dsInsert]) then
    BancoDeDados.qryCadMovimentoEstoque.Edit;
  BancoDeDados.qryCadMovimentoEstoquetipo.Value := CBTipo.ItemIndex;
end;

procedure TLanMovimentoEstoqueForm.CBTipoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (KEY = vk_Return) Then
    begin
      DBGItens.SelectedIndex := 0;
    end;
end;

procedure TLanMovimentoEstoqueForm.DBCTipoExit(Sender: TObject);
begin
  DBGItens.SetFocus;
end;

procedure TLanMovimentoEstoqueForm.DBEditFornecedorDblClick(Sender: TObject);
begin
  BTFornecedorClick(Self);
end;

procedure TLanMovimentoEstoqueForm.DBGrid1DblClick(Sender: TObject);
begin
  BTAlterarClick(Self);
end;

procedure TLanMovimentoEstoqueForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (BancoDeDados.qryCsMovimentoEstoqueprocessado.Value) then
    DBGrid1.Canvas.Font.Color:= clGreen;
  if (DBGrid1.SelectedRows.CurrentRowSelected) then
    DBGrid1.Canvas.Font.Color := clWhite;
  DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[datacol].field, State);
end;

procedure TLanMovimentoEstoqueForm.DesprocessarLanamento1Click(Sender: TObject);
begin
  if (BancoDeDados.qryCsMovimentoEstoqueprocessado.Value) then
    begin
      try
        with BancoDeDados.qryCadMovimentoEstoque do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select * from lanmovimento_estoque where idmovimento_estoque = '+
                IntToStr(BancoDeDados.qryCsMovimentoEstoqueidmovimento_estoque.Value));
            Open;
            Edit;
          end;
        BancoDeDados.qryCadMovimentoEstoqueprocessado.Value := False;
        BancoDeDados.qryCadMovimentoEstoque.Post;
        BancoDeDados.qryCsMovimentoEstoque.Refresh;
      except
        MessageDlg('Erro ao tentar Desprocessar o Lançamento.',mtWarning,[mbOK],0);
      end;
    end
  else
    begin
       MessageDlg('O Lançamento ainda não foi Processado.',mtWarning,[mbOK],0);
       Abort;
    end;
end;

procedure TLanMovimentoEstoqueForm.DBGItensColExit(Sender: TObject);
var
  Consulta : ShortString;
  Calcula : Boolean;
begin
  Consulta := '';
  Calcula := False;
  if (DBGItens.SelectedIndex in [0,2]) and not (BancoDeDados.qryCadMovimentoEstoqueItensidproduto.IsNull) then
    begin
      Calcula := True;
      Consulta := ' where idproduto = ' + IntToStr(BancoDeDados.qryCadMovimentoEstoqueItensidproduto.Value);
    end
  else
    if (DBGItens.SelectedIndex = 1) and (BancoDeDados.qryCadMovimentoEstoqueItensreferencia.Value <> '')  then
      begin
        Calcula := True;
        Consulta := ' where referencia = ' + QuotedStr(BancoDeDados.qryCadMovimentoEstoqueItensreferencia.Value);
      end;

  if (Calcula) then
    begin
        with BancoDeDados.qryCsProduto do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select * from cadproduto');
            if (Pos('where',Consulta) > 0) then
              SQL.Add(Consulta);
            Open;
          end;
        if not (BancoDeDados.qryCsProduto.IsEmpty) then
          begin
            if not (BancoDeDados.qryCadMovimentoEstoqueItens.State in [dsEdit, dsInsert]) then
               BancoDeDados.qryCadMovimentoEstoqueItens.Edit;
            BancoDeDados.qryCadMovimentoEstoqueItensidproduto.Value := BancoDeDados.qryCsProdutoidproduto.Value;
            BancoDeDados.qryCadMovimentoEstoqueItensreferencia.Value := BancoDeDados.qryCsProdutoreferencia.Value;
            BancoDeDados.qryCadMovimentoEstoqueItensdescricao.Value := BancoDeDados.qryCsProdutodescricao.Value;
            BancoDeDados.qryCadMovimentoEstoqueItensunidade.Value := BancoDeDados.qryCsProdutounidade_venda.Value;

            if not (DBGItens.SelectedIndex in [5]) then
              begin
                  with BancoDeDados.qryCsPreco do
                    begin
                      Close;
                      SQL.Clear;
                      SQL.Add('select * from cadpreco where tipo = 1 and idproduto = ' +
                        IntToStr(BancoDeDados.qryCadMovimentoEstoqueItensidproduto.Value));
                      Open;
                    end;

                  if not (BancoDeDados.qryCsPreco.IsEmpty) then
                    BancoDeDados.qryCadMovimentoEstoqueItenspreco_unitario.Value := BancoDeDados.qryCsPrecopreco_venda.Value
                  else
                    BancoDeDados.qryCadMovimentoEstoqueItenspreco_unitario.Value := 0;
              end;
          end
        else
          begin
            MessageDlg('Produto não encontrado.',mtWarning,[mbOK],0);
            Abort;
          end;
    end;
end;

procedure TLanMovimentoEstoqueForm.DBGItensEditButtonClick(Sender: TObject);
begin
  try
    if not Assigned(CsProdutoForm) then
      CsProdutoForm := TCsProdutoForm.Create(Application);
    if (CsProdutoForm.ShowModal = mrOk) then
      begin
        if not (BancoDeDados.qryCadMovimentoEstoqueItens.State in [dsEdit, dsInsert]) then
          BancoDeDados.qryCadMovimentoEstoqueItens.Edit;
        BancoDeDados.qryCadMovimentoEstoqueItensidproduto.Value := BancoDeDados.qryCsProdutoidproduto.Value;
      end;
  finally
    CsProdutoForm.Release;
    CsProdutoForm := nil;
  end;
end;

procedure TLanMovimentoEstoqueForm.DBGItensKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (KEY = vk_Return) Then
    if (DBGItens.SelectedIndex = 6) then
      begin
        BancoDeDados.qryCadMovimentoEstoqueItens.Append;
        DBGItens.SelectedIndex := 0;
      end
    else
      DBGItens.SelectedIndex := DBGItens.SelectedIndex + 1;
end;

procedure TLanMovimentoEstoqueForm.EditPesquisarChange(Sender: TObject);
begin
  BTPesquisarClick(Self);
end;

procedure TLanMovimentoEstoqueForm.ExcluirItem1Click(Sender: TObject);
begin
  if not (BancoDeDados.qryCadMovimentoEstoqueItens.IsEmpty) then
    begin
      BancoDeDados.qryCadMovimentoEstoqueItens.Delete;
      BancoDeDados.qryCadMovimentoEstoqueItens.Refresh;
    end;
end;

procedure TLanMovimentoEstoqueForm.FormCreate(Sender: TObject);
begin
  AbaSuperior.ActivePage := tsConsulta;
  CHApenasAtivos.Checked := True;
end;

procedure TLanMovimentoEstoqueForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) and not (ActiveControl is TDBGrid) then
    begin
      Key := #0;
      Perform(WM_NEXTDLGCTL,0,0);
    end;
  if (key = #27) and not (ActiveControl is TDBGrid) then
    begin
      key := #0;
      Close;
    end;
end;

procedure TLanMovimentoEstoqueForm.FormShow(Sender: TObject);
begin
  AbreTabela(BancoDeDados.qryCsOperacaoEstoque,'cadoperacao_estoque');
  AbreTabela(BancoDeDados.qryCsUnidadeEstoque,'cadunidade_estoque');

  if (Parametro(BancoDeDados.qryCsParametros, 2, 1, 'NAO') = 'SIM') then
    DBGItens.Columns[5].ReadOnly := False
  else
    DBGItens.Columns[5].ReadOnly := True;
end;

procedure TLanMovimentoEstoqueForm.ProcessarLanamento1Click(Sender: TObject);
begin
  if not (BancoDeDados.qryCsMovimentoEstoqueprocessado.Value) then
    begin
      try
        with BancoDeDados.qryCadMovimentoEstoque do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select * from lanmovimento_estoque where idmovimento_estoque = '+
                IntToStr(BancoDeDados.qryCsMovimentoEstoqueidmovimento_estoque.Value));
            Open;
            Edit;
          end;
        BancoDeDados.qryCadMovimentoEstoqueprocessado.Value := True;
        BancoDeDados.qryCadMovimentoEstoque.Post;
        BancoDeDados.qryCsMovimentoEstoque.Refresh;
      except
        MessageDlg('Erro ao tentar Desprocessar o Lançamento.',mtWarning,[mbOK],0);
      end;
    end
  else
    begin
       MessageDlg('Lançamento já Processado.',mtWarning,[mbOK],0);
       Abort;
    end;
end;

procedure TLanMovimentoEstoqueForm.tsConsultaShow(Sender: TObject);
begin
  BTPesquisarClick(Self);
  EditPesquisar.SetFocus;
end;

procedure TLanMovimentoEstoqueForm.tsManutencaoShow(Sender: TObject);
begin
  if not (BancodeDados.qryCadMovimentoEstoque.State in [dsInsert]) then
    begin
      with BancoDeDados.qryCadMovimentoEstoque do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from lanmovimento_estoque where idmovimento_estoque = '+
              IntToStr(BancoDeDados.qryCsMovimentoEstoqueidmovimento_estoque.Value));
          Open;
          Edit;
        end;
      with BancoDeDados.qryCadMovimentoEstoqueItens do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from lanmovimento_estoque_itens where idmovimento_estoque = '+
              IntToStr(BancoDeDados.qryCsMovimentoEstoqueidmovimento_estoque.Value));
          Open;
        end;
    end;
end;

end.
