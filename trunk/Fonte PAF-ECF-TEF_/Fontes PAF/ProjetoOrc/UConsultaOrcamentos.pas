unit UConsultaOrcamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Mask,  Buttons, Grids,
  DBGrids, DB, DBCtrls, ImgList, rxToolEdit;

type
  TFConsultaOrcamentos = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    RGTipo: TRadioGroup;
    GPeriodo: TGroupBox;
    EDataI: TDateEdit;
    EDataF: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    CCliente: TCheckBox;
    ECodCliente: TEdit;
    ENomeCliente: TEdit;
    CNumOrc: TCheckBox;
    ENumOrcamento: TEdit;
    BtConsultar: TBitBtn;
    Panel2: TPanel;
    BtAlterar: TBitBtn;
    BtImprimir: TBitBtn;
    BtSair: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    dsOrcamento: TDataSource;
    dsItemOrcamento: TDataSource;
    CVendedor: TCheckBox;
    ECodVendedor: TEdit;
    ENomeVendedor: TEdit;
    Panel3: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BTPesqCliente: TSpeedButton;
    BtPesqVendedor: TSpeedButton;
    CClienteSemCad: TCheckBox;
    ECliente: TEdit;
    ImageList1: TImageList;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure EDataIEnter(Sender: TObject);
    procedure EDataIExit(Sender: TObject);
    procedure CNumOrcClick(Sender: TObject);
    procedure CClienteClick(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure CVendedorClick(Sender: TObject);
    procedure BtConsultarClick(Sender: TObject);
    procedure dsOrcamentoDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtImprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtAlterarClick(Sender: TObject);
    procedure BTPesqClienteClick(Sender: TObject);
    procedure ECodClienteKeyPress(Sender: TObject; var Key: Char);
    procedure CClienteSemCadClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtPesqVendedorClick(Sender: TObject);
    procedure ECodVendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ECodVendedorKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsItemOrcamentoDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultaOrcamentos: TFConsultaOrcamentos;
  procedure ChamaGrade;

implementation

uses UBarsa, UDM, SqlExpr, UOrcamento, UConsultaClientes,
     UConsultaVendedores, Math, UConsGradeItem;

{$R *.dfm}

procedure ChamaGrade;
begin
     if DM.TConsultaItenOrcGRADE.Value='S'
     then begin
           Try
              if FConsultaGradeItem=Nil
              then Application.CreateForm(TFConsultaGradeItem,FConsultaGradeItem);
              FConsultaGradeItem.ShowModal;
           Finally
              FConsultaGradeItem.Release;
              FConsultaGradeItem:=nil;
              end;
           end
     else Informa('Este Item não possui grade!');
end;

procedure TFConsultaOrcamentos.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
     TabEnter(FConsultaOrcamentos,Key);
end;

procedure TFConsultaOrcamentos.FormShow(Sender: TObject);
begin
     LimpaEdit(FConsultaOrcamentos);
     EDataI.Date:=Now;
     EDataF.Date:=Now;
     RGTipo.ItemIndex:=0;
end;

procedure TFConsultaOrcamentos.EDataIEnter(Sender: TObject);
begin
     EntraFocu(Sender);
end;

procedure TFConsultaOrcamentos.EDataIExit(Sender: TObject);
begin
     FechaFocu(Sender);
end;

procedure TFConsultaOrcamentos.CNumOrcClick(Sender: TObject);
begin
     ENumOrcamento.Enabled:=CNumOrc.Checked;
     if ENumOrcamento.Enabled
     then ENumOrcamento.SetFocus;
end;

procedure TFConsultaOrcamentos.CClienteClick(Sender: TObject);
begin
     ECodCliente.Enabled:=CCliente.Checked;
     BTPesqCliente.Enabled:=CCliente.Checked;
     if ECodCliente.Enabled
     then ECodCliente.SetFocus;
end;

procedure TFConsultaOrcamentos.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TFConsultaOrcamentos.CVendedorClick(Sender: TObject);
begin
     ECodVendedor.Enabled:=CVendedor.Checked;
     BtPesqVendedor.Enabled:=CVendedor.Checked;
     if ECodVendedor.Enabled
     then ECodVendedor.SetFocus;
end;

procedure TFConsultaOrcamentos.BtConsultarClick(Sender: TObject);
begin
     AC;
     With DM.QConsultaOrc
     do begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT O.CODIGO,O.HORA,O.DTEMISSAO,O.CODCLIENTE,O.NOMECLIENTE,O.CODVENDEDOR,'+
                'O.DESCONTO,O.VALOR,O.TOTALCUSTO,O.OBS,O.VALIDADE,O.NUMERO_DAV,'+
                'O.SITUACAO,O.ALTERADO,O.DT_HORA_ALTEROU,O.NUM_NOVO_DAV,O.REF_NUM_DAV,'+
                'O.NUMERO_CUPOM,O.NUMERO_SERIE_ECF,O.NUMERO_CAIXA,V.NOME FROM ORCAMENTO O');
        Sql.Add('LEFT JOIN VENDEDOR V ON V.CODIGO = O.CODVENDEDOR');

        if not CNumOrc.Checked
        then begin
             Sql.Add('WHERE O.DTEMISSAO BETWEEN :PDATAI AND :PDATAF');
             ParamByName('PDATAI').AsDate:=EDataI.Date;
             ParamByName('PDATAF').AsDate:=EDataF.Date;

             if RGTipo.ItemIndex=0
             then Sql.Add('AND O.SITUACAO = ''A''')
             else if RGTipo.ItemIndex=1
             then Sql.Add('AND O.SITUACAO = ''F''');

             if CCliente.Checked
             then begin
                  SQL.Add('AND O.CODCLIENTE = :PCODCLIENTE');
                  ParamByName('PCODCLIENTE').AsInteger:=StrToInt(ECodCliente.Text);
                  end;

             if CClienteSemCad.Checked
             then begin
                  SQL.Add('AND O.NOMECLIENTE LIKE :PNOMECLIENTE');
                  ParamByName('PNOMECLIENTE').AsString:=ECliente.Text+'%';
                  end;

             if CVendedor.Checked
             then begin
                  SQL.Add('AND O.CODVENDEDOR = :PCODVENDEDOR');
                  ParamByName('PCODVENDEDOR').AsInteger:=StrToInt(ECodVendedor.Text);
                  end;
             end
        else begin
             Sql.Add('WHERE O.NUMERO_DAV = :PNUMORC');
             ParamByName('PNUMORC').AsInteger:=StrToInt(ENumOrcamento.Text);
             end;
        end;
    DM.TConsultaOrc.Close;
    DM.TConsultaOrc.IndexFieldNames:='DTEMISSAO;CODIGO';
    DM.TConsultaOrc.Open;
    DM.TConsultaOrc.Last;
    DC;
    DBGrid1.SelectedIndex:=5;
    DBGrid1.SetFocus;
end;

procedure TFConsultaOrcamentos.dsOrcamentoDataChange(Sender: TObject;
  Field: TField);
begin
     DM.TConsultaItenOrc.Close;
     DM.TConsultaItenOrc.Params[0].AsInteger:=DM.TConsultaOrcCODIGO.AsInteger;
     DM.TConsultaItenOrc.Open;

     if not DM.TConsultaOrc.IsEmpty
     then begin
          BtAlterar.Enabled:=True;
          BtImprimir.Enabled:=True;
          end
     else begin
          BtAlterar.Enabled:=False;
          BtImprimir.Enabled:=False;
          end;
end;

procedure TFConsultaOrcamentos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if DM.TConsultaOrcALTERADO.Value='S'
    then begin
         DBGrid1.Canvas.Font.Color := clRed;
         if (gdSelected in State)// se a célula não está selecionada
         then DBGrid1.Canvas.Font.Color := clWhite;
         end;

    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column,State);

    if not odd(DM.TConsultaOrc.RecNo)
    then begin
         if not (gdselected in state)
         then begin
              DBGrid1.Canvas.Brush.Color := $00F0F0F0;
              DBGrid1.Canvas.FillRect(Rect);
              DBGrid1.DefaultDrawDataCell(rect, Column.Field, State);
              end;
         end;

    if Column.Field=DM.TConsultaOrcSEL
    then begin
          DBGrid1.Canvas.FillRect(Rect);
          ImageList1.Draw(DBGrid1.Canvas,Rect.Left+10,Rect.Top+1,0);
          if DM.TConsultaOrcSEL.AsString='X'
          then ImageList1.Draw(DBGrid1.Canvas,Rect.Left+10,Rect.Top+1,2)
          else ImageList1.Draw(DBGrid1.Canvas,Rect.Left+10,Rect.Top+1,1);
          end;
end;

procedure TFConsultaOrcamentos.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if not odd(DM.TConsultaItenOrc.RecNo)
    then begin
         if not (gdselected in state)
         then begin
              DBGrid2.Canvas.Brush.Color := $00F0F0F0;
              DBGrid2.Canvas.FillRect(Rect);
              DBGrid2.DefaultDrawDataCell(rect, Column.Field, State);
              end;
         end;
end;

procedure TFConsultaOrcamentos.BtImprimirClick(Sender: TObject);
begin
     if Confirma('Confirma a Reimpressão do Orçamento de Nº '+StrZero(DM.TConsultaOrcNUMERO_DAV.AsInteger,14)+' ?')=mrYes
     then begin
          FOrcamentos.ImprimiOrcamento(DM.TConsultaOrcCODIGO.AsInteger);
          end;
end;

procedure TFConsultaOrcamentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key=VK_F2)and(BtAlterar.Enabled)
     then BtAlterarClick(Sender);

     if (Key=VK_F5)and(BtImprimir.Enabled)
     then BtImprimirClick(Sender);

     if Key=VK_Escape
     then begin
          if Confirma('Deseja Fechar a Consulta de Orçamentos?')=mrYes
          then BtSairClick(Sender);
          end;
end;

procedure TFConsultaOrcamentos.BtAlterarClick(Sender: TObject);
begin
     if DM.TConsultaOrcALTERADO.Value='S'
     then begin
          Informa('Este Orçamento já foi Alterado!');
          Exit
          end;
     if DM.TConsultaOrcNUMERO_CUPOM.Value > 0
     then begin
          Informa('Este Orçamento já foi Emitido Cupom Fiscal. Não pode ser mais Alterado!');
          Exit
          end;

     if not DM.TConsultaOrc.Locate('SEL','X',[])
     then begin
          Informa('Tecle [ Espaço ] para selecionar o Orçamento!');
          Exit
          end;

     if Confirma('Deseja Alterar o(s) Orçamento(s) ?')=mrYes
     then begin
           AC;
           Status_Orcamento:='ALTER';
           DM.TDavAlterando.EmptyDataSet;
           DM.TOrcTemp.EmptyDataSet;
           DM.TOrcGradeTemp.EmptyDataSet;

           DM.TConsultaOrc.First;
           While not DM.TConsultaOrc.Eof
           do begin
               if DM.TConsultaOrcSEL.Value='X'
               then begin
                     DM.TDavAlterando.Append;
                     DM.TDavAlterandoNUMERO_DAV.Value:=DM.TConsultaOrcNUMERO_DAV.Value;
                     DM.TDavAlterando.Post;

                     With FOrcamentos
                     do begin
                        RxLStatusOrc.Caption:='< Alterando >';
                        iCodCliente:=DM.TConsultaOrcCODCLIENTE.AsInteger;
                        ENomeCliente.Text:=DM.TConsultaOrcNOMECLIENTE.AsString;
                        ECodVendedor.Text:=StrZero(DM.TConsultaOrcCODVENDEDOR.AsInteger,3);
                        ENOMEVENDEDOR.Text:=DM.TConsultaOrcNOME.AsString;
                        EObservacoes.Text:=DM.TConsultaOrcOBS.AsString;
                        EValidade.Date:=DM.TConsultaOrcVALIDADE.AsDateTime;

                        DM.TConsultaItenOrc.First;
                        While not DM.TConsultaItenOrc.Eof
                        do begin
                           DM.TOrcTemp.Append;
                           DM.TOrcTempCODPRODUTO.AsInteger:=DM.TConsultaItenOrcCODPRODUTO.AsInteger;
                           DM.TOrcTempDESCRICAO.AsString:=DM.TConsultaItenOrcDESCRICAO.AsString;
                           DM.TOrcTempREFERENCIA.AsString:=DM.TConsultaItenOrcREFERENCIA.AsString;
                           DM.TOrcTempQTDE.AsCurrency:=DM.TConsultaItenOrcQTDE.AsCurrency;
                           DM.TOrcTempVL_UNIT.AsCurrency:=DM.TConsultaItenOrcPRECO.AsCurrency;
                           DM.TOrcTempVL_TOTAL.AsCurrency:=DM.TConsultaItenOrcTOTALITEN.AsCurrency;
                           DM.TOrcTempTABELA.AsString:=DM.TConsultaItenOrcTABELA.AsString;
                           DM.TOrcTempCUSTOFINAL.AsCurrency:=DM.TConsultaItenOrcCUSTO.AsCurrency;
                           DM.TOrcTemp.Post;

                           if DM.TConsultaOrcGrade.RecordCount > 0
                           then begin
                                While not DM.TConsultaOrcGrade.Eof
                                do begin
                                   DM.TOrcGradeTemp.Append;
                                   DM.TOrcGradeTempCOD_GRADE.Value:=DM.TConsultaOrcGradeCOD_GRADE.Value;
                                   DM.TOrcGradeTempCOD_PRODUTO.Value:=DM.TConsultaOrcGradeCOD_PRODUTO.Value;
                                   DM.TOrcGradeTempQTDE.AsFloat:=DM.TConsultaOrcGradeQTDE.AsFloat;
                                   DM.TOrcGradeTempCOD_COR.Value:=DM.TConsultaOrcGradeCOD_COR.Value;
                                   DM.TOrcGradeTempCOD_TAMANHO.Value:=DM.TConsultaOrcGradeCOD_TAMANHO.Value;
                                   DM.TOrcGradeTemp.Post;

                                   DM.TConsultaOrcGrade.Next;
                                   end;
                                end;

                           DM.TConsultaItenOrc.Next;
                           end;
                    end;//If DM.TConsultaOrcSEL.Value=X
              end;//While DM.TConsultaOrc
              DM.TConsultaOrc.Next;

              AtualizaTotais;
              end;
              DC;
           Close;//Fecha a Consulta
       end;
end;

procedure TFConsultaOrcamentos.BTPesqClienteClick(Sender: TObject);
begin
     if Trim(ECodCliente.Text)=''
     then begin
          Try
            FPesquisaClientes :=TFPesquisaClientes.Create(Self);
            FPesquisaClientes.ShowModal;
            if FPesquisaClientes.ModalResult=mrOk
            then begin
                 ECodCliente.Text:=StrZero(DM.TPesqClienteCODIGO.AsInteger,5);
                 ENomeCliente.Text:=DM.TPesqClienteNOME.AsString;
                 end;
          Finally
            FreeAndNil(FPesquisaClientes);
          end;
        end
     else begin
          With DM.QPesquisa
          do begin
             Close;
             Sql.Clear;
             Sql.Add('SELECT CODIGO,NOME FROM CLIENTE');
             Sql.Add('WHERE CODIGO= :PCODIGO');
             ParamByName('PCODIGO').AsInteger:=StrToInt(ECodCliente.Text);
             Open;
             if not IsEmpty
             then begin
                  ECodCliente.Text:=StrZero(FieldByName('CODIGO').AsInteger,5);
                  ENomeCliente.Text:=FieldByName('NOME').AsString;
                  end
             else begin
                  Informa('Cliente não cadastrado!');
                  ECodCliente.SetFocus;
                  end;
             end;
        end;
end;

procedure TFConsultaOrcamentos.ECodClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then BTPesqClienteClick(Sender);
end;

procedure TFConsultaOrcamentos.CClienteSemCadClick(Sender: TObject);
begin
     ECliente.Enabled:=CClienteSemCad.Checked;
     if ECliente.Enabled
     then ECliente.SetFocus;
end;

procedure TFConsultaOrcamentos.FormDestroy(Sender: TObject);
begin
     DM.TConsultaOrc.Close;
     DM.TConsultaItenOrc.Close;
end;

procedure TFConsultaOrcamentos.BtPesqVendedorClick(Sender: TObject);
begin
     if Trim(ECodVendedor.Text)=''
     then begin
          FPesquisaVendedores :=TFPesquisaVendedores.Create(Self);
          FPesquisaVendedores.ShowModal;
          If FPesquisaVendedores.ModalResult=mrOk
          then begin
               ECodVendedor.Text:=StrZero(DM.TPesqVendedorCODIGO.Value,3);
               ENomeVendedor.Text:=DM.TPesqVendedorNOME.Value;
               end;
          FreeAndNil(FPesquisaVendedores);
          end
     else begin
          DM.TPesqVendedor.Open;
          if DM.TPesqVendedor.Locate('CODIGO',ECodVendedor.Text,[])
          then begin
               ECodVendedor.Text:=StrZero(DM.TPesqVendedorCODIGO.Value,3);
               ENomeVendedor.Text:=DM.TPesqVendedorNOME.Value;
               end
          else begin
               Informa('Vendedor não Cadastrado!');
               ECodVendedor.SetFocus;
               end;
          end;
end;

procedure TFConsultaOrcamentos.ECodVendedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F5
     then BtPesqVendedorClick(Sender);
end;

procedure TFConsultaOrcamentos.ECodVendedorKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13
     then BtPesqVendedorClick(Sender);
end;

procedure TFConsultaOrcamentos.DBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F11
     then ChamaGrade;
end;

procedure TFConsultaOrcamentos.dsItemOrcamentoDataChange(Sender: TObject;
  Field: TField);
begin
     DM.TConsultaOrcGrade.Close;
     DM.TConsultaOrcGrade.Params[0].AsInteger:=DM.TConsultaItenOrcCODPRODUTO.AsInteger;
     DM.TConsultaOrcGrade.Params[1].AsInteger:=DM.TConsultaItenOrcCODIGO.AsInteger;
     DM.TConsultaOrcGrade.Open;
     if DM.TConsultaOrcGrade.RecordCount > 0
     then begin
          if DM.TConsultaItenOrcGRADE.Value=''
          then begin
               DM.TConsultaItenOrc.Edit;
               DM.TConsultaItenOrcGRADE.Value:='S';
               end;
          end;
end;

procedure TFConsultaOrcamentos.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (Key=32)and(not DM.TConsultaOrc.IsEmpty)
     then begin
          if DM.TConsultaOrcALTERADO.Value='S'
          then begin
               Informa('Este Orçamento já foi Alterado!');
               Exit
               end;
          if DM.TConsultaOrcNUMERO_CUPOM.Value > 0
          then begin
               Informa('Este Orçamento já foi Emitido Cupom Fiscal. Não pode ser mais Alterado!');
               Exit
               end;
          DM.TConsultaOrc.Edit;
          if DM.TConsultaOrcSEL.Value=''
          then DM.TConsultaOrcSEL.Value:='X'
          else DM.TConsultaOrcSEL.Value:='';
          DM.TConsultaOrc.Post;
          end;
end;

end.
