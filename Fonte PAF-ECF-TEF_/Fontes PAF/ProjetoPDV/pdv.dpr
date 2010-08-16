program pdv;

uses
  Forms,
  Windows,
  libeay32 in '..\Biblioteca\libeay32.pas',
  checkout in 'checkout.pas' {frmcheckout},
  frmcadempresa in 'frmcadempresa.pas' {FEmpresa},
  frmcadCliente in 'frmcadCliente.pas' {FCadCliente},
  frmcadusuarios in 'frmcadusuarios.pas' {fcadusuarios},
  frmconfigimpfisc in 'frmconfigimpfisc.pas' {FConfiguracao},
  frmconsultaaliquotas in 'frmconsultaaliquotas.pas' {fconaliquotas},
  frmconsultaprodutospdv in 'frmconsultaprodutospdv.pas' {FPesquisaProdutos},
  frmprodutos1 in 'frmprodutos1.pas' {FCadProdutos},
  frmsangriasuprimento in 'frmsangriasuprimento.pas' {fsangriasuprimento},
  frmsenha in 'frmsenha.pas' {fsenha},
  funcoesbematech in 'funcoesbematech.pas',
  funcoesdaruma in 'funcoesdaruma.pas',
  lite_frmprincipal in 'lite_frmprincipal.pas' {FrmPrincipal},
  u_cadastro_nominalpdv in 'u_cadastro_nominalpdv.pas' {f_cadastro_nominalPDV},
  u_fechamento_venda_TEF in 'u_fechamento_venda_TEF.pas' {ffechamentovenda_tef},
  dmsyndAC in 'dmsyndAC.pas' {DM: TDataModule},
  frmcancelaItem in 'frmcancelaItem.pas' {fcancelaItem},
  u_inicializacao in 'u_inicializacao.pas' {f_inicializacao},
  frmpesquisacliente in 'frmpesquisacliente.pas' {FPesquisaCliente},
  USobre in 'USobre.pas' {FSobre},
  UAcesso in 'UAcesso.pas' {FAcesso},
  UCadUnidades in 'UCadUnidades.pas' {FCadUnidades},
  UCadGrupos in 'UCadGrupos.pas' {FCadGrupos},
  UCadMarca in 'UCadMarca.pas' {FCadMarca},
  UAjudaPDV in 'UAjudaPDV.pas' {FAjudaPDV},
  UDesc_Acresc in 'UDesc_Acresc.pas' {FDesc_Acresc},
  UDesconto_Ticket in 'UDesconto_Ticket.pas' {FDesconto_Ticket},
  UPesqClienteBalcao in 'UPesqClienteBalcao.pas' {FPesqClienteBalcao},
  UTelaLimte in 'UTelaLimte.pas' {FTelaLimite},
  USenhaLibera in 'USenhaLibera.pas' {FSenhaLibera},
  USecao in 'USecao.pas' {FCadSecao},
  UCrediario in 'UCrediario.pas' {FCrediario},
  UAgBancaria in 'UAgBancaria.pas' {FAgBancaria},
  UConfigBD in 'UConfigBD.pas' {FConfigBD},
  URetornoImpressora in 'URetornoImpressora.pas' {FRetornoImpressora},
  UBuscaPreVenda in 'UBuscaPreVenda.pas' {FBuscaDAV},
  UPesqPreVenda in 'UPesqPreVenda.pas' {FPesquisaDAV},
  UVendedor in 'UVendedor.pas' {FVendedor},
  USelecionaPreco in 'USelecionaPreco.pas' {FClassificaPreco},
  UAlteraIten in 'UAlteraIten.pas' {FAlteraIten},
  UFormaPgto in 'UFormaPgto.pas' {FFormaPgto},
  UAdm_Cartoes in 'UAdm_Cartoes.pas' {FAdm_Cartoes},
  UCartao_Deb_Cred in 'UCartao_Deb_Cred.pas' {FCartao_Deb_Cred},
  UConsultaChequeSerasa in 'UConsultaChequeSerasa.pas' {FConsultaChequeSerasa},
  UMsgServidor in 'UMsgServidor.pas' {FMsgServidor},
  UMenuFiscal in 'UMenuFiscal.pas' {FMenuFiscal},
  UPAF_ECF in 'UPAF_ECF.pas',
  UAssinaDigital in 'UAssinaDigital.pas',
  UIdentificaoPAF in 'UIdentificaoPAF.pas' {FIdentificaoPAF},
  URegistroPAF in 'URegistroPAF.pas' {FRegistroPAF},
  UDAVEmitidos in 'UDAVEmitidos.pas' {FDAVEmitidos},
  UCNIEE in 'UCNIEE.pas' {FCNIEE},
  UMsg in 'UMsg.pas' {FMsg},
  UMeiosPgtos in 'UMeiosPgtos.pas' {FMeiosPgtos},
  UnitBemaMFD in 'UnitBemaMFD.pas',
  UComprovanteNaoFiscal in 'UComprovanteNaoFiscal.pas' {FEmiteDoctoNaoFiscal},
  UDescAcresc_Item in 'UDescAcresc_Item.pas' {FDescAcresc_Item},
  UConfigECF in 'UConfigECF.pas' {FConfigECF},
  UProgramaAliquota in 'UProgramaAliquota.pas' {FProgramaAliquota},
  UProgramaFormaPgto in 'UProgramaFormaPgto.pas' {FProgramaFormaPgto},
  ULiberaECF in 'ULiberaECF.pas' {FLiberaECF},
  UConsulta_Grade in 'UConsulta_Grade.pas' {FConsultaGrade},
  UVendasPeriodo in 'UVendasPeriodo.pas' {FVendasPeriodo},
  UContabilista in 'UContabilista.pas' {FContabilista},
  Calculad in '..\Biblioteca\Calculad.Pas' {FCalculadora},
  UBarsa in '..\Biblioteca\UBarsa.pas',
  Uestado in '..\Biblioteca\Uestado.pas' {FESTADO};

{$R *.res}

var
  Hand : THandle;
begin
  Hand := FindWindow('TApplication', 'FácilPDV - Millenium Versão 2010');
  if Hand = 0 then
  begin
  Application.Initialize;

  F_inicializacao:=Tf_inicializacao.Create(application);
  F_inicializacao.ShowModal;
  F_inicializacao.Release;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFCalculadora, FCalculadora);
  Application.CreateForm(TFESTADO, FESTADO);
  Application.CreateForm(Tfsenha, fsenha);
  Application.Title := 'ByTec-PDV - Versão 2010';
  Application.Run;
  end
  else ShowWindow(Hand,SW_NORMAL);
end.
