unit UCupomNaoFiscal;

interface
uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, DBCtrls, StdCtrls, SqlExpr, ExtCtrls, IniFiles, StrUtils;

     procedure ImprimeCupom(ValorPago, ValorTroco : Currency ; VendaID : Integer);
     function AlinhaEsquerda(Texto: String; Tamanho: Integer): String;
     function AlinhaDireita(Texto: String; Tamanho: Integer): String;

implementation
uses Base, Base64, UFuncoes, UPrincipal;

function AlinhaEsquerda(Texto: String; Tamanho: Integer): String;
begin
  Result := Leftstr(Texto+StringOfChar(#32, Tamanho), Tamanho);
end;

function AlinhaDireita(Texto: String; Tamanho: Integer): String;
begin
  Result := RightStr(StringOfChar(#32, Tamanho)+Texto,Tamanho);
end;

procedure ImprimeCupom(ValorPago, ValorTroco : Currency ; VendaID : Integer);
var
  F : TextFile;
  ArquivoIni: TIniFile;
  Path : String;
  Porta, Razao, Endereco, Cidade, Bairro, CNPJ, Telefone,
  Linha : ShortString;
  Centro, Tamanho, Espacos, i : Integer;
  ValorTotal, ValorDesconto : Currency;
begin
  try
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
    AssignFile(F, Porta);
    ReWrite(F);

    Centro := (48 - Length(Razao)) div 2;
    WriteLn(F, #20 + Copy(Repl(' ',Centro), 1, Centro) +RetornaMaiuscula(RetornaSemAcento(Razao)) +
      Copy(Repl(' ',Centro), 1, Centro) + #18);

    WriteLn(F, '');
    WriteLn(F, #20 + Copy(RetornaMaiuscula(RetornaSemAcento(Endereco)), 1, 30) + #18);
    WriteLn(F, #20 + 'Cidade: ' + Cidade + #18);
    WriteLn(F, #20 + 'Bairro: ' + Bairro + #18);
    WriteLn(F, #20 + 'Telefone: ' + Telefone + ' CNPJ: ' + CNPJ + #18);
    WriteLn(F, #20 + '================================================' + #18);
    WriteLn(F, #20 + '                    CUPOM NAO FISCAL');
    WriteLn(F, '');
    WriteLn(F, #20 + 'Data: ' + DateToStr(Date) + ' Hora: ' + TimeToStr(time) + #18);
    WriteLn(F, #20 + 'Cupom: ' + FormatFloat('0000000000', VendaID) + #18);
    WriteLn(F, #20 + '================================================' + #18);
    WriteLn(F, 'Cód.  Descricao                Unit  Qtde Valor');
    WriteLn(F, #20 + '================================================' + #18);

    BancoDados.CDSVendaItem.Close;
    BancoDados.qryVendaItem.SQL.Text := 'select * from venda_item where venda_id = ' +
      IntToStr(VendaID);
    BancoDados.CDSVendaItem.Open;

    if (BancoDados.CDSVendaItem.IsEmpty) then
      begin
        Mensagem('Não existem Itens para a Venda!', mtWarning,[mbOk],mrOK,0);
        Exit;
      end
    else
      begin
        BancoDados.CDSVendaItem.First;
        while not BancoDados.CDSVendaItem.Eof do
          begin
            WriteLn(F, #15 + Copy(FormatFloat('00000', BancoDados.CDSVendaItemPRODUTO_ID.Value),1, 6) +
              ' ' + PreencheEspaco(BancoDados.CDSVendaItemcalc_descricao.Value, 26, ' ', 'D') +
              ' ' + FormatFloat(',0.00', BancoDados.CDSVendaItemPRECO.Value) +
              ' ' + FormatFloat(',0.00', BancoDados.CDSVendaItemQUANTIDADE.Value) +
              ' ' + FormatFloat(',0.00', BancoDados.CDSVendaItemTOTAL.Value) + #18);
            BancoDados.CDSVendaItem.Next;
          end;
      end;

    BancoDados.CDSNegociacao.Close;
    BancoDados.qryNegociacao.SQL.Text := 'select * from negociacao where venda_id = ' +
      IntToStr(BancoDados.VendaID);
    BancoDados.CDSNegociacao.Open;

    WriteLn(F, #20 + '================================================' + #18);

    ValorTotal := 0;
    ValorDesconto := 0;

    BancoDados.CDSNegociacao.First;
    while not BancoDados.CDSNegociacao.Eof do
      begin
        if (BancoDados.CDSNegociacaoDESCONTO.Value > 0) then
          WriteLn(F, #20 + RetornaSemAcento(BancoDados.CDSNegociacaol_forma_pagamento.Value) + ': ' +
            FormatFloat('R$ ,0.00', BancoDados.CDSNegociacaoVALOR.Value) + '     Desconto: ' +
            FormatFloat('R$ ,0.00', BancoDados.CDSNegociacaoDESCONTO.Value) + #18)
        else
          WriteLn(F, #20 + RetornaSemAcento(BancoDados.CDSNegociacaol_forma_pagamento.Value) + ': ' +
            FormatFloat('R$ ,0.00', BancoDados.CDSNegociacaoVALOR.Value) + #18);

        ValorTotal := ValorTotal + (BancoDados.CDSNegociacaoVALOR.Value);
        ValorDesconto := ValorDesconto + BancoDados.CDSNegociacaoDESCONTO.Value;

        BancoDados.CDSNegociacao.Next;
      end;

    WriteLn(F, '');
    WriteLn(F, #20 + 'Total: ' + FormatFloat('R$ ,0.00', ValorTotal) + #18);
    if (ValorDesconto > 0) then
      WriteLn(F, #20 + 'Descontos: ' + FormatFloat('R$ ,0.00', ValorDesconto));
    WriteLn(F, #20 + 'A Receber: ' + FormatFloat('R$ ,0.00', ValorTotal - ValorDesconto));
    WriteLn(F, #20 + 'Pago: ' + FormatFloat('R$ ,0.00', ValorPago));
    WriteLn(F, #20 + 'Troco: ' + FormatFloat('R$ ,0.00', ValorTroco) + #18);
    WriteLn(F, #20 + '================================================' + #18);

    with BancoDados.qryAuxiliar do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select nome from vendedor where vendedor_id = ' +
          IntToStr(UPrincipal.VendedorID));
        Open;
      end;

    WriteLn(F, #20 + 'Vendedor: ' + BancoDados.qryAuxiliar.Fields[0].Value + #18);
    WriteLn(F, #20 + '     !!!FAZEMOS O MELHOR PENSANDO EM VOCE!!!' + #18);
    WriteLn(F, #20 + '     AQUI NAO SE FAZ CLIENTES, FAZEMOS AMIGOS' + #18);
    WriteLn(F, #20 + '             OBRIGADO E VOLTE SEMPRE!' + #18);

    for i := 1 to Espacos do
      WriteLn(F, '');
  finally
    CloseFile(F);
  end;
end;
end.
