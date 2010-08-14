program exemplo;

uses
  Forms,
  FrenteCaixaFrm in 'FrenteCaixaFrm.pas' {FrenteCaixaF},
  BematechFuncoes in 'BematechFuncoes.pas',
  FechamentoCupomFrm in 'FechamentoCupomFrm.pas' {FechamentoCupomForm},
  ConsultaChequeFrm in 'ConsultaChequeFrm.pas' {ConsultaChequeForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrenteCaixaF, FrenteCaixaF);
  Application.Run;
end.
