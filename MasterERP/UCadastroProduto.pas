unit UCadastroProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastroPadrao, FMTBcd, ActnList, AppEvnts, DB, SqlExpr, Provider,
  DBClient, StdCtrls, DBCtrls, Buttons, JvExControls, JvGradientHeaderPanel,
  ExtCtrls, ComCtrls, Mask, Grids, DBGrids, Menus;

type
  TCadastroProdutoForm = class(TCadastroPadraoForm)
    CDSCadastroPRODUTO_ID: TIntegerField;
    CDSCadastroATIVO: TSmallintField;
    CDSCadastroDATA_CADASTRO: TSQLTimeStampField;
    CDSCadastroDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSCadastroDESCRICAO: TStringField;
    CDSCadastroDESCRICAO_REDUZIDA: TStringField;
    CDSCadastroREFERENCIA: TStringField;
    CDSCadastroUNIDADE_ID: TIntegerField;
    CDSCadastroPRODUTO_GRUPO_ID: TIntegerField;
    CDSCadastroPRODUTO_SUBGRUPO_ID: TIntegerField;
    PCPrincipal: TPageControl;
    TSCadastro: TTabSheet;
    Label8: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEditCodigo: TDBEdit;
    DBEditDescricao: TDBEdit;
    DBEditDescricaoReduzida: TDBEdit;
    DBEditReferencia: TDBEdit;
    DBLCUnidade: TDBLookupComboBox;
    DBLCGrupoProduto: TDBLookupComboBox;
    DBLCSubGrupoProduto: TDBLookupComboBox;
    TSComplemento: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label6: TLabel;
    Label11: TLabel;
    PopupMenu1: TPopupMenu;
    AdicionarFornecedor1: TMenuItem;
    ExcluirFornecedor1: TMenuItem;
    PopupMenu2: TPopupMenu;
    AdicionarCdigodeBarras1: TMenuItem;
    DetalhesdoCdigodeBarras1: TMenuItem;
    ExcluirCdigodeBarras1: TMenuItem;
    Label12: TLabel;
    DBEditEstoqueMinimo: TDBEdit;
    CDSCadastroESTOQUE_MINIMO: TFloatField;
    PopupMenu3: TPopupMenu;
    PopupMenu4: TPopupMenu;
    AdicionarPreo1: TMenuItem;
    DetalhesdoPreo1: TMenuItem;
    ExcluirPreo1: TMenuItem;
    Label13: TLabel;
    DBGrid3: TDBGrid;
    Label14: TLabel;
    DBGrid4: TDBGrid;
    AdicionarEmpresa1: TMenuItem;
    ExcluirEmpresa1: TMenuItem;
    procedure RemoveAcento(Sender: TObject);
    procedure CDSCadastroAfterInsert(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure DBLCGrupoProdutoClick(Sender: TObject);
    procedure AdicionarFornecedor1Click(Sender: TObject);
    procedure ExcluirFornecedor1Click(Sender: TObject);
    procedure AdicionarCdigodeBarras1Click(Sender: TObject);
    procedure DetalhesdoCdigodeBarras1Click(Sender: TObject);
    procedure ExcluirCdigodeBarras1Click(Sender: TObject);
    procedure BTSalvarClick(Sender: TObject);
    procedure AdicionarPreo1Click(Sender: TObject);
    procedure DetalhesdoPreo1Click(Sender: TObject);
    procedure ExcluirPreo1Click(Sender: TObject);
    procedure AdicionarEmpresa1Click(Sender: TObject);
    procedure ExcluirEmpresa1Click(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure CarregaHint;
  public
    { Public declarations }
  end;

var
  CadastroProdutoForm: TCadastroProdutoForm;

implementation
uses Base, UFuncoes, UPesquisaFornecedor, UPesquisaPadrao,
  UCadastroProdutoBarras, UCadastroProdutoPreco, UPesquisaEmpresa;
{$R *.dfm}

procedure TCadastroProdutoForm.CarregaHint;
begin
  DBEditCodigo.Hint := 'Este é o Código de identificação do Produto.' +
    ' Ele é gerado automaticamente pelo Sistema';
  DBEditDescricao.Hint := 'Informe a Descrição do Produto';
  DBEditDescricaoReduzida.Hint := 'Informe a Descrição Reduzida do Produto';
  DBEditReferencia.Hint := 'Informe a Referência do Produto';
  DBLCUnidade.Hint := 'Informe a Unidade do Produto';
  DBLCGrupoProduto.Hint := 'Informe o Grupo do Produto';
  DBLCSubGrupoProduto.Hint := 'Informe o SubGrupo do Produto';
  DBEditEstoqueMinimo.Hint := 'Informe o Estoque Mínimo do Produto';
  DBGrid1.Hint := 'Informe os Fornecedores para este Produto';
  DBGrid2.Hint := 'Informe os Códigos de Barras para este Produto';
  DBGrid3.Hint := 'Informe os Preços para este Produto';
  DBGrid4.Hint := 'No caso de Multi-Empresa, informe as Empresas nas quais' +
    ' este Produto estará disponível';

  DBCAtivo.Hint := 'Informe se o Cadastro está Ativo/Inativo';
  BTSalvar.Hint := 'Salvar Registro';
  BTCancelar.Hint := 'Cancelar Alterações';
  BTExcluir.Hint := 'Excluir Registro';
  BTSair.Hint := 'Sair da Tela de Cadastro';
end;

procedure TCadastroProdutoForm.RemoveAcento(Sender: TObject);
var
  Temp : ShortString;
begin
  if ((Sender as TDBEdit).Text <> '') then
    begin
      Temp := CDSCadastro.FieldByName((Sender as TDBEdit).DataField).Value;
      if not (CDSCadastro.State in[dsEdit, dsInsert]) then
        CDSCadastro.Edit;
      CDSCadastro.FieldByName((Sender as TDBEdit).DataField).Value := RetornaSemAcento(Temp);
    end;
end;

procedure TCadastroProdutoForm.AdicionarCdigodeBarras1Click(Sender: TObject);
begin
  try
    BarraStatus := False;
    BancoDados.CDSProdutoBarra.DisableControls;
    if not Assigned(CadastroProdutoBarrasForm) then
      CadastroProdutoBarrasForm := TCadastroProdutoBarrasForm.Create(Application);

    CadastroProdutoBarrasForm.GHPPrincipal.LabelCaption := 'Preços';
    CadastroProdutoBarrasForm.Caption := FormatFloat('0000000000', CDSCadastroPRODUTO_ID.Value) +
      ' - ' + CDSCadastroDESCRICAO.Value;

    if (CadastroProdutoBarrasForm.ShowModal = mrOk) then
      begin
        BancoDados.CDSProdutoBarra.Append;
        BancoDados.CDSProdutoBarraPRODUTO_ID.Value := CDSCadastroPRODUTO_ID.Value;
        BancoDados.CDSProdutoBarraFORNECEDOR_ID.Value := CadastroProdutoBarrasForm.EditFornecedor.Value;
        BancoDados.CDSProdutoBarraTIPO_EAN.Value := CadastroProdutoBarrasForm.CBTipoEAN.Text;
        BancoDados.CDSProdutoBarraEAN.Value := CadastroProdutoBarrasForm.EditCodigoBarras.Value;
        BancoDados.CDSProdutoBarra.Post;
        Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, 'PRODUTO_BARRAS',
          'Registro Inserido: (Produto = ' + IntToStr(CDSCadastroPRODUTO_ID.Value) +
          ' / Barra = ' + IntToStr(BancoDados.CDSProdutoBarraEAN.Value) + ')');
      end;
  finally
    CadastroProdutoBarrasForm.Free;
    CadastroProdutoBarrasForm := nil;
    BancoDados.CDSProdutoBarra.EnableControls;
    BarraStatus := True;
  end;
end;

procedure TCadastroProdutoForm.AdicionarEmpresa1Click(Sender: TObject);
begin
  try
    BarraStatus := False;
    BancoDados.CDSProdutoEmpresa.DisableControls;
    if not Assigned(PesquisaEmpresaForm) then
      PesquisaEmpresaForm := TPesquisaEmpresaForm.Create(Application);
    PesquisaFornecedorForm.Tabela := 'EMPRESA';
    if (PesquisaEmpresaForm.ShowModal = mrOk) then
      begin
        if (PesquisaEmpresaForm.ID > 0) then
          begin
            BancoDados.CDSProdutoEmpresa.Append;
            BancoDados.CDSProdutoEmpresaEMPRESA_ID.Value := PesquisaEmpresaForm.ID;
            BancoDados.CDSProdutoEmpresaPRODUTO_ID.Value := CDSCadastroPRODUTO_ID.Value;
            BancoDados.CDSProdutoEmpresa.Post;
            Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, 'PRODUTO_EMPRESA',
              'Registro Inserido: (Produto = ' + IntToStr(CDSCadastroPRODUTO_ID.Value) +
              ' / Empresa = ' + IntToStr(BancoDados.CDSProdutoEmpresaEMPRESA_ID.Value) + ')');
          end;
      end;
  finally
    PesquisaEmpresaForm.Free;
    PesquisaEmpresaForm := nil;
    BancoDados.CDSProdutoEmpresa.EnableControls;
    BarraStatus := True;
  end;
end;

procedure TCadastroProdutoForm.AdicionarFornecedor1Click(Sender: TObject);
begin
  try
    BarraStatus := False;
    BancoDados.CDSProdutoFornecedor.DisableControls;
    if not Assigned(PesquisaFornecedorForm) then
      PesquisaFornecedorForm := TPesquisaFornecedorForm.Create(Application);
    PesquisaFornecedorForm.Tabela := 'FORNECEDOR';
    if (PesquisaFornecedorForm.ShowModal = mrOk) then
      begin
        if (PesquisaFornecedorForm.ID > 0) then
          begin
            BancoDados.CDSProdutoFornecedor.Append;
            BancoDados.CDSProdutoFornecedorFORNECEDOR_ID.Value := PesquisaFornecedorForm.ID;
            BancoDados.CDSProdutoFornecedorPRODUTO_ID.Value := CDSCadastroPRODUTO_ID.Value;
            BancoDados.CDSProdutoFornecedor.Post;
            Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, 'PRODUTO_FORNECEDOR',
              'Registro Inserido: (Produto = ' + IntToStr(CDSCadastroPRODUTO_ID.Value) +
              ' / Fornecedor = ' + IntToStr(BancoDados.CDSProdutoFornecedorFORNECEDOR_ID.Value) + ')');
          end;
      end;
  finally
    PesquisaFornecedorForm.Free;
    PesquisaFornecedorForm := nil;
    BancoDados.CDSProdutoFornecedor.EnableControls;
    BarraStatus := True;
  end;
end;

procedure TCadastroProdutoForm.AdicionarPreo1Click(Sender: TObject);
begin
  try
    BarraStatus := False;
    BancoDados.CDSProdutoPreco.DisableControls;
    if not Assigned(CadastroProdutoPrecoForm) then
      CadastroProdutoPrecoForm := TCadastroProdutoPrecoForm.Create(Application);

    CadastroProdutoPrecoForm.GHPPrincipal.LabelCaption := 'Preços';
    CadastroProdutoPrecoForm.Caption := FormatFloat('0000000000', CDSCadastroPRODUTO_ID.Value) +
      ' - ' + CDSCadastroDESCRICAO.Value;
    CadastroProdutoPrecoForm.CBAtivo.Checked := True;

    BancoDados.CDSUnidade.Close;
    BancoDados.qryUnidade.SQL.Text := 'select * from unidade where ativo = 1';
    BancoDados.CDSUnidade.Open;
    BancoDados.CDSUnidade.First;

    CadastroProdutoPrecoForm.CBUnidade.Items.Clear;
    CadastroProdutoPrecoForm.CBUnidade.Items.Add('<selecione>');

    while not BancoDados.CDSUnidade.Eof do
      begin
        CadastroProdutoPrecoForm.CBUnidade.Items.Add(BancoDados.CDSUnidadeDESCRICAO.Value);
        BancoDados.CDSUnidade.Next;
      end;

    if (CadastroProdutoPrecoForm.ShowModal = mrOk) then
      begin
        BancoDados.CDSProdutoPreco.Append;
        BancoDados.CDSProdutoPrecoPRODUTO_ID.Value := CDSCadastroPRODUTO_ID.Value;
        BancoDados.CDSProdutoPrecoDESCRICAO.Value := CadastroProdutoPrecoForm.EditDescricao.Text;
        BancoDados.CDSProdutoPrecoPRECO.Value := CadastroProdutoPrecoForm.EditPreco.Value;
        BancoDados.CDSProdutoPrecoMARGEM_LUCRO.Value := CadastroProdutoPrecoForm.editMargemLucro.Value;

        if (CadastroProdutoPrecoForm.CBAtivo.Checked) then
          BancoDados.CDSProdutoPrecoATIVO.Value := 1
        else
          BancoDados.CDSProdutoPrecoATIVO.Value := 0;

        if (CadastroProdutoPrecoForm.CBUnidade.ItemIndex > 0) then
          begin
            with BancoDados.qryAuxiliar do
              begin
                Close;
                SQL.Text := 'select unidade_id from unidade where ativo = 1 and' +
                  ' descricao = ' + QuotedStr(CadastroProdutoPrecoForm.CBUnidade.Text);
                Open;
              end;
            if not (BancoDados.qryAuxiliar.IsEmpty) then
              BancoDados.CDSProdutoPrecoUNIDADE_ID.Value := BancoDados.qryAuxiliar.Fields[0].Value;
          end;

        BancoDados.CDSProdutoPreco.Post;

        Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, 'PRODUTO_PRECO',
          'Registro Inserido: (Produto = ' + IntToStr(CDSCadastroPRODUTO_ID.Value) +
          ' / Descricao = ' + BancoDados.CDSProdutoPrecoDESCRICAO.Value +
          ' / Preço (R$) = ' + FormatFloat(',0.00', BancoDados.CDSProdutoPrecoPRECO.Value) + ')');
      end;
  finally
    CadastroProdutoPrecoForm.Free;
    CadastroProdutoPrecoForm := nil;
    BancoDados.CDSProdutoPreco.EnableControls;
    BarraStatus := True;
  end;
end;

procedure TCadastroProdutoForm.BTSalvarClick(Sender: TObject);
begin
  if not (DBEditDescricao.Text <> '') then
    begin
      Mensagem('Informe uma Descrição para este Produto!', mtWarning,[mbOk],mrOK,0);
      DBEditDescricao.SetFocus;
      Abort;
    end;
  if not (DBLCUnidade.KeyValue > 0) then
    begin
      Mensagem('Informe uma Unidade para este Produto!', mtWarning,[mbOk],mrOK,0);
      DBLCUnidade.SetFocus;
      Abort;
    end;

  inherited; //Herança

  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);

  BancoDados.CDSProdutoFornecedor.ApplyUpdates(0);
  BancoDados.CDSProdutoBarra.ApplyUpdates(0);
  BancoDados.CDSProdutoPreco.ApplyUpdates(0);
  if ((BancoDados.MultiEmpresa) and (BancoDados.Filial > 0)) then
    BancoDados.CDSProdutoEmpresa.ApplyUpdates(0);

  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TCadastroProdutoForm.CDSCadastroAfterInsert(DataSet: TDataSet);
begin
  inherited; //Herança

  CDSCadastro.FieldByName('ATIVO').Value := 1;
  CDSCadastro.FieldByName('DATA_CADASTRO').Value := Now;
  CDSCadastro.FieldByName('DATA_ULTIMA_ALTERACAO').Value := Now;
end;

procedure TCadastroProdutoForm.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check : Integer;
  R: TRect;
begin
  if (Column.FieldName = 'ATIVO') then
    begin
      DBGrid3.Canvas.FillRect(Rect);
      Check := 0;
      if (BancoDados.CDSProdutoPreco.FieldByName('ATIVO').Value = 1) then
        Check := DFCS_CHECKED
      else
        Check := 0;
      R := Rect;
      InflateRect(R,-3,-3);
      DrawFrameControl(DBGrid3.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
    end;
end;

procedure TCadastroProdutoForm.DBLCGrupoProdutoClick(Sender: TObject);
begin
  if (DBLCGrupoProduto.KeyValue > 0) then
    begin
      BancoDados.CDSSubGrupoProduto.Close;
      BancoDados.qrySubGrupoProduto.SQL.Text := 'select * from produto_subgrupo' +
        ' where ativo = 1 and produto_grupo_id = ' + IntToStr(DBLCGrupoProduto.KeyValue);
      BancoDados.CDSSubGrupoProduto.Open;
    end;
  DBLCSubGrupoProduto.Enabled := not (BancoDados.CDSSubGrupoProduto.IsEmpty);
end;

procedure TCadastroProdutoForm.DetalhesdoCdigodeBarras1Click(Sender: TObject);
begin
  if not (BancoDados.CDSProdutoBarra.IsEmpty) then
    begin
      try
        BarraStatus := False;
        BancoDados.CDSProdutoBarra.DisableControls;
        if not Assigned(CadastroProdutoBarrasForm) then
          CadastroProdutoBarrasForm := TCadastroProdutoBarrasForm.Create(Application);

        CadastroProdutoPrecoForm.GHPPrincipal.LabelCaption := 'Preços';
        CadastroProdutoPrecoForm.Caption := FormatFloat('0000000000', CDSCadastroPRODUTO_ID.Value) +
          ' - ' + CDSCadastroDESCRICAO.Value;

        CadastroProdutoBarrasForm.EditFornecedor.Value := BancoDados.CDSProdutoBarraFORNECEDOR_ID.Value;
        CadastroProdutoBarrasForm.LBFornecedorNome.Caption := BancoDados.CDSProdutoBarracalc_fornecedor_nome.Value;
        CadastroProdutoBarrasForm.CBTipoEAN.Text := BancoDados.CDSProdutoBarraTIPO_EAN.Value;
        CadastroProdutoBarrasForm.EditCodigoBarras.Value := BancoDados.CDSProdutoBarraEAN.Value;

        if (CadastroProdutoBarrasForm.ShowModal = mrOk) then
          begin
            BancoDados.CDSProdutoBarra.Edit;
            BancoDados.CDSProdutoBarraPRODUTO_ID.Value := CDSCadastroPRODUTO_ID.Value;
            BancoDados.CDSProdutoBarraFORNECEDOR_ID.Value := CadastroProdutoBarrasForm.EditFornecedor.Value;
            BancoDados.CDSProdutoBarraTIPO_EAN.Value := CadastroProdutoBarrasForm.CBTipoEAN.Text;
            BancoDados.CDSProdutoBarraEAN.Value := CadastroProdutoBarrasForm.EditCodigoBarras.Value;
            BancoDados.CDSProdutoBarra.Post;
            Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, 'PRODUTO_BARRAS',
              'Registro Alterado: (Produto = ' + IntToStr(CDSCadastroPRODUTO_ID.Value) +
              ' / Barra = ' + IntToStr(BancoDados.CDSProdutoBarraEAN.Value) + ')');
          end;
      finally
        CadastroProdutoBarrasForm.Free;
        CadastroProdutoBarrasForm := nil;
        BancoDados.CDSProdutoBarra.EnableControls;
        BarraStatus := True;
      end;
    end
  else
    begin
      Mensagem('Não há nehum Código de Barras cadastrado!', mtWarning,[mbOk],mrOK,0);
      Abort;
    end;
end;

procedure TCadastroProdutoForm.DetalhesdoPreo1Click(Sender: TObject);
begin
  if not (BancoDados.CDSProdutoPreco.IsEmpty) then
    begin
      try
        BarraStatus := False;
        BancoDados.CDSProdutoPreco.DisableControls;
        if not Assigned(CadastroProdutoPrecoForm) then
          CadastroProdutoPrecoForm := TCadastroProdutoPrecoForm.Create(Application);

        CadastroProdutoPrecoForm.GHPPrincipal.LabelCaption := 'Preços';
        CadastroProdutoPrecoForm.Caption := FormatFloat('0000000000', CDSCadastroPRODUTO_ID.Value) +
          ' - ' + CDSCadastroDESCRICAO.Value;

        CadastroProdutoPrecoForm.CBAtivo.Checked := (BancoDados.CDSProdutoPrecoATIVO.Value = 1);
        CadastroProdutoPrecoForm.EditDescricao.Text := BancoDados.CDSProdutoPrecoDESCRICAO.Value;
        CadastroProdutoPrecoForm.EditPreco.Value := BancoDados.CDSProdutoPrecoPRECO.Value;
        CadastroProdutoPrecoForm.EditMargemLucro.Value := BancoDados.CDSProdutoPrecoMARGEM_LUCRO.Value;

        BancoDados.CDSUnidade.Close;
        BancoDados.qryUnidade.SQL.Text := 'select * from unidade where ativo = 1';
        BancoDados.CDSUnidade.Open;
        BancoDados.CDSUnidade.First;

        CadastroProdutoPrecoForm.CBUnidade.Items.Clear;
        CadastroProdutoPrecoForm.CBUnidade.Items.Add('<selecione>');

        while not BancoDados.CDSUnidade.Eof do
          begin
            CadastroProdutoPrecoForm.CBUnidade.Items.Add(BancoDados.CDSUnidadeDESCRICAO.Value);
            BancoDados.CDSUnidade.Next;
          end;

        with BancoDados.qryAuxiliar do
          begin
            Close;
            SQL.Text := 'select descricao from unidade where unidade_id = ' +
              IntToStr(BancoDados.CDSProdutoPrecoUNIDADE_ID.Value);
            Open;
          end;
        if not (BancoDados.qryAuxiliar.IsEmpty) then
          CadastroProdutoPrecoForm.CBUnidade.Text := BancoDados.qryAuxiliar.Fields[0].Value
        else
          CadastroProdutoPrecoForm.CBUnidade.ItemIndex := 0;

        if (CadastroProdutoPrecoForm.ShowModal = mrOk) then
          begin
            BancoDados.CDSProdutoPreco.Edit;
            BancoDados.CDSProdutoPrecoPRODUTO_ID.Value := CDSCadastroPRODUTO_ID.Value;
            BancoDados.CDSProdutoPrecoDESCRICAO.Value := CadastroProdutoPrecoForm.EditDescricao.Text;
            BancoDados.CDSProdutoPrecoPRECO.Value := CadastroProdutoPrecoForm.EditPreco.Value;
            BancoDados.CDSProdutoPrecoMARGEM_LUCRO.Value := CadastroProdutoPrecoForm.editMargemLucro.Value;

            if (CadastroProdutoPrecoForm.CBAtivo.Checked) then
              BancoDados.CDSProdutoPrecoATIVO.Value := 1
            else
              BancoDados.CDSProdutoPrecoATIVO.Value := 0;

            if (CadastroProdutoPrecoForm.CBUnidade.ItemIndex > 0) then
              begin
                with BancoDados.qryAuxiliar do
                  begin
                    Close;
                    SQL.Text := 'select unidade_id from unidade where ativo = 1 and' +
                      ' descricao = ' + QuotedStr(CadastroProdutoPrecoForm.CBUnidade.Text);
                    Open;
                  end;
                if not (BancoDados.qryAuxiliar.IsEmpty) then
                  BancoDados.CDSProdutoPrecoUNIDADE_ID.Value := BancoDados.qryAuxiliar.Fields[0].Value;
              end;

            BancoDados.CDSProdutoPreco.Post;

            Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, 'PRODUTO_PRECO',
              'Registro Alterado: (Produto = ' + IntToStr(CDSCadastroPRODUTO_ID.Value) +
              ' / Descricao = ' + BancoDados.CDSProdutoPrecoDESCRICAO.Value +
              ' / Preço (R$) = ' + FormatFloat(',0.00', BancoDados.CDSProdutoPrecoPRECO.Value) + ')');
          end;
      finally
        CadastroProdutoPrecoForm.Free;
        CadastroProdutoPrecoForm := nil;
        BancoDados.CDSProdutoPreco.EnableControls;
        BarraStatus := True;
      end;
    end;
end;

procedure TCadastroProdutoForm.ExcluirCdigodeBarras1Click(Sender: TObject);
begin
  try
    BancoDados.CDSProdutoBarra.DisableControls;
    if (Mensagem('Deseja realmente Excluir este Registro?',mtConfirmation,[mbYES,mbNO],mrNO,0) = idYES) then
      begin
        BancoDados.CDSProdutoBarra.Delete;
        Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, 'PRODUTO_BARRAS',
          'Registro Excluído: (Produto = ' + IntToStr(CDSCadastroPRODUTO_ID.Value) +
          ' / Barra = ' + IntToStr(BancoDados.CDSProdutoBarraEAN.Value) + ')');
      end;
  finally
    BancoDados.CDSProdutoBarra.EnableControls;
  end;
end;

procedure TCadastroProdutoForm.ExcluirEmpresa1Click(Sender: TObject);
begin
  try
    BancoDados.CDSProdutoEmpresa.DisableControls;
    if (Mensagem('Deseja realmente Excluir este Registro?',mtConfirmation,[mbYES,mbNO],mrNO,0) = idYES) then
      begin
        BancoDados.CDSProdutoEmpresa.Delete;
        Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, 'PRODUTO_EMPRESA',
          'Registro Excluído: (Produto = ' + IntToStr(CDSCadastroPRODUTO_ID.Value) +
          ' / Empresa = ' + IntToStr(BancoDados.CDSProdutoEmpresaEMPRESA_ID.Value) + ')');
      end;
  finally
    BancoDados.CDSProdutoEmpresa.EnableControls;
  end;
end;

procedure TCadastroProdutoForm.ExcluirFornecedor1Click(Sender: TObject);
begin
  try
    BancoDados.CDSProdutoFornecedor.DisableControls;
    if (Mensagem('Deseja realmente Excluir este Registro?',mtConfirmation,[mbYES,mbNO],mrNO,0) = idYES) then
      begin
        BancoDados.CDSProdutoFornecedor.Delete;
        Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, 'PRODUTO_FORNECEDOR',
          'Registro Excluído: (Produto = ' + IntToStr(CDSCadastroPRODUTO_ID.Value) +
          ' / Fornecedor = ' + IntToStr(BancoDados.CDSProdutoFornecedorFORNECEDOR_ID.Value) + ')');
      end;
  finally
    BancoDados.CDSProdutoFornecedor.EnableControls;
  end;
end;

procedure TCadastroProdutoForm.ExcluirPreo1Click(Sender: TObject);
begin
  try
    BancoDados.CDSProdutoPreco.DisableControls;
    if (Mensagem('Deseja realmente Excluir este Registro?',mtConfirmation,[mbYES,mbNO],mrNO,0) = idYES) then
      begin
        BancoDados.CDSProdutoPreco.Delete;
        Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, 'PRODUTO_PRECO',
          'Registro Excluído: (Produto = ' + IntToStr(CDSCadastroPRODUTO_ID.Value) +
          ' / Descricao = ' + BancoDados.CDSProdutoPrecoDESCRICAO.Value +
          ' / Preço (R$) = ' + FormatFloat(',0.00', BancoDados.CDSProdutoPrecoPRECO.Value) + ')');
      end;
  finally
    BancoDados.CDSProdutoPreco.EnableControls;
  end;
end;

procedure TCadastroProdutoForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    begin
      key := #0;
      Perform(WM_NextDlgCtl,0,0);
    end;

  inherited; //Herança
end;

procedure TCadastroProdutoForm.FormShow(Sender: TObject);
begin
  if (UtilizaMaiuscula) then
    begin
      DBEditDescricao.CharCase := ecUpperCase;
      DBEditDescricaoReduzida.CharCase := ecUpperCase;
      DBEditReferencia.CharCase := ecUpperCase;
    end;

  BancoDados.CDSUnidade.Close;
  BancoDados.qryUnidade.SQL.Text := 'select * from unidade where ativo = 1';
  BancoDados.CDSUnidade.Open;

  inherited; //Herança

  BancoDados.CDSGrupoProduto.Close;
  BancoDados.qryGrupoProduto.SQL.Text := 'select * from produto_grupo where ativo = 1';
  BancoDados.CDSGrupoProduto.Open;

  if (DBLCGrupoProduto.KeyValue > 0) then
    begin
      BancoDados.CDSSubGrupoProduto.Close;
      BancoDados.qrySubGrupoProduto.SQL.Text := 'select * from produto_subgrupo' +
        ' where ativo = 1 and produto_grupo_id = ' + IntToStr(DBLCGrupoProduto.KeyValue);
      BancoDados.CDSSubGrupoProduto.Open;

      DBLCSubGrupoProduto.Enabled := True;
    end
  else
    DBLCSubGrupoProduto.Enabled := False;

  BancoDados.CDSProdutoFornecedor.Close;
  BancoDados.qryProdutoFornecedor.SQL.Text := 'select * from produto_fornecedor' +
    ' where produto_id = ' + IntToStr(CDSCadastroPRODUTO_ID.Value);
  BancoDados.CDSProdutoFornecedor.Open;

  BancoDados.CDSProdutoBarra.Close;
  BancoDados.qryProdutoBarra.SQL.Text := 'select * from produto_barras' +
    ' where produto_id = ' + IntToStr(CDSCadastroPRODUTO_ID.Value);
  BancoDados.CDSProdutoBarra.Open;

  BancoDados.CDSProdutoPreco.Close;
  BancoDados.qryProdutoPreco.SQL.Text := 'select * from produto_preco' +
    ' where produto_id = ' + IntToStr(CDSCadastroPRODUTO_ID.Value);
  BancoDados.CDSProdutoPreco.Open;

  if ((BancoDados.MultiEmpresa) and (BancoDados.Filial > 0)) then
    begin
      DBGrid4.Enabled := True;
      BancoDados.CDSProdutoEmpresa.Close;
      BancoDados.qryProdutoEmpresa.SQL.Text := 'select * from produto_empresa' +
        ' where produto_id = ' + IntToStr(CDSCadastroPRODUTO_ID.Value);
      BancoDados.CDSProdutoEmpresa.Open;
    end
  else
    DBGrid4.Enabled := False;

  CarregaHint;

  PCPrincipal.ActivePage := TSCadastro;
  DBEditDescricao.SetFocus;
end;

end.
