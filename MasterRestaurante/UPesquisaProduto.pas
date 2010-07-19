unit UPesquisaProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, JvExControls, JvGradientHeaderPanel,
  ExtCtrls, ComCtrls, StdCtrls, ActnList;

type
  TPesquisaProdutoForm = class(TForm)
    SBPrincipal: TStatusBar;
    Panel1: TPanel;
    JvGradientHeaderPanel1: TJvGradientHeaderPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    BTCancelar: TSpeedButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    EditPesquisar: TEdit;
    Label2: TLabel;
    CBCriterio: TComboBox;
    Label3: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    procedure FormShow(Sender: TObject);
    procedure CBCriterioSelect(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure EditPesquisarChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BTCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PesquisaProdutoForm: TPesquisaProdutoForm;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TPesquisaProdutoForm.Action1Execute(Sender: TObject);
begin
  CBCriterio.ItemIndex := 0;
  EditPesquisar.Text := '';
  EditPesquisar.SetFocus;
end;

procedure TPesquisaProdutoForm.Action2Execute(Sender: TObject);
begin
  CBCriterio.ItemIndex := 1;
  EditPesquisar.Text := '';
  EditPesquisar.SetFocus;
end;

procedure TPesquisaProdutoForm.BTCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TPesquisaProdutoForm.CBCriterioSelect(Sender: TObject);
begin
  EditPesquisar.Text := '';
  EditPesquisar.SetFocus;
end;

procedure TPesquisaProdutoForm.EditPesquisarChange(Sender: TObject);
var
  Campo, SQLConsulta : ShortString;
begin
  BancoDados.CDSProduto.Close;
  SQLConsulta := 'select * from produto where ativo = 1';

  if (EditPesquisar.Text <> '') then
    begin
      case CBCriterio.ItemIndex of
        0: begin
          if (TestaInteiro(EditPesquisar.Text)) then
            SQLConsulta := SQLConsulta + ' and produto_id = ' + EditPesquisar.Text
          else
            begin
              Mensagem('São permitidos apenas Números para este filtro!', mtWarning,[mbOk],mrOK,0);
              Abort;
            end;
        end;
        1: SQLConsulta := SQLConsulta + ' and Upper(descricao) like ' + QuotedStr(UpperCase(EditPesquisar.Text) + '%');
      end;
    end;

  BancoDados.qryProduto.SQL.Text := SQLConsulta;
  BancoDados.CDSProduto.Open;
  BancoDados.CDSProduto.First;
end;

procedure TPesquisaProdutoForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_UP) then
    begin
      if not (BancoDados.CDSProduto.Bof) then
        BancoDados.CDSProduto.Prior;
    end
  else if (Key = VK_DOWN) then
    begin
      if not (BancoDados.CDSProduto.Eof) then
        BancoDados.CDSProduto.Next;
    end
end;

procedure TPesquisaProdutoForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    begin
      Key := #0;
      if not (BancoDados.CDSProduto.IsEmpty) then
        ModalResult := mrOk
      else
        ModalResult := mrCancel;
    end
  else if (Key = #27) then
    begin
      Key := #0;
      ModalResult := mrCancel;
    end;
end;

procedure TPesquisaProdutoForm.FormShow(Sender: TObject);
begin
  EditPesquisar.SetFocus;
  BancoDados.CDSUnidade.Close;
  BancoDados.qryUnidade.SQL.Text := 'select * from unidade where ativo = 1';
  BancoDados.CDSUnidade.Open;

  BancoDados.CDSProduto.Close;
  BancoDados.qryProduto.SQL.Text := 'select * from produto where ativo = 1';
  BancoDados.CDSProduto.Open;
  BancoDados.CDSProduto.First;
end;

end.
