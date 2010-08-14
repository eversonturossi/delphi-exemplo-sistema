unit UCadGrupos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, DBCtrls,
  ExtCtrls, RXCtrls;

type
  TFCadGrupos = class(TForm)
    Panel2: TPanel;
    BTincluir: TBitBtn;
    BTAlterar: TBitBtn;
    BTSair: TBitBtn;
    SB: TStatusBar;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    dsGrupos: TDataSource;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    DBEdit_Nome: TDBEdit;
    BTSalvar: TBitBtn;
    BTCancela: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BTincluirClick(Sender: TObject);
    procedure BTAlterarClick(Sender: TObject);
    procedure BTSalvarClick(Sender: TObject);
    procedure BTCancelaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BTSairClick(Sender: TObject);
    procedure DBEdit_nomeEnter(Sender: TObject);
    procedure DBEdit_nomeExit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_NomeKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    vConsulta : Boolean;
  end;

var
  FCadGrupos: TFCadGrupos;

implementation

uses UBarsa, dmsyndAC;

{$R *.dfm}

procedure TFCadGrupos.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FCadGrupos,Key);
end;

procedure TFCadGrupos.BTincluirClick(Sender: TObject);
begin
     PageControl.TabIndex:=1;
     DM.TGrupos.Append;

     BTSalvar.Enabled:=True;
     BTCancela.Enabled:=True;
     BTIncluir.Enabled:=False;
     BTAlterar.Enabled:=False;
     BTSair.Enabled:=False;
     DBEdit_Nome.SetFocus;
end;

procedure TFCadGrupos.BTAlterarClick(Sender: TObject);
begin
     PageControl.TabIndex:=1;
     DM.TGrupos.Edit;

     BTSalvar.Enabled:=True;
     BTCancela.Enabled:=True;
     BTIncluir.Enabled:=False;
     BTAlterar.Enabled:=False;
     BTSair.Enabled:=False;
     DBEdit_Nome.SetFocus;
end;

procedure TFCadGrupos.BTSalvarClick(Sender: TObject);
begin
     PageControl.TabIndex:=0;
     DM.TGrupos.Edit;
     DM.TGrupos.Post;
     DM.TGrupos.ApplyUpdates(0);
     DM.TGrupos.Refresh;

     BTSalvar.Enabled:=False;
     BTCancela.Enabled:=False;
     BTIncluir.Enabled:=True;
     BTAlterar.Enabled:=True;
     BTSair.Enabled:=True;
     DBGrid1.SetFocus;
end;

procedure TFCadGrupos.BTCancelaClick(Sender: TObject);
begin
     PageControl.TabIndex:=0;
     DM.TGrupos.Cancel;
     DM.TGrupos.CancelUpdates;

     BTSalvar.Enabled:=False;
     BTCancela.Enabled:=False;
     BTIncluir.Enabled:=True;
     BTAlterar.Enabled:=True;
     BTSair.Enabled:=True;
     DBGrid1.SetFocus;
end;

procedure TFCadGrupos.FormShow(Sender: TObject);
begin
     PageControl.TabIndex:=0;
     DM.TGrupos.Open;
     DM.TGrupos.IndexFieldNames:='NOME';
     DBGrid1.SetFocus;
end;

procedure TFCadGrupos.FormDestroy(Sender: TObject);
begin
     DM.TGrupos.Close;
end;

procedure TFCadGrupos.BTSairClick(Sender: TObject);
begin
     Close;
end;

procedure TFCadGrupos.DBEdit_nomeEnter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure TFCadGrupos.DBEdit_nomeExit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure TFCadGrupos.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if (Key=#13)and(vConsulta)
     then ModalResult:=mrOk;
end;

procedure TFCadGrupos.DBEdit_NomeKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then begin
          if DM.TGrupos.State in [dsInsert,dsEdit]
          then BTSalvarClick(Sender);
          end;
end;

procedure TFCadGrupos.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if (key >= 49) and (key <= 105)
      then begin
           SB.Panels[0].Text:=SB.Panels[0].text+CHR(key);
           DM.TGrupos.FindNearest([SB.Panels[0].Text]);
           end
      else if key in [8,38,40] // BackSpace, UpArrow, DownArrow
      then SB.Panels[0].Text:='';
end;

procedure TFCadGrupos.FormKeyDown(Sender: TObject; var Key: Word;
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
