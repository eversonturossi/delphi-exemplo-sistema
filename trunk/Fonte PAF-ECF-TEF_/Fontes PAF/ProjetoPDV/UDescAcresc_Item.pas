unit UDescAcresc_Item;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, rxToolEdit, rxCurrEdit;

type
  TFDescAcresc_Item = class(TForm)
    RGTipo: TRadioGroup;
    RGValor_Perc: TRadioGroup;
    GValor: TGroupBox;
    EValor: TCurrencyEdit;
    GItem: TGroupBox;
    ENumItem: TEdit;
    LItem: TLabel;
    Timer1: TTimer;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EValorEnter(Sender: TObject);
    procedure EValorExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ENumItemExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EValorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure VerificaItem;
  public
    { Public declarations }
  end;

var
  FDescAcresc_Item: TFDescAcresc_Item;

implementation

uses dmsyndAC, UBarsa, UPAF_ECF, checkout;

{$R *.dfm}

procedure TFDescAcresc_Item.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FDescAcresc_item,key);
end;

procedure TFDescAcresc_Item.EValorEnter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure TFDescAcresc_Item.EValorExit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure TFDescAcresc_Item.FormShow(Sender: TObject);
begin
     ENumItem.Clear;
     LItem.Caption:='';
     EValor.Value:=0;
     ENumItem.SetFocus;
end;

procedure TFDescAcresc_Item.VerificaItem;
begin
    if Trim(ENumItem.Text)<>''
    then begin
         if DM.TPDV.Locate('ITEN',ENumItem.text,[])
         then begin
              LItem.Caption:=DM.TPDVDESCRICAO.Value;
              end
         else begin
              Informa('Este Item não esta lançado no Cupom!');
              ENumItem.SetFocus;
              exit;
              end;
         end;     
end;

procedure TFDescAcresc_Item.ENumItemExit(Sender: TObject);
begin
     if Trim(ENumItem.Text)=''
     then ENumItem.Text:='0';
     ENumItem.Text:=FormatFloat('###000',StrToFloat(ENumItem.Text));
     VerificaItem;
     FechaFocu(Sender);
end;

procedure TFDescAcresc_Item.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_Escape
     then Close;
end;

procedure TFDescAcresc_Item.Timer1Timer(Sender: TObject);
begin
Close;
end;

procedure TFDescAcresc_Item.FormActivate(Sender: TObject);
begin
     if DM.TPDV.IsEmpty
     then Timer1.Enabled:=True;
end;

procedure TFDescAcresc_Item.EValorKeyPress(Sender: TObject; var Key: Char);
var
 nVl_Desc_Acresc, nPerc_Desc_Acresc : Currency;
 Str_Numero_do_Item: String;
 Str_Desconto_ou_Acrescimo_Item: String;
 Str_Tipo_do_Desconto_ou_Acrescimo_Item: String;
 Str_Valor_do_Desconto_ou_Acrescimo_Item: String;
 s_Mensagem : String;
begin
     if Key=#13
     then begin
          if EValor.Value <= 0
          then begin
               Informa('O Valor não pode ficar menor ou igual a 0!');
               EValor.SetFocus;
               exit;
               end;
          if EValor.Value > frmcheckout.editSUBTOTAL.Value
          then begin
               Informa('Valor do Desconto/Acréscimo não pode ser superior ao SubTotal do Cupom!');
               EValor.SetFocus;
               Exit;
               end;
          VerificaItem;

          if RGTipo.ItemIndex=0
          then begin
               if RGValor_Perc.ItemIndex=0
               then s_Mensagem:='Desconto de R$: '+FormatFloat('#####0.00',EValor.Value)
               else s_Mensagem:='Desconto de %: '+FormatFloat('#####0.00',EValor.Value);
               end
          else begin
               if RGValor_Perc.ItemIndex=0
               then s_Mensagem:='Acréscimo de R$: '+FormatFloat('#####0.00',EValor.Value)
               else s_Mensagem:='Acréscimo de %: '+FormatFloat('#####0.00',EValor.Value);
               end;

          if Confirma('Confirma um '+s_Mensagem+' no item?')=mrYes
          then begin
                nVl_Desc_Acresc:=0;
                nPerc_Desc_Acresc:=0;
                Str_Numero_do_Item := ENumItem.Text;
                if RGTipo.ItemIndex=0
                then Str_Desconto_ou_Acrescimo_Item := 'D'
                else Str_Desconto_ou_Acrescimo_Item := 'A';
                Str_Tipo_do_Desconto_ou_Acrescimo_Item := '$';

                if RGValor_Perc.ItemIndex = 0
                then begin
                     nVl_Desc_Acresc:=EValor.Value;
                     nPerc_Desc_Acresc:=(EValor.Value/DM.TPDVVL_TOTAL.Value)*100;
                     end
                else begin
                     nVl_Desc_Acresc:=(DM.TPDVVL_TOTAL.Value * EValor.Value)/100;
                     nPerc_Desc_Acresc:=EValor.Value;
                     end;

                if Str_Desconto_ou_Acrescimo_Item = 'D'
                then begin
                     if nVl_Desc_Acresc >= DM.TPDVVL_TOTAL.AsCurrency
                     then begin
                          Informa('O Valor do Desconto não pode ser maior ou Igual ao Valor do Item!');
                          EValor.SetFocus;
                          Exit;
                          end;
                     end;

                if s_ImpFiscal = 'ECF Daruma'
                then Str_Valor_do_Desconto_ou_Acrescimo_Item := FormatFloat('#####0.00',nVl_Desc_Acresc)
                else Str_Valor_do_Desconto_ou_Acrescimo_Item := AjustaNumerico(nVl_Desc_Acresc,4);


                if s_ImpFiscal = 'ECF Daruma'
                then retorno_imp_fiscal:=Daruma_FIMFD_DescontoAcrescimoItem(pchar(Str_Numero_do_Item),
                                                              pchar( Str_Desconto_ou_Acrescimo_Item ),
                                                      pchar( Str_Tipo_do_Desconto_ou_Acrescimo_Item ),
                                                   pchar( Str_Valor_do_Desconto_ou_Acrescimo_Item ) )
                else if s_ImpFiscal = 'ECF Bematech'
                then retorno_imp_fiscal:=Bematech_FI_AcrescimoDescontoItemMFD( pchar( Str_Numero_do_Item ),
                                                                   pchar( Str_Desconto_ou_Acrescimo_Item ),
                                                           pchar( Str_Tipo_do_Desconto_ou_Acrescimo_Item ),
                                                          pchar( Str_Valor_do_Desconto_ou_Acrescimo_Item ))
                else if s_ImpFiscal = 'ECF Elgin'
                then retorno_imp_fiscal := Elgin_AcrescimoDescontoItemMFD(pchar ( Str_Numero_do_Item ),
                                                               pchar( Str_Desconto_ou_Acrescimo_Item ),
                                                       pchar( Str_Tipo_do_Desconto_ou_Acrescimo_Item ),
                                                     pchar( Str_Valor_do_Desconto_ou_Acrescimo_Item ))

                else if s_ImpFiscal = 'ECF Sweda'
                then retorno_imp_fiscal := ECF_AcrescimoDescontoItemMFD(pchar(Str_Numero_do_Item),
                                                           pchar(Str_Desconto_ou_Acrescimo_Item ),
                                                    pchar(Str_Tipo_do_Desconto_ou_Acrescimo_Item),
                                                  pchar(Str_Valor_do_Desconto_ou_Acrescimo_Item));

                if retorno_imp_fiscal = 1 //OK
                then begin
                     if DM.TDescAcresc.Active=False
                     then begin
                          Try
                            DM.TDescAcresc.CreateDataSet;
                          except
                            end;
                          DM.TDescAcresc.Open;
                          end;
                     DM.TDescAcresc.Append;
                     DM.TDescAcrescCODPRODUTO.Value:=DM.TPDVCODPRODUTO.Value;
                     DM.TDescAcrescITEM.Value:=DM.TPDVITEN.Value;
                     if RGTipo.ItemIndex=0//Desconto
                     then begin
                          DM.TDescAcrescOPERADOR.Value:='-';
                          if RGValor_Perc.ItemIndex=0//Em Valor
                          then DM.TDescAcrescDESCRICAO.Value:='desconto no item '+ENumItem.Text
                          else DM.TDescAcrescDESCRICAO.Value:='desconto de '+FormatFloat('#####0.00',EValor.Value)+'% no item '+ENumItem.Text;
                          nSubTotal:=(nSubTotal-nVl_Desc_Acresc);
                          end
                     else begin
                          DM.TDescAcrescOPERADOR.Value:='+';
                          if RGValor_Perc.ItemIndex=0//Em Valor
                          then DM.TDescAcrescDESCRICAO.Value:='acréscimo no item '+ENumItem.Text
                          else DM.TDescAcrescDESCRICAO.Value:='acréscimo de '+FormatFloat('#####0.00',EValor.Value)+'% no item '+ENumItem.Text;
                          nSubTotal:=(nSubTotal+nVl_Desc_Acresc);
                          end;
                     DM.TDescAcrescVALOR.Value:=nVl_Desc_Acresc;
                     DM.TDescAcrescPERC_VALOR.Value:=nPerc_Desc_Acresc;
                     DM.TDescAcrescDESC_ACRESC.Value:=Str_Desconto_ou_Acrescimo_Item;
                     DM.TDescAcrescTIPO_DESC_ACRESC.Value:=Str_Tipo_do_Desconto_ou_Acrescimo_Item;
                     DM.TDescAcresc.Post;

                     frmcheckout.editSUBTOTAL.Value:=nSubTotal;
                     frmcheckout.DBGrid.Height:=204;
                     Atualiza_GrandeTotal;
                     end;

                frmcheckout.editCodigo.SetFocus;
                Close;
                end;
          end;
end;

end.
