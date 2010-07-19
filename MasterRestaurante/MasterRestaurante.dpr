program MasterRestaurante;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {PrincipalForm},
  Base in 'Base.pas' {BancoDados: TDataModule},
  ULogin in 'ULogin.pas' {LoginForm},
  UFuncoes in 'UFuncoes.pas',
  UConexao in 'UConexao.pas' {ConexaoForm},
  UPesquisaProduto in 'UPesquisaProduto.pas' {PesquisaProdutoForm},
  UVenda in 'UVenda.pas' {VendaForm},
  UItem in 'UItem.pas' {ItemForm},
  UFinalizadora in 'UFinalizadora.pas' {FinalizadoraForm},
  UFormaPagamento in 'UFormaPagamento.pas' {FormaPagamentoForm},
  UTroco in 'UTroco.pas' {TrocoForm},
  UAjuda in 'UAjuda.pas' {AjudaForm},
  UPesquisaComanda in 'UPesquisaComanda.pas' {PesquisaComandaForm},
  UCupomNaoFiscal in 'UCupomNaoFiscal.pas',
  UPeriodo in 'UPeriodo.pas' {PeriodoForm},
  UImprimeComanda in 'UImprimeComanda.pas';

{$R *.res}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'MasterRestaurante';
  Application.CreateForm(TBancoDados, BancoDados);
  Application.CreateForm(TPrincipalForm, PrincipalForm);
  Application.Run;
end.
