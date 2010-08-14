unit UAssinaDigital;

interface
uses
  Windows, Messages, Dialogs, SysUtils, Classes, Registry;

  function GerarEADArquivo(fArquivo:string):String;
  function AplicarChave:Boolean;

  function genkkey(ChavePublica: String; ChavePrivada: String): integer; stdcall; external 'sign_bema.dll';
  function setLibType(Tipo: integer): integer; stdcall; external 'sign_bema.dll';
  function generateEAD(NomeArq: String; ChavePublica: String; ChavePrivada: String; EAD:String; Sign: Integer): integer; stdcall; external 'sign_bema.dll';
  function validateFile(NomeArq: String; ChavePublica: String; ChavePrivada: String): integer; stdcall; external 'sign_bema.dll';
  function md5FromFile( NomeArq: String; MD5: String ): integer; stdcall; external 'sign_bema.dll';

  const
   RegChaveHash  = 'SOFTWARE\APLICATIVO DE GESTOR FISCAL';
   SoftHouse: string = 'Dari Agostinho Varini Junior ME';


   gChavePublica: string = 'CCD9F6B164936669323879193381495778ECE05747A0E9E64A107F943103D760E7FF'+
                           '1C1F2D71CC34316F7B7E52CA1156CE11011ABC3BDA1BFA16B651E36126AE968ACA12'+
                           '7F382BF32CB46A2CCF7B233D274A0C3C098DE199337E904F3689A3D96DAB7FE911E4'+
                           '9BF211CE4288C86BC5760093B6FCDD70867130207CFBF03DC41F';


   gChavePrivada: string = 'FAB7AE50214A95038A5B15EFC681E9B7AE6F246EE1CDA498BF6049637B077D1E4A2BE'+
                           '84CF08ED4612179558C447495EB6F0531D196A3BDB9ED1D0887E3C14A75D12AE3F387'+
                           '1E4C0F397C41E10F9B5A5425081E71AC700FE3DD083FCEB9721F1FB40E03929D39BE9'+
                           '8F2587B3DE5972E73BB24CD86B262CBFA68463F06A6F639C3';

implementation

function AplicarChave:Boolean;
var
 Reg  : TRegistry;
begin
 Reg := TRegistry.Create;
 try
  reg.rootkey      := HKEY_LOCAL_MACHINE;
  reg.OpenKey    (RegChaveHash, true);
  reg.WriteString('Publica', gChavePublica);
  reg.writestring('Privada' , gChavePrivada);
 finally
  reg.closekey;
  reg.free;
 end;
end;

//Procedimento que gera o MD5 Hash, abre o arquivo e inseri o valor gerado no final da linha.

function GerarEADArquivo(fArquivo:string):String;
var
 sEAD      : string;
 iRetorno,
 iGrava    :integer;
begin
 iGrava := 1;
 setlength(sEAD,256);
 iRetorno := generateEAD(fArquivo, gChavePublica, gChavePrivada, sEAD, iGrava);
 Result:=sEAD;
 if (iRetorno <> 1) then
  begin
   MessageDlg('Erro ao gerar EAD .',Mterror,[MbOk],0);
   Result:='';
  end;
end;

end.
