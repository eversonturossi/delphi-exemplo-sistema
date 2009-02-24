unit UCsUnidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, ExtCtrls, Grids, DBGrids;

type
  TCsUnidadeForm = class(TForm)
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
    CBTipo: TComboBox;
    Label3: TLabel;
    BTAdicionar: THTMLButton;
    procedure BTPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTAdicionarClick(Sender: TObject);
    procedure EditPesquisarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CsUnidadeForm: TCsUnidadeForm;


implementation
uses Base, UCadUnidade;
{$R *.dfm}

procedure TCsUnidadeForm.BTAdicionarClick(Sender: TObject);
begin
  try
    if not Assigned(CadUnidadeForm) then
      CadUnidadeForm := TCadUnidadeForm.Create(Application);
    if (CadUnidadeForm.ShowModal = mrOk) then
        with BancoDeDados.qryCsUnidade do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select * from cadunidade where idunidade = '+
                IntToStr(UnidadeID));
            Open;
            Edit;
          end;
  finally
    CadUnidadeForm.Release;
    CadUnidadeForm := nil;
  end;
end;

procedure TCsUnidadeForm.BTPesquisarClick(Sender: TObject);
var
  Campo : ShortString;
begin
  case (CBPesquisar.ItemIndex) of
    0: Campo := 'idunidade';
    1: Campo := 'descricao';
    2: Campo := 'abreviacao';
    3: Campo := 'tipo';
  end;
  with BancodeDados.qryCsUnidade do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from cadUnidade');
      if (CBPesquisar.ItemIndex in [0]) then
        begin
          if (EditPesquisar.Text <> '') then
            SQL.Add(' where '+Campo+' = '+EditPesquisar.Text);
        end
      else
        if (CBPesquisar.ItemIndex in [3]) then
          begin
             if (EditPesquisar.Text <> '') then
                begin
                 SQL.Add(' where '+Campo+' = '+EditPesquisar.Text);
                 SQL.Add(' and tipo = '+IntToStr(CBTipo.ItemIndex));
                end;
          end
        else
          SQL.Add('where '+Campo+' ilike '+''''+EditPesquisar.Text+'%'+'''');
      SQL.Add('order by '+Campo);
      Open;
    end;
end;


procedure TCsUnidadeForm.EditPesquisarChange(Sender: TObject);
begin
  BTPesquisarClick(Self);
end;

procedure TCsUnidadeForm.FormShow(Sender: TObject);
begin
 BTPesquisarClick(Self);
end;

end.
