unit UCsLocalizacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, ExtCtrls, Grids, DBGrids;

type
  TCsLocalizacaoForm = class(TForm)
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
    procedure BTPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditPesquisarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CsLocalizacaoForm: TCsLocalizacaoForm;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TCsLocalizacaoForm.BTPesquisarClick(Sender: TObject);
var
  Campo : ShortString;
begin
  case (CBPesquisar.ItemIndex) of
    0: Campo := 'idlocalizacao';
    1: Campo := 'idproduto';
    2: Campo := 'idproduto';
    3: Campo := 'corredor';
    4: Campo := 'estante';
    5: Campo := 'prateleira';
    6: Campo := 'bandeja';
  end;
  with BancodeDados.qryCsGrupo do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from cadlocalizacao');
      if (CBPesquisar.ItemIndex in [0,1]) then
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
              SQL.Add(' where exists(select idproduto from cadproduto where '+
                  'nome ilike '+''''+EditPesquisar.Text+'%'+'''');
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

procedure TCsLocalizacaoForm.EditPesquisarChange(Sender: TObject);
begin
  BTPesquisarClick(Self);
end;

procedure TCsLocalizacaoForm.FormShow(Sender: TObject);
begin
  CHApenasAtivos.Checked := True;
  BTPesquisarClick(Self);
end;

end.
