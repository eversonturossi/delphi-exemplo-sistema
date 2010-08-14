unit UCrediario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mylabel, Mask, ExtCtrls, ComCtrls,
  Buttons, Grids, DBGrids, DB, DBClient, EasyTEFDiscado, rxToolEdit,
  rxCurrEdit;

type
  TFCrediario = class(TForm)
    GCliente: TGroupBox;
    LCliente: TmyLabel3d;
    GValorCompra: TGroupBox;
    GCarteira: TGroupBox;
    GCheque: TGroupBox;
    EValor_Crediario: TCurrencyEdit;
    ECarteira: TCurrencyEdit;
    ECheque: TCurrencyEdit;
    SB: TStatusBar;
    GParcelas: TGroupBox;
    GNumCheques: TGroupBox;
    ENumParcelas: TCurrencyEdit;
    ENumCheques: TCurrencyEdit;
    DBGridCarteira: TDBGrid;
    dsCarteira: TDataSource;
    dsCheque: TDataSource;
    TParcelasCheque: TClientDataSet;
    TParcelasChequeCODBANCO: TIntegerField;
    TParcelasChequeAGENCIA: TStringField;
    TParcelasChequeCONTA: TStringField;
    TParcelasChequeCHEQUE: TIntegerField;
    TParcelasChequeVENCIMENTO: TDateField;
    TParcelasChequeVALOR: TFloatField;
    PCheque: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBGridCheque: TDBGrid;
    ECodBanco: TEdit;
    EAgencia: TEdit;
    EConta: TEdit;
    ENumCheque: TEdit;
    EVencimentoCheque: TDateEdit;
    EValorCheque: TCurrencyEdit;
    BTOk: TBitBtn;
    BTCancela: TBitBtn;
    TParcelasChequeTOTAL: TAggregateField;
    TParcelasCarteira: TClientDataSet;
    TParcelasCarteiraVENCIMENTO: TDateField;
    TParcelasCarteiraVALOR: TFMTBCDField;
    TParcelasCarteiraPARCELA: TStringField;
    PEditaParcela: TPanel;
    EVencimento: TDateEdit;
    EValor: TCurrencyEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    TParcelasCarteiraID: TAutoIncField;
    TParcelasCarteiraSOMA: TAggregateField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ECarteiraEnter(Sender: TObject);
    procedure EChequeEnter(Sender: TObject);
    procedure ECarteiraExit(Sender: TObject);
    procedure EChequeExit(Sender: TObject);
    procedure ENumParcelasExit(Sender: TObject);
    procedure ENumChequesExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BTCancelaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ECodBancoEnter(Sender: TObject);
    procedure EAgenciaEnter(Sender: TObject);
    procedure EContaEnter(Sender: TObject);
    procedure ENumChequeEnter(Sender: TObject);
    procedure ECodBancoExit(Sender: TObject);
    procedure EAgenciaExit(Sender: TObject);
    procedure EContaExit(Sender: TObject);
    procedure ENumChequeExit(Sender: TObject);
    procedure EValorChequeEnter(Sender: TObject);
    procedure EValorChequeExit(Sender: TObject);
    procedure EVencimentoChequeExit(Sender: TObject);
    procedure EVencimentoChequeEnter(Sender: TObject);
    procedure ENumChequesKeyPress(Sender: TObject; var Key: Char);
    procedure EValorChequeKeyPress(Sender: TObject; var Key: Char);
    procedure BTOkClick(Sender: TObject);
    procedure DBGridCarteiraEnter(Sender: TObject);
    procedure DBGridCarteiraExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ECarteiraKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EValorExit(Sender: TObject);
    procedure DBGridCarteiraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EVencimentoEnter(Sender: TObject);
    procedure EValorEnter(Sender: TObject);
    procedure EVencimentoExit(Sender: TObject);
    procedure EValorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    vCompara_Cheque_Lancado : Integer;
    procedure GeraParcelasCarteira;
    procedure VerificaFormaPgtos;
    procedure Ajusta_Valor_Parcelas(Sender: TObject);
    procedure Ajusta_Arredondamento_Parcelas(Sender: TObject);
  public
    { Public declarations }
    vValor_Crediario : Double;
    okCrediario : Boolean;
  end;

var
  FCrediario: TFCrediario;

implementation

uses UBarsa, u_fechamento_venda_TEF, UPesqClienteBalcao, dmsyndAC,
     UAgBancaria, lite_frmprincipal, checkout, ConstTefDiscado;

{$R *.dfm}

procedure TFCrediario.Ajusta_Arredondamento_Parcelas(Sender: TObject);
var
   xArredondamento : Double;
   ID : Integer;
begin
     xArredondamento:=0;
     TParcelasCarteira.DisableControls;
     ID:=TParcelasCarteiraID.AsInteger;
     TParcelasCarteira.First;
     While not TParcelasCarteira.Eof
     do begin
        xArredondamento:=xArredondamento+TParcelasCarteiraValor.AsFloat;
        TParcelasCarteira.Next;
        end;

     if xArredondamento > ECarteira.Value
     then begin
          TParcelasCarteira.Edit;
          TParcelasCarteiraValor.AsFloat:=TParcelasCarteiraValor.AsFloat-(xArredondamento-ECarteira.Value);
          TParcelasCarteira.Post;
          end
     else if xArredondamento < ECarteira.Value
     then begin
          TParcelasCarteira.Edit;
          TParcelasCarteiraValor.AsFloat:=TParcelasCarteiraValor.AsFloat+(ECarteira.Value-xArredondamento);
          TParcelasCarteira.Post;
          end;
     TParcelasCarteira.Locate('ID',ID,[]);
     TParcelasCarteira.EnableControls;
end;

procedure TFCrediario.Ajusta_Valor_Parcelas(Sender: TObject);
var
   vSoma, vTotal, vJaAlterado : Double;
   vParcelaRestante, ID : Integer;
begin
      TParcelasCarteira.DisableControls;
      vParcelaRestante:=0;
      vJaAlterado:=0;
      ID:=TParcelasCarteiraID.AsInteger;
      if not TParcelasCarteira.Bof
      then begin
           TParcelasCarteira.First;
           While (TParcelasCarteiraID.Value<>ID)and(not TParcelasCarteira.Eof)
           do begin
              vJaAlterado:=vJaAlterado+TParcelasCarteiraValor.AsFloat;
              TParcelasCarteira.Next;
              end;
           end;

      vSoma := EValor.Value+vJaAlterado;
      vTotal := ECarteira.Value;

      TParcelasCarteira.Next;
      While not TParcelasCarteira.Eof
      do begin
         Inc(vParcelaRestante);
         TParcelasCarteira.Next;
         end;

     TParcelasCarteira.Locate('ID',ID,[]);
     TParcelasCarteira.Next;
     While not TParcelasCarteira.Eof
     do begin
        TParcelasCarteira.Edit;
        TParcelasCarteiraValor.AsFloat:=((vTotal-vSoma)/vParcelaRestante);
        TParcelasCarteira.Post;
        TParcelasCarteira.Next;
        end;
     TParcelasCarteira.Locate('ID',ID,[]);
     TParcelasCarteira.EnableControls;
end;

procedure TFCrediario.VerificaFormaPgtos;
begin
      if ECarteira.Value = 0 //Parcelamento só com cheques
      then begin
           GCheque.Visible:=True;
           GNumCheques.Visible:=True;
           PCheque.Visible:=True;
           GCheque.Top:=45;
           GNumCheques.Top:=45;
           PCheque.Top:=51;
           ECheque.Value:=EValor_Crediario.Value;
          end
     else if ECarteira.Value <= EValor_Crediario.Value
     then begin
          GCheque.Visible:=False;
          GNumCheques.Visible:=False;
          PCheque.Visible:=False;
          BTOk.Top:=175;
          BTCancela.Top:=175;
          FCrediario.Height:=273;
          end;


     {if ECarteira.Value < EValor_Crediario.Value
     then begin
          if ECarteira.Value > 0
          then begin
                FCrediario.Height:=390;
                GCheque.Visible:=True;
                GNumCheques.Visible:=True;
                PCheque.Visible:=True;
                BTOk.Top:=297;
                BTCancela.Top:=297;
                ECheque.Value:=EValor_Crediario.Value-ECarteira.Value;
                end
          else if ECarteira.Value = 0 //Parcelamento só com cheques
          then begin
               GCheque.Visible:=True;
               GNumCheques.Visible:=True;
               PCheque.Visible:=True;
               GCheque.Top:=45;
               GNumCheques.Top:=45;
               PCheque.Top:=51;
               ECheque.Value:=EValor_Crediario.Value;
               ENumCheques.SetFocus;
               end;
          end
     else if ECarteira.Value = EValor_Crediario.Value
     then begin
          GCheque.Visible:=False;
          GNumCheques.Visible:=False;
          PCheque.Visible:=False;
          BTOk.Top:=175;
          BTCancela.Top:=175;
          FCrediario.Height:=273;
          end;}
end;

procedure TFCrediario.GeraParcelasCarteira;
var
   i, flag, xNumParc : Integer;
   xData : TDate;
   xDia, xMes, xAno : word;
   xValor, xJuros : Double;
   vParcelas : String;
begin
     if FFechamentoVenda_Tef.vCliente=False
     then begin
          Informa('CLIENTE NÃO SELECIONADO!');
          Close;
          Exit;
          end;

     TParcelasCarteira.EmptyDataSet;
     xNumParc := 0;
     flag:=1;
     vParcelas:=FloatToStr(ENumParcelas.Value);

     xValor := ValorPrestacao(StrToInt(vParcelas),(ECarteira.Value),0,flag );
     xData := Date;

     For i:=1 to StrToInt(vParcelas)
     do begin
         xDia:=Dia(xData);
         xNumParc := xNumParc + 1;
         xMes:=Mes(xData);
         xAno:=Ano(xData);
         if xmes = 12
         then begin
              xmes := 1;
              xano := xano + 1;
              end
         else xmes := xMes + 1;

         if (xMes in[2,4,6,9,11]) and ((xDia=29) or (xDia=30) or (xDia=31) )
         then begin
              if (xMes = 2)
              then xDia:=28
              else xDia:=30;
              end;

         xData:=EncodeDate(xAno,xMes,xDia);
         TParcelasCarteira.Append;
         TParcelasCarteiraVencimento.Value:=xData;
         TParcelasCarteiraValor.AsFloat:=xValor;
         TParcelasCarteiraParcela.Value:=StrZero(I,2)+'/'+FormatFloat('##00',ENumParcelas.Value);
         TParcelasCarteira.Post;
         end;
     Ajusta_Arredondamento_Parcelas(Nil);

     //if ECarteira.Value = EValor_Crediario.Value
     BTOk.Enabled:=True;
     TParcelasCarteira.First;
     DBGridCarteira.SetFocus;
end;

procedure TFCrediario.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FCrediario,Key);
end;

procedure TFCrediario.ECarteiraEnter(Sender: TObject);
begin
     if (Sender is TCurrencyEdit) then
     TCurrencyEdit(Sender).Color:=$0080FFFF;

     TParcelasCheque.EmptyDataSet;
end;

procedure TFCrediario.EChequeEnter(Sender: TObject);
begin
     if (Sender is TCurrencyEdit) then
     TCurrencyEdit(Sender).Color:=$0080FFFF;
end;

procedure TFCrediario.ECarteiraExit(Sender: TObject);
begin
     if (Sender is TCurrencyEdit) then
     TCurrencyEdit(Sender).Color:=clWhite;

     if ECarteira.Value > EValor_Crediario.Value
     then begin
          Informa('O VALOR DA CARTEIRA NÃO PODE SER MAIOR QUE O VALOR DA COMPRA!');
          ECarteira.Value:=EValor_Crediario.Value;
          ECarteira.SetFocus;
          Exit;
          end;

     if ECarteira.Value <= 0
     then begin
          Informa('VALOR INVÁLIDO!');
          ECarteira.Value:=EValor_Crediario.Value;
          ECarteira.SetFocus;
          Exit;
          end;

     EValor_Crediario.Value:=ECarteira.Value;
     vValor_Crediario:=EValor_Crediario.Value;

     VerificaFormaPgtos;
end;

procedure TFCrediario.EChequeExit(Sender: TObject);
begin
     if (Sender is TCurrencyEdit) then
     TCurrencyEdit(Sender).Color:=clWhite;

     if ECheque.Value > EValor_Crediario.Value
     then begin
          Informa('O VALOR DA CARTEIRA NÃO PODE SER MAIOR QUE O VALOR DA COMPRA!');
          ECheque.Value:=EValor_Crediario.Value;
          ECheque.SetFocus;
          Exit;
          end;

     if ECheque.Value <= 0
     then begin
          Informa('VALOR INVÁLIDO!');
          ECheque.Value:=EValor_Crediario.Value;
          ECheque.SetFocus;
          Exit;
          end;

     EValor_Crediario.Value:=ECheque.Value;
     vValor_Crediario:=EValor_Crediario.Value;
end;

procedure TFCrediario.ENumParcelasExit(Sender: TObject);
begin
     if (Sender is TCurrencyEdit) then
     TCurrencyEdit(Sender).Color:=clWhite;

     if ENumParcelas.Value <= 0
     then ENumParcelas.Value:=1;

     GeraParcelasCarteira;
end;

procedure TFCrediario.ENumChequesExit(Sender: TObject);
begin
     if (Sender is TCurrencyEdit) then
     TCurrencyEdit(Sender).Color:=clWhite;

     if ENumCheques.Value <= 0
     then ENumCheques.Value := 1;

     vCompara_Cheque_Lancado:=0;
     EVencimentoCheque.Date:=Date;
end;

procedure TFCrediario.FormShow(Sender: TObject);
begin
     LimpaEdit(FCrediario);
     vCompara_Cheque_Lancado:=0;
     LCliente.Caption:='';
     GCheque.Visible:=False;
     GNumCheques.Visible:=False;
     PCheque.Visible:=False;
     BTOk.Top:=175;
     BTCancela.Top:=175;
     FCrediario.Height:=273;

     ECarteira.Value:=0;
     ECheque.Value:=0;
     EValor_Crediario.Value:=(FFechamentoVenda_Tef.ETotalLiquido.Value-ffechamentovenda_tef.vForma_Pgto_Lancado);
     vValor_Crediario:=EValor_Crediario.Value;
     if ffechamentovenda_tef.vTecla_Crediario='F5'
     then begin
          ECarteira.Value:=EValor_Crediario.Value;
          TParcelasCarteira.EmptyDataSet;
          end
     else begin
          ECheque.Value:=EValor_Crediario.Value;
          TParcelasCheque.EmptyDataSet;
          end;
     ENumParcelas.Value:=1;
     ENumCheques.Value:=1;
     OkCrediario:=False;
     BTOk.Enabled:=False;

     VerificaFormaPgtos;

end;

procedure TFCrediario.FormActivate(Sender: TObject);
begin
    Try
       if FPesqClienteBalcao=nil
       then Application.CreateForm(TFPesqClienteBalcao,FPesqClienteBalcao);
       FPesqClienteBalcao.ShowModal;
       LCliente.Caption:=FPesqClienteBalcao.ENomeCliente.Caption;
    Finally
       FPesqClienteBalcao.Release;
       FPesqClienteBalcao:=Nil;
       end;

    if ffechamentovenda_tef.vTecla_Crediario='F5'
    then ECarteira.SetFocus
    else ECheque.SetFocus;
    FCrediario.Repaint;
    
end;

procedure TFCrediario.BTCancelaClick(Sender: TObject);
begin
     if Confirma('CONFIRMA O CANCELAMENTO DESTA TELA?')=mrYes
     then begin
          OkCrediario:=False;
          Close;
          end;
end;

procedure TFCrediario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_Escape
     then BTCancelaClick(Sender);
end;

procedure TFCrediario.ECodBancoEnter(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=$0080FFFF;

     DM.TAgBancaria.Open;
end;

procedure TFCrediario.EAgenciaEnter(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=$0080FFFF;
end;

procedure TFCrediario.EContaEnter(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=$0080FFFF;
end;

procedure TFCrediario.ENumChequeEnter(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=$0080FFFF;
end;

procedure TFCrediario.ECodBancoExit(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=clWhite;

     if (Trim(ECodBanco.Text)='')or(not DM.TAgBancaria.Locate('CODIGO',StrToInt(ECodBanco.Text),[]))
     then begin
          Try
             if FAgBancaria=Nil
             then Application.CreateForm(TFAgBancaria,FAgBancaria);
             FAgBancaria.vConsulta:=True;
             FAgBancaria.ShowModal;
             FAgBancaria.vConsulta:=False;
             if FAgBancaria.ModalResult=mrOk
             then ECodBanco.Text:=StrZero(DM.TAgBancariaCODIGO.AsInteger,3);
          Finally
             FAgBancaria.Release;
             FAgBancaria:=Nil;
             end;
        end;
end;

procedure TFCrediario.EAgenciaExit(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=clWhite;
end;

procedure TFCrediario.EContaExit(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=clWhite;
end;

procedure TFCrediario.ENumChequeExit(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=clWhite;

     if Trim(ENumCheque.Text)=''
     then ENumCheque.Text:='000000';
end;

procedure TFCrediario.EValorChequeEnter(Sender: TObject);
begin
     if (Sender is TCurrencyEdit) then
     TCurrencyEdit(Sender).Color:=$0080FFFF;

     if ENumCheques.Value = 1
     then EValorCheque.Value := ECheque.Value; 
end;

procedure TFCrediario.EValorChequeExit(Sender: TObject);
begin
     if (Sender is TCurrencyEdit) then
     TCurrencyEdit(Sender).Color:=clWhite;
end;

procedure TFCrediario.EVencimentoChequeExit(Sender: TObject);
begin
    if (Sender is TDateEdit) then
    TDateEdit(Sender).Color:=clWhite;
end;

procedure TFCrediario.EVencimentoChequeEnter(Sender: TObject);
begin
     if (Sender is TDateEdit) then
     TDateEdit(Sender).Color:=$0080FFFF;
end;

procedure TFCrediario.ENumChequesKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then ECodBanco.SetFocus;
end;

procedure TFCrediario.EValorChequeKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then begin
          if Confirma('CONFIRMA O LANÇAMENTO DESTE CHEQUE?')=mrYes
          then begin
               if EValorCheque.Value > ECheque.Value
               then begin
                    Informa('O VALOR DO CHEQUE NÃO PODE SER MAIOR QUE O VALOR LANÇADO!');
                    EValorCheque.SetFocus;
                    Exit;
                    end;
               if ENumCheques.Value = 1
               then begin
                    if EValorCheque.Value <> ECheque.Value
                    then begin
                         Informa('O VALOR DO CHEQUE NÃO PODE SER DIFERENTE DO VALOR LANÇADO!');
                         EValorCheque.Value:=ECheque.Value;
                         end;
                    end;
               Inc(vCompara_Cheque_Lancado);

               if (vCompara_Cheque_Lancado > StrToInt(FloatToStr(ENumCheques.Value)))
               then begin
                    Informa('OS CHEQUES JA FORAM TODOS LANÇADOS!');
                    BTOk.Enabled:=True;
                    BTOk.SetFocus;
                    Exit;
                    end;

               TParcelasCheque.Append;
               TParcelasChequeCodBanco.AsInteger:=StrToInt(ECodBanco.text);
               TParcelasChequeAgencia.Value:=EAgencia.Text;
               TParcelasChequeConta.Value:=EConta.Text;
               TParcelasChequeCheque.AsInteger:=StrToInt(ENumCheque.Text);
               TParcelasChequeVencimento.AsDateTime:=EVencimentoCheque.Date;
               TParcelasChequeValor.Value:=EValorCheque.Value;
               TParcelasCheque.Post;

               if (vCompara_Cheque_Lancado = StrToInt(FloatToStr(ENumCheques.Value)))
               then begin
                    if TParcelasCheque.FieldByName('TOTAL').Value <> ECheque.Value
                    then begin
                         Dec(vCompara_Cheque_Lancado);
                         Informa('VALORES NÃO CONFERE!');
                         TParcelasCheque.Delete;
                         ECodBanco.SetFocus;
                         end
                    else begin
                         BTOk.Enabled:=True;
                         DBGridCheque.SetFocus;
                         end;
                    end
               else ECodBanco.SetFocus;
               end;
          end;
end;

procedure TFCrediario.BTOkClick(Sender: TObject);
var
   vComparaValor : Double;
begin
     if Confirma('CONFIRMA O LANÇAMENTO DO CREDIÁRIO?')=mrYes
     then begin
          if ECarteira.Value > 0
          then begin
               if TParcelasCarteira.IsEmpty
               then begin
                    Informa('AS PARCELAS NÃO FORAM GERADAS, FAVOR VERIFICAR!');
                    ECarteira.SetFocus;
                    Exit;
                    end;
               end;
          if ECheque.Value > 0
          then begin
               if TParcelasCheque.IsEmpty
               then begin
                    Informa('OS CHEQUES NÃO FORAM GERADOS, FAVOR VERIFICAR!');
                    ECheque.SetFocus;
                    Exit;
                    end;
               end;

          OkCrediario:=True;
          Close;
          end;
end;

procedure TFCrediario.DBGridCarteiraEnter(Sender: TObject);
begin
//     FCrediario.OnKeyPress:=Nil;
end;

procedure TFCrediario.DBGridCarteiraExit(Sender: TObject);
begin
//     FCrediario.OnKeyPress:=FormKeyPress;
end;

procedure TFCrediario.FormDestroy(Sender: TObject);
begin
     DM.TAgBancaria.Close;
end;

procedure TFCrediario.ECarteiraKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=40  // seta para baixo
     then FCrediario.Perform(WM_NextDlgCtl,0,0);

     if key=38  // seta para cima
     then FCrediario.Perform(WM_NextDlgCtl,1,0);
end;

procedure TFCrediario.EValorExit(Sender: TObject);
begin
     if (Sender is TCurrencyEdit) then
     TCurrencyEdit(Sender).Color:=clWhite;

     if EValor.Value <= 0
     then EValor.Value := TParcelasCarteiraValor.AsFloat;
end;

procedure TFCrediario.DBGridCarteiraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key=VK_F2)and(not TParcelasCarteira.IsEmpty)
     then begin
          PEditaParcela.Visible:=True;
          EVencimento.Date:=TParcelasCarteiraVencimento.Value;
          EValor.Value:=TParcelasCarteiraValor.AsFloat;
          EVencimento.SetFocus;
          end;
end;

procedure TFCrediario.EVencimentoEnter(Sender: TObject);
begin
     if (Sender is TDateEdit) then
     TDateEdit(Sender).Color:=$0080FFFF;
end;

procedure TFCrediario.EValorEnter(Sender: TObject);
begin
     if (Sender is TCurrencyEdit) then
     TCurrencyEdit(Sender).Color:=$0080FFFF;
end;

procedure TFCrediario.EVencimentoExit(Sender: TObject);
begin
     if (Sender is TDateEdit) then
     TDateEdit(Sender).Color:=clWhite;

     if EVencimento.Date = Null
     then EVencimento.Date := TParcelasCarteiraVencimento.Value;
end;

procedure TFCrediario.EValorKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then begin
          TParcelasCarteira.Edit;
          TParcelasCarteiraVencimento.Value:=EVencimento.Date;
          TParcelasCarteiraValor.AsFloat:=EValor.Value;
          TParcelasCarteira.Post;

          Ajusta_Valor_Parcelas(Nil);
          Ajusta_Arredondamento_Parcelas(Nil);

          PEditaParcela.Visible:=False;
          DBGridCarteira.SetFocus;
          end;
end;

end.
