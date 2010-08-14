unit UConsulta_Grade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, DBGrids, DB, ImgList, DBCtrls,
  ExtCtrls;

type
  TFConsultaGrade = class(TForm)
    LDescricao: TLabel;
    DBGrid: TDBGrid;
    dsConsulta_Grade: TDataSource;
    ImageList1: TImageList;
    SB: TStatusBar;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    DBText2: TDBText;
    Bevel1: TBevel;
    CAutoPesquisa: TCheckBox;
    Bevel2: TBevel;
    Label3: TLabel;
    DBText5: TDBText;
    DBText6: TDBText;
    RBMarcaTodos: TRadioButton;
    RBDesmarcaTodos: TRadioButton;
    Label4: TLabel;
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridTitleClick(Column: TColumn);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RBMarcaTodosClick(Sender: TObject);
    procedure RBDesmarcaTodosClick(Sender: TObject);
  private
    { Private declarations }
    nTipo_Pesquisa : Integer;
    procedure Marca_Produto_Individual;
    procedure Marca_Desmarca_Produto_Todos;
    procedure Busca_Por_CodBarras;
    procedure Busca_Por_Referencia;
    procedure Busca_Por_CodInterno;
  public
    { Public declarations }
    nSoma_Qtde : Currency;
    vNome_Produto : String;
  end;

var
  FConsultaGrade: TFConsultaGrade;

implementation

uses UBarsa, dmsyndAC, lite_frmprincipal, checkout;

{$R *.dfm}

procedure TFConsultaGrade.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     if Column.Field=DM.TPesqGradeProdSel
     then begin
          DBGrid.Canvas.FillRect(Rect);
          ImageList1.Draw(DBGrid.Canvas,Rect.Left+10,Rect.Top+1,0);
          if DM.TPesqGradeProdSel.AsString='X'
          then ImageList1.Draw(DBGrid.Canvas,Rect.Left+10,Rect.Top+1,2)
          else ImageList1.Draw(DBGrid.Canvas,Rect.Left+10,Rect.Top+1,1);
          end;
end;

procedure TFConsultaGrade.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=32
     then begin
          nTipo_Pesquisa:=3;
          Marca_Produto_Individual;
          end;
end;

procedure TFConsultaGrade.Marca_Produto_Individual;
var
   nQuantidade : Currency;
begin
      DM.TPesqGradeProd.Edit;
      if nTipo_Pesquisa <> 0//Diferente da pesquisa de código de barras
      then begin
            if DM.TPesqGradeProdSEL.Value=''
            then begin
                  Try
                   nQuantidade:=StrToFloat(InputBox('Informe a Quantidade','Quantidade',FormatFloat('#####0.000',DM.TPesqGradeProdQTDE_SELECIONADA.Value)));
                   if nQuantidade > 0
                   then begin
                        if FrmPrincipal.Vende_Estoque_Neg='N'
                        then begin
                             if DM.TPesqGradeProdSALDO.AsCurrency < nQuantidade
                             then raise Exception.Create('Quantidade não disponivél!');
                             end;
                        DM.TPesqGradeProdSEL.Value:='X';
                        DM.TPesqGradeProdQTDE_SELECIONADA.Value:=
                             DM.TPesqGradeProdQTDE_SELECIONADA.Value+nQuantidade;
                        end;
                 Except
                   raise Exception.Create('Quantidade Inválida!');
                   end;
                 end
            else begin//if DM.TPesqGradeProdSEL.Value=''
                 DM.TPesqGradeProdSEL.Value:='';
                 DM.TPesqGradeProdQTDE_SELECIONADA.Clear;
                 end;
            end
      else if nTipo_Pesquisa = 0//Pesquisa com código de barras
      then begin
           if FrmPrincipal.Vende_Estoque_Neg='N'
           then begin
                if (DM.TPesqGradeProdSALDO.AsCurrency < (DM.TPesqGradeProdQTDE_SELECIONADA.Value + 1))
                then raise Exception.Create('Quantidade não disponivél!');
                end;
            DM.TPesqGradeProdSEL.Value:='X';
            DM.TPesqGradeProdQTDE_SELECIONADA.Value:=
                 DM.TPesqGradeProdQTDE_SELECIONADA.Value+1;
            end;
      DM.TPesqGradeProd.Post;

      if CAutoPesquisa.Checked
      then begin
           if nTipo_Pesquisa=0
           then Busca_Por_CodBarras
           else if nTipo_Pesquisa=1
           then Busca_Por_Referencia
           else if nTipo_Pesquisa=2
           then Busca_Por_CodInterno;
           end;
end;

procedure TFConsultaGrade.Marca_Desmarca_Produto_Todos;
var
   nQuantidade : Currency;
begin
      if RBMarcaTodos.Checked
      then begin
            Try
              nQuantidade:=StrToFloat(InputBox('Informe a Quantidade','Quantidade',FormatFloat('#####0.000',DM.TPesqGradeProdQTDE_SELECIONADA.Value)));
            Except
              raise Exception.Create('Quantidade Inválida!');
              end;
            end;

      DM.TPesqGradeProd.DisableControls;
      DM.TPesqGradeProd.First;
      While not DM.TPesqGradeProd.Eof
      do begin
          DM.TPesqGradeProd.Edit;
          if RBMarcaTodos.Checked
          then begin
                if nQuantidade > 0
                then begin
                     if FrmPrincipal.Vende_Estoque_Neg='N'
                     then begin
                          if DM.TPesqGradeProdSALDO.AsCurrency < nQuantidade
                          then begin
                               DM.TPesqGradeProd.EnableControls;
                               raise Exception.Create('Quantidade não disponivél!');
                               end;
                          end;
                     DM.TPesqGradeProdSEL.Value:='X';
                     DM.TPesqGradeProdQTDE_SELECIONADA.Value:=DM.TPesqGradeProdQTDE_SELECIONADA.Value+nQuantidade;
                     end;
               end
          else if RBDesmarcaTodos.Checked
          then begin
               DM.TPesqGradeProdSEL.Value:='';
               DM.TPesqGradeProdQTDE_SELECIONADA.Clear;
               end;
          DM.TPesqGradeProd.Post;
          DM.TPesqGradeProd.Next
          end;
     DM.TPesqGradeProd.EnableControls;
end;

procedure TFConsultaGrade.DBGridTitleClick(Column: TColumn);
begin
     DM.TPesqGradeProd.IndexFieldNames:=Column.FieldName;
end;

procedure TFConsultaGrade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   vOk_Saida : Boolean;
   Cont, Iten : Integer;
begin
     if Key=VK_F4
     then begin
          if not CAutoPesquisa.Checked
          then CAutoPesquisa.Checked:=True
          else CAutoPesquisa.Checked:=False;
          end;

     if Key=VK_F5
     then begin
          nTipo_Pesquisa:=0;
          Busca_Por_CodBarras;
          end;

     if Key=VK_F6
     then begin
          nTipo_Pesquisa:=1;
          Busca_Por_Referencia;
          end;

     if Key=VK_F7
     then begin
          nTipo_Pesquisa:=2;
          Busca_Por_CodInterno;
          end;

     if Key=VK_F10
     then begin
          if Confirma('Confirma o lançamento do(s) iten(s) selecionado(s)?')=mrYes
          then begin
               if DM.TPesqGradeProd.Locate('SEL','X',[])
               then begin
                    Cont:=0;
                    nSoma_Qtde:=0;
                    DM.TPesqGradeProd.DisableControls;
                    While not DM.TPesqGradeProd.Eof
                    do begin
                       if DM.TPesqGradeProdSEL.Value='X'
                       then begin
                            if DM.TPDVGrade.Active=False
                            then begin
                                 DM.TPDVGrade.CreateDataSet;
                                 DM.TPDVGrade.Open;
                                 end;
                            //if not DM.TPDVGrade.Locate('COD_GRADE;COD_PRODUTO',VarArrayOf([DM.TPesqGradeProdCODIGO.Value,DM.TPesqGradeProdCOD_PRODUTO.Value]),[])
                            //then begin
                                 if DM.TPDV.Active
                                 then begin
                                      DM.TPDV.Last;
                                      Iten:=DM.TPDVITEN.Value + 1;
                                      end
                                 else Iten:=1;
                                 DM.TPDVGrade.Append;
                                 DM.TPDVGradeITEN.Value:=Iten;
                                 //end
                            //else DM.TPDVGrade.Edit;
                            DM.TPDVGradeCOD_PRODUTO.Value:=DM.TPesqGradeProdCOD_PRODUTO.Value;
                            DM.TPDVGradeCOD_GRADE.Value:=DM.TPesqGradeProdCODIGO.Value;
                            DM.TPDVGradeQTDE.Value:=DM.TPDVGradeQTDE.Value+DM.TPesqGradeProdQTDE_SELECIONADA.Value;
                            DM.TPDVGradeCOD_COR.Value:=DM.TPesqGradeProdCOD_COR.Value;
                            DM.TPDVGradeCOD_TAMANHO.Value:=DM.TPesqGradeProdCOD_TAMANHO.Value;
                            DM.TPDVGrade.Post;
                            end;
                       nSoma_Qtde:=nSoma_Qtde+DM.TPesqGradeProdQTDE_SELECIONADA.Value;
                       DM.TPesqGradeProd.Next;
                       Application.ProcessMessages;
                       end;
                    frmcheckout.ed_quantidade.Value := nSoma_Qtde;

                    DM.TPesqGradeProd.EnableControls;
                    ModalResult:=mrOk;
                    end
               else begin
                    Informa('Selecione o(s) iten(s) da Grade para fazer o lançamento!');
                    DBGrid.SetFocus;
                    end;
               end;
          end;

     if Key=VK_Escape
     then begin
          if Confirma('Tem certeza que deseja fechar a grade de consulta?')=mryes
          then begin
               vOk_Saida:=True;
               if DM.TPesqGradeProd.Locate('SEL','X',[])
               then begin
                    if Confirma('Existem itens selecionados na grade, tem certeza '+
                                'que deseja fechar a grade mesmo assim???')=mrYes
                    then vOk_Saida:=True
                    else vOk_Saida:=False;
                    end;

               if vOk_Saida
               then begin
                    //DM.TOrcTemp.Delete;
                    //AtualizaTotais;
                    ModalResult:=mrCancel;
                    end;
               end;
          end;
end;

procedure TFConsultaGrade.Busca_Por_CodBarras;
var
   sCod_Barra : String;
begin
    DM.TPesqGradeProd.IndexFieldNames:='COD_BARRA';
    sCod_Barra:='';
    sCod_Barra:=InputBox('Pesquisa por Código de Barras','Informe o Código','');
    if sCod_Barra<>''
    then begin
         if not DM.TPesqGradeProd.FindKey([sCod_Barra])
         then raise Exception.Create('Código de barras não cadastrado!')
         else Marca_Produto_Individual;
         end;
end;

procedure TFConsultaGrade.Busca_Por_Referencia;
var
   sReferencia : String;
begin
    DM.TPesqGradeProd.IndexFieldNames:='REFERENCIA';
    sReferencia:='';
    sReferencia:=UpperCase(InputBox('Pesquisa por Referência','Informe a Referência',''));
    if sReferencia<>''
    then begin
         if not DM.TPesqGradeProd.FindKey([sReferencia])
         then raise Exception.Create('Referência não cadastrada!')
         else begin
              if DM.TPesqGradeProdSEL.Value=''
              then Marca_Produto_Individual;
              end;
         end;
end;
procedure TFConsultaGrade.Busca_Por_CodInterno;
var
   sCodigo : String;
begin
    DM.TPesqGradeProd.IndexFieldNames:='CODIGO';
    sCodigo:='';
    sCodigo:=UpperCase(InputBox('Pesquisa pelo Código Interno ','Informe o Código',''));
    if sCodigo<>''
    then begin
         if not DM.TPesqGradeProd.FindKey([sCodigo])
         then raise Exception.Create('Código não cadastrado!')
         else begin
              if DM.TPesqGradeProdSEL.Value=''
              then Marca_Produto_Individual;
              end;
         end;
end;

procedure TFConsultaGrade.RBMarcaTodosClick(Sender: TObject);
begin
     if RBMarcaTodos.Checked
     then Marca_Desmarca_Produto_Todos;
end;

procedure TFConsultaGrade.RBDesmarcaTodosClick(Sender: TObject);
begin
     if RBDesmarcaTodos.Checked
     then Marca_Desmarca_Produto_Todos;
end;

end.
