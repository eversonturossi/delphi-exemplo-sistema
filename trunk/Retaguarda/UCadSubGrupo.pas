unit UCadSubGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, ExtCtrls, ComCtrls, Mask, DBCtrls, Grids, DBGrids, DB,
  rxToolEdit, RXDBCtrl;

type
  TCadSubGrupoForm = class(TForm)
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
    DBLookupComboBox1: TDBLookupComboBox;
    Label4: TLabel;
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
  CadSubGrupoForm: TCadSubGrupoForm;
  SubGrupoID : Integer;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TCadSubGrupoForm.BTAlterarClick(Sender: TObject);
begin
  AbaSuperior.ActivePage := tsManutencao;
  DBEditNome.SetFocus;
end;

procedure TCadSubGrupoForm.BTCancelarClick(Sender: TObject);
begin
  BancoDeDados.qryCadSubGrupo.Cancel;
  BancoDeDados.qryCsSubGrupo.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadSubGrupoForm.BTExcluirClick(Sender: TObject);
begin
  try
    BancoDeDados.qryCadSubGrupo.Delete;
  except on E: EDatabaseError do
      if (Pos('violates foreign key',e.message) > 0) then
        MessageDlg('Não foi possivel excluir este registros.'+#13+
          'Foram localizados lançamentos feitos para este registro.',mtWarning,[mbOK],0);
  end;
  BancoDeDados.qryCsSubGrupo.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadSubGrupoForm.BTGravarClick(Sender: TObject);
begin
  BancoDeDados.qryCadSubGrupo.ApplyUpdates;
  AbaSuperior.ActivePage := tsConsulta;
end;

procedure TCadSubGrupoForm.BTInserirClick(Sender: TObject);
begin
  with BancodeDados.qryCsGrupo do
    begin
        Close;
        SQL.Clear;
        SQL.Add('select * from cadgrupo');
        Open;
    end;
  if not (BancoDeDados.qryCadSubGrupo.Active) then
    BancoDeDados.qryCadSubGrupo.Open;
  BancoDeDados.qryCadSubGrupo.Append;
  AbaSuperior.ActivePage := tsManutencao;
  DBEditNome.SetFocus;
end;

procedure TCadSubGrupoForm.BTPesquisarClick(Sender: TObject);
var
  Campo : ShortString;
begin
  case (CBPesquisar.ItemIndex) of
    0: Campo := 'idsubgrupo';
    1: Campo := 'nome';
    2: Campo := 'idgrupo';
  end;
  with BancodeDados.qryCsSubGrupo do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from cadsubgrupo');
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
        if (CBPesquisar.ItemIndex in [2]) then
          begin
            if (EditPesquisar.Text <> '') then
              SQL.Add('where idgrupo in(select idgrupo from cadgrupo where nome ilike '+''''+EditPesquisar.Text+'%'+''''+')')
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

procedure TCadSubGrupoForm.BTSairClick(Sender: TObject);
begin
  Close;
end;

procedure TCadSubGrupoForm.CBPesquisarChange(Sender: TObject);
begin
  EditPesquisar.Clear;
  EditPesquisar.SetFocus;
end;

procedure TCadSubGrupoForm.DBGrid1DblClick(Sender: TObject);
begin
  BTAlterarClick(Self);
end;

procedure TCadSubGrupoForm.EditPesquisarChange(Sender: TObject);
begin
  BTPesquisarClick(Self);
end;

procedure TCadSubGrupoForm.FormCreate(Sender: TObject);
begin
  AbaSuperior.ActivePage := tsConsulta;
  CHApenasAtivos.Checked := True;
end;

procedure TCadSubGrupoForm.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TCadSubGrupoForm.tsConsultaShow(Sender: TObject);
begin
  BTPesquisarClick(Self);
  EditPesquisar.SetFocus;
end;

procedure TCadSubGrupoForm.tsManutencaoShow(Sender: TObject);
begin
  if not (bancodeDados.qryCadSubGrupo.State in [dsInsert]) then
    begin
      with BancodeDados.qryCsGrupo do
        begin
            Close;
            SQL.Clear;
            SQL.Add('select * from cadgrupo');
            Open;
        end;
      with BancoDeDados.qryCadSubGrupo do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from cadsubgrupo where idsubgrupo = '+
              IntToStr(BancoDeDados.qryCsSubGrupoidsubgrupo.Value));
          Open;
          Edit;
        end;
    end;
end;

end.
