unit UCsFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, ExtCtrls, Grids, DBGrids;

type
  TCsFornecedorForm = class(TForm)
    Panel1: TPanel;
    BTCancelar: THTMLButton;
    BitBtn1: THTMLButton;
    DBGrid1: TDBGrid;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    CBPesquisar: TComboBox;
    EditPesquisar: TEdit;
    BTPesquisar: THTMLButton;
    CHApenasAtivos: TCheckBox;
    BTAdicionar: THTMLButton;
    procedure BTPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTAdicionarClick(Sender: TObject);
    procedure EditPesquisarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CsFornecedorForm: TCsFornecedorForm;

implementation
uses Base, UFuncoes, UCadFornecedor;
{$R *.dfm}

procedure TCsFornecedorForm.BTAdicionarClick(Sender: TObject);
begin
  try
    if not Assigned(CadFornecedorForm) then
      CadFornecedorForm := TCadFornecedorForm.Create(Application);
    if (CadFornecedorForm.ShowModal = mrOk) then
        with BancoDeDados.qryCsFornecedor do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select * from cadfornecedor where idfornecedor = '+
                IntToStr(FornecedorID));
            Open;
            Edit;
          end;
  finally
    CadFornecedorForm.Release;
    CadFornecedorForm := nil;
  end;
end;

procedure TCsFornecedorForm.BTPesquisarClick(Sender: TObject);
var
  Campo : ShortString;
begin
  case (CBPesquisar.ItemIndex) of
    0: Campo := 'idfornecedor';
    1: Campo := 'razao_social';
    2: Campo := 'nome_fantasia';
  end;
  with BancodeDados.qryCsFornecedor do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from cadfornecedor');
      if (CBPesquisar.ItemIndex in [0]) then
        begin
          if (EditPesquisar.Text <> '') then
              if (TestaInteiro(EditPesquisar.Text)) then
                SQL.Add(' where '+Campo+' = '+EditPesquisar.Text)
              else
                begin
                  MessageDlg('Para este filtro, são permitidos apenas números.',mtWarning,[mbOK],0);
                  EditPesquisar.SetFocus;
                  Abort;
                end;
        end
      else
        SQL.Add('where '+Campo+' ilike '+''''+EditPesquisar.Text+'%'+'''');
      if (CHApenasAtivos.Checked) then
        if (Pos('where',SQL.Text) > 0) then
          SQL.Add(' and ativo = '+QuotedStr('TRUE'))
        else
          SQL.Add(' where ativo = '+QuotedStr('TRUE'));
      SQL.Add('order by '+Campo);
      Open;
    end;
end;


procedure TCsFornecedorForm.EditPesquisarChange(Sender: TObject);
begin
  BTPesquisarClick(Self);
end;

procedure TCsFornecedorForm.FormShow(Sender: TObject);
begin
 BTPesquisarClick(Self);
end;

end.
