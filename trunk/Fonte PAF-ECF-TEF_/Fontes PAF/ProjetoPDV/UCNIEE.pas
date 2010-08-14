unit UCNIEE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, DB, StdCtrls, Mask, DBCtrls, Buttons;

type
  TFCNIEE = class(TForm)
    StatusBar1: TStatusBar;
    DBGrid: TDBGrid;
    dsCNIEE: TDataSource;
    GManut: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    BTincluir: TBitBtn;
    BTAlterar: TBitBtn;
    BtExcluir: TBitBtn;
    BTSalvar: TBitBtn;
    BTCancela: TBitBtn;
    BTSair: TBitBtn;
    LCaptura: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BTSairClick(Sender: TObject);
    procedure BTincluirClick(Sender: TObject);
    procedure BTAlterarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BTSalvarClick(Sender: TObject);
    procedure BTCancelaClick(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure dsCNIEEDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCNIEE: TFCNIEE;

implementation

uses UBarsa, dmsyndAC, checkout, Math;

{$R *.dfm}

procedure TFCNIEE.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FCNIEE,Key);
end;

procedure TFCNIEE.BTSairClick(Sender: TObject);
begin
     Close;
end;

procedure TFCNIEE.BTincluirClick(Sender: TObject);
begin
     GManut.Enabled:=True;
     DM.TCNIEE.Append;
     DM.TCNIEECOD_MC.Value:='0';
     DBEdit1.SetFocus;
end;

procedure TFCNIEE.BTAlterarClick(Sender: TObject);
begin
     GManut.Enabled:=True;
     DM.TCNIEE.Edit;
     DBEdit1.SetFocus;
end;

procedure TFCNIEE.BtExcluirClick(Sender: TObject);
begin
     if Confirma('Confirma a Exclusão deste Código de identificação Nacional?')=mrYes
     then begin
          DM.TCNIEE.Delete;
          DM.TCNIEE.ApplyUpdates(-1);
          end;
end;

procedure TFCNIEE.BTSalvarClick(Sender: TObject);
begin
     if Confirma('Deseja salvar o registro?')=mrYes
     then begin
          DM.TCNIEE.Post;
          DM.TCNIEE.ApplyUpdates(-1);
          DM.TCNIEE.Refresh;
          GManut.Enabled:=False;
          end;
end;

procedure TFCNIEE.BTCancelaClick(Sender: TObject);
begin
     if Confirma('Deseja cancelar o registro?')=mrYes
     then begin
          DM.TCNIEE.Cancel;
          DM.TCNIEE.CancelUpdates;
          GManut.Enabled:=False;
          end;
end;

procedure TFCNIEE.DBEdit1Enter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure TFCNIEE.DBEdit1Exit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure TFCNIEE.dsCNIEEDataChange(Sender: TObject; Field: TField);
begin
     if DM.TCNIEE.State in [dsInsert,dsEdit]
     then begin
          BTincluir.Enabled:=False;
          BTAlterar.Enabled:=False;
          BtExcluir.Enabled:=False;
          BTSalvar.Enabled:=True;
          BTCancela.Enabled:=True;
          BTSair.Enabled:=False;
          LCaptura.Enabled:=True;
          end
     else begin
          BTincluir.Enabled:=True;
          BTAlterar.Enabled:=True;
          BtExcluir.Enabled:=True;
          BTSalvar.Enabled:=False;
          BTCancela.Enabled:=False;
          BTSair.Enabled:=True;
          LCaptura.Enabled:=False;
          end;
end;

procedure TFCNIEE.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if DM.TCNIEE.State in [dsBrowse]
    then begin
         if Key=VK_Insert
         then BTincluirClick(Sender)
         else if Key=VK_F2
         then BTAlterarClick(Sender)
         else if Key=VK_F3
         then BTExcluirClick(Sender)
         else if Key=VK_Escape
         then BTSairClick(Sender)
         end
    else begin
         if Key=VK_F10
         then BTSalvarClick(Sender)
         else if Key=VK_Escape
         then BTCancelaClick(Sender)
         else if Key=VK_F11
         then begin
              Retorna_Informacao_Impressora;

              while length(sVersao_SB) < 06
              do sVersao_SB := sVersao_SB+'0';

              if DM.TCNIEE.State in [dsInsert,dsEdit]
              then begin
                   DM.TCNIEETIPO.Value:=sTipo_ECF;
                   DM.TCNIEEMARCA.Value:=sMarca_ECF;
                   DM.TCNIEEMODELO.Value:=sModelo_ECF;
                   DM.TCNIEEVERSAO.Value:=sVersao_SB;
                   end;
              end;
         end;
end;

procedure TFCNIEE.FormShow(Sender: TObject);
begin
     DM.TCNIEE.IndexFieldNames:='MARCA';
     DM.TCNIEE.Open;
end;

procedure TFCNIEE.FormDestroy(Sender: TObject);
begin
     DM.TCNIEE.Close;
end;

end.
