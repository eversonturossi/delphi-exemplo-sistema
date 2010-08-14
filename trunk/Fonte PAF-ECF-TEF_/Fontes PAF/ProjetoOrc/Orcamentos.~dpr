program Orcamentos;

uses
  Forms,
  Windows,
  UOrcamento in 'UOrcamento.pas' {FOrcamentos},
  UBarsa in '..\Biblioteca\UBarsa.pas',
  UEstado in '..\Biblioteca\UEstado.pas',
  Calculad in '..\Biblioteca\Calculad.pas',
  UDM in 'UDM.pas' {DM: TDataModule},
  UConsultaProdutos in 'UConsultaProdutos.pas' {FPesquisaProdutos},
  USelecionaPreco in 'USelecionaPreco.pas' {FClassificaPreco},
  UConsultaClientes in 'UConsultaClientes.pas' {FPesquisaClientes},
  UConsultaVendedores in 'UConsultaVendedores.pas' {FPesquisaVendedores},
  USplash in 'USplash.pas' {FSplash},
  UMsg in 'UMsg.pas' {FMsg},
  URelatorios in 'URelatorios.pas' {FRelatorios},
  UConsultaOrcamentos in 'UConsultaOrcamentos.pas' {FConsultaOrcamentos},
  UImpressao in 'UImpressao.pas' {FTipoImpressao},
  UAjuda in 'UAjuda.pas' {FAjuda},
  UConfiguracao in 'UConfiguracao.pas' {FConfiguracao},
  UConsulta_Grade in 'UConsulta_Grade.pas' {FConsultaGrade},
  UConsGradeItem in 'UConsGradeItem.pas' {FConsultaGradeItem};

{$R *.res}

var
  Hand : THandle;
begin
  Hand := FindWindow('TApplication', 'Orçamentos');
  if Hand = 0 then
  begin
  Application.Initialize;

  FSplash:=TFSplash.Create(application);
  FSplash.ShowModal;
  FSplash.Release;

  Application.Title := 'Orçamentos';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFOrcamentos, FOrcamentos);
  Application.Run;
  end
  else ShowWindow(Hand,SW_NORMAL);

  //Application.Initialize;
  //Application.CreateForm(TDM, DM);
  //Application.CreateForm(TFOrcamentos, FOrcamentos);
  //Application.Run;
end.
