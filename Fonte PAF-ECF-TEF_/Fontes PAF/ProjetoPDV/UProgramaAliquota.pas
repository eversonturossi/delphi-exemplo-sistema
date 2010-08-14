unit UProgramaAliquota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RxToolEdit,RxCurrEdit, ExtCtrls, Buttons;

type
  TFProgramaAliquota = class(TForm)
    RGTipo: TRadioGroup;
    GAliquota: TGroupBox;
    EAliquota: TEdit;
    BtOk: TBitBtn;
    BtSair: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure EAliquotaEnter(Sender: TObject);
    procedure EAliquotaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProgramaAliquota: TFProgramaAliquota;

implementation

uses UBarsa, UPAF_ECF, Math;

{$R *.dfm}

procedure TFProgramaAliquota.EAliquotaEnter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure TFProgramaAliquota.EAliquotaExit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure TFProgramaAliquota.FormShow(Sender: TObject);
begin
     EAliquota.Clear;
     EAliquota.SetFocus;
end;

procedure TFProgramaAliquota.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TFProgramaAliquota.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_Escape
     then Close;
end;

procedure TFProgramaAliquota.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FProgramaAliquota,Key);
end;

procedure TFProgramaAliquota.BtOkClick(Sender: TObject);
var
   Str_Valor_da_Aliquota : String;
   Int_Tipo_da_Aliquota : Integer;
begin
     if Confirma('Tem Certeza que Deseja Programar a Aliquota '+EAliquota.Text+' ?')=mrYes
     then begin
           if Trim(EAliquota.Text)<>''
           then begin
                 Str_Valor_da_Aliquota:=EAliquota.Text;
                 If RGTipo.ItemIndex=0
                 then Int_Tipo_da_Aliquota:=0
                 else Int_Tipo_da_Aliquota:=1;

                 if s_ImpFiscal = 'ECF Daruma'
                 then Retorno_imp_Fiscal := Daruma_FI_ProgramaAliquota( pchar( Str_Valor_da_Aliquota ), Int_Tipo_da_Aliquota )
                 else if s_ImpFiscal = 'ECF Bematech'
                 then Retorno_imp_Fiscal := Bematech_FI_ProgramaAliquota( pchar( Str_Valor_da_Aliquota ), Int_Tipo_da_Aliquota )
                 else if s_ImpFiscal = 'ECF Elgin'
                 then Retorno_imp_Fiscal := Elgin_ProgramaAliquota( pchar( Str_Valor_da_Aliquota ), Int_Tipo_da_Aliquota )
                 else if s_ImpFiscal = 'ECF Sweda'
                 then Retorno_imp_Fiscal := ECF_ProgramaAliquota( pchar( Str_Valor_da_Aliquota ), Int_Tipo_da_Aliquota );

                 if Retorno_imp_Fiscal = 1
                 then begin
                      Informa('Aliquota Programa com sucesso!! Esta aliquota será executada '+
                              'após a ReduçãoZ e antes de uma LeituraX!');
                      end
                 else Informa('Não foi possivél programar a Aliquota!');     

                 Analisa_iRetorno();
                 Retorno_Impressora();
                 DC;
              end
          else begin
               Informa('Informe a Alíquota!');
               EAliquota.SetFocus;
               end;
          end;
end;

end.
