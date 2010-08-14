unit UOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, WinXP, StdCtrls, Buttons, DBCtrls, Grids,
  DBGrids, DB, Mask,  IniFiles, Mylabel, DBXPress,
  RXCtrls, rxToolEdit, rxCurrEdit;

type
  TFOrcamentos = class(TForm)
    SB: TStatusBar;
    Panel1: TPanel;
    WinXP1: TWinXP;
    Label1: TLabel;
    Label2: TLabel;
    LData: TLabel;
    LHora: TLabel;
    Timer1: TTimer;
    Panel2: TPanel;
    dsOrcTemp: TDataSource;
    GroupBox1: TGroupBox;
    BTPesqCliente: TSpeedButton;
    ENomeCliente: TEdit;
    GroupBox2: TGroupBox;
    BTPesqVendedor: TSpeedButton;
    ECodVendedor: TEdit;
    ENOMEVENDEDOR: TEdit;
    LStatusCliente: TLabel;
    DBGrid: TDBGrid;
    EQtde: TCurrencyEdit;
    EVl_Unit: TCurrencyEdit;
    EVl_Total: TCurrencyEdit;
    GroupBox3: TGroupBox;
    EObservacoes: TEdit;
    GroupBox4: TGroupBox;
    EValidade: TDateEdit;
    myLabel3d1: TmyLabel3d;
    EVl_Desconto: TCurrencyEdit;
    myLabel3d2: TmyLabel3d;
    myLabel3d4: TmyLabel3d;
    myLabel3d3: TmyLabel3d;
    EPerc_Desconto: TCurrencyEdit;
    Label3: TLabel;
    BtSalvar: TBitBtn;
    BtCancelar: TBitBtn;
    ImageON: TImage;
    ImageOF: TImage;
    TSalvaDadosOff: TTimer;
    Panel3: TPanel;
    ESubTotal: TCurrencyEdit;
    Panel4: TPanel;
    ETotal: TCurrencyEdit;
    LTabela: TLabel;
    RxLStatusOrc: TRxLabel;
    RLRazao: TRxLabel;
    RLEndereco: TRxLabel;
    ECodProduto: TEdit;
    Label4: TLabel;
    LNumItens: TLabel;
    Bevel1: TBevel;
    procedure FormShow(Sender: TObject);
    procedure ENomeClienteEnter(Sender: TObject);
    procedure ENomeClienteExit(Sender: TObject);
    procedure ENomeClienteKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEnter(Sender: TObject);
    procedure DBGridExit(Sender: TObject);
    procedure ECodProdutoChange(Sender: TObject);
    procedure BTPesqClienteClick(Sender: TObject);
    procedure ENomeClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ECodVendedorExit(Sender: TObject);
    procedure EObservacoesExit(Sender: TObject);
    procedure EValidadeEnter(Sender: TObject);
    procedure EValidadeExit(Sender: TObject);
    procedure EVl_DescontoEnter(Sender: TObject);
    procedure EVl_DescontoExit(Sender: TObject);
    procedure EPerc_DescontoEnter(Sender: TObject);
    procedure EPerc_DescontoExit(Sender: TObject);
    procedure BTPesqVendedorClick(Sender: TObject);
    procedure ECodVendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ECodVendedorKeyPress(Sender: TObject; var Key: Char);
    procedure ECodProdutoExit(Sender: TObject);
    procedure DBGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EVl_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure EQtdeExit(Sender: TObject);
    procedure EVl_UnitExit(Sender: TObject);
    procedure EVl_TotalExit(Sender: TObject);
    procedure ECodProdutoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ECodProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EQtdeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EVl_UnitKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure TSalvaDadosOffTimer(Sender: TObject);
    procedure BtSalvarClick(Sender: TObject);
    procedure dsOrcTempDataChange(Sender: TObject; Field: TField);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtCancelarClick(Sender: TObject);
    procedure ECodVendedorEnter(Sender: TObject);
    procedure ENomeClienteChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure Pesquisa_Clientes;
    procedure Ler_Config_Banco;
    procedure SalvaEstoqueOff;
    procedure SalvaClienteOff;
    procedure SalvaVendedorOff;
    procedure Le_Config_Locais;
  public
    { Public declarations }
    iCodCliente : Integer;
    procedure ImprimiOrcamento(xCodOrcamento : Integer);
    procedure Imprimi(Flag : Integer);
  end;

var
  FOrcamentos: TFOrcamentos;
  SistemIni : TIniFile;
  sPrecoTabela,
  Busca_Contenha_Prod,
  Busca_Contenha_Cliente,
  Auto_Pesq_Produtos,
  Auto_Pesq_Clientes,
  PackedRecords_Produtos,
  PackedRecords_Clientes,
  IP, Serv, Url,
  Status_Serv,
  Dir_Arq_Locais,
  Status_Orcamento,
  TipoImpressora,
  vDiretorio,
  NumDiasValidadeOrc : String;
  nPesquisando, nConsulta_Cliente_Codigo, nSalvouOrc : Boolean;

  procedure AtualizaTotais;
  procedure CarregaEstoqueOff;
  procedure CarregaVendoresOff;
  procedure CarregaClientesOff;
  procedure MesclaOrcamentos(xNum_DAV_Alterando, xNum_DAV_Novo : Integer);
  procedure ExcluiItem;
  procedure VerificaClienteCadastrado(xCodCliente : Integer);
  procedure Consulta_Grade_Produto(xCodProduto : Integer);

implementation

uses UBarsa, UDM, Math, UConsultaProdutos, UConsultaClientes,
     UConsultaVendedores, USelecionaPreco, UMsg, URelatorios,
     UConsultaOrcamentos, UImpressao, UAjuda, UConfiguracao,
     UConsulta_Grade;

{$R *.dfm}

procedure Consulta_Grade_Produto(xCodProduto : Integer);
begin
     DM.TPesqGradeProd.Close;
     DM.TPesqGradeProd.Params[0].AsInteger:=xCodProduto;
     DM.TPesqGradeProd.Open;
     if DM.TPesqGradeProd.RecordCount > 0
     then begin
          Try
             if FConsultaGrade=Nil
             then Application.CreateForm(TFConsultaGrade,FConsultaGrade);
             FConsultaGrade.LDescricao.Caption:=StrZero(xCodProduto,6)+'-'+DM.TOrcTempDESCRICAO.Value;
             if DM.TOrcGradeTemp.Locate('COD_PRODUTO',xCodProduto,[])
             then begin
                  DM.TOrcGradeTemp.First;
                  While not DM.TOrcGradeTemp.Eof
                  do begin
                     if DM.TPesqGradeProd.Locate('CODIGO',DM.TOrcGradeTempCOD_GRADE.Value,[])
                     then begin
                          DM.TPesqGradeProd.Edit;
                          DM.TPesqGradeProdSEL.Value:='X';
                          DM.TPesqGradeProdQTDE_SELECIONADA.Value:=DM.TOrcGradeTempQTDE.Value;
                          DM.TPesqGradeProd.Post;
                          end;
                     DM.TOrcGradeTemp.Next;
                     end;
                  end;
             FConsultaGrade.ShowModal;
             if FConsultaGrade.ModalResult=mrOk
             then FOrcamentos.EQtde.ReadOnly:=True
             else FOrcamentos.EQtde.ReadOnly:=false;
          Finally
             FConsultaGrade.Release;
             FConsultaGrade:=nil;
             end;
          end;
     DM.TPesqGradeProd.Close;
end;

procedure VerificaClienteCadastrado(xCodCliente : Integer);
var
   Cadastrado : Boolean;
begin
     if Status_Serv='ON'
     then begin
          With DM.QPesquisa
          do begin
             Close;
             Sql.Clear;
             Sql.Add('SELECT CODIGO FROM CLIENTE');
             Sql.Add('WHERE CODIGO = :PCODIGO');
             ParamByName('PCODIGO').AsInteger:=xCodCliente;
             Open;
             if not IsEmpty
             then Cadastrado:=True
             else Cadastrado:=False;
             end;
          end
     else begin//Modo OffLine
          CarregaClientesOff;
          DM.TPesqClienteTemp.Open;
          if DM.TPesqClienteTemp.Locate('CODIGO',xCodCliente,[])
          then Cadastrado:=True
          else Cadastrado:=False;
          end;

     if Cadastrado
     then begin
          With FOrcamentos
          do begin
             LStatusCliente.Font.Color:=clTeal;
             LStatusCliente.Caption:='< Cliente Cadastrado >';
             end;
          end
     else begin
          With FOrcamentos
          do begin
             LStatusCliente.Font.Color:=clRed;
             LStatusCliente.Caption:='< Cliente Não Cadastrado >';
             end;
          end;
end;

procedure ExcluiItem;
begin
     if Confirma('Deseja Exluir o Item '+DM.TOrcTempDESCRICAO.Value+' ?')=mrYes
     then begin
          DM.TOrcTemp.Delete;
          AtualizaTotais;
          end;
end;

procedure MesclaOrcamentos(xNum_DAV_Alterando, xNum_DAV_Novo : Integer);
begin
     With DM.QPesquisa
     do begin
        Close;                          
        Sql.Clear;
        Sql.Add('SELECT CODIGO,NUMERO_DAV FROM ORCAMENTO');
        Sql.Add('WHERE NUMERO_DAV= :PNUMDAV');
        ParamByName('PNUMDAV').AsInteger:=xNum_DAV_Alterando;
        Open;
        if not IsEmpty
        then begin
             DM.TOrcamento.Close;
             DM.TOrcamento.Params[0].AsInteger:=FieldByName('CODIGO').Value;
             DM.TOrcamento.Open;
             DM.TOrcamento.Edit;
             DM.TOrcamentoNUM_NOVO_DAV.AsInteger:=xNum_DAV_Novo;
             DM.TOrcamentoALTERADO.Value:='S';
             DM.TOrcamentoDT_HORA_ALTEROU.AsDateTime:=Now;
             DM.TOrcamento.Post;
             DM.TOrcamento.ApplyUpdates(-1);
             end;
        end;
end;

procedure TFOrcamentos.ImprimiOrcamento(xCodOrcamento : Integer);
begin
     DM.TOrcamento.Close;
     DM.TOrcamento.Params[0].AsInteger:=xCodOrcamento;
     DM.TOrcamento.Open;

     Try
        FTipoImpressao:=TFTipoImpressao.Create(Self);
        FTipoImpressao.ShowModal;
     Finally
        FreeAndNil(FTipoImpressao);
        end;
end;

procedure TFOrcamentos.Imprimi(Flag : Integer);
begin
     Try
        FRelatorios := TFRelatorios.Create(Self);

        FRelatorios.RLDAV.Prepare();

        if TipoImpressora='Matricial'
        then begin
             FRelatorios.RLDAV.DefaultFilter:=DM.RLDraftFilter1;
             FRelatorios.RLDAV.Margins.TopMargin:=2;
             end
        else begin
             FRelatorios.RLDAV.Margins.TopMargin:=5;
             end;

        if Flag = 0
        then begin
             FRelatorios.RLDAV.PrintDialog:=False;
             FRelatorios.RLDAV.Print;
             end
        else if Flag = 1
        then begin
             FRelatorios.RLDAV.PreviewModal();
             end;
        
     Finally
        FreeAndNil(FRelatorios);
        end;
end;

procedure CarregaClientesOff;
begin
     DM.TPesqClienteTemp.Close;
     DM.TPesqClienteTemp.LoadFromFile(Dir_Arq_Locais+'ClienteOrc.xml');
     DM.TPesqClienteTemp.IndexFieldNames:='NOME';
     DM.TPesqClienteTemp.Open;
end;

procedure CarregaEstoqueOff;
begin
     DM.TPesqProdutoTemp.Close;
     DM.TPesqProdutoTemp.LoadFromFile(Dir_Arq_Locais+'EstoqueOrc.xml');
     DM.TPesqProdutoTemp.IndexFieldNames:='DESCRICAO';
     DM.TPesqProdutoTemp.Open;
end;

procedure CarregaVendoresOff;
begin
     DM.TPesqVendedorTemp.Close;
     DM.TPesqVendedorTemp.LoadFromFile(Dir_Arq_Locais+'VendedoresOrc.xml');
     DM.TPesqVendedorTemp.IndexFieldNames:='NOME';
     DM.TPesqVendedorTemp.Open;
end;

procedure TFOrcamentos.SalvaEstoqueOff;
begin
     DM.TPesqProduto.Close;
     DM.TPesqProduto.Params[0].AsString:='%';
     DM.TPesqProduto.Params[1].AsString:='-1';
     DM.TPesqProduto.Params[2].AsString:='-1';
     DM.TPesqProduto.Params[3].AsInteger:=-1;
     DM.TPesqProduto.Params[4].AsString:='N';
     DM.TPesqProduto.Open;
     DM.TPesqProduto.SaveToFile(Dir_Arq_Locais+'EstoqueOrc.xml');
     DM.TPesqProduto.Close;
end;

procedure TFOrcamentos.SalvaClienteOff;
begin
     DM.TPesqCliente.Close;
     DM.TPesqCliente.Params[0].AsString:='%';
     DM.TPesqCliente.Params[1].AsInteger:=-1;
     DM.TPesqCliente.Params[2].AsString:='N';
     DM.TPesqCliente.Open;
     DM.TPesqCliente.SaveToFile(Dir_Arq_Locais+'ClienteOrc.xml');
     DM.TPesqCliente.Close;
end;

procedure TFOrcamentos.SalvaVendedorOff;
begin
     DM.TPesqVendedor.Close;
     DM.TPesqVendedor.Params[0].AsString:='N';
     DM.TPesqVendedor.Open;
     DM.TPesqVendedor.SaveToFile(Dir_Arq_Locais+'VendedoresOrc.xml');
     DM.TPesqVendedor.Close;
end;

procedure AtualizaTotais;
begin
     if DM.TOrcTempSUBTOTAL.Value > 0
     then begin
          FOrcamentos.ESubTotal.Value:=DM.TOrcTempSUBTOTAL.Value;
          FOrcamentos.ETotal.Value:=DM.TOrcTempSUBTOTAL.Value;
          end;
     FOrcamentos.EVL_Desconto.Value:=0;
     FOrcamentos.EPerc_Desconto.Value:=0;
end;


procedure TFOrcamentos.Ler_Config_Banco;
var
   Banco : TIniFile;
begin
  Try
    Banco := TIniFile.create(GetCurrentDir+'\database.ini');
    IP    := Banco.ReadString('DATABASE','IP','');
    Serv  := Banco.ReadString('DATABASE','SERVIDOR','');
    Url   := Banco.ReadString('DATABASE','CAMINHO','');
  Finally
    Banco.Free;
  end;
end;


procedure TFOrcamentos.Pesquisa_Clientes;
begin
     if nConsulta_Cliente_Codigo
     then begin
          if Status_Serv='ON'
          then begin
                With DM.QPesquisa
                do begin
                   Close;
                   Sql.Clear;
                   Sql.Add('SELECT CODIGO,NOME FROM CLIENTE');
                   Sql.Add('WHERE CODIGO= :PCODIGO');
                   ParamByName('PCODIGO').AsInteger:=StrToInt(ENomeCliente.Text);
                   Open;
                   if not IsEmpty
                   then begin
                        iCodCliente:=FieldByName('CODIGO').Value;
                        ENomeCliente.Text:=FieldByName('NOME').Value;
                        end
                   else begin
                        Informa('Cliente não Cadastrado!');
                        ENomeCliente.Clear;
                        ENomeCliente.SetFocus;
                        end;
                   end;
               end
          else begin//Modo OffLine
               CarregaClientesOff;
               DM.TPesqClienteTemp.Open;
               if DM.TPesqClienteTemp.Locate('CODIGO',ENomeCliente.Text,[])
               then begin
                    iCodCliente:=DM.TPesqClienteTempCODIGO.Value;
                    ENomeCliente.Text:=DM.TPesqClienteTempNOME.Value;
                    end
               else begin
                    Informa('Cliente não Cadastrado!');
                    ENomeCliente.Clear;
                    ENomeCliente.SetFocus;
                    end;
               end;
          VerificaClienteCadastrado(iCodCliente);
          end
     else begin
           Try
              FPEsquisaClientes := TFPesquisaClientes.Create(Self);
              FPesquisaClientes.ShowModal;
              if FPesquisaClientes.ModalResult=mrOk
              then begin
                   iCodCliente:=DM.dsPesquisaClientes.DataSet.FieldByName('CODIGO').Value;
                   ENomeCliente.Text:=DM.dsPesquisaClientes.DataSet.FieldByName('NOME').AsString;
                   end
              else iCodCliente:=0;
           Finally
              FreeAndNil(FPesquisaClientes);
              end;
        end;
end;

procedure TFOrcamentos.FormShow(Sender: TObject);
begin
     LimpaEdit(FOrcamentos);

     DM.TOrcTemp.FileName:=Dir_Arq_Locais+'Orc.xml';
     DM.TOrcTemp.Close;
     DM.TOrcTemp.CreateDataSet;
     DM.TOrcTemp.IndexFieldNames:='NUM_ITEM';

     DM.TOrcGradeTemp.FileName:=Dir_Arq_Locais+'OrcGrade.xml';
     DM.TOrcGradeTemp.Close;
     DM.TOrcGradeTemp.CreateDataSet;

     if not nSalvouOrc
     then begin
          DeleteFile(Dir_Arq_Locais+'Orc.xml');
          DeleteFile(Dir_Arq_Locais+'OrcGrade.xml');
          end
     else begin
          DM.TOrcTemp.LoadFromFile(Dir_Arq_Locais+'Orc.xml');
          if FileExists(Dir_Arq_Locais+'OrcGrade.xml')
          then DM.TOrcGradeTemp.LoadFromFile(Dir_Arq_Locais+'OrcGrade.xml');
          AtualizaTotais;
          end;
     nSalvouOrc:=False;     

     EValidade.Date:=Now + 30;

     ECodProduto.Visible:=False;
     EQtde.Visible:=False;
     EVl_Unit.Visible:=False;
     EVl_Total.Visible:=False;

     nConsulta_Cliente_Codigo:=False;
     nPesquisando:=False;
     iCodCliente:=0;

     ESubTotal.Value:=0;
     EVl_Desconto.Value:=0;
     EPerc_Desconto.Value:=0;
     ETotal.Value:=0;

     LStatusCliente.Caption:='';
     RxLStatusOrc.Caption:='< Novo Lançamento >';
     Status_Orcamento:='NEW';

     ENomeCliente.SetFocus;
end;

procedure TFOrcamentos.ENomeClienteEnter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure TFOrcamentos.ENomeClienteExit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure TFOrcamentos.ENomeClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
     if (Key=#13)
     then begin
          if (Trim(ENomeCliente.Text)='')
          then BtPesqClienteClick(Sender)
          else begin
               if (ENomeCliente.Text>='0') and (ENomeCliente.Text<='9')
               then begin
                    nConsulta_Cliente_Codigo:=True;
                    BtPesqClienteClick(Sender);
                    nConsulta_Cliente_Codigo:=False;
                    end;
               end;
          end;
end;

procedure TFOrcamentos.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FOrcamentos,Key);
end;

procedure TFOrcamentos.Timer1Timer(Sender: TObject);
begin
     LData.Caption:=DateToStr(Now);
     LHora.Caption:=TimeToStr(Now);
end;

procedure TFOrcamentos.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     if DBGrid.Focused
     then begin
           ECodProduto.Visible := DBGrid.SelectedField = DM.TOrcTempCodProduto;
           if ECodProduto.Visible
           then if gdFocused in State
           then begin
                ECodProduto.Text:=IntTOStr(DM.TOrcTempCodProduto.Value);
                ECodProduto.SetBounds(DBGrid.Left + Rect.Left,DBGrid.Top + Rect.Top,
                                      Rect.Right-Rect.Left,Rect.Bottom-Rect.Top);
                if ECodProduto.Text = '0'
                then ECodProduto.Clear;
                ECodProduto.SetFocus;
                end;

           EQtde.Visible := DBGrid.SelectedField = DM.TOrcTempQtde;
           if EQtde.Visible
           then if gdFocused in State
           then begin
                EQtde.Value := DM.TOrcTempQtde.Value;
                EQtde.SetBounds(DBGrid.Left + Rect.Left,DBGrid.Top + Rect.Top,
                                      Rect.Right-Rect.Left,Rect.Bottom-Rect.Top);
                EQtde.SetFocus;
                end;

           EVl_Unit.Visible := DBGrid.SelectedField = DM.TOrcTempVl_Unit;
           if EVl_Unit.Visible
           then if gdFocused in State
           then begin
                EVl_Unit.Value := DM.TOrcTempVl_Unit.Value;
                EVl_Unit.SetBounds(DBGrid.Left + Rect.Left,DBGrid.Top + Rect.Top,
                                      Rect.Right-Rect.Left,Rect.Bottom-Rect.Top);
                EVl_Unit.SetFocus;
                end;

           EVl_Total.Visible := DBGrid.SelectedField = DM.TOrcTempVl_Total;
           if EVl_Total.Visible
           then if gdFocused in State
           then begin
                EVl_Total.Value := DM.TOrcTempVl_Total.Value;
                EVl_Total.SetBounds(DBGrid.Left + Rect.Left,DBGrid.Top + Rect.Top,
                                      Rect.Right-Rect.Left,Rect.Bottom-Rect.Top);
                EVl_Total.SetFocus;
                end;
          end;

    if not odd(DM.TOrcTemp.RecNo)
    then begin
         if not (gdselected in state)
         then begin
              DBGrid.Canvas.Brush.Color := $00F0F0F0;
              DBGrid.Canvas.FillRect(Rect);
              DBGrid.DefaultDrawDataCell(rect, Column.Field, State);
              end;
         end;
end;

procedure TFOrcamentos.FormCreate(Sender: TObject);
begin
     if not DirectoryExists('C:\Aplicativo_Gerencial\Local')
     then ForceDirectories('C:\Aplicativo_Gerencial\Local');

     Ler_Config_Banco;
     Le_Config_Locais;

     Try
        FMsg := TFMsg.Create(Self);
        FMsg.PMensagem.Caption:='Estabelecendo a conexão com o Banco de Dados. Aguarde!!!';
        FMsg.Show;
        FMsg.Repaint;
        Try
          DM.SQLConnection.Connected:=False;
          DM.SQLConnection.Params.Values['Database']:=Url;
          DM.SQLConnection.Connected:=True;

          ImageON.Visible:=True;
          ImageOF.Visible:=False;
          Status_Serv:='ON';
          BtSalvar.Enabled:=True;

          DM.TEmpresa.Open;

          RLRazao.Caption:=DM.TEmpresaRAZAO.AsString;
          RLEndereco.Caption:=DM.TEmpresaENDERECO.AsString+' - '+DM.TEmpresaCIDADE.AsString;

          SalvaEstoqueOff;
          SalvaClienteOff;
          SalvaVendedorOff;
        Except
          Status_Serv:='OF';
          ImageON.Visible:=False;
          ImageOF.Visible:=True;
          RLRazao.Caption:='';
          RLEndereco.Caption:='';

          BtSalvar.Enabled:=False;
          FMsg.Close;
          Avisando('Erro ao conectar com o Banco de Dados central! O Sistema irá trabalhar em modo offline '+
                   'somente para consultas!');
          end;
     Finally
        FreeAndNil(FMsg);
        end;

     if FileExists(Dir_Arq_Locais+'Orc.xml')
     then nSalvouOrc:=True
     else nSalvouOrc:=False;

     sPrecoTabela:='V';
     LTabela.Caption:='Tabela = '+sPrecoTabela;
end;

procedure TFOrcamentos.Le_Config_Locais;
begin
     vDiretorio:= ReplaceStr (LowerCase(Application.Exename),'.exe','.ini',ReplaceAll);
     SistemIni  := TIniFile.Create( vDiretorio );
     if not FileExists( vDiretorio )
     then with SistemIni
          do begin
             WriteString('Config','Auto Pesquisa Produtos','S');
             WriteString('Config','Auto Pesquisa Clientes','S');
             WriteString('Config','Busca Contenha Produtos','N');
             WriteString('Config','Busca Contenha Clientes','N');
             WriteString('Config','PackedRecords Clientes','-1');
             WriteString('Config','PackedRecords Produtos','-1');
             WriteString('Config','No Dias Validade','30');
             WriteString('Config','Diretorio Arquivos Locais','C:\Aplicativo_Gerencial\Local\');

             WriteString('Impressora','Tipo da Impressora','Grafica');
             end;
     SistemIni := TIniFile.Create(vDiretorio);
     with SistemIni
     do begin
        Auto_Pesq_Produtos     := ReadString('Config','Auto Pesquisa Produtos','');

        if Auto_Pesq_Produtos=''then
           Auto_Pesq_Produtos:='S';

        Auto_Pesq_Clientes     := ReadString('Config','Auto Pesquisa Clientes','');

        if Auto_Pesq_Clientes=''then
           Auto_Pesq_Clientes:='S';

        Busca_Contenha_Prod    := ReadString('Config','Busca Contenha Produtos','');

        if Busca_Contenha_Prod='' then
           Busca_Contenha_Prod:='N';

        Busca_Contenha_Cliente := ReadString('Config','Busca Contenha Clientes','');

        if Busca_Contenha_Cliente='' then
           Busca_Contenha_Cliente:='N';

        PackedRecords_Clientes :=ReadString('Config','PackedRecords Clientes','');
        PackedRecords_Produtos :=ReadString('Config','PackedRecords Produtos','');
        Dir_Arq_Locais         :=ReadString('Config','Diretorio Arquivos Locais','');
        NumDiasValidadeOrc     :=ReadString('Config','No Dias Validade','');

        TipoImpressora         :=ReadString('Impressora','Tipo da Impressora','');

        end;
     SistemIni.Free;
end;

procedure TFOrcamentos.FormDestroy(Sender: TObject);
begin
     DM.TOrcTemp.Destroy;
     DM.TOrcGradeTemp.Destroy;
end;

procedure TFOrcamentos.DBGridKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13
     then begin
          if HiWord(GetKeyState(VK_SHIFT)) <> 0
          then begin
               with (Sender as TDBGrid) do
               if selectedindex > 0 then
               selectedindex := selectedindex - 1
          else begin
               DataSource.DataSet.Prior;
               selectedindex := fieldcount - 1;
               end;
          end else begin
               with (Sender as TDBGrid) do
               if selectedindex < (fieldcount - 1)
               then selectedindex := selectedindex + 1
          else begin
               DataSource.DataSet.Next;
               selectedindex := 0;
               end;
          end;
          Key := #0
          end;
end;

procedure TFOrcamentos.DBGridEnter(Sender: TObject);
begin
     KeyPreview:=False;
end;

procedure TFOrcamentos.DBGridExit(Sender: TObject);
begin
     KeyPreview:=True;
end;

procedure TFOrcamentos.ECodProdutoChange(Sender: TObject);
begin
     if (ECodProduto.Text>='A') and (ECodProduto.Text<='Z')
     then begin
            Try
              if FPesquisaProdutos=Nil
              then Application.Createform(TFPesquisaProdutos,FPesquisaProdutos);
              FPesquisaprodutos.vConsultando:=True;
              FPesquisaprodutos.EPesquisa.text:=ECodProduto.Text;
              FPesquisaprodutos.Showmodal;
              FPesquisaprodutos.vConsultando:=False;
              if FPesquisaProdutos.ModalResult=mrOk
              then begin
                   nPesquisando:=True;

                   if Status_Serv='ON'
                   then ECodProduto.Text:=StrZero(DM.TPesqProdutoCODIGO.AsInteger,14)
                   else ECodProduto.Text:=StrZero(DM.TPesqProdutoTempCODIGO.AsInteger,14);

                   ECodProdutoExit(sender);

                   if (Sender is TEdit) then
                   TEdit(Sender).Color:=$0080FFFF;

                   ECodProduto.SetFocus;
                   end
              else begin
                   ECodProduto.Clear;
                   ECodProduto.SetFocus;
                   end;
            Finally
               FPesquisaProdutos.Release;
               FPesquisaProdutos:=Nil;
               end;
        end;
end;

procedure TFOrcamentos.BTPesqClienteClick(Sender: TObject);
begin
     Pesquisa_Clientes;
end;

procedure TFOrcamentos.ENomeClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_F5
     then BTPesqClienteClick(Sender);
end;

procedure TFOrcamentos.ECodVendedorExit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure TFOrcamentos.EObservacoesExit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure TFOrcamentos.EValidadeEnter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure TFOrcamentos.EValidadeExit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure TFOrcamentos.EVl_DescontoEnter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure TFOrcamentos.EVl_DescontoExit(Sender: TObject);
begin
     FechaFocu(Sender);

     if EVl_Desconto.Value < 0
     then begin
          Informa('O Valor de Desconto não pode ser negativo!');
          EVl_Desconto.Value:=0;
          end;
     ETotal.Value:=ESubTotal.Value - EVl_Desconto.Value;
     Try
       EPerc_Desconto.Value:=(EVl_Desconto.Value/ESubTotal.Value)*100;
     except
       end;   
end;

procedure TFOrcamentos.EPerc_DescontoEnter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure TFOrcamentos.EPerc_DescontoExit(Sender: TObject);
begin
     FechaFocu(Sender);

     if EPerc_Desconto.Value < 0
     then begin
          Informa('O Percentual de Desconto não pode ser negativo!');
          EPerc_Desconto.Value:=0;
          end;
     EVL_Desconto.Value:=(EPerc_Desconto.Value*ESubTotal.Value)/100;
     ETotal.Value:=ESubTotal.Value - EVl_Desconto.Value;
end;

procedure TFOrcamentos.BTPesqVendedorClick(Sender: TObject);
begin
     if Trim(ECodVendedor.Text)=''
     then begin
           Try
              FPEsquisaVendedores := TFPesquisaVendedores.Create(Self);
              FPesquisaVendedores.ShowModal;
              if FPesquisaVendedores.ModalResult=mrOk
              then begin
                   ECodVendedor.Text:=StrZero(DM.dsPesqVendedores.DataSet.FieldByName('CODIGO').Value,3);
                   ENOMEVENDEDOR.Text:=DM.dsPesqVendedores.DataSet.FieldByName('NOME').AsString;
                   DBGrid.SelectedIndex:=1;
                   end;
           Finally
              FreeAndNil(FPesquisaVendedores);
              end;
           end
     else begin
          DM.dsPesqVendedores.DataSet.Close;
          if Status_Serv='ON'
          then DM.dsPesqVendedores.DataSet:=DM.TPesqVendedor
          else begin
               CarregaVendoresOff;
               DM.dsPesqVendedores.DataSet:=DM.TPesqVendedorTemp;
               end;

          DM.dsPesqVendedores.DataSet.Open;
          if DM.dsPesqVendedores.DataSet.Locate('CODIGO',StrToInt(ECodVendedor.Text),[])
          then begin
               ECodVendedor.Text:=StrZero(DM.dsPesqVendedores.DataSet.FieldByName('CODIGO').Value,3);
               ENOMEVENDEDOR.Text:=DM.dsPesqVendedores.DataSet.FieldByName('NOME').AsString;
               DBGrid.SelectedIndex:=1;
               end
          else begin
               Informa('Vendedor Não Cadastrado!');
               ECodVendedor.SetFocus;
               end;
          DM.dsPesqVendedores.DataSet.Close;     
          end;
end;

procedure TFOrcamentos.ECodVendedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_F5
     then BTPesqVendedorClick(Sender);
end;

procedure TFOrcamentos.ECodVendedorKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key=#13
     then BtPesqVendedorClick(Sender);
end;

procedure TFOrcamentos.ECodProdutoExit(Sender: TObject);
begin
     if Trim(ECodProduto.Text)<>''
     then begin
           if Status_Serv='ON'
           then begin
                 With DM.QPesquisa
                 do begin
                    Close;
                    Sql.Clear;
                    Sql.Add('SELECT CODIGO,CODBARRA,REFERENCIA,DESCRICAO,PRECOVENDA,'+
                            'PRECOPRAZO,CUSTOFINAL FROM ESTOQUE');

                    if (DM.TEmpresaPADRAOBUSCA.Value='B')and(not nPesquisando)//Código de Barras
                    then begin
                         Sql.Add('WHERE CODBARRA = :PCODIGO');
                         ParamByName('PCODIGO').Value:=ECodProduto.Text;
                         end
                    else begin
                         Sql.Add('WHERE CODIGO = :PCODIGO');
                         ParamByName('PCODIGO').AsInteger:=StrToInt(ECodProduto.Text);
                         end;

                    Open;
                    if not IsEmpty
                    then begin
                         if not DM.TOrcTemp.Locate('CODPRODUTO',FieldByName('CODIGO').Value,[])
                         then DM.TOrcTemp.Append
                         else DM.TOrcTemp.Edit;
                         DM.TOrcTempCODPRODUTO.Value:=FieldByName('CODIGO').AsInteger;
                         DM.TOrcTempDESCRICAO.Value:=FieldByName('DESCRICAO').AsString;
                         DM.TOrcTempREFERENCIA.Value:=FieldByName('REFERENCIA').AsString;
                         if DM.TOrcTempQTDE.Value <= 0
                         then DM.TOrcTempQTDE.Value:=1;
                         if sPrecoTabela='V'
                         then DM.TOrcTempVL_UNIT.Value:=FieldByName('PRECOVENDA').AsFloat
                         else DM.TOrcTempVL_UNIT.Value:=FieldByName('PRECOPRAZO').AsFloat;
                         DM.TOrcTempVL_TOTAL.Value:=(DM.TOrcTempVL_UNIT.Value * DM.TOrcTempQTDE.Value);
                         DM.TOrcTempTABELA.Value:=sPrecoTabela;
                         DM.TOrcTempCUSTOFINAL.Value:=FieldByName('CUSTOFINAL').AsFloat;
                         DM.TOrcTemp.Post;

                         EQtde.ReadOnly:=false;
                         Consulta_Grade_Produto(FieldByName('CODIGO').Value);

                         DBGrid.SelectedIndex:=4;
                         DBGrid.SetFocus;
                         end
                    else begin
                         Informa('Produto não Cadastro!');
                         DBGrid.SelectedIndex:=1;
                         DBGrid.SetFocus;
                         ECodProduto.SetFocus;
                         end;
                    end;
               end//IF Status_Serv
          else begin
               if not DM.TPesqProdutoTemp.Active
               then CarregaEstoqueOff;

               if DM.TPesqProdutoTemp.Locate('CODIGO',StrToInt(ECodProduto.Text),[])
               then begin
                     if not DM.TOrcTemp.Locate('CODPRODUTO',StrToInt(ECodProduto.Text),[])
                     then DM.TOrcTemp.Append
                     else DM.TOrcTemp.Edit;
                     DM.TOrcTempCODPRODUTO.Value:=DM.TPesqProdutoTempCODIGO.Value;
                     DM.TOrcTempDESCRICAO.Value:=DM.TPesqProdutoTempDESCRICAO.Value;
                     DM.TOrcTempREFERENCIA.Value:=DM.TPesqProdutoTempREFERENCIA.Value;
                     if DM.TOrcTempQTDE.Value <= 0
                     then DM.TOrcTempQTDE.Value:=1;
                     if sPrecoTabela='V'
                     then DM.TOrcTempVL_UNIT.Value:=DM.TPesqProdutoTempPRECOVENDA.AsFloat
                     else DM.TOrcTempVL_UNIT.Value:=DM.TPesqProdutoTempPRECOPRAZO.AsFloat;
                     DM.TOrcTempVL_TOTAL.Value:=(DM.TOrcTempVL_UNIT.Value * DM.TOrcTempQTDE.Value);
                     DM.TOrcTempTABELA.Value:=sPrecoTabela;
                     DM.TOrcTempCUSTOFINAL.Value:=DM.TPesqProdutoTempCUSTOFINAL.AsFloat;
                     DM.TOrcTemp.Post;

                     EQtde.ReadOnly:=false;
                     Consulta_Grade_Produto(StrToInt(ECodProduto.Text));

                     DBGrid.SelectedIndex:=4;
                     DBGrid.SetFocus;
                     end
                else begin
                     Informa('Produto não Cadastrado!');
                     DBGrid.SelectedIndex:=1;
                     DBGrid.SetFocus;
                     ECodProduto.SetFocus;
                     end;
               end;
        AtualizaTotais;
        end;
end;

procedure TFOrcamentos.DBGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key in [8]
     then begin
          if EQtde.Visible
          then EQtde.SetFocus;
          if EVL_Unit.Visible
          then EVL_Unit.SetFocus;
          if EVl_Total.Visible
          then EVl_Total.SetFocus;
          end;
end;

procedure TFOrcamentos.EVl_TotalKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then begin
          nPesquisando:=False;

          DM.TOrcTemp.Edit;
          DM.TOrcTempVl_Total.Value:=EVL_Total.Value;
          DM.TOrcTempVL_Unit.Value:=(DM.TOrcTempVL_Total.Value / DM.TOrcTempQTDE.Value);
          DM.TOrcTemp.Post;

          AtualizaTotais;

          DM.TOrcTemp.Append;
          DBGrid.SelectedIndex:=1;
          ECodProduto.Clear;
          DBGrid.SetFocus;
          end;
end;

procedure TFOrcamentos.EQtdeExit(Sender: TObject);
begin
     if EQtde.Value <= 0
     then begin
          Informa('Quantidade Inválida!');
          EQtde.Value:=1;
          EQtde.SetFocus;
          end;

     DM.TOrcTemp.Edit;
     DM.TOrcTempQtde.Value:=EQtde.Value;
     DM.TOrcTempVL_TOTAL.Value:=(DM.TOrcTempVL_UNIT.Value * DM.TOrcTempQTDE.Value);
     DM.TOrcTemp.Post;
end;

procedure TFOrcamentos.EVl_UnitExit(Sender: TObject);
begin
     if EVl_Unit.Value <= 0
     then begin
          Informa('Valor Inválido!');
          EVL_Unit.Value:=DM.TOrcTempVL_UNIT.Value;
          EVL_Unit.SetFocus;
          end;

     DM.TOrcTemp.Edit;
     DM.TOrcTempVl_Unit.Value:=EVl_Unit.Value;
     DM.TOrcTempVL_TOTAL.Value:=(DM.TOrcTempVL_UNIT.Value * DM.TOrcTempQTDE.Value);
     DM.TOrcTemp.Post;
end;

procedure TFOrcamentos.EVl_TotalExit(Sender: TObject);
begin
     if EVl_Total.Value <= 0
     then begin
          Informa('Valor Inválido!');
          EVL_Total.Value:=DM.TOrcTempVL_TOTAL.Value;
          EVL_Total.SetFocus;
          end;
end;

procedure TFOrcamentos.ECodProdutoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=38
     then begin
          DM.TOrcTemp.Prior;
          DBGrid.SetFocus;
          end;
end;

procedure TFOrcamentos.ECodProdutoKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key=#13)and(Trim(ECodProduto.Text)='')
     then begin
          if DM.TOrcTemp.State in [dsInsert,dsEdit]
          then DM.TOrcTemp.Cancel;
          ECodProduto.Visible:=False;
          EObservacoes.SetFocus;
          end;
end;

procedure TFOrcamentos.EQtdeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=37
     then begin
          DBGrid.SelectedIndex:=0;
          EQtde.Visible:=False;
          ECodProduto.Visible:=True;
          ECodProduto.SetFocus;
          end;
end;

procedure TFOrcamentos.EQtdeKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then begin
          DBGrid.SelectedIndex:=5;
          DBGrid.SetFocus;
          end;
end;

procedure TFOrcamentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   sItem : String;
begin
     if Key=VK_Insert
     then begin
          if Confirma('Iniciar um Novo Orçamento?')=MrYes
          then begin
               FormShow(Sender);
               end;
          end;

     if Key=VK_F1
     then begin
          FAjuda := TFAjuda.Create(Self);
          FAjuda.ShowModal;
          FreeAndNil(FAjuda);
          end;

     if Key=VK_F2
     then begin
          sItem:=InputBox('Altera Item Genérico','Número do Item','');
          if Trim(sItem)<>''
          then begin
               Try
                 if DM.TOrcTemp.Locate('NUM_ITEM',StrToInt(sItem),[])
                 then begin
                      DBGrid.SelectedIndex:=1;
                      DBGrid.SetFocus;
                      end
                 else Informa('Número do Item não cadastrado!');
               except
                 Avisando('Número do Item Inválido!');
                 end;
               end;
          end;

     if Key=VK_F3
     then begin
          sItem:=InputBox('Exclui Item Genérico','Número do Item','');
          if Trim(sItem)<>''
          then begin
               Try
                 if DM.TOrcTemp.Locate('NUM_ITEM',StrToInt(sItem),[])
                 then begin
                      ExcluiItem;
                      end
                 else Informa('Número do Item não cadastrado!');
               except
                 Avisando('Número do Item Inválido!');
                 end;
              end;
          end;

     if (Key=VK_F4)
     then begin
          FPesquisaClientes := TFPesquisaClientes.Create(Self);
          FPesquisaClientes.ShowModal;
          FreeAndNil(FPesquisaClientes);
          end;

     if (Key=VK_F6)
     then begin
          FPesquisaProdutos := TFPesquisaProdutos.Create(Self);
          FPesquisaProdutos.ShowModal;
          FreeAndNil(FPesquisaProdutos);
          end;

     if (Shift = [ssAlt])//Classifica Coluna de Preço
     then begin
           if Key=80//P
           then begin
                 Try
                    if FClassificaPreco=Nil
                    then Application.CreateForm(TFClassificaPreco,FClassificaPreco);
                    FClassificaPreco.ShowModal;
                 Finally
                    FClassificaPreco.Release;
                    FClassificaPreco:=nil;
                    end;
                end;
           end;


     if (Shift = [ssAlt])//Consulta Orçamentos
     then begin
           if Key=67//C
           then begin
                if Status_Serv='ON'
                then begin
                     FConsultaOrcamentos := TFConsultaOrcamentos.Create(Self);
                     FConsultaOrcamentos.ShowModal;
                     FreeAndNil(FConsultaOrcamentos);
                     end
                else Avisando('A Consulta de Orçamentos pode ser realizada somente quando '+
                              'o servidor Central estiver Online!');
                end;
           end;

     if Key=VK_F8
     then begin
          FConfiguracao := TFConfiguracao.Create(Self);
          FConfiguracao.ShowModal;
          FreeAndNil(FConfiguracao); 
          end;


     if (Key=VK_F10)and(BtSalvar.Enabled)
     then BtSalvarClick(Sender);

     if (Key=VK_Escape)
     then BtCancelarClick(Sender);
end;

procedure TFOrcamentos.EVl_UnitKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then begin
          DBGrid.SelectedIndex:=6;
          DBGrid.SetFocus;
          end;
end;

procedure TFOrcamentos.FormActivate(Sender: TObject);
begin
     DBGrid.SelectedIndex:=1;
end;

procedure TFOrcamentos.TSalvaDadosOffTimer(Sender: TObject);
begin
     if FPesquisaProdutos=Nil
     then SalvaEstoqueOff;

     if FPesquisaClientes=Nil
     then SalvaClienteOff;
end;

procedure TFOrcamentos.BtSalvarClick(Sender: TObject);
var
   TD: TTransactionDesc;
   nTotal_Custo : Currency;
   iNumero_DAV, iCont, iNum_Caracteres, iCodOrcamento : Integer;
begin
     if Status_Serv='ON'
     then begin
           If Alltrim(ENomeCliente.Text)=''
           then begin
                Informa('Informe o Cliente!');
                ENomeCliente.SetFocus;
                Exit
                end;
           iNum_Caracteres:=ContaLetras(ENomeCliente.text);
           if iNum_Caracteres < 3
           then begin
                Informa('O Nome do Cliente deve ter no minimo 3 Caracteres!');
                ENomeCliente.SetFocus;
                Exit
                end;
           if Trim(ECodVendedor.Text)=''
           then begin
                Informa('Informe o Nome do Vendedor!!');
                ECodVendedor.SetFocus;
                Exit
                end;
           DM.TPesqVendedor.Open;
           DM.TPesqVendedor.Refresh;
           if not DM.TPesqVendedor.Locate('CODIGO',StrToInt(ECodVendedor.Text),[])
           then begin
                Informa('Vendedor não cadastrado!');
                ECodVendedor.SetFocus;
                Exit
                end;
           if DM.TOrcTemp.RecordCount = 0
           then begin
                Informa('Para Salvar o Orçamento, lance pelo menos um item!!');
                DBGrid.SelectedIndex:=1;
                DBGrid.SetFocus;
                Exit
                end;
           if EValidade.Text='  /  /    '
           then begin
                Informa('Informe a Data de Validade do Orçamento!');
                EValidade.SetFocus;
                Exit
                end;
           if EVl_Desconto.Value > ESubTotal.Value
           then begin
                Informa('O Desconto não pode ser maior que o SubTotal do Orçamento!');
                EVl_Desconto.Value:=0;
                EVl_Desconto.SetFocus;
                Exit
                end;

           if Confirma('Deseja Salvar este Orçamento?')=mrYes
           then begin
                AC;
                FMsg:=TFMsg.Create(Self);
                FMsg.PMensagem.Caption:='Salvando o Orçamento! Aguarde um momento...';
                FMsg.Show;
                FMsg.Repaint;

                TD.TransactionId := 1;
                TD.IsolationLevel := xilREADCOMMITTED;
                DM.SqlConnection.StartTransaction(TD);
              Try
                iNumero_DAV:=NewGen('GEN_DAV_PAF',DM.SQLConnection);

                if Status_Orcamento='ALTER'
                then begin
                     DM.TDavAlterando.First;
                     While not DM.TDavAlterando.Eof
                     do begin
                        MesclaOrcamentos(DM.TDavAlterandoNUMERO_DAV.Value,iNumero_DAV);
                        DM.TDavAlterando.Next;
                        end;
                     end;

                DM.TOrcamento.Close;
                DM.TOrcamento.Params[0].AsInteger:=-1;
                DM.TOrcamento.Open;
                DM.TOrcamento.Append;
                DM.TOrcamentoDTEMISSAO.AsDateTime:=Now;
                DM.TOrcamentoHORA.AsDateTime:=Now;
                DM.TOrcamentoCODCLIENTE.AsInteger:=iCodCliente;
                DM.TOrcamentoNOMECLIENTE.AsString:=ENomeCliente.Text;
                DM.TOrcamentoCODVENDEDOR.AsInteger:=StrToInt(ECodVendedor.Text);
                DM.TOrcamentoSUBTOTAL.AsCurrency:=ESubTotal.Value;
                DM.TOrcamentoDESCONTO.AsCurrency:=EVl_Desconto.Value;
                DM.TOrcamentoVALOR.AsCurrency:=ETotal.Value;
                DM.TOrcamentoTOTALCUSTO.AsCurrency:=0;
                DM.TOrcamentoOBS.AsString:=EObservacoes.Text;
                DM.TOrcamentoVALIDADE.AsDateTime:=EValidade.Date;
                DM.TOrcamentoNUMERO_DAV.AsInteger:=iNumero_DAV;
                if Status_Orcamento='ALTER'
                then begin
                     if DM.TDavAlterando.RecordCount = 1
                     then DM.TOrcamentoREF_NUM_DAV.AsInteger:=DM.TDavAlterandoNUMERO_DAV.Value;
                     end;

                iCont:=0;
                nTotal_Custo:=0;
                DM.TOrcTemp.DisableControls;
                DM.TOrcTemp.First;
                While not DM.TOrcTemp.Eof
                do begin
                   Inc(iCont);
                   DM.TItemOrcamento.Append;
                   DM.TItemOrcamentoCONTROLE.AsInteger:=iCont;
                   DM.TItemOrcamentoCODPRODUTO.AsInteger:=DM.TOrcTempCODPRODUTO.AsInteger;
                   DM.TItemOrcamentoDESCRICAO.AsString:=DM.TOrcTempDESCRICAO.AsString;
                   DM.TItemOrcamentoQTDE.AsCurrency:=DM.TOrcTempQTDE.AsCurrency;
                   DM.TItemOrcamentoPRECO.AsCurrency:=DM.TOrcTempVL_UNIT.AsCurrency;
                   DM.TItemOrcamentoTOTALITEN.AsCurrency:=DM.TOrcTempVL_TOTAL.AsCurrency;
                   DM.TItemOrcamentoCUSTO.AsCurrency:=0;
                   DM.TItemOrcamentoTABELA.AsString:=DM.TOrcTempTABELA.AsString;
                   DM.TItemOrcamentoMAODEOBRA.AsString:='N';
                   DM.TItemOrcamentoCUSTO.AsCurrency:=(DM.TOrcTempQTDE.AsCurrency * DM.TOrcTempCUSTOFINAL.AsCurrency);
                   DM.TItemOrcamento.Post;
                   nTotal_Custo:=nTotal_Custo + DM.TItemOrcamentoCUSTO.AsCurrency;

                   DM.TOrcTemp.Next;
                   end;
                DM.TOrcamentoTOTALCUSTO.AsCurrency:=nTotal_Custo;
                DM.TOrcamento.Post;
                DM.TOrcamento.ApplyUpdates(-1);
                iCodOrcamento:=DM.TOrcamentoCODIGO.AsInteger;

                if DM.TOrcGradeTemp.RecordCount > 0
                then begin
                     DM.TOrcGradeTemp.DisableControls;
                     DM.TOrcGradeTemp.First;
                     While not DM.TOrcGradeTemp.Eof
                     do begin
                        DM.TOrcamento_Grade.Close;
                        DM.TOrcamento_Grade.Params[0].AsInteger:=-1;
                        DM.TOrcamento_Grade.Open;
                        DM.TOrcamento_Grade.Append;
                        DM.TOrcamento_GradeCOD_ORCAMENTO.AsInteger:=DM.TOrcamentoCODIGO.AsInteger;
                        DM.TOrcamento_GradeCOD_GRADE.AsInteger:=DM.TOrcGradeTempCOD_GRADE.Value;
                        DM.TOrcamento_GradeCOD_PRODUTO.AsInteger:=DM.TOrcGradeTempCOD_PRODUTO.Value;
                        DM.TOrcamento_GradeQTDE.AsCurrency:=DM.TOrcGradeTempQTDE.Value;
                        DM.TOrcamento_GradeCOD_COR.AsInteger:=DM.TOrcGradeTempCOD_COR.Value;
                        DM.TOrcamento_GradeCOD_TAMANHO.AsInteger:=DM.TOrcGradeTempCOD_TAMANHO.Value;
                        DM.TOrcamento_Grade.Post;
                        DM.TOrcamento_Grade.ApplyUpdates(-1);

                        DM.TOrcGradeTemp.Next;
                        end;
                     DM.TOrcGradeTemp.EnableControls;
                end;

                DM.SQLConnection.Commit(TD);

                FreeAndNil(FMsg);

                DC;
              Except
                DC;
                DM.TOrcTemp.EnableControls;
                FreeAndNil(FMsg);
                DM.SQLConnection.RollBack(TD);
                InformaError('Não foi possivél Salvar este Orçamento!!!');
                Raise;
                end;
          DM.TOrcTemp.EnableControls;

          if Confirma('Confirma a Impressão do Orçamento?')=mrYes
          then begin
               ImprimiOrcamento(iCodOrcamento);
               end;

          FormShow(Sender);
          end;//If Pergunta
      end//If Status_Serv
     else begin
          Avisando('Este Orçamento não pode ser Salvo, porque o servidor central '+
                   'esta offLine no momento. Aguarde até que a conexão volte, ou ligue '+
                   'para o suporte técnico para solucionar este problema!');
          ENomeCliente.SetFocus;        
          end;
end;

procedure TFOrcamentos.dsOrcTempDataChange(Sender: TObject; Field: TField);
begin
     if DM.TOrcTemp.RecordCount = 0
     then begin
          BtSalvar.Enabled:=False;
          LNumItens.Caption:='0';
          end
     else begin
          if Status_Serv='ON'
          then BtSalvar.Enabled:=True
          else BtSalvar.Enabled:=False;
          LNumItens.Caption:=StrZero(DM.TOrcTemp.RecordCount,3);
          end;
end;

procedure TFOrcamentos.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key=VK_Delete)and(DM.TOrcTemp.RecordCount > 0)
     then begin
          ExcluiItem;
          end;
end;


procedure TFOrcamentos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if Confirma('Deseja Fechar a Aplicação?')=mrYes
     then CanClose:=True
     else CanClose:=False;

end;

procedure TFOrcamentos.BtCancelarClick(Sender: TObject);
begin
     Close;
end;

procedure TFOrcamentos.ECodVendedorEnter(Sender: TObject);
begin
     EntraFocu(Sender);
     VerificaClienteCadastrado(iCodCliente);
end;

procedure TFOrcamentos.ENomeClienteChange(Sender: TObject);
begin
     if Trim(ENomeCliente.Text)=''
     then LStatusCliente.Caption:='';
end;

procedure TFOrcamentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if FileExists(Dir_Arq_Locais+'Orc.xml')
     then begin
          if Status_Orcamento='NEW'
          then begin
               if Confirma('Deseja Salvar este Orçamento que esta na Tela?')=mrNo
               then begin
                    DM.TOrcTemp.Close;
                    DM.TOrcGradeTemp.Close;

                    DeleteFile(Dir_Arq_Locais+'Orc.xml');
                    DeleteFile(Dir_Arq_Locais+'OrcGrade.xml');
                    end;
               end
          else begin
               DM.TOrcTemp.Close;
               DM.TOrcGradeTemp.Close;
              
               DeleteFile(Dir_Arq_Locais+'Orc.xml');
               DeleteFile(Dir_Arq_Locais+'OrcGrade.xml');
               end;
          end;
end;

end.
