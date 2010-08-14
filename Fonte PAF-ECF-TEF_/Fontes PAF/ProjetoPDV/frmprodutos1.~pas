unit frmprodutos1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, DBCtrls, ComCtrls, DBClient,
  DB, Buttons, DBTables, Grids, DBGrids, RXCtrls;

type
  TFCadProdutos = class(TForm)
    btn_salvar: TBitBtn;
    btn_sair: TBitBtn;
    dsProduto: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    BTPesqProduto: TSpeedButton;
    Label8: TLabel;
    BTPesqSecao: TSpeedButton;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    BTPesqGrupo: TSpeedButton;
    BTPesqUnidade: TSpeedButton;
    BTPesqMarca: TSpeedButton;
    BTPesqTributo: TSpeedButton;
    Label10: TLabel;
    Label11: TLabel;
    LStatus: TRxLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBMemo1: TDBMemo;
    ECodigo: TEdit;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    Label16: TLabel;
    DBEdit1: TDBEdit;
    Label18: TLabel;
    DBEdit14: TDBEdit;
    Label19: TLabel;
    DBEdit15: TDBEdit;
    Label20: TLabel;
    DBEdit16: TDBEdit;
    Label21: TLabel;
    DBEdit17: TDBEdit;
    procedure btn_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ECodigoEnter(Sender: TObject);
    procedure ECodigoExit(Sender: TObject);
    procedure BTPesqProdutoClick(Sender: TObject);
    procedure ECodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ECodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_salvarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BTPesqUnidadeClick(Sender: TObject);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BTPesqGrupoClick(Sender: TObject);
    procedure DBEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BTPesqMarcaClick(Sender: TObject);
    procedure DBEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BTPesqTributoClick(Sender: TObject);
    procedure DBEdit13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBMemo1Enter(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure ECodigoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BTPesqSecaoClick(Sender: TObject);
  private
    { Private declarations }
    procedure BuscaProduto;
  public
    { Public declarations }
  end;

var
  FCadProdutos: TFCadProdutos;

Implementation

uses dmsyndAC, UBarsa, frmconsultaprodutospdv, UCadUnidades, UCadGrupos,
     UCadMarca, frmconsultaaliquotas, USecao, UPAF_ECF, lite_frmprincipal;

{$R *.dfm}

procedure TFCadProdutos.BuscaProduto;
begin
     vTabelaProduto.Close;
     vTabelaProduto.Params[0].AsInteger:=StrToInt(ECodigo.text);
     vTabelaProduto.Open;
     if vTabelaProduto.IsEmpty
     then begin
          Informa('Código não cadastrado!');
          LStatus.Caption:='';
          ECodigo.SetFocus;
          end
     else begin
          LStatus.Caption:='< Alterando >';
          vTabelaProduto.Edit;

          DM.TUsuario.Open;
          DM.TUsuario.Refresh;
          DM.TUsuario.Locate('ID',n_Usuario,[]);
          if DM.TUsuarioPE_ALTERA_ESTOQUE.AsInteger=0
          then Enabled_False_DBEdit(FCadProdutos)
          else Enabled_True_DBEdit(FCadProdutos);

          DM.TPesqGradeProd.Close;
          DM.TPesqGradeProd.Params[0].AsInteger:=vTabelaProduto.FieldByName('CODIGO').Value;
          DM.TPesqGradeProd.Open;
          if DM.TPesqGradeProd.RecordCount > 0
          then DBEdit11.Enabled:=False
          else DBEdit11.Enabled:=True;
          DM.TPesqGradeProd.Close;
          end;
end;

procedure TFCadProdutos.btn_sairClick(Sender: TObject);
begin
     Close;
end;

procedure TFCadProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=VK_Escape
     then btn_SairClick(Sender);

     if Key=VK_F10
     then begin
          if vTabelaProduto.State in [dsInsert,dsEdit]
          then btn_SalvarClick(Sender);
          end;
end;

procedure TFCadProdutos.DBEdit1Enter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure TFCadProdutos.DBEdit1Exit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure TFCadProdutos.FormShow(Sender: TObject);
begin
     if ServidorRemoto='ON'
     then dsProduto.DataSet:=DM.TProduto
     else dsProduto.DataSet:=DM.TProdutoLocal;

     vTabelaProduto.Close;
     
     ECodigo.Clear;
     LStatus.Caption:='';
     ECodigo.SetFocus;
end;

procedure TFCadProdutos.ECodigoEnter(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=$0080FFFF;
end;

procedure TFCadProdutos.ECodigoExit(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=clWhite;
end;

procedure TFCadProdutos.BTPesqProdutoClick(Sender: TObject);
begin
      Try
        if FPesquisaProdutos=Nil
        then Application.CreateForm(TFPesquisaProdutos,FPesquisaProdutos);
        FPesquisaProdutos.ShowModal;
        if FPesquisaProdutos.ModalResult=mrOk
        then begin
             ECodigo.Text:=StrZero(DM.TPesqProdutoCodigo.AsInteger,14);
             BuscaProduto;
             end;
     finally
        FPesquisaProdutos.Release;
        FPesquisaProdutos:=Nil;
        end;
end;

procedure TFCadProdutos.ECodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_F5
     then BTPesqProdutoClick(Sender);
end;

procedure TFCadProdutos.ECodigoKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key=#13)and(Trim(ECodigo.Text)<>'')
     then BuscaProduto
     else begin
          vTabelaProduto.Close;
          vTabelaProduto.Params[0].AsInteger:=-1;
          vTabelaProduto.Open;
          vTabelaProduto.Append;
          vTabelaProduto.FieldByName('IAT').AsString:='A';
          vTabelaProduto.FieldByName('IPPT').AsString:='T';
          LStatus.Caption:='< Incluindo >';
          end;
end;

procedure TFCadProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if vTabelaProduto.State in [dsInsert,dsEdit]
     then begin
          vTabelaProduto.Cancel;
          vTabelaProduto.CancelUpdates;
          end;
     vTabelaProduto.Close;
end;

procedure TFCadProdutos.btn_salvarClick(Sender: TObject);
begin
     if (FrmPrincipal.Depende_Retaguarda='S')and(ServidorRemoto='ON')
     then begin
           if Confirma('Confirma as Alterações?')=mryes
           then begin
                 vTabelaProduto.Edit;
                 vTabelaProduto.Post;
                 vTabelaProduto.ApplyUpdates(0);
                 vTabelaProduto.Close;

                 LStatus.Caption:='';
                 ECodigo.Clear;
                 ECodigo.Enabled:=True;
                 ECodigo.SetFocus;
                 end;
           end
     else begin
          Informa('Não é permitido Incluir/Alterar produtos com o servidor remoto OffLine! Tente mais Tarde!!');
          Close;
          end;
end;

procedure TFCadProdutos.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FCadProdutos,Key);
end;

procedure TFCadProdutos.BTPesqUnidadeClick(Sender: TObject);
begin
     Try
        if FCadUnidades=Nil
        then Application.CreateForm(TFCadUnidades,FCadUnidades);
        FCadUnidades.vConsulta:=True;
        FCadUnidades.ShowModal;
        FCadUnidades.vConsulta:=False;
        if FCadUnidades.ModalResult=mrOk
        then vTabelaProduto.FieldByName('MED').AsString:=DM.TUnidadesABREVIATURA.AsString;
     Finally
        FCadUnidades.Release;
        FCadUnidades:=Nil;
        end;
end;

procedure TFCadProdutos.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_F5
     then BTPesqUnidadeClick(Sender);
end;

procedure TFCadProdutos.BTPesqGrupoClick(Sender: TObject);
begin
     Try
        if FCadGrupos=Nil
        then Application.CreateForm(TFCadGrupos,FCadGrupos);
        FCadGrupos.vConsulta:=True;
        FCadGrupos.ShowModal;
        FCadGrupos.vConsulta:=False;
        if FCadGrupos.ModalResult=mrOk
        then vTabelaProduto.FieldByName('CODGRUPO').AsInteger:=DM.TGruposCODIGO.AsInteger;
     Finally
        FCadGrupos.Release;
        FCadGrupos:=Nil;
        end;
end;

procedure TFCadProdutos.DBEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_F5
     then BTPesqGrupoClick(Sender);
end;

procedure TFCadProdutos.DBEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_F5
     then BTPesqSecaoClick(Sender);
end;

procedure TFCadProdutos.BTPesqMarcaClick(Sender: TObject);
begin
     Try
        if FCadMarca=Nil
        then Application.CreateForm(TFCadMarca,FCadMarca);
        FCadMarca.vConsulta:=True;
        FCadMarca.ShowModal;
        FCadMarca.vConsulta:=False;
        if FCadMarca.ModalResult=mrOk
        then vTabelaProduto.FieldByName('CODMARCA').AsInteger:=DM.TMarcaCODIGO.AsInteger;
     Finally
        FCadMarca.Release;
        FCadMarca:=Nil;
        end;
end;

procedure TFCadProdutos.DBEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_F5
     then BTPesqMarcaClick(Sender);
end;

procedure TFCadProdutos.BTPesqTributoClick(Sender: TObject);
begin
     Try
        if fconaliquotas=Nil
        then Application.CreateForm(Tfconaliquotas,fconaliquotas);
        fconaliquotas.vConsulta:=True;
        fconaliquotas.ShowModal;
        fconaliquotas.vConsulta:=False;
        if fconaliquotas.ModalResult=mrOk
        then vTabelaProduto.FieldByName('CODALIQUOTA').AsInteger:=DM.T_TributacaoCODIGO.AsInteger;
     Finally
        fconaliquotas.Release;
        fconaliquotas:=Nil;
        end;
end;

procedure TFCadProdutos.DBEdit13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_F5
     then BTPesqTributoClick(Sender);
end;

procedure TFCadProdutos.DBMemo1Enter(Sender: TObject);
begin
     if (Sender is TDBMemo) then
     TDBMemo(Sender).Color:=$0080FFFF;
     DBMemo1.Selstart:= Length(DBMemo1.text);
end;

procedure TFCadProdutos.DBMemo1Exit(Sender: TObject);
begin
      if (Sender is TDBMemo) then
     TDBMemo(Sender).Color:=clWhite;
end;

procedure TFCadProdutos.DBMemo1KeyPress(Sender: TObject; var Key: Char);
begin
     Key := AnsiUpperCase(Key)[1];
     if Key=#13
     then btn_SalvarClick(Sender);
end;

procedure TFCadProdutos.ECodigoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=40  // seta para baixo
     then FCadProdutos.Perform(WM_NextDlgCtl,0,0);

     if key=38  // seta para cima
     then FCadProdutos.Perform(WM_NextDlgCtl,1,0);
end;

procedure TFCadProdutos.BTPesqSecaoClick(Sender: TObject);
begin
     Try
        if FCadSecao=Nil
        then Application.CreateForm(TFCadSecao,FCadSecao);
        FCadSecao.vConsulta:=True;
        FCadSecao.ShowModal;
        FCadSecao.vConsulta:=False;
        if FCadSecao.ModalResult=mrOk
        then vTabelaProduto.FieldByName('CODSECAO').AsInteger:=DM.TSecaoCODIGO.AsInteger;
     Finally
        FCadSecao.Release;
        FCadSecao:=Nil;
        end;
end;

end.

