unit UCadUnidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls,
  RXCtrls, ComCtrls;

type
  TFCadUnidades = class(TForm)
    Panel2: TPanel;
    BTincluir: TBitBtn;
    BTAlterar: TBitBtn;
    BTSair: TBitBtn;
    dsunidades: TDataSource;
    SB: TStatusBar;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit_nome: TDBEdit;
    BTSalvar: TBitBtn;
    BTCancela: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BTSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BTincluirClick(Sender: TObject);
    procedure BTAlterarClick(Sender: TObject);
    procedure BTSalvarClick(Sender: TObject);
    procedure BTCancelaClick(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit_nomeEnter(Sender: TObject);
    procedure DBEdit_nomeExit(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    vConsulta : Boolean;
  end;

var
  FCadUnidades: TFCadUnidades;

implementation

uses dmsyndAC, UBarsa;

{$R *.dfm}

procedure TFCadUnidades.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FCadUnidades,Key);
end;

procedure TFCadUnidades.BTSairClick(Sender: TObject);
begin
     Close;
end;

procedure TFCadUnidades.FormShow(Sender: TObject);
begin
     PageControl.TabIndex:=0;
     DM.TUnidades.Close;
     DM.TUnidades.IndexFieldNames:='DESCRICAO';
     DM.TUnidades.Open;
     DBGrid1.SetFocus;
end;

procedure TFCadUnidades.FormDestroy(Sender: TObject);
begin
     DM.TUnidades.Close;
end;

procedure TFCadUnidades.BTincluirClick(Sender: TObject);
begin
     PageControl.TabIndex:=1;
     DM.TUnidades.Append;

     BTSalvar.Enabled:=True;
     BTCancela.Enabled:=True;
     BTIncluir.Enabled:=False;
     BTAlterar.Enabled:=False;
     BTSair.Enabled:=False;
     DBEdit_Nome.SetFocus;
end;

procedure TFCadUnidades.BTAlterarClick(Sender: TObject);
begin
     PageControl.TabIndex:=1;
     DM.TUnidades.Edit;

     BTSalvar.Enabled:=True;
     BTCancela.Enabled:=True;
     BTIncluir.Enabled:=False;
     BTAlterar.Enabled:=False;
     BTSair.Enabled:=False;
     DBEdit_Nome.SetFocus;
end;

procedure TFCadUnidades.BTSalvarClick(Sender: TObject);
begin
     PageControl.TabIndex:=0;
     DM.TUnidades.Post;
     DM.TUnidades.ApplyUpdates(0);
     DM.TUnidades.Refresh;

     BTSalvar.Enabled:=False;
     BTCancela.Enabled:=False;
     BTIncluir.Enabled:=True;
     BTAlterar.Enabled:=True;
     BTSair.Enabled:=True;
     DBGrid1.SetFocus;
end;

procedure TFCadUnidades.BTCancelaClick(Sender: TObject);
begin
     PageControl.TabIndex:=0;
     DM.TUnidades.Cancel;
     DM.TUnidades.CancelUpdates;

     BTSalvar.Enabled:=False;
     BTCancela.Enabled:=False;
     BTIncluir.Enabled:=True;
     BTAlterar.Enabled:=True;
     BTSair.Enabled:=True;
     DBGrid1.SetFocus;
end;

procedure TFCadUnidades.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (key >= 49) and (key <= 105)
     then begin
          SB.Panels[0].Text:=SB.Panels[0].text+CHR(key);
          DM.TUnidades.FindNearest([SB.Panels[0].Text]);
          end
     else if key in [8,38,40] // BackSpace, UpArrow, DownArrow
     then SB.Panels[0].Text:='';
end;

procedure TFCadUnidades.DBEdit_nomeEnter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure TFCadUnidades.DBEdit_nomeExit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure TFCadUnidades.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then begin
          if DM.TUnidades.State in [dsInsert,dsEdit]
          then BTSalvarClick(Sender);
          end;
end;

procedure TFCadUnidades.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if (Key=#13)and(vConsulta)
     then ModalResult:=MrOk;
end;

procedure TFCadUnidades.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if PageControl.TabIndex=0
     then begin
          if Key=VK_Insert
          then BTIncluirClick(Sender)
          else if Key=VK_F2
          then BTAlterarClick(Sender)
          else if Key=VK_Escape
          then BTSairClick(Sender);
          end
     else begin
          if Key=VK_F10
          then BTSalvarClick(Sender)
          else if Key=VK_Escape
          then BTCancelaClick(Sender);
          end;
end;

end.
