unit frmcadCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, Mask, DBCtrls, DBTables,
  ComCtrls, Grids, DBGrids, RXCtrls;

type
  TFCadCliente = class(TForm)
    PageControl1: TPageControl;
    TDados: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    ECodigo: TEdit;
    BTPesqClientes: TSpeedButton;
    btn_salvar: TBitBtn;
    btn_sair: TBitBtn;
    dsCadCliente: TDataSource;
    Label15: TLabel;
    LStatus: TRxLabel;
    procedure btn_sairClick(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ECodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BTPesqClientesClick(Sender: TObject);
    procedure ECodigoEnter(Sender: TObject);
    procedure ECodigoExit(Sender: TObject);
    procedure ECodigoKeyPress(Sender: TObject; var Key: Char);
    procedure ECodigoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBMemo1Enter(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure BuscaCliente;
  public
    { Public declarations }
  end;

var
  FCadCliente: TFCadCliente;

implementation

uses dmsyndAC, frmpesquisacliente, UBarsa, UPAF_ECF, lite_frmprincipal;

{$R *.dfm}

procedure TFCadCliente.BuscaCliente;
begin
     DM.TClientes.Close;
     DM.TClientes.Params[0].AsInteger:=StrToInt(ECodigo.text);
     DM.TClientes.Open;
     if DM.TClientes.IsEmpty
     then begin
          Informa('Código não cadastrado!');
          LStatus.Caption:='';
          ECodigo.SetFocus;
          end
     else begin
          LStatus.Caption:='< Alterando >';
          DM.TClientes.Edit;

          DM.TUsuario.Open;
          DM.TUsuario.Refresh;
          DM.TUsuario.Locate('ID',n_Usuario,[]);
          if DM.TUsuarioPE_ALTERA_CLIENTE.AsInteger=0
          then Enabled_False_DBEdit(FCadCliente)
          else Enabled_True_DBEdit(FCadCliente);
          end;
end;

procedure TFCadCliente.btn_sairClick(Sender: TObject);
begin
   close;
end;

procedure TFCadCliente.DBEdit1Enter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure TFCadCliente.DBEdit1Exit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure TFCadCliente.btn_salvarClick(Sender: TObject);
begin
     if (FrmPrincipal.Depende_Retaguarda='S')and(ServidorRemoto='ON')
     then begin
           if Confirma('Confirma as Alterações?')=mryes
           then begin
                 DM.TClientes.Edit;
                 DM.TClientes.Post;
                 DM.TClientes.ApplyUpdates(0);
                 DM.TClientes.Close;

                 LStatus.Caption:='';
                 ECodigo.Clear;
                 ECodigo.Enabled:=True;
                 ECodigo.SetFocus;
                 end;
           end
     else begin
          Informa('Não é permitido Incluir/Alterar clientes com o servidor remoto OffLine! Tente mais Tarde!!');
          Close;
          end;
end;

procedure TFCadCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FCadCliente,Key);
end;

procedure TFCadCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if Key=VK_F10
      then begin
           if DM.TClientes.State in [dsInsert,dsEdit]
           then BTN_SalvarClick(Sender);
           end;
           
      if Key=VK_Escape
      then BTN_SairClick(Sender);
end;

procedure TFCadCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if DM.TClientes.State in [dsInsert,dsEdit]
     then begin
          DM.TClientes.Cancel;
          DM.TClientes.CancelUpdates;
          end;
     DM.TClientes.Close;
end;

procedure TFCadCliente.FormShow(Sender: TObject);
begin
     DM.TClientes.Close;
     LStatus.Caption:='';
     ECodigo.Clear;
     ECodigo.SetFocus;
end;

procedure TFCadCliente.ECodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_F5
     then BTPesqClientesClick(Sender);
end;

procedure TFCadCliente.BTPesqClientesClick(Sender: TObject);
begin
     Try
        if FPesquisaCliente=Nil
        then Application.CreateForm(TFPesquisaCliente,FPesquisaCliente);
        FPesquisaCliente.ShowModal;
        if FPesquisaCliente.ModalResult=mrOk
        then begin
             ECodigo.Text:=StrZero(DM.TPesqClienteCodigo.AsInteger,5);
             BuscaCliente;
             end;
     finally
        FPesquisaCliente.Release;
        FPesquisaCliente:=Nil;
        end;
end;

procedure TFCadCliente.ECodigoEnter(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=$0080FFFF;
end;

procedure TFCadCliente.ECodigoExit(Sender: TObject);
begin
     if (Sender is TEdit) then
     TEdit(Sender).Color:=clWhite;
end;

procedure TFCadCliente.ECodigoKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key=#13)and(Trim(ECodigo.Text)<>'')
     then BuscaCliente
     else begin
          DM.TClientes.Close;
          DM.TClientes.Params[0].AsInteger:=-1;
          DM.TClientes.Open;
          DM.TClientes.Append;
          LStatus.Caption:='< Incluindo >';
          end;
end;

procedure TFCadCliente.ECodigoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=40  // seta para baixo
     then FCadCliente.Perform(WM_NextDlgCtl,0,0);

     if key=38  // seta para cima
     then FCadCliente.Perform(WM_NextDlgCtl,1,0);
end;

procedure TFCadCliente.DBMemo1Enter(Sender: TObject);
begin
     if (Sender is TDBMemo) then
     TDBMemo(Sender).Color:=$0080FFFF;
     DBMemo1.Selstart:= Length(DBMemo1.text);
end;

procedure TFCadCliente.DBMemo1Exit(Sender: TObject);
begin
     if (Sender is TDBMemo) then
     TDBMemo(Sender).Color:=clWhite;
end;

procedure TFCadCliente.DBMemo1KeyPress(Sender: TObject; var Key: Char);
begin
     Key := AnsiUpperCase(Key)[1];
     if Key=#13
     then btn_SalvarClick(Sender);
end;

end.

