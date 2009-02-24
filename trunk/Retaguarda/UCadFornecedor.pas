unit UCadFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, ExtCtrls, ComCtrls, Mask, DBCtrls, Grids, DBGrids, DB,
  Tabs, rxToolEdit, RXDBCtrl;

type
  TCadFornecedorForm = class(TForm)
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
    Panel3: TPanel;
    BTGravar: THTMLButton;
    BTCancelar: THTMLButton;
    BTExcluir: THTMLButton;
    tsPrincipal: TTabSet;
    NBManutencao: TNotebook;
    DBEditNome: TDBEdit;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBComboBox1: TDBComboBox;
    Label18: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label28: TLabel;
    DBCheckBox1: TDBCheckBox;
    DTUltimaCompra: TDBEdit;
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
    procedure tsPrincipalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadFornecedorForm: TCadFornecedorForm;
  FornecedorID : Integer;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TCadFornecedorForm.BTAlterarClick(Sender: TObject);
begin
  AbaSuperior.ActivePage := tsManutencao;
  NBManutencao.ActivePage := 'Principal';
  DBEditNome.SetFocus;
end;

procedure TCadFornecedorForm.BTCancelarClick(Sender: TObject);
begin
  BancoDeDados.qryCadFornecedor.Cancel;
  BancoDeDados.qryCsFornecedor.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadFornecedorForm.BTExcluirClick(Sender: TObject);
begin
  try
    BancoDeDados.qryCadFornecedor.Delete;
  except on E: EDatabaseError do
      if (Pos('violates foreign key',e.message) > 0) then
        MessageDlg('Não foi possivel excluir este registros.'+#13+
          'Foram localizados lançamentos feitos para este registro.',mtWarning,[mbOK],0);
  end;
  BancoDeDados.qryCsFornecedor.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadFornecedorForm.BTGravarClick(Sender: TObject);
begin
  BancoDeDados.qryCadFornecedor.ApplyUpdates;
  FornecedorID := BancoDeDados.qryCadFornecedorIDFORNECEDOR.Value;
  AbaSuperior.ActivePage := tsConsulta;
end;

procedure TCadFornecedorForm.BTInserirClick(Sender: TObject);
begin
  if not (BancoDeDados.qryCadFornecedor.Active) then
    BancoDeDados.qryCadFornecedor.Open;
  BancoDeDados.qryCadFornecedor.Append;
  AbaSuperior.ActivePage := tsManutencao;
  NBManutencao.ActivePage := 'Principal';
  DBEditNome.SetFocus;
end;

procedure TCadFornecedorForm.BTPesquisarClick(Sender: TObject);
var
  Campo : ShortString;
begin
  case (CBPesquisar.ItemIndex) of
    0: Campo := 'idfornecedor';
    1: Campo := 'razao_social';
    2: Campo := 'nome_fantasia';
    3: Campo := 'telefone_comercial';
    4: Campo := 'telefone_fax';
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

procedure TCadFornecedorForm.BTSairClick(Sender: TObject);
begin
  Close;
end;

procedure TCadFornecedorForm.CBPesquisarChange(Sender: TObject);
begin
  EditPesquisar.Clear;
  EditPesquisar.SetFocus;
end;

procedure TCadFornecedorForm.DBGrid1DblClick(Sender: TObject);
begin
  BTAlterarClick(Self);
end;

procedure TCadFornecedorForm.EditPesquisarChange(Sender: TObject);
begin
  BTPesquisarClick(Self);
end;

procedure TCadFornecedorForm.FormCreate(Sender: TObject);
begin
  AbaSuperior.ActivePage := tsConsulta;
  CHApenasAtivos.Checked := True;
end;

procedure TCadFornecedorForm.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TCadFornecedorForm.tsPrincipalClick(Sender: TObject);
begin
  NBManutencao.PageIndex := tsPrincipal.TabIndex;
end;

procedure TCadFornecedorForm.tsConsultaShow(Sender: TObject);
begin
  BTPesquisarClick(Self);
  EditPesquisar.SetFocus;
end;

procedure TCadFornecedorForm.tsManutencaoShow(Sender: TObject);
begin
  if not (BancodeDados.qryCadFornecedor.State in [dsInsert]) then
    with BancoDeDados.qryCadFornecedor do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from cadfornecedor where idfornecedor = '+
            IntToStr(BancoDeDados.qryCsFornecedoridfornecedor.Value));
        Open;
        Edit;
      end;
end;

end.
