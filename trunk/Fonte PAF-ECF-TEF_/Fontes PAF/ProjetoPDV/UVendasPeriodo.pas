unit UVendasPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, SqlExpr, Grids, DBGrids, Provider, DB,
  DBClient;

type
  TFVendasPeriodo = class(TForm)
    BtConvenio57_95: TBitBtn;
    BtAtoCotep: TBitBtn;
    LStatus: TLabel;
    procedure BtConvenio57_95Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtAtoCotepClick(Sender: TObject);
  private
    { Private declarations }
   procedure Vendas_No_Periodo_Cotepe(dataincial:TDate;datafinal:TDate);
   //function NomeArquivo_VendasPeriodo : String;
  public
    { Public declarations }
  end;

var
  FVendasPeriodo: TFVendasPeriodo;

implementation

uses UPAF_ECF, UMenuFiscal, UBarsa, dmsyndAC, UAssinaDigital;

{$R *.dfm}

function NomeArquivo_VendasPeriodo:String;
var
 qr      : TSqlQuery;
 sql     : string;
 nulaudo : string;
 dataarq,
 horaarq : string;
 locarq  : string;
begin
 locarq   := 'C:\Apgef\PAF\';
 //dataarq  := RetornaDataString(DateToStr(Now));
 dataarq  := FormatDateTime('ddmmyyyy',now);
 horaarq  := FormatDateTime('hhmmss',now);
 sql      := 'select num_laudo from registro';
 try
  qr := TSqlQuery.Create(nil);
  qr.SQLConnection:=DM.SQLConnectionLocal;
  qr.Close;
  qr.SQL.Clear;
  qr.SQL.Add(sql);
  qr.Open;
  nulaudo := qr.Fields[0].AsString;
  Result := locarq+nulaudo+dataarq+horaarq+'.txt';
 finally
  FreeAndNil(qr);
 end;
end;

function NomeArquivo_VendasPeriodo5795:String;
var
 qr      : TSqlQuery;
 sql     : string;
 nulaudo : string;
 dataarq,
 horaarq : string;
begin
 //dataarq  := RetornaDataString(DateToStr(Now));
 dataarq  := FormatDateTime('ddmmyyyy',now);
 horaarq  := FormatDateTime('hhmmss',now);
 sql      := 'select num_laudo from registro';
 try
  qr := TSqlQuery.Create(nil);
  qr.SQLConnection:=DM.SQLConnectionLocal;
  qr.Close;
  qr.SQL.Clear;
  qr.SQL.Add(sql);
  qr.Open;
  nulaudo := qr.Fields[0].AsString;
  Result := nulaudo+dataarq+horaarq+'.txt';
 finally
  FreeAndNil(qr);
 end;
end;

procedure TFVendasPeriodo.BtConvenio57_95Click(Sender: TObject);
var
 Str_Data_Inicio_Movimento: string;
 Str_Data_Fim_Movimento: string;
 Str_Municipio: string;
 Str_UF: string;
 Str_Fax: string;
 Str_Cod_Convenio: string;
 Str_Cod_Natureza: string;
 Str_Cod_Finalidade: string;
 Str_Logradouro: string;
 Str_Numero: string;
 Str_Complemento: string;
 Str_Bairro: string;
 Str_CEP: string;
 Str_Nome_Contato: string;
 Str_Telefone: string;
 Str_Mes: String;
 Str_Ano: String;
 Str_Razao: string;
 sNomeArq : string;
begin
    AC1;

    if FileExists('C:\SINTEGRA.txt')
    then DeleteFile('C:\SINTEGRA.txt');

    DM.TEmpresa.Open;
    DM.TEmpresa.Refresh;

    Str_Mes:=StrZero(Mes(FMenuFiscal.EDataI.Date),2);
    Str_Ano:=StrZero(Ano(FMenuFiscal.EDataI.Date),4);
    Str_Data_Inicio_Movimento:=FormatDateTime('dd/MM/yy',FMenuFiscal.EDataI.Date);
    Str_Data_Fim_Movimento   :=FormatDateTime('dd/MM/yy',FMenuFiscal.EDataF.Date);
    Str_Data_Inicio_Movimento:=Trim(RetiraArgumento('/',Str_Data_Inicio_Movimento));
    Str_Data_Fim_Movimento   :=Trim(RetiraArgumento('/',Str_Data_Fim_Movimento));
    Str_Municipio            :=Trim(DM.TEmpresaCIDADE.Value);
    Str_Fax                  :=Trim(SoNumeros(DM.TEmpresaFAX.Value));
    Str_Cod_Convenio         :='3';
    Str_Cod_Natureza         :='3';
    Str_Cod_Finalidade       :='1';
    Str_Logradouro           :=Trim(DM.TEmpresaENDERECO.Value);
    Str_Numero               :=Trim(RemoveChar(DM.TEmpresaENDERECO.Value));
    Str_Complemento          :=Trim(DM.TEmpresaNOME_FANTASIA.Value);
    Str_Bairro               :=Trim(DM.TEmpresaBAIRRO.Value);
    Str_CEP                  :=Trim(SoNumeros(DM.TEmpresaCEP.Value));
    Str_Nome_Contato         :=Trim(DM.TEmpresaCONTATO.Value);
    Str_Telefone             :=Trim(SoNumeros(DM.TEmpresaTELEFONE.Value));
    Str_Razao                :=Trim(DM.TEmpresaRAZAO_SOCIAL.Value);

    BtConvenio57_95.Enabled:=False;
    BtAtoCotep.Enabled:=False;
    LStatus.Caption:='Gerando o arquivo Sintegra. Aguarde...';
    Repaint;

   Try
    if s_ImpFiscal = 'ECF Daruma'
    then begin
         Str_UF:= trim(DM.TEmpresaUF.Value);
         if (Str_UF <> '')
         then Retorno_imp_Fiscal := Daruma_Registry_SintegraUF(pchar(Str_UF));

         Retorno_imp_Fiscal:=Daruma_Sintegra_GerarRegistrosArq(Str_Data_Inicio_Movimento,
                                                               Str_Data_Fim_Movimento,
                                                               Str_Municipio, Str_Fax,
                                                               Str_Cod_Convenio,
                                                               Str_Cod_Natureza,
                                                               Str_Cod_Finalidade,
                                                               Str_Logradouro,
                                                               Str_Numero,
                                                               Str_Complemento,
                                                               Str_Bairro,Str_CEP,
                                                               Str_Nome_Contato, Str_Telefone);
         end
    else if s_ImpFiscal = 'ECF Bematech'
    then begin
         Retorno_imp_Fiscal:=Bematech_FI_RelatorioSintegraMFD( 63,
                                                              pchar( 'SINTEGRA.TXT' ),
                                                              pchar( Str_Mes ),
                                                              pchar( Str_Ano ),
                                                              pchar( Str_Razao ),
                                                              pchar( Str_Logradouro ),
                                                              pchar( Str_Numero ),
                                                              pchar( Str_Complemento ),
                                                              pchar( Str_Bairro ),
                                                              pchar( Str_Municipio ),
                                                              pchar( Str_CEP ),
                                                              pchar( Str_Telefone ),
                                                              pchar( Str_Fax ),
                                                              pchar( Str_Nome_Contato ) );
         end
    else if s_ImpFiscal = 'ECF Elgin'
    then begin
         Retorno_imp_Fiscal:=Elgin_RelatorioSintegraMFD( 63,
                                                        pchar( 'SINTEGRA.TXT' ),
                                                        pchar( Str_Mes ),
                                                        pchar( Str_Ano ),
                                                        pchar( Str_Razao ),
                                                        pchar( Str_Logradouro ),
                                                        pchar( Str_Numero ),
                                                        pchar( Str_Complemento ),
                                                        pchar( Str_Bairro ),
                                                        pchar( Str_Municipio ),
                                                        pchar( Str_CEP ),
                                                        pchar( Str_Telefone ),
                                                        pchar( Str_Fax ),
                                                        pchar( Str_Nome_Contato ) );
         end
    else if s_ImpFiscal = 'ECF Sweda'
    then begin
         Retorno_imp_Fiscal:=ECF_RelatorioSintegraMFD( 63,
                                                      pchar( 'SINTEGRA.TXT' ),
                                                      pchar( Str_Mes ),
                                                      pchar( Str_Ano ),
                                                      pchar( Str_Razao ),
                                                      pchar( Str_Logradouro ),
                                                      pchar( Str_Numero ),
                                                      pchar( Str_Complemento ),
                                                      pchar( Str_Bairro ),
                                                      pchar( Str_Municipio ),
                                                      pchar( Str_CEP ),
                                                      pchar( Str_Telefone ),
                                                      pchar( Str_Fax ),
                                                      pchar( Str_Nome_Contato ) );
         end;
   Except
     DC;
     InformaError('Não foi possivél gerar o Arquivo do Sintegra!'+
                  'Verifique se as informações abaixo esta devidamente preenchida!!!'+#13+#13+
                  'Dt.Inicio Movimento: '+Str_Data_Inicio_Movimento+#13+
                  'Dt.Final Movimento.: '+Str_Data_Fim_Movimento+#13+
                  'Municipio..........: '+Str_Municipio+#13+
                  'Fax................: '+Str_Fax+#13+
                  'Código Convênio....: '+Str_Cod_Convenio+#13+
                  'Código da Natureza.: '+Str_Cod_Natureza+#13+
                  'Código Finalidade..: '+Str_Cod_Finalidade+#13+
                  'Logradouro.........: '+Str_Logradouro+#13+
                  'Número.............: '+Str_Numero+#13+
                  'Complemento........: '+Str_Complemento+#13+
                  'Bairro.............: '+Str_Bairro+#13+
                  'Cep................: '+Str_CEP+#13+
                  'Nome Contato.......: '+Str_Nome_Contato+#13+
                  'Telefone...........: '+Str_Telefone+#13+
                  'Razão Social.......: '+Str_Razao);
     end;

    if retorno_imp_fiscal = 1
    then begin
         Sleep(2000);

         sNomeArq:=NomeArquivo_VendasPeriodo5795;

         FMenuFiscal.CopiaArq('SINTEGRA.txt',sNomeArq,0);

         Sleep(1000);

         FMenuFiscal.EArquivo.Text:='C:\Apgef\PAF\'+sNomeArq;

         if GerarEADArquivo(FMenuFiscal.EArquivo.Text)<>''
         then Informa('Arquivo gerado com Sucesso!');

         LStatus.Caption:='';
         Application.ProcessMessages;
         Close;
         end
    else begin
         Application.ProcessMessages;
         Analisa_iRetorno();
         Retorno_Impressora;
         //Informa('Não foi possivél gerar o arquivo Sintegra, a Impressora não responde!');
         end;          

    LStatus.Caption:='';
    BtConvenio57_95.Enabled:=True;
    BtAtoCotep.Enabled:=True;
    DC;
end;

procedure TFVendasPeriodo.FormShow(Sender: TObject);
begin
     LStatus.Caption:='';
end;


procedure TFVendasPeriodo.Vendas_No_Periodo_Cotepe(dataincial:TDate;datafinal:TDate);
var
 qry, qryfilho                : TSQLQuery;
 sql, sqlfilho                : string;
 DtIni,
 DtFim,
 linha,
 Branco                       : string;
 InscEstEmpresa,
 InscMunEmpresa,
 NomeEmpresa,
 ComplEmpresa,
 MunicipioEmpresa,
 UfEmpresa,
 FaxEmpresa,
 emailEmpresa,
 CgcEmpresa,
 CodMunIBGE,
 SuframaEmpresa,
 CEP,
 Numero,
 Bairro,
 Complemento,
 Logradouro,
 Contato,
 FaxContato,
 TelContato                   : String;
 IdConvenio,
 IdOperacao,
 IdFinalidArq                 : string;
 //
 nuserie,
 nucontreinicioop,
 nucontreducao,
 nucoo,
 nucoofinal,
 vltotgeral,
 codtotpar,
 nrtotpar,
 vlracumtot                   : string;
 vlvendabruta                 : Currency;
 //
 ContBloco0,
 ContBloco0000,
 ContBloco0001,
 ContBloco0005,
 ContBloco0100,
 ContBloco0150,
 ContBloco0190,
 ContBloco0200,
 //
 ContBlocoC,
 ContBlocoC400,
 ContBlocoC405,
 ContBlocoC420,
 ContBlocoC425,
 ContBlocoC460,
 ContBlocoC470,
 ContBlocoC490,
 //
 ContBloco9,
 TotalArquivo   : integer;
 //
 CPFContador,
 CRCContador                  : string;
 PrRedBaseICMS                : Double;
 //
 nmcliente,
 nucpf,
 nucnpj,
 nuinscest                    : string;
 //
 cdunidade,
 nmunidade                    : string;
 //
 nmdetalhe,
 cdbarras,
 cdncm,
 Aliquota                     : string;
 //
 BolVlInvent                  : boolean;
 ValorInventario,
 VlQtInvent,
 VlItemInvent,
 VlTotalInvent                : String;
 lista                        : TStrings;

 cdcliente,
 nusaida,
 dtemissao,
 vltotal,
 vlbcicms,
 vlicms,
 vlpis,
 vlcofins,
 cddetalhe,
 qtitem,
 unidade,
 ldesconto,
 cfop,
 vlbaseicms,
 alicms,
 vlbaseicmssubtrib,
 vlicmssubtrib,
 vlbaseipi,
 vlbasepis,
 vlbasecofins,
 csticms,
 codnat,
 alst,
 indapur,
 cstipi,
 codenq,
 alipi,
 alipis,
 cstpis,
 alpis,
 qtbcpis,
 cstcofins,
 alcofins,
 qtbccofins                   : string;
 codpai                       : integer;
begin
 lista := TStringList.Create;

 Branco        := '';
 ContBloco0    := 0;
 ContBloco9    := 0;
 //
 ContBloco0000 := 0;
 ContBloco0001 := 0;
 ContBloco0005 := 0;
 ContBloco0100 := 0;
 ContBloco0150 := 0;
 ContBloco0190 := 0;
 ContBloco0200 := 0;
 //ContBlocoC400,
 ContBlocoC405 := 0;
 ContBlocoC420 := 0;
 ContBlocoC425 := 0;
 ContBlocoC460 := 0;
 ContBlocoC470 := 0;
 ContBlocoC490 := 0;

 // BLOCO 0

 sql := 'SELECT NOME_FANTASIA,RAZAO_SOCIAL,CNPJ,INSC_MUNICIPAL,ENDERECO,BAIRRO,CEP,CIDADE,UF,TELEFONE,'+
        'INSC_ESTADUAL,INSC_SUFRAMA,EMAIL,COD_MUNICIPIO,COMPLEMENTO FROM EMPRESA';

 try
  qry := TSqlQuery.Create(nil);
  qry.SQLConnection:=DM.SQLConnectionLocal;

  qryfilho := TSqlQuery.Create(nil);
  qryfilho.SQLConnection:=DM.SQLConnectionLocal;

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sql);
  qry.Open;
  // Registro 000, 005, 0100
  ContBloco0       := 1;
  CgcEmpresa       := RemoveCaractesresEspeciais(qry.FieldByName('CNPJ').AsString);
  InscEstEmpresa   := RemoveCaractesresEspeciais(qry.FieldByName('INSC_ESTADUAL').AsString);
  NomeEmpresa      := qry.FieldByName('RAZAO_SOCIAL').AsString;
  MunicipioEmpresa := qry.FieldByName('CIDADE').AsString;
  UfEmpresa        := qry.FieldByName('UF').AsString;
  FaxEmpresa       := RemoveCaractesresEspeciais(qry.FieldByName('TELEFONE').AsString);
  DtIni            := RetornaDataMovtoECF(DateToStr(dataincial));
  DtFim            := RetornaDataMovtoECF(DateToStr(datafinal));
  NomeEmpresa      := qry.fieldbyname('RAZAO_SOCIAL').AsString;
  CodMunIBGE       := qry.fieldbyname('COD_MUNICIPIO').AsString;
  SuframaEmpresa   := qry.fieldbyname('INSC_SUFRAMA').AsString;
  InscMunEmpresa   := qry.fieldbyname('INSC_MUNICIPAL').AsString;

  //0000
  linha := '|0000|003|0|'+DtIni+'|'+DtFim+'|'+NomeEmpresa+'|'+CgcEmpresa+'||'+UfEmpresa+'|'+InscEstEmpresa+'|'+
           AjustaInteiro(CodMunIBGE,7)+'|'+InscMunEmpresa+'|'+AjustaStr(SuframaEmpresa,9)+'|A|1|';
  lista.Add(linha);
  inc(ContBloco0000);

  //0001
  linha := '|0001|0|';
  lista.Add(linha);
  inc(ContBloco0001);

  // 00005
  NomeEmpresa    := qry.fieldbyname('NOME_FANTASIA').AsString;
  CEP            := RetiraCaracteresEspeciais(qry.fieldbyname('CEP').AsString);
  Logradouro     := qry.fieldbyname('ENDERECO').AsString;
  Numero         := AjustaInteiro(RemoveChar(qry.FieldByName('ENDERECO').AsString),5);
  ComplEmpresa   := qry.fieldbyname('COMPLEMENTO').AsString;
  Bairro         := qry.fieldbyname('BAIRRO').AsString;
  TelContato     := AjustaStr(qry.fieldbyname('TELEFONE').AsString,10);
  FaxEmpresa     := TelContato;
  emailEmpresa   := qry.fieldbyname('EMAIL').AsString;

  linha := '|0005|'+NomeEmpresa+'|'+CEP+'|'+Logradouro+'|'+Numero+'|'+ComplEmpresa+'|'+Bairro+'|'+TelContato+'|'+FaxEmpresa+'|'+emailEmpresa+'|';
  lista.Add(linha);
  inc(ContBloco0005);

  // 0100 Dados do Contabilista. Irei reaproveitar variáveis já criadas;

  sql := 'SELECT NOME,CPF,CRC,CNPJ,CEP,ENDERECO,NUMERO,COMPLEMENTO,BAIRRO,'+
         'FONE,FAX,EMAIL,COD_MUNICIPIO FROM CONTABILISTA';
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sql);
  qry.Open;

  NomeEmpresa  := qry.fieldbyname('NOME').AsString;
  CPFContador  := RetiraCaracteresEspeciais(AjustaInteiro(qry.fieldbyname('CPF').AsString,11));
  CRCContador  := RetiraCaracteresEspeciais(qry.fieldbyname('CRC').AsString);
  CgcEmpresa   := RetiraCaracteresEspeciais(AjustaInteiro(qry.fieldbyname('CNPJ').AsString,14));
  CEP          := RetiraCaracteresEspeciais(AjustaInteiro(qry.fieldbyname('CEP').AsString,8));
  Logradouro   := qry.fieldbyname('ENDERECO').AsString;
  Numero       := qry.fieldbyname('NUMERO').AsString;
  ComplEmpresa := qry.fieldbyname('COMPLEMENTO').AsString;
  Bairro       := qry.fieldbyname('BAIRRO').AsString;
  TelContato   := RetiraCaracteresEspeciais(qry.fieldbyname('FONE').AsString);
  FaxEmpresa   := RetiraCaracteresEspeciais(qry.fieldbyname('FAX').AsString);
  emailEmpresa := qry.fieldbyname('EMAIL').AsString;
  CodMunIBGE   := AjustaInteiro(qry.fieldbyname('COD_MUNICIPIO').AsString,7);

  linha := '|0100|'+NomeEmpresa+'|'+CPFContador+'|'+CRCContador+'|'+CgcEmpresa+'|'+CEP+'|'+Logradouro+'|'+Numero+'|'+ComplEmpresa+'|'+Bairro+'|'+
                   TelContato+'|'+FaxEmpresa+'|'+emailEmpresa+'|'+CodMunIBGE+'|';
  lista.Add(linha);
  inc(ContBloco0100);

  // 0150

  {sql := ' SELECT C.CODIGO,C.NOME,C.CGC,C.CPF,C.IE,C.ENDERECO,C.BAIRRO          '+
         ' FROM CLIENTE C, VENDA V, VENDA_ITEM IT                               '+
         ' WHERE C.CODIGO = V.COD_CLIENTE                                       '+
         ' AND   V.CODIGO = IT.CODIGO                                           '+
         ' AND   V.DATA BETWEEN '''+FormatDateTime('yyyy-mm-dd',dataincial)+''' '+
         ' AND '''+FormatDateTime('yyyy-mm-dd',datafinal)+'''                   '+
         ' GROUP BY C.CODIGO,C.NOME,C.CGC,C.CPF,C.IE,C.ENDERECO,C.BAIRRO        '+
         ' ORDER BY NOME                                                        ';

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sql);
  qry.Open;
  qry.First;
  while not qry.Eof do
   begin
    cdcliente   := '';
    nmcliente   := '';
    nucpf       := '';
    nucnpj      := '';
    nuinscest   := '';
    Logradouro  := '';
    Numero      := '';
    Bairro      := '';
    //
    cdcliente   := qry.fieldbyname('CODIGO').AsString;
    nmcliente   := qry.fieldbyname('NOME').AsString;
    nucpf       := qry.fieldbyname('CPF').AsString;
    nucnpj      := qry.fieldbyname('CGC').AsString;
    nuinscest   := qry.fieldbyname('IE').AsString;
    Logradouro  := qry.fieldbyname('ENDERECO').AsString;
    Numero      := RemoveChar(qry.fieldbyname('ENDERECO').AsString);
    Bairro      := qry.fieldbyname('BAIRRO').AsString;
    //
    if cdcliente  <> '' then cdcliente  := cdcliente;
    if nmcliente  <> '' then nmcliente  := nmcliente;
    if nucpf      <> '' then nucpf      := RetiraCaracteresEspeciais(nucpf);
    if nucnpj     <> '' then nucnpj     := RetiraCaracteresEspeciais(nucnpj);
    if nuinscest  <> '' then nuinscest  := RetiraCaracteresEspeciais(nuinscest);
    if Logradouro <> '' then Logradouro := Logradouro;
    if Bairro     <> '' then Bairro     := Bairro;
    //
    linha := '|0150|'+cdcliente+'|'+nmcliente+'|1058|'+nucnpj+'|'+nucpf+'|'+nuinscest+'|||'+Logradouro+'|'+Numero+'||'+Bairro+'|';
    lista.Add(linha);
    inc(ContBloco0150);
    qry.Next;
   end; }

  //0190

  sql := ' SELECT UN.CODIGO,UN.DESCRICAO,UN.ABREVIATURA                        '+
         ' FROM VENDA V, VENDA_ITEM IT, UNIDADES UN                            '+
         ' WHERE V.CODIGO = IT.CODIGO                                          '+
         ' AND   UN.ABREVIATURA = IT.UNIDADE                                   '+
         ' AND  V.DATA BETWEEN '''+FormatDateTime('yyyy-mm-dd', dataincial)+''''+
         ' AND '''+FormatDateTime('yyyy-mm-dd',datafinal)+'''                  '+
         ' GROUP BY UN.CODIGO,UN.DESCRICAO,UN.ABREVIATURA                      ';
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sql);
  qry.Open;
  qry.First;
  while not qry.Eof do
   begin
    cdunidade := qry.fieldbyname('ABREVIATURA').AsString;
    nmunidade := qry.fieldbyname('ABREVIATURA').AsString;
    //
    linha := '|0190|'+cdunidade+'|'+nmunidade+'|';
    lista.Add(linha);
    inc(ContBloco0190);
    qry.Next;
   end;

   // 0200

  sql := ' SELECT IT.COD_PRODUTO,IT.DESCRICAO,IT.UNIDADE,IT.ALIQUOTA,E.COD_NCM,E.CODBARRA   '+
         ' FROM VENDA_ITEM IT, VENDA V, ESTOQUE E                                     '+
         ' WHERE V.CODIGO = IT.CODIGO                                                 '+
         ' AND   IT.COD_PRODUTO = E.CODIGO                                            '+
         ' AND  V.DATA BETWEEN '''+FormatDateTime('yyyy-mm-dd', dataincial)+'''       '+
         ' AND '''+FormatDateTime('yyyy-mm-dd',datafinal)+'''                         '+
         ' GROUP BY IT.COD_PRODUTO,IT.DESCRICAO,IT.UNIDADE,IT.ALIQUOTA,E.COD_NCM,E.CODBARRA '+
         ' ORDER BY IT.DESCRICAO                                                               ';

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sql);
  qry.Open;
  qry.First;
  while not qry.Eof do
   begin
    cddetalhe := qry.fieldbyname('COD_PRODUTO').AsString;
    nmdetalhe := qry.fieldbyname('DESCRICAO').AsString;
    cdncm     := qry.fieldbyname('COD_NCM').AsString;
    Aliquota  := FormatFloat('#####0.00',qry.fieldbyname('ALIQUOTA').AsFloat);
    nmunidade := qry.fieldbyname('UNIDADE').AsString;
    cdbarras  := qry.fieldbyname('CODBARRA').AsString;
    //
    linha := '|0200|'+cddetalhe+'|'+nmdetalhe+'|'+cdbarras+'||'+nmunidade+'|04|'+cdncm+'||||'+Aliquota+'|';
    lista.Add(linha);
    inc(ContBloco0200);
    qry.Next;
   end;

   // 0990
   inc(ContBloco0);
   ContBloco0 := 1+ContBloco0000+ContBloco0001+ContBloco0005+ContBloco0100+ContBloco0150+ContBloco0190+ContBloco0200;
   //
   linha := '|0990|'+IntToStr(ContBloco0)+'|';
   lista.Add(linha);


  //=============================
  //  Registro C
  //=============================
  //
  ContBlocoC    := 0;
  linha := '|C001|0|';
  lista.add(linha);

  // C400

  sql := ' SELECT PDV,NUMERO_ECF,TIPO_ECF                                      '+
         ' FROM VENDA                                                          '+
         ' WHERE DATA BETWEEN '''+FormatDateTime('yyyy-mm-dd', dataincial)+''' '+
         ' AND '''+FormatDateTime('yyyy-mm-dd',datafinal)+'''                  '+
         ' GROUP BY PDV,NUMERO_ECF,TIPO_ECF                                    ';

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sql);
  qry.Open;
  qry.First;
  while not qry.Eof do
   begin
    nuserie := qry.fieldbyname('NUMERO_ECF').AsString;
    nusaida := AjustaInteiro(qry.fieldbyname('PDV').AsString,03);
    Numero  := qry.fieldbyname('TIPO_ECF').AsString;

    linha  := '|C400|2D|'+Numero+'|'+nuserie+'|'+nusaida+'|';

    Inc(ContBlocoC400);
    lista.Add(linha);
    qry.Next;
   end;

  //C405

  sql := ' SELECT CODIGO,DATA_MOVIMENTO,VALOR_VENDA_BRUTA,CONTADOR_REINICIO,             '+
         '        NR_CONTADOR_Z,NRO_CONTADOR_FIM,VALOR_VENDA_GERAL                       '+
         ' FROM REDUCOES                                                                 '+
         ' WHERE DATA_MOVIMENTO BETWEEN '''+FormatDateTime('yyyy-mm-dd', dataincial)+''' '+
         ' AND '''+FormatDateTime('yyyy-mm-dd',datafinal)+'''                            '+
         ' ORDER BY CODIGO,DATA_MOVIMENTO   ';

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sql);
  qry.Open;
  qry.First;
  while not qry.Eof do
   begin
    dtemissao        := RetornaDataMovtoECF(qry.Fieldbyname('DATA_MOVIMENTO').AsString);
    nucontreinicioop := AjustaInteiro(qry.Fieldbyname('CONTADOR_REINICIO').AsString,03);
    nucontreducao    := AjustaInteiro(qry.Fieldbyname('NR_CONTADOR_Z').AsString,06);
    nucoofinal       := AjustaInteiro(qry.Fieldbyname('NRO_CONTADOR_FIM').AsString,06);
    vlvendabruta     := vlvendabruta + (qry.Fieldbyname('VALOR_VENDA_BRUTA').AsFloat);
    vltotgeral       := FormatFloat('#####0.00',qry.Fieldbyname('VALOR_VENDA_GERAL').AsFloat);
    qry.Next;
   end;
    linha  := '|C405|'+dtemissao+'|'+nucontreinicioop+'|'+nucontreducao+'|'+nucontreducao+'|'+vltotgeral+'|'+FormatFloat('#####0.00',vlvendabruta)+'|';
    Inc(ContBlocoC405);
    lista.Add(linha);

  // C420
  Sql := ' SELECT IT.COD_TOTALIZADOR_PARCIAL,SUM(IT.VL_TOTAL)AS TOTAL FROM VENDA_ITEM IT, VENDA V                 '+
         ' WHERE V.CODIGO = IT.CODIGO                                           '+
         ' AND  V.DATA BETWEEN '''+FormatDateTime('yyyy-mm-dd', dataincial)+''' '+
         ' AND '''+FormatDateTime('yyyy-mm-dd',datafinal)+'''                   '+
         ' GROUP BY IT.COD_TOTALIZADOR_PARCIAL,IT.VL_TOTAL                                           ';

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sql);
  qry.Open;
  qry.First;
  while not qry.Eof do
   begin
    if (Copy(qry.Fieldbyname('COD_TOTALIZADOR_PARCIAL').AsString,3,1)='F') OR
       (Copy(qry.Fieldbyname('COD_TOTALIZADOR_PARCIAL').AsString,3,1)='I') OR
       (Copy(qry.Fieldbyname('COD_TOTALIZADOR_PARCIAL').AsString,3,1)='N')
    then begin
         codtotpar:=Copy(qry.Fieldbyname('COD_TOTALIZADOR_PARCIAL').AsString,3,1)+
                    Copy(qry.Fieldbyname('COD_TOTALIZADOR_PARCIAL').AsString,1,1);
         nrtotpar  := '';  
         end
    else begin
         codtotpar :='0'+qry.Fieldbyname('COD_TOTALIZADOR_PARCIAL').AsString;
         nrtotpar  := '0'+Copy(qry.Fieldbyname('COD_TOTALIZADOR_PARCIAL').AsString,1,1);
         end;
    vlracumtot:= FormatFloat('#####0.00',qry.Fieldbyname('TOTAL').AsFloat);

    linha  := '|C420|'+codtotpar+'|'+vlracumtot+'|'+nrtotpar+'||';

    Inc(ContBlocoC420);
    lista.Add(linha);
    qry.Next;
   end;


   // C425

  {sql := ' SELECT IT.COD_PRODUTO,IT.QUANTIDADE,IT.VL_UNITARIO,IT.UNIDADE        '+
         ' FROM VENDA V, VENDA_ITEM IT                                          '+
         ' WHERE V.CODIGO  = IT.CODIGO                                          '+
         ' AND V.DATA BETWEEN '''+FormatDateTime('yyyy-mm-dd', dataincial)+'''  '+
         ' AND '''+FormatDateTime('yyyy-mm-dd',datafinal)+'''                   ';

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sql);
  qry.Open;
  qry.First;
  while not qry.Eof do
   begin
    cddetalhe    := AjustaStr(qry.fieldbyname('COD_PRODUTO').AsString,60);
    qtitem       := FormatFloat('#####0.000',qry.fieldbyname('QUANTIDADE').AsFloat);
    VlItemInvent := FormatFloat('#####0.00',qry.fieldbyname('VL_UNITARIO').AsFloat);
    unidade      := AjustaStr(qry.fieldbyname('UNIDADE').AsString, 06);

    linha  := '|C425|'+cddetalhe+'|'+qtitem+'|'+unidade+'|'+VlItemInvent+'|0|0|';

    Inc(ContBlocoC425);
    lista.Add(linha);
    qry.Next;
   end; }

  // C460

  sql := ' SELECT V.CODIGO,V.NUMERO_CUPOM,V.DATA,V.TOTAL,V.CUPOM_CANCELADO,     '+
         '        C.CGC,C.CPF,C.NOME                                            '+
         ' FROM VENDA V, CLIENTE C                                              '+
         ' WHERE V.COD_CLIENTE = C.CODIGO                                       '+
         ' AND CUPOM_CANCELADO = ''N''                                          '+
         ' AND V.DATA BETWEEN '''+FormatDateTime('yyyy-mm-dd', dataincial)+'''  '+
         ' AND '''+FormatDateTime('yyyy-mm-dd',datafinal)+'''                   ';

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sql);
  qry.Open;
  qry.First;
  while not qry.Eof do
   begin
    codpai      := qry.fieldbyname('CODIGO').AsInteger;
    nmcliente   := qry.fieldbyname('NOME').AsString;
    nucoo       := AjustaInteiro(qry.fieldbyname('NUMERO_CUPOM').AsString,06);
    dtemissao   := RetornaDataMovtoECF(qry.fieldbyname('DATA').AsString);
    vltotal     := FormatFloat('#####0.00',qry.fieldbyname('TOTAL').AsFloat);
    vlpis       := '0';
    vlcofins    := '0';
    if not qry.FieldByName('CPF').IsNull then nucpf := qry.fieldbyname('CPF').AsString
    else nucpf := qry.fieldbyname('CGC').AsString;
    nucpf      := RetiraCaracteresEspeciais(nucpf);

    linha  := '|C460|2D|00|'+nucoo+'|'+dtemissao+'|'+vltotal+'|'+vlpis+'|'+vlcofins+'|'+nucpf+'|'+nmcliente+'|';
    Inc(ContBlocoC460);
    lista.Add(linha);

    // C470  #####  REGISTRO FILHO DO BLOCO C460  #####
    sqlfilho := ' SELECT IT.CODIGO,IT.COD_PRODUTO,IT.QUANTIDADE,IT.UNIDADE,IT.VL_TOTAL,'+
                '        IT.ALIQUOTA,IT.CST                                            '+
                ' FROM VENDA_ITEM IT                                                   '+
                ' WHERE IT.CODIGO = '''+IntToStr(codpai)+'''                           ';

    qryfilho.Close;
    qryfilho.SQL.Clear;
    qryfilho.SQL.Add(sqlfilho);
    qryfilho.Open;
    qryfilho.First;
    while not qryfilho.Eof do
     begin
      cddetalhe := qryfilho.fieldbyname('COD_PRODUTO').AsString;
      qtitem    := AjustaInteiro(qryfilho.fieldbyname('QUANTIDADE').AsString,03);
      unidade   := qryfilho.fieldbyname('UNIDADE').AsString;
      vlpis     := '0';
      vlcofins  := '0';
      vltotal   := FormatFloat('#####0.00',qryfilho.fieldbyname('VL_TOTAL').AsFloat);
      Aliquota  := FormatFloat('#####0.00',qryfilho.fieldbyname('ALIQUOTA').AsFloat);
      csticms   := qryfilho.fieldbyname('CST').AsString;

      linha  := '|C470|'+cddetalhe+'|'+qtitem+'|000|'+unidade+'|'+vltotal+'|'+csticms+'|5929|'+Aliquota+'|'+vlpis+'|'+vlcofins+'|';

      Inc(ContBlocoC470);
      lista.Add(linha);
      qryfilho.Next;//qry Filho
     end;

    qry.Next;//qry Pai
   end;

  // C490
  sql := ' SELECT IT.CST,IT.ALIQUOTA,SUM(IT.VL_TOTAL)AS VL_TOTAL,               '+
         '        IT.VALOR_ICMS,SUM(IT.BASE_ICMS)AS BASE_ICMS                   '+
         ' FROM VENDA V, VENDA_ITEM IT                                          '+
         ' WHERE V.CODIGO = IT.CODIGO                                           '+
         ' AND V.DATA BETWEEN '''+FormatDateTime('yyyy-mm-dd', dataincial)+'''  '+
         ' AND '''+FormatDateTime('yyyy-mm-dd',datafinal)+'''                   '+
         ' GROUP BY IT.CST,IT.ALIQUOTA,IT.VL_TOTAL,IT.BASE_ICMS,IT.VALOR_ICMS   ';

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sql);
  qry.Open;
  qry.First;
  while not qry.Eof do
   begin
    Aliquota   := FormatFloat('#####0.00',qry.fieldbyname('ALIQUOTA').AsFloat);
    vltotal    := qry.fieldbyname('VL_TOTAL').AsString;
    vlbcicms   := qry.fieldbyname('BASE_ICMS').AsString;
    vlicms     := qry.fieldbyname('VALOR_ICMS').AsString;
    csticms    := qry.fieldbyname('CST').AsString;

    {if (Copy(qry.fieldbyname('CST').AsString,2,2)='10')OR
       (Copy(qry.fieldbyname('CST').AsString,2,2)='30')OR
       (Copy(qry.fieldbyname('CST').AsString,2,2)='40')OR
       (Copy(qry.fieldbyname('CST').AsString,2,2)='41')OR
       (Copy(qry.fieldbyname('CST').AsString,2,2)='50')OR
       (Copy(qry.fieldbyname('CST').AsString,2,2)='60')
    then begin
         vlbcicms:='';
         Aliquota:='';
         vlicms:='';
         end;}

    linha  := '|C490|'+csticms+'|5929|'+Aliquota+'|'+vltotal+'|'+vlbcicms+'|'+vlicms+'||';

    Inc(ContBlocoC490);
    lista.Add(linha);
    qry.Next;
   end;

   // C990
   ContBlocoC:=(ContBlocoC+ContBlocoC400+ContBlocoC405+ContBlocoC420+
                ContBlocoC425+ContBlocoC460+ContBlocoC470+ContBlocoC490);
   linha := '|C990|'+IntToStr(2 + ContBlocoC)+'|';
   lista.Add(linha);

   //=============================
   //  Registro D
   //=============================

   linha := '|D001|1|';
   lista.add(linha);
   linha := '|D990|2|';
   lista.add(linha);

   //=============================
   //  Registro E
   //=============================

   linha := '|E001|1|';
   lista.add(linha);

   {linha := '|E100|'+DtIni+'|'+DtFim+'|';
   lista.add(linha);
   linha := '|E110|0|0|0|0|0|0|0|0|0|0|0|0|0|0|';
   lista.add(linha);
   linha := '|E116|000|0||0|||||';
   lista.add(linha);}

   linha := '|E990|2|';
   lista.add(linha);

   //=============================
   //  Registro H
   //=============================

   linha := '|H001|1|';
   lista.Add(linha);
   linha := '|H990|2|';
   lista.Add(linha);

   //=============================
   //  Registro 1
   //=============================

   linha := '|1001|1|';
   lista.Add(linha);
   linha := '|1990|2|';
   lista.Add(linha);

   //  Registro 9999

   // 9001
   Inc(ContBloco9);
   linha := '|9001|0|';
   lista.add(linha);
   Inc(ContBloco9);
   //9900
   linha := '|9900|0000|'+IntToStr(ContBloco0000)+'|';
   Inc(ContBloco9);
   lista.Add(linha);
   linha := '|9900|0001|'+IntToStr(ContBloco0001)+'|';
   Inc(ContBloco9);
   lista.Add(linha);
   linha := '|9900|0005|'+IntToStr(ContBloco0005)+'|';
   Inc(ContBloco9);
   lista.Add(linha);
   linha := '|9900|0100|'+IntToStr(ContBloco0100)+'|';
   Inc(ContBloco9);
   lista.Add(linha);
   linha := '|9900|0150|'+IntToStr(ContBloco0150)+'|';
   Inc(ContBloco9);
   lista.Add(linha);
   linha := '|9900|0190|'+IntToStr(ContBloco0190)+'|';
   Inc(ContBloco9);
   lista.Add(linha);
   linha := '|9900|0200|'+IntToStr(ContBloco0200)+'|';
   Inc(ContBloco9);
   lista.Add(linha);
   linha := '|9900|0990|1|';
   Inc(ContBloco9);
   lista.Add(linha);
   //
   linha := '|9900|C001|1|';
   lista.Add(linha);
   Inc(ContBloco9);
   linha := '|9900|C400|'+IntToStr(ContBlocoC400)+'|';
   lista.Add(linha);
   Inc(ContBloco9);
   linha := '|9900|C405|'+IntToStr(ContBlocoC405)+'|';
   lista.Add(linha);
   Inc(ContBloco9);
   linha := '|9900|C420|'+IntToStr(ContBlocoC420)+'|';
   lista.Add(linha);
   Inc(ContBloco9);
   linha := '|9900|C425|'+IntToStr(ContBlocoC425)+'|';
   lista.Add(linha);
   Inc(ContBloco9);
   linha := '|9900|C460|'+IntToStr(ContBlocoC460)+'|';
   lista.Add(linha);
   Inc(ContBloco9);
   linha := '|9900|C470|'+IntToStr(ContBlocoC470)+'|';
   lista.Add(linha);
   Inc(ContBloco9);
   linha := '|9900|C490|'+IntToStr(ContBlocoC490)+'|';
   lista.Add(linha);
   Inc(ContBloco9);
   linha := '|9900|C990|1|';
   lista.Add(linha);
   Inc(ContBloco9);
   //
   linha := '|9900|D001|1|';
   lista.Add(linha);
   Inc(ContBloco9);
   linha := '|9900|D990|1|';
   lista.Add(linha);
   Inc(ContBloco9);
   //
   linha := '|9900|E001|1|';
   lista.Add(linha);
   Inc(ContBloco9);

   {linha := '|9900|E100|1|';
   lista.Add(linha);
   Inc(ContBloco9);
   linha := '|9900|E110|1|';
   lista.Add(linha);
   Inc(ContBloco9);
   linha := '|9900|E116|1|';
   lista.Add(linha);
   Inc(ContBloco9);}

   linha := '|9900|E990|1|';
   lista.Add(linha);
   Inc(ContBloco9);
   //
   linha := '|9900|H001|1|';
   lista.Add(linha);
   Inc(ContBloco9);
   linha := '|9900|H990|1|';
   lista.Add(linha);
   Inc(ContBloco9);
   //
   linha := '|9900|1001|1|';
   lista.Add(linha);
   Inc(ContBloco9);
   linha := '|9900|1990|1|';
   lista.Add(linha);
   Inc(ContBloco9);
   //
   linha := '|9900|9001|1|';
   lista.Add(linha);
   Inc(ContBloco9);
   linha := '|9900|9900|'+IntToStr(ContBloco9 + 1)+'|';
   lista.Add(linha);
   Inc(ContBloco9);
   //
   linha := '|9900|9990|1|';
   lista.Add(linha);
   Inc(ContBloco9);
   linha := '|9900|9999|1|';
   lista.Add(linha);
   Inc(ContBloco9);
   //
   linha := '|9990|'+IntToStr(ContBloco9 + 1)+'|';
   lista.Add(linha);

   // 9999
   TotalArquivo := 1;
   TotalArquivo := TotalArquivo+ContBloco0+ContBlocoC+ContBloco9+10;

   linha := '|9999|'+IntToStr(TotalArquivo)+'|';
   lista.Add(linha);

   // Salva Arquivo !!
   linha := NomeArquivo_VendasPeriodo;
   lista.SaveToFile(linha);
   GerarEADArquivo(linha);
   Informa('Arquivo Gerado com Sucesso!');
   FMenuFiscal.EArquivo.Text:=NomeArquivo_VendasPeriodo;
 finally
  FreeAndNil(qry);
  FreeAndNil(lista);
 end;
Close;
end;

procedure TFVendasPeriodo.BtAtoCotepClick(Sender: TObject);
begin
     if Confirma('Deseja gerar o Arquivo?')=mrYes
     then begin
          LStatus.Caption:='Gerando o arquivo Ato Cotep/ICMS 09/08. Aguarde...';
          Repaint;
          Vendas_No_Periodo_Cotepe(FMenuFiscal.EDataI.Date,FMenuFiscal.EDataF.Date);
          LStatus.Caption:='';
          Repaint;
          end;
end;

end.
