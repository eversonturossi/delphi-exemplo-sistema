unit lite_frmprincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ToolWin, ComCtrls, Menus, jpeg, ExtCtrls, StdCtrls,
  IniFiles, DB, Grids, DBGrids, Mylabel, XPMan, XPMenu, WinXP, AppEvnts;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    MN_CADASTRO: TMenuItem;
    MN_VENDAS: TMenuItem;
    MN_CONFIGURACOES: TMenuItem;
    MN_SAIR: TMenuItem;
    MN_GRUPOS: TMenuItem;
    MN_UNIDADES: TMenuItem;
    MN_SECAO: TMenuItem;
    MN_PRODUTOS: TMenuItem;
    mn_venda_checkout: TMenuItem;
    MN_CONFIG_ECF: TMenuItem;
    MN_PARAMETROS: TMenuItem;
    MN_MARCAS: TMenuItem;
    SB: TStatusBar;
    MN_LOJAS: TMenuItem;
    Image: TImage;
    MN_Fechar: TMenuItem;
    Sobre1: TMenuItem;
    SobreoSistema1: TMenuItem;
    Alquotas1: TMenuItem;
    MN_USUARIOS: TMenuItem;
    BANCODEDADOS1: TMenuItem;
    MN_FORMAPGTO: TMenuItem;
    WinXP1: TWinXP;
    XPMenu1: TXPMenu;
    AdministradorasdeCartes1: TMenuItem;
    ApplicationEvents: TApplicationEvents;
    TPingConexaoRemota: TTimer;
    MenuFiscal1: TMenuItem;
    LX1: TMenuItem;
    MN_ImpFiscal: TMenuItem;
    ConfiguraeseInformaes1: TMenuItem;
    CNIEE2: TMenuItem;
    N1: TMenuItem;
    IdentificaodoPAFECF2: TMenuItem;
    TVerifUltimaReducao: TTimer;
    Contabilista1: TMenuItem;
    Label1: TLabel;
    procedure MN_GRUPOSClick(Sender: TObject);
    procedure MN_UNIDADESClick(Sender: TObject);
    procedure mn_venda_checkoutClick(Sender: TObject);
    procedure MN_PRODUTOSClick(Sender: TObject);
    procedure MN_CONFIG_ECFClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MN_PARAMETROSClick(Sender: TObject);
    procedure MN_MARCASClick(Sender: TObject);
    procedure MN_LOJASClick(Sender: TObject);
    procedure MN_FecharClick(Sender: TObject);
    procedure SobreoSistema1Click(Sender: TObject);
    procedure Alquotas1Click(Sender: TObject);
    procedure MN_USUARIOSClick(Sender: TObject);
    procedure MN_SECAOClick(Sender: TObject);
    procedure BANCODEDADOS1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MN_FORMAPGTOClick(Sender: TObject);
    procedure AdministradorasdeCartes1Click(Sender: TObject);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure FormDestroy(Sender: TObject);
    procedure TPingConexaoRemotaTimer(Sender: TObject);
    procedure LX1Click(Sender: TObject);
    procedure ConfiguraeseInformaes1Click(Sender: TObject);
    procedure CNIEE2Click(Sender: TObject);
    procedure IdentificaodoPAFECF2Click(Sender: TObject);
    procedure TVerifUltimaReducaoTimer(Sender: TObject);
    procedure Contabilista1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    Iniciou_Aplicacao : Boolean;
    procedure VerificaLicenca;
    procedure AbreConexoes;
    procedure ConectaServidorRemoto;
    procedure FechaPortaSerial;
    procedure VerificaServidorRemotoAtivo;
    procedure ClassificaConexaoAtiva;
    Function VerificaConfiguracaoECF:boolean;
    { Private declarations }
  public
    { Public declarations }
    ResolucaoPadrao : Boolean;
    vResgistroSerieHD, vSerialDesteHD, PDVLocal, Dir_PapelParede, Dir_PDV, Ler_Campo_Balanca,
    Mensagem,Espaco_Entre_Linhas,vDiretorio,Tela_PDV_Padrao, Padrao_Busca, Padrao_Preco,
    BaixaEstoque,Vende_Estoque_Neg,Busca_Pre_Venda,Gaveta,Cod_Consumidor, Depende_Retaguarda, Grava_Retaguarda,
    Reg_Clientes,Reg_Estoque,Ler_CodProduto_Pos_I,Ler_CodProduto_Pos_F,Ler_Valor_Pos_I,Ler_Valor_Pos_F,
    Auto_Pesq_Clientes, Auto_Pesq_Produtos, Busca_Contenha_Cli, Busca_Contenha_Prod, Tef_Utilizado,
    Gerenciador_Padrao, Ping_Servidor, Usa_Grade, Verifica_ReducaoZ_Pendente : String;

    //Monitor PDV
    Delay_Conexao_Remota,Delay_Atualiz_Recebido,Delay_Atualiz_Enviados,Delay_Atualiz_Deletados,
    Ativa_loq_Erro : String;

    procedure VerificaPermissaoUsuario(xOpcao : String);
    procedure Ler_Configuracao(Var IP_Local: String; Var IP_Remoto: String; Var Url_Local: String; Var URL_Remoto: String; Var PDV: String);
    procedure Gravar_Configuracao(IP_Local, Url_Local, IP_Remoto, Url_Remoto, PDV : String);
    procedure ChamaLiberacaoECF( RecomporGT : Boolean );
  end;

var
  FrmPrincipal: TFrmPrincipal;
  vSuporte : Boolean;
  nData_Impressora, nData_PC : TDate;
  nHora_Impressora, nHora_PC : TDateTime;
  IP_Local,IP_Remoto,URL_Local,URL_Remoto, PDV, ServidorRemoto : String;
  Function AbrePortaSerial:Boolean;
  procedure VerificaDataHoraImpressora;
  procedure PegaDataHoraServidor;

implementation

uses Checkout, UPAF_ECF, frmconfigimpfisc, frmsenha, frmcadempresa, dmsyndAC,
     frmcadcliente, USobre, UAcesso, UCadUnidades, frmprodutos1,
     UCadMarca, UCadGrupos, frmconsultaaliquotas, frmcadusuarios, UBarsa,
     USecao, UConfigBD, USenhaLibera, UFormaPgto, UAdm_Cartoes, SqlExpr,
     Math, UMsgServidor, UMenuFiscal, DateUtils, URegistroPAF, UCNIEE,
     UConfigECF, ULiberaECF, UContabilista;

{$R *.dfm}

procedure PegaDataHoraServidor;
begin
    DM.QPegaDataHora.Close;
    DM.QPegaDataHora.Open;
end;

procedure TFrmPrincipal.ChamaLiberacaoECF( RecomporGT : Boolean );
begin
    Try
      if FLiberaECF=Nil
      then Application.CreateForm(TFLiberaECF, FLiberaECF);
      FLiberaECF.Recompor_GrandeTotal:=RecomporGT;
      FLiberaECF.ShowModal;
      FLiberaECF.Recompor_GrandeTotal:=False;
    Finally
      FLiberaECF.Release;
      FLiberaECF:=Nil;
      end;
end;

Function TFrmPrincipal.VerificaConfiguracaoECF:boolean;
begin
     Result:=False;

     AC1;

     SB.Panels[3].Text:='Abrindo a Porta Serial...';
     Repaint;

     if s_ImpFiscal='ECF Daruma'
     then retorno_imp_fiscal := Daruma_FI_VerificaImpressoraLigada()
     else if s_ImpFiscal='ECF Bematech'
     then retorno_imp_fiscal := Bematech_FI_VerificaImpressoraLigada()
     else if s_ImpFiscal='ECF Elgin'
     then retorno_imp_fiscal := Elgin_VerificaImpressoraLigada()
     else if s_ImpFiscal='ECF Sweda'
     then retorno_imp_fiscal := ECF_VerificaImpressoraLigada();

     if retorno_imp_fiscal = 1 // Impressora Ligada
     then begin
          if AbrePortaSerial()
          then begin
               SB.Panels[3].Text:='Verificando Data Hora do ECF...';
               Repaint;

               VerificaDataHoraImpressora;

               end;
          Result:=True;
          end
     else begin
          DC;
          Result:=False;
          Informa('A Impressora esta Desligada! Por Favor Verifique.');
          end;

     SB.Panels[3].Text:='';
     Repaint;

     {Colocar uma verificação do CNPJ que esta cadastrado na impressora
      com o cnpj no cadastro do sistema}
end;

procedure VerificaDataHoraImpressora;
var
   iConta, iHECF, iHPC, iCompara : Integer;
   sComparaHoraECF, sComparaHoraPC : String;
   sData, sHora, nDia, nMes, nAno, nHora, nMin, nSeg : String;
begin
     if s_ImpFiscal = 'ECF Bematech'
     then begin
           for iConta := 1 to 6 do sData := sData + ' ';
           for iConta := 1 to 6 do  sHora := sHora + ' ';
           Retorno_imp_Fiscal := Bematech_FI_DataHoraImpressora( sData, sHora );
           end
     else if s_ImpFiscal = 'ECF Daruma'
     then begin
          SetLength (sData,6); SetLength (sHora,6);
          Retorno_imp_Fiscal := Daruma_FI_DataHoraImpressora( sData, sHora );
          end
     else if s_ImpFiscal = 'ECF Elgin'
     then begin
          sData := StringOfChar(' ',10); sHora := StringOfChar(' ',10);
          Retorno_imp_Fiscal := Elgin_DataHoraImpressora( sData, sHora );
          end
     else if s_ImpFiscal = 'ECF Sweda'
     then begin
          SetLength (sData,6); SetLength (sHora,6);
          Retorno_imp_Fiscal := ECF_DataHoraImpressora( Pchar(sData), Pchar(sHora) );
          end;

     if Retorno_imp_Fiscal = 1
     then begin
          nData_PC:=Date();
          nHora_PC:=Time();
          sComparaHoraPC:=TimeToStr(nHora_PC);
          sComparaHoraPC:=FormatDateTime('HHMM',StrToTime(sComparaHoraPC));

          nDia:=Copy(sData,1,2);
          nMes:=Copy(sData,3,2);
          nAno:=Pchar(Copy(sData,5,4));
          nData_Impressora:=StrToDate(nDia+'/'+nMes+'/'+nAno);

          nHora:=Copy(sHora,1,2);
          nMin:=Copy(sHora,3,2);
          nSeg:=Copy(sHora,5,2);
          nHora_Impressora:=StrToTime(nHora+':'+nMin+':'+nSeg);
          sComparaHoraECF:=TimeToStr(nHora_Impressora);
          sComparaHoraECF:=FormatDateTime('HHMM',StrToTime(sComparaHoraECF));

          if (nData_Impressora <> nData_PC)
          then begin
               Dc;
               Informa('A Data do seu ECF não coincide com a Data do Computador!'+#13+
                       'Data do ECF.......: '+DateToStr(nData_Impressora)+#13+
                       'Data do Computador: '+DateToStr(nData_PC)+#13+#13+
                       'Contate o suporte técnico para fazer o ajuste necessário!');
               Application.Terminate;
               end;

          if (sComparaHoraECF <> sComparaHoraPC)
          then begin
               DC;
               iHECF:=StrToInt(sComparaHoraECF);
               iHPC:=StrToInt(sComparaHoraPC);
               iCompara:=ABS(iHECF - iHPC);

               if iCompara > 15 //Maior que 15 minutos
               then begin
                     Informa('A Hora do seu ECF não coincide com a Hora do Computador!'+#13+
                             'Hora do ECF..........: '+TimeToStr(nHora_Impressora)+#13+
                             'Hora do Computador: '+TimeToStr(nHora_PC)+#13+#13+
                             'Contate o suporte técnico para fazer o ajuste necessário!');

                     Application.Terminate;
                    end; 
               end;
          end
     else Informa('Não foi possivél Identificar a data e hora da Impressora! Verifique '+
                  'se o mesmo se encontra Ligada, ou corretamente conectada ao computador!');
end;

Function AbrePortaSerial:Boolean;
begin
     if s_ImpFiscal = 'ECF Bematech'
     then Retorno_imp_Fiscal := Bematech_FI_AbrePortaSerial()
     else if s_ImpFiscal = 'ECF Daruma'
     then Retorno_imp_Fiscal := Daruma_FI_AbrePortaSerial()
     else if s_ImpFiscal = 'ECF Elgin'
     then Retorno_imp_Fiscal := Elgin_AbrePortaSerial()
     else if s_ImpFiscal = 'ECF Sweda'
     then Retorno_imp_Fiscal := ECF_AbrePortaSerial();

     if Retorno_imp_Fiscal = 1
     then Result:=True
     else begin
          Informa('Não foi Possivél abrir a Porta Serial!');
          Result:=False;
          end;
end;

procedure TFrmPrincipal.FechaPortaSerial;
begin
     if s_ImpFiscal = 'ECF Bematech'
     then Retorno_imp_Fiscal := Bematech_FI_FechaPortaSerial()
     else if s_ImpFiscal = 'ECF Daruma'
     then Retorno_imp_Fiscal := Daruma_FI_FechaPortaSerial()
     else if s_ImpFiscal = 'ECF Elgin'
     then Retorno_imp_Fiscal := Elgin_FechaPortaSerial()
     else if s_ImpFiscal = 'ECF Sweda'
     then Retorno_imp_Fiscal := ECF_FechaPortaSerial();
end;

procedure TFrmPrincipal.VerificaPermissaoUsuario(xOpcao : String);
begin
       vLiberado:=False;
       With DM.QUsuario
       do begin
          Close;
          Sql.Clear;
          if ServidorRemoto='OF'
          then Sql.Add('SELECT * FROM USUARIOS')
          else Sql.Add('SELECT * FROM USUARIOS_PDV');
          Sql.Add('WHERE ID=:PID');
          ParamByName('PID').AsInteger:=n_usuario;
          Open;
          end;

          if DM.QUsuario.FieldByName(xOpcao).AsInteger=0
          then begin
               if Confirma('USUÁRIO SEM PERMISSÃO PARA REALIZAR ESTA OPERAÇÃO!'+#13+#13+
                           'DESEJA QUE UM USUÁRIO AUTORIZADO FAÇA A LIBERAÇÃO?')=mrYes
               then begin
                    Try
                       if FSenhaLibera=Nil
                       then Application.CreateForm(TFSenhaLibera,FSenhaLibera);
                       FSenhaLibera.vOpcao:=xOpcao;
                       FSenhaLibera.ShowModal;
                    Finally
                       FSenhaLibera.Release;
                       FSenhaLibera:=Nil;
                       end;
                    end
                   else begin
                        vLiberado:=False;
                        Informa('USUÁRIO SEM PERMISSÃO PARA REALIZAR ESTA OPERAÇÃO!');
                        end;
               end
          else vLiberado:=True;
end;


procedure TFrmPrincipal.Ler_Configuracao(Var IP_Local: String; Var IP_Remoto: String; Var Url_Local: String;
                           Var URL_Remoto: String; Var PDV: String);
var
   Banco : TIniFile;
begin
  Try
    Banco := TIniFile.create(GetCurrentDir+'\database.ini');
    IP_Local    := Banco.ReadString('LOCAL','IP',IP_Local);
    URL_Local   := Banco.ReadString('LOCAL','URL',URL_Local);
    PDV         := Banco.ReadString('LOCAL','PDV',PDV);
    IP_Remoto   := Banco.ReadString('REMOTO','IP',IP_Remoto);
    URL_Remoto  := Banco.ReadString('REMOTO','URL',URL_Remoto);
  Finally
    Banco.Free;
  end;
end;

//Url: caminho do banco
procedure TFrmPrincipal.Gravar_Configuracao(IP_Local, Url_Local, IP_Remoto, Url_Remoto, PDV : String);
var
   Banco : TIniFile;
Begin
  Try
    SetCurrentDir(ExtractFilePath(Application.ExeName));
    Banco := TIniFile.create(GetCurrentDir + '\database.ini');
    Banco.WriteString('LOCAL','IP',IP_Local);
    Banco.WriteString('LOCAL','URL',Url_Local);
    Banco.WriteString('LOCAL','PDV',PDV);
    Banco.WriteString('REMOTO','IP',IP_Remoto);
    Banco.WriteString('REMOTO','URL',Url_Remoto);
  Finally
    Banco.Free;
  end;
end;

procedure TFrmPrincipal.ConectaServidorRemoto;
begin
     if ServidorRemoto='ON'
     then begin
          if DM.SQLConnectionRetaguarda.Connected=False
          then begin
               Try
                 DM.SQLConnectionRetaguarda.Connected:=False;
                 DM.SQLConnectionRetaguarda.Params.Values['Database']:=IP_Remoto+'/3050'+':'+Url_Remoto;
                 DM.SQLConnectionRetaguarda.Connected:=True;
                 DM.FecharTodasSqlQuery;
                 ClassificaConexaoAtiva;
               Except
                 ServidorRemoto:='OF';
                 SB.Panels[4].Text:='OffLine';
                 Application.ProcessMessages;
                 end;
               end;
          end;
     if ServidorRemoto='OF'
     then begin
          if DM.SQLConnectionRetaguarda.Connected
          then begin
               DM.SQLConnectionRetaguarda.Connected:=False;
               DM.FecharTodasSqlQuery;
               ClassificaConexaoAtiva;
               end;
          end;
end;

procedure TFrmPrincipal.ClassificaConexaoAtiva;
begin
   if ServidorRemoto='ON'
   then begin
        DM.QGrupos.SQLConnection:=DM.SQLConnectionRetaguarda;
        DM.QMarca.SQLConnection:=DM.SQLConnectionRetaguarda;
        DM.QSecao.SQLConnection:=DM.SQLConnectionRetaguarda;
        DM.QPesquisa.SQLConnection:=DM.SQLConnectionRetaguarda;
        DM.QProduto.SQLConnection:=DM.SQLConnectionRetaguarda;
        vTabelaProduto:=DM.TProduto;
        DM.QClientes.SQLConnection:=DM.SQLConnectionRetaguarda;
        DM.QTributacao.SQLConnection:=DM.SQLConnectionRetaguarda;
        DM.QPesqProduto.SQLConnection:=DM.SQLConnectionRetaguarda;
        DM.QPesqCliente.SQLConnection:=DM.SQLConnectionRetaguarda;
        DM.QUsuario.SQLConnection:=DM.SQLConnectionRetaguarda;
        DM.QPesqGradeProd.SQLConnection:=DM.SQLConnectionRetaguarda;
        With DM.QUsuario
        do begin
           Close;
           Sql.Clear;
           Sql.Add('SELECT * FROM USUARIOS_PDV');
           end;
        end
   else begin
        DM.QGrupos.SQLConnection:=DM.SQLConnectionLocal;
        DM.QMarca.SQLConnection:=DM.SQLConnectionLocal;
        DM.QSecao.SQLConnection:=DM.SQLConnectionLocal;
        DM.QPesquisa.SQLConnection:=DM.SQLConnectionLocal;
        DM.QProdutoLocal.SQLConnection:=DM.SQLConnectionLocal;
        vTabelaProduto:=DM.TProdutoLocal;
        DM.QClientes.SQLConnection:=DM.SQLConnectionLocal;
        DM.QTributacao.SQLConnection:=DM.SQLConnectionLocal;
        DM.QPesqProduto.SQLConnection:=DM.SQLConnectionLocal;
        DM.QPesqCliente.SQLConnection:=DM.SQLConnectionLocal;
        DM.QUsuario.SQLConnection:=DM.SQLConnectionLocal;
        DM.QPesqGradeProd.SQLConnection:=DM.SQLConnectionLocal;
        With DM.QUsuario
        do begin
           Close;
           Sql.Clear;
           Sql.Add('SELECT * FROM USUARIOS');
           end;
        end;
end;

procedure TFrmPrincipal.AbreConexoes;
var
   Erro_Servidor_Remoto : String;
begin
    Ler_configuracao(IP_Local,IP_Remoto,Url_Local,Url_Remoto,PDV);

    PDVLocal:=PDV;

    if (IP_Remoto<>'')and(Url_Remoto<>'')
    then begin
         Try
           If FMsgServidor=nil
           then Application.CreateForm(TFMsgServidor,FMsgServidor);
           FMsgServidor.Show;
           FMsgServidor.Repaint;

           VerificaServidorRemotoAtivo;
           ConectaServidorRemoto;

           FMsgServidor.Close;
           FMsgServidor.Release;
           FMsgServidor:=Nil;

         Except
           on E: exception
           do begin
              FMsgServidor.Close;
              FMsgServidor.Release;
              FMsgServidor:=Nil;

              ServidorRemoto:='OF';
              Erro_Servidor_Remoto:='Erro Interno: '+Uppercase(E.Message);
              end;
            end;
         end
    else ServidorRemoto:='OF';

   Try
     SetCurrentDir(ExtractFilePath(Application.ExeName));

     DM.SQLConnectionLocal.Connected:=False;
     DM.SQLConnectionLocal.Params.Values['Database']:=IP_Local+':'+Url_Local;
     DM.SQLConnectionLocal.Connected:=True;

   Except
     on E: exception
     do begin
         Avisando('Problemas ao acessar o banco de dados local! Verifique as configurações do sistema.');
         InformaError('Erro Apresentado: '+Uppercase(E.Message));
         Try
            if FConfigBD=Nil
            then Application.CreateForm(TFConfigBD,FConfigBD);
            FConfigBD.ShowModal;
         Finally
            FConfigBD.Release;
            FConfigBD:=Nil;
            end;
     Application.Terminate;
     Raise;
     end;
   end;
   ClassificaConexaoAtiva;
end;


procedure TFrmPrincipal.VerificaLicenca;
//var
   //Sn : String;
   //vChamaAcesso : Boolean;
begin
     {vChamaAcesso:=False;
     vSerialDesteHD:=SerialNum(Sn);

     LeIniCrypt('Serial', 'SerieHD', vResgistroSerieHD);

     if not FileExists('C:\Windows\System32\odbc32ado.Ini')
     then begin
           vChamaAcesso:=True;
           ShowMessage('PROGRAMA VIOLADO, OU SEM PERMISSÃO PARA RODAR NESTE COMPUTADOR!'+#13+#13
                      +'ENTRE EM CONTATO COM O SUPORTE TÉCNICO PARA REGULARIZAR ESTE CÓPIA'+#13+#13
                      +'PELOS FONES: (82)3481-2873 ou 9622-7982!');
           end;

     if (vResgistroSerieHD <> vSerialDesteHD)
     then begin
          vChamaAcesso:=True;
          ShowMessage('ESTE SISTEMA NÃO ESTA AUTORIZADO A RODAR NESTE COMPUTADOR!'+#13
                     +'LIGUE PARA O SUPORTE TÉCNICO PARA REGULARIZAR ESTA CÓPIA.'+#13
                     +'PELOS FONES:(82)3481-2873 ou 9622-7982');
          end;

     if vChamaAcesso
     then begin
          Try
            if FAcesso=Nil
            then Application.CreateForm(TFAcesso, FAcesso);
            FAcesso.ShowModal;
          Finally
            FAcesso.Release;
            FAcesso:=Nil;
            end;
          Application.Terminate;
          Exit;
      end; }
end;

procedure TFrmPrincipal.MN_GRUPOSClick(Sender: TObject);
begin
     Try
        if FCadGrupos=Nil
        then Application.createform(TFCadGrupos, FCadGrupos);
        FCadGrupos.showmodal;
     Finally
        FCadGrupos.Release;
        FCadGrupos:=Nil;
        end;
end;

procedure TFrmPrincipal.MN_UNIDADESClick(Sender: TObject);
begin
      Try
         if FCadUnidades=Nil
         then Application.Createform(TFCadunidades, FCadunidades);
         FCadunidades.showmodal;
      Finally
         FCadUnidades.Release;
         FCadUnidades:=Nil;
         end;
end;

procedure TFrmPrincipal.mn_venda_checkoutClick(Sender: TObject);
begin
   if ((s_ImpFiscal='Nenhuma') or (s_ImpFiscal=''))
   then begin
        if application.messagebox('ECF não selecionada nas configurações. Deseja seleciona-la agora?','Verificação de ECF',MB_ICONEXCLAMATION + MB_YESNO) = IDYES
        then begin
             Try
                if FConfiguracao=Nil
                then Application.createform(TFConfiguracao, FConfiguracao);
                FConfiguracao.showmodal;
             Finally
                FConfiguracao.Release;
                FConfiguracao:=Nil;
                end;
             end
      else MessageDlg('Não será possível acessar a tela de PDV sem que o ECF esteja devidamente selecionado', mterror, [mbno], 0);
      end
   else begin
        if (FrmPrincipal.Cod_Consumidor='0')or(FrmPrincipal.Cod_Consumidor='')
        then Informa('Será Necessário configurar o Código das vendas direta ao consumidor!')
        else begin
             DM.TClientes.Close;
             DM.TClientes.Params[0].AsInteger:=StrToInt(FrmPrincipal.Cod_Consumidor);
             DM.TClientes.Open;
             if DM.TClientes.IsEmpty
             then Informa('Cliente Consumidor não esta configurado nos Parâmetros do Sistema!')
        else begin
              if VerificaConfiguracaoECF
              then begin
                    Try
                       if frmcheckout=Nil
                       then Application.createform(TFrmcheckout, Frmcheckout);
                       Frmcheckout.vAtivaComponente_TEF_Abertura:=True;
                       Frmcheckout.showmodal;
                    Finally
                      frmcheckout.Release;
                      frmcheckout:=Nil;
                      end;
                    end;
                end;    
           end;
      end;
end;

procedure TFrmPrincipal.MN_PRODUTOSClick(Sender: TObject);
begin
     Try
       if FCadProdutos=Nil
       then Application.Createform(TFCadProdutos, FCadProdutos);
       FCadProdutos.showmodal;
     Finally
       FCadProdutos.Release;
       FCadProdutos:=Nil;
       end;
end;

procedure TFrmPrincipal.MN_CONFIG_ECFClick(Sender: TObject);
begin
     Try
        if FConfiguracao=Nil
        then Application.createform(TFConfiguracao, FConfiguracao);
        FConfiguracao.showmodal;
     Finally
        FConfiguracao.release;
        FConfiguracao:=Nil;
        end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
var
   SistemIni: TIniFile;
   Linha : String;
begin
     if not Iniciou_Aplicacao
     then begin
           //vDiretorio:= ReplaceStr (LowerCase(Application.Exename),'.exe','.ini',ReplaceAll);
           vDiretorio := ('C:\Apgef\Config.ini');
           SistemIni  := TIniFile.Create( vDiretorio );
           if not FileExists( vDiretorio )
           then with SistemIni
                do begin
                   WriteString('PDV','Mensagem Cupom','VOLTE SEMPRE!!!');
                   WriteString('PDV','Espacamento entre Linhas','15');

                   WriteString('CONFIGURACOES','Controla Baixa de Estoque','S');
                   WriteString('CONFIGURACOES','Vende com Estoque Negativo','N');
                   WriteString('CONFIGURACOES','Tela PDV Padrão','N');
                   WriteString('CONFIGURACOES','Retaguarda','N');
                   WriteString('CONFIGURACOES','Busca Pré-Vendas no Retaguarda','N');
                   WriteString('CONFIGURACOES','Código do Consumidor','0');
                   WriteString('CONFIGURACOES','Gaveta','N');
                   WriteString('CONFIGURACOES','Reg.Clientes','-1');
                   WriteString('CONFIGURACOES','Reg.Estoque','-1');
                   WriteString('CONFIGURACOES','Ler_CodProduto_Pos_I','2');
                   WriteString('CONFIGURACOES','Ler_CodProduto_Pos_F','6');
                   WriteString('CONFIGURACOES','Ler_Valor_Pos_I','8');
                   WriteString('CONFIGURACOES','Ler_Valor_Pos_F','3');
                   WriteString('CONFIGURACOES','Ler_Campo_Balanca','0');
                   WriteString('CONFIGURACOES','Depende Retaguarda','S');
                   WriteString('CONFIGURACOES','Padrao Busca','0');
                   WriteString('CONFIGURACOES','Padrao Preco','VISTA');
                   WriteString('CONFIGURACOES','Grava no Retaguarda','S');
                   WriteString('CONFIGURACOES','Auto Pesquisa Clientes','S');
                   WriteString('CONFIGURACOES','Auto Pesquisa Produtos','S');
                   WriteString('CONFIGURACOES','Busca Contenha Clientes','N');
                   WriteString('CONFIGURACOES','Busca Contenha Produtos','N');
                   WriteString('CONFIGURACOES','Pinga no Servidor a cada','7000');
                   WriteString('CONFIGURACOES','Usa Grade','N');
                   WriteString('CONFIGURACOES','Verifica ReducaoZ Pendente','S');

                   WriteString('TEF','Tef Utilizado','Nenhum');
                   WriteString('TEF','Gerenciador Padrao','Nenhum');

                   WriteString('IMAGEM','Papel de Parede','');
                   WriteString('IMAGEM','Imagem PDV','');

                   WriteString('MONITOR PDV','Delay Conexão Remota' ,'7000');
                   WriteString('MONITOR PDV','Delay dados recebidos','10000');
                   WriteString('MONITOR PDV','Delay dados enviados' ,'15000');
                   WriteString('MONITOR PDV','Delay dados deletados','240000');
                   WriteString('MONITOR PDV','Ativa Log Erro','Sim');

                   end;
                SistemIni := TIniFile.Create(vDiretorio);
                with SistemIni
                do begin
                   Mensagem           := ReadString('PDV','Mensagem Cupom','');
                   Espaco_Entre_Linhas:= ReadString('PDV','Espacamento entre Linhas','');

                   BaixaEstoque        :=ReadString('CONFIGURACOES','Controla Baixa de Estoque','');
                   Vende_Estoque_Neg   :=ReadString('CONFIGURACOES','Vende com Estoque Negativo','');
                   Tela_PDV_Padrao     :=ReadString('CONFIGURACOES','Tela PDV Padrão','');
                   Busca_Pre_Venda     :=ReadString('CONFIGURACOES','Busca Pré-Vendas no Retaguarda','');
                   Cod_Consumidor      :=ReadString('CONFIGURACOES','Código do Consumidor','');
                   Gaveta              :=ReadString('CONFIGURACOES','Gaveta','');
                   Reg_Clientes        :=ReadString('CONFIGURACOES','Reg.Clientes','');
                   Reg_Estoque         :=ReadString('CONFIGURACOES','Reg.Estoque','');
                   Ler_CodProduto_Pos_I:=ReadString('CONFIGURACOES','Ler_CodProduto_Pos_I','');
                   Ler_CodProduto_Pos_F:=ReadString('CONFIGURACOES','Ler_CodProduto_Pos_F','');
                   Ler_Valor_Pos_I     :=ReadString('CONFIGURACOES','Ler_Valor_Pos_I','');
                   Ler_Valor_Pos_F     :=ReadString('CONFIGURACOES','Ler_Valor_Pos_F','');
                   Ler_Campo_Balanca   :=ReadString('CONFIGURACOES','Ler_Campo_Balanca','');
                   Depende_Retaguarda  :=ReadString('CONFIGURACOES','Depende Retaguarda','');
                   Padrao_Busca        :=ReadString('CONFIGURACOES','Padrao Busca','');
                   Padrao_Preco        :=ReadString('CONFIGURACOES','Padrao Preco','');
                   Grava_Retaguarda    :=ReadString('CONFIGURACOES','Grava no Retaguarda','');
                   Auto_Pesq_Clientes  :=ReadString('CONFIGURACOES','Auto Pesquisa Clientes','');
                   Auto_Pesq_Produtos  :=ReadString('CONFIGURACOES','Auto Pesquisa Produtos','');
                   Busca_Contenha_Cli  :=ReadString('CONFIGURACOES','Busca Contenha Clientes','');
                   Busca_Contenha_Prod :=ReadString('CONFIGURACOES','Busca Contenha Produtos','');
                   Ping_Servidor       :=ReadString('CONFIGURACOES','Pinga no Servidor a cada','');
                   Usa_Grade           :=ReadString('CONFIGURACOES','Usa Grade','');
                   Verifica_ReducaoZ_Pendente:=ReadString('CONFIGURACOES','Verifica ReducaoZ Pendente','');

                   Tef_Utilizado       :=ReadString('TEF','Tef Utilizado','');
                   Gerenciador_Padrao  :=ReadString('TEF','Gerenciador Padrao','');

                   Dir_PapelParede     :=ReadString('IMAGEM','Papel de Parede','');
                   Dir_PDV             :=ReadString('IMAGEM','Imagem PDV','');

                   Delay_Conexao_Remota   :=ReadString('MONITOR PDV','Delay Conexão Remota' ,'');
                   Delay_Atualiz_Recebido :=ReadString('MONITOR PDV','Delay dados recebidos','');
                   Delay_Atualiz_Enviados :=ReadString('MONITOR PDV','Delay dados enviados' ,'');
                   Delay_Atualiz_Deletados:=ReadString('MONITOR PDV','Delay dados deletados','');
                   Ativa_loq_Erro         :=ReadString('MONITOR PDV','Ativa Log Erro','');

                   end;
                SistemIni.Free;

            AbreConexoes;

            acessoOK:=false;

            fsenha:=tfsenha.create(self);
            fsenha.showmodal;
            fsenha.Release;
            fsenha:=Nil;

            if acessoOK = false
            then begin
                 frmprincipal.close;
                 exit;
                 end;
            SB.panels[0].text:='Usuário: '+s_Usuario;
            SB.Panels[1].Text:='Impressora Local: '+s_ImpFiscal;
            SB.Panels[2].Text:='IP Local: '+GetIp;
            if ServidorRemoto='ON'
            then SB.Panels[4].Text:='OnLine'
            else SB.Panels[4].Text:='OffLine';

            frmprincipal.Visible:=true;

            DM.TRegistro.Open;
            sMD5:=DM.TRegistroCOD_AUTENTICACAO.AsString;
            sMsgPDV:='Aplicativo de Gestor Fiscal:PDV Versao: 2010'+chr(13)+#10+
                     'MD5: '+sMD5;

            if Ping_Servidor<>''
            then begin
                 TPingConexaoRemota.Interval:=StrToInt(Ping_Servidor);
                 TPingConexaoRemota.Enabled:=True;
                 end;

          Try
            if Dir_PapelParede<>''
            then Image.Picture.LoadFromFile(Dir_PapelParede);
          Except
            Informa('Figura do Papel de Parede não Encontrada!, Será Necessário uma nova Configuração.');
            end;
      Iniciou_Aplicacao:=True;
      end;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
     Iniciou_Aplicacao:=False;
     EnableMenuItem( GetSystemMenu( handle, False ),SC_CLOSE, MF_BYCOMMAND or MF_GRAYED );

     CurrencyString := 'R$';
     CurrencyFormat := 0;
     NegCurrFormat := 14;
     ThousandSeparator := '.';
     DecimalSeparator := ',';
     CurrencyDecimals := 2;
     DateSeparator := '/';
     ShortDateFormat := 'dd/mm/yyyy';
     TimeSeparator := ':';
     TimeAMString := 'AM';
     TimePMString := 'PM';
     ShortTimeFormat := 'hh:mm';

     if not DirectoryExists('C:\Apgef\PAF')
     then ForceDirectories('C:\Apgef\PAF');

     SDir_Arq_PAF:='C:\Apgef\';
     SNome_Arq_PAF:='ArqVerifica.Ini';

     LeIniCrypt(SDir_Arq_PAF,'ECF','Modelo ECF',sCrypt_ModeloECF,SNome_Arq_PAF);

     if Trim(sCrypt_ModeloECF)=''
     then begin
          Informa('Seu ECF não esta configurado ainda, e será configurado '+
                  'automaticamente pelo Sistema!');
          ChamaLiberacaoECF(False);
          end;
end;

procedure TFrmPrincipal.MN_PARAMETROSClick(Sender: TObject);
begin
     Try
       if FEmpresa=Nil
       then Application.createform(TFEmpresa, FEmpresa);
       FEmpresa.showmodal;
     Finally
       FEmpresa.Release;
       FEmpresa:=Nil;
       end;
end;

procedure TFrmPrincipal.MN_MARCASClick(Sender: TObject);
begin
     Try
        if FCadMarca=Nil
        then Application.Createform(TFCadMarca, FCadMarca);
        FCadMarca.Showmodal;
     Finally
        FCadMarca.Release;
        FCadMarca:=Nil;
        end;
end;

procedure TFrmPrincipal.MN_LOJASClick(Sender: TObject);
begin
     Try
        if FCadCliente=Nil
        then Application.createform(TFCadcliente, FCadcliente);
        FCadCliente.showmodal;
     Finally
        FCadCliente.Release;
        FCadCliente:=Nil;
        end;
end;

procedure TFrmPrincipal.MN_FecharClick(Sender: TObject);
var
   vMensagem : String;
begin
     vMensagem:='No final do expediente é necessário fazer a redução Z,'+#13+
                'este procedimento deve ser feito todo dia mas somente no final do expediente.'+#13+#13+
                'Sair do programa?';
    	If Application.MessageBox(
    	PChar(vMensagem), 'Confirmação',
    	Mb_YesNo + Mb_DefButton2 + Mb_IconQuestion )=MrYes
      then application.Terminate;
end;

procedure TFrmPrincipal.SobreoSistema1Click(Sender: TObject);
begin
     Try
        if FSobre=Nil
        then application.CreateForm(TFSobre,FSobre);
        FSobre.ShowModal;
     Finally
        FSobre.Release;
        FSobre:=Nil;
        end;
end;

procedure TFrmPrincipal.Alquotas1Click(Sender: TObject);
begin
     Try
        if FConAliquotas=Nil
        then  application.createform(tfconaliquotas, fconaliquotas);
        fconaliquotas.showmodal;
     Finally
        fconaliquotas.Release;
        fconaliquotas:=Nil;
        end;
end;

procedure TFrmPrincipal.MN_USUARIOSClick(Sender: TObject);
begin
     Try
        if FCadUsuarios=Nil
        then application.createform(tfcadusuarios, fcadusuarios);
        fcadusuarios.showmodal;
     Finally
        FCadUsuarios.Release;
        FCadUsuarios:=nil;
        end;
end;

procedure TFrmPrincipal.MN_SECAOClick(Sender: TObject);
begin
     Try
        if FCadSecao=Nil
        then Application.Createform(TFCadSecao, FCadSecao);
        FCadSecao.Showmodal;
     Finally
        FCadSecao.Release;
        FCadSecao:=Nil;
        end;
end;

procedure TFrmPrincipal.BANCODEDADOS1Click(Sender: TObject);
begin
     Try
        if FConfigBD=Nil
        then Application.CreateForm(TFConfigBD,FConfigBD);
        FConfigBD.ShowModal;
     Finally
        FConfigBD.Release;
        FConfigBD:=nil;
        end;

end;

procedure TFrmPrincipal.FormActivate(Sender: TObject);
begin
     Application.ProcessMessages;

     if FileExists('C:\Apgef\MonitorPDV.exe')
     then begin
          if FindWindow('TFMonitorPDV', nil) = 0 //se não estiver aberto
          then Winexec('C:\Apgef\MonitorPDV',SW_Normal);
          end;
     //else Informa('O monitor PDV, não foi localizado no diretório do sistema! '+
                  //'Informe esta mensagem para o suporte técnico para regularizar este erro.');

     // Rotina para verificacao da resolucao do monitor
     if (Screen.Width = 800) or (Screen.Height = 600)
     then ResolucaoPadrao:=True
     else ResolucaoPadrao:=False;
     
     if Tela_PDV_Padrao='S'
     then mn_venda_checkoutClick(Sender);
end;

procedure TFrmPrincipal.MN_FORMAPGTOClick(Sender: TObject);
begin
     Try
        if FFormaPgto=Nil
        then Application.CreateForm(TFFormaPgto,FFormaPgto);
        FFormaPgto.ShowModal;
     Finally
        FFormaPgto.Release;
        FFormaPgto:=Nil;
        end;
end;

procedure TFrmPrincipal.AdministradorasdeCartes1Click(Sender: TObject);
begin
     Try
        if FAdm_Cartoes=Nil
        then Application.CreateForm(TFAdm_Cartoes,FAdm_Cartoes);
        FAdm_Cartoes.ShowModal;
     Finally
        FAdm_Cartoes.Release;
        FAdm_Cartoes:=Nil;
        end;
end;

procedure TFrmPrincipal.ApplicationEventsException(Sender: TObject;
  E: Exception);
var
  NomeDoLog, Mensagem: String;
  Arquivo: TextFile;
begin
  Mensagem := 'Ocorreu o seguinte erro: ' + #13 +UpperCase(E.Message);

  //Gravar no arquivo de Loq
  NomeDoLog := ChangeFileExt(Application.Exename, '.log');
  AssignFile(Arquivo, NomeDoLog);
  if FileExists(NomeDoLog) then
    Append(arquivo) { se existir, apenas adiciona linhas }
  else
    ReWrite(arquivo); { cria um novo se não existir }
  try
    WriteLn(arquivo, DateTimeToStr(Now) + ':' + Mensagem);
    WriteLn(arquivo, '----------------------------------------------------------------------');
    Application.ShowException(E);
  finally
    CloseFile(arquivo)
  end;
end;

procedure TFrmPrincipal.FormDestroy(Sender: TObject);
begin
     FechaPortaSerial;

     if FindWindow('TFMonitorPDV', nil) > 0
     then PostMessage(FindWindow(nil,'MonitorPDV'), WM_CLOSE,0,0);

     if FindWindow('TFSintegra', nil) > 0
     then PostMessage(FindWindow(nil,'Gera Sintegra'), WM_CLOSE,0,0);
end;

procedure TFrmPrincipal.TPingConexaoRemotaTimer(Sender: TObject);
begin
      VerificaServidorRemotoAtivo;
      ConectaServidorRemoto;
end;

procedure TFrmPrincipal.VerificaServidorRemotoAtivo;
begin
      if IP_Remoto <> ''
      then begin
            if DM.PingConexao.Connected
            then DM.PingConexao.Disconnect;
            DM.PingConexao.Host := IP_Remoto;
            DM.PingConexao.Port := 3050;
           Try
             DM.PingConexao.Connect(5000);//Aguarda 5 segundos
             ServidorRemoto:='ON';
             SB.Panels[4].Text:='OnLine';
             Application.ProcessMessages;
           Except
             SB.Panels[4].Text:='OffLine';
             ServidorRemoto:='OF';
             Application.ProcessMessages;
             end;
          end
      else begin
           SB.Panels[4].Text:='OffLine';
           ServidorRemoto:='OF';
           Application.ProcessMessages;
           end;
end;

procedure TFrmPrincipal.LX1Click(Sender: TObject);
begin
   if ((s_ImpFiscal='Nenhuma') or (s_ImpFiscal=''))
   then begin
        if application.messagebox('ECF não selecionada nas configurações. Deseja seleciona-la agora?','Verificação de ECF',MB_ICONEXCLAMATION + MB_YESNO) = IDYES
        then begin
             Try
                if FConfiguracao=Nil
                then Application.createform(TFConfiguracao, FConfiguracao);
                FConfiguracao.showmodal;
             Finally
                FConfiguracao.Release;
                FConfiguracao:=Nil;
                end;
             end
      else MessageDlg('Não será possível acessar o Menu Fiscal sem que o ECF esteja devidamente selecionado', mterror, [mbno], 0);
   end
   else begin
         Try
           if FMenuFiscal=Nil
           then Application.CreateForm(TFMenuFiscal,FMenuFiscal);
           FMenuFiscal.ShowModal;
         Finally
           FMenuFiscal.Release;
           FMenuFiscal:=Nil;
         end;
     end;    
end;

procedure TFrmPrincipal.ConfiguraeseInformaes1Click(Sender: TObject);
begin
   if ((s_ImpFiscal='Nenhuma') or (s_ImpFiscal=''))
   then begin
        if application.messagebox('ECF não selecionada nas configurações. Deseja seleciona-la agora?','Verificação de ECF',MB_ICONEXCLAMATION + MB_YESNO) = IDYES
        then begin
             Try
                if FConfiguracao=Nil
                then Application.createform(TFConfiguracao, FConfiguracao);
                FConfiguracao.showmodal;
             Finally
                FConfiguracao.Release;
                FConfiguracao:=Nil;
                end;
             end
   else MessageDlg('Não será possível acessar as Configurações e Informações, sem que o ECF esteja devidamente selecionado', mterror, [mbno], 0);
   end
   else begin
       Try
          if FConfigECF=Nil
          then Application.CreateForm(TFConfigECF,FConfigECF);
          FConfigECF.ShowModal;
       Finally
          FConfigECF.Release;
          FConfigECF:=Nil;
          end;
     end;     
end;

procedure TFrmPrincipal.CNIEE2Click(Sender: TObject);
begin
     Try
        if FCNIEE=Nil
        then Application.CreateForm(TFCNIEE,FCNIEE);
        FCNIEE.ShowModal;
     Finally
        FCNIEE.Release;
        FCNIEE:=Nil;
        end;
end;

procedure TFrmPrincipal.IdentificaodoPAFECF2Click(Sender: TObject);
begin
     Try
        if FRegistroPAF=Nil
        then Application.CreateForm(TFRegistroPAF,FRegistroPAF);
        FRegistroPAF.ShowModal;
     Finally
        FRegistroPAF.Release;
        FRegistroPAF:=Nil;
        end;
end;

procedure TFrmPrincipal.TVerifUltimaReducaoTimer(Sender: TObject);
begin
     //Verifica se o arquivo de liberação do sistema existe para fazer a verificação
     if FileExists(sDir_Arq_PAF+sNome_Arq_PAF)
     then VerificaUltimaReducaoSalvaemBD;
end;

procedure TFrmPrincipal.Contabilista1Click(Sender: TObject);
begin
     FContabilista := TFContabilista.Create(Self);
     FContabilista.ShowModal;
     FreeAndNil(FContabilista); 
end;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
var
   sCPF : String;
begin
       
end;

end.

