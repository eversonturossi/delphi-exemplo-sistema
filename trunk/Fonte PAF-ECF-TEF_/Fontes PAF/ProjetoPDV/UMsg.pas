unit UMsg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mylabel, ExtCtrls;

type
  TFMsg = class(TForm)
    PMensagem: TPanel;
    LMensagem2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMsg: TFMsg;

implementation

{$R *.dfm}

end.
