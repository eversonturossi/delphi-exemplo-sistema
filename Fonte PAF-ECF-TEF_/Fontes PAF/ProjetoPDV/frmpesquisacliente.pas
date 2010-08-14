unit frmpesquisacliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, ExtCtrls, Mask, ComCtrls,
  Buttons;

type
  TFPesquisaCliente = class(TForm)
    DBGrid: TDBGrid;
    dsPesqCliente: TDataSource;
    SB: TStatusBar;
    Panel1: TPanel;
    CPesquisa: TComboBox;
    EPesquisa: TMaskEdit;
    BtConsulta: TSpeedButton;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EPesquisaEnter(Sender: TObject);
    procedure EPesquisaExit(Sender: TObject);
    procedure CPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure EPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtConsultaClick(Sender: TObject);
    procedure EPesquisaChange(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPesquisaCliente: TFPesquisaCliente;

implementation

uses dmsyndAC, UPAF_ECF, UBarsa, lite_frmprincipal, frmcadCliente;

{$R *.dfm}

procedure TFPesquisaCliente.FormActivate(Sender: TObject);
begin
    EPesquisa.Clear;
    CPesquisa.ItemIndex:=0;
    EPesquisa.SetFocus;
end;

procedure TFPesquisaCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_F3
     then begin
          EPesquisa.Clear;
          CPesquisa.ItemIndex:=0;
          EPesquisa.SetFocus;
          end
     else if Key=VK_F4
     then begin
          EPesquisa.Clear;
          CPesquisa.ItemIndex:=1;
          EPesquisa.SetFocus;
          end
     else if Key=VK_F5
     then begin
          EPesquisa.Clear;
          CPesquisa.ItemIndex:=2;
          EPesquisa.SetFocus;
          end
     else if Key=VK_F6
     then begin
          EPesquisa.Clear;
          CPesquisa.ItemIndex:=3;
          EPesquisa.SetFocus;
          end;

     if Key=VK_Insert
     then begin
          if Confirma('Deseja Cadastrar um novo Cliente?')=mrYes
          then begin
               Try
                  if FCadCliente=Nil
                  then Application.CreateForm(TFCadCliente,FCadCliente);
                  FCadCliente.ShowModal; 
               Finally
                  FCadCliente.Release;
                  FCadCliente:=Nil;
                  end;
               end;
          end;

     if key = VK_ESCAPE
     then fpesquisacliente.Close;
end;

procedure TFPesquisaCliente.EPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key=#13
     then begin
          if FrmPrincipal.Auto_Pesq_Clientes='S'
          then DBGrid.SetFocus
          else BtConsultaClick(Sender);
          end;
end;

procedure TFPesquisaCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FPesquisaCliente,Key);
end;

procedure TFPesquisaCliente.DBGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (key >= 49) and (key <= 105)
     then begin
          EPesquisa.Text:='';
          EPesquisa.text := EPesquisa.Text+Chr(key);
          EPesquisa.SetFocus;
          EPesquisa.Selstart:= Length(EPesquisa.Text);
          end;
end;

procedure TFPesquisaCliente.EPesquisaEnter(Sender: TObject);
begin
     if (Sender is TMaskEdit) then
     TMaskEdit(Sender).Color:=$0080FFFF;
end;

procedure TFPesquisaCliente.EPesquisaExit(Sender: TObject);
begin
     if (Sender is TMaskEdit) then
     TMaskEdit(Sender).Color:=clWindow;
end;

procedure TFPesquisaCliente.CPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then Key:=#0;
end;

procedure TFPesquisaCliente.EPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=40  // seta para baixo
     then DBGrid.SetFocus;
end;

procedure TFPesquisaCliente.DBGridKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then ModalResult:=mrOk;
end;

procedure TFPesquisaCliente.FormDestroy(Sender: TObject);
begin
     DM.TPesqCliente.Close;
end;

procedure TFPesquisaCliente.FormShow(Sender: TObject);
begin
     if FrmPrincipal.Reg_Clientes='-1'
     then begin
          DM.TPesqCliente.FetchOnDemand:=True;
          DM.TPesqCliente.PacketRecords:=-1;
          end
     else begin
          DM.TPesqCliente.FetchOnDemand:=False;
          DM.TPesqCliente.PacketRecords:=StrToInt(FrmPrincipal.Reg_Clientes);
          end;
end;

procedure TFPesquisaCliente.BtConsultaClick(Sender: TObject);
var
   vCampoPesquisa : String;
begin
     if EPesquisa.text<>''
     then begin
           AC;
           if CPesquisa.ItemIndex=0
           then vCampoPesquisa:='NOME'
           else if CPesquisa.ItemIndex=1
           then vCampoPesquisa:='CPF'
           else if CPesquisa.ItemIndex=2
           then vCampoPesquisa:='CGC'
           else if CPesquisa.ItemIndex=3
           then vCampoPesquisa:='CODIGO';

           With DM.QPesqCliente
           do begin
              Close;
              Sql.Clear;
              Sql.Add('SELECT CODIGO,NOME,ENDERECO,CPF,CGC,INATIVO FROM CLIENTE');
              if CPesquisa.ItemIndex<>3
              then begin
                   Sql.Add('WHERE '+vCampoPesquisa+' LIKE:PPESQUISA');
                   if FrmPrincipal.Busca_Contenha_Cli='S'
                   then ParamByName('PPESQUISA').AsString:='%'+EPesquisa.Text+'%'
                   else ParamByName('PPESQUISA').AsString:=EPesquisa.Text+'%';
                   end
              else begin
                   Sql.Add('WHERE '+vCampoPesquisa+'=:PPESQUISA');
                   ParamByName('PPESQUISA').AsInteger:=StrToInt(EPesquisa.Text);
                   end;
              
              Sql.Add('AND INATIVO=:PINATIVO');
              ParamByName('PINATIVO').AsString:='N';

              DM.TPesqCliente.Close;
              DM.TPesqCliente.IndexFieldNames:='NOME';
              DM.TPesqCliente.Open;
              SB.Panels[0].Text:='Clientes: '+StrZero(DM.TPesqCliente.RecordCount,6);

              if FrmPrincipal.Auto_Pesq_Clientes='N'
              then begin
                   if DM.TPesqCliente.RecordCount = 0
                   then EPesquisa.SetFocus;
                   end;
              end;
           DC;
      end;     
end;

procedure TFPesquisaCliente.EPesquisaChange(Sender: TObject);
begin
     if FrmPrincipal.Auto_Pesq_Clientes='S'
     then BtConsultaClick(Sender);
end;

procedure TFPesquisaCliente.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     if not odd(DM.TPesqCliente.RecNo)
     then begin
          if not (gdselected in state)
          then begin
               DBGrid.Canvas.Brush.Color := $00F0F0F0;
               DBGrid.Canvas.FillRect(Rect);
               DBGrid.DefaultDrawDataCell(rect, Column.Field, State);
               end;
          end;
end;

end.
