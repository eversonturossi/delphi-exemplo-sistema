unit UConfiguracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles, ShellApi;

type
  TFConfiguracao = class(TForm)
    GroupBox1: TGroupBox;
    CAutoPesqProd: TCheckBox;
    Label1: TLabel;
    CBuscaContenhaProd: TCheckBox;
    Label2: TLabel;
    EPackedProduto: TEdit;
    Label3: TLabel;
    CAutoPesqCli: TCheckBox;
    CBuscaContenhaCli: TCheckBox;
    Label4: TLabel;
    EPackedCliente: TEdit;
    GroupBox2: TGroupBox;
    EDirLocal: TEdit;
    GroupBox3: TGroupBox;
    CTipoImpressao: TComboBox;
    BtSalvar: TBitBtn;
    BtSair: TBitBtn;
    GroupBox4: TGroupBox;
    ENumDias: TEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConfiguracao: TFConfiguracao;

implementation

uses UOrcamento, UBarsa;

{$R *.dfm}

procedure TFConfiguracao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_Escape
     then Close;
end;

procedure TFConfiguracao.BtSairClick(Sender: TObject);
begin
Close;
end;

procedure TFConfiguracao.FormShow(Sender: TObject);
begin
     if Auto_Pesq_Produtos='S'
     then CAutoPesqProd.Checked:=True
     else CAutoPesqProd.Checked:=False;

     if Busca_Contenha_Prod='S'
     then CBuscaContenhaProd.Checked:=True
     else CBuscaContenhaProd.Checked:=False;

     EPackedProduto.Text:=PackedRecords_Produtos;

     if Auto_Pesq_Clientes='S'
     then CAutoPesqCli.Checked:=True
     else CAutoPesqCli.Checked:=False;

     if Busca_Contenha_Cliente='S'
     then CBuscaContenhaCli.Checked:=True
     else CBuscaContenhaCli.Checked:=False;

     EPackedCliente.Text:=PackedRecords_Clientes;
     EDirLocal.Text:=Dir_Arq_Locais;
     CTipoImpressao.Text:=TipoImpressora;
     ENumDias.Text:=NumDiasValidadeOrc;
end;

procedure TFConfiguracao.BtSalvarClick(Sender: TObject);
begin
      AC;
      SistemIni  := TIniFile.Create( vDiretorio );
      With SistemIni
      do begin
         if CAutoPesqProd.Checked
         then WriteString('Config','Auto Pesquisa Produtos','S')
         else WriteString('Config','Auto Pesquisa Produtos','N');

         if CAutoPesqCli.Checked
         then WriteString('Config','Auto Pesquisa Clientes','S')
         else WriteString('Config','Auto Pesquisa Clientes','N');

         if CBuscaContenhaProd.Checked
         then WriteString('Config','Busca Contenha Produtos','S')
         else WriteString('Config','Busca Contenha Produtos','N');

         if CBuscaContenhaCli.Checked
         then WriteString('Config','Busca Contenha Clientes','S')
         else WriteString('Config','Busca Contenha Clientes','N');

         WriteString('Config','PackedRecords Clientes',EPackedCliente.Text);
         WriteString('Config','PackedRecords Produtos',EPackedProduto.Text);
         WriteString('Config','No Dias Validade',ENumDias.Text);
         WriteString('Config','Diretorio Arquivos Locais',EDirLocal.Text);

         WriteString('Impressora','Tipo da Impressora',CTipoImpressao.Text);
         end;
      SistemIni.Free;

      Sleep(1000);

      DC;

      Informa('Para que as configurações tenha efeito o sistema será reiniciado!');
      ShellExecute(0,Nil,PChar(GetCurrentDir+'\Orcamentos.EXE'),'', Nil, SW_SHOWNORMAL);
      Application.Terminate;
end;

end.
