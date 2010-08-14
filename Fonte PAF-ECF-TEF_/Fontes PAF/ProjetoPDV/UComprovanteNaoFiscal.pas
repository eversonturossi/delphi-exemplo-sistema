unit UComprovanteNaoFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, rxCurrEdit, rxToolEdit;

type
  TFEmiteDoctoNaoFiscal = class(TForm)
    BtnImprimir: TBitBtn;
    Label1: TLabel;
    EData: TDateEdit;
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtHistorico: TEdit;
    edtValor: TCurrencyEdit;
    Label4: TLabel;
    cbxformapagto: TComboBox;
    Label5: TLabel;
    rdgTipoMovto: TRadioGroup;
    Bevel1: TBevel;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    procedure BtnImprimirClick(Sender: TObject);
    procedure EDataEnter(Sender: TObject);
    procedure EDataExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtCancelaClick(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmiteDoctoNaoFiscal: TFEmiteDoctoNaoFiscal;

implementation

uses UBarsa, UMenuFiscal, checkout, dmsyndAC, UPAF_ECF;

{$R *.dfm}

{procedure TFEmiteDoctoNaoFiscal.SalvarDados();
var
 sql         : string;
 cd          : integer;
 scupom      : string;
 data        : TDate;
 nome,
 historico   :string;
 valor       :Currency;
 formapagto,
 tpmovto     :string;
 scaixa  : string;
 sNuSerie: string;
 sNuCCF  : string;
 sNUGNF  : string;
 NUCDC  : string;
begin
 NUCDC    := '';
 scaixa   := '';
 scupom   := '';
 sNuSerie := '';
 sNuCCF   := '';
 sNUGNF   := '';
 cd          := 0;
 nome        := edtNome.Text;
 historico   := edtHistorico.Text;
 valor       := edtValor.Value;
 formapagto  := UpperCase(cbxformapagto.Text);
 formapagto  := UpperCase(formapagto);
 scupom      := '';
 data        := edtDataEmissao.Date;
 nuserie     := '';
 if rdgTipoMovto.ItemIndex = 0 then tpmovto := 'R';
 if rdgTipoMovto.ItemIndex = 1 then tpmovto := 'P';

 repeat dtmMain.MultImpressoraFiscal.NumeroCupom(scupom)  until(scupom <> '');
 repeat dtmMain.MultImpressoraFiscal.NumeroSerie(nuserie) until(nuserie <> '');
 //
 repeat dtmMain.MultImpressoraFiscal.NumeroCaixa(scaixa)               until(scaixa <> '');
 repeat dtmMain.MultImpressoraFiscal.NumeroOperacoesNaoFiscais(sNUGNF) until(sNUGNF <> '');

 //
  cd  := GerarCodigo(dtmMain.conmain,'DOCNAOFISCAL');
  sql := 'INSERT INTO DOCNAOFISCAL(CDDOCNAOFISCAL, NMDOCNAOFISCAL, DTDOCNAOFISCAL, '+
         '                         TPMOVIMENTO, DSDOCNAOFISCAL,                    '+
         '                         VLDOCUMENTO, DSFORMAPAGTO, NUCOO, NUSERIE)      '+
         '                  VALUES('+IntToStr(cd)+', '''+ UpperCase(nome)+''',     '+
         '            '''+FormatDateTime(P4InfoVarejo_dtbanco,data)+''',           '+
         '              '''+tpmovto+''','''+historico+''',                         '+
         '              '+Substitui_Ponto_Virgula(CurrToStr(valor))+',             '+
         '              '''+UpperCase(formapagto)+''','''+scupom+''',              '+
         '              '''+nuserie+''')                                           ';
  try
   ExecutaSQL(dtmMain.conmain,sql);
  except
   on Exception do
    begin
     MessageDlg('Erro ao Gravar Na Tabela de "Documento Não Fiscal".',mtError,[mbok],0);
     Abort;
    end;
  end;
  GravaMeiosPagamento(dtmMain.conmain,cbxformapagto.Text,CurrToStr(valor),scupom,'CN',nuserie,nucdc,scupom,sNUGNF,scaixa);
end;}

procedure TFEmiteDoctoNaoFiscal.BtnImprimirClick(Sender: TObject);
var
 lista : TStrings;
 linha : string;
 i     : integer;
begin
     if EData.Text = '  /  /    '
     then begin
          MessageDlg('Informe a Data de Emissão.',MtInformation,[MbOK],0);
          EData.SetFocus;
          exit
          end;
     if edtNome.Text = ''
     then begin
          MessageDlg('Informe o Nome.',mtInformation,[MbOK],0);
          edtNome.SetFocus;
          exit;
          end;
     if edtHistorico.Text = ''
     then begin
          MessageDlg('Informe o Histórico.',mtInformation,[MBOk],0);
          edtHistorico.SetFocus;
          exit;
          end;
     if edtValor.Value <= 0
     then begin
          MessageDlg('Valor Deve Ser Maior Que Zero.',mtInformation,[MbOk],0);
          edtValor.SetFocus;
          exit;
          end;
     if cbxformapagto.Text = ''
     then begin
          MessageDlg('Selecione a Forma de Pagamento.',mtInformation,[Mbok],0);
          cbxformapagto.SetFocus;
          exit;
          end;
  if Confirma('Confirma a Impressão?')=mrYes
  then begin
        AC;
        BtnImprimir.Enabled:=False;
        Try
         lista := TStringList.Create;
         if rdgTipoMovto.ItemIndex = 0
         then lista.Add('Recebimento')
         else if rdgTipoMovto.ItemIndex = 1
         then lista.Add('Pagamento');
         lista.Add('Data de Emissão: '+EData.Text);
         lista.Add('Nome :'+edtNome.Text);
         lista.Add('Histórico: '+edtHistorico.Text);
         lista.Add('Valor: '+CasaDecimal(edtValor.Value,12));
         lista.Add('Forma de Pagamento: '+cbxformapagto.Text);

         AbreRelGerencial;

         Analisa_iRetorno();
         Retorno_Impressora();

         if ECF_Respondendo = 0
         then begin
               for i := 0 to lista.Count-1
               do begin
                  linha := lista.Strings[i];
                  ImprimiRelGerencial(PChar(linha)+chr(10)+chr(13));
                  end;
               FechaRelGerencial;

             GravaDadosDocECF('RG');

             Try
               DM.TDocNaoFiscal.Close;
               DM.TDocNaoFiscal.Params[0].AsInteger:=-1;
               DM.TDocNaoFiscal.Open;
               DM.TDocNaoFiscal.Append;
               DM.TDocNaoFiscalDATA.AsDateTime:=EData.Date;
               DM.TDocNaoFiscalNOME.AsString:=edtNome.Text;
               DM.TDocNaoFiscalHISTORICO.AsString:=edtHistorico.Text;
               DM.TDocNaoFiscalVALOR.AsCurrency:=edtValor.Value;
               if rdgTipoMovto.ItemIndex=0
               then DM.TDocNaoFiscalTIPO_MOVIMENTO.AsString:='RECEBIMENTO'
               else DM.TDocNaoFiscalTIPO_MOVIMENTO.AsString:='PAGAMENTO';
               DM.TDocNaoFiscalFORMA_PGTO.AsString:=cbxformapagto.Text;
               DM.TDocNaoFiscalNUM_COO.AsInteger:=DM.TDocEmitidosCOO.AsInteger;
               DM.TDocNaoFiscalNUM_GNF.AsInteger:=DM.TDocEmitidosGNF.AsInteger;
               DM.TDocNaoFiscalNUM_GRG.AsInteger:=DM.TDocEmitidosGRG.AsInteger;
               DM.TDocNaoFiscalNUMERO_SERIE_IMP.AsString:=DM.TDocEmitidosNUM_SERIE_ECF.AsString;
               DM.TDocNaoFiscal.Post;
               DM.TDocNaoFiscal.ApplyUpdates(-1);
             Except
               on Exception
               do begin
                  DC;
                  MessageDlg('Erro ao Gravar Na Tabela de "Documento Não Fiscal".',mtError,[mbok],0);
                  Raise
                  end;
               end;
            DM.TDocEmitidos.Close;
            DM.TDocNaoFiscal.Close;
            end;//if ECF_Reposdendo
     finally
       FreeAndNil(lista);
       end;
     Close;
    end;
end;


procedure TFEmiteDoctoNaoFiscal.EDataEnter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure TFEmiteDoctoNaoFiscal.EDataExit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure TFEmiteDoctoNaoFiscal.FormShow(Sender: TObject);
begin
     EData.Date:=Now;
     EData.SetFocus;
end;

procedure TFEmiteDoctoNaoFiscal.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
     TabEnter(FEmiteDoctoNaoFiscal,Key);
end;

procedure TFEmiteDoctoNaoFiscal.BtCancelaClick(Sender: TObject);
begin
     Close;
end;

procedure TFEmiteDoctoNaoFiscal.BtOkClick(Sender: TObject);
begin
     Close;
end;

procedure TFEmiteDoctoNaoFiscal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_Escape
     then Close;
end;

end.
