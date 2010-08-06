unit UCadastroProdutoBarras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, JvExControls, JvGradientHeaderPanel, ExtCtrls,
  StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, AppEvnts;

type
  TCadastroProdutoBarrasForm = class(TForm)
    Panel1: TPanel;
    GHPPrincipal: TJvGradientHeaderPanel;
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
    ApplicationEvents: TApplicationEvents;
    procedure BTConfirmarClick(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure BTExibirCodigoBarrasClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EditCodigoBarrasExit(Sender: TObject);
    procedure EditFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ApplicationEventsHint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FBarraStatus : Boolean;
    procedure CarregaHint;
  public
    { Public declarations }
  published
    { Published declarations }
    property BarraStatus: Boolean read FBarraStatus write FBarraStatus;
  end;

var
  CadastroProdutoBarrasForm: TCadastroProdutoBarrasForm;

implementation
uses Base, UFuncoes, UPesquisaFornecedor, UPesquisaPadrao;
{$R *.dfm}

procedure TCadastroProdutoBarrasForm.CarregaHint;
begin
  EditFornecedor.Hint := 'Informe um Fornecedor';
  LBFornecedorNome.Hint := 'Nome do Fornecedor informado';
  CBTipoEAN.Hint := 'Tipo do Código de Barras';
  EditCodigoBarras.Hint := 'Código de Barras (Deve obedecer ao tipo Informado)';
  BTExibirCodigoBarras.Hint := 'Exibir o Código de Barras informado';
  Imagem.Hint := 'Imagem do Código de Barras informado';
  BTConfirmar.Hint := 'Confirmar alterações no Cadastro de Produtos referente' +
    ' ao Código de Barras';
  BTCancelar.Hint := 'Cancelar alterações no Cadastro de Produtos referente' +
    ' ao Código de Barras';
end;

procedure TCadastroProdutoBarrasForm.ApplicationEventsHint(Sender: TObject);
begin
  if (FBarraStatus) then
    SBPrincipal.Panels[0].Text := Application.Hint;
end;

procedure TCadastroProdutoBarrasForm.BTCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TCadastroProdutoBarrasForm.BTConfirmarClick(Sender: TObject);
begin
  if not (EditFornecedor.Value > 0) then
    begin
      Mensagem('Informe um Fornecedor!', mtWarning,[mbOk],mrOK,0);
      EditFornecedor.SetFocus;
      Abort;
    end;
  if (CBTipoEAN.ItemIndex <> -1) then
    begin
      Mensagem('Informe um Tipo de Código de Barras!', mtWarning,[mbOk],mrOK,0);
      CBTipoEAN.SetFocus;
      Abort;
    end;
  if not (EditCodigoBarras.Value > 0) then
    begin
      Mensagem('Informe um Código de Barras!', mtWarning,[mbOk],mrOK,0);
      EditCodigoBarras.SetFocus;
      Abort;
    end;

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

procedure TCadastroProdutoBarrasForm.EditFornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = 13) then
    begin
      if not (EditFornecedor.Value > 0) then
        begin
          try
            BarraStatus := False;
            if not Assigned(PesquisaFornecedorForm) then
              PesquisaFornecedorForm := TPesquisaFornecedorForm.Create(Application);
            if (PesquisaFornecedorForm.ShowModal = mrOk) then
              begin
                EditFornecedor.Value := PesquisaFornecedorForm.ID;
                LBFornecedorNome.Caption := PesquisaFornecedorForm.Descricao;
              end;
            EditFornecedor.SetFocus;
            Abort;
          finally
            PesquisaFornecedorForm.Free;
            PesquisaFornecedorForm := nil;
            BarraStatus := True;
          end;
        end
      else
        CBTipoEAN.SetFocus;
    end;
end;

procedure TCadastroProdutoBarrasForm.FormCreate(Sender: TObject);
begin
  ApplicationEvents.Activate;
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

procedure TCadastroProdutoBarrasForm.FormShow(Sender: TObject);
begin
  BarraStatus := True;
  CarregaHint;
  if (EditCodigoBarras.Value > 0) then
    BTExibirCodigoBarrasClick(Sender);
end;

procedure TCadastroProdutoBarrasForm.BTExibirCodigoBarrasClick(Sender: TObject);
begin
  ExibirCodigoBarras(EditCodigoBarras.Value, Imagem);
end;

end.
