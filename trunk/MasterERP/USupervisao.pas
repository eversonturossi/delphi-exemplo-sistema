unit USupervisao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TSupervisaoForm = class(TForm)
    Label4: TLabel;
    EditLogin: TEdit;
    Label5: TLabel;
    EditSenha: TEdit;
    Panel1: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SupervisaoForm: TSupervisaoForm;

implementation

{$R *.dfm}

end.
