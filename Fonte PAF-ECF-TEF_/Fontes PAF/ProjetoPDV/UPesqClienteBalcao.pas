unit UPesqClienteBalcao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mylabel;

type
  TFPesqClienteBalcao = class(TForm)
    GCliente: TGroupBox;
    ECodCliente: TEdit;
    ENomeCliente: TPanel;
    BTPesqCliente: TBitBtn;
    GEndereco: TGroupBox;
    Label1: TLabel;
    PEndereco: TPanel;
    Label2: TLabel;
    PCidade: TPanel;
    Label3: TLabel;
    PCPF_CNPJ: TPanel;
    Label4: TLabel;
    PRG_IE: TPanel;
    GSituacao: TGroupBox;
    LInfo: TmyLabel3d;
    Vencida: TPanel;
    PVencido: TPanel;
    Vencer: TPanel;
    PVencer: TPanel;
    Total: TPanel;
    PGeral: TPanel;
    BTOk: TBitBtn;
    BTCancela: TBitBtn;
    GroupBox1: TGroupBox;
    MObs: TMemo;
    Label5: TLabel;
    PUF: TPanel;
    Label6: TLabel;
    PCep: TPanel;
    Label7: TLabel;
    PTelefone: TPanel;
    PCelular: TPanel;
    Label8: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ECodClienteKeyPress(Sender: TObject; var Key: Char);
    procedure BTPesqClienteClick(Sender: TObject);
    procedure BTCancelaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BTOkClick(Sender: TObject);
    procedure ECodClienteEnter(Sender: TObject);
    procedure ECodClienteExit(Sender: TObject);
    procedure ECodClienteChange(Sender: TObject);
  private
    { Private declarations }
    vInadimplente, vOkCliente, vTravado : Boolean;
    procedure VerificaCondicoes(xCodCliente : Integer);
    procedure PesquisaCliente;
  public
    { Public declarations }
    vConsulta : Boolean;
    vLimiteCredito, vTrava, vVencidas, vVencer, vHaver, vTotalDivida, vTotalProdutos : Double;
  end;

var
  FPesqClienteBalcao: TFPesqClienteBalcao;

implementation

uses UBarsa, frmpesquisacliente, dmsyndAC, UTelaLimte, USenhaLibera,
     u_fechamento_venda_TEF, lite_frmprincipal, UPAF_ECF, u_cadastro_nominalpdv;

{$R *.dfm}

procedure TFPesqClienteBalcao.PesquisaCliente;
var
   vCodConsultaCliente : Integer;
   sDocumento : String;
begin
      if (Trim(ECodCliente.text)='')or((ECodCliente.Text>='A') and (ECodCliente.Text<='Z'))
      then begin
            Try
               if FPesquisaCliente=Nil
               then application.CreateForm(TFPesquisaCliente, FPesquisaCliente);
               FPesquisaCliente.ShowModal;
               if FPesquisaCliente.ModalResult=mrOk
               then vCodConsultaCliente:=DM.TPesqClienteCODIGO.AsInteger;
            Finally
               FPesquisaCliente.Release;
               FPesquisaCliente:=Nil;
               end;
           end
      else begin
           if Trim(ECodCliente.text)<>''
           then vCodConsultaCliente:=StrToInt(ECodCliente.Text);
           end;

           AC;
           DM.TClientes.Close;
           DM.TClientes.Params[0].AsInteger:=vCodConsultaCliente;
           DM.TClientes.Open;
           if not DM.TClientes.IsEmpty
           then begin
                BTOk.Enabled:=True;
                ECodCliente.text:=StrZero(DM.TClientesCodigo.Value,5);
                ENomeCliente.Caption:=DM.TClientesNome.Value;
                PEndereco.Caption:=DM.TClientesENDERECO.Value;
                PCidade.Caption:=DM.TClientesCidade.Value;
                PUF.Caption:=DM.TClientesUF.Value;
                PCep.Caption:=DM.TClientesCEP.Value;
                PTelefone.Caption:=DM.TClientesTELEFONE.Value;
                PCelular.Caption:=DM.TClientesCELULAR.Value;
                MObs.Lines.Text:=DM.TClientesOBS.Value;
                sDocumento:=SoNumeros(DM.TPesqClienteCPF.Value);
                if Trim(sDocumento)<>''
                then begin
                     PCPF_CNPJ.Caption:=DM.TClientesCPF.Value;
                     PRG_IE.Caption:=DM.TClientesRG.Value;
                     end
                else begin
                     PCPF_CNPJ.Caption:=DM.TClientesCGC.Value;
                     PRG_IE.Caption:=DM.TClientesIE.Value;
                     end;
                vLimiteCredito:=DM.TClientesLimiteCredito.AsFloat;
                vTrava:=DM.TClientesTrava.AsFloat;
                vOkCliente:=True;

                VerificaCondicoes(DM.TClientesCodigo.AsInteger);

                if (vVencidas > 0) or (vVencer > 0)
                then LInfo.Caption:='CLIENTE COM DÉBITO';
                vInadimplente:=False;
                if DM.TClientesInadimplente.AsString='S'
                then begin
                     LInfo.Caption:='< INADIMPLENTE >';
                     vInadimplente:=True;
                     end
                else begin
                     if (vVencidas > 0) or (vVencer > 0)
                     then LInfo.Caption:='CLIENTE COM DÉBITO'
                     else LInfo.Caption:='CRÉDITO LIBERADO';
                     end;
           DC;
           end
           else begin
                DC;
                Informa('CÓDIGO DO CLIENTE NÃO CADASTRADO!');
                ECodCliente.SetFocus;
                end;
end;

procedure TFPesqClienteBalcao.VerificaCondicoes(xCodCliente : Integer);
var
   xDiasAtraso : TDateTime;
begin
     AC;
     vVencidas:=0;
     vVencer:=0;
     vHaver:=0;
     vTravado:=False;
     With DM.QPesquisa
     do begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT CODCLIENTE,DEVOLUCAO,DATAVENCIMENTO,VALOR FROM RECEBER');
        Sql.Add('WHERE CODCLIENTE=:PCODIGO');
        ParamByName('PCODIGO').AsInteger:=xCodCliente;
        Open;
        end;

     if not DM.QPesquisa.IsEmpty
     then begin
          While not DM.QPesquisa.Eof
          do begin
              if DM.QPesquisa.FieldByName('DEVOLUCAO').AsString='N'
              then begin
                   if vTrava > 0
                   then begin
                        xDiasAtraso := (Date - DM.QPesquisa.FieldByName('DATAVENCIMENTO').AsDateTime);
                        if (vTrava < xDiasAtraso)
                        then vTravado := True;
                        end;
                   if DM.QPesquisa.FieldByName('DATAVENCIMENTO').AsDateTime <= Date
                   then vVencidas:=vVencidas + DM.QPesquisa.FieldByName('VALOR').AsFloat
                   else vVencer:=vVencer + DM.QPesquisa.FieldByName('VALOR').AsFloat;
                   end
              else vHaver:=vHaver + DM.QPesquisa.FieldByName('VALOR').AsFloat;
              DM.QPesquisa.Next;
              end;
          end;
      PVencido.Caption:=CasaDecimal(vVencidas,12);
      PVencer.Caption:=CasaDecimal(vVencer,12);
      //PHaver.Caption:=CasaDecimal(vHaver,12);
      PGeral.Caption:=CasaDecimal((vVencidas+vVencer)-vHaver,12);

       DC;
       if vTravado
       then begin
             if Confirma('VENDA NÃO AUTORIZADA A ESTE CLIENTE,'+#13+#13
                        +'NOTAS EM ATRASO ACIMA DO PERMITIDO!'+#13+#13
                        +'LIBERAR A VENDA PARA ESTE CLIENTE?')=mrYes
             then begin
                  FrmPrincipal.VerificaPermissaoUsuario('PE_LIBERA_VENDA_ATRASO');

                  if vLiberado
                  then begin
                       vOkCliente:=True;
                       if not vConsulta
                       then begin
                            BTOk.Enabled:=True;
                            BTOk.SetFocus;
                            end
                       else BTCancela.SetFocus;
                       end
                  else begin
                       BTOk.Enabled:=False;
                       ECodCliente.SetFocus;
                       vOkCliente:=False;
                       end;
                  end
             else begin
                  BTOk.Enabled:=False;
                  ECodCliente.SetFocus;
                  end;
           end;

      //Rotina que verifica o limite de crédito do cliente
      if vLimiteCredito > 0
      then begin
            vTotalDivida:=(vVencidas+vVencer+vTotalProdutos);
            if vLimiteCredito < vTotalDivida
            then begin
                  Try
                    if FTelaLimite=Nil
                    then application.CreateForm(TFTelaLimite, FTelaLimite);
                    FTelaLimite.ShowModal;
                    Finally
                        FTelaLimite.Release;
                        FTelaLimite:=Nil;
                        end;

                   if Confirma('LIBERAR A VENDA?')=Mryes
                   then begin
                        FrmPrincipal.VerificaPermissaoUsuario('PE_LIBERA_VENDA_LIMITE_EXC');

                        if vLiberado
                        then begin
                             vOkCliente:=True;
                             if not vConsulta
                             then begin
                                  BTOk.Enabled:=True;
                                  BTOk.SetFocus;
                                  end
                             else BTCancela.SetFocus;     
                             end
                        else begin
                             BTOk.Enabled:=False;
                             ECodCliente.SetFocus;
                             vOkCliente:=False;
                             end;
                       end
                else begin
                     BTOk.Enabled:=False;
                     ECodCliente.SetFocus;
                     end;
               end;
         end;      
end;


procedure TFPesqClienteBalcao.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FPesqClienteBalcao,Key);
end;

procedure TFPesqClienteBalcao.FormShow(Sender: TObject);
begin
     ECodCliente.Clear;
     LInfo.Caption:='';
     ENomeCliente.Caption:='';
     MObs.Lines.Clear;
     if vConsulta
     then BTOk.Visible:=False
     else vTotalProdutos:=(FFechamentoVenda_Tef.ETotalLiquido.Value-ffechamentovenda_tef.vForma_Pgto_Lancado);
     ECodCliente.SetFocus;
end;

procedure TFPesqClienteBalcao.ECodClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then BTPesqClienteClick(Sender);
end;

procedure TFPesqClienteBalcao.BTPesqClienteClick(Sender: TObject);
begin
     PesquisaCliente;
     if (BTOk.Enabled)and(not vConsulta)
     then BTOk.SetFocus
     else BTCancela.SetFocus;
end;

procedure TFPesqClienteBalcao.BTCancelaClick(Sender: TObject);
begin
     if not vConsulta
     then FFechamentoVenda_Tef.vCliente:=False;
     Close;
end;

procedure TFPesqClienteBalcao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key=VK_F10)and(BTOk.Enabled)and(vConsulta=False)
     then BTOkClick(Sender);

     if Key=VK_Escape
     then BTCancelaClick(Sender);
end;

procedure TFPesqClienteBalcao.BTOkClick(Sender: TObject);
begin
     if Trim(ECodCliente.text)=''
     then begin
          Informa('INFORME O CLIENTE!');
          ECodCliente.SetFocus;
          Exit;
          end;
     Try
       FFechamentoVenda_Tef.vCodCliente:=StrToInt(ECodCliente.text);
     except
       InformaError('CÓDIGO DO CLIENTE INVÁLIDO!');
       ECodCliente.Clear;
       ECodCliente.SetFocus;
       Exit;
       end;

     if vInadimplente
     then begin
           if Confirma('CLIENTE INADIMPLENTE!!!'+#13+#13
                      +'LIBERAR A VENDA PARA ESTE CLIENTE?')=mrYes
           then begin
                FrmPrincipal.VerificaPermissaoUsuario('PE_LIBERA_VENDA_INADIMPLENTE');

                if vLiberado
                then vOkCliente:=True
                else begin
                     BTOk.Enabled:=False;
                     ECodCliente.SetFocus;
                     vOkCliente:=False;
                     end;
                 end
           else begin
                BTOk.Enabled:=False;
                ECodCliente.SetFocus;
                end;
         end;
     if vOkCliente
     then begin
          FFechamentoVenda_Tef.vCodCliente:=StrToInt(ECodCliente.text);
          FFechamentoVenda_Tef.vCliente:=True;

          if f_cadastro_nominalPDV=nil
          then application.createform(tf_cadastro_nominalPDV, f_cadastro_nominalPDV);
          f_cadastro_nominalPDV.BuscaDadosCliente(StrToInt(ECodCliente.text));
          f_cadastro_nominalPDV.btn_okClick(Sender);
          f_cadastro_nominalPDV.Release;
          f_cadastro_nominalPDV:=nil; 

          Close;
          end;
end;

procedure TFPesqClienteBalcao.ECodClienteEnter(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=$0080FFFF;
end;

procedure TFPesqClienteBalcao.ECodClienteExit(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=clWhite;
end;

procedure TFPesqClienteBalcao.ECodClienteChange(Sender: TObject);
begin
     if (ECodCliente.Text>='A') and (ECodCliente.Text<='Z')
     then BTPesqClienteClick(Sender); 
end;

end.
