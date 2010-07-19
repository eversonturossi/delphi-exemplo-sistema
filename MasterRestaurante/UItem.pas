unit UItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit;

type
  TItemForm = class(TForm)
    EditItem: TJvValidateEdit;
    LBTexto: TLabel;
    procedure FormShow(Sender: TObject);
    procedure EditItemKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ItemForm: TItemForm;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TItemForm.EditItemKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    ModalResult := mrOk;

  if (key = #27) then
    ModalResult := mrCancel;
end;

procedure TItemForm.FormShow(Sender: TObject);
begin
  EditItem.SetFocus;
end;

end.
