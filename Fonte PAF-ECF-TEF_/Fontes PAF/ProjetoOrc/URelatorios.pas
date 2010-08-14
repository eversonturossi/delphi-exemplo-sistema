unit URelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, ComCtrls, RLPreviewForm, RLPrintDialog, RLFilters,
  RLDraftFilter, DB, DBClient, FMTBcd, SqlExpr, Provider, StdCtrls, Grids,
  DBGrids, RLRichText;

type
  TFRelatorios = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    RLDAV: TRLReport;
    RLBand79: TRLBand;
    RLLabel257: TRLLabel;
    RLEndEmpresaDAV: TRLLabel;
    RLEmpresaDAV: TRLLabel;
    RLDraw29: TRLDraw;
    RLLabel297: TRLLabel;
    RLBand80: TRLBand;
    RLLabel258: TRLLabel;
    RLBand81: TRLBand;
    RLLabel300: TRLLabel;
    RLDBText169: TRLDBText;
    RLLabel301: TRLLabel;
    RLDBText170: TRLDBText;
    RLLabel302: TRLLabel;
    RLDBText171: TRLDBText;
    RLLabel303: TRLLabel;
    RLDBText172: TRLDBText;
    RLBand83: TRLBand;
    RLLabel260: TRLLabel;
    RLLabel261: TRLLabel;
    RLSystemInfo58: TRLSystemInfo;
    RLLabel204: TRLLabel;
    RLSystemInfo59: TRLSystemInfo;
    RLDBText168: TRLDBText;
    RLLabel299: TRLLabel;
    RLDocFiscal: TRLLabel;
    RLBand82: TRLBand;
    RLLabel288: TRLLabel;
    RLLabel289: TRLLabel;
    RLLabel290: TRLLabel;
    RLLabel291: TRLLabel;
    RLLabel292: TRLLabel;
    RLLabel293: TRLLabel;
    RLLabel294: TRLLabel;
    RLLabel295: TRLLabel;
    RLLabel296: TRLLabel;
    RLBand84: TRLBand;
    RLLabel262: TRLLabel;
    RLLabel263: TRLLabel;
    RLLabel264: TRLLabel;
    RLLabel265: TRLLabel;
    RLLabel266: TRLLabel;
    RLLabel267: TRLLabel;
    RLLabel268: TRLLabel;
    RLLabel284: TRLLabel;
    RLLabel285: TRLLabel;
    RLLabel286: TRLLabel;
    RLLabel287: TRLLabel;
    RLLabel298: TRLLabel;
    RLDBText167: TRLDBText;
    RLDBText178: TRLDBText;
    RLEnderecoDAV: TRLLabel;
    RLBairroDAV: TRLLabel;
    RLCPF_CNPJ_DAV: TRLLabel;
    RLRG_IE_DAV: TRLLabel;
    RLCidadeDAV: TRLLabel;
    RLUFDAV: TRLLabel;
    RLCEP_DAV: TRLLabel;
    RLFone_DAV: TRLLabel;
    RLCelular_DAV: TRLLabel;
    RLDBText175: TRLDBText;
    RLBand85: TRLBand;
    RLDBText121: TRLDBText;
    RLDBText152: TRLDBText;
    RLDBText153: TRLDBText;
    RLDBText161: TRLDBText;
    RLDBText162: TRLDBText;
    RLDBText163: TRLDBText;
    RLDBText164: TRLDBText;
    RLDBText165: TRLDBText;
    RLDBText166: TRLDBText;
    RLBand1: TRLBand;
    RLSystemInfo24: TRLSystemInfo;
    RLLabel259: TRLLabel;
    RLReimpressao: TRLLabel;
    RLLabel304: TRLLabel;
    RLDBText173: TRLDBText;
    RLDBText174: TRLDBText;
    RLNumDAV: TRLLabel;
    RLLabel1: TRLLabel;
    RLDBText1: TRLDBText;
    TDAVAlterados: TClientDataSet;
    TDAVAlteradosNUMERO_DAV: TIntegerField;
    QConsultaDAVMesclado: TSQLQuery;
    dspConsultaDAVMesclado: TDataSetProvider;
    TConsultaDAVMesclado: TClientDataSet;
    TConsultaDAVMescladoNUMERO_DAV: TIntegerField;
    TConsultaDAVMescladoREF_NUM_DAV: TIntegerField;
    DataSource1: TDataSource;
    RLDAV1: TRLLabel;
    RLDAV2: TRLLabel;
    TDAVAlteradosNUMEROS: TStringField;
    RLDAV3: TRLLabel;
    RLDAV4: TRLLabel;
    RLDAV5: TRLLabel;
    RLDAV6: TRLLabel;
    RLDAV7: TRLLabel;
    RLDAV8: TRLLabel;
    procedure RLBand79BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand84BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand81BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLDAVBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    AChou : boolean;
    iOld_DAV_Mesclado : Integer;
    procedure ConsultaDAVMesclado(xNumDAV : Integer);
    procedure LancaNumDAVMesclado(xNumDAV : Integer);
  public
    { Public declarations }
  end;

var
  FRelatorios: TFRelatorios;

implementation

uses UDM, UBarsa, UConsultaOrcamentos;

{$R *.dfm}

procedure TFRelatorios.RLBand79BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
     RLEmpresaDAV.Caption:=DM.TEmpresaRAZAO.Value+
                           ' - CNPJ: '+DM.TEmpresaCGC.Value+
                           ' - Insc. Estadual: '+DM.TEmpresaIE.Value;

     RLEndEmpresaDAV.Caption:=DM.TEmpresaENDERECO.Value+
                              ' - Bair.: '+DM.TEmpresaBAIRRO.Value+
                              ' - Cep.: '+DM.TEmpresaCEP.Value+
                              ' - Cidade: '+DM.TEmpresaCIDADE.Value+
                              ' - UF: '+DM.TEmpresaUF.Value+
                              ' - Fone: '+DM.TEmpresaFONE.Value;
end;

procedure TFRelatorios.RLBand84BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
   sCPF_CNPJ : String;
begin
     With DM.QPesquisa
     do begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT C.CODIGO,C.CPF,C.RG,C.CGC,C.IE,C.ENDERECO,C.CODBAIRRO,'+
                'C.CODCIDADE,C.CEP,C.UF,C.TELEFONE,C.CELULAR,B.NOME_BAIRRO,CI.NOME_CIDADE '+
                'FROM CLIENTE C');
        Sql.Add('LEFT JOIN BAIRRO B ON B.CODIGO = C.CODBAIRRO');
        Sql.Add('LEFT JOIN CIDADE CI ON CI.CODIGO = C.CODCIDADE');
        Sql.Add('WHERE C.CODIGO= :PCODIGO');
        ParamByName('PCODIGO').AsInteger:=DM.TOrcamentoCODCLIENTE.AsInteger;
        Open;

        sCPF_CNPJ:=Trim(SoNumeros(FieldByName('CPF').AsString));
        if sCPF_CNPJ<>''
        then begin
             RLCPF_CNPJ_DAV.Caption:=FieldByName('CPF').AsString;
             RLRG_IE_DAV.Caption:=FieldByName('RG').AsString;
             end
        else begin
             RLCPF_CNPJ_DAV.Caption:=FieldByName('CGC').AsString;
             RLRG_IE_DAV.Caption:=FieldByName('IE').AsString;
             end;
        RLEnderecoDAV.Caption:=FieldByName('ENDERECO').AsString;
        RLBairroDAV.Caption:=FieldByName('NOME_BAIRRO').AsString;
        RLCidadeDAV.Caption:=FieldByName('NOME_CIDADE').AsString;
        RLUFDAV.Caption:=FieldByName('UF').AsString;
        RLCEP_DAV.Caption:=FieldByName('CEP').AsString;
        RLFone_DAV.Caption:=FieldByName('TELEFONE').AsString;
        RLCelular_DAV.Caption:=FieldByName('CELULAR').AsString;

        Close;
        end;
end;

procedure TFRelatorios.RLBand81BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
     if FConsultaOrcamentos<>Nil
     then RLReimpressao.Visible:=True
     else RLReimpressao.Visible:=False;
end;

procedure TFRelatorios.RLDAVBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
     RLDAV.Title:='DAV';
end;

procedure TFRelatorios.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
   Numero_DAV_Atual, Ref_Num_DAV : Integer;
begin
     TDAVAlterados.EmptyDataSet;
     Ref_Num_DAV:=0;
     Numero_DAV_Atual:=DM.TOrcamentoNUMERO_DAV.Value;
     //Aqui Verifica os Dav Mesclados quando não foi alterado selecionando varios orçamentos, somente 1
     TConsultaDAVMesclado.Close;
     TConsultaDAVMesclado.Open;
     TConsultaDAVMesclado.First;
     While not TConsultaDAVMesclado.Eof
     do begin
        if Ref_Num_DAV = 0
        then begin
              if (TConsultaDAVMescladoNUMERO_DAV.Value = Numero_DAV_Atual)
              then begin
                   if TConsultaDAVMescladoREF_NUM_DAV.Value > 0
                   then begin
                        LancaNumDAVMesclado(TConsultaDAVMescladoREF_NUM_DAV.Value);
                        Ref_Num_DAV:=TConsultaDAVMescladoREF_NUM_DAV.Value;
                        end;
                   end;
              end
         else begin
              if (Ref_Num_DAV = TConsultaDAVMescladoNUMERO_DAV.Value)
              then begin
                   if TConsultaDAVMescladoREF_NUM_DAV.Value > 0
                   then begin
                        LancaNumDAVMesclado(TConsultaDAVMescladoREF_NUM_DAV.Value);
                        Ref_Num_DAV:=TConsultaDAVMescladoREF_NUM_DAV.Value;
                        end;
                   end;
             end;
        TConsultaDAVMesclado.Next;
        end;
      ConsultaDAVMesclado(Numero_DAV_Atual);
      While AChou
      do begin
         ConsultaDAVMesclado(iOld_DAV_Mesclado);
         end;

    TDAVAlterados.IndexFieldNames:='NUMERO_DAV';
    TDAVAlterados.First;
    While not TDAVAlterados.Eof
    do begin
       if TDAVAlterados.RecNo = 1
       then RLDAV1.Caption:=(StrZero(TDAVAlteradosNUMERO_DAV.Value,14)+';')
       else if TDAVAlterados.RecNo = 2
       then RLDAV2.Caption:=(StrZero(TDAVAlteradosNUMERO_DAV.Value,14)+';')
       else if TDAVAlterados.RecNo = 3
       then RLDAV3.Caption:=(StrZero(TDAVAlteradosNUMERO_DAV.Value,14)+';')
       else if TDAVAlterados.RecNo = 4
       then RLDAV4.Caption:=(StrZero(TDAVAlteradosNUMERO_DAV.Value,14)+';')
       else if TDAVAlterados.RecNo = 5
       then RLDAV5.Caption:=(StrZero(TDAVAlteradosNUMERO_DAV.Value,14)+';')
       else if TDAVAlterados.RecNo = 6
       then RLDAV6.Caption:=(StrZero(TDAVAlteradosNUMERO_DAV.Value,14)+';')
       else if TDAVAlterados.RecNo = 7
       then RLDAV7.Caption:=(StrZero(TDAVAlteradosNUMERO_DAV.Value,14)+';')
       else if TDAVAlterados.RecNo = 8
       then RLDAV8.Caption:=(StrZero(TDAVAlteradosNUMERO_DAV.Value,14)+';');
       TDAVAlterados.Next;;
       end;
    if TDAVAlterados.RecordCount > 0
    then RLNumDAV.Visible:=True
    else RLNumDAV.Visible:=False;   
end;

procedure TFRelatorios.ConsultaDAVMesclado(xNumDAV : Integer);
begin
     AChou:=False;
     With DM.QPesquisa
     do begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT NUMERO_DAV,NUM_NOVO_DAV FROM ORCAMENTO');
        Sql.Add('WHERE NUM_NOVO_DAV = :PNUMDAV');
        ParamByName('PNUMDAV').AsInteger:=xNumDAV;
        Open;
        While not Eof
        do begin
           AChou:=True;
           LancaNumDAVMesclado(FieldByName('NUMERO_DAV').Value);
           iOld_DAV_Mesclado:=FieldByName('NUMERO_DAV').Value;
           Next;
           end;
        end;
end;

procedure TFRelatorios.LancaNumDAVMesclado(xNumDAV : Integer);
begin
     if not TDAVAlterados.Locate('NUMERO_DAV',xNumDAV,[])
     then TDAVAlterados.Append
     else TDAVAlterados.Edit;
     TDAVAlteradosNUMERO_DAV.Value:=xNumDAV;
     TDAVAlterados.Post;
end;

end.
