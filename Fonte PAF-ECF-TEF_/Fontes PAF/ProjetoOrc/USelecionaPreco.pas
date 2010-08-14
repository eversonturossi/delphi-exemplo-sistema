unit USelecionaPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFClassificaPreco = class(TForm)
    RBPrecoVista: TRadioButton;
    RBPrecoPrazo: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClassificaPreco: TFClassificaPreco;

implementation

uses UConsultaProdutos, UOrcamento, UDM, UBarsa;

{$R *.dfm}

procedure TFClassificaPreco.FormShow(Sender: TObject);
begin
     if sPrecoTabela='V'
     then RBPrecoVista.Checked:=True
     else RBPrecoPrazo.Checked:=True;
end;

procedure TFClassificaPreco.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then Close;
end;

procedure TFClassificaPreco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if RBPrecoVista.Checked
     then sPrecoTabela:='V'
     else sPrecoTabela:='P';

     FOrcamentos.LTabela.Caption:='Tabela = '+sPrecoTabela;

     if FPesquisaProdutos<>Nil
     then FPesquisaProdutos.SelecionaColuna(Nil)
     else begin
          if Confirma('Deseja substituir o preço de todos itens lançado?')=mrYes
          then begin
                DM.TOrcTemp.DisableConstraints;
                DM.TOrcTemp.First;
                While not DM.TOrcTemp.Eof
                do begin
                   DM.TOrcTemp.Edit;
                   if Status_Serv='ON'
                   then begin
                        With DM.QPesquisa
                        do begin
                           Close;
                           Sql.Clear;
                           Sql.Add('SELECT CODIGO,PRECOVENDA,PRECOPRAZO FROM ESTOQUE');
                           Sql.Add('WHERE CODIGO = :PCODIGO');
                           ParamByName('PCODIGO').AsInteger:=DM.TOrcTempCODPRODUTO.AsInteger;
                           Open;
                           if sPrecoTabela='V'
                           then DM.TOrcTempVL_UNIT.AsCurrency:=FieldByName('PRECOVENDA').Value
                           else DM.TOrcTempVL_UNIT.AsCurrency:=FieldByName('PRECOPRAZO').Value;
                           end;
                        end
                   else begin
                        if DM.TPesqProdutoTemp.Locate('CODIGO',DM.TOrcTempCODPRODUTO.Value,[])
                        then begin
                             if sPrecoTabela='V'
                             then DM.TOrcTempVL_UNIT.AsCurrency:=DM.TPesqProdutoTempPRECOVENDA.AsCurrency
                             else DM.TOrcTempVL_UNIT.AsCurrency:=DM.TPesqProdutoTempPRECOPRAZO.AsCurrency;
                             end;
                        end;
                   DM.TOrcTempTABELA.Value:=sPrecoTabela;
                   DM.TOrcTempVL_TOTAL.Value:=(DM.TOrcTempVL_UNIT.Value * DM.TOrcTempQTDE.Value);
                   DM.TOrcTemp.Post;

                   DM.TOrcTemp.Next;
                   end;

             AtualizaTotais;

             DM.TOrcTemp.EnableControls;
             end;
       end;
end;

procedure TFClassificaPreco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_Escape
     then Close;
end;

end.
