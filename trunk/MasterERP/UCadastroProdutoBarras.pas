unit UCadastroProdutoBarras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, JvExControls, JvGradientHeaderPanel, ExtCtrls,
  StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit;

type
  TCadastroProdutoBarrasForm = class(TForm)
    Panel1: TPanel;
    JvGradientHeaderPanel1: TJvGradientHeaderPanel;
    SBPrincipal: TStatusBar;
    Panel2: TPanel;
    Panel3: TPanel;
    BTConfirmar: TSpeedButton;
    BTCancelar: TSpeedButton;
    Label1: TLabel;
    CBTipoEAN: TComboBox;
    Label3: TLabel;
    EditFornecedor: TJvValidateEdit;
    LBFornecedorNome: TLabel;
    EditCodigoBarras: TJvValidateEdit;
    Label2: TLabel;
    Panel4: TPanel;
    Imagem: TImage;
    BTExibirCodigoBarras: TSpeedButton;
    procedure BTConfirmarClick(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure BTExibirCodigoBarrasClick(Sender: TObject);
    procedure EditFornecedorExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EditCodigoBarrasExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroProdutoBarrasForm: TCadastroProdutoBarrasForm;

implementation
uses UFuncoes, UPesquisaFornecedor, UPesquisaPadrao;
{$R *.dfm}

procedure TCadastroProdutoBarrasForm.BTCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TCadastroProdutoBarrasForm.BTConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TCadastroProdutoBarrasForm.EditCodigoBarrasExit(Sender: TObject);
begin
  if (CBTipoEAN.Text = 'EAN 8') then
    begin
      if (Length(EditCodigoBarras.Text) <> 8) then
        begin
          Mensagem('Informe 8 Algarismos para este Tipo de EAN!', mtWarning,[mbOk],mrOK,0);
          EditCodigoBarras.SetFocus;
          Abort;
        end;
    end
  else if (CBTipoEAN.Text = 'EAN 13') then
    begin
      if (Length(EditCodigoBarras.Text) <> 13) then
        begin
          Mensagem('Informe 13 Algarismos para este Tipo de EAN!', mtWarning,[mbOk],mrOK,0);
          EditCodigoBarras.SetFocus;
          Abort;
        end;
    end;
end;

procedure TCadastroProdutoBarrasForm.EditFornecedorExit(Sender: TObject);
var
  Padrao : TPesquisaPadraoForm;
begin
  if not (EditFornecedor.Value > 0) then
    begin
      try
        if not Assigned(PesquisaFornecedorForm) then
          PesquisaFornecedorForm := TPesquisaFornecedorForm.Create(Application);
        PesquisaFornecedorForm.Tabela := 'FORNECEDOR';
        if (PesquisaFornecedorForm.ShowModal = mrOk) then
          begin
            EditFornecedor.Value := Padrao.ID;
            LBFornecedorNome.Caption := Padrao.Descricao;
          end;
      finally
        PesquisaFornecedorForm.Free;
        PesquisaFornecedorForm := nil;
      end;
    end;
end;

procedure TCadastroProdutoBarrasForm.FormKeyPress(Sender: TObject;
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

procedure TCadastroProdutoBarrasForm.BTExibirCodigoBarrasClick(Sender: TObject);
begin
  ExibirCodigoBarras(EditCodigoBarras.Value, Imagem);
end;

end.
