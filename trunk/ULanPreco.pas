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
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    procedure CalculaPreco;
    { Public declarations }
  end;

var
  LancPrecoForm: TLancPrecoForm;

implementation
uses Base, UCadProduto;
{$R *.dfm}
procedure TLancPrecoForm.CalculaPreco;
var
  Vl_ICMSInterno, Vl_ICMSExterno, Vl_ICMSSubstituicao,
  Vl_IPI, Vl_TVA, Vl_PIS, Vl_Cofins, Vl_Outros, Vl_Frete,
  Vl_Comissao, Vl_CustoFixo, Vl_Desconto, Vl_MargemLucro,
  Vl_PrecoCusto, Vl_PrecoSugerido, Vl_Preco : Currency;
begin
  Vl_PrecoCusto := BancoDeDados.qryCadPrecoPRECO_CUSTO.Value;
  
  try
    Vl_ICMSInterno := ((BancoDeDados.qryCadPrecoPERC_ICMS_INTERNO.Value/100)*Vl_PrecoCusto);
  except
    Vl_ICMSInterno := 0;
  end;
  try
    Vl_ICMSExterno := ((BancoDeDados.qryCadPrecoPERC_ICMS_EXTERNO.Value/100)*Vl_PrecoCusto);
  except
    Vl_ICMSExterno := 0;
  end;
  try
    Vl_ICMSSubstituicao := ((BancoDeDados.qryCadPrecoPERC_ICMS_SUBSTITUICAO.Value/100)*Vl_PrecoCusto);
  except
    Vl_ICMSSubstituicao := 0;
  end;
  try
    Vl_IPI := ((BancoDeDados.qryCadPrecoPERC_IPI.Value/100)*Vl_PrecoCusto);
  except
    Vl_IPI := 0;
  end;
  try
    Vl_TVA := ((BancoDeDados.qryCadPrecoPERC_TVA.Value/100)*Vl_PrecoCusto);
  except
    Vl_TVA := 0;
  end;
  try
    Vl_PIS := ((BancoDeDados.qryCadPrecoPERC_PIS.Value/100)*Vl_PrecoCusto);
  except
    Vl_PIS := 0;
  end;
  try
    Vl_Cofins := ((BancoDeDados.qryCadPrecoPERC_COFINS.Value/100)*Vl_PrecoCusto);
  except
    Vl_Cofins := 0;
  end;
  try
    Vl_Outros := ((BancoDeDados.qryCadPrecoPERC_OUTROS_IMPOSTOS.Value/100)*Vl_PrecoCusto);
  except
    Vl_Outros := 0;
  end;

  if (BancoDeDados.qryCadPrecoPERC_FRETE.Value > 0) then
    Vl_Frete := ((BancoDeDados.qryCadPrecoPERC_FRETE.Value/100)*Vl_PrecoCusto)
  else
    if (BancoDeDados.qryCadPrecoVL_FRETE.Value > 0) then
      Vl_Frete := BancoDeDados.qryCadPrecoVL_FRETE.Value
    else
      Vl_Frete := 0;

  if (BancoDeDados.qryCadPrecoPERC_COMISSAO.Value > 0) then
    Vl_Comissao := ((BancoDeDados.qryCadPrecoPERC_COMISSAO.Value/100)*Vl_PrecoCusto)
  else
    if (BancoDeDados.qryCadPrecoVL_COMISSAO.Value > 0) then
      Vl_Comissao := BancoDeDados.qryCadPrecoVL_COMISSAO.Value
    else
      Vl_Comissao := 0;

  if (BancoDeDados.qryCadPrecoPERC_CUSTO_FIXO.Value > 0) then
    Vl_CustoFixo := ((BancoDeDados.qryCadPrecoPERC_CUSTO_FIXO.Value/100)*Vl_PrecoCusto)
  else
    if (BancoDeDados.qryCadPrecoVL_CUSTO_FIXO.Value > 0) then
      Vl_CustoFixo := BancoDeDados.qryCadPrecoVL_CUSTO_FIXO.Value
    else
      Vl_CustoFixo := 0;

  if (BancoDeDados.qryCadPrecoPERC_DESCONTO.Value > 0) then
    Vl_Desconto := ((BancoDeDados.qryCadPrecoPERC_DESCONTO.Value/100)*Vl_PrecoCusto)
  else
    if (BancoDeDados.qryCadPrecoVL_DESCONTO.Value > 0) then
      Vl_Desconto := BancoDeDados.qryCadPrecoVL_DESCONTO.Value
    else
      Vl_Desconto := 0;

  if (BancoDeDados.qryCadPrecoPERC_MARGEM_LUCRO.Value > 0) then
    Vl_MargemLucro := ((BancoDeDados.qryCadPrecoPERC_MARGEM_LUCRO.Value/100)*Vl_PrecoCusto)
  else
    if (BancoDeDados.qryCadPrecoVL_MARGEM_LUCRO.Value > 0) then
      Vl_MargemLucro := BancoDeDados.qryCadPrecoVL_MARGEM_LUCRO.Value
    else
      Vl_MargemLucro := 0;

  Vl_PrecoSugerido := Vl_PrecoCusto + (Vl_ICMSInterno + Vl_ICMSExterno + Vl_ICMSSubstituicao +
            Vl_IPI + Vl_TVA + Vl_PIS + Vl_Cofins + Vl_Outros + Vl_Frete + Vl_Comissao +
            Vl_CustoFixo + Vl_MargemLucro) - Vl_Desconto;

  Vl_Preco := Vl_PrecoSugerido;

  BancoDeDados.qryCadPrecoPRECO_SUGERIDO.Value := Vl_PrecoSugerido;
  BancoDeDados.qryCadPrecoPRECO_VENDA.Value := Vl_Preco;
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

procedure TLancPrecoForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    begin
      Key := #0;
      Perform(WM_NEXTDLGCTL,0,0);
    end;
  if (key = #27) then
    begin
      key := #0;
      Close;
    end;
end;

procedure TLancPrecoForm.FormShow(Sender: TObject);
var
  temp : currency;
begin
temp:=0;
  if (BancoDeDados.qryCadPreco.state in [dsEdit]) then
    begin
      with BancoDeDados do
        begin
          if (CadProdutoForm.EditPrecoAtacado.Value > 0) then
            qryCadPrecoPRECO_CUSTO.Value := CadProdutoForm.EditPrecoAtacado.Value
          else
            qryCadPrecoPRECO_CUSTO.Value := 0;

          if not (qryCadProdutoPERC_ICMS_INTERNO.IsNull) then
            qryCadPrecoPERC_ICMS_INTERNO.Value := qryCadProdutoPERC_ICMS_INTERNO.Value
          else
            qryCadPrecoPERC_ICMS_INTERNO.Value := 0;

          if not (qryCadProdutoPERC_ICMS_EXTERNO.IsNull) then
            qryCadPrecoPERC_ICMS_EXTERNO.Value := qryCadProdutoPERC_ICMS_EXTERNO.Value
          else
            qryCadPrecoPERC_ICMS_EXTERNO.Value := 0;

          if not (qryCadProdutoPERC_ICMS_SUBSTITUICAO.IsNull) then
            qryCadPrecoPERC_ICMS_SUBSTITUICAO.Value := qryCadProdutoPERC_ICMS_SUBSTITUICAO.Value
          else
            qryCadPrecoPERC_ICMS_SUBSTITUICAO.Value := 0;

          if not (qryCadProdutoPERC_IPI.IsNull) then
            qryCadPrecoPERC_IPI.Value := qryCadProdutoPERC_IPI.Value
          else
            qryCadPrecoPERC_IPI.Value := 0;
            
          if not (qryCadProdutoPERC_TVA.IsNull) then
            qryCadPrecoPERC_TVA.Value := qryCadProdutoPERC_TVA.Value
          else
            qryCadPrecoPERC_TVA.Value := 0;

          if not (qryCadProdutoPERC_PIS.IsNull) then
            qryCadPrecoPERC_PIS.Value := qryCadProdutoPERC_PIS.Value
          else
            qryCadPrecoPERC_PIS.Value := 0;

          if not (qryCadProdutoPERC_COFINS.IsNull) then
            qryCadPrecoPERC_COFINS.Value := qryCadProdutoPERC_COFINS.Value
          else
            qryCadPrecoPERC_COFINS.Value := 0;

          if not (qryCadProdutoPERC_OUTROS_IMPOSTOS.IsNull) then
            qryCadPrecoPERC_OUTROS_IMPOSTOS.Value := qryCadProdutoPERC_OUTROS_IMPOSTOS.Value
          else
            qryCadPrecoPERC_OUTROS_IMPOSTOS.Value := 0;

          if not (qryCadProdutoPERC_FRETE.IsNull) then
            qryCadPrecoPERC_FRETE.Value := qryCadProdutoPERC_FRETE.Value
          else
            qryCadPrecoPERC_FRETE.Value := 0;

          if not (qryCadProdutoVL_FRETE.IsNull) then
            qryCadPrecoVL_FRETE.Value := qryCadProdutoVL_FRETE.Value
          else
            qryCadPrecoVL_FRETE.Value := 0;
            
          if not (qryCadProdutoPERC_COMISSAO.IsNull) then
            qryCadPrecoPERC_COMISSAO.Value := qryCadProdutoPERC_COMISSAO.Value
          else
            qryCadPrecoPERC_COMISSAO.Value := 0;

          if not (qryCadProdutoVL_COMISSAO.IsNull) then
            qryCadPrecoVL_COMISSAO.Value := qryCadProdutoVL_COMISSAO.Value
          else
            qryCadPrecoVL_COMISSAO.Value := 0;

          if not (qryCadProdutoPERC_CUSTO_FIXO.IsNull) then
            qryCadPrecoPERC_CUSTO_FIXO.Value := qryCadProdutoPERC_CUSTO_FIXO.Value
          else
            qryCadPrecoPERC_CUSTO_FIXO.Value := 0;

          if not (qryCadProdutoVL_CUSTO_FIXO.IsNull) then
            qryCadPrecoVL_CUSTO_FIXO.Value := qryCadProdutoVL_CUSTO_FIXO.Value
          else
            qryCadPrecoVL_CUSTO_FIXO.Value := 0;

          if not (qryCadProdutoPERC_DESCONTO.IsNull) then
            qryCadPrecoPERC_DESCONTO.Value := qryCadProdutoPERC_DESCONTO.Value
          else
            qryCadPrecoPERC_DESCONTO.Value := 0;
        end;
    end;
end;

end.
