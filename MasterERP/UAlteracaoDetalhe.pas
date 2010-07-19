unit UAlteracaoDetalhe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids;

type
  TAlteracaoDetalheForm = class(TForm)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    Label1: TLabel;
    DBText3: TDBText;
    Panel1: TPanel;
    BTFechar: TSpeedButton;
    DBGrid2: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure BTFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AlteracaoDetalheForm: TAlteracaoDetalheForm;

implementation
uses Base;
{$R *.dfm}

procedure TAlteracaoDetalheForm.BTFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TAlteracaoDetalheForm.FormCreate(Sender: TObject);
begin
  BTFechar.Glyph.LoadFromFile(BancoDados.imgFechar);
end;

end.
