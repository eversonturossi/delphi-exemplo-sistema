unit Calculad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, Buttons, clipbrd, Math;

type
  TFCalculadora = class(TForm)
    Panel1: TPanel;
    LbVisor: TLabel;
    Btn7: TSpeedButton;
    Btn4: TSpeedButton;
    Btn1: TSpeedButton;
    Btn0: TSpeedButton;
    Btn8: TSpeedButton;
    Btn5: TSpeedButton;
    Btn2: TSpeedButton;
    Btn9: TSpeedButton;
    Btn6: TSpeedButton;
    Btn3: TSpeedButton;
    BtnVirgula: TSpeedButton;
    BtnDiv: TSpeedButton;
    BtnMult: TSpeedButton;
    BtnSub: TSpeedButton;
    BtnAdic: TSpeedButton;
    BtnRaiz: TSpeedButton;
    BtnPorcentagem: TSpeedButton;
    BtnReciproca: TSpeedButton;
    BtnIgual: TSpeedButton;
    BtnBackspace: TSpeedButton;
    BtnCE: TSpeedButton;
    BtnC: TSpeedButton;
    BtnSinal: TSpeedButton;
    MenuPrincipal: TMainMenu;
    Editar: TMenuItem;
    Copiar: TMenuItem;
    Colar: TMenuItem;
    EdVisor: TEdit;
    Shape1: TShape;
    Panel2: TPanel;
    Shape2: TShape;
    FitaDigitos: TMemo;
    Fita: TMemo;
    PopFita: TPopupMenu;
    LimparFita1: TMenuItem;
    procedure CopiarClick(Sender: TObject);
    procedure ColarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnCClick(Sender: TObject);
    procedure BtnCEClick(Sender: TObject);
    procedure BtnBackspaceClick(Sender: TObject);
    procedure Btn7Click(Sender: TObject);
    procedure BtnDivClick(Sender: TObject);
    procedure BtnSinalClick(Sender: TObject);
    procedure BtnVirgulaClick(Sender: TObject);
    procedure BtnRaizClick(Sender: TObject);
    procedure BtnPorcentagemClick(Sender: TObject);
    procedure BtnReciprocaClick(Sender: TObject);
    procedure BtnIgualClick(Sender: TObject);
    procedure EdVisorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdVisorKeyPress(Sender: TObject; var Key: Char);
    procedure FitaEnter(Sender: TObject);
    procedure LimparFita1Click(Sender: TObject);
  private
    { Private declarations }
    LinhaAtual: Integer;
    procedure LimpaFita;
    procedure PreencheFita;
  public
    { Public declarations }
  protected
    procedure Calcula(Start:Boolean);
    procedure Enter;
  end;

type
  Modes=(Num,Operand,Comma);

var
  FCalculadora: TFCalculadora;
  Result,AdverseNum:Extended;
  Val,Opr,xStr:String;
  Mode:Modes;
  Start:Boolean;

implementation

{$R *.DFM}

procedure TFCalculadora.Calcula(Start:Boolean);
begin
  PreencheFita;
  if Opr='Num' then
   Result:=Result+StrToFloat(LbVisor.Caption);
  if Opr='BtnAdic' then
   Result:=Result+StrToFloat(LbVisor.Caption);
  if Opr='BtnSub' then
   Result:=Result-StrToFloat(LbVisor.Caption);
  if Opr='BtnMult' then
   Result:=Result*StrToFloat(LbVisor.Caption);
  if Opr='BtnDiv' then
  begin
    if Start=True then
      Result:=StrToFloat(LbVisor.Caption)
    else
    begin
      try
        Result:=Result/StrToFloat(LbVisor.Caption);
      except on EZeroDivide do
       begin
         Result:=0;
         ShowMessage('Divisão por Zero !');
         Beep;
       end;
      end;
    end;
  end;
  if Opr='BtnReciproca' then
  begin
    if Start=True then
      Result:=StrToFloat(LbVisor.Caption)
    else
    begin
      try
       Result:=1/StrToFloat(LbVisor.Caption);
      except on EZeroDivide do
       begin
         Result:=0;
         ShowMessage('Divisão por Zero !');
         Beep;
       end;
      end;
    end;
  end;
  if Opr='BtnRaiz' then
    Result:=SQRT(StrToFloat(LbVisor.Caption));
  if Opr='BtnIgual' then
    Result:=StrToFloat(LbVisor.Caption);
  LbVisor.Caption:=FormatFloat('#####0.00',Result);//FloatToStr(Result);
end;

procedure TFCalculadora.LimpaFita;
Var
  I: Integer;
begin
  LinhaAtual := 0;
  Fita.Lines.Clear;
  FitaDigitos.Lines.Clear;
  For I:=0 to 13 do
  begin
    Fita.Lines.Add('');
    FitaDigitos.Lines.Add('');
  end;
end;

procedure TFCalculadora.PreencheFita;
Var
  Operador: String;
begin
  Operador := '';
  if (Opr='BtnAdic') or (Opr='Num') then
    Operador := '+'
  else if Opr='BtnSub' then
    Operador := '-'
  else if Opr='BtnMult' then
    Operador := 'x'
  else if Opr='BtnDiv' then
    Operador := '/'
  else if Opr='BtnReciproca' then
    Operador := '1/x'
  else if Opr='BtnRaiz' then
    Operador := 'R'
  else if Opr='BtnIgual' then
    Operador := '=';
  if Operador <> '' then
  begin
    if LinhaAtual > 14 then
      LimpaFita;
    Fita.Lines[LinhaAtual]        := LbVisor.Caption;
    FitaDigitos.Lines[LinhaAtual] := Operador;
    LinhaAtual := LinhaAtual + 01;
  end;
end;

procedure TFCalculadora.Enter;
begin
  if Mode=Num then
  begin
    if ((LbVisor.Caption<>'0')) then
     LbVisor.Caption:=LbVisor.Caption+Val
    else
     LbVisor.Caption:=Val;
  end;
  if Mode=Comma then
   LbVisor.Caption:=LbVisor.Caption+Val;
  if Mode=Operand then
   LbVisor.Caption:=Val;
  Start:=False;
end;

procedure TFCalculadora.CopiarClick(Sender: TObject);
begin
  EdVisor.Text:=LbVisor.Caption;
  EdVisor.SelectAll;
  EdVisor.CopyToClipboard;
end;

procedure TFCalculadora.ColarClick(Sender: TObject);
begin
  EdVisor.PasteFromClipboard;
  LbVisor.Caption:=EdVisor.Text;
end;

procedure TFCalculadora.FormShow(Sender: TObject);
begin
  LimpaFita;
end;

procedure TFCalculadora.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Result:=0;
  Mode:=Num;
  Opr:='Num';
end;

procedure TFCalculadora.FormCreate(Sender: TObject);
begin
  Mode:=Num;
  Opr:='Num';
  Start:=True;
  AdverseNum:=0;
end;

procedure TFCalculadora.BtnCClick(Sender: TObject);
begin
  Mode:=Num;
  Result:=0;
  Opr:='Num';
  Start:=True;
  LbVisor.Caption:='0';
  LimpaFita;
end;

procedure TFCalculadora.BtnCEClick(Sender: TObject);
begin
  Mode:=Num;
  Opr:='Num';
  LbVisor.Caption:='0';
end;

procedure TFCalculadora.BtnBackspaceClick(Sender: TObject);
begin
  xStr:=LbVisor.Caption;
  if Length(xStr)>1 then
   Delete(xStr,Length(xStr),1)
  else
  begin
    xStr:='0';
    Beep;
  end;
  LbVisor.Caption:=xStr;
end;

procedure TFCalculadora.Btn7Click(Sender: TObject);
begin
  Val:=(Sender as TSPeedButton).Caption;
  Enter;
  Mode:=Num;
end;

procedure TFCalculadora.BtnDivClick(Sender: TObject);
begin
  xStr:=(Sender as TSpeedButton).Name;
  if ((Start=False)) then
  begin
    if Mode<>Operand then
      Calcula(False);
    Mode:=Operand;
    Opr:=xStr;
  end
  else
    Beep;
end;

procedure TFCalculadora.BtnSinalClick(Sender: TObject);
begin
  xStr:=LbVisor.Caption;
  if LbVisor.Caption='0' then
   Beep;
  if (Pos('-',LbVisor.Caption)=0) then
  begin
    Insert('-',xStr,1);
    LbVisor.Caption:=xStr;
  end
  else
    Delete(xStr,1,1);
  LbVisor.Caption:=xStr;
end;

procedure TFCalculadora.BtnVirgulaClick(Sender: TObject);
begin
  if Pos(',',LbVisor.Caption)=0 then
  begin
    Mode:=Comma;
    Val:=',';
    Enter;
  end
  else
   Beep;
end;

procedure TFCalculadora.BtnRaizClick(Sender: TObject);
begin
  xStr:=(Sender as TSpeedButton).Name;
  if Start=False then
  begin
    Mode:=Operand;
    Opr:=xStr;
    Calcula(False);
  end;
  Mode:=Num;
  Opr:='Equal';
end;

procedure TFCalculadora.BtnPorcentagemClick(Sender: TObject);
begin
  if Start=True then
   Beep
  else
  begin
    LbVisor.Caption:=FloatToStr((StrToFloat(LbVisor.Caption)/100));
    xStr:='BtnMult';
    if Start=False then
    begin
      Mode:=Operand;
      Opr:=xStr;
      Calcula(False);
    end;
    Mode:=Num;
    Opr:='Percent';
  end;
end;

procedure TFCalculadora.BtnReciprocaClick(Sender: TObject);
begin
  xStr:=(Sender as TSpeedButton).Name;
  if Start=False then
  begin
    Mode:=Operand;
    Opr:=xStr;
    Calcula(False);
  end;
  Mode:=Num;
  Opr:='Equal';
end;

procedure TFCalculadora.BtnIgualClick(Sender: TObject);
begin
  xStr:=(Sender as TSpeedButton).Name;
  if ((Start=False)) then
  begin
    if Mode<>Operand then
      Calcula(False);
    Mode:=Operand;
    Opr:=xStr;
  end
  else
    Beep;
end;

procedure TFCalculadora.EdVisorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
   48,96:Sender:=Btn0;
   49,97:Sender:=Btn1;
   50,98:Sender:=Btn2;
   51,99:Sender:=Btn3;
   52,100:Sender:=Btn4;
   53,101:Sender:=Btn5;
   54,102:Sender:=Btn6;
   55,103:Sender:=Btn7;
   56,104:Sender:=Btn8;
   57,105:Sender:=Btn9;
  end;

  if key in [48,49,50,51,52,53,54,55,56,57,96,97,98,99,100,101,102,103,104,105] then
  begin
    Val:=(Sender as TSPeedButton).Caption;
    Enter;
    Mode:=Num;
  end;

  case key of
  106:Sender:=BtnMult;
  107:Sender:=BtnAdic;
  109:Sender:=BtnSub;
  111:Sender:=BtnDiv;
   13:Sender:=BtnIgual;
  end;

  if key in [106,107,109,111,13] then
  begin
   xStr:=(Sender as TSpeedButton).Name;
   if Start=False then
   begin
     Mode:=Operand;
     Calcula(False);
     Opr:=xStr;
   end
   else
     Beep;
  end;

  case key of
  110:
   begin
    if Pos(',',LbVisor.Caption)=0 then
    begin
      Mode:=Comma;
      Val:=',';
      Enter;
    end
    else
     Beep;
   end;
  end;

  if (key = 8) then              // Backspace
    BtnBackspaceClick(Self)
  else if (key = 67) then        // C - Limpa
    BtnCClick(Self)
  else if (key = 69) then        // E - CE
    BtnCEClick(Self)
  else if (key = 83) then        // S - Sqrt
    BtnRaizClick(BtnRaiz)
  else if (key = 88) then        // X - 1/X
    BtnReciprocaClick(BtnReciproca)
  else if (key = 220) then       // \ - +/-
    BtnSinalClick(Self)
  else if (key = 80) then        // P - Porcentagem
    BtnPorcentagemClick(Self)
  else if (key = 27) then        // ESC - Fechar
    Close;
end;

procedure TFCalculadora.EdVisorKeyPress(Sender: TObject; var Key: Char);
begin
  Case Key Of
    '0': Exit; '1': Exit; '2': Exit; '3': Exit; '4' : Exit; '5': Exit; '6': Exit;
    '7': Exit; '8': Exit; '9': Exit; #44: Exit; #46: Exit; #8: Exit; #9: Exit;
    #13: Exit;
  end;
    Key:=#0;
end;

procedure TFCalculadora.FitaEnter(Sender: TObject);
begin
  EdVisor.SetFocus;
end;

procedure TFCalculadora.LimparFita1Click(Sender: TObject);
begin
  LimpaFita;
end;

end.
