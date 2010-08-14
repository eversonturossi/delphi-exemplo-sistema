unit frmconsultaaliquotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, Mask, DBCtrls,
  dbtables;

type
  Tfconaliquotas = class(TForm)
    Label1: TLabel;
    dstributacao: TDataSource;
    PageControl1: TPageControl;
    consulta: TTabSheet;
    manutencao: TTabSheet;
    DBGrid1: TDBGrid;
    BTIncluir: TBitBtn;
    BTAlterar: TBitBtn;
    BTSair: TBitBtn;
    Label2: TLabel;
    aliquota: TDBEdit;
    Label3: TLabel;
    descricao: TDBEdit;
    Label4: TLabel;
    posicao_ecf: TDBEdit;
    StatusBar1: TStatusBar;
    BTSalvar: TBitBtn;
    BTCancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure BTAlterarClick(Sender: TObject);
    procedure BTSairClick(Sender: TObject);
    procedure BTIncluirClick(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure posicao_ecfKeyPress(Sender: TObject; var Key: Char);
    procedure aliquotaEnter(Sender: TObject);
    procedure aliquotaExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BTSalvarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    vConsulta : Boolean;
  end;

var
  fconaliquotas: Tfconaliquotas;

implementation

uses dmsyndAC, UBarsa;

{$R *.dfm}

procedure Tfconaliquotas.FormShow(Sender: TObject);
begin
     DM.T_Tributacao.Open;
     PageControl1.ActivePageIndex:=0;
     DBGrid1.SetFocus;
end;

procedure Tfconaliquotas.btn_okClick(Sender: TObject);
begin
  close;
end;

procedure Tfconaliquotas.BTAlterarClick(Sender: TObject);
begin
     DM.T_Tributacao.Edit;
     BTIncluir.Enabled:=False;
     BTAlterar.Enabled:=False;
     BTSair.Enabled:=False;
     BTSalvar.Enabled:=True;
     BTCancelar.Enabled:=True;
     pagecontrol1.ActivePageIndex:=1;
     Aliquota.SetFocus;
end;

procedure Tfconaliquotas.BTSairClick(Sender: TObject);
begin
     Close;
end;

procedure Tfconaliquotas.BTIncluirClick(Sender: TObject);
begin
     DM.T_tributacao.Append;
     BTIncluir.Enabled:=False;
     BTAlterar.Enabled:=False;
     BTSair.Enabled:=False;
     BTSalvar.Enabled:=True;
     BTCancelar.Enabled:=True;
     pagecontrol1.ActivePageIndex:=1;
     aliquota.SetFocus;
end;

procedure Tfconaliquotas.BTCancelarClick(Sender: TObject);
begin
     DM.T_Tributacao.Cancel;
     DM.T_Tributacao.CancelUpdates;

     PageControl1.ActivePageIndex:=0;
     BTIncluir.Enabled:=True;
     BTAlterar.Enabled:=True;
     BTSair.Enabled:=True;
     BTSalvar.Enabled:=False;
     BTCancelar.Enabled:=False;
     DBGrid1.SetFocus;
end;

procedure Tfconaliquotas.posicao_ecfKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then BTSalvarClick(Sender);
end;

procedure Tfconaliquotas.aliquotaEnter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure Tfconaliquotas.aliquotaExit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure Tfconaliquotas.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfconaliquotas.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FConaliquotas,Key);
end;

procedure Tfconaliquotas.BTSalvarClick(Sender: TObject);
begin
     DM.T_Tributacao.Post;
     DM.T_Tributacao.ApplyUpdates(0);
     DM.T_Tributacao.Refresh;
     PageControl1.ActivePageIndex:=0;
     BTIncluir.Enabled:=True;
     BTAlterar.Enabled:=True;
     BTSair.Enabled:=True;
     BTSalvar.Enabled:=False;
     BTCancelar.Enabled:=False;
     DBGrid1.SetFocus;
end;

procedure Tfconaliquotas.FormDestroy(Sender: TObject);
begin
     DM.T_Tributacao.Close;
end;

procedure Tfconaliquotas.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if (Key=#13)and(vConsulta)
     then ModalResult:=mrOk;
end;

end.
