unit UPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvExControls, JvGradientHeaderPanel, ExtCtrls, StdCtrls,
  Buttons, Mask, JvExMask, JvToolEdit, IniFiles;

type
  TPeriodoForm = class(TForm)
    Panel2: TPanel;
    JvGradientHeaderPanel1: TJvGradientHeaderPanel;
    SBPrincipal: TStatusBar;
    Panel1: TPanel;
    DTDe: TJvDateEdit;
    Label1: TLabel;
    Panel3: TPanel;
    BTConfirmar: TBitBtn;
    Label2: TLabel;
    DTAte: TJvDateEdit;
    procedure FormShow(Sender: TObject);
    procedure BTConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PeriodoForm: TPeriodoForm;

implementation
uses Base, UFuncoes;
{$R *.dfm}

procedure TPeriodoForm.BTConfirmarClick(Sender: TObject);
var
  F : TextFile;
  ArquivoIni: TIniFile;
  Path : String;
  Porta, Razao, Endereco, Cidade, Bairro, CNPJ, Telefone,
  Linha : ShortString;
  Centro, Tamanho, Espacos, i : Integer;
  ValorTotal, ValorCartao, ValorCheque, ValorDinheiro : Currency;
begin
  Path := RCopy(Application.ExeName, '\');
  if FileExists(Path + 'MasterERP.ini') then
    begin
      ArquivoIni := TIniFile.Create(Path + 'MasterERP.ini');
      Porta := ArquivoIni.ReadString('Empresa', 'Porta', '');
      Espacos := StrToInt(ArquivoIni.ReadString('Empresa', 'Espacos', ''));
      Razao := ArquivoIni.ReadString('Empresa', 'Razao', '');
      Telefone := ArquivoIni.ReadString('Empresa', 'Telefone', '');
      Endereco := ArquivoIni.ReadString('Empresa', 'Endereco', '');
      Cidade := ArquivoIni.ReadString('Empresa', 'Cidade', '');
      Bairro := ArquivoIni.ReadString('Empresa', 'Bairro', '');
      CNPJ := ArquivoIni.ReadString('Empresa', 'CNPJ', '');
    end;

  BancoDados.CDSNegociacao.Close;
  BancoDados.qryNegociacao.SQL.Text := 'select * from negociacao' +
    ' where venda_id in(select venda_id from venda where fechado = 1 and cancelado = 0' +
    ' and (data_lancamento between ' +
    QuotedStr(FormatDateTime('dd.mm.yyyy 00:00:00', DTDe.Date)) + ' and ' +
    QuotedStr(FormatDateTime('dd.mm.yyyy 23:59:59', DTAte.Date)) + '))';
  BancoDados.CDSNegociacao.Open;

  ValorTotal := 0;
  ValorCartao := 0;
  ValorCheque := 0;
  ValorDinheiro := 0;

  if (BancoDados.CDSNegociacao.IsEmpty) then
    begin
      Mensagem('Não há Lançamentos para o Período informado!', mtWarning,[mbOk],mrOK,0);
      ModalResult := mrCancel;
      Abort;
    end
  else
    begin
      BancoDados.CDSNegociacao.First;
      while not BancoDados.CDSNegociacao.Eof do
        begin
          if (BancoDados.CDSNegociacaol_forma_pagamento.Value = 'Dinheiro') then
            ValorDinheiro := ValorDinheiro + (BancoDados.CDSNegociacaoTOTAL.Value)
          else if (BancoDados.CDSNegociacaol_forma_pagamento.Value = 'Cartão') then
            ValorCartao := ValorCartao + (BancoDados.CDSNegociacaoTOTAL.Value)
          else if (BancoDados.CDSNegociacaol_forma_pagamento.Value = 'Cheque') then
            ValorCheque := ValorCheque + (BancoDados.CDSNegociacaoTOTAL.Value);

          ValorTotal := ValorTotal + (BancoDados.CDSNegociacaoVALOR.Value);
          BancoDados.CDSNegociacao.Next;
        end;

      try
        AssignFile(F, Porta);
        ReWrite(F);

        Centro := (53 - Length(Razao)) div 2;
        WriteLn(F, #20 + Copy(Repl(' ',Centro), 1, Centro) +RetornaMaiuscula(RetornaSemAcento(Razao)) +
          Copy(Repl(' ',Centro), 1, Centro) + #18);

        WriteLn(F, #20 + '======================================================' + #18);
        WriteLn(F, #20 + '               RELATORIO DE VENDAS POR PERIODO');
        WriteLn(F, #20 + 'De ' + DateToStr(DTDe.Date) + ' Ate ' + DateToStr(DTAte.Date) + #18);
        WriteLn(F, #20 + '======================================================' + #18);


        WriteLn(F, #20 + 'Dinheiro: ' + FormatFloat('R$ ,0.00', ValorDinheiro) + #18);
        WriteLn(F, #20 + 'Cartao: ' + FormatFloat('R$ ,0.00', ValorCartao) + #18);
        WriteLn(F, #20 + 'Cheque: ' + FormatFloat('R$ ,0.00', ValorCheque) + #18);
        WriteLn(F, #20 + '');
        WriteLn(F, #20 + 'Total: ' + FormatFloat('R$ ,0.00', ValorTotal) + #18);
        WriteLn(F, #20 + '======================================================' + #18);

        for i := 0 to Espacos do
          WriteLn(F, #20 + '');

        ModalResult := mrOk;
      finally
        CloseFile(F);
      end;
    end;
end;

procedure TPeriodoForm.FormShow(Sender: TObject);
begin
  DTDe.Date := Date;
  DTAte.Date := Date;
  DTDe.SetFocus;
end;

end.
