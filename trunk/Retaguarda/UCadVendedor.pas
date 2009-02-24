unit UCadVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, ExtCtrls, ComCtrls, Mask, DBCtrls, Grids, DBGrids, DB,
  rxToolEdit, RXDBCtrl, Tabs, Menus;

type
  TCadVendedorForm = class(TForm)
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
    Label28: TLabel;
    CHApenasAtivos: TCheckBox;
    DBDateEdit1: TDBDateEdit;
    TSPrincipal: TTabSet;
    NBManutencao: TNotebook;
    Label3: TLabel;
    Label4: TLabel;
    Image2: TImage;
    Image1: TImage;
    Label6: TLabel;
    Label7: TLabel;
    DBText2: TDBText;
    Label8: TLabel;
    DBEditNome: TDBEdit;
    DBEdit1: TDBEdit;
    EditNovaSenha: TEdit;
    EditConfirmaSenha: TEdit;
    DBGrid2: TDBGrid;
    PopupMenu1: TPopupMenu;
    Adicionar1: TMenuItem;
    Excluir1: TMenuItem;
    Label9: TLabel;
    CBTipo: TComboBox;
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
    procedure TSPrincipalClick(Sender: TObject);
    procedure Adicionar1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadVendedorForm: TCadVendedorForm;
  VendedorID : Integer;
implementation
uses Base, UFuncoes, Base64, UCsFormaPagamento, UCsUsuario;
{$R *.dfm}

procedure TCadVendedorForm.Adicionar1Click(Sender: TObject);
var
  i : Integer;
begin
  try
    if not Assigned(CsFormaPagamentoForm) then
      CsFormaPagamentoForm := TCsFormaPagamentoForm.Create(Application);

    if (TipoOperacao = toInsere) then
      begin
        i := BancoDeDados.qryCadVendedoridvendedor.Value;
        BancoDeDados.qryCadVendedor.Post;
        if not (BancoDeDados.qryCadVendedor.State in [dsEdit, dsInsert]) then
          BancoDeDados.qryCadVendedor.Edit;
        BancoDeDados.qryCadVendedor.RecNo := i;
      end;

    if (CsFormaPagamentoForm.ShowModal = mrOk) then
      begin
        BancoDeDados.ProcScripts.Script.Text := 'insert into cadforma_pagamento_vendedor(idvendedor,idforma_pagamento)values'+
          '(' + QuotedStr(IntToStr(BancoDeDados.qryCadVendedoridvendedor.Value)) + ',' +
          QuotedStr(IntToStr(BancoDeDados.qryCsFormaPagamentoidforma_pagamento.Value))+');';
        BancoDeDados.ProcScripts.Execute;
        with BancoDeDados.qryCsVendedorFormaPagamento do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select * from cadforma_pagamento_vendedor where idvendedor = ' +
                IntToStr(BancoDeDados.qryCadVendedoridvendedor.Value));
            Open;
          end;
      end;
  finally
    CsFormaPagamentoForm.Release;
    CsFormaPagamentoForm := nil;
  end;
end;
procedure TCadVendedorForm.BTAlterarClick(Sender: TObject);
begin
  AbaSuperior.ActivePage := tsManutencao;
  DBEditNome.SetFocus;
end;

procedure TCadVendedorForm.BTCancelarClick(Sender: TObject);
begin
  BancoDeDados.qryCadVendedor.Cancel;
  BancoDeDados.qryCsVendedor.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadVendedorForm.BTExcluirClick(Sender: TObject);
begin
  BancoDeDados.qryCadVendedor.Delete;
  BancoDeDados.qryCsVendedor.Refresh;
  AbaSuperior.ActivePage := tsConsulta;
  EditPesquisar.SetFocus;
end;

procedure TCadVendedorForm.BTGravarClick(Sender: TObject);
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
            if not (BancoDeDados.qryCadVendedor.State in [dsEdit, dsInsert]) then
              BancoDeDados.qryCadVendedor.Edit;
            BancoDeDados.qryCadVendedorsenha.Value := Base64EncodeStr(EditNovaSenha.Text);
            BancoDeDados.qryCadVendedortipo.Value := CBTipo.ItemIndex;
            BancoDeDados.qryCadVendedor.Post;
            AbaSuperior.ActivePage := tsConsulta;
          end;
    end
  else
    begin
      BancoDeDados.qryCadVendedortipo.Value := CBTipo.ItemIndex;
      BancoDeDados.qryCadVendedor.Post;
      AbaSuperior.ActivePage := tsConsulta;
    end;
  TipoPreco := poNenhum;
end;

procedure TCadVendedorForm.BTInserirClick(Sender: TObject);
begin
  TipoOperacao := toInsere;
  CBTipo.ItemIndex := -1;
  if (CsUsuarioForm.ShowModal = mrOk) then
    begin
      if not (BancoDeDados.qryCsVendedor.Locate('idusuario',BancoDeDados.qryCsUsuarioidusuario.Value,[])) then
        begin
          if not (BancoDeDados.qryCadVendedor.Active) then
            BancoDeDados.qryCadVendedor.Open;
          BancoDeDados.qryCadVendedor.Append;
          BancoDeDados.qryCadVendedoridusuario.Value := BancoDeDados.qryCsUsuarioidusuario.Value;
          AbaSuperior.ActivePage := tsManutencao;
          DBEditNome.SetFocus;
        end
      else
        begin
          MessageDlg('Já existe um vendedor cadastrado para este Usuario.',mtWarning,[mbOK],0);
          Abort;
        end;
    end
  else
    MessageDlg('É necessário vincular o vendedor a um Usuário.',mtWarning,[mbOK],0);
end;

procedure TCadVendedorForm.BTPesquisarClick(Sender: TObject);
var
  Campo : ShortString;
begin
  case (CBPesquisar.ItemIndex) of
    0: Campo := 'idvendedor';
    1: Campo := 'nome';
    2: Campo := 'login';
  end;
  with BancodeDados.qryCsVendedor do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from cadvendedor');
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

procedure TCadVendedorForm.BTSairClick(Sender: TObject);
begin
  Close;
end;

procedure TCadVendedorForm.CBPesquisarChange(Sender: TObject);
begin
  EditPesquisar.Clear;
  EditPesquisar.SetFocus;
end;
procedure TCadVendedorForm.DBGrid1DblClick(Sender: TObject);
begin
  BTAlterarClick(Self);
end;

procedure TCadVendedorForm.EditPesquisarChange(Sender: TObject);
begin
  BTPesquisarClick(Self);
end;

procedure TCadVendedorForm.Excluir1Click(Sender: TObject);
begin
  if (MessageDlg('Deseja Excluir o registro?',mtWarning,[mbYes,mbNo],0) = mrNo) then
    Abort
  else
    begin
      BancoDeDados.ProcScripts.Script.Text := 'delete from cadforma_pagamento_vendedor where idformapagamento_vendedor = ' +
          QuotedStr(IntToStr(BancoDeDados.qryCsVendedorFormaPagamentoidformapagamento_vendedor.Value)) + ';';
      BancoDeDados.ProcScripts.Execute;
      BancoDeDados.qryCsVendedorFormaPagamento.Refresh;
    end;
end;

procedure TCadVendedorForm.FormCreate(Sender: TObject);
begin
  TipoPreco := poNenhum;
  AbaSuperior.ActivePage := tsConsulta;
  CHApenasAtivos.Checked := True;
end;

procedure TCadVendedorForm.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TCadVendedorForm.tsConsultaShow(Sender: TObject);
begin
  BTPesquisarClick(Self);
  EditPesquisar.SetFocus;
end;

procedure TCadVendedorForm.tsManutencaoShow(Sender: TObject);
begin
  if not (BancodeDados.qryCadVendedor.State in [dsInsert]) then
    with BancoDeDados.qryCadVendedor do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from cadvendedor where idvendedor = '+
            IntToStr(BancoDeDados.qryCsVendedoridvendedor.Value));
        Open;
        Edit;
      end;
  with BancoDeDados.qryCsVendedorFormaPagamento do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from cadforma_pagamento_vendedor where idvendedor = ' +
          IntToStr(BancoDeDados.qryCadVendedoridvendedor.Value));
      Open;
    end;
  if not (BancoDeDados.qryCadVendedortipo.IsNull) then
    CBTipo.ItemIndex := BancoDeDados.qryCadVendedortipo.Value;
  EditNovaSenha.Clear;
  EditConfirmaSenha.Clear;
  tsPrincipal.TabIndex := 0;
  NBManutencao.PageIndex := tsPrincipal.TabIndex;
end;

procedure TCadVendedorForm.TSPrincipalClick(Sender: TObject);
begin
  NBManutencao.PageIndex := TSPrincipal.TabIndex;
end;

end.
