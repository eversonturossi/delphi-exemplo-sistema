unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, htmlbtns, jpeg, ExtCtrls;

type
  TPrincipalForm = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    Fornecedores1: TMenuItem;
    Image8: TImage;
    BTCliente: THTMLButton;
    BTFornecedores: THTMLButton;
    N1: TMenuItem;
    GruposdeProdutos1: TMenuItem;
    SubGruposdeProdutos1: TMenuItem;
    ControledeEstoque1: TMenuItem;
    CadastrodeProdutos1: TMenuItem;
    N2: TMenuItem;
    UnidadeEstoque1: TMenuItem;
    LocalizaodeProdutos1: TMenuItem;
    CadastrodeClassificao1: TMenuItem;
    BTProdutos: THTMLButton;
    HTMLButton1: THTMLButton;
    HTMLButton2: THTMLButton;
    HTMLButton3: THTMLButton;
    HTMLButton4: THTMLButton;
    HTMLButton5: THTMLButton;
    HTMLButton6: THTMLButton;
    HTMLButton7: THTMLButton;
    HTMLButton8: THTMLButton;
    HTMLButton9: THTMLButton;
    HTMLButton10: THTMLButton;
    HTMLButton11: THTMLButton;
    HTMLButton12: THTMLButton;
    HTMLButton13: THTMLButton;
    Financeiro1: TMenuItem;
    Cartes1: TMenuItem;
    Cheques1: TMenuItem;
    ContasaPagar1: TMenuItem;
    ContasaReceber1: TMenuItem;
    LanamentosdeCaixa1: TMenuItem;
    EntradadeMercadorias1: TMenuItem;
    OrdemdeCompras1: TMenuItem;
    Vendas1: TMenuItem;
    Oramentos1: TMenuItem;
    Pedidos1: TMenuItem;
    Vendas2: TMenuItem;
    OrdemdeServio1: TMenuItem;
    Sair1: TMenuItem;
    Unidades1: TMenuItem;
    Ferramentas1: TMenuItem;
    CadastrodeUsurios1: TMenuItem;
    OperaesdeEstoque1: TMenuItem;
    MovimentosdeEstoque1: TMenuItem;
    Configuraes1: TMenuItem;
    Modulos2: TMenuItem;
    Parametros1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Clientes1Click(Sender: TObject);
    procedure BTClienteClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GruposdeProdutos1Click(Sender: TObject);
    procedure SubGruposdeProdutos1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure CadastrodeProdutos1Click(Sender: TObject);
    procedure UnidadeEstoque1Click(Sender: TObject);
    procedure LocalizaodeProdutos1Click(Sender: TObject);
    procedure CadastrodeClassificao1Click(Sender: TObject);
    procedure BTFornecedoresClick(Sender: TObject);
    procedure BTProdutosClick(Sender: TObject);
    procedure HTMLButton1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure EntradadeMercadorias1Click(Sender: TObject);
    procedure OrdemdeCompras1Click(Sender: TObject);
    procedure Cartes1Click(Sender: TObject);
    procedure Cheques1Click(Sender: TObject);
    procedure ContasaPagar1Click(Sender: TObject);
    procedure ContasaReceber1Click(Sender: TObject);
    procedure LanamentosdeCaixa1Click(Sender: TObject);
    procedure Oramentos1Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
    procedure Vendas2Click(Sender: TObject);
    procedure OrdemdeServio1Click(Sender: TObject);
    procedure Unidades1Click(Sender: TObject);
    procedure CadastrodeUsurios1Click(Sender: TObject);
    procedure OperaesdeEstoque1Click(Sender: TObject);
    procedure MovimentosdeEstoque1Click(Sender: TObject);
    procedure Modulos2Click(Sender: TObject);
    procedure Parametros1Click(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrincipalForm : TPrincipalForm;

implementation
uses ULogin, Base, UCadCliente, UCadGrupo, UCadSubGrupo, UCadFornecedor,
      UCadProduto, UCadLocalizacao, UCadUnidadeEstoque, UCadClassficacao,
      UCsProduto, UCadUnidade, UCadUsuario, UCadOperacaoEstoque, ULanMovimentoEstoque,
      UCadModulos, UFuncoes, UCadParametros;
{$R *.dfm}

procedure TPrincipalForm.BTClienteClick(Sender: TObject);
begin
  Clientes1Click(Self);
end;

procedure TPrincipalForm.BTFornecedoresClick(Sender: TObject);
begin
  Fornecedores1Click(Self);
end;

procedure TPrincipalForm.BTProdutosClick(Sender: TObject);
begin
  CadastrodeProdutos1Click(Self);
end;

procedure TPrincipalForm.CadastrodeClassificao1Click(Sender: TObject);
begin
  try
    if not Assigned(CadClassificacaoForm) then
      CadClassificacaoForm := TCadClassificacaoForm.Create(Application);
    CadClassificacaoForm.ShowModal;
  finally
    CadClassificacaoForm.Release;
    CadClassificacaoForm := nil;
  end;
end;

procedure TPrincipalForm.CadastrodeProdutos1Click(Sender: TObject);
begin
  try
    if not Assigned(CadProdutoForm) then
      CadProdutoForm := TCadProdutoForm.Create(Application);
    CadProdutoForm.ShowModal;
  finally
    CadProdutoForm.Release;
    CadProdutoForm := nil;
  end;
end;

procedure TPrincipalForm.CadastrodeUsurios1Click(Sender: TObject);
begin
  try
    if not Assigned(CadUsuarioForm) then
      CadUsuarioForm := TCadUsuarioForm.Create(Application);
    CadUsuarioForm.ShowModal;
  finally
    CadUsuarioForm.Release;
    CadUsuarioForm := nil;
  end;
end;

procedure TPrincipalForm.Cartes1Click(Sender: TObject);
begin
  MessageDlg('Funcionalidade em Manutenção.',mtWarning,[mbOK],0);
end;

procedure TPrincipalForm.Cheques1Click(Sender: TObject);
begin
  MessageDlg('Funcionalidade em Manutenção.',mtWarning,[mbOK],0);
end;

procedure TPrincipalForm.Clientes1Click(Sender: TObject);
begin
  try
    if not Assigned(CadClienteForm) then
      CadClienteForm := TCadClienteForm.Create(Application);
    CadClienteForm.ShowModal;
  finally
    CadClienteForm.Release;
    CadClienteForm := nil;
  end;
end;

procedure TPrincipalForm.ContasaPagar1Click(Sender: TObject);
begin
  MessageDlg('Funcionalidade em Manutenção.',mtWarning,[mbOK],0);
end;

procedure TPrincipalForm.ContasaReceber1Click(Sender: TObject);
begin
  MessageDlg('Funcionalidade em Manutenção.',mtWarning,[mbOK],0);
end;

procedure TPrincipalForm.EntradadeMercadorias1Click(Sender: TObject);
begin
  MessageDlg('Funcionalidade em Manutenção.',mtWarning,[mbOK],0);
end;

procedure TPrincipalForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  case Application.MessageBox('Deseja Sair do Sistema?','Atenção',MB_YesNo+mb_DefButton2+mb_IconQuestion) of
       6:Application.Terminate;
       7:Abort;
  end;
end;

procedure TPrincipalForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #27) then
    begin
      key := #0;
      Close;
    end;
end;

procedure TPrincipalForm.FormShow(Sender: TObject);
begin
  Caption := 'Bem vindo '+BancoDeDados.qryCsLoginlogin.Value;
end;

procedure TPrincipalForm.Fornecedores1Click(Sender: TObject);
begin
  try
    if not Assigned(CadFornecedorForm) then
      CadFornecedorForm := TCadFornecedorForm.Create(Application);
    CadFornecedorForm.ShowModal;
  finally
    CadFornecedorForm.Release;
    CadFornecedorForm := nil;
  end;
end;

procedure TPrincipalForm.GruposdeProdutos1Click(Sender: TObject);
begin
  try
    if not Assigned(CadGrupoForm) then
      CadGrupoForm := TCadGrupoForm.Create(Application);
    CadGrupoForm.ShowModal;
  finally
    CadGrupoForm.Release;
    CadGrupoForm := nil;
  end;
end;

procedure TPrincipalForm.HTMLButton1Click(Sender: TObject);
begin
  MovimentosdeEstoque1Click(Self);
end;

procedure TPrincipalForm.UnidadeEstoque1Click(Sender: TObject);
begin
  try
    if not Assigned(CadUnidadeEstoqueForm) then
      CadUnidadeEstoqueForm := TCadUnidadeEstoqueForm.Create(Application);
    CadUnidadeEstoqueForm.ShowModal;
  finally
    CadUnidadeEstoqueForm.Release;
    CadUnidadeEstoqueForm := nil;
  end;
end;

procedure TPrincipalForm.Unidades1Click(Sender: TObject);
begin
   try
    if not Assigned(CadUnidadeForm) then
      CadUnidadeForm := TCadUnidadeForm.Create(Application);
    CadUnidadeForm.ShowModal;
  finally
    CadUnidadeForm.Release;
    CadUnidadeForm := nil;
  end;
end;

procedure TPrincipalForm.Vendas2Click(Sender: TObject);
begin
  MessageDlg('Funcionalidade em Manutenção.',mtWarning,[mbOK],0);
end;

procedure TPrincipalForm.LanamentosdeCaixa1Click(Sender: TObject);
begin
  MessageDlg('Funcionalidade em Manutenção.',mtWarning,[mbOK],0);
end;

procedure TPrincipalForm.LocalizaodeProdutos1Click(Sender: TObject);
begin
  if (CsProdutoForm.ShowModal = mrOk) then
    if (BancoDeDados.qryCsProdutoidproduto.Value > 0) then
      try
        if not Assigned(CadLocalizacaoForm) then
          CadLocalizacaoForm := TCadLocalizacaoForm.Create(Application);
        CadLocalizacaoForm.ShowModal;
      finally
        CadLocalizacaoForm.Release;
        CadLocalizacaoForm := nil;
      end;
end;

procedure TPrincipalForm.Modulos2Click(Sender: TObject);
begin
  CriaForm(TCadModulosForm, CadModulosForm);
end;

procedure TPrincipalForm.MovimentosdeEstoque1Click(Sender: TObject);
begin
  try
    if not Assigned(LanMovimentoEstoqueForm) then
      LanMovimentoEstoqueForm := TLanMovimentoEstoqueForm.Create(Application);
    LanMovimentoEstoqueForm.ShowModal;
  finally
    LanMovimentoEstoqueForm.Release;
    LanMovimentoEstoqueForm := nil;
  end;
end;

procedure TPrincipalForm.OperaesdeEstoque1Click(Sender: TObject);
begin
  try
    if not Assigned(CadOperacaoEstoqueForm) then
      CadOperacaoEstoqueForm := TCadOperacaoEstoqueForm.Create(Application);
    CadOperacaoEstoqueForm.ShowModal;
  finally
    CadOperacaoEstoqueForm.Release;
    CadOperacaoEstoqueForm := nil;
  end;
end;

procedure TPrincipalForm.Oramentos1Click(Sender: TObject);
begin
  MessageDlg('Funcionalidade em Manutenção.',mtWarning,[mbOK],0);
end;

procedure TPrincipalForm.OrdemdeCompras1Click(Sender: TObject);
begin
  MessageDlg('Funcionalidade em Manutenção.',mtWarning,[mbOK],0);
end;

procedure TPrincipalForm.OrdemdeServio1Click(Sender: TObject);
begin
  MessageDlg('Funcionalidade em Manutenção.',mtWarning,[mbOK],0);
end;

procedure TPrincipalForm.Parametros1Click(Sender: TObject);
begin
  CriaForm(TCadParametrosForm, CadParametrosForm);
end;

procedure TPrincipalForm.Pedidos1Click(Sender: TObject);
begin
  MessageDlg('Funcionalidade em Manutenção.',mtWarning,[mbOK],0);
end;

procedure TPrincipalForm.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TPrincipalForm.SubGruposdeProdutos1Click(Sender: TObject);
begin
  try
    if not Assigned(CadSubGrupoForm) then
      CadSubGrupoForm := TCadSubGrupoForm.Create(Application);
    CadSubGrupoForm.ShowModal;
  finally
    CadSubGrupoForm.Release;
    CadSubGrupoForm := nil;
  end;
end;

end.
