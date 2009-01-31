unit ULanPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, ExtCtrls, Mask, DBCtrls, rxToolEdit, rxCurrEdit,
  DB;

type
  TLancPrecoForm = class(TForm)
    Panel1: TPanel;
    BTCancelar: THTMLButton;
    BTGravar: THTMLButton;
    Image2: TImage;
    Label2: TLabel;
    DBEditBaseICMSInterno: TDBEdit;
    DBEditBaseICMSExterno: TDBEdit;
    DBEditBasePIS: TDBEdit;
    DBEditBaseTVA: TDBEdit;
    DBEditBaseICMSSubstituicao: TDBEdit;
    DBEditBaseIPI: TDBEdit;
    Shape2: TShape;
    Label3: TLabel;
    Label24: TLabel;
    Shape3: TShape;
    Label5: TLabel;
    DBEditBaseFrete: TDBEdit;
    DBEditBaseComissao: TDBEdit;
    DBEditValorFrete: TDBEdit;
    DBEditValorComissao: TDBEdit;
    DBEditValorCustoFixo: TDBEdit;
    DBEditBaseCustoFixo: TDBEdit;
    DBEditBaseMargemLucro: TDBEdit;
    DBEditValorMargemLucro: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Shape4: TShape;
    Image1: TImage;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label4: TLabel;
    Label18: TLabel;
    DBEditBaseCofins: TDBEdit;
    Label19: TLabel;
    DBEditBaseOutros: TDBEdit;
    Label20: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    DBEditBaseDesconto: TDBEdit;
    DBEditValorDesconto: TDBEdit;
    Shape1: TShape;
    Label8: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    BTCalcular: THTMLButton;
    Image3: TImage;
    Label26: TLabel;
    DBEditPrecoCusto: TDBEdit;
    DBEditPrecoSugerido: TDBEdit;
    DBEditPrecoVenda: TDBEdit;
    procedure DBEditBaseFreteChange(Sender: TObject);
    procedure DBEditBaseComissaoChange(Sender: TObject);
    procedure DBEditBaseCustoFixoChange(Sender: TObject);
    procedure DBEditBaseDescontoChange(Sender: TObject);
    procedure DBEditBaseMargemLucroChange(Sender: TObject);
    procedure DBEditValorFreteChange(Sender: TObject);
    procedure DBEditValorComissaoChange(Sender: TObject);
    procedure DBEditValorCustoFixoChange(Sender: TObject);
    procedure DBEditValorDescontoChange(Sender: TObject);
    procedure DBEditValorMargemLucroChange(Sender: TObject);
    procedure DBEditBaseICMSInternoExit(Sender: TObject);
    procedure BTCalcularClick(Sender: TObject);
    procedure DBEditPrecoCustoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CalculaPreco;
    { Public declarations }
  end;

var
  LancPrecoForm: TLancPrecoForm;

implementation
uses Base;
{$R *.dfm}
procedure TLancPrecoForm.CalculaPreco;
var
  Vl_ICMSInterno, Vl_ICMSExterno, Vl_ICMSSubstituicao,
  Vl_IPI, Vl_TVA, Vl_PIS, Vl_Cofins, Vl_Outros, Vl_Frete,
  Vl_Comissao, Vl_CustoFixo, Vl_Desconto, Vl_MargemLucro,
  Vl_PrecoCusto, Vl_PrecoSugerido, Vl_Preco : Currency;
begin
  Vl_PrecoCusto := StrToCurr(DBEditPrecoCusto.Text);
  Vl_ICMSInterno := ((StrToCurr(DBEditBaseICMSInterno.Text)/100)*Vl_PrecoCusto);
  Vl_ICMSExterno := ((StrToCurr(DBEditBaseICMSExterno.Text)/100)*Vl_PrecoCusto);
  Vl_ICMSSubstituicao := ((StrToCurr(DBEditBaseICMSSubstituicao.Text)/100)*Vl_PrecoCusto);
  Vl_IPI := ((StrToCurr(DBEditBaseIPI.Text)/100)*Vl_PrecoCusto);
  Vl_TVA := ((StrToCurr(DBEditBaseTVA.Text)/100)*Vl_PrecoCusto);
  Vl_PIS := ((StrToCurr(DBEditBasePIS.Text)/100)*Vl_PrecoCusto);
  Vl_Cofins := ((StrToCurr(DBEditBaseCofins.Text)/100)*Vl_PrecoCusto);
  Vl_Outros := ((StrToCurr(DBEditBaseOutros.Text)/100)*Vl_PrecoCusto);

  if (StrToCurr(DBEditBaseFrete.Text) > 0) then
    Vl_Frete := ((StrToCurr(DBEditBaseFrete.Text)/100)*Vl_PrecoCusto)
  else
    if (StrToCurr(DBEditValorFrete.Text) > 0) then
      Vl_Frete := StrToCurr(DBEditValorFrete.Text)
    else
      Vl_Frete := 0;

  if (StrToCurr(DBEditBaseComissao.Text) > 0) then
    Vl_Comissao := ((StrToCurr(DBEditBaseComissao.Text)/100)*Vl_PrecoCusto)
  else
    if (StrToCurr(DBEditValorComissao.Text) > 0) then
      Vl_Comissao := StrToCurr(DBEditValorComissao.Text)
    else
      Vl_Comissao := 0;

  if (StrToCurr(DBEditBaseCustoFixo.Text) > 0) then
    Vl_CustoFixo := ((StrToCurr(DBEditBaseCustoFixo.Text)/100)*Vl_PrecoCusto)
  else
    if (StrToCurr(DBEditValorCustoFixo.Text) > 0) then
      Vl_CustoFixo := StrToCurr(DBEditValorCustoFixo.Text)
    else
      Vl_CustoFixo := 0;

  if (StrToCurr(DBEditBaseDesconto.Text) > 0) then
    Vl_Desconto := ((StrToCurr(DBEditBaseDesconto.Text)/100)*Vl_PrecoCusto)
  else
    if (StrToCurr(DBEditValorDesconto.Text) > 0) then
      Vl_Desconto := StrToCurr(DBEditValorDesconto.Text)
    else
      Vl_Desconto := 0;

  if (StrToCurr(DBEditBaseMargemLucro.Text) > 0) then
    Vl_MargemLucro := ((StrToCurr(DBEditBaseMargemLucro.Text)/100)*Vl_PrecoCusto)
  else
    if (StrToCurr(DBEditValorMargemLucro.Text) > 0) then
      Vl_MargemLucro := StrToCurr(DBEditValorMargemLucro.Text)
    else
      Vl_MargemLucro := 0;

  Vl_PrecoSugerido := Vl_PrecoCusto + (Vl_ICMSInterno + Vl_ICMSExterno + Vl_ICMSSubstituicao +
            Vl_IPI + Vl_TVA + Vl_PIS + Vl_Cofins + Vl_Outros + Vl_Frete + Vl_Comissao +
            Vl_CustoFixo + Vl_MargemLucro) - Vl_Desconto;

  Vl_Preco := Vl_PrecoSugerido;

  DBEditPrecoSugerido.Text := CurrToStr(Vl_PrecoSugerido);
  DBEditPrecoVenda.Text := CurrToStr(Vl_Preco);
end;
procedure TLancPrecoForm.BTCalcularClick(Sender: TObject);
begin
  CalculaPreco;
end;
procedure TLancPrecoForm.DBEditBaseComissaoChange(Sender: TObject);
var
  Vl_PrecoCusto, Vl_BaseComissao : Currency;
begin
  Vl_PrecoCusto := StrToCurr(DBEditPrecoCusto.Text);
  Vl_BaseComissao := StrToCurr(DBEditBaseComissao.Text);
  DBEditValorComissao.Text := CurrToStr((Vl_BaseComissao/100)*Vl_PrecoCusto);
end;

procedure TLancPrecoForm.DBEditBaseCustoFixoChange(Sender: TObject);
var
  Vl_PrecoCusto, Vl_BaseCustoFixo : Currency;
begin
  Vl_PrecoCusto := StrToCurr(DBEditPrecoCusto.Text);
  Vl_BaseCustoFixo := StrToCurr(DBEditBaseCustoFixo.Text);
  DBEditValorCustoFixo.Text := CurrToStr((Vl_BaseCustoFixo/100)*Vl_PrecoCusto);
end;

procedure TLancPrecoForm.DBEditBaseDescontoChange(Sender: TObject);
var
  Vl_PrecoCusto, Vl_BaseDesconto : Currency;
begin
  Vl_PrecoCusto := StrToCurr(DBEditPrecoCusto.Text);
  Vl_BaseDesconto := StrToCurr(DBEditBaseDesconto.Text);
  DBEditValorDesconto.Text := CurrToStr((Vl_BaseDesconto/100)*Vl_PrecoCusto);
end;

procedure TLancPrecoForm.DBEditBaseFreteChange(Sender: TObject);
var
  Vl_PrecoCusto, Vl_BaseFrete : Currency;
begin
  Vl_PrecoCusto := StrToCurr(DBEditPrecoCusto.Text);
  Vl_BaseFrete := StrToCurr(DBEditBaseFrete.Text);
  DBEditValorFrete.Text := CurrToStr((Vl_BaseFrete/100)*Vl_PrecoCusto);
end;

procedure TLancPrecoForm.DBEditBaseICMSInternoExit(Sender: TObject);
begin
  BTCalcularClick(Self);
end;

procedure TLancPrecoForm.DBEditBaseMargemLucroChange(Sender: TObject);
var
  Vl_PrecoCusto, Vl_BaseMargemLucro : Currency;
begin
  Vl_PrecoCusto := StrToCurr(DBEditPrecoCusto.Text);
  Vl_BaseMargemLucro := StrToCurr(DBEditBaseMargemLucro.Text);
  DBEditValorMargemLucro.Text := CurrToStr((Vl_BaseMargemLucro/100)*Vl_PrecoCusto);
end;

procedure TLancPrecoForm.DBEditPrecoCustoExit(Sender: TObject);
begin
  BTCalcularClick(Self);
end;

procedure TLancPrecoForm.DBEditValorComissaoChange(Sender: TObject);
var
  Vl_PrecoCusto, Vl_ValorComissao : Currency;
begin
  Vl_PrecoCusto := StrToCurr(DBEditPrecoCusto.Text);
  Vl_ValorComissao := StrToCurr(DBEditValorComissao.Text);
  DBEditBaseComissao.Text := CurrToStr((Vl_ValorComissao/Vl_PrecoCusto)*100);
end;

procedure TLancPrecoForm.DBEditValorCustoFixoChange(Sender: TObject);
var
  Vl_PrecoCusto, Vl_ValorCustoFixo : Currency;
begin
  Vl_PrecoCusto := StrToCurr(DBEditPrecoCusto.Text);
  Vl_ValorCustoFixo := StrToCurr(DBEditValorCustoFixo.Text);
  DBEditBaseCustoFixo.Text := CurrToStr((Vl_ValorCustoFixo/Vl_PrecoCusto)*100);
end;

procedure TLancPrecoForm.DBEditValorDescontoChange(Sender: TObject);
var
  Vl_PrecoCusto, Vl_ValorDesconto : Currency;
begin
  Vl_PrecoCusto := StrToCurr(DBEditPrecoCusto.Text);
  Vl_ValorDesconto := StrToCurr(DBEditValorDesconto.Text);
  DBEditBaseDesconto.Text := CurrToStr((Vl_ValorDesconto/Vl_PrecoCusto)*100);
end;

procedure TLancPrecoForm.DBEditValorFreteChange(Sender: TObject);
var
  Vl_PrecoCusto, Vl_ValorFrete : Currency;
begin
  Vl_PrecoCusto := StrToCurr(DBEditPrecoCusto.Text);
  Vl_ValorFrete := StrToCurr(DBEditValorFrete.Text);
  DBEditBaseFrete.Text := CurrToStr((Vl_ValorFrete/Vl_PrecoCusto)*100);
end;      
procedure TLancPrecoForm.DBEditValorMargemLucroChange(Sender: TObject);
var
  Vl_PrecoCusto, Vl_ValorMargemLucro : Currency;
begin
  Vl_PrecoCusto := StrToCurr(DBEditPrecoCusto.Text);
  Vl_ValorMargemLucro := StrToCurr(DBEditValorMargemLucro.Text);
  DBEditBaseMargemLucro.Text := CurrToStr((Vl_ValorMargemLucro/Vl_PrecoCusto)*100);
end;

procedure TLancPrecoForm.FormShow(Sender: TObject);
begin
  if (BancoDeDados.qryCadPreco.state in [dsEdit]) then
    begin
      with BancoDeDados do
        begin
          qryCadPrecoPERC_ICMS_INTERNO.Value        :=    qryCadProdutoPERC_ICMS_INTERNO.Value;
          qryCadPrecoPERC_ICMS_EXTERNO.Value        :=    qryCadProdutoPERC_ICMS_EXTERNO.Value;
          qryCadPrecoPERC_ICMS_SUBSTITUICAO.Value   :=    qryCadProdutoPERC_ICMS_SUBSTITUICAO.Value;
          qryCadPrecoPERC_IPI.Value                 :=    qryCadProdutoPERC_IPI.Value;
          qryCadPrecoPERC_TVA.Value                 :=    qryCadProdutoPERC_TVA.Value;
          qryCadPrecoPERC_PIS.Value                 :=    qryCadProdutoPERC_PIS.Value;
          qryCadPrecoPERC_COFINS.Value              :=    qryCadProdutoPERC_COFINS.Value;
          qryCadPrecoPERC_OUTROS_IMPOSTOS.Value     :=    qryCadProdutoPERC_OUTROS_IMPOSTOS.Value;
          qryCadPrecoPERC_FRETE.Value               :=    qryCadProdutoPERC_FRETE.Value;
          qryCadPrecoVL_FRETE.Value                 :=    qryCadProdutoVL_FRETE.Value;
          qryCadPrecoPERC_COMISSAO.Value            :=    qryCadProdutoPERC_COMISSAO.Value;
          qryCadPrecoVL_COMISSAO.Value              :=    qryCadProdutoVL_COMISSAO.Value;
          qryCadPrecoPERC_CUSTO_FIXO.Value          :=    qryCadProdutoPERC_CUSTO_FIXO.Value;
          qryCadPrecoVL_CUSTO_FIXO.Value            :=    qryCadProdutoVL_CUSTO_FIXO.Value;
          qryCadPrecoPERC_DESCONTO.Value            :=    qryCadProdutoPERC_DESCONTO.Value;
        end;
    end;
end;

end.
