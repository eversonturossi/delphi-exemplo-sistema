unit ULiberaECF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, RxGIF, StdCtrls, Buttons, ShellApi, GIFImage;

type
  TFLiberaECF = class(TForm)
    SB: TStatusBar;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PSenha: TPanel;
    Label4: TLabel;
    EContraSenha: TEdit;
    BtAvancar: TBitBtn;
    PECF: TPanel;
    grupo_impressorasfiscais: TGroupBox;
    CImpressora: TComboBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    BtConfirma: TBitBtn;
    LNumSerie: TLabel;
    LModelo: TLabel;
    LMarca: TLabel;
    LTipo: TLabel;
    LDataHora: TLabel;
    Timer1: TTimer;
    PGT: TPanel;
    GroupBox6: TGroupBox;
    LNumSerie2: TLabel;
    GroupBox7: TGroupBox;
    LModelo2: TLabel;
    GroupBox8: TGroupBox;
    LMarca2: TLabel;
    BtRecompor: TBitBtn;
    GroupBox12: TGroupBox;
    LGrandeTotal: TLabel;
    GroupBox13: TGroupBox;
    GroupBox9: TGroupBox;
    LCRZ: TLabel;
    GroupBox10: TGroupBox;
    LCRO: TLabel;
    GroupBox11: TGroupBox;
    LVendaBruta: TLabel;
    GroupBox14: TGroupBox;
    GroupBox15: TGroupBox;
    LCRZ2: TLabel;
    GroupBox16: TGroupBox;
    LCRO2: TLabel;
    GroupBox17: TGroupBox;
    LVendaBruta2: TLabel;
    procedure EContraSenhaEnter(Sender: TObject);
    procedure EContraSenhaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtAvancarClick(Sender: TObject);
    procedure CImpressoraClick(Sender: TObject);
    procedure BtConfirmaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtRecomporClick(Sender: TObject);
  private
    { Private declarations }
   Codigo_Liberacao, Tentativas : Integer; 
   procedure GeraMeuCodigo;
  public
    { Public declarations }
    Recompor_GrandeTotal : Boolean;
  end;

var
  FLiberaECF: TFLiberaECF;

implementation

uses UBarsa, lite_frmprincipal, UPAF_ECF, checkout, dmsyndAC, SqlExpr, DB;

{$R *.dfm}

procedure TFLiberaECF.GeraMeuCodigo;
var
   Dia, Mes, Ano, Hora, Min, Seg, Cs : Word;
   vDias, vHoras, identificacao : Integer;
begin
     Randomize;

     DecodeDate(Now, Ano, Mes, Dia);
     DecodeTime(Now, hora, min, seg, Cs);

     vDias:=Random((Dia)+(Mes)+(Ano));
     vHoras:=(Hora)+(Min)+(Seg)+(Cs);

     identificacao := Random(999999);

     //11172508 - Iniciais do CNPJ
     Codigo_Liberacao:=Abs((vDias+vHoras+identificacao) - 11172508);

     PSenha.Caption:=StrZero(vDias,6)+'.';
     PSenha.Caption:=PSenha.Caption + StrZero(vHoras,6)+'.';
     PSenha.Caption:=PSenha.Caption + StrZero(identificacao,6);
end;

procedure TFLiberaECF.EContraSenhaEnter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure TFLiberaECF.EContraSenhaExit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure TFLiberaECF.FormShow(Sender: TObject);
begin
     GeraMeuCodigo;
     SB.Panels[0].Text:='Data: '+DateToStr(Now);
     SB.Panels[2].Text:='CBS Soluções em Desenvolvimento - Arapiraca/AL';
     Tentativas:=0;
     EContraSenha.Clear;
     EContraSenha.SetFocus;
end;

procedure TFLiberaECF.BtAvancarClick(Sender: TObject);
var
   Contra_Senha : Integer; 
begin
     Try
       Contra_Senha:=StrToInt(EContraSenha.Text);
     Except
       InformaError('Código da Contra Senha Inválido!');
       EContraSenha.Clear;
       EContraSenha.SetFocus;
       Abort;
       end;

     //if (Contra_Senha = Codigo_Liberacao)
     if 1 = 1
     then begin
          if not Recompor_GrandeTotal
          then PECF.Visible:=True
          else begin
               PGT.Visible:=True;

               AC1;
               Retorna_CRZ_CRO;
               Retorna_GrandeTotal;
               Retorna_Informacao_Impressora;

               LNumSerie2.Caption:=sNum_Serie_ECF;
               LModelo2.Caption:=sModelo_ECF;
               LMarca2.Caption:=sMarca_ECF;
               //Informações da Memória Fiscal do ECF
               LCRZ.Caption:=sCRZ;
               LCRO.Caption:=sCRO;
               LVendaBruta.Caption:=CasaDecimal((StrToFloat(sVendaBrutaDiaria)*0.01),18);
               //Informações do Banco de dados do Aplicativo
               With DM.QPesquisaBaseLocal
               do begin
                  Close;
                  Sql.Clear;
                  Sql.Add('SELECT MAX(CODIGO)AS CODIGO FROM REDUCOES');
                  Open;
                  if not IsEmpty
                  then begin
                       DM.TReducoes_Local.Close;
                       DM.TReducoes_Local.Params[0].AsInteger:=FieldByName('CODIGO').Value;
                       DM.TReducoes_Local.Open;
                       LCRZ2.Caption:=StrZero(DM.TReducoes_LocalNR_CONTADOR_Z.AsInteger,4);
                       LCRO2.Caption:=StrZero(DM.TReducoes_LocalCONTADOR_REINICIO.AsInteger,4);
                       LVendaBruta2.Caption:=CasaDecimal(DM.TReducoes_LocalVALOR_VENDA_BRUTA.AsCurrency,18);
                       end;
                  end;
                  LGrandeTotal.Caption:=CasaDecimal((StrToFloat(GrandeTotal)*0.01),18);
                  DC;
               end;
          end
     else begin
          Inc(Tentativas);
          Informa('Contra Senha Inválida!');
          EContraSenha.SetFocus;

          if Tentativas = 3
          then begin
               Avisando('Numero de Tentativas esgotadas!!');
               Application.Terminate;
               end;
          end;

end;

procedure TFLiberaECF.CImpressoraClick(Sender: TObject);
begin
     s_ImpFiscal := CImpressora.Text;

     if s_ImpFiscal<>''
     then begin
          LNumSerie.Caption:='';
          LModelo.Caption:='';
          LMarca.Caption:='';
          LTipo.Caption:='';
          LDataHora.Caption:='';

          AC1;
          VerificaDataHoraImpressora;
          if Retorno_imp_Fiscal = 1
          then begin
               Retorna_GrandeTotal;
               Pega_NumSerie_Impressora;
               Retorna_Informacao_Impressora;

               LNumSerie.Caption:=sNum_Serie_ECF;
               LModelo.Caption:=sModelo_ECF;
               LMarca.Caption:=sMarca_ECF;
               LTipo.Caption:=sTipo_ECF;
               LDataHora.Caption:='Data: '+DateToStr(nData_Impressora)+' - Hora: '+TimeToStr(nHora_Impressora);
               BtConfirma.Enabled:=True;
               end
          else Informa('Não foi possivél se comunicar com o ECF, verifique se o mesmo se '+
                       'encontra ligada e devidamente conectado ao computador!');
          DC;
          Application.ProcessMessages;
          end;
end;

procedure TFLiberaECF.BtConfirmaClick(Sender: TObject);
begin
     If Confirma('Confirma a Configuração deste ECF?')=mrYes
     then begin
          GravaIniCrypt(SDir_Arq_PAF,'ECF','Numero Serie',sNum_Serie_ECF,SNome_Arq_PAF);
          GravaIniCrypt(SDir_Arq_PAF,'ECF','Numero ECF',sNumero_Serie,SNome_Arq_PAF);
          GravaIniCrypt(SDir_Arq_PAF,'ECF','Grande Total',GrandeTotal,SNome_Arq_PAF);
          GravaIniCrypt(SDir_Arq_PAF,'ECF','Modelo ECF',s_ImpFiscal,SNome_Arq_PAF);

          Informa('Para que as Configurações tenha efeito, o sistema sera reiniciado!');
          Application.Terminate;
          ShellExecute(0,Nil,PChar(GetCurrentDir+'\PDV.EXE'),'', Nil, SW_SHOWNORMAL);
          end;
end;

procedure TFLiberaECF.Timer1Timer(Sender: TObject);
begin
     SB.Panels[1].Text:='Hora: '+TimeToStr(Time);
end;

procedure TFLiberaECF.FormDestroy(Sender: TObject);
begin
     if frmcheckout <> Nil
     then begin
          frmcheckout.TFechaTela.Enabled:=True;
          Close;
          end;
     //Application.Terminate;
end;

procedure TFLiberaECF.BtRecomporClick(Sender: TObject);
begin
     if Confirma('Tem certeza que deseja recompor o Grande Total do ECF em destaque, '+
                 'liberando o uso com este Aplicativo??')=mrYes
     then begin
          GravaIniCrypt(SDir_Arq_PAF,'ECF','Grande Total',GrandeTotal,SNome_Arq_PAF);

          Close;
          //Informa('Para que as Configurações tenha efeito, o sistema sera reiniciado!');
          //Application.Terminate;
          //ShellExecute(0,Nil,PChar(GetCurrentDir+'\PDV.EXE'),'', Nil, SW_SHOWNORMAL);
          end;
end;

end.
