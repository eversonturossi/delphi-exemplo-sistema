unit UFormaPgto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, Mask, DBCtrls, Grids, DBGrids, ComCtrls;

type
  TFFormaPgto = class(TForm)
    Label1: TLabel;
    PageControl1: TPageControl;
    consulta: TTabSheet;
    DBGrid1: TDBGrid;
    manutencao: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    DBDescricao: TDBEdit;
    BTIncluir: TBitBtn;
    BTAlterar: TBitBtn;
    BTSair: TBitBtn;
    dsForma_Pgto: TDataSource;
    DBComboBox1: TDBComboBox;
    Label4: TLabel;
    DBComboBox2: TDBComboBox;
    Label5: TLabel;
    DBComboBox3: TDBComboBox;
    Label6: TLabel;
    DBComboBox4: TDBComboBox;
    Label8: TLabel;
    DBComboBox6: TDBComboBox;
    StatusBar1: TStatusBar;
    BTSalvar: TBitBtn;
    BTCancelar: TBitBtn;
    procedure BTSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BTIncluirClick(Sender: TObject);
    procedure BTAlterarClick(Sender: TObject);
    procedure BTSalvarClick(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure DBDescricaoEnter(Sender: TObject);
    procedure DBDescricaoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox6KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFormaPgto: TFFormaPgto;

implementation

uses dmsyndAC, UBarsa;

{$R *.dfm}

procedure TFFormaPgto.BTSairClick(Sender: TObject);
begin
      Close;
end;

procedure TFFormaPgto.FormShow(Sender: TObject);
begin
     PageControl1.TabIndex:=0;
     DM.TForma_Pgto.Open;
     DBGrid1.SetFocus;
end;

procedure TFFormaPgto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if PageControl1.TabIndex=0
     then begin
          if Key=VK_Insert
          then BTIncluirClick(Sender)
          else if Key=VK_F2
          then BTAlterarClick(Sender)
          else if Key=VK_Escape
          then BTSairClick(Sender)
          end
     else begin
          if Key=VK_F10
          then BTSalvarClick(Sender)
          else if Key=VK_Escape
          then BTCancelarClick(Sender);
          end;
end;

procedure TFFormaPgto.BTIncluirClick(Sender: TObject);
begin
     BTIncluir.Enabled:=False;
     BTAlterar.Enabled:=False;
     BTSair.Enabled:=False;
     BTSalvar.Enabled:=True;
     BTCancelar.Enabled:=True;
     DBComboBox1.Enabled:=True;
     DBDescricao.Enabled:=True;

     PageControl1.ActivePageIndex:=1;
     DM.TForma_Pgto.Append;
     DM.TForma_PgtoATALHO.AsString:='F9';
     DM.TForma_PgtoABRE_GAVETA.AsString:='N';
     DM.TForma_PgtoTEF.AsString:='N';
     DM.TForma_PgtoGERA_CREDIARIO.AsString:='N';
     DM.TForma_PgtoIMPRIMI_COMPROVANTE.AsString:='N';
     DBDescricao.SetFocus;
end;

procedure TFFormaPgto.BTAlterarClick(Sender: TObject);
begin
     DM.TForma_Pgto.Edit;

     if DM.TForma_PgtoCODIGO.AsInteger <= 6
     then begin
          DBComboBox1.Enabled:=False;
          DBDescricao.Enabled:=False;
          end
     else begin
          DBDescricao.Enabled:=True;
          DBComboBox1.Enabled:=True;
          end;

     BTIncluir.Enabled:=False;
     BTAlterar.Enabled:=False;
     BTSair.Enabled:=False;
     BTSalvar.Enabled:=True;
     BTCancelar.Enabled:=True;
     pagecontrol1.ActivePageIndex:=1;

     if DM.TForma_PgtoCODIGO.AsInteger <= 6
     then DBComboBox2.SetFocus
     else DBDescricao.SetFocus;
end;

procedure TFFormaPgto.BTSalvarClick(Sender: TObject);
begin
     if DM.TForma_Pgto.State in [dsInsert]
     then begin
          WIth DM.QPesquisa
          do begin
             Close;
             Sql.Clear;
             Sql.Add('SELECT ATALHO FROM FORMA_PGTO');
             Sql.Add('WHERE ATALHO=:PATALHO');
             ParamByName('PATALHO').AsString:=DM.TForma_PgtoATALHO.AsString;
             Open;
             if not IsEmpty
             then begin
                  Informa('Esta tecla de atalho ja esta em uso, tente outra!');
                  DBDescricao.SetFocus;
                  Exit;
                  end;
             end;
          end;

     DM.TForma_Pgto.Edit;
     DM.TForma_Pgto.Post;
     DM.TForma_Pgto.ApplyUpdates(-1);
     DM.TForma_Pgto.Refresh;

     PageControl1.ActivePageIndex:=0;
     BTIncluir.Enabled:=True;
     BTAlterar.Enabled:=True;
     BTSair.Enabled:=True;
     BTSalvar.Enabled:=False;
     BTCancelar.Enabled:=False;
     DBGrid1.SetFocus;
end;

procedure TFFormaPgto.BTCancelarClick(Sender: TObject);
begin
     DM.TForma_Pgto.Cancel;
     DM.TForma_Pgto.CancelUpdates;

     PageControl1.ActivePageIndex:=0;
     BTIncluir.Enabled:=True;
     BTAlterar.Enabled:=True;
     BTSair.Enabled:=True;
     BTSalvar.Enabled:=False;
     BTCancelar.Enabled:=False;
     DBGrid1.SetFocus;
end;

procedure TFFormaPgto.DBDescricaoEnter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure TFFormaPgto.DBDescricaoExit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure TFFormaPgto.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FFormaPgto,Key);
end;

procedure TFFormaPgto.DBComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then Key:=#0;
end;

procedure TFFormaPgto.DBComboBox6KeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then BTSalvarClick(Sender);
end;

end.
