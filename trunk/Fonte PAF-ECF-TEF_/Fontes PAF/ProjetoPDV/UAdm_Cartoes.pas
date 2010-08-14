unit UAdm_Cartoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, Grids, DBGrids, ComCtrls, Buttons,
  ExtCtrls;

type
  TFAdm_Cartoes = class(TForm)
    SB: TStatusBar;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    dsAdm_Cartoes: TDataSource;
    Label2: TLabel;
    DBEdit_Nome: TDBEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBComboBox1: TDBComboBox;
    Label8: TLabel;
    BTSalvar: TBitBtn;
    BTCancela: TBitBtn;
    BTincluir: TBitBtn;
    BTAlterar: TBitBtn;
    BTSair: TBitBtn;
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BTincluirClick(Sender: TObject);
    procedure BTAlterarClick(Sender: TObject);
    procedure BTSalvarClick(Sender: TObject);
    procedure BTCancelaClick(Sender: TObject);
    procedure BTSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_NomeEnter(Sender: TObject);
    procedure DBEdit_NomeExit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    vConsulta : Boolean;
  end;

var
  FAdm_Cartoes: TFAdm_Cartoes;

implementation

uses dmsyndAC, UBarsa;

{$R *.dfm}

procedure TFAdm_Cartoes.DBComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then BtSalvarClick(Sender);
end;

procedure TFAdm_Cartoes.FormShow(Sender: TObject);
begin
     PageControl.TabIndex:=0;
     DM.TCartao_Adm.Close;
     DM.TCartao_Adm.IndexFieldNames:='DESCRICAO';
     DM.TCartao_Adm.Open;
     DBGrid1.SetFocus;
end;

procedure TFAdm_Cartoes.FormDestroy(Sender: TObject);
begin
     DM.TCartao_Adm.Close;
end;

procedure TFAdm_Cartoes.BTincluirClick(Sender: TObject);
begin
     PageControl.TabIndex:=1;
     DM.TCartao_Adm.Append;
     DM.TCartao_AdmNOME_REDE.AsString:='AMEX';

     BTSalvar.Enabled:=True;
     BTCancela.Enabled:=True;
     BTIncluir.Enabled:=False;
     BTAlterar.Enabled:=False;
     BTSair.Enabled:=False;
     DBEdit_Nome.SetFocus;
end;

procedure TFAdm_Cartoes.BTAlterarClick(Sender: TObject);
begin
     PageControl.TabIndex:=1;
     DM.TCartao_Adm.Edit;

     BTSalvar.Enabled:=True;
     BTCancela.Enabled:=True;
     BTIncluir.Enabled:=False;
     BTAlterar.Enabled:=False;
     BTSair.Enabled:=False;
     DBEdit_Nome.SetFocus;
end;

procedure TFAdm_Cartoes.BTSalvarClick(Sender: TObject);
begin
     PageControl.TabIndex:=0;
     DM.TCartao_Adm.Edit;
     DM.TCartao_Adm.Post;
     DM.TCartao_Adm.ApplyUpdates(-1);
     DM.TCartao_Adm.Refresh;

     BTSalvar.Enabled:=False;
     BTCancela.Enabled:=False;
     BTIncluir.Enabled:=True;
     BTAlterar.Enabled:=True;
     BTSair.Enabled:=True;
     DBGrid1.SetFocus;
end;

procedure TFAdm_Cartoes.BTCancelaClick(Sender: TObject);
begin
     PageControl.TabIndex:=0;
     DM.TCartao_Adm.Cancel;
     DM.TCartao_Adm.CancelUpdates;

     BTSalvar.Enabled:=False;
     BTCancela.Enabled:=False;
     BTIncluir.Enabled:=True;
     BTAlterar.Enabled:=True;
     BTSair.Enabled:=True;
     DBGrid1.SetFocus;
end;

procedure TFAdm_Cartoes.BTSairClick(Sender: TObject);
begin
     Close;
end;

procedure TFAdm_Cartoes.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFAdm_Cartoes.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FAdm_Cartoes,Key);
end;

procedure TFAdm_Cartoes.DBEdit_NomeEnter(Sender: TObject);
begin
 EntraFocu(Sender);
end;

procedure TFAdm_Cartoes.DBEdit_NomeExit(Sender: TObject);
begin
    FechaFocu(Sender);
end;

procedure TFAdm_Cartoes.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if (Key=#13)and(vConsulta)
     then ModalResult:=mrOk;
end;

end.
