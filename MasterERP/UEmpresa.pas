unit UEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UConsultaPadrao, FMTBcd, Menus, AppEvnts, DBClient, Provider,
  ActnList, DB, SqlExpr, ComCtrls, StdCtrls, Grids, DBGrids, Buttons,
  JvExControls, JvGradientHeaderPanel, ExtCtrls;

type
  TConsultaEmpresaForm = class(TConsultaPadraoForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConsultaEmpresaForm: TConsultaEmpresaForm;

implementation

{$R *.dfm}

end.
