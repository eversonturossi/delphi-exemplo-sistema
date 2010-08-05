unit UCadastroProdutoPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, Buttons,
  ComCtrls, JvExControls, JvGradientHeaderPanel, DB, AppEvnts;

type
  TCadastroProdutoPrecoForm = class(TForm)
    Panel1: TPanel;
    GHPPrincipal: TJvGradientHeaderPanel;
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
    ApplicationEvents: TApplicationEvents;
    procedure BTConfirmarClick(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EditDescricaoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ApplicationEventsHint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaHint;
  public
    { Public declarations }
  published
    { Published declarations }
  end;

var
  CadastroProdutoPrecoForm: TCadastroProdutoPrecoForm;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TCadastroProdutoPrecoForm.CarregaHint;
begin
  CBAtivo.Hint := 'Informe se o Preço está Ativo/Inativo';
  EditDescricao.Hint := 'Informe a Descrição para o Preço';
  CBUnidade.Hint := 'Informe a Unidade do Produto para este Preço';
  EditPreco.Hint := 'Informe o Preço do Produto';
  EditMargemLucro.Hint := 'Informe a Margem de Lucro desejada';
  BTConfirmar.Hint := 'Confirmar Alterações';
  BTCancelar.Hint := 'Cancelar Alterações';
end;

procedure TCadastroProdutoPrecoForm.ApplicationEventsHint(Sender: TObject);
begin
  SBPrincipal.Panels[0].Text := Application.Hint;
end;

procedure TCadastroProdutoPrecoForm.BTCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TCadastroProdutoPrecoForm.BTConfirmarClick(Sender: TObject);
begin
  if not (EditDescricao.Text <> '') then
    begin
      Mensagem('Informe uma Descrição parao o Preço!', mtWarning,[mbOk],mrOK,0);
      EditDescricao.SetFocus;
      Abort;
    end;
  if not (EditPreco.Value > 0) then
    begin
      Mensagem('Informe um Preço para o Produto!', mtWarning,[mbOk],mrOK,0);
      EditPreco.SetFocus;
      Abort;
    end;
  if not (CBUnidade.Text <> '<selecione>') then
    begin
      Mensagem('Informe uma Unidade para o Produto!', mtWarning,[mbOk],mrOK,0);
      CBUnidade.SetFocus;
      Abort;
    end;

  if (BancoDados.CDSProdutoPreco.State in [dsInsert]) then
    begin
      with BancoDados.qryAuxiliar do
        begin
          Close;
          SQL.Text := 'select produto_preco_id from produto_preco' +
            ' where descricao = ' + QuotedStr(EditDescricao.Text);
          Open;
        end;

      if not (BancoDados.qryAuxiliar.IsEmpty) then
        begin
          Mensagem('Tipo de Preço já Cadastrado!', mtWarning,[mbOk],mrOK,0);
          EditDescricao.SetFocus;
          Abort;
        end;
    end;
  ModalResult := mrOk;
end;

procedure TCadastroProdutoPrecoForm.EditDescricaoExit(Sender: TObject);
var
  Temp : ShortString;
begin
  if (EditDescricao.Text <> '') then
    begin
      Temp := EditDescricao.Text;
      EditDescricao.Text := RetornaSemAcento(Temp);
    end;
end;

procedure TCadastroProdutoPrecoForm.FormCreate(Sender: TObject);
begin
  ApplicationEvents.Activate;
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

procedure TCadastroProdutoPrecoForm.FormShow(Sender: TObject);
begin
  CarregaHint;
end;

end.
