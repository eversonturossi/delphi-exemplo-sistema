unit UImprimeComanda;

interface
uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, DBCtrls, StdCtrls, SqlExpr, ExtCtrls, IniFiles, StrUtils;

     procedure ImprimeComanda(ComandaID : Integer);

implementation
uses Base, UFuncoes, UPrincipal;

procedure ImprimeComanda(ComandaID : Integer);
var
  F : TextFile;
  ArquivoIni: TIniFile;
  Path : String;
  Porta, Razao, Endereco, Cidade,
  Bairro, CNPJ, Telefone : ShortString;
  Espacos, Centro, i : Integer;
  ValorTotal : Currency;
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

  BancoDados.CDSItens.Close;
  BancoDados.qryItens.SQL.Text := 'select produto_id, descricao, und, preco,' +
    'COALESCE(sum(quantidade), 0.0)as QUANTIDADE,COALESCE(sum(total), 0.0)as TOTAL' +
    ' from restaurante_comanda_item where cancelado = 0 and restaurante_comanda_id = ' +
    IntToStr(ComandaID) + 'group by produto_id, descricao, und, preco';
  BancoDados.CDSItens.Open;

  if (BancoDados.CDSItens.IsEmpty) then
    begin
      Mensagem('Não existem Itens para a Comanda!', mtWarning,[mbOk],mrOK,0);
      Exit;
    end
  else
    begin
      try
        BancoDados.CDSItens.DisableControls;
        AssignFile(F, Porta);
        ReWrite(F);

        with BancoDados.qryAuxiliar do
          begin
            Close;
            SQL.Clear;
            SQL.Add('select numero from restaurante_mesa' +
              ' where restaurante_mesa_id in(select restaurante_mesa_id' +
              ' from restaurante_comanda where restaurante_comanda_id = ' +
              IntToStr(ComandaID) + ')');
            Open;
          end;

        Centro := (48 - Length(Razao)) div 2;
        WriteLn(F, #20 + Copy(Repl(' ',Centro), 1, Centro) +RetornaMaiuscula(RetornaSemAcento(Razao)) +
          Copy(Repl(' ',Centro), 1, Centro) + #18);

        WriteLn(F, #20 + Copy(RetornaMaiuscula(RetornaSemAcento(Endereco)), 1, 30) + #18);
        WriteLn(F, #20 + 'Cidade: ' + Cidade + #18);
        WriteLn(F, #20 + 'Bairro: ' + Bairro + #18);
        WriteLn(F, #20 + 'Telefone: ' + Telefone + ' CNPJ: ' + CNPJ + #18);
        WriteLn(F, #20 + '================================================' + #18);
        
        Centro := (48 - Length('Mesa: ' + FormatFloat('000', BancoDados.qryAuxiliar.Fields[0].Value))) div 2;
        WriteLn(F, #20 + Copy(Repl(' ',Centro), 1, Centro) +
          RetornaMaiuscula(RetornaSemAcento('Mesa: ' + FormatFloat('000', BancoDados.qryAuxiliar.Fields[0].Value))) +
          Copy(Repl(' ',Centro), 1, Centro) + #18);

        WriteLn(F, #20 + 'Data: ' + DateToStr(Date) + ' Hora: ' + TimeToStr(time) + #18);
        WriteLn(F, #20 + 'Comanda: ' + FormatFloat('0000000000', ComandaID) + #18);
        WriteLn(F, #20 + '================================================' + #18);
        WriteLn(F, 'Cód.  Descricao                Unit  Qtde Valor');
        WriteLn(F, #20 + '================================================' + #18);

        ValorTotal := 0;

        BancoDados.CDSItens.First;
        while not BancoDados.CDSItens.Eof do
          begin
            WriteLn(F, #15 + Copy(FormatFloat('00000', BancoDados.CDSItensPRODUTO_ID.Value),1, 6) +
              ' ' + PreencheEspaco(BancoDados.CDSItensDESCRICAO.Value, 26, ' ', 'D') +
              ' ' + FormatFloat(',0.00', BancoDados.CDSItensPRECO.Value) +
              ' ' + FormatFloat(',0.00', BancoDados.CDSItensQUANTIDADE.Value) +
              ' ' + FormatFloat(',0.00', BancoDados.CDSItensTOTAL.Value) + #18);

            ValorTotal := ValorTotal + BancoDados.CDSItensTOTAL.Value;
            BancoDados.CDSItens.Next;
          end;

        WriteLn(F, '');
        WriteLn(F, #20 + 'Total: ' + FormatFloat('R$ ,0.00', ValorTotal) + #18);
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
        BancoDados.CDSItens.First;
        BancoDados.CDSItens.EnableControls;
        CloseFile(F);
      end;
    end;
end;
end.
