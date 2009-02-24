program MasterERP;

uses
  Forms,
  Controls,
  UPrincipal in 'UPrincipal.pas' {PrincipalForm},
  ULogin in '..\resource\ULogin.pas' {LoginForm},
  Base in 'Base.pas' {BancoDeDados: TDataModule},
  UConexao in '..\resource\UConexao.pas' {ConexaoForm},
  UFuncoes in '..\resource\UFuncoes.pas',
  UCadCliente in '..\resource\UCadCliente.pas' {CadClienteForm},
  DlgTipoCliente in '..\resource\DlgTipoCliente.pas' {DlgTipoClienteForm},
  UCadGrupo in 'UCadGrupo.pas' {CadGrupoForm},
  UCadSubGrupo in 'UCadSubGrupo.pas' {CadSubGrupoForm},
  UCadFornecedor in 'UCadFornecedor.pas' {CadFornecedorForm},
  UCadProduto in 'UCadProduto.pas' {CadProdutoForm},
  UCsGrupo in 'UCsGrupo.pas' {CsGrupoForm},
  UCsSubGrupo in 'UCsSubGrupo.pas' {CsSubGrupoForm},
  UCadLocalizacao in 'UCadLocalizacao.pas' {CadLocalizacaoForm},
  UCsLocalizacao in 'UCsLocalizacao.pas' {CsLocalizacaoForm},
  UCadUnidadeEstoque in 'UCadUnidadeEstoque.pas' {CadUnidadeEstoqueForm},
  UCadClassficacao in 'UCadClassficacao.pas' {CadClassificacaoForm},
  UCsClassificacao in 'UCsClassificacao.pas' {CsClassificacaoForm},
  UCsProduto in '..\resource\UCsProduto.pas' {CsProdutoForm},
  UCsUnidadeEstoque in 'UCsUnidadeEstoque.pas' {CsUnidadeEstoqueForm},
  UCsFornecedor in 'UCsFornecedor.pas' {CsFornecedorForm},
  UCadUnidade in 'UCadUnidade.pas' {CadUnidadeForm},
  UCsUnidade in 'UCsUnidade.pas' {CsUnidadeForm},
  ULanPreco in 'ULanPreco.pas' {LancPrecoForm},
  UCadUsuario in 'UCadUsuario.pas' {CadUsuarioForm},
  UCadOperacaoEstoque in 'UCadOperacaoEstoque.pas' {CadOperacaoEstoqueForm},
  ULanMovimentoEstoque in 'ULanMovimentoEstoque.pas' {LanMovimentoEstoqueForm},
  UCadParametros in '..\resource\UCadParametros.pas' {CadParametrosForm},
  UCadModulos in '..\resource\UCadModulos.pas' {CadModulosForm},
  UCadVendedor in 'UCadVendedor.pas' {CadVendedorForm},
  UCsUsuario in '..\resource\UCsUsuario.pas' {CsUsuarioForm},
  UCadFormaPagamento in 'UCadFormaPagamento.pas' {CadFormaPagamentoForm},
  UCsFormaPagamento in 'UCsFormaPagamento.pas' {CsFormaPagamentoForm},
  UCadTipoDocumento in 'UCadTipoDocumento.pas' {CadTipoDocumentoForm},
  UCadContaContabil in 'UCadContaContabil.pas' {CadContaContabilForm},
  UCadMovimentoCaixa in 'UCadMovimentoCaixa.pas' {CadMovimentoCaixaForm},
  UCadObservacao in 'UCadObservacao.pas' {CadObservacaoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TBancoDeDados, BancoDeDados);
  Application.CreateForm(TLoginForm, LoginForm);
  Application.CreateForm(TCadObservacaoForm, CadObservacaoForm);
  Application.Run;
end.
