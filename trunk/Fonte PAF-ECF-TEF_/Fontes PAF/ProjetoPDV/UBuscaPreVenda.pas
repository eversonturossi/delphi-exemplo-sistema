unit UBuscaPreVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, DBGrids, DB, ToolWin, ExtCtrls,
  DBCtrls, ImgList, Mask, rxToolEdit, rxCurrEdit;

type
  TFBuscaDAV = class(TForm)
    SB: TStatusBar;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    dsBuscaDAV: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    Label2: TLabel;
    dsBuscaItemDAV: TDataSource;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EQtdeEnter(Sender: TObject);
    procedure ETotalEnter(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure dsBuscaDAVDataChange(Sender: TObject; Field: TField);
    procedure dsBuscaItemDAVDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    procedure ImprimiCupom(Sender: TObject);
  public
    { Public declarations }
    vConsulta : Boolean;
  end;

var
  FBuscaDAV: TFBuscaDAV;

implementation

uses UBarsa, dmsyndAC, UPesqPreVenda, checkout;

{$R *.dfm}

procedure TFBuscaDAV.ImprimiCupom(Sender: TObject);
begin
     if not DM.TBuscaDAV.IsEmpty
     then begin
          if Confirma('Confirma a Impressão do Cupom Fiscal?')=mrYes
          then begin
               nBuscou_DAV:=True;
               vCod_DAV:=DM.TBuscaDAVNUMERO_DAV.AsInteger;
               nCodClienteDAV:=DM.TBuscaDAVCODCLIENTE.AsInteger;
               sCliente_DAV:=DM.TBuscaDAVNOMECLIENTE.AsString;
               nDesconto_DAV:=DM.TBuscaDAVDESCONTO.AsCurrency;
               nFlagDAV:=DM.TBuscaDAVFLAG.Value;
               nNumFlagDAV:=DM.TBuscaDAVNUMERO_FLAG.Value;
               FBuscaDAV.Visible:=False;

               FrmCheckOut.ImprimiDAV(Sender);

               Application.ProcessMessages;
               Close;
               FBuscaDAV.Visible:=True;
               end
          else nBuscou_DAV:=False;
          end;
end;          

procedure TFBuscaDAV.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FBuscaDAV,key);
end;

procedure TFBuscaDAV.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_F4
     then begin
          Try
            if FPesquisaDAV=Nil
            then Application.CreateForm(TFPesquisaDAV,FPesquisaDAV);
            FPesquisaDAV.ShowModal;
         Finally
            FPesquisaDAV.Release;
            FPesquisaDAV:=Nil;
            end;
          end;
     if Key=VK_Escape
     then Close;
end;

procedure TFBuscaDAV.FormActivate(Sender: TObject);
begin
     if not vConsulta
     then begin
           Try
              if FPesquisaDAV=Nil
              then Application.CreateForm(TFPesquisaDAV,FPesquisaDAV);
              FPesquisaDAV.ShowModal;
           Finally
              FPesquisaDAV.Release;
              FPesquisaDAV:=Nil;
              end;
          end
    else begin
         vConsulta:=False;
         ConsultaDAV(1);
         end;
end;

procedure TFBuscaDAV.FormShow(Sender: TObject);
begin
     DM.TBuscaDAV.Close;
     DM.TBuscaItemDAV.Close;
     DM.TBuscaGradeDAV.Close;
end;

procedure TFBuscaDAV.EQtdeEnter(Sender: TObject);
begin
     if (Sender is TCurrencyEdit) then
     TCurrencyEdit(Sender).Color:=$0080FFFF;
end;

procedure TFBuscaDAV.ETotalEnter(Sender: TObject);
begin
     if (Sender is TCurrencyEdit) then
     TCurrencyEdit(Sender).Color:=$0080FFFF;
end;

procedure TFBuscaDAV.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then ImprimiCupom(Sender);
end;

procedure TFBuscaDAV.DBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13
     then ImprimiCupom(Sender);
end;

procedure TFBuscaDAV.dsBuscaDAVDataChange(Sender: TObject; Field: TField);
begin
     DM.TBuscaItemDAV.Close;
     DM.TBuscaItemDAV.Params[0].AsInteger:=DM.TBuscaDAVCODIGO.AsInteger;
     DM.TBuscaItemDAV.Open;
end;

procedure TFBuscaDAV.dsBuscaItemDAVDataChange(Sender: TObject;
  Field: TField);
begin
     DM.TBuscaGradeDAV.Close;
     DM.TBuscaGradeDAV.Params[0].AsInteger:=DM.TBuscaItemDAVCODIGO.AsInteger;
     DM.TBuscaGradeDAV.Params[1].AsInteger:=DM.TBuscaItemDAVCODPRODUTO.AsInteger;
     DM.TBuscaGradeDAV.Open;
end;

end.
