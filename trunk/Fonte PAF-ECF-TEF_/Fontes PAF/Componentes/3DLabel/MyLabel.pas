unit Mylabel;

//  I liked this 3dLabel so much, I decided to add an OnMouseOut event to it.
//  I don't know who originally wrote it, but OnMouseOut was added by 
//  Durrin Hynes-Christensen: dxh@gv.dk

interface

uses
  SysUtils, windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls,Menus;

type
  T3DEffect = (Normal3d, Resit3d, Raised3d, Shadowed3d);

  TmyLabel3d = class(TLabel)
  private
    { Private declarations }
    procedure setStyleEffect(Value : T3DEffect);
    procedure SetShadowColor(Value:TColor);
    procedure SetWhiteColor(Value:TColor);
    procedure DoDrawText(var Rect: TRect; Flags: Word);
    procedure SetFhOffSet(value: integer);
    procedure SetFvOffSet(value: integer);
    procedure SetShadeLT(value: boolean);
    procedure WMMouseMove(var msg: TWMMouseMove); message WM_MOUSEMOVE;
    procedure DoMouseOut(msg:TWMMouseMove);
  protected
    { Protected declarations }
    MouseOut:TNotifyEvent;
    F3DEffect : T3DEffect;
    FShadowColor : TColor;
    FWhiteColor : TColor;
    FLast : TColor;
    FhOffSet,FvOffSet : integer;
    FShadeLTSet : boolean;
    procedure Paint; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property Align;
    property Caption;
    property AStyle3D: T3DEffect read F3DEffect write setStyleEffect default Normal3d;
    property AShadeRightBottom: TColor read FShadowColor write SetShadowColor default clGray;
    property AShadeLeftTop: TColor read FWhiteColor write SetWhiteColor default clWhite;
    property AHShadeOffSet: integer read FhOffSet write SetFhOffSet default 5;
    property AVShadeOffSet: integer read FvOffSet write SetFvOffSet default -5;
    property AShadeLTSet: boolean read FShadeLTSet write setShadeLT default true;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Visible;
    property Transparent;
    property Width;
    property Top;
    property Left;
    property Height;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp; 
    property OnMouseOut:TNotifyEvent read MouseOut write MouseOut;
  end;
procedure Register;

implementation

constructor TmyLabel3d.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Transparent := True;
  ParentColor := False;
  FShadowColor := clGray;
  FWhiteColor := clWhite;
  FhOffSet := 5;
  FvOffSet := -5;
  FLast := clWhite;
end;

destructor TmyLabel3d.Destroy;
{------------------------------------------------------------------------------}
begin
  inherited Destroy;
  
end;
 procedure TmyLabel3d.DoDrawText( var Rect : TRect; Flags : Word );
  var
    {Text       : array[ 0..255 ] of Char; }
    Text : PChar;
    Size: Byte;
    TmpRect    : TRect;
    UpperColor : TColor;
    LowerColor : TColor;
  begin
  Size := GetTextLen;       {Get length of string in Edit1}
  Inc(Size);                      {Add room for null character}
  GetMem(Text, Size);
  GetTextBuf(Text, Size);           {Creates Buffer dynamic variable}
  {GetTextBuf(Text, SizeOf(Text)); }
    if ( Flags and DT_CALCRECT <> 0) and
       ( ( Text[0] = #0 ) or ShowAccelChar and
         ( Text[0] = '&' ) and
         ( Text[1] = #0 ) ) then
      StrCopy(Text, ' ');

    if not ShowAccelChar then
      Flags := Flags or DT_NOPREFIX;
    Canvas.Font := Font;

    if F3DEffect = Resit3d then
    begin
      UpperColor := FShadowColor;
      LowerColor := FWhiteColor;
    end
    else
    begin
      UpperColor := FWhiteColor;
      LowerColor := FShadowColor;
    end;

    if F3DEffect in [ Resit3d, Raised3d ] then
    begin
      TmpRect := Rect;
      OffsetRect( TmpRect, 1, 1 );
      Canvas.Font.Color := LowerColor;
      DrawText(Canvas.Handle, Text, StrLen(Text), TmpRect, Flags);

      TmpRect := Rect;
      OffsetRect( TmpRect, -1, -1 );
      Canvas.Font.Color := UpperColor;
      DrawText(Canvas.Handle, Text, StrLen(Text), TmpRect, Flags);
    end
    else if F3DEffect = Shadowed3d then
    begin
      TmpRect := Rect;
      OffsetRect( TmpRect, FhOffSet, FvOffSet );
      Canvas.Font.Color := LowerColor;
      DrawText(Canvas.Handle, Text, StrLen(Text), TmpRect, Flags);
    end;

    Canvas.Font.Color := Font.Color;
    if not Enabled then
      Canvas.Font.Color := clGrayText;
    DrawText(Canvas.Handle, Text, StrLen(Text), Rect, Flags);
    FreeMem(Text, Size); 
  end;


  procedure TmyLabel3d.Paint;
  const
    Alignments: array[TAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
  var
    Rect: TRect;
  begin
    with Canvas do
    begin
      if not Transparent then
      begin
        Brush.Color := Self.Color;
        Brush.Style := bsSolid;
        FillRect(ClientRect);
      end;
      Brush.Style := bsClear;
      Rect := ClientRect;
      DoDrawText( Rect, ( DT_EXPANDTABS or DT_WORDBREAK ) or
                  Alignments[ Alignment ] );
    end;
  end;

procedure TmyLabel3d.SetShadowColor(value: TColor);
begin
  if not (FShadowColor = value) then
  begin
     FShadowColor := value;
     invalidate;
   end;
 end;

procedure TmyLabel3d.SetFhOffSet(value: integer);
begin
  if value<>FhOffSet then
  begin
    FhOffSet := value;
    invalidate;
  end;
end;

procedure TmyLabel3d.SetFvOffSet(value: integer);
begin
  if value<>FvOffSet then
  begin
    FvOffSet := value;
    invalidate;
  end;
end;

procedure TmyLabel3d.SetWhiteColor(value: TColor);
begin
  if not (FWhiteColor = value) and (FShadeLTSet=false) then
  begin
     FWhiteColor := value;
     invalidate;
   end;
 end;

 procedure TmyLabel3d.setStyleEffect(value: T3DEffect);
 begin
   if F3DEffect <> value then
   begin
     F3DEffect := value;
     invalidate;
   end;
 end;

procedure TmyLabel3d.SetShadeLT(value: boolean);
begin
  if  FShadeLTSet <> value then
  begin
    FShadeLTSet := value;
    if FShadeLTSet = true then
    begin
      FLast := FWhiteColor;
      FWhiteColor := clWhite;
    end
    else
      FWhiteColor := Flast;
   end;
  invalidate;
end;
procedure TmyLabel3d.WMMouseMove(var msg: TWMMouseMove);
begin
  if not MouseCapture then
    SetCaptureControl(Self);
  if MouseCapture and ((msg.XPos < 0) or (msg.YPos < 0) or (msg.XPos > Width) or
     (msg.YPos > Height)) then {MouseOut}
  begin
    SetCaptureControl(nil);
    DoMouseOut(msg);
  end;
end;

procedure TmyLabel3d.DoMouseOut(msg:TWMMouseMove);
begin
  if assigned(MouseOut) then MouseOut(self);
end;


procedure Register;
begin
  RegisterComponents('Additional', [TmyLabel3d]);
end;

end.
