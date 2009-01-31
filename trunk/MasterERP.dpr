program MasterERP;

uses
  Forms,
  Controls,
  UPrincipal in 'UPrincipal.pas' {PrincipalForm},
  ULogin in 'ULogin.pas' {LoginForm},
  Base in 'Base.pas' {BancoDeDados: TDataModule},
  UConexao in 'UConexao.pas' {ConexaoForm},
  UFuncoes in 'UFuncoes.pas',
  UCadCliente in 'UCadCliente.pas' {CadClienteForm},
  DlgTipoCliente in 'DlgTipoCliente.pas' {DlgTipoClienteForm},
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
  UCsProduto in 'UCsProduto.pas' {CsProdutoForm},
  UCsUnidadeEstoque in 'UCsUnidadeEstoque.pas' {CsUnidadeEstoqueForm},
  UCsFornecedor in 'UCsFornecedor.pas' {CsFornecedorForm},
  UCadUnidade in 'UCadUnidade.pas' {CadUnidadeForm},
  UCsUnidade in 'UCsUnidade.pas' {CsUnidadeForm},
  ULanPreco in 'ULanPreco.pas' {LancPrecoForm},
  UCadUsuario in 'UCadUsuario.pas' {CadUsuarioForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TBancoDeDados, BancoDeDados);
  Application.CreateForm(TLoginForm, LoginForm);
  Application.Run;
end.
