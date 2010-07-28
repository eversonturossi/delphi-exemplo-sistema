unit UCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastroPadrao, FMTBcd, ActnList, AppEvnts, DB, SqlExpr, Provider,
  DBClient, StdCtrls, DBCtrls, Buttons, JvExControls, JvGradientHeaderPanel,
  ExtCtrls, ComCtrls;

type
  TCadastroClienteForm = class(TCadastroPadraoForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroClienteForm: TCadastroClienteForm;

implementation

{$R *.dfm}

end.
