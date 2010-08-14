{*******************************************************************************
  Autor......: EasyTEF Team - 03/01/2008
  Objetivo...: Arquivo de constantes TEF Discado de acordo com o manual versão
               2.1 de 31/10/2000.
  Comentários:
  Alterações.:
*******************************************************************************}

unit ConstTEFDiscado;

interface

const
  // constantes genéricas
  RECEBE = ' = ';
  MSG_ERRO_GP_INATIVO = 'Gerenciador Padrão não ativo e será ativado automaticamente.';
  MSG_REQ_EM_ANDAMENTO = 'Não é possível fazer uma requisição enquanto a anterior não finalizou.';
  MSG_IMP_NAO_RESP = 'Impressora não responde, tentar novamente?';
  FORMA_PGTO_CARTAO = 'Cartão';
  TIME_OUT_TEF = 5000;
  
  // nome de arquivos
  NOME_ARQUIVO_REQ_TMP = 'IntPos.tmp';
  NOME_ARQUIVO_REQ = 'IntPos.001';
  NOME_ARQUIVO_RESP = 'IntPos.sts';

  // nome das redes
  NOME_REDE_REDECARD = 'REDECARD';
  NOME_REDE_VISANET = 'VISANET';
  NOME_REDE_AMEX = 'AMEX';

  // nome dos campos válidos para o TEF Discado
  CAMPO_HEADER                         = '000-000';
  CAMPO_IDENTIFICACAO                  = '001-000';
  CAMPO_DOCUMENTO_FISCAL               = '002-000';
  CAMPO_VALOR_TOTAL                    = '003-000';
  CAMPO_MOEDA                          = '004-000';
  CAMPO_CMC7                           = '005-000';
  CAMPO_TIPO_PESSOA                    = '006-000';
  CAMPO_DOCUMENTO_PESSOA               = '007-000';
  CAMPO_DATA_CHEQUE                    = '008-000';
  CAMPO_STATUS_TRANSACAO               = '009-000';
  CAMPO_NOME_REDE                      = '010-000';
  CAMPO_TIPO_TRANSACAO                 = '011-000';
  CAMPO_NUMERO_TRANSACAO_NSU           = '012-000';
  CAMPO_CODIGO_AUTORIZACAO_TRANSACAO   = '013-000';
  CAMPO_NUMERO_LOTE_TRANSACAO          = '014-000';
  CAMPO_TIMESTAMP_TRANSACAO_HOST       = '015-000';
  CAMPO_TIMESTAMP_LOCAL                = '016-000';
  CAMPO_TIPO_PARCELAMENTO              = '017-000';
  CAMPO_QTD_PARCELAS                   = '018-000';   
  CAMPO_DATA_TRANSACAO_COMPROVANTE     = '022-000';
  CAMPO_HORA_TRANSACAO_COMPROVANTE     = '023-000';
  CAMPO_DATA_PREDATADO                 = '024-000';
  CAMPO_NUMERO_TRANSACAO_CANCELADA_NSU = '025-000';
  CAMPO_TIMESTAMP_TRANSACAO_CANCELADA  = '026-000';
  CAMPO_FINALIZACAO                    = '027-000';
  CAMPO_QTD_LINHAS_COMPROVANTE         = '028-000';
  CAMPO_TEXTO_OPERADOR                 = '030-000';
  CAMPO_TEXTO_ESPECIAL_CLIENTE         = '031-000';
  CAMPO_AUTENTICACAO                   = '032-000';
  CAMPO_BANCO                          = '033-000';
  CAMPO_AGENCIA                        = '034-000';
  CAMPO_AGENCIA_DC                     = '035-000';
  CAMPO_CONTA_CORRENTE                 = '036-000';
  CAMPO_CONTA_CORRENTE_DC              = '037-000';
  CAMPO_NUMERO_CHEQUE                  = '038-000';
  CAMPO_NUMERO_CHEQUE_DC               = '039-000';
  CAMPO_NOME_ADMINISTRADORA            = '040-000';
  CAMPO_CODIGO_BARRAS_LINHA_DIGITAVEL  = '041-000';
  CAMPO_FIM_ARQUIVO                    = '999-999';

  // valores válidos para os campos do TEF Discado que possuem valores
  // predefinidos
  VALOR_HEADER_GP_ATIVO = 'ATV';
  VALOR_HEADER_ADMINISTRATIVA = 'ADM';
  VALOR_HEADER_CHEQUE = 'CHQ';
  VALOR_HEADER_CARTAO = 'CRT';
  VALOR_HEADER_CANCELAMENTO = 'CNC';
  VALOR_HEADER_CONFIRMACAO = 'CNF';
  VALOR_HEADER_NAO_CONFIRMACAO = 'NCN';
  VALOR_HEADER_PAGAMENTOS = 'PAG';
  VALOR_FIM_ARQUIVO = 0;

  // tipo de transação com cartão de débito ou crédito
  CARTAO_CREDITO_A_VISTA = '10';
  CARTAO_CREDITO_PARC_EST = '11'; // parcelado estabelecimento
  CARTAO_CREDITO_PARC_ADM = '12'; // parcelado administradora
  CARTAO_DEBITO_A_VISTA = '20';
  CARTAO_DEBITO_PRE_DATADO = '21';
  CARTAO_DEBITO_PARCELADO = '22';
  CARTAO_DEBITO_A_VISTA_FORCADA = '23';
  CARTAO_DEBITO_PRE_DATADO_FORCADA = '24';
  CARTAO_DEBITO_PRE_DATADO_SEM_GARANTIA = '25';
  CONSULTA_CHEQUE = '70';

implementation

end.
