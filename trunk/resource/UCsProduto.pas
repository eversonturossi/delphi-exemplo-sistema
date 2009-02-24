unit UCsProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, ExtCtrls, Grids, DBGrids;

type
  TCsProdutoForm = class(TForm)
    Panel1: TPanel;
    BTCancelar: THTMLButton;
    BitBtn1: THTMLButton;
    DBGrid1: TDBGrid;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    CBPesquisar: TComboBox;
    EditPesquisar: TEdit;
    BTPesquisar: THTMLButton;
    CHApenasAtivos: TCheckBox;
    procedure BTPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditPesquisarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CsProdutoForm: TCsProdutoForm;

implementation
uses Base;
{$R *.dfm}

procedure TCsProdutoForm.BTPesquisarClick(Sender: TObject);
var
  Campo : ShortString;
begin
  case (CBPesquisar.ItemIndex) of
    0: Campo := 'idProduto';
    1: Campo := 'descricao';
    2: Campo := 'descricao_reduzida';
    3: Campo := 'referencia';
  end;
  with BancodeDados.qryCsProduto do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from cadProduto');
      if (CBPesquisar.ItemIndex in [0]) then
        begin
          if (EditPesquisar.Text <> '') then
            SQL.Add(' where '+Campo+' = '+EditPesquisar.Text);
        end
      else
        SQL.Add('where '+Campo+' ilike '+''''+EditPesquisar.Text+'%'+'''');
      if (CHApenasAtivos.Checked) then
        if (Pos('where',SQL.Text) > 0) then
          SQL.Add(' and ativo = '+QuotedStr('TRUE'))
        else
          SQL.Add(' where ativo = '+QuotedStr('TRUE'));
      SQL.Add('order by '+Campo);
      Open;
    end;
end;


procedure TCsProdutoForm.EditPesquisarChange(Sender: TObject);
begin
  BTPesquisarClick(Self);
end;

procedure TCsProdutoForm.FormShow(Sender: TObject);
begin
 BTPesquisarClick(Self);
end;

end.
