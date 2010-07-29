unit UCadastroTransportadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastroPadrao, FMTBcd, ActnList, AppEvnts, DB, SqlExpr, Provider,
  DBClient, StdCtrls, DBCtrls, Buttons, JvExControls, JvGradientHeaderPanel,
  ExtCtrls, ComCtrls, Menus, Grids, DBGrids, JvExMask, JvToolEdit, JvDBControls,
  Mask;

type
  TCadastroTransportadoraForm = class(TCadastroPadraoForm)
    PopupMenu1: TPopupMenu;
    ExcluirContato1: TMenuItem;
    CDSCadastroTRANSPORTADORA_ID: TIntegerField;
    CDSCadastroPESSOA_ID: TIntegerField;
    CDSCadastroCNPJ_CPF: TStringField;
    CDSCadastroIE_IDENTIDADE: TStringField;
    CDSCadastroIM: TStringField;
    CDSCadastroTIPO: TStringField;
    CDSCadastroDATA_NASCIMENTO: TDateField;
    PCPrincipal: TPageControl;
    TSCadastro: TTabSheet;
    Label8: TLabel;
    LBNome: TLabel;
    LBApelido: TLabel;
    LBDocumento: TLabel;
    LBIE: TLabel;
    LBIM: TLabel;
    LBDataNascimento: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    DBEditCodigo: TDBEdit;
    DBEditNome: TDBEdit;
    DBEditApelido: TDBEdit;
    DBEditDocumento: TDBEdit;
    DBEditIE: TDBEdit;
    DBEditIM: TDBEdit;
    DBDataNascimento: TJvDBDateEdit;
    CBTipo: TComboBox;
    TSEnderecoContato: TTabSheet;
    Label14: TLabel;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    BTMunicipio: TSpeedButton;
    Label11: TLabel;
    DBText4: TDBText;
    Label4: TLabel;
    DBEditNumero: TDBEdit;
    DBEditComplemento: TDBEdit;
    DBEditBairro: TDBEdit;
    DBEditCEP: TDBEdit;
    DBEditMunicipio: TDBEdit;
    DBEditEndereco: TDBEdit;
    DBNEndereco: TDBNavigator;
    CBPessoaContatoTipo: TComboBox;
    DBGrid1: TDBGrid;
    AVerificarNome: TAction;
    CDSCadastroDATA_CADASTRO: TSQLTimeStampField;
    CDSCadastroDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    CDSCadastroATIVO: TSmallintField;
    CDSCadastroEMPRESA_ID: TIntegerField;
    procedure RemoveAcento(Sender: TObject);
    procedure CBPessoaContatoTipoSelect(Sender: TObject);
    procedure CBTipoSelect(Sender: TObject);
    procedure CDSCadastroAfterInsert(DataSet: TDataSet);
    procedure CDSCadastroBeforePost(DataSet: TDataSet);
    procedure DBEditDocumentoExit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBNEnderecoClick(Sender: TObject; Button: TNavigateBtn);
    procedure ExcluirContato1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure PCPrincipalChange(Sender: TObject);
    procedure AVerificarNomeExecute(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure BTMunicipioClick(Sender: TObject);
    procedure BTSalvarClick(Sender: TObject);
  private
    { Private declarations }
    RetornaForm : Boolean;
    procedure VerificaCampos;
    procedure CarregaHint;
  public
    { Public declarations }
  end;

var
  CadastroTransportadoraForm: TCadastroTransportadoraForm;

implementation
uses Base, UFuncoes, UPesquisaMunicipio, UVerificaPessoa;
{$R *.dfm}

procedure TCadastroTransportadoraForm.RemoveAcento(Sender: TObject);
var
  Temp : ShortString;
begin
  if ((Sender as TDBEdit).Text <> '') then
    begin
      Temp := (Sender as TDBEdit).DataSource.DataSet.FieldByName((Sender as TDBEdit).DataField).Value;
      if not ((Sender as TDBEdit).DataSource.DataSet.State in[dsEdit, dsInsert]) then
        (Sender as TDBEdit).DataSource.DataSet.Edit;
      (Sender as TDBEdit).DataSource.DataSet.FieldByName((Sender as TDBEdit).DataField).Value := RetornaSemAcento(Temp);
    end;
end;

procedure TCadastroTransportadoraForm.CBPessoaContatoTipoSelect(
  Sender: TObject);
begin
  BancoDados.CDSPessoaContatoTipo.Close;

  if (CBPessoaContatoTipo.ItemIndex > 0) then
    begin
      BancoDados.qryPessoaContatoTipo.SQL.Text := 'select * from pessoa_contato_tipo' +
        ' where descricao = ' + QuotedStr(CBPessoaContatoTipo.Text);
      BancoDados.CDSPessoaContatoTipo.Open;

      if not (BancoDados.CDSPessoaContatoTipo.IsEmpty) then
        begin
          BancoDados.CDSPessoaContato.Filtered := True;
          BancoDados.CDSPessoaContato.Filter := 'PESSOA_CONTATO_TIPO_ID = ' +
            IntToStr(BancoDados.CDSPessoaContatoTipoPESSOA_CONTATO_TIPO_ID.Value);
        end;
    end
  else
    BancoDados.CDSPessoaContato.Filtered := False;

  DBGrid1.SetFocus;
end;

procedure TCadastroTransportadoraForm.CBTipoSelect(Sender: TObject);
begin
  case CBTipo.ItemIndex of
    0: begin
      LBNome.Caption := 'Nome:';
      LBApelido.Caption := 'Apelido:';
      LBDocumento.Caption := 'CPF:';
      LBDataNascimento.Caption := 'Data Nascimento';
      LBIE.Caption := 'Nº Identidade:';
      LBIM.Visible := False;
      DBEditIM.Visible := False;
      LBDataNascimento.Visible := True;
      DBDataNascimento.Visible := True;

      if not (BancoDados.CDSPessoa.State in [dsInsert]) then
        BancoDados.CDSPessoa.Edit;
      BancoDados.CDSPessoaNOME_RAZAO.Value := '';
      BancoDados.CDSPessoaNOME_APELIDO_FANTASIA.Value := '';

      if not (CDSCadastro.State in [dsInsert]) then
        CDSCadastro.Edit;
      CDSCadastroTIPO.Value := 'F';
      CDSCadastroCNPJ_CPF.Value := '';
      CDSCadastroIE_IDENTIDADE.Value := '';
      CDSCadastroIM.Value := '';
      CDSCadastroDATA_NASCIMENTO.Value := 0;
      CDSCadastroCNPJ_CPF.EditMask := '999.999.999-99;0;_';
    end;
    1: begin
      LBNome.Caption := 'Razão Social:';
      LBApelido.Caption := 'Nome Fantasia:';
      LBDocumento.Caption := 'CNPJ:';
      LBDataNascimento.Caption := 'Abertura da Empresa';
      LBIE.Caption := 'Inscrição Estadual:';
      LBIM.Caption := 'Inscrição Municipal:';
      LBIM.Visible := True;
      DBEditIM.Visible := True;
      LBDataNascimento.Visible := False;
      DBDataNascimento.Visible := False;

      if not (BancoDados.CDSPessoa.State in [dsInsert]) then
        BancoDados.CDSPessoa.Edit;
      BancoDados.CDSPessoaNOME_RAZAO.Value := '';
      BancoDados.CDSPessoaNOME_APELIDO_FANTASIA.Value := '';

      if not (CDSCadastro.State in [dsInsert]) then
        CDSCadastro.Edit;
      CDSCadastroTIPO.Value := 'J';
      CDSCadastroCNPJ_CPF.Value := '';
      CDSCadastroIE_IDENTIDADE.Value := '';
      CDSCadastroIM.Value := '';
      CDSCadastroDATA_NASCIMENTO.Value := 0;
      CDSCadastroCNPJ_CPF.EditMask := '99.999.999/9999-99;0;_';
    end;
  end;
  DBEditNome.SetFocus;
end;

procedure TCadastroTransportadoraForm.CDSCadastroAfterInsert(DataSet: TDataSet);
begin
  try
    with BancoDados.qryGeraID do
      begin
        GeraTrace(BancoDados.Tabela,'Inicia Geração de ID');
        Close;
        SQL.Clear;
        SQL.Add('select gen_id( GEN_TRANSPORTADORA_ID, 1 ) from RDB$DATABASE');
        Open;
        CDSCadastroTRANSPORTADORA_ID.Value := BancoDados.qryGeraID.Fields[0].Value;
        CDSCadastroTIPO.Value := 'F';
        GeraTrace('TRANSPORTADORA','ID Gerado');
        CDSCadastro.FieldByName('DATA_CADASTRO').Value := Now;
        CDSCadastroEMPRESA_ID.Value := BancoDados.EmpresaID;
        CDSCadastroATIVO.Value := 1;
      end;
  except
    Mensagem('Falha ao Tentar Gerar o I.D!', mtWarning,[mbOk],mrOK,0);
  end;
end;

procedure TCadastroTransportadoraForm.CDSCadastroBeforePost(DataSet: TDataSet);
begin
  if not (BancoDados.CDSPessoa.State in [dsEdit, dsInsert]) then
    BancoDados.CDSPessoa.Edit;
  BancoDados.CDSPessoa.Post;

  inherited; //Herança
end;

procedure TCadastroTransportadoraForm.DBEditDocumentoExit(Sender: TObject);
var
  Temp : ShortString;
begin
  Temp := RetornaNumeros(DBEditDocumento.Text);

  if (CDSCadastroTIPO.Value = 'F') then
    begin
      if (TestaCPF(Temp)) then
        DBEditDocumento.Text := Temp
      else
        begin
          MessageDlg('CPF inválido!',mtWarning,[mbOK],0);
          DBEditDocumento.Text := '';
        end;
    end
  else if (CDSCadastroTIPO.Value = 'J') then
    begin
      if (TestaCNPJ(Temp)) then
        DBEditDocumento.Text := Temp
      else
        begin
          MessageDlg('CNPJ inválido!',mtWarning,[mbOK],0);
          DBEditDocumento.Text := '';
        end;
    end;
end;

procedure TCadastroTransportadoraForm.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then
    begin
      if (BancoDados.CDSPessoaContato.State in [dsInsert, dsEdit]) then
        BancoDados.CDSPessoaContato.Post;
      BancoDados.CDSPessoaContato.Append;
    end;
end;

procedure TCadastroTransportadoraForm.DBNEnderecoClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  if (Button = nbInsert)  then
    DBEditEndereco.SetFocus
  else if (Button = nbPost)  then
    begin
      if not (DBEditEndereco.Text <> '') then
        begin
          MessageDlg('Informe uma Rua',mtWarning,[mbOK],0);
          DBEditEndereco.SetFocus;
          Abort;
        end
      else
        BancoDados.CDSPessoaEndereco.First;
    end;
end;

procedure TCadastroTransportadoraForm.ExcluirContato1Click(Sender: TObject);
begin
  if (Mensagem('Deseja realmente Excluir este Registro?',mtConfirmation,[mbYES,mbNO],mrNO,0) = idYES) then
    BancoDados.CDSPessoaContato.Delete;
end;

procedure TCadastroTransportadoraForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited; //Herança

  BancoDados.CDSPessoaEndereco.Close;
  BancoDados.CDSPessoaContato.Close;
  BancoDados.CDSPessoaImagem.Close;
end;

procedure TCadastroTransportadoraForm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then
    begin
      key := #0;
      if not (ActiveControl is TDBGrid) then
        Perform(WM_NextDlgCtl,0,0)
      else
        begin
          if (BancoDados.CDSPessoaContato.State in [dsInsert, dsEdit]) then
            BancoDados.CDSPessoaContato.Post;
          BancoDados.CDSPessoaContato.Append;
        end;
    end;

  if (key = #27) then
    begin
      key := #0;
      if not (ActiveControl is TDBGrid) then
        Close
      else
        if (BancoDados.CDSPessoaContato.State in [dsInsert, dsEdit]) then
          BancoDados.CDSPessoaContato.Cancel;
    end;
end;

procedure TCadastroTransportadoraForm.FormShow(Sender: TObject);
var
  Padrao : TCadastroPadraoForm;
begin
  if not (RetornaForm) then
    begin
      inherited; //Herança

      if (Padrao.UtilizaMaiuscula) then
        begin
          DBEditNome.CharCase := ecUpperCase;
          DBEditApelido.CharCase := ecUpperCase;
          DBEditEndereco.CharCase := ecUpperCase;
          DBEditNumero.CharCase := ecUpperCase;
          DBEditComplemento.CharCase := ecUpperCase;
          DBEditBairro.CharCase := ecUpperCase;
        end;

      if (BancoDados.Operacao = 'Inserir') then
        begin
          BancoDados.CDSPessoa.Close;
          BancoDados.qryPessoa.SQL.Text := 'select * from pessoa where pessoa_id = 0';
          BancoDados.CDSPessoa.Open;

          BancoDados.CDSPessoa.Append;
          CDSCadastroPESSOA_ID.Value := BancoDados.CDSPessoaPESSOA_ID.Value;
        end
      else if (BancoDados.Operacao = 'Alterar') then
        begin
          BancoDados.CDSPessoa.Close;
          BancoDados.qryPessoa.SQL.Text := 'select * from pessoa where pessoa_id = ' +
            IntTostr(CDSCadastroPESSOA_ID.Value);
          BancoDados.CDSPessoa.Open;

          BancoDados.CDSPessoa.Edit;
        end;

      BancoDados.CDSPessoaContatoTipo.Close;
      BancoDados.qryPessoaContatoTipo.SQL.Text := 'select * from pessoa_contato_tipo order by descricao';
      BancoDados.CDSPessoaContatoTipo.Open;
      BancoDados.CDSPessoaContatoTipo.First;

      CBPessoaContatoTipo.Items.Clear;
      CBPessoaContatoTipo.Items.Add('<selecione>');
      while not BancoDados.CDSPessoaContatoTipo.Eof do
        begin
          CBPessoaContatoTipo.Items.Add(BancoDados.CDSPessoaContatoTipoDESCRICAO.Value);
          BancoDados.CDSPessoaContatoTipo.Next;
        end;
      CBPessoaContatoTipo.ItemIndex := 0;

      BancoDados.CDSPessoaContato.Close;
      BancoDados.qryPessoaContato.SQL.Text := 'select * from pessoa_contato where tabela = ' +
        QuotedStr(BancoDados.Tabela) + ' and pessoa_id = ' + IntTostr(CDSCadastroPESSOA_ID.Value);
      BancoDados.CDSPessoaContato.Open;

      BancoDados.CDSPessoaEndereco.Close;
      BancoDados.qryPessoaEndereco.SQL.Text := 'select * from pessoa_endereco where tabela = ' +
        QuotedStr(BancoDados.Tabela) + ' and pessoa_id = ' + IntTostr(CDSCadastroPESSOA_ID.Value);
      BancoDados.CDSPessoaEndereco.Open;

      PCPrincipal.TabIndex := 0;
      DBEditNome.SetFocus;

      case CBTipo.ItemIndex of
        0: begin
          LBNome.Caption := 'Nome:';
          LBApelido.Caption := 'Apelido:';
          LBDocumento.Caption := 'CPF:';
          LBDataNascimento.Caption := 'Data Nascimento';
          LBIE.Caption := 'Nº Identidade:';
          LBIM.Visible := False;
          DBEditIM.Visible := False;
          LBDataNascimento.Visible := True;
          DBDataNascimento.Visible := True;
          CDSCadastroCNPJ_CPF.EditMask := '999.999.999-99;0;_';
        end;
        1: begin
          LBNome.Caption := 'Razão Social:';
          LBApelido.Caption := 'Nome Fantasia:';
          LBDocumento.Caption := 'CNPJ:';
          LBDataNascimento.Caption := 'Abertura da Empresa';
          LBIE.Caption := 'Inscrição Estadual:';
          LBIM.Caption := 'Inscrição Municipal:';
          LBIM.Visible := True;
          DBEditIM.Visible := True;
          LBDataNascimento.Visible := False;
          DBDataNascimento.Visible := False;
          CDSCadastroCNPJ_CPF.EditMask := '99.999.999/9999-99;0;_';
        end;
      end;

      try
        BTMunicipio.Glyph.LoadFromFile(BancoDados.imgOk);
      except end;

      CarregaHint;
    end;
end;

procedure TCadastroTransportadoraForm.PCPrincipalChange(Sender: TObject);
begin
  if (PCPrincipal.TabIndex = 1) then
    CBPessoaContatoTipoSelect(Sender);
end;

procedure TCadastroTransportadoraForm.VerificaCampos;
begin
  if not ((CDSCadastroTIPO.Value = 'F') or (CDSCadastroTIPO.Value = 'J')) then
    begin
      Mensagem('Informe o Tipo de Pessoa!', mtWarning,[mbOk],mrOK,0);
      PCPrincipal.TabIndex := 0;
      CBTipo.SetFocus;
      Abort;
    end;

  if not (DBEditNome.Text <> '') then
    begin
      if (CDSCadastroTIPO.Value = 'F') then
        Mensagem('Preencha o campo Nome!', mtWarning,[mbOk],mrOK,0)
      else
        Mensagem('Preencha o campo Razão Social!', mtWarning,[mbOk],mrOK,0);

      PCPrincipal.TabIndex := 0;
      DBEditNome.SetFocus;
      Abort;
    end;

  if not (DBEditApelido.Text <> '') then
    begin
      if (CDSCadastroTIPO.Value = 'F') then
        Mensagem('Preencha o campo Apelido!', mtWarning,[mbOk],mrOK,0)
      else
        Mensagem('Preencha o campo Nome Fantasia!', mtWarning,[mbOk],mrOK,0);

      PCPrincipal.TabIndex := 0;
      DBEditApelido.SetFocus;
      Abort;
    end;

  if not (DBEditDocumento.Text <> '') then
    begin
      if (CDSCadastroTIPO.Value = 'F') then
        Mensagem('Preencha o campo CPF!', mtWarning,[mbOk],mrOK,0)
      else
        Mensagem('Preencha o campo CNPJ!', mtWarning,[mbOk],mrOK,0);

      PCPrincipal.TabIndex := 0;
      DBEditDocumento.SetFocus;
      Abort;
    end;

  if (not (DBEditIE.Text <> '') and (CDSCadastroTIPO.Value = 'J'))  then
    begin
      Mensagem('Preencha o campo Inscrição Estadual!', mtWarning,[mbOk],mrOK,0);

      PCPrincipal.TabIndex := 0;
      DBEditIE.SetFocus;
      Abort;
    end;
end;

procedure TCadastroTransportadoraForm.AVerificarNomeExecute(Sender: TObject);
begin
  try
    if not Assigned(VerificaPessoaForm) then
      VerificaPessoaForm := TVerificaPessoaForm.Create(Application);

    VerificaPessoaForm.EditValor.Text := DBEditNome.Text;

    if (VerificaPessoaForm.ShowModal = mrOk) then
      begin
        BancoDados.CDSPessoa.Cancel;

        if (VerificaPessoaForm.PessoaID > 0) then
          begin
            BancoDados.CDSPessoa.Close;
            BancoDados.qryPessoa.SQL.Text := 'select * from pessoa where pessoa_id = ' +
              IntToStr(VerificaPessoaForm.PessoaID);
            BancoDados.CDSPessoa.Open;
          end
        else
          begin
            BancoDados.CDSPessoa.Append;
            BancoDados.CDSPessoaNOME_RAZAO.Value := VerificaPessoaForm.PessoaNome;
          end;

        if not (CDSCadastro.State in [dsInsert, dsEdit]) then
          CDSCadastro.Edit;
        CDSCadastroPESSOA_ID.Value := BancoDados.CDSPessoaPESSOA_ID.Value;

        BancoDados.CDSPessoaEndereco.Close;
        BancoDados.qryPessoaEndereco.SQL.Text := 'select * from pessoa_endereco where tabela = ' +
          QuotedStr(BancoDados.Tabela) + ' and pessoa_id = ' + IntTostr(CDSCadastroPESSOA_ID.Value);
        BancoDados.CDSPessoaEndereco.Open;

        BancoDados.CDSPessoaContato.Close;
        BancoDados.qryPessoaContato.SQL.Text := 'select * from pessoa_contato where tabela = ' +
          QuotedStr(BancoDados.Tabela) + ' and pessoa_id = ' + IntTostr(CDSCadastroPESSOA_ID.Value);
        BancoDados.CDSPessoaContato.Open;


        BancoDados.CDSPessoaImagem.Close;
        BancoDados.qryPessoaImagem.SQL.Text := 'select * from pessoa_imagem where tabela = ' +
          QuotedStr(BancoDados.Tabela) + ' and pessoa_id = ' + IntTostr(CDSCadastroPESSOA_ID.Value);
        BancoDados.CDSPessoaImagem.Open;

        PCPrincipal.TabIndex := 0;
        DBEditNome.SetFocus;
      end;
  finally
    VerificaPessoaForm.Free;
    VerificaPessoaForm := nil;
  end;
end;

procedure TCadastroTransportadoraForm.BTCancelarClick(Sender: TObject);
begin
  BancoDados.CDSPessoa.Cancel;
  BancoDados.CDSPessoaEndereco.Cancel;
  BancoDados.CDSPessoaContato.Cancel;

  inherited; //Herança
end;

procedure TCadastroTransportadoraForm.BTMunicipioClick(Sender: TObject);
begin
  try
    if not Assigned(PesquisaMunicipioForm) then
      PesquisaMunicipioForm := TPesquisaMunicipioForm.Create(Application);
    RetornaForm := True;
    SBPrincipal.Panels[0].Text := '';
    BancoDados.Tabela := 'MUNICIPIO';
    if (PesquisaMunicipioForm.ShowModal = mrOk) then
      begin
        if not (BancoDados.CDSPessoaEndereco.State in [dsEdit, dsInsert]) then
          BancoDados.CDSPessoaEndereco.Edit;

        if (PesquisaMunicipioForm.CDSConsultaMUNICIPIO_ID.Value > 0) then
          BancoDados.CDSPessoaEnderecoMUNICIPIO_ID.Value := PesquisaMunicipioForm.CDSConsultaMUNICIPIO_ID.Value
        else
          begin
            Mensagem('Nenhuma Cidade foi informada!', mtWarning,[mbOk],mrOK,0);
            Abort;
          end;
      end;
  finally
    BancoDados.Tabela := 'EMPRESA';
    PesquisaMunicipioForm.Free;
    PesquisaMunicipioForm := nil;
    RetornaForm := False;
  end;
end;

procedure TCadastroTransportadoraForm.BTSalvarClick(Sender: TObject);
begin
  VerificaCampos;

  inherited; //Herança

  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);

  BancoDados.CDSPessoaEndereco.ApplyUpdates(0);
  BancoDados.CDSPessoaContato.ApplyUpdates(0);

  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TCadastroTransportadoraForm.CarregaHint;
begin
  CBTipo.Hint := 'Tipo de Fornecedor (Pessoa Física/Pessoa Jurídica).';

  DBEditCodigo.Hint := 'Este é o Código de identificação da Transportadora.' +
    ' Ele é gerado automaticamente pelo Sistema';

  case CBTipo.ItemIndex of
    0: begin
      DBEditNome.Hint := 'Informe aqui o Nome da Transportadora.' +
        ' Verifique antes se o Nome informado já existe pressionando a tecla F2.';
      DBEditApelido.Hint := 'Informe aqui o Apelido da Transportadora.';
      DBEditDocumento.Hint := 'Informe aqui o CPF do titular da Transportadora.' +
        ' Digite apenas Números. O Sistema verificará sua validade' +
        ' pressionando a tecla Enter.';
      DBEditIE.Hint := 'Informe aqui o Número de Identidade.' +
        ' Digite apenas Números. O Sistema verificará sua validade' +
        ' pressionando a tecla Enter.';
      DBDataNascimento.Hint := 'Infome aqui a Data de Nascimento do titular da Transportadora.';
    end;
    1: begin
      DBEditNome.Hint := 'Informe aqui a Razão Social da Transportadora.' +
        ' Verifique antes se a Razão Social informada já existe pressionando a tecla F2.';
      DBEditApelido.Hint := 'Informe aqui o Nome Fantasia da Transportadora.';
      DBEditDocumento.Hint := 'Informe aqui o CNPJ da Transportadora.' +
        ' Digite apenas Números. O Sistema verificará sua validade' +
        ' pressionando a tecla Enter.';
      DBEditIE.Hint := 'Informe aqui a Inscrição Estadual.' +
        ' Digite apenas Números. O Sistema verificará sua validade' +
        ' pressionando a tecla Enter.';
      DBEditIM.Hint := 'Informe aqui a Inscrição Municipal.' +
        ' Digite apenas Números. O Sistema verificará sua validade' +
        ' pressionando a tecla Enter.';
      DBDataNascimento.Hint := 'Infome aqui a Data de Abertura da Transportadora.';
    end;
  end;

  DBEditEndereco.Hint := 'Informe aqui o Nome do Logradouro. Exemplo:' +
    ' Rua, Avenida, etc...';
  DBEditNumero.Hint := 'Informe aqui o Número da Localização.';
  DBEditComplemento.Hint := 'Informe aqui o Complemento do Endereço. Exemplo:' +
    ' APTO XX, BLOCO XX, etc...';
  DBEditBairro.Hint := 'Informe aqui o Bairro.';
  DBEditCEP.Hint := 'Informe aqui o CEP. Apenas Números.';
  DBEditMunicipio.Hint := 'Aqui será exibido o nome da Cidade escolhida no botão ao' +
    ' lado. Junto com o nome o Sistema localizará o Código para uso da NF-e.';
  BTMunicipio.Hint := 'Pesquisar por Municipio.';
  DBNEndereco.Hint := 'Alterar Endereços da Transportadora. É possível Inserir vários endereços' +
    ' para cada Cliente.';
  CBPessoaContatoTipo.Hint := 'Informe aqui o Tipo de Contato a ser alterado.';
  DBGrid1.Hint := 'Lista de Contatos inseridos. Selecione o tipo de contato e Insira' +
    ' a informação.';
end;
end.
