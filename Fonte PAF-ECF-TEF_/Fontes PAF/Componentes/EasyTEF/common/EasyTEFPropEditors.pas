unit EasyTEFPropEditors;

interface

{$I ..\..\common\DelphiVer.inc}

uses
  {$IFDEF DELPHI_6_UP} DesignEditors, DesignIntf, {$ELSE} DsgnIntf, {$ENDIF}
  SysUtils, Classes;

type
  TEasyTEFVersao = class(TComponentEditor)
    function  GetVerbCount: Integer; override;
    function  GetVerb(index: Integer): string; override;
    procedure ExecuteVerb(index: Integer); override;
    procedure Edit; override;
  end;

procedure Register;

implementation

uses
  EasyTEFDiscado, SobreFrmTEF;

procedure Register;
begin
  RegisterComponents('EasyTEF', [TEasyTEFDiscado]);
  RegisterComponentEditor(TEasyTEFDiscado, TEasyTEFVersao);
end;

{ TEasyTEFVersao }

procedure TEasyTEFVersao.Edit;
begin
  ExecuteVerb(0);
end;

procedure TEasyTEFVersao.ExecuteVerb(index: Integer);
var
  myForm: TSobreFormTEF;
begin
  case index of
    0: begin
      myForm := TSobreFormTEF.Create(nil);
      try
        myForm.lblVersao.Caption := 'Versão: 9.6.9.7';
        myForm.ShowModal;
      finally
        FreeAndNil(myForm);
      end;//try..finally
    end;//0
  end;//case
end;

function TEasyTEFVersao.GetVerb(index: Integer): string;
begin
  case index of
    0: Result := 'Sobre o EasyTEFDiscado...';
  end;
end;

function TEasyTEFVersao.GetVerbCount: Integer;
begin
  Result := 1;
end;

end.
