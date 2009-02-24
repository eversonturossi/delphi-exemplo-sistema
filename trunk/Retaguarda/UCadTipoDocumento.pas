unit UCadTipoDocumento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, ExtCtrls, ComCtrls, Mask, DBCtrls, Grids, DBGrids, DB,
  rxToolEdit, RXDBCtrl;

type
  TCadTipoDocumentoForm = class(TForm)
    AbaSuperior: TPageControl;
    tsConsulta: TTabSheet;
    tsManutencao: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BTPesquisar: THTMLButton;
    CBPesquisar: TComboBox;
    EditPesquisar: TEdit;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    BTInserir: THTMLButton;
    BTAlterar: THTMLButton;
    BTSair: THTMLButton;
    Panel4: TPanel;
    Label5: TLabel;
    DBText1: TDBText;
    DBCheckBox2: TDBCheckBox;
    Label3: TLabel;
    DBEditNome: TDBEdit;
    Panel3: TPanel;
    BTGravar: THTMLButton;
    BTCancelar: THTMLButton;
    BTExcluir: THTMLButton;
    Label28: TLabel;
    CHApenasAtivos: TCheckBox;
    DBDateEdit1: TDBDateEdit;
    procedure BTInserirClick(Sender: TObject);
    procedure BTAlterarClick(Sender: TObject);
    procedure BTSairClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure CBPesquisarChange(Sender: TObject);
    procedure EditPesquisarChange(Sender: TObject);
    procedure BTPesquisarClick(Sender: TObject);
    procedure BTGravarClick(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure BTExcluirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure tsConsultaShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tsManutencaoShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadTipoDocumentoForm: TCadTipoDocumentoForm;
  TipoDocumentoID : Integer;
implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TCadTipoDocumentoForm.BTAlterarClick(Sender: TObject);
begin
  AbaSuperior.ActivePage := tsManutencao;
  DBEditNome.SetFocus;
end;

procedure TCadTipoDocumentoForm.BTCancelarClick(Sender: TObject);
begin
  BancoDeDados.qryCadTipoDocumento.Cancel;
  BancoDeDados.qryCsTipoDocumento.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadTipoDocumentoForm.BTExcluirClick(Sender: TObject);
begin
  try
    BancoDeDados.qryCadTipoDocumento.Delete;
  except on E: EDatabaseError do
      if (Pos('violates foreign key',e.message) > 0) then
        MessageDlg('Não foi possivel excluir este registros.'+#13+
          'Foram localizados lançamentos feitos para este registro.',mtWarning,[mbOK],0);
  end;
  BancoDeDados.qryCsTipoDocumento.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadTipoDocumentoForm.BTGravarClick(Sender: TObject);
begin
  BancoDeDados.qryCadTipoDocumento.Post;
  AbaSuperior.ActivePage := tsConsulta;
end;

procedure TCadTipoDocumentoForm.BTInserirClick(Sender: TObject);
begin
  if not (BancoDeDados.qryCadTipoDocumento.Active) then
    BancoDeDados.qryCadTipoDocumento.Open;
  BancoDeDados.qryCadTipoDocumento.Append;
  AbaSuperior.ActivePage := tsManutencao;
  DBEditNome.SetFocus;
end;

procedure TCadTipoDocumentoForm.BTPesquisarClick(Sender: TObject);
var
  Campo : ShortString;
begin
  case (CBPesquisar.ItemIndex) of
    0: Campo := 'idtipo_documento';
    1: Campo := 'descricao';
  end;
  with BancodeDados.qryCsTipoDocumento do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from cadtipo_documento');
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

procedure TCadTipoDocumentoForm.BTSairClick(Sender: TObject);
begin
  Close;
end;

procedure TCadTipoDocumentoForm.CBPesquisarChange(Sender: TObject);
begin
  EditPesquisar.Clear;
  EditPesquisar.SetFocus;
end;

procedure TCadTipoDocumentoForm.DBGrid1DblClick(Sender: TObject);
begin
  BTAlterarClick(Self);
end;

procedure TCadTipoDocumentoForm.EditPesquisarChange(Sender: TObject);
begin
  BTPesquisarClick(Self);
end;

procedure TCadTipoDocumentoForm.FormCreate(Sender: TObject);
begin
  AbaSuperior.ActivePage := tsConsulta;
  CHApenasAtivos.Checked := True;
end;

procedure TCadTipoDocumentoForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    begin
      Key := #0;
      Perform(WM_NEXTDLGCTL,0,0);
    end;
  if (key = #27) then
    begin
      key := #0;
      Close;
    end;
end;

procedure TCadTipoDocumentoForm.tsConsultaShow(Sender: TObject);
begin
  BTPesquisarClick(Self);
  EditPesquisar.SetFocus;
end;

procedure TCadTipoDocumentoForm.tsManutencaoShow(Sender: TObject);
begin
  if not (BancodeDados.qryCadTipoDocumento.State in [dsInsert]) then
    with BancoDeDados.qryCadTipoDocumento do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from cadtipo_documento where idtipo_documento = '+
            IntToStr(BancoDeDados.qryCsTipoDocumentoidtipo_documento.Value));
        Open;
        Edit;
      end;
end;

end.
