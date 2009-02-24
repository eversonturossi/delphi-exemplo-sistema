unit UCsClassificacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, ExtCtrls, Grids, DBGrids;

type
  TCsClassificacaoForm = class(TForm)
    Panel1: TPanel;
    BTCancelar: THTMLButton;
    BitBtn1: THTMLButton;
    DBGrid1: TDBGrid;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    CBPesquisar: TComboBox;
    EditPesquisar: TEdit;
    BTPesquisar: THTMLButton;
    CHApenasAtivos: TCheckBox;
    BTAdicionar: THTMLButton;
    procedure BTPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTAdicionarClick(Sender: TObject);
    procedure EditPesquisarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CsClassificacaoForm: TCsClassificacaoForm;

implementation
uses Base, UFuncoes, UCadClassficacao;
{$R *.dfm}

procedure TCsClassificacaoForm.BTAdicionarClick(Sender: TObject);
begin
  try
    if not Assigned(CadClassificacaoForm) then
      CadClassificacaoForm := TCadClassificacaoForm.Create(Application);
    if (CadClassificacaoForm.ShowModal = mrOk) then
        with BancoDeDados.qryCsClassificacao do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select * from cadClassificacao where idclassificacao = '+
                IntToStr(ClassificacaoID));
            Open;
            Edit;
          end;
  finally
    CadClassificacaoForm.Release;
    CadClassificacaoForm := nil;
  end;
end;

procedure TCsClassificacaoForm.BTPesquisarClick(Sender: TObject);
var
  Campo : ShortString;
begin
  case (CBPesquisar.ItemIndex) of
    0: Campo := 'idclassificacao';
    1: Campo := 'descricao';
  end;
  with BancodeDados.qryCsClassificacao do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from cadclassificacao');
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


procedure TCsClassificacaoForm.EditPesquisarChange(Sender: TObject);
begin
   BTPesquisarClick(Self);
end;

procedure TCsClassificacaoForm.FormShow(Sender: TObject);
begin
  CHApenasAtivos.Checked := True;
  BTPesquisarClick(Self);
end;

end.
