unit UPesquisaFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPesquisaPadrao, FMTBcd, ActnList, Menus, AppEvnts, DB, DBClient,
  Provider, SqlExpr, Grids, DBGrids, StdCtrls, JvExControls,
  JvGradientHeaderPanel, ExtCtrls, ComCtrls;

type
  TPesquisaFornecedorForm = class(TPesquisaPadraoForm)
    CDSConsultaPESSOA_ID: TIntegerField;
    CDSConsultaATIVO: TSmallintField;
    CDSConsultaDATA_CADASTRO: TSQLTimeStampField;
    CDSConsultaDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSConsultaNOME_RAZAO: TStringField;
    CDSConsultaNOME_APELIDO_FANTASIA: TStringField;
    CDSConsultaFORNECEDOR_ID: TIntegerField;
    CDSConsultaCNPJ_CPF: TStringField;
    CDSConsultaTIPO: TStringField;
    CDSConsultaIE_IDENTIDADE: TStringField;
    CDSConsultaIM: TStringField;
    CDSConsultaFILIAL: TSmallintField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PesquisaFornecedorForm: TPesquisaFornecedorForm;

implementation

{$R *.dfm}

end.
