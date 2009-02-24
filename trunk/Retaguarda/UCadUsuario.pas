unit UCadUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, ExtCtrls, ComCtrls, Mask, DBCtrls, Grids, DBGrids, DB,
  rxToolEdit, RXDBCtrl;

type
  TCadUsuarioForm = class(TForm)
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
    DBEdit1: TDBEdit;
    Label4: TLabel;
    Image2: TImage;
    Image1: TImage;
    Label6: TLabel;
    EditNovaSenha: TEdit;
    Label7: TLabel;
    EditConfirmaSenha: TEdit;
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
  CadUsuarioForm: TCadUsuarioForm;
  UsuarioID : Integer;
implementation
uses Base, UFuncoes, Base64;
{$R *.dfm}

procedure TCadUsuarioForm.BTAlterarClick(Sender: TObject);
begin
  AbaSuperior.ActivePage := tsManutencao;
  DBEditNome.SetFocus;
end;

procedure TCadUsuarioForm.BTCancelarClick(Sender: TObject);
begin
  BancoDeDados.qryCadUsuario.Cancel;
  BancoDeDados.qryCsUsuario.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadUsuarioForm.BTExcluirClick(Sender: TObject);
begin
  BancoDeDados.qryCadUsuario.Delete;
  BancoDeDados.qryCsUsuario.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadUsuarioForm.BTGravarClick(Sender: TObject);
begin
  if (EditNovaSenha.Text <> '') or (EditConfirmaSenha.Text <> '') then
    begin
        if (Trim(EditNovaSenha.Text) <> Trim(EditConfirmaSenha.Text)) then
          begin
            MessageDlg('As senhas informadas não conhincidem.',mtWarning,[mbOK],0);
            EditNovaSenha.Clear;
            EditConfirmaSenha.Clear;
            EditNovaSenha.SetFocus;
            Abort;
          end
        else
          begin
            if not (BancoDeDados.qryCadUsuario.State in [dsEdit, dsInsert]) then
              BancoDeDados.qryCadUsuario.Edit;
            BancoDeDados.qryCadUsuariosenha.Value := Base64EncodeStr(EditNovaSenha.Text);
            BancoDeDados.qryCadUsuario.Post;
            AbaSuperior.ActivePage := tsConsulta;
          end;
    end
  else
    begin
      BancoDeDados.qryCadUsuario.ApplyUpdates;
      AbaSuperior.ActivePage := tsConsulta;
    end;
end;

procedure TCadUsuarioForm.BTInserirClick(Sender: TObject);
begin
  if not (BancoDeDados.qryCadUsuario.Active) then
    BancoDeDados.qryCadUsuario.Open;
  BancoDeDados.qryCadUsuario.Append;
  AbaSuperior.ActivePage := tsManutencao;
  DBEditNome.SetFocus;
end;

procedure TCadUsuarioForm.BTPesquisarClick(Sender: TObject);
var
  Campo : ShortString;
begin
  case (CBPesquisar.ItemIndex) of
    0: Campo := 'idusuario';
    1: Campo := 'nome';
    2: Campo := 'login';
  end;
  with BancodeDados.qryCsUsuario do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from cadusuario');
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

procedure TCadUsuarioForm.BTSairClick(Sender: TObject);
begin
  Close;
end;

procedure TCadUsuarioForm.CBPesquisarChange(Sender: TObject);
begin
  EditPesquisar.Clear;
  EditPesquisar.SetFocus;
end;

procedure TCadUsuarioForm.DBGrid1DblClick(Sender: TObject);
begin
  BTAlterarClick(Self);
end;

procedure TCadUsuarioForm.EditPesquisarChange(Sender: TObject);
begin
  BTPesquisarClick(Self);
end;

procedure TCadUsuarioForm.FormCreate(Sender: TObject);
begin
  AbaSuperior.ActivePage := tsConsulta;
  CHApenasAtivos.Checked := True;
end;

procedure TCadUsuarioForm.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TCadUsuarioForm.tsConsultaShow(Sender: TObject);
begin
  BTPesquisarClick(Self);
  EditPesquisar.SetFocus;
end;

procedure TCadUsuarioForm.tsManutencaoShow(Sender: TObject);
begin
  if not (BancodeDados.qryCadUsuario.State in [dsInsert]) then
    with BancoDeDados.qryCadUsuario do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from cadusuario where idusuario = '+
            IntToStr(BancoDeDados.qryCsUsuarioidusuario.Value));
        Open;
        Edit;
      end;
end;

end.
