unit UCadObservacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, ExtCtrls;

type
  TCadObservacaoForm = class(TForm)
    Panel1: TPanel;
    BTCancelar: THTMLButton;
    BitBtn1: THTMLButton;
    MObservacao: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadObservacaoForm: TCadObservacaoForm;

implementation

{$R *.dfm}

end.
