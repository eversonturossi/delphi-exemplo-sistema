unit USobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, Mylabel;

type
  TFSobre = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    myLabel3d1: TmyLabel3d;
    L_Razao: TmyLabel3d;
    myLabel3d2: TmyLabel3d;
    myLabel3d3: TmyLabel3d;
    L_Fantasia: TmyLabel3d;
    myLabel3d4: TmyLabel3d;
    myLabel3d5: TmyLabel3d;
    L_IE: TmyLabel3d;
    L_Cnpj: TmyLabel3d;
    Bevel1: TBevel;
    myLabel3d6: TmyLabel3d;
    myLabel3d7: TmyLabel3d;
    myLabel3d10: TmyLabel3d;
    myLabel3d11: TmyLabel3d;
    myLabel3d12: TmyLabel3d;
    Bevel2: TBevel;
    myLabel3d13: TmyLabel3d;
    myLabel3d14: TmyLabel3d;
    myLabel3d16: TmyLabel3d;
    Label1: TLabel;
    Image2: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSobre: TFSobre;

implementation

uses dmsyndAC;

{$R *.dfm}

procedure TFSobre.FormShow(Sender: TObject);
begin
     DM.TEmpresa.Open;
     DM.TEmpresa.Refresh;
     L_Fantasia.Caption:=DM.TEmpresaNOME_FANTASIA.Value;
     L_Razao.Caption:=DM.TEmpresaRAZAO_SOCIAL.Value;
     L_Cnpj.Caption:=DM.TEmpresaCNPJ.Value;
     L_IE.Caption:=DM.TEmpresaINSC_ESTADUAL.Value;
end;

procedure TFSobre.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_Escape
     then Close;
end;

procedure TFSobre.FormDestroy(Sender: TObject);
begin
     DM.TEmpresa.Close;
end;

end.
