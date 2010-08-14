unit frmconfigimpfisc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, IniFiles, 
  RXCtrls, rxToolEdit, rxCurrEdit, ComCtrls, Spin, RxDBComb, jpeg, ShellApi;

type
  TFConfiguracao = class(TForm)
    Open: TOpenDialog;
    Open1: TOpenDialog;
    PageControl: TPageControl;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    Label15: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    ELeitor: TEdit;
    EValorCodigo: TEdit;
    EValorPreco: TEdit;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    C_Campo: TComboBox;
    EPos_Valor_1: TEdit;
    EPos_Valor_2: TEdit;
    EPos_Cod_2: TEdit;
    EPos_Cod_1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    TabSheet3: TTabSheet;
    GConfigDiversas: TGroupBox;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    BTBusca: TSpeedButton;
    Label11: TLabel;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    CControlaBaixaEstoque: TCheckBox;
    CVendeEstoqueNeg: TCheckBox;
    ERegCliente: TEdit;
    ERegEstoque: TEdit;
    ECodConsumidor: TEdit;
    CPreVenda: TCheckBox;
    EDir_PapelParede: TEdit;
    EDir_PDV: TEdit;
    CTelaPDV: TCheckBox;
    CRetaguarda: TCheckBox;
    C_Padrao_Busca: TComboBox;
    CPreco: TComboBox;
    CGrava_Retaguarda: TCheckBox;
    CAutoPesqCliente: TCheckBox;
    CAutoPesqProdutos: TCheckBox;
    C_ContenhaCliente: TCheckBox;
    C_ContenhaProdutos: TCheckBox;
    CGaveta: TCheckBox;
    CTef: TComboBox;
    CGerenciador: TComboBox;
    TabSheet4: TTabSheet;
    GroupBox4: TGroupBox;
    CDelayRemota: TComboBox;
    Label18: TLabel;
    Label19: TLabel;
    CDelayRecebidos: TComboBox;
    Label20: TLabel;
    CDelayEnviados: TComboBox;
    Label21: TLabel;
    CDelayDeletados: TComboBox;
    Label22: TLabel;
    CAtivaLog: TComboBox;
    StatusBar1: TStatusBar;
    Label23: TLabel;
    CPingServidor: TComboBox;
    Label24: TLabel;
    GroupBox1: TGroupBox;
    EMensagem: TEdit;
    CUsaGrade: TCheckBox;
    CVerifReducaoZ: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BTBuscaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ERegClienteExit(Sender: TObject);
    procedure ERegEstoqueExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ELeitorEnter(Sender: TObject);
    procedure ELeitorExit(Sender: TObject);
    procedure ELeitorKeyPress(Sender: TObject; var Key: Char);
    procedure BtGravarClick(Sender: TObject);
    procedure BtSairClick(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FConfiguracao: TFConfiguracao;

implementation

{$R *.DFM}

uses dmsyndAC, UPAF_ECF, frmsangriasuprimento, lite_frmprincipal, UBarsa;

procedure TFConfiguracao.FormShow(Sender: TObject);
begin
      EMensagem.Text:=FrmPrincipal.Mensagem;

      if FrmPrincipal.Grava_Retaguarda='S'
      then CGrava_Retaguarda.Checked:=True
      else CGrava_Retaguarda.Checked:=False;

      if FrmPrincipal.Usa_Grade='S'
      then CUsaGrade.Checked:=True
      else CUsaGrade.Checked:=False;

      if FrmPrincipal.Verifica_ReducaoZ_Pendente='S'
      then CVerifReducaoZ.Checked:=True
      else CVerifReducaoZ.Checked:=False;

      if FrmPrincipal.Padrao_Busca='0'
      then C_Padrao_Busca.ItemIndex:=0
      else C_Padrao_Busca.ItemIndex:=1;

      if FrmPrincipal.Padrao_Preco='VISTA'
      then CPreco.ItemIndex:=0
      else CPreco.ItemIndex:=1;

      if FrmPrincipal.Ler_Campo_Balanca='0'
      then C_Campo.ItemIndex:=0
      else C_Campo.ItemIndex:=1;

      if FrmPrincipal.Depende_Retaguarda='S'
      then CRetaguarda.Checked:=True
      else CRetaguarda.Checked:=False;

      if FrmPrincipal.BaixaEstoque='S'
      then CControlaBaixaEstoque.Checked:=True
      else CControlaBaixaEstoque.Checked:=False;

      if FrmPrincipal.Vende_Estoque_Neg='S'
      then CVendeEstoqueNeg.Checked:=True
      else CVendeEstoqueNeg.Checked:=False;

      if FrmPrincipal.Tela_PDV_Padrao='S'
      then CTelaPDV.Checked:=True
      else CTelaPDV.Checked:=False;

      if FrmPrincipal.Busca_Pre_Venda='S'
      then CPreVenda.Checked:=True
      else CPreVenda.Checked:=False;

      if FrmPrincipal.Gaveta='S'
      then CGaveta.Checked:=True
      else CGaveta.Checked:=False;

      if FrmPrincipal.Auto_Pesq_Clientes='S'
      then CAutoPesqCliente.Checked:=True
      else CAutoPesqCliente.Checked:=False;

      if FrmPrincipal.Auto_Pesq_Produtos='S'
      then CAutoPesqProdutos.Checked:=True
      else CAutoPesqProdutos.Checked:=False;

      if FrmPrincipal.Busca_Contenha_Cli='S'
      then C_ContenhaCliente.Checked:=True
      else C_ContenhaCliente.Checked:=False;

      if FrmPrincipal.Busca_Contenha_Prod='S'
      then C_ContenhaProdutos.Checked:=True
      else C_ContenhaProdutos.Checked:=False;

      if (FrmPrincipal.Tef_Utilizado='Nenhum')or(FrmPrincipal.Tef_Utilizado='')
      then CTef.ItemIndex:=0
      else if FrmPrincipal.Tef_Utilizado='Discado'
      then CTef.ItemIndex:=1;

      if (FrmPrincipal.Gerenciador_Padrao='Nenhum')or(FrmPrincipal.Gerenciador_Padrao='')
      then CGerenciador.ItemIndex:=0
      else CGerenciador.Text:=FrmPrincipal.Gerenciador_Padrao;

      ECodConsumidor.Text:=FrmPrincipal.Cod_Consumidor;
      ERegCliente.Text:=FrmPrincipal.Reg_Clientes;
      ERegEstoque.Text:=FrmPrincipal.Reg_Estoque;
      EPos_Cod_1.Text:=FrmPrincipal.Ler_CodProduto_Pos_I;
      EPos_Cod_2.Text:=FrmPrincipal.Ler_CodProduto_Pos_F;
      EPos_Valor_1.Text:=FrmPrincipal.Ler_Valor_Pos_I;
      EPos_Valor_2.Text:=FrmPrincipal.Ler_Valor_Pos_F;
      CPingServidor.Text:=FrmPrincipal.Ping_Servidor;

      EDir_PapelParede.Text:=FrmPrincipal.Dir_PapelParede;
      EDir_PDV.Text:=FrmPrincipal.Dir_PDV;

      CDelayRemota.Text:=FrmPrincipal.Delay_Conexao_Remota;
      CDelayRecebidos.Text:=FrmPrincipal.Delay_Atualiz_Recebido;
      CDelayEnviados.Text:=FrmPrincipal.Delay_Atualiz_Enviados;
      CDelayDeletados.Text:=FrmPrincipal.Delay_Atualiz_Deletados;
      CAtivaLog.Text:=FrmPrincipal.Ativa_loq_Erro;      
end;

procedure TFConfiguracao.FormActivate(Sender: TObject);
begin
     PageControl.TabIndex:=0;

     DM.TUsuario.Open;
     DM.TUsuario.Refresh;
     DM.TUsuario.Locate('ID',n_Usuario,[]);

     if DM.TUsuarioPE_ALTERA_MSG_PROMOCIONAL.AsInteger=0
     then EMensagem.Enabled:=False
     else EMensagem.Enabled:=True;

     if DM.TUsuarioPE_CONFIG_DIVERSAS.AsInteger=0
     then GConfigDiversas.Enabled:=False
     else GConfigDiversas.Enabled:=True;

     if vSuporte
     then begin
          GConfigDiversas.Enabled:=True;
          EMensagem.Enabled:=True;
          end;
end;

procedure TFConfiguracao.BTBuscaClick(Sender: TObject);
begin
     Open.Execute;
     if Open.FileName<>''
     then EDir_PapelParede.text:=Open.FileName;
end;

procedure TFConfiguracao.SpeedButton1Click(Sender: TObject);
begin
     Open1.Execute;
     if Open1.FileName<>''
     then EDir_PDV.text:=Open1.FileName;
end;

procedure TFConfiguracao.ERegClienteExit(Sender: TObject);
begin
      if Trim(ERegCliente.Text)=''
      then ERegCliente.Text:='-1';
end;

procedure TFConfiguracao.ERegEstoqueExit(Sender: TObject);
begin
     if Trim(ERegEstoque.Text)=''
     then ERegEstoque.Text:='-1';
end;

procedure TFConfiguracao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_F10
     then BtGravarClick(Sender);

     if Key=VK_Escape
     then BTSairClick(Sender);
end;

procedure TFConfiguracao.FormCreate(Sender: TObject);
begin
//     SetMultiLineButton(FConfiguracao);
end;

procedure TFConfiguracao.ELeitorEnter(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=$0080FFFF;
end;

procedure TFConfiguracao.ELeitorExit(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=clWhite;
end;

procedure TFConfiguracao.ELeitorKeyPress(Sender: TObject; var Key: Char);
var
   vPosicao_I_Cod, vPosicao_F_Cod, vPosicao_I_Valor, vPosicao_F_Valor : Integer;
begin
     if Key=#13
     then begin
          vPosicao_I_Cod:=StrToInt(EPos_Cod_1.text);
          vPosicao_F_Cod:=StrToInt(EPos_Cod_2.text);

          vPosicao_I_Valor:=StrToInt(EPos_Valor_1.text);
          vPosicao_F_Valor:=StrToInt(EPos_Valor_2.text);

          EValorCodigo.Text := Copy(ELeitor.Text,vPosicao_I_Cod,vPosicao_F_Cod);
          EValorPreco.Text  := FormatFloat('#####0.00',StrToFloat(Copy(ELeitor.Text,vPosicao_I_Valor, vPosicao_F_Valor)+','+Copy(ELeitor.Text,11,2)));
          end;
end;

procedure TFConfiguracao.BtGravarClick(Sender: TObject);
var
   vFechar : Boolean;
   SistemIni : TIniFile;
begin
      if Confirma('Confirma a Gravação da configuração?')=mrYes
     then begin
           Ac;
           SistemIni := TIniFile.Create( FrmPrincipal.vDiretorio );
           with SistemIni
           do begin
             WriteString('PDV','Mensagem Cupom',EMensagem.Text);
             WriteString('PDV','Espacamento entre Linhas','15');

             if CGrava_Retaguarda.Checked
             then WriteString('CONFIGURACOES','Grava no Retaguarda','S')
             else WriteString('CONFIGURACOES','Grava no Retaguarda','N');

             if CUsaGrade.Checked
             then WriteString('CONFIGURACOES','Usa Grade','S')
             else WriteString('CONFIGURACOES','Usa Grade','N');

             if CVerifReducaoZ.Checked
             then WriteString('CONFIGURACOES','Verifica ReducaoZ Pendente','S')
             else WriteString('CONFIGURACOES','Verifica ReducaoZ Pendente','N');

             if C_Padrao_Busca.ItemIndex=0
             then WriteString('CONFIGURACOES','Padrao Busca','0')
             else WriteString('CONFIGURACOES','Padrao Busca','1');

             if CPreco.ItemIndex=0
             then WriteString('CONFIGURACOES','Padrao Preco','VISTA')
             else WriteString('CONFIGURACOES','Padrao Preco','PRAZO');

             if C_Campo.ItemIndex=0
             then WriteString('CONFIGURACOES','Ler_Campo_Balanca','0')
             else WriteString('CONFIGURACOES','Ler_Campo_Balanca','1');

             if CRetaguarda.Checked
             then WriteString('CONFIGURACOES','Depende Retaguarda','S')
             else WriteString('CONFIGURACOES','Depende Retaguarda','N');

             if CControlaBaixaEstoque.Checked
             then WriteString('CONFIGURACOES','Controla Baixa de Estoque','S')
             else WriteString('CONFIGURACOES','Controla Baixa de Estoque','N');

             if CVendeEstoqueNeg.Checked
             then WriteString('CONFIGURACOES','Vende com Estoque Negativo','S')
             else WriteString('CONFIGURACOES','Vende com Estoque Negativo','N');

             if CTelaPDV.Checked
             then WriteString('CONFIGURACOES','Tela PDV Padrão','S')
             else WriteString('CONFIGURACOES','Tela PDV Padrão','N');

             if CPreVenda.Checked
             then WriteString('CONFIGURACOES','Busca Pré-Vendas no Retaguarda','S')
             else WriteString('CONFIGURACOES','Busca Pré-Vendas no Retaguarda','N');

             if CGaveta.Checked
             then WriteString('CONFIGURACOES','Gaveta','S')
             else WriteString('CONFIGURACOES','Gaveta','N');

             WriteString('CONFIGURACOES','Código do Consumidor',ECodConsumidor.Text);
             WriteString('CONFIGURACOES','Reg.Clientes',ERegCliente.Text);
             WriteString('CONFIGURACOES','Reg.Estoque',ERegEstoque.Text);
             WriteString('CONFIGURACOES','Ler_CodProduto_Pos_I',EPos_Cod_1.Text);
             WriteString('CONFIGURACOES','Ler_CodProduto_Pos_F',EPos_Cod_2.Text);
             WriteString('CONFIGURACOES','Ler_Valor_Pos_I',EPos_Valor_1.Text);
             WriteString('CONFIGURACOES','Ler_Valor_Pos_F',EPos_Valor_2.Text);

             if CAutoPesqCliente.Checked
             then WriteString('CONFIGURACOES','Auto Pesquisa Clientes','S')
             else WriteString('CONFIGURACOES','Auto Pesquisa Clientes','N');

             if CAutoPesqProdutos.Checked
             then WriteString('CONFIGURACOES','Auto Pesquisa Produtos','S')
             else WriteString('CONFIGURACOES','Auto Pesquisa Produtos','N');

             if C_ContenhaCliente.Checked
             then WriteString('CONFIGURACOES','Busca Contenha Clientes','S')
             else WriteString('CONFIGURACOES','Busca Contenha Clientes','N');

             if C_ContenhaProdutos.Checked
             then WriteString('CONFIGURACOES','Busca Contenha Produtos','S')
             else WriteString('CONFIGURACOES','Busca Contenha Produtos','N');
             WriteString('CONFIGURACOES','Pinga no Servidor a cada',CPingServidor.Text);

             WriteString('TEF','Tef Utilizado',CTef.Text);
             WriteString('TEF','Gerenciador Padrao',CGerenciador.Text);

             WriteString('IMAGEM','Papel de Parede',EDir_PapelParede.Text);
             WriteString('IMAGEM','Imagem PDV',EDir_PDV.Text);

             WriteString('MONITOR PDV','Delay Conexão Remota' ,CDelayRemota.Text);
             WriteString('MONITOR PDV','Delay dados recebidos',CDelayRecebidos.Text);
             WriteString('MONITOR PDV','Delay dados enviados' ,CDelayEnviados.Text);
             WriteString('MONITOR PDV','Delay dados deletados',CDelayDeletados.Text);
             WriteString('MONITOR PDV','Ativa Log Erro',CAtivaLog.Text);
             end;
             SistemIni.Free;
             DC;

           if ECodConsumidor.text<>'0'
           then begin
                 DM.TClientes.Close;
                 DM.TClientes.Params[0].AsInteger:=StrToInt(ECodConsumidor.Text);
                 DM.TClientes.Open;
                 if DM.TClientes.IsEmpty
                 then begin
                      Informa('Código do Consumidor não existe no banco de dados!');
                      ECodConsumidor.SetFocus;
                      vFechar:=False;
                      end
                 else vFechar:=True;
                 end
           else vFechar:=True;

      if vFechar
      then begin
           Informa('Para que as Configurações tenha efeito, o sistema sera reiniciado!');
           Application.Terminate;
           ShellExecute(0,Nil,PChar(GetCurrentDir+'\PDV.EXE'),'', Nil, SW_SHOWNORMAL);
           end;

      end;
end;

procedure TFConfiguracao.BtSairClick(Sender: TObject);
begin
     Close;
end;

end.
