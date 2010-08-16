{*******************************************************************************
  Autor......: EasyTEF Team - 10/01/2008
  Objetivo...: Programar form para apresentação de mensagens podendo ser modal
               ou não.
  Comentários:
  Alterações.:
*******************************************************************************}

unit MsgFrmTEF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  {$IFDEF DELPHI_6_UP}
  Variants,
  {$ENDIF}
  StdCtrls, Buttons, ExtCtrls;

type
  TMsgForm = class(TForm)
    btnOk: TBitBtn;
    lblMsg: TLabel;
    tmSumir: TTimer;
    tmAparecer: TTimer;
    procedure btnOkClick(Sender: TObject);
    procedure tmSumirTimer(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmAparecerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    l: TStringList;
    procedure redimensionar;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; caption: TStrings;
      sumirSozinho: Boolean = False; segundosAparecendo: Integer = 5); reintroduce;
    destructor Destroy; override;
  end;

var
  MsgForm: TMsgForm;

implementation

{$R *.dfm}

procedure TMsgForm.btnOkClick(Sender: TObject);
begin
  Close;
end;

constructor TMsgForm.Create(AOwner: TComponent; caption: TStrings;
  sumirSozinho: Boolean; segundosAparecendo: Integer);
begin
  l := TStringList.Create;
  l.Assign(caption);
  inherited Create(AOwner);
  tmSumir.Enabled := sumirSozinho;
  tmSumir.Interval := segundosAparecendo * 1000;
  //tmAparecer.Enabled := tmSumir.Enabled;
  btnOk.Visible := not sumirSozinho;
end;

destructor TMsgForm.Destroy;
begin
  l.Free;
  inherited;
end;

procedure TMsgForm.redimensionar;
var i: Integer;
begin
  lblMsg.Caption := '';
  for i := 0 to l.Count - 1 do begin
    lblMsg.Caption := lblMsg.Caption + l[i] + ' ';
    // se o tamanho do texto do label for maior que o tamanho do form
    if lblMsg.Width > Self.Width then
      // liga a quebra de linhas do label
      lblMsg.WordWrap := True;
  end;//for

  // se houve quebra de linhas do label
  if lblMsg.WordWrap then
    // aumenta o tamanho do form levando em conta o tamanho do label e o
    // afastamento do label em relação a esquerda do form
    Self.Width := lblMsg.Width + (lblMsg.Left * 2)
  else
    // centraliza o label de acordo com o tamanho do form e do label
    lblMsg.Left := (Self.Width div 2) - (lblMsg.Width div 2);

  // se a alura do label for maior que a altura do form
  if lblMsg.Height > btnOk.Top then
    // redimensiona a altura do form de acordo com o tamanho do label e a
    // distância do botão até o a extremidade inferior do form
    Self.Height := lblMsg.Height + btnOk.Top;

  // centraliza o botao OK de acordo com o tamanho do form e do botao
  btnOK.Left := (Self.Width div 2) - (btnOK.Width div 2);
end;

procedure TMsgForm.tmSumirTimer(Sender: TObject);
begin
  Close;
end;

procedure TMsgForm.FormDeactivate(Sender: TObject);
begin
  BringToFront;
  Repaint;
  Refresh;
end;

procedure TMsgForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMsgForm.tmAparecerTimer(Sender: TObject);
begin
  tmAparecer.Enabled := False;
  try
    if Self.Visible and Self.CanFocus and not Self.Focused then begin
      Application.BringToFront;
      Self.SetFocus;
      Self.BringToFront;
    end;//if
  finally
    tmAparecer.Enabled := True;
  end;//try..finally
end;

procedure TMsgForm.FormShow(Sender: TObject);
begin
  redimensionar;
end;

end.
