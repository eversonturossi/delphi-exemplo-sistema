unit UCadastroUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastroPadrao, FMTBcd, ActnList, AppEvnts, ExtCtrls, DB, SqlExpr,
  Provider, DBClient, ComCtrls, StdCtrls, DBCtrls, Buttons, Mask, Grids, DBGrids,
  JvExControls, JvGradientHeaderPanel, JvDBLookupTreeView;

type
  TCadastroUsuarioForm = class(TCadastroPadraoForm)
    qryCsUsuarioNivel: TSQLQuery;
    DSCDSUsuarioNivel: TDataSource;
    qryCsUsuarioNivelABREVIACAO: TStringField;
    qryCsUsuarioNivelDESCRICAO: TStringField;
    qryCadastroUSUARIO_ID: TIntegerField;
    qryCadastroNOME: TStringField;
    qryCadastroLOGIN: TStringField;
    qryCadastroSENHA: TStringField;
    qryCadastroATIVO: TSmallintField;
    qryCadastroDATA_CADASTRO: TSQLTimeStampField;
    qryCadastroNIVEL: TStringField;
    CDSCadastroUSUARIO_ID: TIntegerField;
    CDSCadastroNOME: TStringField;
    CDSCadastroLOGIN: TStringField;
    CDSCadastroSENHA: TStringField;
    CDSCadastroATIVO: TSmallintField;
    CDSCadastroDATA_CADASTRO: TSQLTimeStampField;
    CDSCadastroNIVEL: TStringField;
    qryCadastroDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSCadastroDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    DSPUsuarioNivel: TDataSetProvider;
    CDSUsuarioNivel: TClientDataSet;
    qryCsPrivilegio: TSQLQuery;
    qryCsPrivilegioTABELA: TStringField;
    DSPPrivilegio: TDataSetProvider;
    CDSPrivilegio: TClientDataSet;
    CDSPrivilegioTABELA: TStringField;
    PCPrincipal: TPageControl;
    TSCadastro: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    EditNovaSenha: TEdit;
    EditConfirmarSenha: TEdit;
    DBEditNome: TDBEdit;
    DBEditLogin: TDBEdit;
    DBLCNivel: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    TSPrivilegio: TTabSheet;
    Label9: TLabel;
    DBGrid1: TDBGrid;
    CDSUsuarioPrivilegio: TClientDataSet;
    DSPUsuarioPrivilegio: TDataSetProvider;
    qryCsUsuarioPrivilegio: TSQLQuery;
    qryCsUsuarioPrivilegioUSUARIO_PRIVILEGIO_ID: TLargeintField;
    qryCsUsuarioPrivilegioUSUARIO_ID: TIntegerField;
    qryCsUsuarioPrivilegioPRIVILEGIO_ID: TIntegerField;
    CDSUsuarioPrivilegioUSUARIO_PRIVILEGIO_ID: TLargeintField;
    CDSUsuarioPrivilegioUSUARIO_ID: TIntegerField;
    CDSUsuarioPrivilegioPRIVILEGIO_ID: TIntegerField;
    DSUsuarioPrivilegio: TDataSource;
    qryTabela: TSQLQuery;
    DSPTabela: TDataSetProvider;
    qryTabelaTABELA: TStringField;
    qryTabelaDESCRICAO: TStringField;
    qryTabelaATIVAR_TRACE: TSmallintField;
    CDSTabela: TClientDataSet;
    CDSTabelaTABELA: TStringField;
    CDSTabelaDESCRICAO: TStringField;
    CDSTabelaATIVAR_TRACE: TSmallintField;
    DSTabela: TDataSource;
    CBModulo: TComboBox;
    qryCsPrivilegioPRIVILEGIO_ID: TIntegerField;
    qryCsUsuarioPrivilegioACESSO: TSmallintField;
    CDSUsuarioPrivilegioACESSO: TSmallintField;
    qryCsPrivilegioDESCRICAO: TStringField;
    qryCsPrivilegioABREVIACAO: TStringField;
    CDSPrivilegioPRIVILEGIO_ID: TIntegerField;
    CDSPrivilegioDESCRICAO: TStringField;
    CDSPrivilegioABREVIACAO: TStringField;
    CDSUsuarioPrivilegiolook_descricao: TStringField;
    CDSUsuarioPrivilegiolook_abreviacao: TStringField;
    CBMarcar: TCheckBox;
    CDSUsuarioPrivilegiocalc_tabela_descricao: TStringField;
    qryTabelaDESCRICAO_REDUZIDA: TStringField;
    CDSTabelaDESCRICAO_REDUZIDA: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BTSalvarClick(Sender: TObject);
    procedure CDSCadastroAfterInsert(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EditConfirmarSenhaChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBLCNivelExit(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBModuloSelect(Sender: TObject);
    procedure CBMarcarClick(Sender: TObject);
    procedure DBEditLoginExit(Sender: TObject);
    procedure CDSUsuarioPrivilegioCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    AlterouPrivilegios : Boolean;
    procedure VerificaSenha;
  public
    { Public declarations }
  end;

var
  CadastroUsuarioForm: TCadastroUsuarioForm;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TCadastroUsuarioForm.VerificaSenha;
begin
  if not (Length(EditNovaSenha.Text) > 0) then
    begin
      Mensagem('O Campo Senha não pode ser Nulo!', mtWarning,[mbOk],mrOK,0);
      EditNovaSenha.SetFocus;
      Abort;
    end;

  if (EditNovaSenha.Text <> EditConfirmarSenha.Text) then
    begin
      Mensagem('As Senhas informadas não conhicidem!', mtWarning,[mbOk],mrOK,0);
      EditNovaSenha.SetFocus;
      Abort;
    end
  else
    begin
      if not (CDSCadastro.State in [dsInsert, dsEdit]) then
        CDSCadastro.Edit;
      CDSCadastroSENHA.Value := EditNovaSenha.Text;
    end;
end;

procedure TCadastroUsuarioForm.CBMarcarClick(Sender: TObject);
begin
  try
    with CDSUsuarioPrivilegio do
      begin
        DisableControls;
        First;
        while not Eof do
          begin
            Application.ProcessMessages;
            Edit;
            if (CBMarcar.Checked) then
              CDSUsuarioPrivilegioACESSO.Value := 1
            else
              CDSUsuarioPrivilegioACESSO.Value := 0;
            Post;
            Next;
          end;
      end;
  finally
    if (CBMarcar.Checked) then
      CBMarcar.Caption := 'Desmarcar Todos'
    else
      CBMarcar.Caption := 'Marcar Todos';
    CDSUsuarioPrivilegio.First;
    CDSUsuarioPrivilegio.EnableControls;
    DBGrid1.Refresh;
  end;
end;

procedure TCadastroUsuarioForm.CBModuloSelect(Sender: TObject);
begin
  if (CDSCadastro.State in [dsEdit]) then
    begin
      CDSUsuarioPrivilegio.Close;
      qryCsUsuarioPrivilegio.SQL.Text := 'select * from usuario_privilegio ' +
        ' where usuario_id = ' + IntToStr(CDSCadastroUSUARIO_ID.Value);

      if (CBModulo.ItemIndex > 0) then
         qryCsUsuarioPrivilegio.SQL.Text := qryCsUsuarioPrivilegio.SQL.Text +
            ' and privilegio_id in(select privilegio_id from privilegio ' +
            ' where tabela in(select tabela from tabela where descricao_reduzida = ' +
            QuotedStr(CBModulo.Text) + '))';

      CDSUsuarioPrivilegio.Open;
    end;
end;

procedure TCadastroUsuarioForm.BTSalvarClick(Sender: TObject);
begin
  if not (CDSCadastroNOME.Value <> '') then
    begin
       Mensagem('Informe um Nome para o Usuário!', mtWarning,[mbOk],mrOK,0);
       DBEditNome.SetFocus;
       Abort;
    end;

  if not (CDSCadastroLOGIN.Value <> '') then
    begin
      Mensagem('Informe um Login para o Usuário!', mtWarning,[mbOk],mrOK,0);
      DBEditLogin.SetFocus;
      Abort;
    end;

  if not (CDSCadastroSENHA.Value <> '') then
    begin
      Mensagem('Informe uma Senha para o Usuário!', mtWarning,[mbOk],mrOK,0);
      EditNovaSenha.SetFocus;
      Abort;
    end;

  if (EditNovaSenha.Text <> '********') then
    VerificaSenha;

  inherited; //Herança

  if (AlterouPrivilegios) then
    Log(BancoDados.qryLog, BancoDados.qryLoginUSUARIO_ID.Value, BancoDados.Tabela,
        'Alteração de Privilégios!');

  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
  CDSUsuarioPrivilegio.ApplyUpdates(0);
  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TCadastroUsuarioForm.CDSCadastroAfterInsert(DataSet: TDataSet);
begin
  inherited; //Herança

  CDSCadastroNIVEL.Value := 'OP';
end;

procedure TCadastroUsuarioForm.CDSUsuarioPrivilegioCalcFields(
  DataSet: TDataSet);
begin
  with BancoDados.qryAuxiliar do
    begin
      Close;
      SQL.Text := 'select descricao_reduzida from tabela where tabela' +
        ' in(select tabela from privilegio where privilegio_id = ' +
        IntToStr(CDSUsuarioPrivilegioPRIVILEGIO_ID.Value) + ')';
      Open;
    end;
  if not (BancoDados.qryAuxiliar.IsEmpty) then
    CDSUsuarioPrivilegiocalc_tabela_descricao.Value := BancoDados.qryAuxiliar.Fields[0].Value
  else
    CDSUsuarioPrivilegiocalc_tabela_descricao.Value := 'Desconhecido';
end;

procedure TCadastroUsuarioForm.DBEditLoginExit(Sender: TObject);
begin
  if (CDSCadastroLOGIN.Value <> '') then
    begin
      with BancoDados.qryAuxiliar do
        begin
          Close;
          SQL.Text := 'select login from usuario where login = ' +
            QuotedStr(Trim(CDSCadastroLOGIN.Value));
          Open;
        end;
      if not (BancoDados.qryAuxiliar.IsEmpty) then
        begin
          Mensagem('O Login informado já está sendo utilizado por outro Usuário!', mtWarning,[mbOk],mrOK,0);
          if not (CDSCadastro.State in [dsInsert, dsEdit]) then
            CDSCadastro.Edit;
          CDSCadastroLOGIN.Value := '';
          DBEditLogin.SetFocus;
          Abort;
        end;
    end;
end;

procedure TCadastroUsuarioForm.DBGrid1CellClick(Column: TColumn);
begin
  if (DBGrid1.SelectedField.FieldName = 'ACESSO') then
    begin
      try
        AlterouPrivilegios := True;
        CDSUsuarioPrivilegio.DisableControls;
        CDSUsuarioPrivilegio.Edit;
        if (CDSUsuarioPrivilegioACESSO.Value = 1) then
          CDSUsuarioPrivilegioACESSO.Value := 0
        else
          CDSUsuarioPrivilegioACESSO.Value := 1;
        CDSUsuarioPrivilegio.Post;
      finally
        CDSUsuarioPrivilegio.EnableControls;
      end;
    end;
end;

procedure TCadastroUsuarioForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'ACESSO' then
    begin
      DBGrid1.Canvas.FillRect(Rect);
      Check := 0;
      if (CDSUsuarioPrivilegioACESSO.Value = 1) then
        Check := DFCS_CHECKED
      else
        Check := 0;
      R := Rect;
      InflateRect(R,-3,-3);
      DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
    end;
end;

procedure TCadastroUsuarioForm.DBLCNivelExit(Sender: TObject);
var
  Novo, Editar, Excluir, Formulario, Exportar : SmallInt;
begin
  if ((CDSCadastro.State in [dsInsert]) and (CDSUsuarioPrivilegio.IsEmpty)) then
    begin
      try
        CDSUsuarioPrivilegio.DisableControls;
        if (CDSCadastroNIVEL.Value = 'ADM') then
          begin
            Novo        :=  1;
            Editar      :=  1;
            Excluir     :=  1;
            Formulario  :=  1;
            Exportar    :=  1;
          end
        else if (CDSCadastroNIVEL.Value = 'SUP') then
          begin
            Novo        :=  0;
            Editar      :=  0;
            Excluir     :=  0;
            Formulario  :=  1;
            Exportar    :=  1;
          end
        else if (CDSCadastroNIVEL.Value = 'OP') then
          begin
            Novo        :=  0;
            Editar      :=  0;
            Excluir     :=  0;
            Formulario  :=  1;
            Exportar    :=  0;
          end;

        CDSPrivilegio.Close;
        qryCsPrivilegio.SQL.Text := 'select * from privilegio';
        CDSPrivilegio.Open;

        CDSUsuarioPrivilegio.Close;
        CDSUsuarioPrivilegio.Open;

        CDSPrivilegio.First;
        while not CDSPrivilegio.Eof do
          begin
            CDSUsuarioPrivilegio.Append;
            CDSUsuarioPrivilegioUSUARIO_ID.Value := CDSCadastroUSUARIO_ID.Value;
            CDSUsuarioPrivilegioPRIVILEGIO_ID.Value := CDSPrivilegioPRIVILEGIO_ID.Value;


            if (CDSPrivilegioABREVIACAO.Value = 'Novo') then
              CDSUsuarioPrivilegioACESSO.Value := Novo
            else if (CDSPrivilegioABREVIACAO.Value = 'Editar') then
              CDSUsuarioPrivilegioACESSO.Value := Editar
            else if (CDSPrivilegioABREVIACAO.Value = 'Excluir') then
              CDSUsuarioPrivilegioACESSO.Value := Excluir
            else if (CDSPrivilegioABREVIACAO.Value = 'Formulario') then
              CDSUsuarioPrivilegioACESSO.Value := Formulario
            else if (CDSPrivilegioABREVIACAO.Value = 'Exportar') then
              CDSUsuarioPrivilegioACESSO.Value := Exportar;

            CDSUsuarioPrivilegio.Post;
            CDSPrivilegio.Next;
          end;
      finally
        CDSUsuarioPrivilegio.EnableControls;
      end;
    end;
end;

procedure TCadastroUsuarioForm.EditConfirmarSenhaChange(Sender: TObject);
begin
  if (EditNovaSenha.Text = EditConfirmarSenha.Text) then
    begin
      if not (CDSCadastro.State in [dsInsert, dsEdit]) then
        CDSCadastro.Edit;
      CDSCadastroSENHA.Value := EditNovaSenha.Text;
    end;
end;

procedure TCadastroUsuarioForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CDSPrivilegio.Close;
  CDSUsuarioPrivilegio.Close;
  CDSTabela.Close;

  inherited; //Herança
end;

procedure TCadastroUsuarioForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    begin
      key := #0;
      Perform(WM_NextDlgCtl,0,0);
    end;

  inherited; //Herança
end;

procedure TCadastroUsuarioForm.FormShow(Sender: TObject);
begin
  inherited; //Herança

  CDSPrivilegio.Close;
  qryCsPrivilegio.SQL.Text := 'select * from privilegio';
  CDSPrivilegio.Open;

  CDSUsuarioNivel.Close;
  qryCsUsuarioNivel.SQL.Text := 'select * from usuario_nivel';
  CDSUsuarioNivel.Open;

  CDSTabela.Close;
  qryTabela.SQL.Text := 'select * from tabela order by descricao';
  CDSTabela.Open;
  CDSTabela.First;

  CBModulo.Items.Clear;
  CBModulo.Items.Add('<selecione>');
  while not CDSTabela.Eof do
    begin
      CBModulo.Items.Add(CDSTabelaDESCRICAO_REDUZIDA.Value);
      CDSTabela.Next;
    end;

  CBModulo.ItemIndex := 0;

  if (CDSCadastro.State in [dsInsert]) then
    DBLCNivelExit(Sender)
  else if (CDSCadastro.State in [dsEdit]) then
    CBModuloSelect(Sender);

  AlterouPrivilegios := False;
  PCPrincipal.TabIndex := 0;
  CBModulo.Enabled := (BancoDados.qryLoginNIVEL.Value = 'ADM');
  DBGrid1.Enabled := CBModulo.Enabled;
  DBEditNome.SetFocus;
  PCPrincipal.Enabled := CBModulo.Enabled;
  DBCAtivo.Enabled := CBModulo.Enabled;
end;

end.
