unit frmsangriasuprimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask,Buttons, rxToolEdit,
  rxCurrEdit;

type
  Tfsangriasuprimento = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ed_valorSangria: TCurrencyEdit;
    GSuprimento: TGroupBox;
    Label2: TLabel;
    ed_ValorSuprimento: TCurrencyEdit;
    btn_ok: TBitBtn;
    btn_cancela: TBitBtn;
    Label3: TLabel;
    cb_formapagto: TComboBox;
    procedure btn_cancelaClick(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ed_valorSangriaKeyPress(Sender: TObject; var Key: Char);
    procedure ed_ValorSuprimentoKeyPress(Sender: TObject; var Key: Char);
    procedure cb_formapagtoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_valorSangriaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//--- Funções Daruma
function Daruma_FI_Sangria( Valor_da_Sangria: String ): Integer; StdCall; External 'Daruma32.dll';
function Daruma_FI_Suprimento( Valor_do_Suprimento: String; Forma_de_Pagamento: String ): Integer; StdCall; External 'Daruma32.dll';

var
  fsangriasuprimento: Tfsangriasuprimento;

implementation

uses UPAF_ECF, UBarsa, lite_frmprincipal, checkout;

{$R *.dfm}

procedure Tfsangriasuprimento.btn_cancelaClick(Sender: TObject);
begin
   close;
end;

procedure Tfsangriasuprimento.btn_okClick(Sender: TObject);
var
   str_valorsangria, str_valorsuprimento, str_formapagto: string;
begin
    if (ed_ValorSangria.value <> 0)
    then begin
         AC;
         str_ValorSangria:=formatfloat('###,###,##0.00',ed_ValorSangria.value);
         if s_ImpFiscal = 'ECF Daruma'
         then Retorno_imp_Fiscal:=Daruma_FI_Sangria( pchar( Str_ValorSangria ) )
         else if s_ImpFiscal = 'ECF Bematech'
         then Retorno_imp_Fiscal:=Bematech_FI_Sangria( pchar( Str_ValorSangria ) )
         else if s_ImpFiscal = 'ECF Elgin'
         then Retorno_imp_Fiscal:=Elgin_Sangria( pchar( Str_ValorSangria ) )
         else if s_ImpFiscal = 'ECF Sweda'
         then Retorno_imp_Fiscal:=ECF_Sangria( pchar( Str_ValorSangria ) );

         if FrmPrincipal.Gaveta='S'
         then begin
              if s_ImpFiscal = 'ECF Daruma'
              then Retorno_imp_Fiscal := Daruma_FI_AcionaGaveta()
              else if s_ImpFiscal = 'ECF Bematech'
              then Retorno_imp_Fiscal := Bematech_FI_AcionaGaveta()
              else if s_ImpFiscal = 'ECF Elgin'
              then Retorno_imp_Fiscal := Elgin_AcionaGaveta()
              else if s_ImpFiscal = 'ECF Sweda'
              then Retorno_imp_Fiscal := ECF_AcionaGaveta();
              end;
         DC;
         end;

    if (ed_ValorSuprimento.value <> 0)
    then begin
         AC;
         str_ValorSuprimento:=formatfloat('###,###,##0.00',ed_ValorSuprimento.value);
         str_FormaPagto:=cb_FormaPagto.Text;
         if s_ImpFiscal = 'ECF Daruma'
         then Retorno_imp_Fiscal:=Daruma_FI_Suprimento( pchar( Str_ValorSuprimento ), pchar( Str_FormaPagto ) )
         else if s_ImpFiscal = 'ECF Bematech'
         then Retorno_imp_Fiscal:=Bematech_FI_Suprimento( pchar( Str_ValorSuprimento ), pchar( Str_FormaPagto ) )
         else if s_ImpFiscal = 'ECF Elgin'
         then Retorno_imp_Fiscal:=Elgin_Suprimento( pchar( Str_ValorSuprimento ), pchar( Str_FormaPagto ) )
         else if s_ImpFiscal = 'ECF Sweda'
         then Retorno_imp_Fiscal:=ECF_Suprimento( pchar( Str_ValorSuprimento ), pchar( Str_FormaPagto ) );

         if FrmPrincipal.Gaveta='S'
         then begin
              if s_ImpFiscal = 'ECF Daruma'
              then Retorno_imp_Fiscal := Daruma_FI_AcionaGaveta()
              else if s_ImpFiscal = 'ECF Bematech'
              then Retorno_imp_Fiscal := Bematech_FI_AcionaGaveta()
              else if s_ImpFiscal = 'ECF Elgin'
              then Retorno_imp_Fiscal := Elgin_AcionaGaveta()
              else if s_ImpFiscal = 'ECF Sweda'
              then Retorno_imp_Fiscal := ECF_AcionaGaveta();
              end;

         DC;
         end;

     Analisa_iRetorno();
     Retorno_Impressora();

     if ((ed_ValorSangria.value <> 0) or (ed_ValorSuprimento.value <> 0))
     then begin
          if not RetornouErro 
          then GravaDadosDocECF('CN')
          else Informa('Esta Sangria/Suprimento não foi salva em Banco de Dados!');
          end;

end;

procedure Tfsangriasuprimento.FormActivate(Sender: TObject);
begin
  ed_ValorSangria.Value:=0;
  ed_valorSuprimento.Value:=0;
  cb_FormaPagto.Text:='';
  btn_ok.Default:=false;
  ed_ValorSangria.SetFocus;
end;

procedure Tfsangriasuprimento.ed_valorSangriaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(wm_nextdlgctl,0,0);
   end;

end;

procedure Tfsangriasuprimento.ed_ValorSuprimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(wm_nextdlgctl,0,0);
   end;

end;

procedure Tfsangriasuprimento.cb_formapagtoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key=#13 then begin
      btn_ok.Default:=true;
      key:=#0;
      perform(wm_nextdlgctl,0,0);
   end;

end;

procedure Tfsangriasuprimento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=VK_Escape
     then Close;
end;

procedure Tfsangriasuprimento.ed_valorSangriaChange(Sender: TObject);
begin
     if ed_valorSangria.Value > 0
     then GSuprimento.Enabled:=False
     else GSuprimento.Enabled:=True;
end;

end.
