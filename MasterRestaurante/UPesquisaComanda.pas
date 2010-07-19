unit UPesquisaComanda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, JvExControls,
  JvGradientHeaderPanel, ExtCtrls;

type
  TPesquisaComandaForm = class(TForm)
    Panel1: TPanel;
    JvGradientHeaderPanel1: TJvGradientHeaderPanel;
    SBPrincipal: TStatusBar;
    Panel2: TPanel;
    Panel4: TPanel;
    BTConfirmar: TSpeedButton;
    BTCancelar: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditPesquisar: TEdit;
    CBCriterio: TComboBox;
    DBGrid1: TDBGrid;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure BTConfirmarClick(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
    procedure EditPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MesaID : Integer;
  end;

var
  PesquisaComandaForm: TPesquisaComandaForm;

implementation
uses Base, UFuncoes, UPrincipal;
{$R *.dfm}

procedure TPesquisaComandaForm.Action1Execute(Sender: TObject);
begin
  CBCriterio.ItemIndex := 0;
  EditPesquisar.Text := '';
  EditPesquisar.SetFocus;
end;

procedure TPesquisaComandaForm.Action2Execute(Sender: TObject);
begin
  CBCriterio.ItemIndex := 1;
  EditPesquisar.Text := '';
  EditPesquisar.SetFocus;
end;

procedure TPesquisaComandaForm.Action3Execute(Sender: TObject);
begin
  CBCriterio.ItemIndex := 2;
  EditPesquisar.Text := '';
  EditPesquisar.SetFocus;
end;

procedure TPesquisaComandaForm.Action4Execute(Sender: TObject);
begin
  CBCriterio.ItemIndex := 3;
  EditPesquisar.Text := '';
  EditPesquisar.SetFocus;
end;

procedure TPesquisaComandaForm.Action5Execute(Sender: TObject);
begin
  BTCancelarClick(Sender);
end;

procedure TPesquisaComandaForm.Action6Execute(Sender: TObject);
begin
  BTConfirmarClick(Sender);
end;

procedure TPesquisaComandaForm.BTCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TPesquisaComandaForm.BTConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TPesquisaComandaForm.EditPesquisarKeyPress(Sender: TObject;
  var Key: Char);
var
  Campo, SQLConsulta : ShortString;
begin
  if (Key = #13) then
    begin
      BancoDados.CDSRestauranteComanda.Close;
      SQLConsulta := 'select * from restaurante_comanda where fechado = 1 and cancelado = 0';

      if (EditPesquisar.Text <> '') then
        begin
          case CBCriterio.ItemIndex of
            0: begin
              if (TestaInteiro(EditPesquisar.Text)) then
                SQLConsulta := SQLConsulta + ' and restaurante_comanda_id = ' + EditPesquisar.Text
              else
                begin
                  Mensagem('São permitidos apenas Números para este filtro!', mtWarning,[mbOk],mrOK,0);
                  Abort;
                end;
            end;
            1: begin
              if (TestaInteiro(EditPesquisar.Text)) then
                SQLConsulta := SQLConsulta + ' and venda_id = ' + EditPesquisar.Text
              else
                begin
                  Mensagem('São permitidos apenas Números para este filtro!', mtWarning,[mbOk],mrOK,0);
                  Abort;
                end;
            end;
            2: begin
              SQLConsulta := SQLConsulta + ' and restaurante_garcon_id in(select restaurante_garcon_id' +
                ' from restaurante_garcon where nome like ' + QuotedStr(EditPesquisar.Text + '%') + ')';
            end;
            3: begin
              SQLConsulta := SQLConsulta + ' and vendedor_id in(select vendedor_id' +
                ' from vendedor where nome like ' + QuotedStr(EditPesquisar.Text + '%') + ')';
            end;
          end;
        end;

      BancoDados.qryRestauranteComanda.SQL.Text := SQLConsulta ;
      BancoDados.CDSRestauranteComanda.Open;
    end;
end;

procedure TPesquisaComandaForm.FormShow(Sender: TObject);
begin
  BancoDados.CDSVendedor.Close;
  BancoDados.qryVendedor.SQL.Text := 'select * from vendedor';
  BancoDados.CDSVendedor.Open;

  BancoDados.CDSRestauranteGarcon.Close;
  BancoDados.qryRestauranteGarcon.SQL.Text := 'select * from restaurante_garcon';
  BancoDados.CDSRestauranteGarcon.Open;

  BancoDados.CDSRestauranteComanda.Close;
  BancoDados.qryRestauranteComanda.SQL.Text := 'select * from restaurante_comanda' +
      ' where cancelado = 0 and fechado = 1 and vendedor_id = ' + IntToStr(VendedorID) +
      ' and restaurante_mesa_id in(select restaurante_mesa_id from restaurante_mesa' +
      ' where numero = ' + IntToStr(MesaID) + ') and venda_id in(select venda_id' +
      ' from venda where fechado = 0)';
  BancoDados.CDSRestauranteComanda.Open;
end;

end.
