program MasterERP;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {PrincipalForm},
  ULogin in 'ULogin.pas' {LoginForm},
  UFuncoes in 'UFuncoes.pas',
  Base in 'Base.pas' {BancoDados: TDataModule},
  UConexao in 'UConexao.pas' {ConexaoForm},
  UAlteracao in 'UAlteracao.pas' {AlteracaoForm},
  UAlteracaoDetalhe in 'UAlteracaoDetalhe.pas' {AlteracaoDetalheForm},
  UAjudaAtalhos in 'UAjudaAtalhos.pas' {AjudaAtalhosForm},
  UConsultaPadrao in 'UConsultaPadrao.pas' {ConsultaPadraoForm},
  UCadastroPadrao in 'UCadastroPadrao.pas' {CadastroPadraoForm},
  USupervisaoUsuario in 'USupervisaoUsuario.pas' {SupervisaoUsuarioForm},
  UConcultaUsuario in 'UConcultaUsuario.pas' {ConcultaUsuarioForm},
  UFuncaoExibirColuna in 'UFuncaoExibirColuna.pas',
  UsuarioExibirColuna in 'UsuarioExibirColuna.pas' {UsuarioExibirColunaForm},
  UConfiguraTrace in 'UConfiguraTrace.pas' {ConfiguraTraceForm},
  UCadastroUsuario in 'UCadastroUsuario.pas' {CadastroUsuarioForm},
  UCadastroEmpresa in 'UCadastroEmpresa.pas' {CadastroEmpresaForm},
  UConsultaEmpresa in 'UConsultaEmpresa.pas' {ConsultaEmpresaForm},
  UPesquisaPadrao in 'UPesquisaPadrao.pas' {PesquisaPadraoForm},
  UPesquisaEmpresa in 'UPesquisaEmpresa.pas' {PesquisaEmpresaForm},
  UCadastroSimplesPadrao in 'UCadastroSimplesPadrao.pas' {CadastroSimplesPadraoForm},
  UCadastroSimplesPessoaContatoTipo in 'UCadastroSimplesPessoaContatoTipo.pas' {CadastroSimplesPessoaContatoTipoForm},
  UCadastroSimplesMunicipio in 'UCadastroSimplesMunicipio.pas' {CadastroSimplesMunicipioForm},
  UPesquisaMunicipio in 'UPesquisaMunicipio.pas' {PesquisaMunicipioForm},
  UConsultaProduto in 'UConsultaProduto.pas' {ConsultaProdutoForm},
  UCadastroProduto in 'UCadastroProduto.pas' {CadastroProdutoForm},
  UConsultaGrupoProduto in 'UConsultaGrupoProduto.pas' {ConsultaGrupoProdutoForm},
  UCadastroGrupoProduto in 'UCadastroGrupoProduto.pas' {CadastroGrupoProdutoForm},
  UConsultaSubGrupoProduto in 'UConsultaSubGrupoProduto.pas' {ConsultaSubGrupoProdutoForm},
  UCadastroSubGrupoProduto in 'UCadastroSubGrupoProduto.pas' {CadastroSubGrupoProdutoForm},
  UVerificaPessoa in 'UVerificaPessoa.pas' {VerificaPessoaForm},
  UConsultaCliente in 'UConsultaCliente.pas' {ConsultaClienteForm},
  UCadastroCliente in 'UCadastroCliente.pas' {CadastroClienteForm},
  UConsultaLog in 'UConsultaLog.pas' {ConsultaLogForm},
  UConsultaFornecedor in 'UConsultaFornecedor.pas' {ConsultaFornecedorForm},
  UCadastroFornecedor in 'UCadastroFornecedor.pas' {CadastroFornecedorForm},
  UConsultaTransportadora in 'UConsultaTransportadora.pas' {ConsultaTransportadoraForm},
  UCadastroTransportadora in 'UCadastroTransportadora.pas' {CadastroTransportadoraForm},
  UPesquisaFornecedor in 'UPesquisaFornecedor.pas' {PesquisaFornecedorForm},
  UCadastroProdutoBarras in 'UCadastroProdutoBarras.pas' {CadastroProdutoBarrasForm},
  UCadastroProdutoPreco in 'UCadastroProdutoPreco.pas' {CadastroProdutoPrecoForm},
  UPesquisaCliente in 'UPesquisaCliente.pas' {PesquisaClienteForm},
  UPesquisaTransportadora in 'UPesquisaTransportadora.pas' {PesquisaTransportadoraForm},
  UConsultaNotaEntrada in 'UConsultaNotaEntrada.pas' {ConsultaNotaEntradaForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Master ERP';
  Application.CreateForm(TBancoDados, BancoDados);
  Application.CreateForm(TPrincipalForm, PrincipalForm);
  Application.CreateForm(TPesquisaTransportadoraForm, PesquisaTransportadoraForm);
  Application.CreateForm(TConsultaNotaEntradaForm, ConsultaNotaEntradaForm);
  Application.Run;
end.
