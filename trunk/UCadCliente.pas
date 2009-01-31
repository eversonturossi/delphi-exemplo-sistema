unit UCadCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, TabNotBk, StdCtrls, Grids, DBGrids, htmlbtns,
  Buttons, Mask, DBCtrls, Tabs, DB, rxToolEdit, RXDBCtrl;

type
  TCadClienteForm = class(TForm)
    AbaSuperior: TPageControl;
    tsConsulta: TTabSheet;
    tsManutencao: TTabSheet;
    tsFinanceiro: TTabSheet;
    tsCompras: TTabSheet;
    Panel1: TPanel;
    BTPesquisar: THTMLButton;
    DBGrid1: TDBGrid;
    CBPesquisar: TComboBox;
    Label1: TLabel;
    EditPesquisar: TEdit;
    Label2: TLabel;
    Panel2: TPanel;
    BTInserir: THTMLButton;
    BTAlterar: THTMLButton;
    BTSair: THTMLButton;
    NBManutencao: TNotebook;
    Panel3: TPanel;
    BTGravar: THTMLButton;
    BTCancelar: THTMLButton;
    BTExcluir: THTMLButton;
    Panel4: TPanel;
    Label5: TLabel;
    DBText1: TDBText;
    TSFisica: TTabSet;
    NBFisicaCadastro: TNotebook;
    Label3: TLabel;
    DBEditFisicaNome: TDBEdit;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
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
    Label18: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit24: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label19: TLabel;
    Label24: TLabel;
    DBComboBox2: TDBComboBox;
    Label20: TLabel;
    Label27: TLabel;
    DBComboBox3: TDBComboBox;
    Label28: TLabel;
    Label29: TLabel;
    DBCheckBox1: TDBCheckBox;
    Label30: TLabel;
    Label31: TLabel;
    DBCheckBox2: TDBCheckBox;
    Label32: TLabel;
    Label33: TLabel;
    DBComboBox4: TDBComboBox;
    Label34: TLabel;
    DTNascimento: TDateTimePicker;
    DBComboBox5: TDBComboBox;
    DBCheckBox3: TDBCheckBox;
    TSJuridica: TTabSet;
    NBJuridicaCadastro: TNotebook;
    Panel5: TPanel;
    Label35: TLabel;
    DBText2: TDBText;
    DBCheckBox4: TDBCheckBox;
    Label36: TLabel;
    DBEditJuridicaNome: TDBEdit;
    Label37: TLabel;
    DBEdit16: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBComboBox7: TDBComboBox;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    DBEdit31: TDBEdit;
    Label48: TLabel;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    Label49: TLabel;
    Label50: TLabel;
    CHApenasAtivos: TCheckBox;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    DBDateEdit3: TDBDateEdit;
    DBDateEdit4: TDBDateEdit;
    procedure BTSairClick(Sender: TObject);
    procedure EditPesquisarChange(Sender: TObject);
    procedure BTPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TSFisicaClick(Sender: TObject);
    procedure TSJuridicaClick(Sender: TObject);
    procedure BTInserirClick(Sender: TObject);
    procedure BTAlterarClick(Sender: TObject);
    procedure BTGravarClick(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure BTExcluirClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure CBPesquisarChange(Sender: TObject);
    procedure AbaSuperiorDrawTab(Control: TCustomTabControl; TabIndex: Integer;
      const Rect: TRect; Active: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadClienteForm: TCadClienteForm;

implementation
uses Base, DlgTipoCliente, ULogin, UFuncoes;
{$R *.dfm}

procedure TCadClienteForm.AbaSuperiorDrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
begin
  if (AbaSuperior.ActivePage = tsManutencao) then
    begin
      if (BancoDeDados.qryCadClienteTIPO.Value = 1) then
      begin
        NBManutencao.ActivePage := 'Fisica';
        NBFisicaCadastro.ActivePage := 'Principal';
      end
    else
      if (BancoDeDados.qryCadClienteTIPO.Value = 2) then
        begin
          NBManutencao.ActivePage := 'Juridica';
          NBJuridicaCadastro.ActivePage := 'Principal';
        end;
    end
  else
    if (BancoDeDados.qryCadCliente.State in [dsEdit, dsInsert]) then
      if (MessageDlg('Deseja Excluir o registro?',mtWarning,[mbYes,mbNo],0) = mrYes) then
        BancoDeDados.qryCadCliente.ApplyUpdates
      else
        BancoDeDados.qryCadCliente.Cancel;
end;

procedure TCadClienteForm.BTAlterarClick(Sender: TObject);
begin
  with BancoDeDados.qryCadCliente do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from cadcliente where idcliente = '+
          IntToStr(BancoDeDados.qryCsClienteIDCLIENTE.Value));
      Open;
      Edit;
    end;
  AbaSuperior.ActivePage := tsManutencao;
  if (BancoDeDados.qryCadClientetipo.Value in [1]) then
    begin
      NBManutencao.ActivePage := 'Fisica';
      NBFisicaCadastro.ActivePage := 'Principal';
      DBEditFisicaNome.SetFocus;
    end
  else
    if (BancoDeDados.qryCadClientetipo.Value in [2]) then
      begin
        NBManutencao.ActivePage := 'Juridica';
        NBJuridicaCadastro.ActivePage := 'Principal';
        DBEditJuridicaNome.SetFocus;
      end;
end;

procedure TCadClienteForm.BTGravarClick(Sender: TObject);
begin
  try
      BancoDeDados.qryCadCliente.ApplyUpdates;
      BancoDeDados.qryCsCliente.Refresh;
      AbaSuperior.ActivePage := tsConsulta;
      EditPesquisar.SetFocus;
   Except
      MessageDlg('Erro ao tentar gravar o registro.',mtWarning,[mbOK],0);
   end;
end;

procedure TCadClienteForm.BTInserirClick(Sender: TObject);
begin
  try
    if not Assigned(DlgTipoClienteForm) then
      DlgTipoClienteForm := TDlgTipoClienteForm.Create(Application);
    if (DlgTipoClienteForm.ShowModal = mrOk) then
      begin
        with BancoDeDados.qryCadCliente do
          begin
            if not(Active)then
              Open;
            Append;
            BancoDeDados.qryCadClientetipo.Value := DlgTipoClienteForm.CBTipoCliente.ItemIndex;
            AbaSuperior.ActivePage := tsManutencao;
            if (DlgTipoClienteForm.CBTipoCliente.ItemIndex = 1) then
              begin
                NBManutencao.ActivePage := 'Fisica';
                NBFisicaCadastro.ActivePage := 'Principal';
                DBEditFisicaNome.SetFocus;
              end
            else
              if (DlgTipoClienteForm.CBTipoCliente.ItemIndex = 2) then
                begin
                  NBManutencao.ActivePage := 'Juridica';
                  NBJuridicaCadastro.ActivePage := 'Principal';
                  DBEditJuridicaNome.SetFocus;
                end;
          end;
      end
    else
      Abort;
  finally
    DlgTipoClienteForm.Release;
    DlgTipoClienteForm := nil;
  end;
end;

procedure TCadClienteForm.BTPesquisarClick(Sender: TObject);
var
  Campo : ShortString;
begin
  case (CBPesquisar.ItemIndex) of
    0: Campo := 'idcliente';
    1: Campo := 'nome';
    2: Campo := 'razao_social';
    3: Campo := 'telefone_celular';
    4: Campo := 'telefone_comercial';
    5: Campo := 'telefone_residencial';
    6: Campo := 'cpf';
    7: Campo := 'cgc';
    8: Campo := 'insc';
  end;
  with BancodeDados.qryCsCliente do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from cadcliente');
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

procedure TCadClienteForm.BTSairClick(Sender: TObject);
begin
  Close;
end;

procedure TCadClienteForm.CBPesquisarChange(Sender: TObject);
begin
  EditPesquisar.Clear;
  EditPesquisar.SetFocus;
end;

procedure TCadClienteForm.DBGrid1DblClick(Sender: TObject);
begin
  BTAlterarClick(Self);
end;

procedure TCadClienteForm.EditPesquisarChange(Sender: TObject);
begin
  BTPesquisarClick(Self);
end;

procedure TCadClienteForm.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TCadClienteForm.FormShow(Sender: TObject);
begin
 AbaSuperior.ActivePage := tsConsulta;
 EditPesquisar.SetFocus;
 CHApenasAtivos.Checked := True;
 BTPesquisarClick(Self);
end;

procedure TCadClienteForm.BTCancelarClick(Sender: TObject);
begin
  BancoDeDados.qryCadCliente.Cancel;
  BancoDeDados.qryCsCliente.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadClienteForm.BTExcluirClick(Sender: TObject);
begin
  try
    BancoDeDados.qryCadCliente.Delete;
  except on E: EDatabaseError do
      if (Pos('violates foreign key',e.message) > 0) then
        MessageDlg('Não foi possivel excluir este registros.'+#13+
          'Foram localizados lançamentos feitos para este registro.',mtWarning,[mbOK],0);
  end;
  BancoDeDados.qryCsCliente.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadClienteForm.TSFisicaClick(Sender: TObject);
begin
  NBFisicaCadastro.PageIndex := TSFisica.TabIndex;
end;

procedure TCadClienteForm.TSJuridicaClick(Sender: TObject);
begin
  NBJuridicaCadastro.PageIndex := TSJuridica.TabIndex;
end;

end.
