unit frmcadusuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, DBCtrls, ComCtrls, DB, Buttons, DBTables,
  Grids, DBGrids, RXCtrls, RXToolEdit, RxCurrEdit;

type
  Tfcadusuarios = class(TForm)
    btn_salvar: TBitBtn;
    btn_sair: TBitBtn;
    aba1: TPageControl;
    TabSheet1: TTabSheet;
    Label20: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    GroupBox6: TGroupBox;
    DBEdit9: TDBEdit;
    chk_parametros: TCheckBox;
    chk_venda_checkout: TCheckBox;
    chk_configuracoes: TCheckBox;
    chk_config_ecf: TCheckBox;
    chk_config_tef: TCheckBox;
    chk_usuarios: TCheckBox;
    chk_vendas: TCheckBox;
    chk_cadastro: TCheckBox;
    chk_grupos: TCheckBox;
    chk_unidades: TCheckBox;
    chk_marcas: TCheckBox;
    chk_clientes: TCheckBox;
    chk_secao: TCheckBox;
    chk_produtos: TCheckBox;
    Chk_AlteraEstoque: TCheckBox;
    dsUsuario: TDataSource;
    EID: TEdit;
    ENome: TEdit;
    ESenha: TEdit;
    Label2: TLabel;
    LStatus: TRxLabel;
    Chk_FormaPgto: TCheckBox;
    CheckBox1: TCheckBox;
    pe_altera_msg_promocional: TCheckBox;
    pe_abre_gaveta: TCheckBox;
    pe_suprimento_sangria: TCheckBox;
    pe_cancela_cupom: TCheckBox;
    pe_cancela_item: TCheckBox;
    pe_reducao_z: TCheckBox;
    pe_leitura_x: TCheckBox;
    PE_CONFIG_DIVERSAS: TCheckBox;
    PE_CAD_PRODUTO: TCheckBox;
    PE_ALTERA_ESTOQUE: TCheckBox;
    PE_LIBERA_ATRASO: TCheckBox;
    PE_LIBERA_LIMITE: TCheckBox;
    PE_LIBERA_INAD: TCheckBox;
    CheckBox2: TCheckBox;
    PE_Libera_Desconto: TCheckBox;
    EPercDesc: TCurrencyEdit;
    CMarca_Todos: TCheckBox;
    CHK_AlteraCliente: TCheckBox;
    PE_Libera_Desc_Minimo: TCheckBox;
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_salvarClick(Sender: TObject);
    procedure EIDEnter(Sender: TObject);
    procedure EIDExit(Sender: TObject);
    procedure EIDKeyPress(Sender: TObject; var Key: Char);
    procedure EPercDescEnter(Sender: TObject);
    procedure EPercDescExit(Sender: TObject);
    procedure PE_Libera_DescontoClick(Sender: TObject);
    procedure CMarca_TodosClick(Sender: TObject);
  private
    { Private declarations }
    procedure le_permissoes;
    procedure limpa_campos;
    procedure seta_permissoes;
  public
    { Public declarations }
  end;

var
  fcadusuarios: Tfcadusuarios;
  sGrupo, sID: string;

implementation

uses dmsyndAC, UPAF_ECF, UBarsa, lite_frmprincipal;

{$R *.dfm}

procedure Tfcadusuarios.btn_sairClick(Sender: TObject);
begin
    close;
end;

procedure Tfcadusuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     DM.TUsuario.Close;
end;

procedure Tfcadusuarios.FormShow(Sender: TObject);
begin
     DM.TUsuario.Open;
     LStatus.Caption:='';
     Limpa_Campos;
     EID.SetFocus;
end;

procedure Tfcadusuarios.limpa_campos;
begin
    EID.Clear;
    ENome.Clear;
    ESenha.Clear;
       
    CHK_CADASTRO.Checked :=false;
    CHK_PARAMETROS.Checked :=false;
    CHK_GRUPOS.Checked :=false;
    CHK_UNIDADES.Checked :=false;
    CHK_MARCAS.Checked :=false;
    CHK_CLIENTES.Checked :=false;
    CHK_SECAO.Checked :=false;
    CHK_PRODUTOS.Checked :=false;
    CHK_VENDAS.Checked :=false;
    CHK_VENDA_CHECKOUT.Checked :=false;
    CHK_CONFIGURACOES.Checked :=false;
    CHK_CONFIG_ECF.Checked :=false;
    CHK_CONFIG_TEF.Checked :=false;
    CHK_USUARIOS.Checked :=false;
    CHK_ALTERAESTOQUE.Checked :=false;
    CHK_ALTERACLIENTE.Checked :=false;
    CHK_FORMAPGTO.Checked :=false;
    PE_ALTERA_MSG_PROMOCIONAL.Checked :=false;
    PE_ABRE_GAVETA.Checked :=false;
    PE_SUPRIMENTO_SANGRIA.Checked :=false;
    PE_CANCELA_CUPOM.Checked :=false;
    PE_CANCELA_ITEM.Checked :=false;
    PE_REDUCAO_Z.Checked :=false;
    PE_LEITURA_X.Checked :=false;
    PE_LIBERA_DESCONTO.Checked:=False;
    PE_LIBERA_DESC_MINIMO.Checked:=False;
    EPercDesc.Value:=0;

end;

procedure Tfcadusuarios.seta_permissoes;
begin
   if CHK_ALTERAESTOQUE.Checked then
      DM.TUsuario.FieldByName('PE_ALTERA_ESTOQUE').AsInteger :=1
   else
      DM.TUsuario.FieldByName('PE_ALTERA_ESTOQUE').AsInteger :=0;

   if CHK_ALTERACLIENTE.Checked then
      DM.TUsuario.FieldByName('PE_ALTERA_CLIENTE').AsInteger :=1
   else
      DM.TUsuario.FieldByName('PE_ALTERA_CLIENTE').AsInteger :=0;

   if CHK_CADASTRO.Checked then
      DM.TUsuario.FieldByName('CHK_CADASTRO').AsInteger :=1
   else
      DM.TUsuario.FieldByName('CHK_CADASTRO').AsInteger :=0;

   if CHK_PARAMETROS.Checked then
      DM.TUsuario.FieldByName('CHK_PARAMETROS').AsInteger :=1
   else
      DM.TUsuario.FieldByName('CHK_PARAMETROS').AsInteger :=0;

   if CHK_GRUPOS.Checked then
      DM.TUsuario.FieldByName('CHK_GRUPOS').AsInteger :=1
   else
      DM.TUsuario.FieldByName('CHK_GRUPOS').AsInteger :=0;

   if CHK_UNIDADES.Checked then
      DM.TUsuario.FieldByName('CHK_UNIDADES').AsInteger :=1
   else
      DM.TUsuario.FieldByName('CHK_UNIDADES').AsInteger :=0;

   if CHK_MARCAS.Checked then
      DM.TUsuario.FieldByName('CHK_MARCAS').AsInteger :=1
   else
      DM.TUsuario.FieldByName('CHK_MARCAS').AsInteger :=0;

   if CHK_CLIENTES.Checked then
      DM.TUsuario.FieldByName('CHK_CLIENTES').AsInteger :=1
   else
      DM.TUsuario.FieldByName('CHK_CLIENTES').AsInteger :=0;

   if CHK_SECAO.Checked then
      DM.TUsuario.FieldByName('CHK_SECAO').AsInteger :=1
   else
      DM.TUsuario.FieldByName('CHK_SECAO').AsInteger :=0;

   if CHK_PRODUTOS.Checked then
      DM.TUsuario.FieldByName('CHK_PRODUTOS').AsInteger :=1
   else
      DM.TUsuario.FieldByName('CHK_PRODUTOS').AsInteger :=0;

   if CHK_VENDA_CHECKOUT.Checked then
      DM.TUsuario.FieldByName('CHK_VENDA_CHECKOUT').AsInteger :=1
   else
      DM.TUsuario.FieldByName('CHK_VENDA_CHECKOUT').AsInteger :=0;

   if CHK_VENDAS.Checked then
      DM.TUsuario.FieldByName('CHK_VENDAS').AsInteger :=1
   else
      DM.TUsuario.FieldByName('CHK_VENDAS').AsInteger :=0;

   if CHK_CONFIGURACOES.Checked then
      DM.TUsuario.FieldByName('CHK_CONFIGURACOES').AsInteger :=1
   else
      DM.TUsuario.FieldByName('CHK_CONFIGURACOES').AsInteger :=0;

   if CHK_CONFIG_ECF.Checked then
      DM.TUsuario.FieldByName('CHK_CONFIG_ECF').AsInteger :=1
   else
      DM.TUsuario.FieldByName('CHK_CONFIG_ECF').AsInteger :=0;

   if CHK_CONFIG_TEF.Checked then
      DM.TUsuario.FieldByName('CHK_CONFIG_TEF').AsInteger :=1
   else
      DM.TUsuario.FieldByName('CHK_CONFIG_TEF').AsInteger :=0;

   if CHK_USUARIOS.Checked then
      DM.TUsuario.FieldByName('CHK_USUARIOS').AsInteger :=1
   else
      DM.TUsuario.FieldByName('CHK_USUARIOS').AsInteger :=0;

    if CHK_FORMAPGTO.Checked then
      DM.TUsuario.FieldByName('CHK_FORMAPGTO').AsInteger :=1
   else
      DM.TUsuario.FieldByName('CHK_FORMAPGTO').AsInteger :=0;

    if PE_ALTERA_MSG_PROMOCIONAL.Checked then
       DM.TUsuario.FieldByName('PE_ALTERA_MSG_PROMOCIONAL').AsInteger :=1
    else
       DM.TUsuario.FieldByName('PE_ALTERA_MSG_PROMOCIONAL').AsInteger :=0;

    if PE_ABRE_GAVETA.Checked then
       DM.TUsuario.FieldByName('PE_ABRE_GAVETA').AsInteger :=1
    else
       DM.TUsuario.FieldByName('PE_ABRE_GAVETA').AsInteger :=0;

    if PE_SUPRIMENTO_SANGRIA.Checked then
       DM.TUsuario.FieldByName('PE_SUPRIMENTO_SANGRIA').AsInteger :=1
    else
       DM.TUsuario.FieldByName('PE_SUPRIMENTO_SANGRIA').AsInteger :=0;

    if PE_CANCELA_CUPOM.Checked then
       DM.TUsuario.FieldByName('PE_CANCELA_CUPOM').AsInteger :=1
    else
       DM.TUsuario.FieldByName('PE_CANCELA_CUPOM').AsInteger :=0;

    if PE_CANCELA_ITEM.Checked then
       DM.TUsuario.FieldByName('PE_CANCELA_ITEM').AsInteger :=1
    else
       DM.TUsuario.FieldByName('PE_CANCELA_ITEM').AsInteger :=0;

    if PE_REDUCAO_Z.Checked then
       DM.TUsuario.FieldByName('PE_REDUCAO_Z').AsInteger :=1
    else
       DM.TUsuario.FieldByName('PE_REDUCAO_Z').AsInteger :=0;

    if PE_LEITURA_X.Checked then
       DM.TUsuario.FieldByName('PE_LEITURA_X').AsInteger :=1
    else
       DM.TUsuario.FieldByName('PE_LEITURA_X').AsInteger :=0;

    if PE_CONFIG_DIVERSAS.Checked then
       DM.TUsuario.FieldByName('PE_CONFIG_DIVERSAS').AsInteger :=1
    else
       DM.TUsuario.FieldByName('PE_CONFIG_DIVERSAS').AsInteger :=0;

    if PE_CAD_PRODUTO.Checked then
       DM.TUsuario.FieldByName('PE_CAD_PRODUTO').AsInteger :=1
    else
       DM.TUsuario.FieldByName('PE_CAD_PRODUTO').AsInteger :=0;

      if PE_LIBERA_ATRASO.Checked then
       DM.TUsuario.FieldByName('PE_LIBERA_VENDA_ATRASO').AsInteger :=1
    else
       DM.TUsuario.FieldByName('PE_LIBERA_VENDA_ATRASO').AsInteger :=0;

    if PE_LIBERA_ATRASO.Checked then
       DM.TUsuario.FieldByName('PE_LIBERA_VENDA_LIMITE_EXC').AsInteger :=1
    else
       DM.TUsuario.FieldByName('PE_LIBERA_VENDA_LIMITE_EXC').AsInteger :=0;

    if PE_LIBERA_INAD.Checked then
       DM.TUsuario.FieldByName('PE_LIBERA_VENDA_INADIMPLENTE').AsInteger :=1
    else
       DM.TUsuario.FieldByName('PE_LIBERA_VENDA_INADIMPLENTE').AsInteger :=0;

    if PE_LIBERA_DESCONTO.Checked then begin
       DM.TUsuario.FieldByName('PE_LIBERA_DESCONTO').AsInteger :=1;
       DM.TUsuario.FieldByName('PE_MAXIMO_DESCONTO').AsFloat :=EPercDesc.Value;
       end
    else begin
       DM.TUsuario.FieldByName('PE_LIBERA_DESCONTO').AsInteger :=0;
       DM.TUsuario.FieldByName('PE_MAXIMO_DESCONTO').AsFloat :=0;
       end;

    if PE_LIBERA_DESC_MINIMO.Checked then
       DM.TUsuario.FieldByName('PE_LIBERA_DESC_MINIMO').AsInteger :=1
    else
       DM.TUsuario.FieldByName('PE_LIBERA_DESC_MINIMO').AsInteger :=0;

end;

procedure Tfcadusuarios.le_permissoes;
begin
   if DM.TUsuario.FieldByName('PE_ALTERA_ESTOQUE').AsInteger=0 then
      CHK_ALTERAESTOQUE.Checked:=false
   else
      CHK_ALTERAESTOQUE.Checked:=true;

   if DM.TUsuario.FieldByName('PE_ALTERA_CLIENTE').AsInteger=0 then
      CHK_ALTERACLIENTE.Checked:=false
   else
      CHK_ALTERACLIENTE.Checked:=true;

   if DM.TUsuario.FieldByName('CHK_CADASTRO').AsInteger=0 then
      CHK_CADASTRO.Checked:=false
   else
      CHK_CADASTRO.Checked:=true;

   if DM.TUsuario.FieldByName('CHK_PARAMETROS').AsInteger=0 then
      CHK_PARAMETROS.Checked:=false
   else
      CHK_PARAMETROS.Checked:=true;

   if DM.TUsuario.FieldByName('CHK_GRUPOS').AsInteger=0 then
      CHK_GRUPOS.Checked:=false
   else
      CHK_GRUPOS.Checked:=true;

   if DM.TUsuario.FieldByName('CHK_UNIDADES').AsInteger=0 then
      CHK_UNIDADES.Checked:=false
   else
      CHK_UNIDADES.Checked:=true;

   if DM.TUsuario.FieldByName('CHK_MARCAS').AsInteger=0 then
      CHK_MARCAS.Checked:=false
   else
      CHK_MARCAS.Checked:=true;

   if DM.TUsuario.FieldByName('CHK_CLIENTES').AsInteger=0 then
      CHK_CLIENTES.Checked:=false
   else
      CHK_CLIENTES.Checked:=true;

   if DM.TUsuario.FieldByName('CHK_SECAO').AsInteger=0 then
      CHK_SECAO.Checked:=false
   else
      CHK_SECAO.Checked:=true;

   if DM.TUsuario.FieldByName('CHK_PRODUTOS').AsInteger=0 then
      CHK_PRODUTOS.Checked:=false
   else
      CHK_PRODUTOS.Checked:=true;

   if DM.TUsuario.FieldByName('CHK_VENDAS').AsInteger=0 then
      CHK_VENDAS.Checked:=false
   else
      CHK_VENDAS.Checked:=true;

   if DM.TUsuario.FieldByName('CHK_VENDA_CHECKOUT').AsInteger=0 then
      CHK_VENDA_CHECKOUT.Checked:=false
   else
      CHK_VENDA_CHECKOUT.Checked:=true;

   if DM.TUsuario.FieldByName('CHK_CONFIGURACOES').AsInteger=0 then
      CHK_CONFIGURACOES.Checked:=false
   else
      CHK_CONFIGURACOES.Checked:=true;

   if DM.TUsuario.FieldByName('CHK_CONFIG_ECF').AsInteger=0 then
      CHK_CONFIG_ECF.Checked:=false
   else
      CHK_CONFIG_ECF.Checked:=true;

   if DM.TUsuario.FieldByName('CHK_CONFIG_TEF').AsInteger=0 then
      CHK_CONFIG_TEF.Checked:=false
   else
      CHK_CONFIG_TEF.Checked:=true;

   if DM.TUsuario.FieldByName('CHK_USUARIOS').AsInteger=0 then
      CHK_USUARIOS.Checked:=false
   else
      CHK_USUARIOS.Checked:=true;

   if DM.TUsuario.FieldByName('CHK_FORMAPGTO').AsInteger=0 then
      CHK_FORMAPGTO.Checked:=false
   else
      CHK_FORMAPGTO.Checked:=true;

   if DM.TUsuario.FieldByName('PE_ALTERA_MSG_PROMOCIONAL').AsInteger=0 then
      PE_ALTERA_MSG_PROMOCIONAL.Checked:=false
   else
      PE_ALTERA_MSG_PROMOCIONAL.Checked:=true;

   if DM.TUsuario.FieldByName('PE_ABRE_GAVETA').AsInteger=0 then
      PE_ABRE_GAVETA.Checked:=false
   else
      PE_ABRE_GAVETA.Checked:=true;

   if DM.TUsuario.FieldByName('PE_SUPRIMENTO_SANGRIA').AsInteger=0 then
      PE_SUPRIMENTO_SANGRIA.Checked:=false
   else
      PE_SUPRIMENTO_SANGRIA.Checked:=true;

   if DM.TUsuario.FieldByName('PE_CANCELA_CUPOM').AsInteger=0 then
      PE_CANCELA_CUPOM.Checked:=false
   else
      PE_CANCELA_CUPOM.Checked:=true;

   if DM.TUsuario.FieldByName('PE_CANCELA_ITEM').AsInteger=0 then
      PE_CANCELA_ITEM.Checked:=false
   else
      PE_CANCELA_ITEM.Checked:=true;

   if DM.TUsuario.FieldByName('PE_REDUCAO_Z').AsInteger=0 then
      PE_REDUCAO_Z.Checked:=false
   else
      PE_REDUCAO_Z.Checked:=true;

   if DM.TUsuario.FieldByName('PE_LEITURA_X').AsInteger=0 then
      PE_LEITURA_X.Checked:=false
   else
      PE_LEITURA_X.Checked:=true;

   if DM.TUsuario.FieldByName('PE_CONFIG_DIVERSAS').AsInteger=0 then
      PE_CONFIG_DIVERSAS.Checked:=false
   else
      PE_CONFIG_DIVERSAS.Checked:=true;

   if DM.TUsuario.FieldByName('PE_CAD_PRODUTO').AsInteger=0 then
      PE_CAD_PRODUTO.Checked:=false
   else
      PE_CAD_PRODUTO.Checked:=true;

   if DM.TUsuario.FieldByName('PE_LIBERA_VENDA_ATRASO').AsInteger=0 then
      PE_LIBERA_ATRASO.Checked:=false
   else
      PE_LIBERA_ATRASO.Checked:=true;

   if DM.TUsuario.FieldByName('PE_LIBERA_VENDA_LIMITE_EXC').AsInteger=0 then
      PE_LIBERA_LIMITE.Checked:=false
   else
      PE_LIBERA_LIMITE.Checked:=true;

   if DM.TUsuario.FieldByName('PE_LIBERA_VENDA_INADIMPLENTE').AsInteger=0 then
      PE_LIBERA_INAD.Checked:=false
   else
      PE_LIBERA_INAD.Checked:=true;

   if DM.TUsuario.FieldByName('PE_LIBERA_DESCONTO').AsInteger=0 then begin
      PE_LIBERA_DESCONTO.Checked:=false;
      EPercDesc.Value:=0;
      end
   else begin
      PE_LIBERA_DESCONTO.Checked:=true;
      EPercDesc.Value:=DM.TUsuario.FieldByName('PE_MAXIMO_DESCONTO').AsFloat;
      end;

   if DM.TUsuario.FieldByName('PE_LIBERA_DESC_MINIMO').AsInteger=0 then
      PE_LIBERA_DESC_MINIMO.Checked:=false
   else
      PE_LIBERA_DESC_MINIMO.Checked:=true;

end;

procedure Tfcadusuarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_F10
     then btn_SalvarClick(Sender);

     if key=VK_Escape
     then btn_SairClick(Sender);
end;

procedure Tfcadusuarios.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FCadUsuarios,key);
end;

procedure Tfcadusuarios.btn_salvarClick(Sender: TObject);
begin
     if ServidorRemoto='OF'
     then begin
           AC;
           if LStatus.Caption='< Alterando >'
           then DM.TUsuario.Edit
           else DM.TUsuario.Append;
           DM.TUsuarioNOME.AsString:=ENome.Text;
           DM.TUsuarioSENHA.AsString:=Trim(ESenha.Text);

           Seta_Permissoes;

           DM.TUsuario.Edit;
           DM.TUsuario.Post;
           DM.TUsuario.ApplyUpdates(-1);

           DM.TUsuario.Refresh;

           if LStatus.Caption='< Incluindo >'
           then Informa(ENome.text+' Sua Identificação de Acesso é: '+StrZero(DM.TUsuarioID.AsInteger,3));
           Close;
           DC;
     end
     else begin
          Informa('O Usuário só pode ser cadastrado através do Sistema de Retaguarda!');
          Close;
          end;
end;

procedure Tfcadusuarios.EIDEnter(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=$0080FFFF;
end;

procedure Tfcadusuarios.EIDExit(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=clWhite;
end;

procedure Tfcadusuarios.EIDKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then begin
          if Trim(EID.Text)<>''
          then begin
               if not DM.TUsuario.Locate('ID',StrToInt(EID.Text),[])
               then begin
                    Informa('Usuário não cadastrado!');
                    EID.SetFocus;
                    end
               else begin
                    LStatus.Caption:='< Alterando >';
                    EID.Text:=StrZero(DM.TUsuarioID.AsInteger,3);
                    ENome.Text:=DM.TUsuarioNOME.AsString;
                    ESenha.Text:=DM.TUsuarioSENHA.AsString;
                    Le_Permissoes;
                    end;
               end
          else if Trim(EID.Text)=''
          then begin
               LStatus.Caption:='< Incluindo >';
               Limpa_Campos;
               end;
          end;
end;

procedure Tfcadusuarios.EPercDescEnter(Sender: TObject);
begin
     if (Sender is TCurrencyEdit) then
     TCurrencyEdit(Sender).Color:=$0080FFFF;
end;

procedure Tfcadusuarios.EPercDescExit(Sender: TObject);
begin
     if (Sender is TCurrencyEdit) then
     TCurrencyEdit(Sender).Color:=clWhite;
end;

procedure Tfcadusuarios.PE_Libera_DescontoClick(Sender: TObject);
begin
     if PE_Libera_Desconto.Checked
     then EPercDesc.Visible:=True
     else EPercDesc.Visible:=False;
end;

procedure Tfcadusuarios.CMarca_TodosClick(Sender: TObject);
begin
     if CMarca_Todos.Checked
     then MarcaChecked(FCadUsuarios)
     else LimpaChecked(FCadUsuarios);
end;

end.

