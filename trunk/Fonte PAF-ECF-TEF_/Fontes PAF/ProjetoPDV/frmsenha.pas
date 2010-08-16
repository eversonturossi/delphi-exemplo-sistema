unit frmsenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, DBCtrls, Mask, RxToolEdit, RxCurrEdit, jpeg,
  RXCtrls, FMTBcd, SqlExpr;

type
  Tfsenha = class(TForm)
    Panel1: TPanel;
    btn_ok: TBitBtn;
    btn_cancelar: TBitBtn;
    nome_usuario: TRxLabel;
    nome_loja: TRxLabel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    data_sistema: TDateEdit;
    txt_senha: TEdit;
    id_usuario: TCurrencyEdit;
    ImageON: TImage;
    ImageOF: TImage;
    procedure txt_idKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_cancelarClick(Sender: TObject);
    procedure id_usuarioKeyPress(Sender: TObject; var Key: Char);
    procedure txt_senhaKeyPress(Sender: TObject; var Key: Char);
    procedure btn_okClick(Sender: TObject);
    procedure id_usuarioExit(Sender: TObject);
    procedure txt_senhaExit(Sender: TObject);
    procedure data_sistemaEnter(Sender: TObject);
    procedure data_sistemaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txt_senhaEnter(Sender: TObject);
    procedure id_usuarioEnter(Sender: TObject);
    procedure data_sistemaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fsenha: Tfsenha;

implementation

uses dmsyndAC, lite_frmprincipal, UPAF_ECF, frmpesquisacliente,
     u_inicializacao, UBarsa, UConfigBD;

{$R *.DFM}

procedure Tfsenha.txt_idKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   begin
      key:=#0;
      perform(wm_nextdlgctl,0,0);
   end;
end;

procedure Tfsenha.FormShow(Sender: TObject);
begin
   Screen.Cursor:=crDefault;

   if ServidorRemoto='OF'
   then ImageOF.Visible:=True
   else if ServidorRemoto='ON'
   then ImageON.Visible:=True;

   DM.TEmpresa.Open;
   Try
     DM.TUsuario.Open;
   except
     Avisando('A Conexão de sua rede com o servidor remoto esta ativa, porém não foi '+
              'possivél encontrar o banco de dados central. Verifique o diretório e '+
              'numero de IP se estão corretos!!!');
     Try
        if FConfigBD=Nil
        then Application.CreateForm(TFConfigBD,FConfigBD);
        FConfigBD.ShowModal;
     Finally
        FConfigBD.Release;
        FConfigBD:=nil;
        end;
     Application.Terminate;
     end;

   id_usuario.value:=0;
   txt_senha.text:='';
   data_sistema.Text:=datetostr(date);
   fsenha.id_usuario.setfocus;
end;

procedure Tfsenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action:=cafree;
end;

procedure Tfsenha.btn_cancelarClick(Sender: TObject);
begin
   acessook:=false;
   application.Terminate;
end;

procedure Tfsenha.id_usuarioKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(wm_nextdlgctl,0,0);
   end;
end;

procedure Tfsenha.txt_senhaKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(wm_nextdlgctl,0,0);
   end;

end;

procedure Tfsenha.btn_okClick(Sender: TObject);
begin
     if not vSuporte
     then begin
          n_usuario         :=DM.TUsuarioID.Value;
          s_usuario         :=DM.TUsuarioNOME.value;
          n_vinculo_vendedor:=DM.TUsuarioVINCULADO_AO_VENDEDOR.Value;
          end
     else begin
          n_usuario     :=999;
          s_usuario     :='SUPORTE TÉCNICO';
          end;

   s_empresa     :=DM.TEmpresaNOME_FANTASIA.value;
   s_razaoSocial :=DM.TEmpresaRAZAO_SOCIAL.value;
   s_ImpFiscal   :=sCrypt_ModeloECF;

   if not DM.TEmpresa.IsEmpty
   then begin
        DM.TEmpresa.Edit;
        DM.TEmpresaDATA.Value:=(strtodate(data_sistema.Text));
        DM.TEmpresa.Post;
        DM.TEmpresa.ApplyUpdates(0);
        DM.TEmpresa.Refresh;
        end;

   // Define os niveis de acesso dos menus
   if not vSuporte
   then begin
        if DM.TUsuarioCHK_CADASTRO.Value=1 then
           frmprincipal.MN_CADASTRO.Visible:=true
        else
           frmprincipal.MN_CADASTRO.Visible:=false;

        if DM.TUsuarioCHK_PARAMETROS.Value=1 then
           frmprincipal.MN_PARAMETROS.visible:=true
        else
           frmprincipal.MN_PARAMETROS.visible:=false;

        if DM.TUsuarioCHK_GRUPOS.Value=1 then
           frmprincipal.MN_GRUPOS.visible:=true
        else
           frmprincipal.MN_GRUPOS.visible:=false;

        if DM.TUsuarioCHK_UNIDADES.Value=1 then
           frmprincipal.MN_UNIDADES.visible:=true
        else
           frmprincipal.MN_UNIDADES.visible:=false;

        if DM.TUsuarioCHK_MARCAS.Value=1 then
           frmprincipal.MN_MARCAS.visible:=true
        else
           frmprincipal.MN_MARCAS.visible:=false;

        if DM.TUsuarioCHK_SECAO.Value=1 then
           frmprincipal.MN_SECAO.visible:=true
        else
           frmprincipal.MN_SECAO.visible:=false;

        if DM.TUsuarioCHK_PRODUTOS.Value=1 then
           frmprincipal.MN_PRODUTOS.visible:=true
        else
           frmprincipal.MN_PRODUTOS.visible:=false;

        if DM.TUsuarioCHK_VENDAS.Value=1 then
           frmprincipal.MN_VENDAS.visible:=true
        else
           frmprincipal.MN_VENDAS.visible:=false;

        if DM.TUsuarioCHK_VENDA_CHECKOUT.Value=1 then
           frmprincipal.MN_VENDA_CHECKOUT.visible:=true
        else
           frmprincipal.MN_VENDA_CHECKOUT.visible:=false;

        if DM.TUsuarioCHK_CONFIGURACOES.Value=1 then
           frmprincipal.MN_CONFIGURACOES.visible:=true
        else
           frmprincipal.MN_CONFIGURACOES.visible:=false;

        if DM.TUsuarioCHK_CONFIG_ECF.Value=1 then
           frmprincipal.MN_CONFIG_ECF.visible:=true
        else
           frmprincipal.MN_CONFIG_ECF.visible:=false;

        if DM.TUsuarioCHK_USUARIOS.Value=1 then
           frmprincipal.MN_USUARIOS.visible:=true
        else frmprincipal.MN_USUARIOS.visible:=false;

        if DM.TUsuarioCHK_FORMAPGTO.Value=1 then
           frmprincipal.MN_FORMAPGTO.visible:=true
        else frmprincipal.MN_FORMAPGTO.visible:=false;

        //FrmPrincipal.MN_CONFIGURACOES.Visible:=False;
        //FrmPrincipal.MN_CADASTRO.Visible:=False;
        end
   else begin
        FrmPrincipal.MN_CONFIGURACOES.Visible:=True;
        FrmPrincipal.MN_CADASTRO.Visible:=True;
        end;

   FrmPrincipal.TVerifUltimaReducao.Enabled:=True;

   Acessook:=true;
   close;
end;

procedure Tfsenha.id_usuarioExit(Sender: TObject);
var
   id_Suporte : Integer;
begin
      if (Sender is TCurrencyEdit) then
      TCurrencyEdit(Sender).Color:=clWhite;

      id_Suporte:=999;//999;//Suporte Técnico
      if id_Usuario.value<>id_Suporte
      then begin
            if not DM.TUsuario.Locate('ID',id_Usuario.Value,[])
            then begin
                 Informa('Identificação Inválida!');
                 id_Usuario.SetFocus;
                 end
            else Nome_Usuario.Caption:=DM.TUsuarioNome.Value;
            end
      else Nome_Usuario.Caption:='SUPORTE TÉCNICO';
end;

procedure Tfsenha.txt_senhaExit(Sender: TObject);
var
   vSenha : String;
begin
   if (Sender is TEdit) then
   TEdit(Sender).Color:=clWhite;

   vSuporte:=False;
   vSenha:='922591';
   if vSenha<>txt_senha.Text
   then begin
         With DM.QUsuario
         do begin
            Close;
            Sql.Clear;
            if ServidorRemoto='OF'
            then Sql.Add('SELECT * FROM USUARIOS')
            else Sql.Add('SELECT * FROM USUARIOS_PDV');
            Sql.Add('WHERE SENHA=:PSENHA');
            ParamByName('PSENHA').AsString:=txt_senha.Text;
            Sql.Add('AND ID=:PID');
            ParamByName('PID').AsInteger:=StrToInt(id_usuario.text);
            Open;
            end;
         if (DM.QUsuario.IsEmpty)
         then begin
              Informa('Senha Inválida!');
              id_usuario.Value:=0;
              nome_usuario.Caption:='';
              txt_senha.Text:='';
              id_usuario.setfocus;
              end
         else data_sistema.SetFocus;
         end
   else begin
        vSuporte:=True;
        data_sistema.SetFocus;
        end;
end;

procedure Tfsenha.data_sistemaEnter(Sender: TObject);
begin
     if (Sender is TDateEdit) then
     TDateEdit(Sender).Color:=$0080FFFF;
     btn_ok.Enabled:=true;
end;

procedure Tfsenha.data_sistemaKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#13
     then btn_okClick(Sender);
end;

procedure Tfsenha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key=VK_Escape)
     then fsenha.btn_cancelarClick(Sender);
end;

procedure Tfsenha.txt_senhaEnter(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=$0080FFFF;
end;

procedure Tfsenha.id_usuarioEnter(Sender: TObject);
begin
     if (Sender is TCurrencyEdit) then
     TCurrencyEdit(Sender).Color:=$0080FFFF;
end;

procedure Tfsenha.data_sistemaExit(Sender: TObject);
begin
     if (Sender is TDateEdit) then
     TDateEdit(Sender).Color:=clWhite;
end;

end.

