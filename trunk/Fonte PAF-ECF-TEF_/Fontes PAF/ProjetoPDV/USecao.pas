unit USecao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, Grids, DBGrids, ComCtrls, Buttons,
  ExtCtrls;

type
  TFCadSecao = class(TForm)
    Panel2: TPanel;
    BTincluir: TBitBtn;
    BTAlterar: TBitBtn;
    BTSair: TBitBtn;
    SB: TStatusBar;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    dsSecao: TDataSource;
    Label2: TLabel;
    DBEdit_Nome: TDBEdit;
    BTSalvar: TBitBtn;
    BTCancela: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BTincluirClick(Sender: TObject);
    procedure BTAlterarClick(Sender: TObject);
    procedure BTSalvarClick(Sender: TObject);
    procedure BTCancelaClick(Sender: TObject);
    procedure BTSairClick(Sender: TObject);
    procedure DBEdit_NomeEnter(Sender: TObject);
    procedure DBEdit_NomeExit(Sender: TObject);
    procedure DBEdit_NomeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    vConsulta : Boolean;
  end;

var
  FCadSecao: TFCadSecao;

implementation

uses dmsyndAC, UBarsa;

{$R *.dfm}

procedure TFCadSecao.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FCadSecao,Key);
end;

procedure TFCadSecao.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFCadSecao.FormShow(Sender: TObject);
begin
     PageControl.TabIndex:=0;
     DM.TSecao.Open;
     DM.TSecao.IndexFieldNames:='NOME';
     DBGrid1.SetFocus;
end;

procedure TFCadSecao.FormDestroy(Sender: TObject);
begin
     DM.TSecao.Close;
end;

procedure TFCadSecao.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if (Key=#13)and(vConsulta)
     then ModalResult:=mrOk;
end;

procedure TFCadSecao.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if (key >= 49) and (key <= 105)
      then begin
           SB.Panels[0].Text:=SB.Panels[0].text+CHR(key);
           DM.TSecao.FindNearest([SB.Panels[0].Text]);
           end
      else if key in [8,38,40] // BackSpace, UpArrow, DownArrow
      then SB.Panels[0].Text:='';
end;

procedure TFCadSecao.BTincluirClick(Sender: TObject);
begin
     PageControl.TabIndex:=1;
     DM.TSecao.Append;

     BTSalvar.Enabled:=True;
     BTCancela.Enabled:=True;
     BTIncluir.Enabled:=False;
     BTAlterar.Enabled:=False;
     BTSair.Enabled:=False;
     DBEdit_Nome.SetFocus;
end;

procedure TFCadSecao.BTAlterarClick(Sender: TObject);
begin
     PageControl.TabIndex:=1;
     DM.TSecao.Edit;

     BTSalvar.Enabled:=True;
     BTCancela.Enabled:=True;
     BTIncluir.Enabled:=False;
     BTAlterar.Enabled:=False;
     BTSair.Enabled:=False;
     DBEdit_Nome.SetFocus;
end;

procedure TFCadSecao.BTSalvarClick(Sender: TObject);
begin
     PageControl.TabIndex:=0;
     DM.TSecao.Edit;
     DM.TSecao.Post;
     DM.TSecao.ApplyUpdates(0);
     DM.TSecao.Refresh;

     BTSalvar.Enabled:=False;
     BTCancela.Enabled:=False;
     BTIncluir.Enabled:=True;
     BTAlterar.Enabled:=True;
     BTSair.Enabled:=True;
     DBGrid1.SetFocus;
end;

procedure TFCadSecao.BTCancelaClick(Sender: TObject);
begin
     PageControl.TabIndex:=0;
     DM.TSecao.Cancel;
     DM.TSecao.CancelUpdates;

     BTSalvar.Enabled:=False;
     BTCancela.Enabled:=False;
     BTIncluir.Enabled:=True;
     BTAlterar.Enabled:=True;
     BTSair.Enabled:=True;
     DBGrid1.SetFocus;
end;

procedure TFCadSecao.BTSairClick(Sender: TObject);
begin
     Close;
end;

procedure TFCadSecao.DBEdit_NomeEnter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure TFCadSecao.DBEdit_NomeExit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure TFCadSecao.DBEdit_NomeKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then BTSalvarClick(Sender);
end;

end.
