unit ULancamentoPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ULancamentoPadrao, FMTBcd, AppEvnts, ActnList, DB, DBClient,
  Provider, SqlExpr, ComCtrls, Buttons, JvExControls, JvGradientHeaderPanel,
  ExtCtrls, Grids, DBGrids, StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit,
  DBCtrls, Mask, JvExMask, JvToolEdit, JvDBControls;

type
  TLancamentoPedidoForm = class(TLancamentoPadraoForm)
    Panel2: TPanel;
    Label4: TLabel;
    DBTextDataCadastro: TDBText;
    Label5: TLabel;
    DBTextUltimaAlteracao: TDBText;
    Label2: TLabel;
    DBCCancelado: TDBCheckBox;
    DBCFinalizado: TDBCheckBox;
    EditaDataEntrada: TJvDBDateEdit;
    Label16: TLabel;
    DBEditCodigo: TDBEdit;
    Label1: TLabel;
    EditCliente: TJvValidateEdit;
    LBClienteNome: TLabel;
    Label3: TLabel;
    EditVendedor: TJvValidateEdit;
    LBVendedorNome: TLabel;
    Label6: TLabel;
    EditProduto: TJvValidateEdit;
    Label7: TLabel;
    EditDescricao: TEdit;
    Label14: TLabel;
    CBUnidade: TComboBox;
    Label8: TLabel;
    EditQuantidade: TJvValidateEdit;
    Label9: TLabel;
    EditValorUnitario: TJvValidateEdit;
    Label10: TLabel;
    EditTotal: TJvValidateEdit;
    DBGrid1: TDBGrid;
    Label11: TLabel;
    DBEditAcrescimo: TDBEdit;
    Label12: TLabel;
    DBEditDesconto: TDBEdit;
    Label13: TLabel;
    DBTextSubTotal: TDBText;
    Label15: TLabel;
    DBTextTotal: TDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LancamentoPedidoForm: TLancamentoPedidoForm;

implementation

{$R *.dfm}

end.
