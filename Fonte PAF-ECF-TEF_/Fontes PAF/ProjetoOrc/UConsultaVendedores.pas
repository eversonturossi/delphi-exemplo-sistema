unit UConsultaVendedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Grids, DBGrids, DB;

type
  TFPesquisaVendedores = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    EPesquisa: TEdit;
    DBGrid: TDBGrid;
    procedure EPesquisaEnter(Sender: TObject);
    procedure EPesquisaExit(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure EPesquisaChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure EPesquisaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPesquisaVendedores: TFPesquisaVendedores;

implementation

uses UDM, UBarsa, UOrcamento;

{$R *.dfm}

procedure TFPesquisaVendedores.EPesquisaEnter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure TFPesquisaVendedores.EPesquisaExit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure TFPesquisaVendedores.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if not odd(DM.dsPesqVendedores.DataSet.RecNo)
    then begin
         if not (gdselected in state)
         then begin
              DBGrid.Canvas.Brush.Color := $00F0F0F0;
              DBGrid.Canvas.FillRect(Rect);
              DBGrid.DefaultDrawDataCell(rect, Column.Field, State);
              end;
         end;
end;

procedure TFPesquisaVendedores.FormShow(Sender: TObject);
begin
     DM.dsPesqVendedores.DataSet.Close;
     if Status_Serv='ON'
     then begin
          DM.dsPesqVendedores.DataSet:=DM.TPesqVendedor;
          DM.TPesqVendedor.IndexFieldNames:='NOME';
          end
     else begin
          CarregaVendoresOff;
          DM.dsPesqVendedores.DataSet:=DM.TPesqVendedorTemp;
          end;
     DM.dsPesqVendedores.DataSet.Open;

     EPesquisa.Clear;
     EPesquisa.SetFocus;
end;

procedure TFPesquisaVendedores.EPesquisaChange(Sender: TObject);
begin
     DM.dsPesqVendedores.DataSet.Locate('NOME',EPesquisa.Text,[]);
end;

procedure TFPesquisaVendedores.FormDestroy(Sender: TObject);
begin
     DM.dsPesqVendedores.DataSet.Close;
end;

procedure TFPesquisaVendedores.EPesquisaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if key=40  // seta para baixo
     then DBGrid.SetFocus;
end;

procedure TFPesquisaVendedores.DBGridKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then ModalResult:=mrOk;
end;

procedure TFPesquisaVendedores.EPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then DBGrid.SetFocus;
end;

end.
