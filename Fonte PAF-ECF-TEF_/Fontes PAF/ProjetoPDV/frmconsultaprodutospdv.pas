unit frmconsultaprodutospdv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, RXCtrls, Mask, ComCtrls,
  ExtCtrls, DBCtrls, RxToolEdit, RxCurrEdit;

type
  TFPesquisaProdutos = class(TForm)
    dsPesqProdutos: TDataSource;
    SB: TStatusBar;
    Panel1: TPanel;
    CPesquisa: TComboBox;
    EPesquisa: TMaskEdit;
    BtConsulta: TSpeedButton;
    Label6: TLabel;
    Panel2: TPanel;
    Label4: TLabel;
    DBText4: TDBText;
    Label3: TLabel;
    DBText3: TDBText;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    DBText2: TDBText;
    Label8: TLabel;
    DBText7: TDBText;
    Label9: TLabel;
    DBText8: TDBText;
    Label5: TLabel;
    DBText5: TDBText;
    Label7: TLabel;
    DBText6: TDBText;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid: TDBGrid;
    DBGrid1: TDBGrid;
    dsPesqGrade: TDataSource;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure EPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EPesquisaEnter(Sender: TObject);
    procedure EPesquisaExit(Sender: TObject);
    procedure EPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure CPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure EPrecoEnter(Sender: TObject);
    procedure BtConsultaClick(Sender: TObject);
    procedure EPesquisaChange(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGridEnter(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vConsultando : Boolean;
    procedure SelecionaColuna(Sender: TObject);
  end;

var
  FPesquisaProdutos: TFPesquisaProdutos;

implementation

uses dmsyndAC, UPAF_ECF, checkout, UBarsa, lite_frmprincipal,
     USelecionaPreco;

{$R *.dfm}

procedure TFPesquisaProdutos.SelecionaColuna(Sender: TObject);
var
   I, vColunaSelecionada : Integer;
begin
    if vConsultando
    then begin
           if sPrecoTabela='V'
           then vColunaSelecionada:=4
           else vColunaSelecionada:=5;

           For i := 0 to DBGrid.Columns.count-1
           do begin
              DBGrid.Columns[i].Color := clWhite;
              DBGrid.Columns[i].Font.Color := clBlack;
              DBGrid.Columns[i].Font.Style := [];
              end;
              DBGrid.Columns[vColunaSelecionada].Color := clYellow;
              DBGrid.Columns[vColunaSelecionada].Font.Color := clBlack;
              DBGrid.Columns[vColunaSelecionada].Font.Style := [];
         FPesquisaProdutos.Refresh;
         end;
end;         

procedure TFPesquisaProdutos.FormShow(Sender: TObject);
begin
     PageControl.TabIndex:=0;

     if FrmPrincipal.Reg_Estoque='-1'
     then begin
          DM.TPesqProduto.FetchOnDemand:=True;
          DM.TPesqProduto.PacketRecords:=-1;
          end
     else begin
          DM.TPesqProduto.FetchOnDemand:=False;
          DM.TPesqProduto.PacketRecords:=StrToInt(FrmPrincipal.Reg_Estoque);
          end;

     CPesquisa.ItemIndex:=0;
     if not vConsultando
     then begin
          EPesquisa.Text:='';
          if FrmPrincipal.Padrao_Busca='1'
          then begin
               CPesquisa.ItemIndex:=2;
               EPesquisa.Clear;
               EPesquisa.SetFocus;
               end
          else CPesquisa.SetFocus;
          end
     else begin
          EPesquisa.SetFocus;
          EPesquisa.Selstart:= Length(EPesquisa.text);
          end;

    SelecionaColuna(Nil);

end;

procedure TFPesquisaProdutos.EPesquisaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if key=40  // seta para baixo
     then begin
          PageControl.TabIndex:=0;
          DBGrid.SetFocus;
          end;
end;

procedure TFPesquisaProdutos.DBGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if (key >= 49) and (key <= 105)
      then begin
           EPesquisa.Text:='';
           EPesquisa.text := EPesquisa.Text+Chr(key);
           EPesquisa.SetFocus;
           EPesquisa.Selstart:= Length(EPesquisa.Text);
           end;
end;

procedure TFPesquisaProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Shift = [ssAlt])//Busca Pré Vendas
     then begin
           if Key=80//P
           then begin
                 if vConsultando
                 then begin
                     Try
                        if FClassificaPreco=Nil
                        then Application.CreateForm(TFClassificaPreco,FClassificaPreco);
                        FClassificaPreco.ShowModal;
                     Finally
                        FClassificaPreco.Release;
                        FClassificaPreco:=nil;
                        end;
                     end;   
                end;
           end;

     if key = VK_ESCAPE
     then FPesquisaProdutos.Close;

     if Key=VK_F6
     then begin
          EPesquisa.Clear;
          CPesquisa.ItemIndex:=0;
          EPesquisa.SetFocus;
          end
     else if Key=VK_F7
     then begin
          EPesquisa.Clear;
          CPesquisa.ItemIndex:=1;
          EPesquisa.SetFocus;
          end
     else if Key=VK_F8
     then begin
          EPesquisa.Clear;
          CPesquisa.ItemIndex:=2;
          EPesquisa.SetFocus;
          end
     else if Key=VK_F9
     then begin
          EPesquisa.Clear;
          CPesquisa.ItemIndex:=3;
          EPesquisa.SetFocus;
          end;
     if not DM.TPesqProduto.IsEmpty
     then begin
          if Key=VK_F12
          then begin
               PageControl.TabIndex:=1;
               DBGrid1.SetFocus;
               end
          else if Key=VK_F11
          then begin
               PageControl.TabIndex:=0;
               DBGrid.SetFocus;
               end;
          end;
end;

procedure TFPesquisaProdutos.EPesquisaEnter(Sender: TObject);
begin
     if (Sender is TMaskEdit) then
     TMaskEdit(Sender).Color:=$0080FFFF;
end;

procedure TFPesquisaProdutos.EPesquisaExit(Sender: TObject);
begin
     if (Sender is TMaskEdit) then
     TMaskEdit(Sender).Color:=clWindow;
end;

procedure TFPesquisaProdutos.EPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then begin
          if FrmPrincipal.Auto_Pesq_Produtos='S'
          then begin
               PageControl.TabIndex:=0;
               DBGrid.SetFocus;
               end
          else BtConsultaClick(Sender);
          end;
end;

procedure TFPesquisaProdutos.FormKeyPress(Sender: TObject; var Key: Char);
begin
     TabEnter(FPesquisaProdutos,Key);
end;

procedure TFPesquisaProdutos.DBGridKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then ModalResult:=MrOk;
end;

procedure TFPesquisaProdutos.CPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then Key:=#0;
end;

procedure TFPesquisaProdutos.EPrecoEnter(Sender: TObject);
begin
     if (Sender is TCurrencyEdit) then
     TCurrencyEdit(Sender).Color:=$0080FFFF;
end;

procedure TFPesquisaProdutos.BtConsultaClick(Sender: TObject);
var
   vCampoPesquisa : String;
begin
     if EPesquisa.text<>''
     then begin
           AC;
           PageControl.TabIndex:=0;
           DM.TPesqGradeProd.Close;
           
           if CPesquisa.ItemIndex=0
           then vCampoPesquisa:='DESCRICAO'
           else if CPesquisa.ItemIndex=1
           then vCampoPesquisa:='REFERENCIA'
           else if CPesquisa.ItemIndex=2
           then vCampoPesquisa:='CODBARRA'
           else if CPesquisa.ItemIndex=3
           then vCampoPesquisa:='CODIGO';

           With DM.QPesqProduto
           do begin
              Close;
              Sql.Clear;
              Sql.Add('SELECT P.CODIGO,P.REFERENCIA,P.DESCRICAO,P.MED,P.QTDE,'+
                      'P.INATIVO,P.PRECOVENDA,P.PRECOPRAZO,P.CODALIQUOTA,P.DATAULTVENDA,'+
                      'P.IAT,P.IPPT,P.CODBARRA,P.QTDEEF,'+
                      'G.NOME,S.NOME,M.NOME,T.CODIGOCUPOM,T.NOME,T.ALIQUOTA FROM ESTOQUE P');

              Sql.Add('LEFT JOIN GRUPO G ON G.CODIGO = P.CODGRUPO');
              Sql.Add('LEFT JOIN SECAO S ON S.CODIGO = P.CODSECAO');
              Sql.Add('LEFT JOIN MARCA M ON M.CODIGO = P.CODMARCA');
              Sql.Add('LEFT JOIN ECFALIQUOTA T ON T.CODIGO = P.CODALIQUOTA');

              if CPesquisa.ItemIndex<>3
              then begin
                   if (CPesquisa.ItemIndex=0)or(CPesquisa.ItemIndex=1)
                   then begin
                        Sql.Add('WHERE P.'+vCampoPesquisa+' LIKE:PPESQUISA');
                        if FrmPrincipal.Busca_Contenha_Prod='S'
                        then ParamByName('PPESQUISA').AsString:='%'+EPesquisa.Text+'%'
                        else ParamByName('PPESQUISA').AsString:=EPesquisa.Text+'%';
                        end
                   else begin
                        Sql.Add('WHERE P.'+vCampoPesquisa+' =:PPESQUISA');
                        ParamByName('PPESQUISA').AsString:=EPesquisa.Text;
                        end;
                   end
              else begin
                   if EPesquisa.text<>''
                   then begin
                        Sql.Add('WHERE P.'+vCampoPesquisa+'=:PPESQUISA');
                        ParamByName('PPESQUISA').AsInteger:=StrToInt(EPesquisa.Text);
                        end;
                   end;

              Sql.Add('AND P.INATIVO=:PINATIVO');
              ParamByName('PINATIVO').AsString:='N';
              
              DM.TPesqProduto.Close;
              DM.TPesqProduto.IndexFieldNames:='DESCRICAO';
              DM.TPesqProduto.Open;

              if FrmPrincipal.Auto_Pesq_Produtos='N'
              then begin
                   if DM.TPesqProduto.RecordCount = 0
                   then EPesquisa.SetFocus;
                   end;

              SB.Panels[0].Text:='Itens: '+StrZero(DM.TPesqProduto.RecordCount,6);
              end;
           DC;
      end;
end;

procedure TFPesquisaProdutos.EPesquisaChange(Sender: TObject);
begin
     if FrmPrincipal.Auto_Pesq_Produtos='S'
     then BtConsultaClick(Sender);
end;

procedure TFPesquisaProdutos.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     if not odd(DM.TPesqProduto.RecNo)
     then begin
          if not (gdselected in state)
          then begin
               DBGrid.Canvas.Brush.Color := $00F0F0F0;
               DBGrid.Canvas.FillRect(Rect);
               DBGrid.DefaultDrawDataCell(rect, Column.Field, State);
               end;
          end;
end;

procedure TFPesquisaProdutos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     if not odd(DM.TPesqGradeProd.RecNo)
     then begin
          if not (gdselected in state)
          then begin
               DBGrid1.Canvas.Brush.Color := $00F0F0F0;
               DBGrid1.Canvas.FillRect(Rect);
               DBGrid1.DefaultDrawDataCell(rect, Column.Field, State);
               end;
          end;
end;

procedure TFPesquisaProdutos.DBGrid1Enter(Sender: TObject);
begin
     DM.TPesqGradeProd.Close;
     DM.TPesqGradeProd.Params[0].AsInteger:=DM.TPesqProdutoCODIGO.AsInteger;
     DM.TPesqGradeProd.Open;
     if DM.TPesqGradeProd.RecordCount = 0
     then begin
          Informa('Este Produto não possui Grade!');
          DM.TPesqGradeProd.Close;
          Timer1.Enabled:=True;
          end;
end;

procedure TFPesquisaProdutos.DBGridEnter(Sender: TObject);
begin
DM.TPesqGradeProd.Close;
end;

procedure TFPesquisaProdutos.Timer1Timer(Sender: TObject);
begin
     PageControl.TabIndex:=0;
     DBGrid.SetFocus;
     Timer1.Enabled:=False;
end;

end.

