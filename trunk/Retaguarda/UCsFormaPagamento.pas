unit UCsFormaPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, ExtCtrls, Grids, DBGrids;

type
  TCsFormaPagamentoForm = class(TForm)
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
  CsFormaPagamentoForm: TCsFormaPagamentoForm;

implementation
uses Base, UFuncoes, UCadFormaPagamento;
{$R *.dfm}

procedure TCsFormaPagamentoForm.BTAdicionarClick(Sender: TObject);
begin
  try
    if not Assigned(CadFormaPagamentoForm) then
      CadFormaPagamentoForm := TCadFormaPagamentoForm.Create(Application);
    if (CadFormaPagamentoForm.ShowModal = mrOk) then
        with BancoDeDados.qryCsFormaPagamento do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select * from cadforma_pagamento where idforma_pagamento = '+
                IntToStr(FormaPagamentoID));
            Open;
            Edit;
          end;
  finally
    CadFormaPagamentoForm.Release;
    CadFormaPagamentoForm := nil;
  end;
end;

procedure TCsFormaPagamentoForm.BTPesquisarClick(Sender: TObject);
var
  Campo : ShortString;
begin
  case (CBPesquisar.ItemIndex) of
    0: Campo := 'idforma_pagamento';
    1: Campo := 'descricao';
  end;
  with BancodeDados.qryCsFormaPagamento do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from cadforma_pagamento');
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


procedure TCsFormaPagamentoForm.EditPesquisarChange(Sender: TObject);
begin
  BTPesquisarClick(Self);
end;

procedure TCsFormaPagamentoForm.FormShow(Sender: TObject);
begin
  CHApenasAtivos.Checked := True;
  BTPesquisarClick(Self);
end;

end.
