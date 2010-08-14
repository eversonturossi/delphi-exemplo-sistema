unit UConsultaClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, StdCtrls, Mask, Buttons, DB, ToolWin;

type
  TFPesquisaClientes = class(TForm)
    SB: TStatusBar;
    DBGrid: TDBGrid;
    ToolBar1: TToolBar;
    GroupBox1: TGroupBox;
    BtConsulta: TSpeedButton;
    CPesquisa: TComboBox;
    EPesquisa: TMaskEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EPesquisaChange(Sender: TObject);
    procedure BtConsultaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EPesquisaEnter(Sender: TObject);
    procedure EPesquisaExit(Sender: TObject);
    procedure EPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPesquisaClientes: TFPesquisaClientes;

implementation

uses UBarsa, UDM, UOrcamento;

{$R *.dfm}

procedure TFPesquisaClientes.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FPesquisaClientes,Key);
end;

procedure TFPesquisaClientes.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if not odd(DM.dsPesquisaClientes.DataSet.RecNo)
    then begin
         if not (gdselected in state)
         then begin
              DBGrid.Canvas.Brush.Color := $00F0F0F0;
              DBGrid.Canvas.FillRect(Rect);
              DBGrid.DefaultDrawDataCell(rect, Column.Field, State);
              end;
         end;
end;

procedure TFPesquisaClientes.EPesquisaChange(Sender: TObject);
begin
     if Status_Serv='ON'
     then begin
          if Auto_Pesq_Clientes='S'
          then BtConsultaClick(Sender);
          end
     else begin
          if DM.TPesqClienteTemp.Active
          then begin
               if CPesquisa.ItemIndex=0
               then DM.TPesqClienteTemp.IndexFieldNames:='NOME'
               else if CPesquisa.ItemIndex=1
               then DM.TPesqClienteTemp.IndexFieldNames:='CODIGO';

               DM.TPesqClienteTemp.FindNearest([EPesquisa.Text]);
               end;
          end;
end;

procedure TFPesquisaClientes.BtConsultaClick(Sender: TObject);
begin
     AC;
     if CPesquisa.ItemIndex = 0
     then begin
          DM.TPesqCliente.Close;
          DM.TPesqCliente.Params[0].AsString:=EPesquisa.Text+'%';
          DM.TPesqCliente.Params[1].AsInteger:=-1;
          DM.TPesqCliente.Params[2].AsString:='N';
          DM.TPesqCliente.IndexFieldNames:='NOME';
          DM.TPesqCliente.Open;
          end
     else begin
          DM.TPesqCliente.Close;
          DM.TPesqCliente.Params[0].AsString:='-1';
          DM.TPesqCliente.Params[1].AsInteger:=StrToInt(EPesquisa.Text);
          DM.TPesqCliente.Params[2].AsString:='N';
          DM.TPesqCliente.IndexFieldNames:='NOME';
          DM.TPesqCliente.Open;
          end;
     SB.Panels[0].Text:='Ocorrências encontradas: '+StrZero(DM.TPesqCliente.RecordCount,6);
     DC;
end;

procedure TFPesquisaClientes.FormShow(Sender: TObject);
begin
     DBGrid.SelectedIndex:=1;

     if Status_Serv='ON'
     then begin
           BtConsulta.Enabled:=True;
           DM.dsPesquisaClientes.DataSet:=DM.TPesqCliente;
           if PackedRecords_Clientes='-1'
           then begin
                DM.TPesqCliente.FetchOnDemand:=True;
                DM.TPesqCliente.PacketRecords:=-1;
                end
           else begin
                DM.TPesqCliente.FetchOnDemand:=False;
                DM.TPesqCliente.PacketRecords:=StrToInt(PackedRecords_Clientes)
                end;
           end
     else begin
          BtConsulta.Enabled:=False;
          CarregaClientesOff;
          DM.dsPesquisaClientes.DataSet:=DM.TPesqClienteTemp;
          end;

     CPesquisa.ItemIndex:=0;
     EPesquisa.SetFocus;
     EPesquisa.Selstart:= Length(EPesquisa.text);
end;

procedure TFPesquisaClientes.EPesquisaEnter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure TFPesquisaClientes.EPesquisaExit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure TFPesquisaClientes.EPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=40  // seta para baixo
     then DBGrid.SetFocus;
end;

procedure TFPesquisaClientes.EPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then begin
          if Status_Serv='ON'
          then begin
               if Auto_Pesq_Clientes='S'
               then DBGrid.SetFocus
               else BtConsultaClick(Sender);
               end
          else DBGrid.SetFocus;
          end;
end;

procedure TFPesquisaClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_Escape
     then Close;
end;

procedure TFPesquisaClientes.DBGridKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then ModalResult:=mrOk;
end;

end.
