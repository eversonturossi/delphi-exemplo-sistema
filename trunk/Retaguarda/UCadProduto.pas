unit UCadProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, ExtCtrls, ComCtrls, Mask, DBCtrls, Grids, DBGrids, DB,
  Tabs, Buttons, rxToolEdit, RXDBCtrl, Menus, rxCurrEdit;

type
  TCadProdutoForm = class(TForm)
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
    tsPrincipal: TTabSet;
    NBManutencao: TNotebook;
    DBEditNome: TDBEdit;
    Label3: TLabel;
    DBEditGrupo: TDBEdit;
    DBEditSubGrupo: TDBEdit;
    DBEdit6: TDBEdit;
    DBEditClassificacao: TDBEdit;
    DBEditUnidadecompra: TDBEdit;
    Label4: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label28: TLabel;
    CHApenasAtivos: TCheckBox;
    BTGrupo: TSpeedButton;
    BTSubGrupo: TSpeedButton;
    BTClassificacao: TSpeedButton;
    GroupBox1: TGroupBox;
    GroupBox4: TGroupBox;
    Label26: TLabel;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    Label29: TLabel;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    DBDateEdit1: TDBDateEdit;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    DBGrid2: TDBGrid;
    PMenuFornecedor: TPopupMenu;
    Adicionar1: TMenuItem;
    DBGrid3: TDBGrid;
    PMenuLocalizacao: TPopupMenu;
    Excluir1: TMenuItem;
    Adicionar2: TMenuItem;
    Excluir2: TMenuItem;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    BTUnidadecompra: TSpeedButton;
    DBEditUnidadeVenda: TDBEdit;
    BTUnidadeVenda: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBEdit14: TDBEdit;
    Label12: TLabel;
    DBEdit2: TDBEdit;
    Label14: TLabel;
    DBEdit8: TDBEdit;
    Label17: TLabel;
    DBEdit10: TDBEdit;
    Label24: TLabel;
    Label11: TLabel;
    DBEdit3: TDBEdit;
    Label13: TLabel;
    DBEdit5: TDBEdit;
    Label15: TLabel;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    Shape1: TShape;
    Label22: TLabel;
    BTPrecoAtacado: TSpeedButton;
    Label23: TLabel;
    BTPrecoVarejo: TSpeedButton;
    Label30: TLabel;
    Label31: TLabel;
    DBEdit4: TDBEdit;
    DBEdit7: TDBEdit;
    Label25: TLabel;
    DBEdit17: TDBEdit;
    Label32: TLabel;
    Label27: TLabel;
    DBEdit18: TDBEdit;
    Label33: TLabel;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    Label34: TLabel;
    GroupBox2: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    EditPrecoAtacado: TCurrencyEdit;
    EditPrecoVarejo: TCurrencyEdit;
    procedure BTInserirClick(Sender: TObject);
    procedure BTAlterarClick(Sender: TObject);
    procedure BTSairClick(Sender: TObject);
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
    procedure tsPrincipalClick(Sender: TObject);
    procedure BTGrupoClick(Sender: TObject);
    procedure BTSubGrupoClick(Sender: TObject);
    procedure DBEditGrupoDblClick(Sender: TObject);
    procedure DBEditSubGrupoDblClick(Sender: TObject);
    procedure BTClassificacaoClick(Sender: TObject);
    procedure DBEditGrupoExit(Sender: TObject);
    procedure DBEditSubGrupoExit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEditClassificacaoExit(Sender: TObject);
    procedure DBEditClassificacaoDblClick(Sender: TObject);
    procedure Adicionar1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure Adicionar2Click(Sender: TObject);
    procedure Excluir2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BTUnidadecompraClick(Sender: TObject);
    procedure DBEditUnidadecompraDblClick(Sender: TObject);
    procedure DBEditUnidadecompraExit(Sender: TObject);
    procedure BTUnidadeVendaClick(Sender: TObject);
    procedure DBEditUnidadeVendaDblClick(Sender: TObject);
    procedure DBEditUnidadeVendaExit(Sender: TObject);
    procedure BTPrecoAtacadoClick(Sender: TObject);
    procedure BTPrecoVarejoClick(Sender: TObject);
    procedure EditPrecoAtacadoDblClick(Sender: TObject);
    procedure EditPrecoVarejoDblClick(Sender: TObject);

  private
    PrecoAtacado, PrecoVarejo : Currency;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadProdutoForm: TCadProdutoForm;
  ProdutoID : Integer;

implementation
uses Base, UCsGrupo, UCsSubGrupo, UCadLocalizacao, UCsClassificacao, UFuncoes,
      UCsFornecedor, UCsUnidade, ULanPreco;
{$R *.dfm}

procedure TCadProdutoForm.Adicionar1Click(Sender: TObject);
var
  i : Integer;
begin
  try
    if not Assigned(CsFornecedorForm) then
      CsFornecedorForm := TCsFornecedorForm.Create(Application);

    if (TipoOperacao = toInsere) then
      begin
        i := BancoDeDados.qryCadprodutoidproduto.Value;
        BancoDeDados.qryCadproduto.Post;
        if not (BancoDeDados.qryCadproduto.State in [dsEdit, dsInsert]) then
          BancoDeDados.qryCadproduto.Edit;
        BancoDeDados.qryCadproduto.RecNo := i;
      end;

    if (CsFornecedorForm.ShowModal = mrOk) then
      begin
        BancoDeDados.ProcScripts.Script.Text := 'insert into cadproduto_fornecedor(idproduto,idfornecedor)values'+
          '(' + QuotedStr(IntToStr(BancoDeDados.qryCadprodutoidproduto.Value)) + ',' +
          QuotedStr(IntToStr(BancoDeDados.qryCsFornecedoridfornecedor.Value))+');';
        BancoDeDados.ProcScripts.Execute;
        with BancoDeDados.qryCsProdutoFornecedor do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select * from cadproduto_fornecedor where idproduto = ' +
                IntToStr(BancoDeDados.qryCadprodutoidproduto.Value));
            Open;
          end;
      end;
  finally
    CsFornecedorForm.Release;
    CsFornecedorForm := nil;
  end;
end;

procedure TCadProdutoForm.Adicionar2Click(Sender: TObject);
var
 i : Integer;
begin
 try
    if not Assigned(CadLocalizacaoForm) then
      CadLocalizacaoForm := TCadLocalizacaoForm.Create(Application);
    if (TipoOperacao = toInsere) then
      begin
        i := BancoDeDados.qryCadprodutoidproduto.Value;
        BancoDeDados.qryCadproduto.Post;
        if not (BancoDeDados.qryCadproduto.State in [dsEdit, dsInsert]) then
          BancoDeDados.qryCadproduto.Edit;
        BancoDeDados.qryCadproduto.RecNo := i;
      end;

    with BancoDeDados.qryCsLocalizacao do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from cadLocalizacao where idproduto = '+
            IntToStr(BancoDeDados.qryCadprodutoidproduto.Value));
        Open;
      end;
    CadLocalizacaoForm.ShowModal;
  finally
    CadLocalizacaoForm.Release;
    CadLocalizacaoForm := nil;
  end;
end;

procedure TCadProdutoForm.BTAlterarClick(Sender: TObject);
begin
  TipoOperacao := toAltera;
  AbaSuperior.ActivePage := tsManutencao;
  NBManutencao.ActivePage := 'Principal';
  tsPrincipal.TabIndex := NBManutencao.PageIndex;
  DBEditNome.SetFocus;
end;

procedure TCadProdutoForm.BTCancelarClick(Sender: TObject);
begin
  if (TipoOperacao = toInsere) then
    BTExcluirClick(Self)
  else
    begin
      BancoDeDados.qryCadProduto.Cancel;
      BancoDeDados.qryCsProduto.Refresh;
      AbaSuperior.ActivePage := tsConsulta;
      EditPesquisar.SetFocus;
    end;
end;

procedure TCadProdutoForm.BTClassificacaoClick(Sender: TObject);
begin
  try
    if not Assigned(CsClassificacaoForm) then
      CsClassificacaoForm := TCsClassificacaoForm.Create(Application);
    if (CsClassificacaoForm.ShowModal = mrOk) then
      BancodeDados.qryCadProdutoIDCLASSIFICACAO.Value := BancodeDados.qryCsClassificacaoIDCLASSIFICACAO.Value;
    DBEditClassificacao.SetFocus;
  finally
    CsClassificacaoForm.Release;
    CsClassificacaoForm := nil;
  end;
end;

procedure TCadProdutoForm.BTExcluirClick(Sender: TObject);
begin
  try
    with BancoDeDados.qryCsProdutoFornecedor do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from cadproduto_fornecedor where idproduto = ' +
            IntToStr(BancoDeDados.qryCadprodutoidproduto.Value));
        Open;
      end;
    if not (BancoDeDados.qryCsProdutoFornecedor.IsEmpty) then
      begin
        BancoDeDados.ProcScripts.Script.Text := 'delete from cadproduto_fornecedor where ' +
            ' idproduto = ' + QuotedStr(IntToStr(BancoDeDados.qryCadprodutoidproduto.Value)) + ';';
        BancoDeDados.ProcScripts.Execute;
      end;

    with BancoDeDados.qryCsLocalizacao do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from cadLocalizacao where idproduto = '+
           IntToStr(BancoDeDados.qryCadprodutoidproduto.Value));
        Open;
      end;
    if not (BancoDeDados.qryCsLocalizacao.IsEmpty) then
      begin
        BancoDeDados.ProcScripts.Script.Text := 'delete from cadLocalizacao where ' +
            ' idproduto = ' + QuotedStr(IntToStr(BancoDeDados.qryCadprodutoidproduto.Value)) + ';';
        BancoDeDados.ProcScripts.Execute;
      end;

    with BancoDeDados.qryCsPreco do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from cadpreco where tipo = 1 and idproduto = '+
            IntToStr(BancoDeDados.qryCadProdutoidproduto.Value));
        Open;
      end;
    if not (BancoDeDados.qryCsPreco.IsEmpty) then
      begin
        BancoDeDados.ProcScripts.Script.Text := 'delete from cadLocalizacao where ' +
            ' idproduto = ' + QuotedStr(IntToStr(BancoDeDados.qryCadprodutoidproduto.Value)) + ';';
        BancoDeDados.ProcScripts.Execute;
      end;

    BancoDeDados.qryCadProduto.Delete;

  except on E: EDatabaseError do
      if (Pos('violates foreign key',e.message) > 0) then
        MessageDlg('Não foi possivel excluir este registros.'+#13+
          'Foram localizados lançamentos feitos para este registro.',mtWarning,[mbOK],0);
  end;
  BancoDeDados.qryCsProduto.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadProdutoForm.BTGravarClick(Sender: TObject);
var
  PrecoID : Integer;
begin
  if not (BancoDeDados.qryCadproduto.State in [dsEdit, dsInsert]) then
    BancoDeDados.qryCadproduto.Edit;
  BancoDeDados.qryCadProduto.Post;

  if (EditPrecoAtacado.Value <> PrecoAtacado) then
    begin
      with BancoDeDados.qryCadPreco do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from cadpreco where tipo = 0 and idproduto = '+
               IntToStr(BancoDeDados.qryCadProdutoidproduto.Value));
          Open;
        end;
      if not (BancoDeDados.qryCadPreco.IsEmpty) then
        begin
           if not (BancoDeDados.qryCadPreco.State in [dsEdit]) then
              BancoDeDados.qryCadPreco.Edit;
           BancoDeDados.qryCadPrecopreco_venda.Value := EditPrecoAtacado.Value;
        end
      else
        begin
           PrecoID := 0;
           PrecoID := GeraSequenciador(BancoDeDados.qryCsSequenciador, 'cadpreco', 'idpreco');
           BancoDeDados.ProcScripts.Script.Text := 'insert into cadpreco(idpreco, idproduto,tipo,preco_venda)values(' +
             QuotedStr(IntToStr(PrecoID))   + ','                                            +
             QuotedStr(IntToStr(BancoDeDados.qryCadprodutoidproduto.Value)) + ','            +
             QuotedStr('0')  + ','                                                           +
             QuotedStr(CurrToStr(EditPrecoAtacado.Value))+ ');';
           BancoDeDados.ProcScripts.Execute;
           GravaSequenciador(BancoDeDados.Conexao, 'cadpreco', 'idpreco', PrecoID);
        end;
    end;

    if (EditPrecoVarejo.Value <> PrecoVarejo) then
      begin
        with BancoDeDados.qryCadPreco do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select * from cadpreco where tipo = 1 and idproduto = '+
                 IntToStr(BancoDeDados.qryCadProdutoidproduto.Value));
            Open;
          end;
        if not (BancoDeDados.qryCadPreco.IsEmpty) then
          begin
             if not (BancoDeDados.qryCadPreco.State in [dsEdit]) then
                BancoDeDados.qryCadPreco.Edit;
             BancoDeDados.qryCadPrecopreco_venda.Value := EditPrecoVarejo.Value;
          end
        else
          begin
             PrecoID := 0;
             PrecoID := GeraSequenciador(BancoDeDados.qryCsSequenciador, 'cadpreco', 'idpreco');
             BancoDeDados.ProcScripts.Script.Text := 'insert into cadpreco(idpreco, idproduto,tipo,preco_venda)values(' +
               QuotedStr(IntToStr(PrecoID))   + ','                                            +
               QuotedStr(IntToStr(BancoDeDados.qryCadprodutoidproduto.Value)) + ','            +
               QuotedStr('1')  + ','                                                           +
               QuotedStr(CurrToStr(EditPrecoVarejo.Value))+ ');';
             BancoDeDados.ProcScripts.Execute;
             GravaSequenciador(BancoDeDados.Conexao, 'cadpreco', 'idpreco', PrecoID);
          end;
      end;
  TipoPreco := poNenhum;
  AbaSuperior.ActivePage := tsConsulta;
end;

procedure TCadProdutoForm.BTGrupoClick(Sender: TObject);
begin
  try
    if not Assigned(CsGrupoForm) then
      CsGrupoForm := TCsGrupoForm.Create(Application);
    if (CsGrupoForm.ShowModal = mrOk) then
      BancodeDados.qryCadProdutoIDGRUPO.Value := BancodeDados.qryCsGrupoIDGRUPO.Value;
    DBEditGrupo.SetFocus;
  finally
    CsGrupoForm.Release;
    CsGrupoForm := nil;
  end;
end;

procedure TCadProdutoForm.BTInserirClick(Sender: TObject);
begin
  TipoOperacao := toInsere;
  if not (BancoDeDados.qryCadProduto.Active) then
    BancoDeDados.qryCadProduto.Open;
  BancoDeDados.qryCadProduto.Append;
  AbaSuperior.ActivePage := tsManutencao;
  NBManutencao.ActivePage := 'Principal';
  DBEditNome.SetFocus;
end;

procedure TCadProdutoForm.BTPesquisarClick(Sender: TObject);
var
  Campo : ShortString;
begin
  case (CBPesquisar.ItemIndex) of
    0: Campo := 'idproduto';
    1: Campo := 'descricao';
    2: Campo := 'descricao_reduzida';
    3: Campo := 'referencia';
  end;
  with BancodeDados.qryCsProduto do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from cadproduto');
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
        if (CBPesquisar.ItemIndex in [4]) then
          begin
             if (EditPesquisar.Text <> '') then
                SQL.Add(' where '+Campo+' = '+EditPesquisar.Text);
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

procedure TCadProdutoForm.BTPrecoAtacadoClick(Sender: TObject);
var
  i, PrecoID : Integer;
begin
  try
    TipoPreco := poAtacado;
    if not Assigned(LancPrecoForm) then
      LancPrecoForm := TLancPrecoForm.Create(Application);

    if (TipoOperacao = toInsere) then
      begin
        i := BancoDeDados.qryCadprodutoidproduto.Value;
        BancoDeDados.qryCadproduto.Post;
        if not (BancoDeDados.qryCadproduto.State in [dsEdit, dsInsert]) then
          BancoDeDados.qryCadproduto.Edit;
        BancoDeDados.qryCadproduto.RecNo := i;
      end;

    with BancoDeDados.qryCadPreco do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from cadpreco where tipo = 0 and idproduto = '+
            IntToStr(BancoDeDados.qryCadProdutoidproduto.Value));
        Open;
      end;

    if not (BancoDeDados.qryCadPreco.IsEmpty) then
      BancoDeDados.qryCadPreco.Edit
    else
      begin
        PrecoID := 0;
        PrecoID := GeraSequenciador(BancoDeDados.qryCsSequenciador, 'cadpreco', 'idpreco');
        BancoDeDados.ProcScripts.Script.Text := 'insert into cadpreco(idpreco, idproduto,tipo)values(' +
          QuotedStr(IntToStr(PrecoID))   + ','                                            +
          QuotedStr(IntToStr(BancoDeDados.qryCadprodutoidproduto.Value)) + ','            +
          QuotedStr('0')                                                        + ');';
        BancoDeDados.ProcScripts.Execute;
        GravaSequenciador(BancoDeDados.Conexao, 'cadpreco', 'idpreco', PrecoID);
      end;

    LancPrecoForm.ShowModal;

    if (LancPrecoForm.ModalResult = mrOk) then
      begin
        if (BancoDeDados.qryCadPrecoPRECO_VENDA.Value > 0) then
          begin
            EditPrecoAtacado.Value := BancoDeDados.qryCadPrecoPRECO_VENDA.Value;
            BancoDeDados.qryCadPreco.Post;
          end;
      end
    else
      EditPrecoAtacado.Value := PrecoAtacado;

  finally
    LancPrecoForm.Release;
    LancPrecoForm := nil;
    TipoPreco := poNenhum;
  end;
end;

procedure TCadProdutoForm.BTPrecoVarejoClick(Sender: TObject);
var
  i, PrecoID : Integer;
begin
  try
    TipoPreco := poVarejo;
    if not Assigned(LancPrecoForm) then
      LancPrecoForm := TLancPrecoForm.Create(Application);

    if (TipoOperacao = toInsere) then
      begin
        i := BancoDeDados.qryCadprodutoidproduto.Value;
        BancoDeDados.qryCadproduto.Post;
        if not (BancoDeDados.qryCadproduto.State in [dsEdit, dsInsert]) then
          BancoDeDados.qryCadproduto.Edit;
        BancoDeDados.qryCadproduto.RecNo := i;
      end;

    with BancoDeDados.qryCadPreco do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from cadpreco where tipo = 1 and idproduto = '+
            IntToStr(BancoDeDados.qryCadProdutoidproduto.Value));
        Open;
      end;

    if not (BancoDeDados.qryCadPreco.IsEmpty) then
      BancoDeDados.qryCadPreco.Edit
    else
      begin
        PrecoID := 0;
        PrecoID := GeraSequenciador(BancoDeDados.qryCsSequenciador, 'cadpreco', 'idpreco');
        BancoDeDados.ProcScripts.Script.Text := 'insert into cadpreco(idpreco, idproduto,tipo)values(' +
          QuotedStr(IntToStr(PrecoID))   + ','                                            +
          QuotedStr(IntToStr(BancoDeDados.qryCadprodutoidproduto.Value)) + ','            +
          QuotedStr('1')                                                        + ');';
        BancoDeDados.ProcScripts.Execute;
        GravaSequenciador(BancoDeDados.Conexao, 'cadpreco', 'idpreco', PrecoID);
      end;

    LancPrecoForm.ShowModal;

    if (LancPrecoForm.ModalResult = mrOk) then
      begin
        if (BancoDeDados.qryCadPrecoPRECO_VENDA.Value > 0) then
          begin
            EditPrecoVarejo.Value := BancoDeDados.qryCadPrecoPRECO_VENDA.Value;
            BancoDeDados.qryCadPreco.Post;
          end
      end
    else
      EditPrecoVarejo.Value := PrecoVarejo;

  finally
    LancPrecoForm.Release;
    LancPrecoForm := nil;
    TipoPreco := poNenhum;
  end;
end;

procedure TCadProdutoForm.BTSairClick(Sender: TObject);
begin
  Close;
end;

procedure TCadProdutoForm.BTSubGrupoClick(Sender: TObject);
begin
  try
    if not Assigned(CsSubGrupoForm) then
      CsSubGrupoForm := TCsSubGrupoForm.Create(Application);
    if (CsSubGrupoForm.ShowModal = mrOk) then
      BancodeDados.qryCadProdutoIDSUBGRUPO.Value := BancodeDados.qryCsSubGrupoIDSUBGRUPO.Value;
    DBEditSubGrupo.SetFocus;
  finally
    CsSubGrupoForm.Release;
    CsSubGrupoForm := nil;
  end;
end;

procedure TCadProdutoForm.BTUnidadecompraClick(Sender: TObject);
begin
  try
    if not Assigned(CsUnidadeForm) then
      CsUnidadeForm := TCsUnidadeForm.Create(Application);
    if (CsUnidadeForm.ShowModal = mrOk) then
      BancodeDados.qryCadProdutoUNIDADE_COMPRA.Value := BancodeDados.qryCsUnidadeABREVIACAO.Value;
    DBEditUnidadeCompra.SetFocus;
  finally
    CsUnidadeForm.Release;
    CsUnidadeForm := nil;
  end;
end;

procedure TCadProdutoForm.BTUnidadeVendaClick(Sender: TObject);
begin
  try
    if not Assigned(CsUnidadeForm) then
      CsUnidadeForm := TCsUnidadeForm.Create(Application);
    if (CsUnidadeForm.ShowModal = mrOk) then
      BancodeDados.qryCadProdutoUNIDADE_VENDA.Value := BancodeDados.qryCsUnidadeABREVIACAO.Value;
    DBEditUnidadeVenda.SetFocus;
  finally
    CsUnidadeForm.Release;
    CsUnidadeForm := nil;
  end;
end;

procedure TCadProdutoForm.CBPesquisarChange(Sender: TObject);
begin
  EditPesquisar.Clear;
  EditPesquisar.SetFocus;
end;

procedure TCadProdutoForm.DBEditClassificacaoDblClick(Sender: TObject);
begin
  BTClassificacaoClick(Self);
end;

procedure TCadProdutoForm.DBEditClassificacaoExit(Sender: TObject);
begin
  if (BancoDeDados.qryCadprodutoidclassificacao.Value > 0) then
    begin
      with BancodeDados.qryCsClassificacao do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from cadclassificacao');
          SQL.Add('where idclassificacao = '+IntToStr(BancoDeDados.qryCadprodutoidclassificacao.Value));
          Open;
        end;
    end;
end;

procedure TCadProdutoForm.DBEditGrupoDblClick(Sender: TObject);
begin
  BTGrupoClick(Self);
end;

procedure TCadProdutoForm.DBEditGrupoExit(Sender: TObject);
begin
  if (BancoDeDados.qryCadprodutoidgrupo.Value > 0) then
    begin
      with BancodeDados.qryCsGrupo do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from cadgrupo');
          SQL.Add('where idgrupo = '+IntToStr(BancoDeDados.qryCadprodutoidgrupo.Value));
          Open;
        end;
    end;
end;

procedure TCadProdutoForm.DBEditSubGrupoDblClick(Sender: TObject);
begin
  BTSubGrupoClick(Self);
end;

procedure TCadProdutoForm.DBEditSubGrupoExit(Sender: TObject);
begin
  if (BancoDeDados.qryCadprodutoidsubgrupo.Value > 0) then
    begin
      with BancodeDados.qryCsSubGrupo do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from cadsubgrupo');
          SQL.Add('where idsubgrupo = '+IntToStr(BancoDeDados.qryCadprodutoidsubgrupo.Value));
          Open;
        end;
    end;
end;

procedure TCadProdutoForm.DBEditUnidadecompraDblClick(Sender: TObject);
begin
  BTUnidadeCompraClick(Self);
end;

procedure TCadProdutoForm.DBEditUnidadecompraExit(Sender: TObject);
begin
  if (BancoDeDados.qryCadprodutounidade_compra.Value <> '') or (BancoDeDados.qryCadprodutounidade_compra.IsNull) then
    begin
      with BancodeDados.qryCsUnidade do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from cadunidade');
          SQL.Add('where abreviacao = '+QuotedStr(BancoDeDados.qryCadprodutounidade_compra.Value));
          SQL.Add(' and tipo = 0');
          Open;
        end;
    end;
end;

procedure TCadProdutoForm.DBEditUnidadeVendaDblClick(Sender: TObject);
begin
  BTUnidadeVendaClick(Self);
end;

procedure TCadProdutoForm.DBEditUnidadeVendaExit(Sender: TObject);
begin
  if (BancoDeDados.qryCadprodutounidade_venda.Value <> '') or (BancoDeDados.qryCadprodutounidade_venda.IsNull) then
    begin
      with BancodeDados.qryCsUnidade do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from cadunidade');
          SQL.Add('where abreviacao = '+QuotedStr(BancoDeDados.qryCadprodutounidade_venda.Value));
          SQL.Add(' and tipo = 1');
          Open;
        end;
    end;
end;

procedure TCadProdutoForm.DBGrid1DblClick(Sender: TObject);
begin
  BTAlterarClick(Self);
end;

procedure TCadProdutoForm.DBEdit4Exit(Sender: TObject);
begin
  if (BancoDeDados.qryCadprodutoidlocalizacao.Value > 0) then
    begin
      with BancodeDados.qryCsLocalizacao do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from cadlocalizacao');
          SQL.Add('where idlocalizacao = '+IntToStr(BancoDeDados.qryCadprodutoidlocalizacao.Value));
          Open;
        end;
    end;
end;

procedure TCadProdutoForm.EditPesquisarChange(Sender: TObject);
begin
  BTPesquisarClick(Self);
end;

procedure TCadProdutoForm.EditPrecoAtacadoDblClick(Sender: TObject);
begin
  BTPrecoAtacadoClick(Self);
end;

procedure TCadProdutoForm.EditPrecoVarejoDblClick(Sender: TObject);
begin
  BTPrecoVarejoClick(Self);
end;

procedure TCadProdutoForm.Excluir1Click(Sender: TObject);
begin
  if (MessageDlg('Deseja Excluir o registro?',mtWarning,[mbYes,mbNo],0) = mrNo) then
    Abort
  else
    begin
      BancoDeDados.ProcScripts.Script.Text := 'delete from cadproduto_fornecedor where idprodutofornecedor = ' +
          QuotedStr(IntToStr(BancoDeDados.qryCsProdutoFornecedoridprodutofornecedor.Value)) + ';';
      BancoDeDados.ProcScripts.Execute;
      BancoDeDados.qryCsProdutoFornecedor.Refresh;
    end;
end;

procedure TCadProdutoForm.Excluir2Click(Sender: TObject);
begin
  if (MessageDlg('Deseja Excluir o registro?',mtWarning,[mbYes,mbNo],0) = mrNo) then
    Abort
  else
    begin
      BancoDeDados.ProcScripts.Script.Text := 'delete from cadLocalizacao where idlocalizacao = ' +
          QuotedStr(IntToStr(BancoDeDados.qryCsLocalizacaoidlocalizacao.Value)) +
          ' and idproduto = ' + QuotedStr(IntToStr(BancoDeDados.qryCadProdutoidproduto.Value)) + ';';
      BancoDeDados.ProcScripts.Execute;
      BancoDeDados.qryCsLocalizacao.Refresh;
    end;
end;

procedure TCadProdutoForm.FormCreate(Sender: TObject);
begin
  TipoPreco := poNenhum;
  AbaSuperior.ActivePage := tsConsulta;
  CHApenasAtivos.Checked := True;
end;

procedure TCadProdutoForm.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TCadProdutoForm.tsPrincipalClick(Sender: TObject);
begin
  NBManutencao.PageIndex := tsPrincipal.TabIndex;
end;

procedure TCadProdutoForm.tsConsultaShow(Sender: TObject);
begin
  BTPesquisarClick(Self);
  EditPesquisar.SetFocus;
end;
procedure TCadProdutoForm.tsManutencaoShow(Sender: TObject);
begin
  if not (BancodeDados.qryCadProduto.State in [dsInsert]) then
    begin
        with BancoDeDados.qryCadProduto do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select * from cadproduto where idproduto = '+
                IntToStr(BancoDeDados.qryCsProdutoidproduto.Value));
            Open;
            Edit;
          end;
        with BancoDeDados.qryCsProdutoFornecedor do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select * from cadproduto_fornecedor where idproduto = '+
                IntToStr(BancoDeDados.qryCadProdutoidproduto.Value));
            Open;
          end;
        with BancoDeDados.qryCsLocalizacao do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select * from cadLocalizacao where idproduto = '+
                IntToStr(BancoDeDados.qryCadProdutoidproduto.Value));
            Open;
          end;
        with BancoDeDados.qryCsPreco do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select * from cadpreco where tipo = 0 and idproduto = '+
                IntToStr(BancoDeDados.qryCadProdutoidproduto.Value));
            Open;
          end;
        EditPrecoAtacado.Value := BancoDeDados.qryCsPrecoPRECO_VENDA.Value;
        with BancoDeDados.qryCsPreco do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select * from cadpreco where tipo = 1 and idproduto = '+
                IntToStr(BancoDeDados.qryCadProdutoidproduto.Value));
            Open;
          end;
        EditPrecoVarejo.Value := BancoDeDados.qryCsPrecoPRECO_VENDA.Value;
    end;
  PrecoAtacado := EditPrecoAtacado.Value;
  PrecoVarejo := EditPrecoVarejo.Value;
  tsPrincipal.TabIndex := 0;
  NBManutencao.PageIndex := tsPrincipal.TabIndex;
end;

end.
