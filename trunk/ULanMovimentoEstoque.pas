unit ULanMovimentoEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, ExtCtrls, ComCtrls, Mask, DBCtrls, Grids, DBGrids, DB,
  rxToolEdit, RXDBCtrl, Buttons;

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
    DBCTipo: TDBComboBox;
    Label9: TLabel;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LanMovimentoEstoqueForm: TLanMovimentoEstoqueForm;
  MovimentoEstoqueID : Integer;
implementation
uses Base, UFuncoes, UCsFornecedor;
{$R *.dfm}

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
  BancoDeDados.qryCadMovimentoEstoque.Post;
  if (BancoDeDados.qryCadMovimentoEstoqueItens.State in [dsEdit, dsInsert]) then
    BancoDeDados.qryCadMovimentoEstoqueItens.Post;
  AbaSuperior.ActivePage := tsConsulta;
end;

procedure TLanMovimentoEstoqueForm.BTInserirClick(Sender: TObject);
begin
  if not (BancoDeDados.qryCadMovimentoEstoque.Active) then
    BancoDeDados.qryCadMovimentoEstoque.Open;
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

procedure TLanMovimentoEstoqueForm.DBEditFornecedorDblClick(Sender: TObject);
begin
  BTFornecedorClick(Self);
end;

procedure TLanMovimentoEstoqueForm.DBGrid1DblClick(Sender: TObject);
begin
  BTAlterarClick(Self);
end;

procedure TLanMovimentoEstoqueForm.DBGItensColExit(Sender: TObject);
begin
  if (DBGItens.SelectedIndex = 0) then
    begin
      if (BancoDeDados.qryCadMovimentoEstoqueItensidproduto.Value > 0) then
        begin
          with BancoDeDados.qryCsProduto do
            begin
              Close;
              SQL.Clear;
              SQL.Add('select * from cadproduto where idproduto = ' +
                IntToStr(BancoDeDados.qryCadMovimentoEstoqueItensidproduto.Value));
              Open;
            end;
          if not (BancoDeDados.qryCsProduto.IsEmpty) then
            begin
              if not (BancoDeDados.qryCadMovimentoEstoqueItens.State in [dsEdit, dsInsert]) then
                 BancoDeDados.qryCadMovimentoEstoqueItens.Edit;
              BancoDeDados.qryCadMovimentoEstoqueItensidproduto.Value := BancoDeDados.qryCsProdutoidproduto.Value;
              BancoDeDados.qryCadMovimentoEstoqueItensunidade.Value := BancoDeDados.qryCsProdutounidade_venda.Value;
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
            end
          else
            begin
              MessageDlg('Produto não encontrado.',mtWarning,[mbOK],0);
              Abort;
            end;
        end;
    end;                                                              
end;

procedure TLanMovimentoEstoqueForm.DBGItensKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (KEY = vk_Return) Then
   DBGItens.SelectedIndex := DBGItens.SelectedIndex + 1;
end;

procedure TLanMovimentoEstoqueForm.EditPesquisarChange(Sender: TObject);
begin
  BTPesquisarClick(Self);
end;

procedure TLanMovimentoEstoqueForm.FormCreate(Sender: TObject);
begin
  AbaSuperior.ActivePage := tsConsulta;
  CHApenasAtivos.Checked := True;
end;

procedure TLanMovimentoEstoqueForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    begin
      Key := #0;
      Perform(WM_NEXTDLGCTL,0,0);
    end;
  if (key = #27) then
    begin
      key := #0;
      Close;
    end;
end;

procedure TLanMovimentoEstoqueForm.FormShow(Sender: TObject);
begin
  AbreTabela(BancoDeDados.qryCsOperacaoEstoque,'cadoperacao_estoque');
  AbreTabela(BancoDeDados.qryCsUnidadeEstoque,'cadunidade_estoque');
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
