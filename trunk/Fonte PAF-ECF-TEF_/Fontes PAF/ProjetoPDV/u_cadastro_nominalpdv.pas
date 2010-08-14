unit u_cadastro_nominalpdv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  Tf_cadastro_nominalPDV = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Ed_nome: TEdit;
    Ed_endereco: TEdit;
    Bevel1: TBevel;
    btn_ok: TBitBtn;
    Ed_cpf_cnpj: TMaskEdit;
    lupa_cliente: TSpeedButton;
    Label4: TLabel;
    edRG_IE: TMaskEdit;
    Label5: TLabel;
    edCidade: TEdit;
    Label6: TLabel;
    edUF: TEdit;
    edCep: TEdit;
    Label7: TLabel;
    Image1: TImage;
    LStatus: TLabel;
    procedure Ed_nomeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure Ed_nomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lupa_clienteClick(Sender: TObject);
    procedure Ed_nomeEnter(Sender: TObject);
    procedure Ed_nomeExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edCepEnter(Sender: TObject);
    procedure Ed_cpf_cnpjEnter(Sender: TObject);
  private
    { Private declarations }
    Cod_Cliente : Integer;
    procedure VerifCadCliente(xCodCliente : Integer);
  public
    { Public declarations }
    procedure BuscaDadosCliente(xCodCliente : Integer);
  end;

var
  f_cadastro_nominalPDV: Tf_cadastro_nominalPDV;

implementation

USES UPAF_ECF, dmsyndAC, frmpesquisacliente, u_fechamento_venda_TEF,
     lite_frmprincipal, UBarsa, checkout;

{$R *.dfm}

procedure Tf_cadastro_nominalPDV.VerifCadCliente(xCodCliente : Integer);
begin
     DM.TClientes.Close;
     DM.TClientes.Params[0].AsInteger:=xCodCliente;
     DM.TClientes.Open;
     if DM.TClientes.RecordCount > 0
     then begin
          LStatus.Caption:='< Cliente Cadastrado >';
          LStatus.Font.Color:=clTeal;
          end
     else begin
          LStatus.Caption:='< Cliente não Cadastrado >';
          LStatus.Font.Color:=clRed;
          end;
     DM.TClientes.Close;     
end;


procedure Tf_cadastro_nominalPDV.Ed_nomeChange(Sender: TObject);
begin
     btn_ok.Default:=false;
end;

procedure Tf_cadastro_nominalPDV.FormShow(Sender: TObject);
begin
     Cod_Cliente:=0;
     ed_nome.Clear;
     ed_endereco.Clear;
     Ed_cpf_cnpj.Clear;
     edRG_IE.Clear;
     edCidade.Clear;
     edUF.Clear;
     edCep.Clear;
     LStatus.Caption:='';
     ed_nome.SetFocus;

     if nBuscou_DAV
     then begin
          BuscaDadosCliente(nCodClienteDAV);
          VerifCadCliente(nCodClienteDAV);
          Ed_nome.Text:=sCliente_DAV;
          end; 
end;

procedure Tf_cadastro_nominalPDV.btn_okClick(Sender: TObject);
begin
     if Cod_Cliente > 0
     then ffechamentovenda_tef.vCodCliente:=Cod_Cliente
     else ffechamentovenda_tef.vCodCliente:=StrToInt(FrmPrincipal.Cod_Consumidor);

     S_Nome_Consumidor:=ed_nome.Text;
     S_Endereco       :=ed_endereco.Text;
     S_CPF_ou_CNPJ    :=ed_cpf_cnpj.Text;
     S_RG_IE          :=edRG_IE.Text;
     S_Cidade         :=edCidade.Text;
     S_UF             :=edUF.Text;
     S_Cep            :=edCep.Text; 

     Close;
end;

procedure Tf_cadastro_nominalPDV.Ed_nomeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if key=VK_F5
     then lupa_clienteClick(Sender);
end;

procedure Tf_cadastro_nominalPDV.lupa_clienteClick(Sender: TObject);
begin
     Try
        if FPesquisaCliente=Nil
        then Application.CreateForm(TFPesquisaCliente,FPesquisaCliente);
        FPesquisaCliente.ShowModal;
        if FPesquisaCliente.ModalResult=mrOk
        then BuscaDadosCliente(DM.TPesqClienteCODIGO.AsInteger);
     Finally
        FPesquisaCliente.Release;
        FPesquisaCliente:=nil;
        end;
end;

procedure Tf_cadastro_nominalPDV.BuscaDadosCliente(xCodCliente : Integer);
var
   vCPF_CNPJ : String;
begin
     DM.TClientes.Close;
     DM.TClientes.Params[0].AsInteger:=xCodCliente;
     DM.TClientes.Open;

     Cod_Cliente:=DM.TClientesCODIGO.AsInteger;
     Ed_Nome.Text:=DM.TClientesNOME.AsString;
     Ed_Endereco.Text:=DM.TClientesENDERECO.AsString;
     vCPF_CNPJ:=Trim(SoNumeros(DM.TClientesCPF.AsString));
     if AllTrim(vCPF_CNPJ)<>''
     then begin
          Ed_cpf_cnpj.Text:=DM.TClientesCPF.AsString;
          edRG_IE.Text:=DM.TClientesRG.AsString;
          end
     else begin
          Ed_cpf_cnpj.Text:=DM.TClientesCGC.AsString;
          edRG_IE.Text:=DM.TClientesIE.AsString;
          end;
     edCidade.Text:=DM.TClientesCIDADE.AsString;
     edUF.Text:=DM.TClientesUF.AsString;
     edCep.Text:=DM.TClientesCEP.AsString;

     DM.TClientes.Close;
end;

procedure Tf_cadastro_nominalPDV.Ed_nomeEnter(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=$0080FFFF;
end;

procedure Tf_cadastro_nominalPDV.Ed_nomeExit(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=clWhite;
end;

procedure Tf_cadastro_nominalPDV.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key=VK_Escape
     then Close;
end;

procedure Tf_cadastro_nominalPDV.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
     TabEnter(f_cadastro_nominalPDV,Key);
end;

procedure Tf_cadastro_nominalPDV.edCepEnter(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=$0080FFFF;

     btn_ok.Default:=true;
end;

procedure Tf_cadastro_nominalPDV.Ed_cpf_cnpjEnter(Sender: TObject);
begin
     EntraFocu(Sender);

     if Cod_Cliente > 0
     then VerifCadCliente(Cod_Cliente)
     else begin
          if nBuscou_DAV
          then VerifCadCliente(nCodClienteDAV)
          else VerifCadCliente(StrToInt(FrmPrincipal.Cod_Consumidor));
          end;
end;

end.

