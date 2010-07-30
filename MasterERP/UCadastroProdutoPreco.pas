unit UCadastroProdutoPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, Buttons,
  ComCtrls, JvExControls, JvGradientHeaderPanel;

type
  TCadastroProdutoPrecoForm = class(TForm)
    Panel1: TPanel;
    JvGradientHeaderPanel1: TJvGradientHeaderPanel;
    SBPrincipal: TStatusBar;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    BTConfirmar: TSpeedButton;
    BTCancelar: TSpeedButton;
    CBUnidade: TComboBox;
    EditPreco: TJvValidateEdit;
    CBAtivo: TCheckBox;
    EditDescricao: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    EditMargemLucro: TJvValidateEdit;
    procedure BTConfirmarClick(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroProdutoPrecoForm: TCadastroProdutoPrecoForm;

implementation
uses Base;
{$R *.dfm}

procedure TCadastroProdutoPrecoForm.BTCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TCadastroProdutoPrecoForm.BTConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TCadastroProdutoPrecoForm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then
    begin
      key := #0;
      Perform(WM_NextDlgCtl,0,0);
    end;

  if (key = #27) then
    begin
      key := #0;
      Close;
    end;
end;

end.
