program MonitorPDV;

uses
  Forms,
  Windows,
  UMonitorPDV in 'UMonitorPDV.pas' {FMonitorPDV},
  UDM in 'UDM.pas' {DM: TDataModule};

{$R *.res}
begin
     Application.Initialize;
     Application.Title := 'MonitorPDV';
     Application.CreateForm(TDM, DM);
     Application.CreateForm(TFMonitorPDV, FMonitorPDV);
     Application.Run;
end.


