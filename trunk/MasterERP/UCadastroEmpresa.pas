unit UCadastroEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastroPadrao, FMTBcd, ActnList, AppEvnts, DB, SqlExpr, Provider,
  DBClient, StdCtrls, DBCtrls, Buttons, JvExControls, JvGradientHeaderPanel,
  ExtCtrls, ComCtrls, Mask, JvExMask, JvToolEdit, JvDBControls, JvSpin,
  JvDBSpinEdit, Grids, DBGrids, JPEG, Menus, DBTables;

type
  TCadastroEmpresaForm = class(TCadastroPadraoForm)
    CDSCadastroEMPRESA_ID: TIntegerField;
    CDSCadastroPESSOA_ID: TIntegerField;
    CDSCadastroCNPJ_CPF: TStringField;
    CDSCadastroIE_IDENTIDADE: TStringField;
    CDSCadastroFILIAL: TSmallintField;
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
    DBEditCodigo: TDBEdit;
    DBEditNome: TDBEdit;
    DBEditApelido: TDBEdit;
    DBEditDocumento: TDBEdit;
    DBEditIE: TDBEdit;
    DBEditIM: TDBEdit;
    DBDataNascimento: TJvDBDateEdit;
    TSEnderecoContato: TTabSheet;
    Label12: TLabel;
    CBTipo: TComboBox;
    CDSCadastroIM: TStringField;
    CDSCadastrocalc_nome_matriz: TStringField;
    BTSalvarImagem: TSpeedButton;
    BTLimparImagem: TSpeedButton;
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
    SDPessoaImagem: TSaveDialog;
    Label3: TLabel;
    DSSFilial: TJvDBSpinEdit;
    Label13: TLabel;
    DBEditMatriz: TDBEdit;
    BTMatriz: TSpeedButton;
    DBText3: TDBText;
    PopupMenu1: TPopupMenu;
    ExcluirContato1: TMenuItem;
    Label14: TLabel;
    CBPessoaContatoTipo: TComboBox;
    DBGrid1: TDBGrid;
    TSUsuario: TTabSheet;
    DBGrid2: TDBGrid;
    qryEmpresaUsuario: TSQLQuery;
    DSPEmpresaUsuario: TDataSetProvider;
    CDSEmpresaUsuario: TClientDataSet;
    CDSEmpresaUsuarioUSUARIO_ID: TIntegerField;
    CDSEmpresaUsuarioNOME: TStringField;
    CDSEmpresaUsuarioLOGIN: TStringField;
    DSEmpresaUsuario: TDataSource;
    CBMarcar: TCheckBox;
    CDSEmpresaUsuarioLIBERADO: TSmallintField;
    PImagem: TPanel;
    DBImage: TDBImage;
    CDSCadastroEMPRESA_MATRIZ: TIntegerField;
    CDSEmpresaFilial: TClientDataSet;
    DSPEmpresaFilial: TDataSetProvider;
    qryEmpresaFilial: TSQLQuery;
    Label15: TLabel;
    AVerificarNome: TAction;
    CDSCadastroDATA_CADASTRO: TSQLTimeStampField;
    CDSCadastroATIVO: TSmallintField;
    CDSCadastroDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    procedure RemoveAcento(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CDSCadastroAfterInsert(DataSet: TDataSet);
    procedure CBTipoSelect(Sender: TObject);
    procedure DSSFilialChange(Sender: TObject);
    procedure CDSCadastroCalcFields(DataSet: TDataSet);
    procedure BTMatrizClick(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure BTSalvarClick(Sender: TObject);
    procedure BTMunicipioClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CBPessoaContatoTipoSelect(Sender: TObject);
    procedure BTSalvarImagemClick(Sender: TObject);
    procedure BTLimparImagemClick(Sender: TObject);
    procedure PCPrincipalChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNEnderecoClick(Sender: TObject; Button: TNavigateBtn);
    procedure CDSCadastroBeforePost(DataSet: TDataSet);
    procedure ExcluirContato1Click(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBEditDocumentoExit(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure CBMarcarClick(Sender: TObject);
    procedure AVerificarNomeExecute(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    RetornaForm : Boolean;
    procedure VerificaCampos;
    procedure VerificaUsuarios;
    procedure CarregaHint;
  public
    { Public declarations }
  end;

var
  CadastroEmpresaForm: TCadastroEmpresaForm;

implementation
uses Base, UFuncoes, UPesquisaEmpresa, UPesquisaMunicipio, UVerificaPessoa;
{$R *.dfm}

procedure TCadastroEmpresaForm.RemoveAcento(Sender: TObject);
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

procedure TCadastroEmpresaForm.VerificaCampos;
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

procedure TCadastroEmpresaForm.VerificaUsuarios;
var
  i, Elementos : Integer;
  Empresas : Array of Integer;
begin
  try
    if (CDSCadastroFILIAL.Value = 0) then
      begin
        CDSEmpresaFilial.Close;
        qryEmpresaFilial.SQL.Text := 'select empresa_id from empresa where empresa_matriz = ' +
          IntToStr(CDSCadastroEMPRESA_ID.Value);
        CDSEmpresaFilial.Open;

        if not (CDSEmpresaFilial.IsEmpty) then
          begin
            CDSEmpresaFilial.Last;
            CDSEmpresaFilial.First;
            SetLength(Empresas, CDSEmpresaFilial.RecordCount + 1);

            Empresas[0] := CDSCadastroEMPRESA_ID.Value;
            inc(Elementos);

            for i := 1 to CDSEmpresaFilial.RecordCount do
              begin
                Empresas[i] := CDSEmpresaFilial.Fields[0].Value;
                inc(Elementos);
              end;
          end
        else
          begin
            SetLength(Empresas, 1);
            Empresas[0] := CDSCadastroEMPRESA_ID.Value;
            inc(Elementos);
          end;
      end
    else
      begin
        SetLength(Empresas, 1);
        Empresas[1] := CDSCadastroEMPRESA_ID.Value;
        inc(Elementos);
      end;

    with CDSEmpresaUsuario do
      begin
        try
          DisableControls;
          First;
          while not Eof do
            begin
              BancoDados.Conexao.StartTransaction(BancoDados.Transacao);
              for i := 0 to (Elementos - 1) do
                begin
                  with BancoDados.qryAuxiliar do
                    begin
                      Close;
                      SQL.Text := 'select usuario_id from empresa_usuario where empresa_id = ' +
                        IntToStr(Empresas[i]) + ' and usuario_id = ' +
                        IntToStr(CDSEmpresaUsuarioUSUARIO_ID.Value);
                      Open;
                    end;

                  if (CDSEmpresaUsuarioLIBERADO.Value = 1) then
                    begin
                      if (BancoDados.qryAuxiliar.IsEmpty) then
                        begin
                          BancoDados.qryExecute.SQL.Text := 'insert into empresa_usuario(empresa_id,' +
                            'usuario_id)values(' +
                            IntToStr(Empresas[i]) + ', ' +
                            IntToStr(CDSEmpresaUsuarioUSUARIO_ID.Value) + ');';
                          BancoDados.qryExecute.ExecSQL(True);
                        end;
                    end
                  else
                    begin
                      if not (BancoDados.qryAuxiliar.IsEmpty) then
                        begin
                          BancoDados.qryExecute.SQL.Text := 'delete from empresa_usuario where empresa_id = ' +
                            IntToStr(Empresas[i]) + ' and usuario_id = ' +
                            IntToStr(CDSEmpresaUsuarioUSUARIO_ID.Value) + ';';
                          BancoDados.qryExecute.ExecSQL(True);
                        end;
                    end;
                end;
              BancoDados.Conexao.Commit(BancoDados.Transacao);
              Next;
            end;
        finally
          EnableControls;
        end;
      end;
  finally
    FreeMemory(Empresas);
  end;
end;

procedure TCadastroEmpresaForm.CarregaHint;
begin
  CBTipo.Hint := 'Tipo de Empresa (Pessoa Física/Pessoa Jurídica).';
  DBEditCodigo.Hint := 'Este é o Código de identificação da Empresa.' +
    ' Ele é gerado automaticamente pelo Sistema';
  BTSalvarImagem.Hint := 'Selecionar e Salvar a Foto do titular da Empresa.';
  BTLimparImagem.Hint := 'Excluir a Foto do titular da Empresa.';

  case CBTipo.ItemIndex of
    0: begin
      DBEditNome.Hint := 'Informe aqui o Nome da Empresa.' +
        ' Verifique antes se o Nome informado já existe pressionando a tecla F2.';
      DBEditApelido.Hint := 'Informe aqui o Apelido do Titular da Empresa.';
      DBEditDocumento.Hint := 'Informe aqui o CPF do titular da Empresa.' +
        ' Digite apenas Números. O Sistema verificará sua validade' +
        ' pressionando a tecla Enter.';
      DBEditIE.Hint := 'Informe aqui o Número de Identidade.' +
        ' Digite apenas Números. O Sistema verificará sua validade' +
        ' pressionando a tecla Enter.';
      DBDataNascimento.Hint := 'Infome aqui a Data de Nascimento do titular da' +
        ' Empresa.';
      DSSFilial.Hint := 'Informe aqui a Filial referente a esta Empresa.';
      DBEditMatriz.Hint := 'Código da Empresa Matriz. Para informar a Empresa Matriz' +
        ' pressione o botão ao lado e informe a Empresa que corresponde a Matriz.';
      BTMatriz.Hint := 'Pesquisar por Empresa Matriz, isso quando a Empresa em questão se' +
        ' tratar de uma Filial.';
    end;
    1: begin
      DBEditNome.Hint := 'Informe aqui a Razão Social da Empresa.' +
        ' Verifique antes se a Razão Social informada já existe pressionando a tecla F2.';
      DBEditApelido.Hint := 'Informe aqui o Nome Fantasia da Empresa.';
      DBEditDocumento.Hint := 'Informe aqui o CNPJ da Empresa.' +
        ' Digite apenas Números. O Sistema verificará sua validade' +
        ' pressionando a tecla Enter.';
      DBEditIE.Hint := 'Informe aqui a Inscrição Estadual.' +
        ' Digite apenas Números. O Sistema verificará sua validade' +
        ' pressionando a tecla Enter.';
      DBEditIM.Hint := 'Informe aqui a Inscrição Municipal.' +
        ' Digite apenas Números. O Sistema verificará sua validade' +
        ' pressionando a tecla Enter.';
      DBDataNascimento.Hint := 'Infome aqui a Data de Abertura da Empresa.';
      DSSFilial.Hint := 'Informe aqui a Filial referente a Empresa (Caso já tenha sido' +
        ' Cadastrada a Matriz). O Parametro "2" deve ser ativado antes.';
      DBEditMatriz.Hint := 'Código da Empresa Matriz. Para informar a Empresa Matriz' +
        ' pressione o botão ao lado e informe a Empresa que corresponde a Matriz.';
      BTMatriz.Hint := 'Pesquisar por Empresa Matriz, isso quando a Empresa em questão se' +
        ' tratar de uma Filial.';
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
  DBNEndereco.Hint := 'Alterar Endereços da Empresa. É possível Inserir vários endereços' +
    ' para cada Empresa.';
  CBPessoaContatoTipo.Hint := 'Informe aqui o Tipo de Contato a ser alterado.';
  DBGrid1.Hint := 'Lista de Contatos inseridos. Selecione o tipo de contato e Insira' +
    ' a informação.';
  DBGrid2.Hint := 'Lista de Usuários do Sistema. Os que estão marcados possui acesso' +
    ' a Filial da Empresa em questão.';
  CBMarcar.Hint := 'Marcar/Desmarca todos os Usuários para esta Empresa.';
end;

procedure TCadastroEmpresaForm.AVerificarNomeExecute(Sender: TObject);
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

procedure TCadastroEmpresaForm.BTCancelarClick(Sender: TObject);
begin
  BancoDados.CDSPessoa.Cancel;
  BancoDados.CDSPessoaEndereco.Cancel;
  BancoDados.CDSPessoaContato.Cancel;
  BancoDados.CDSPessoaImagem.Cancel;

  inherited; //Herança
end;

procedure TCadastroEmpresaForm.BTLimparImagemClick(Sender: TObject);
begin
  BancoDados.CDSPessoaImagem.Delete;
end;

procedure TCadastroEmpresaForm.BTMatrizClick(Sender: TObject);
begin
  try
    if not Assigned(PesquisaEmpresaForm) then
      PesquisaEmpresaForm := TPesquisaEmpresaForm.Create(Application);
    Hide;
    RetornaForm := True;
    SBPrincipal.Panels[0].Text := '';
    if (PesquisaEmpresaForm.ShowModal = mrOk) then
      begin
        if not (CDSCadastro.State in [dsInsert]) then
          CDSCadastro.Edit;
        if (PesquisaEmpresaForm.CDSConsultaEMPRESA_ID.Value > 0) then
          CDSCadastroEMPRESA_MATRIZ.Value := PesquisaEmpresaForm.CDSConsultaEMPRESA_ID.Value
        else
          begin
            Mensagem('Nenhuma Empresa foi informada!', mtWarning,[mbOk],mrOK,0);
            Abort;
          end;
      end;
  finally
    PesquisaEmpresaForm.Free;
    PesquisaEmpresaForm := nil;
    Show;
    RetornaForm := False;
  end;
end;

procedure TCadastroEmpresaForm.BTMunicipioClick(Sender: TObject);
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

procedure TCadastroEmpresaForm.BTSalvarClick(Sender: TObject);
begin
  VerificaCampos;

  inherited; //Herança

  VerificaUsuarios;

  BancoDados.Conexao.StartTransaction(BancoDados.Transacao);

  BancoDados.CDSPessoaEndereco.ApplyUpdates(0);
  BancoDados.CDSPessoaContato.ApplyUpdates(0);
  BancoDados.CDSPessoaImagem.ApplyUpdates(0);

  BancoDados.Conexao.Commit(BancoDados.Transacao);
end;

procedure TCadastroEmpresaForm.BTSalvarImagemClick(Sender: TObject);
begin
  SDPessoaImagem.Title := 'Informe a Logo Marca da Empresa';
  SDPessoaImagem.InitialDir := UFuncoes.RCopy(Application.ExeName, '\');
  SDPessoaImagem.Filter := 'Arquivo de Imagem|*.bmp|';
  SDPessoaImagem.DefaultExt := 'BMP';
  SDPessoaImagem.FilterIndex := 1;

  if (SDPessoaImagem.Execute) then
    begin
      if (BancoDados.CDSPessoaImagem.IsEmpty) then
        BancoDados.CDSPessoaImagem.Append
      else
        BancoDados.CDSPessoaImagem.Edit;

      try
        DBImage.Picture.LoadFromFile(SDPessoaImagem.FileName);
        BancoDados.CDSPessoaImagem.Post;
      except
        begin
          Mensagem('Falha ao tentar gravar a Logo Marca!', mtWarning,[mbOk],mrOK,0);
          Abort;
        end;
      end;
    end;

  SetFocus;
end;

procedure TCadastroEmpresaForm.CBMarcarClick(Sender: TObject);
begin
  try
    with CDSEmpresaUsuario do
      begin
        DisableControls;
        First;
        while not Eof do
          begin
            Application.ProcessMessages;
            Edit;
            if (CBMarcar.Checked) then
              CDSEmpresaUsuarioLIBERADO.Value := 1
            else
              CDSEmpresaUsuarioLIBERADO.Value := 0;
            Post;
            Next;
          end;
      end;
  finally
    if (CBMarcar.Checked) then
      CBMarcar.Caption := 'Desmarcar Todos'
    else
      CBMarcar.Caption := 'Marcar Todos';
    CDSEmpresaUsuario.First;
    CDSEmpresaUsuario.EnableControls;
    DBGrid2.Refresh;
  end;
end;

procedure TCadastroEmpresaForm.CBPessoaContatoTipoSelect(Sender: TObject);
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

procedure TCadastroEmpresaForm.CBTipoSelect(Sender: TObject);
begin
  case CBTipo.ItemIndex of
    0: begin
      LBNome.Caption := 'Nome:';
      LBApelido.Caption := 'Apelido:';
      LBDocumento.Caption := 'CPF:';
      LBDataNascimento.Visible := True;
      DBDataNascimento.Visible := True;
      LBIE.Caption := 'Nº Identidade:';
      LBIM.Visible := False;
      DBEditIM.Visible := False;
      LBDataNascimento.Caption := 'Data Nascimento';

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
      PImagem.Caption := 'Foto';
      DBImage.Stretch := False;
    end;
    1: begin
      LBNome.Caption := 'Razão Social:';
      LBApelido.Caption := 'Nome Fantasia:';
      LBDocumento.Caption := 'CNPJ:';
      LBDataNascimento.Visible := True;
      DBDataNascimento.Visible := True;
      LBIE.Caption := 'Inscrição Estadual:';
      LBIM.Caption := 'Inscrição Municipal:';
      LBIM.Visible := True;
      DBEditIM.Visible := True;
      LBDataNascimento.Caption := 'Abertura da Empresa';

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
      PImagem.Caption := 'Logomarca';
      DBImage.Stretch := True;
    end;
  end;
  DBEditNome.SetFocus;
end;

procedure TCadastroEmpresaForm.CDSCadastroAfterInsert(DataSet: TDataSet);
begin
  try
    with BancoDados.qryGeraID do
      begin
        GeraTrace(BancoDados.Tabela,'Inicia Geração de ID');
        Close;
        SQL.Clear;
        SQL.Add('select gen_id( GEN_EMPRESA_ID, 1 ) from RDB$DATABASE');
        Open;
        CDSCadastroEMPRESA_ID.Value := BancoDados.qryGeraID.Fields[0].Value;
        CDSCadastroTIPO.Value := 'F';
        GeraTrace('EMPRESA','ID Gerado');
        CDSCadastroFILIAL.Value := 0;
        CDSCadastro.FieldByName('DATA_CADASTRO').Value := Now;
        CDSCadastroATIVO.Value := 1;
      end;
  except
    Mensagem('Falha ao Tentar Gerar o I.D!', mtWarning,[mbOk],mrOK,0);
  end;
end;

procedure TCadastroEmpresaForm.CDSCadastroBeforePost(DataSet: TDataSet);
begin
  if not (BancoDados.CDSPessoa.State in [dsEdit, dsInsert]) then
    BancoDados.CDSPessoa.Edit;
  BancoDados.CDSPessoa.Post;

  inherited; //Herança
end;

procedure TCadastroEmpresaForm.CDSCadastroCalcFields(DataSet: TDataSet);
begin
  if (CDSCadastroEMPRESA_MATRIZ.Value > 0) then
    begin
      with BancoDados.qryAuxiliar do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'select nome from empresa where empresa_id = ' +
            IntToStr(CDSCadastroEMPRESA_MATRIZ.Value);
          Open;
        end;
      CDSCadastrocalc_nome_matriz.Value := BancoDados.qryAuxiliar.Fields[0].Value;
    end;
end;

procedure TCadastroEmpresaForm.DBEditDocumentoExit(Sender: TObject);
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

procedure TCadastroEmpresaForm.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    begin
      if (BancoDados.CDSPessoaContato.State in [dsInsert, dsEdit]) then
        BancoDados.CDSPessoaContato.Post;
      BancoDados.CDSPessoaContato.Append;
    end;
end;

procedure TCadastroEmpresaForm.DBGrid2CellClick(Column: TColumn);
begin
  if (DBGrid2.SelectedField.FieldName = 'LIBERADO') then
    begin
      try
        CDSEmpresaUsuario.DisableControls;
        CDSEmpresaUsuario.Edit;
        CDSEmpresaUsuarioLIBERADO.Value := (not CDSEmpresaUsuarioLIBERADO.Value);
        CDSEmpresaUsuario.Post;
      finally
        CDSEmpresaUsuario.EnableControls;
      end;
    end;
end;

procedure TCadastroEmpresaForm.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'LIBERADO' then
    begin
      DBGrid2.Canvas.FillRect(Rect);
      Check := 0;
      if (CDSEmpresaUsuarioLIBERADO.Value = 1) then
        Check := DFCS_CHECKED
      else
        Check := 0;
      R := Rect;
      InflateRect(R,-3,-3);
      DrawFrameControl(DBGrid2.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
    end;
end;

procedure TCadastroEmpresaForm.DBNEnderecoClick(Sender: TObject;
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

procedure TCadastroEmpresaForm.DSSFilialChange(Sender: TObject);
begin
  BTMatriz.Enabled := (CDSCadastroFILIAL.Value > 0);
end;

procedure TCadastroEmpresaForm.ExcluirContato1Click(Sender: TObject);
begin
  if (Mensagem('Deseja realmente Excluir este Registro?',mtConfirmation,[mbYES,mbNO],mrNO,0) = idYES) then
    BancoDados.CDSPessoaContato.Delete;
end;

procedure TCadastroEmpresaForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited; //Herança

  BancoDados.CDSPessoaEndereco.Close;
  BancoDados.CDSPessoaContato.Close;
  BancoDados.CDSPessoaImagem.Close;
  CDSEmpresaUsuario.Close;
end;

procedure TCadastroEmpresaForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key = #13) and not (ActiveControl is TDBGrid)) then
    begin
      key := #0;
      Perform(WM_NextDlgCtl,0,0);
    end;

  if ((key = #27) and not (ActiveControl is TDBGrid)) then
    begin
      key := #0;
      Close;
    end;
end;

procedure TCadastroEmpresaForm.FormShow(Sender: TObject);
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

      BancoDados.CDSPessoaImagem.Close;
      BancoDados.qryPessoaImagem.SQL.Text := 'select * from pessoa_imagem where tabela = ' +
        QuotedStr(BancoDados.Tabela) + ' and pessoa_id = ' + IntTostr(CDSCadastroPESSOA_ID.Value);
      BancoDados.CDSPessoaImagem.Open;

      CDSEmpresaUsuario.Close;
      qryEmpresaUsuario.SQL.Text := 'select * from usuario where ativo = 1';
      CDSEmpresaUsuario.Open;
      CDSEmpresaUsuario.First;

      while not CDSEmpresaUsuario.Eof do
        begin
          CDSEmpresaUsuario.Edit;
          with BancoDados.qryAuxiliar do
            begin
              Close;
              SQL.Text := 'select usuario_id from empresa_usuario where empresa_id = ' +
                IntToStr(CDSCadastroEMPRESA_ID.Value) + ' and usuario_id = ' +
                IntToStr(CDSEmpresaUsuarioUSUARIO_ID.Value);
              Open;
            end;

          if not (BancoDados.qryAuxiliar.IsEmpty) then
            CDSEmpresaUsuarioLIBERADO.Value := 1
          else
            CDSEmpresaUsuarioLIBERADO.Value := 0;
          CDSEmpresaUsuario.Post;

          CDSEmpresaUsuario.Next;
        end;

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
          PImagem.Caption := 'Foto';
          DBImage.Stretch := False;
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
          PImagem.Caption := 'Logomarca';
          DBImage.Stretch := True;
        end;
      end;

      try
        BTMatriz.Glyph.LoadFromFile(BancoDados.imgOk);
        BTMunicipio.Glyph.LoadFromFile(BancoDados.imgOk);
      except end;

      CarregaHint;
    end;
end;

procedure TCadastroEmpresaForm.PCPrincipalChange(Sender: TObject);
begin
  if (PCPrincipal.TabIndex = 1) then
    CBPessoaContatoTipoSelect(Sender);
end;

end.
