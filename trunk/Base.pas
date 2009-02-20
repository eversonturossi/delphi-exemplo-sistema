unit Base;

interface

uses
  SysUtils, Classes, ZConnection, DB, ZAbstractRODataset, ZDataset, ZSqlUpdate,
  ZAbstractDataset, Messages, Dialogs, Forms, StdCtrls, ExtCtrls, Windows, Variants,
  Controls, ZSqlProcessor, ZStoredProcedure;

type
  TBancoDeDados = class(TDataModule)
    Conexao: TZConnection;
    qryCsLogin: TZReadOnlyQuery;
    qryCsLoginidusuario: TIntegerField;
    qryCsLoginlogin: TStringField;
    qryCsLoginsenha: TStringField;
    qryCsCliente: TZReadOnlyQuery;
    DSqryCsCliente: TDataSource;
    DSqryCadCliente: TDataSource;
    qryCadCliente: TZQuery;
    qryCadClienteidcliente: TIntegerField;
    qryCadClienteativo: TBooleanField;
    qryCadClientetipo: TSmallintField;
    qryCadClientenome: TStringField;
    qryCadClienterazao_social: TStringField;
    qryCadClientenome_fantasia: TStringField;
    qryCadClienteendereco: TStringField;
    qryCadClientenumero: TStringField;
    qryCadClientecomplemento: TStringField;
    qryCadClientebairro: TStringField;
    qryCadClientecidade: TStringField;
    qryCadClienteestado: TStringField;
    qryCadClientecep: TStringField;
    qryCadClientecaixa_postal: TStringField;
    qryCadClientetelefone_residencial: TStringField;
    qryCadClientetelefone_comercial: TStringField;
    qryCadClientetelefone_celular: TStringField;
    qryCadClientefax: TStringField;
    qryCadClienteemail: TStringField;
    qryCadClientehomepage: TStringField;
    qryCadClientecontato: TStringField;
    qryCadClienteinsc: TStringField;
    qryCadClientecgc: TStringField;
    qryCadClientecpf: TStringField;
    qryCadClienterg: TStringField;
    qryCadClientetitulo_eleitor: TStringField;
    qryCadClientereservista_categoria: TStringField;
    qryCadClientereservista_numero: TStringField;
    qryCadClientehabilitacao_numero: TStringField;
    qryCadClientehabilitacao_categoria: TStringField;
    qryCadClientecarteira_trabalho: TStringField;
    qryCadClientesexo: TStringField;
    qryCadClienteconjuge: TStringField;
    qryCadClientetipo_residencia: TSmallintField;
    qryCadClientetempo_residencia: TFloatField;
    qryCadClientevalor_aluguel: TFloatField;
    qryCadClientecartao_credido: TBooleanField;
    qryCadClienteconta_bancaria: TBooleanField;
    qryCadClienteconta_numero: TStringField;
    qryCadClienteconta_agencia: TStringField;
    qryCadClienteconta_operacao: TStringField;
    qryCadClientecobranca_informar: TBooleanField;
    qryCadClientecobranca_endereco: TStringField;
    qryCadClientecobranca_numero: TStringField;
    qryCadClientecobranca_complemento: TStringField;
    qryCadClientecobranca_bairro: TStringField;
    qryCadClientecobranca_cidade: TStringField;
    qryCadClientecobranca_estado: TStringField;
    qryCadClientecobranca_cep: TStringField;
    qryCadClientecobranca_cxpostal: TStringField;
    qryCadClientedata_nascimento: TDateField;
    qryCadClientedata_casamento: TDateField;
    qryCadClientedata_cadastro: TDateField;
    qryCadClienterg_uf: TStringField;
    qryCadClienterg_orgao: TStringField;
    qryCadClientereferencia_comercial: TStringField;
    qryCadClientereferencia_bancaria: TStringField;
    qryCadClientenaturalidade: TStringField;
    qryCadClientenaturalidade_uf: TStringField;
    qryCadClientenacionalidade: TStringField;
    qryCadClienteescolaridade: TStringField;
    qryCadClientedependentes: TIntegerField;
    qryCadClientespc: TBooleanField;
    qryCadClientespc_data: TDateField;
    qryCadClienteserasa: TBooleanField;
    qryCadClienteserasa_data: TDateField;
    qryCsClienteidcliente: TIntegerField;
    qryCsClienteativo: TBooleanField;
    qryCsClientetipo: TSmallintField;
    qryCsClientenome: TStringField;
    qryCsClienterazao_social: TStringField;
    qryCsClientenome_fantasia: TStringField;
    qryCsClienteendereco: TStringField;
    qryCsClientenumero: TStringField;
    qryCsClientecomplemento: TStringField;
    qryCsClientebairro: TStringField;
    qryCsClientecidade: TStringField;
    qryCsClienteestado: TStringField;
    qryCsClientecep: TStringField;
    qryCsClientecaixa_postal: TStringField;
    qryCsClientetelefone_residencial: TStringField;
    qryCsClientetelefone_comercial: TStringField;
    qryCsClientetelefone_celular: TStringField;
    qryCsClientefax: TStringField;
    qryCsClienteemail: TStringField;
    qryCsClientehomepage: TStringField;
    qryCsClientecontato: TStringField;
    qryCsClienteinsc: TStringField;
    qryCsClientecgc: TStringField;
    qryCsClientecpf: TStringField;
    qryCsClienterg: TStringField;
    qryCsClientetitulo_eleitor: TStringField;
    qryCsClientereservista_categoria: TStringField;
    qryCsClientereservista_numero: TStringField;
    qryCsClientehabilitacao_numero: TStringField;
    qryCsClientehabilitacao_categoria: TStringField;
    qryCsClientecarteira_trabalho: TStringField;
    qryCsClientesexo: TStringField;
    qryCsClienteconjuge: TStringField;
    qryCsClientetipo_residencia: TSmallintField;
    qryCsClientetempo_residencia: TFloatField;
    qryCsClientevalor_aluguel: TFloatField;
    qryCsClientecartao_credido: TBooleanField;
    qryCsClienteconta_bancaria: TBooleanField;
    qryCsClienteconta_numero: TStringField;
    qryCsClienteconta_agencia: TStringField;
    qryCsClienteconta_operacao: TStringField;
    qryCsClientecobranca_informar: TBooleanField;
    qryCsClientecobranca_endereco: TStringField;
    qryCsClientecobranca_numero: TStringField;
    qryCsClientecobranca_complemento: TStringField;
    qryCsClientecobranca_bairro: TStringField;
    qryCsClientecobranca_cidade: TStringField;
    qryCsClientecobranca_estado: TStringField;
    qryCsClientecobranca_cep: TStringField;
    qryCsClientecobranca_cxpostal: TStringField;
    qryCsClientedata_nascimento: TDateField;
    qryCsClientedata_casamento: TDateField;
    qryCsClientedata_cadastro: TDateField;
    qryCsClienterg_uf: TStringField;
    qryCsClienterg_orgao: TStringField;
    qryCsClientereferencia_comercial: TStringField;
    qryCsClientereferencia_bancaria: TStringField;
    qryCsClientenaturalidade: TStringField;
    qryCsClientenaturalidade_uf: TStringField;
    qryCsClientenacionalidade: TStringField;
    qryCsClienteescolaridade: TStringField;
    qryCsClientedependentes: TIntegerField;
    qryCsClientespc: TBooleanField;
    qryCsClientespc_data: TDateField;
    qryCsClienteserasa: TBooleanField;
    qryCsClienteserasa_data: TDateField;
    qryCsGrupo: TZReadOnlyQuery;
    qryCsGrupoidgrupo: TIntegerField;
    qryCsGruponome: TStringField;
    qryCsGrupoativo: TBooleanField;
    DSqryCsGrupo: TDataSource;
    DSqryCadGrupo: TDataSource;
    qryCadGrupo: TZQuery;
    qryCadGrupoidgrupo: TIntegerField;
    qryCadGruponome: TStringField;
    qryCadGrupoativo: TBooleanField;
    qryCsSubGrupo: TZReadOnlyQuery;
    qryCsSubGrupoidsubgrupo: TIntegerField;
    qryCsSubGruponome: TStringField;
    qryCsSubGrupoidgrupo: TIntegerField;
    qryCsSubGrupoativo: TBooleanField;
    qryCsSubGrupocalcnome_grupo: TStringField;
    DSqryCsSubGrupo: TDataSource;
    qryCadSubGrupo: TZQuery;
    qryCadSubGrupoidsubgrupo: TIntegerField;
    qryCadSubGruponome: TStringField;
    qryCadSubGrupoidgrupo: TIntegerField;
    qryCadSubGrupoativo: TBooleanField;
    DSqryCadSubGrupo: TDataSource;
    qryCsFornecedor: TZReadOnlyQuery;
    DSqryCsFornecedor: TDataSource;
    qryCadFornecedor: TZQuery;
    DSqryCadFornecedor: TDataSource;
    qryCsFornecedoridfornecedor: TIntegerField;
    qryCsFornecedorativo: TBooleanField;
    qryCsFornecedorrazao_social: TStringField;
    qryCsFornecedornome_fantasia: TStringField;
    qryCsFornecedorinsc: TStringField;
    qryCsFornecedorcgc: TStringField;
    qryCsFornecedorcpf: TStringField;
    qryCsFornecedorendereco: TStringField;
    qryCsFornecedornumero: TStringField;
    qryCsFornecedorcomplemento: TStringField;
    qryCsFornecedorbairro: TStringField;
    qryCsFornecedorcidade: TStringField;
    qryCsFornecedoruf: TStringField;
    qryCsFornecedorcep: TStringField;
    qryCsFornecedorcaixa_postal: TStringField;
    qryCsFornecedortelefone_residencial: TStringField;
    qryCsFornecedortelefone_comercial: TStringField;
    qryCsFornecedortelefone_celular: TStringField;
    qryCsFornecedortelefone_fax: TStringField;
    qryCsFornecedoremail: TStringField;
    qryCsFornecedorhomepage: TStringField;
    qryCsFornecedorcontato: TStringField;
    qryCsFornecedorlimite_compra: TFloatField;
    qryCsFornecedordata_cadastro: TDateField;
    qryCadFornecedoridfornecedor: TIntegerField;
    qryCadFornecedorativo: TBooleanField;
    qryCadFornecedorrazao_social: TStringField;
    qryCadFornecedornome_fantasia: TStringField;
    qryCadFornecedorinsc: TStringField;
    qryCadFornecedorcgc: TStringField;
    qryCadFornecedorcpf: TStringField;
    qryCadFornecedorendereco: TStringField;
    qryCadFornecedornumero: TStringField;
    qryCadFornecedorcomplemento: TStringField;
    qryCadFornecedorbairro: TStringField;
    qryCadFornecedorcidade: TStringField;
    qryCadFornecedoruf: TStringField;
    qryCadFornecedorcep: TStringField;
    qryCadFornecedorcaixa_postal: TStringField;
    qryCadFornecedortelefone_residencial: TStringField;
    qryCadFornecedortelefone_comercial: TStringField;
    qryCadFornecedortelefone_celular: TStringField;
    qryCadFornecedortelefone_fax: TStringField;
    qryCadFornecedoremail: TStringField;
    qryCadFornecedorhomepage: TStringField;
    qryCadFornecedorcontato: TStringField;
    qryCadFornecedorlimite_compra: TFloatField;
    qryCadFornecedordata_cadastro: TDateField;
    qryCadFornecedortipo: TSmallintField;
    qryCadFornecedorpreferencial: TBooleanField;
    qryCadFornecedorultima_compra: TDateField;
    qryCsProduto: TZReadOnlyQuery;
    qryCadproduto: TZQuery;
    DSqryCsProduto: TDataSource;
    DSqryCadProduto: TDataSource;
    qryCadLocalizacao: TZQuery;
    DSqryCsLocalizacao: TDataSource;
    DSqryCadLocalizacao: TDataSource;
    qryCadLocalizacaoidlocalizacao: TIntegerField;
    qryCadLocalizacaoativo: TBooleanField;
    qryCadLocalizacaodata_cadastro: TDateField;
    qryCadLocalizacaocorredor: TStringField;
    qryCadLocalizacaoestante: TStringField;
    qryCadLocalizacaoprateleira: TStringField;
    qryCadLocalizacaobandeja: TStringField;
    qryCadLocalizacaoidunidadeestoque: TIntegerField;
    qryCadLocalizacaoidproduto: TIntegerField;
    qryCsUnidadeEstoque: TZReadOnlyQuery;
    qryCadUnidadeEstoque: TZQuery;
    DSqryCsUnidadeEstoque: TDataSource;
    DSqryCadUnidadeEstoque: TDataSource;
    qryCsUnidadeEstoqueidunidadeestoque: TIntegerField;
    qryCsUnidadeEstoqueativo: TBooleanField;
    qryCsUnidadeEstoquedata_cadastro: TDateField;
    qryCsUnidadeEstoquenome: TStringField;
    qryCsUnidadeEstoqueendereco: TStringField;
    qryCsUnidadeEstoquenumero: TStringField;
    qryCsUnidadeEstoquecomplemento: TStringField;
    qryCsUnidadeEstoquebairro: TStringField;
    qryCsUnidadeEstoquecidade: TStringField;
    qryCsUnidadeEstoqueuf: TStringField;
    qryCsUnidadeEstoquecep: TStringField;
    qryCadUnidadeEstoqueidunidadeestoque: TIntegerField;
    qryCadUnidadeEstoqueativo: TBooleanField;
    qryCadUnidadeEstoquedata_cadastro: TDateField;
    qryCadUnidadeEstoquenome: TStringField;
    qryCadUnidadeEstoqueendereco: TStringField;
    qryCadUnidadeEstoquenumero: TStringField;
    qryCadUnidadeEstoquecomplemento: TStringField;
    qryCadUnidadeEstoquebairro: TStringField;
    qryCadUnidadeEstoquecidade: TStringField;
    qryCadUnidadeEstoqueuf: TStringField;
    qryCadUnidadeEstoquecep: TStringField;
    qryCsUnidadeEstoqueidentificador: TStringField;
    qryCadUnidadeEstoqueidentificador: TStringField;
    qryCsGrupodata_cadastro: TDateField;
    qryCadGrupodata_cadastro: TDateField;
    qryCsSubGrupodata_cadastro: TDateField;
    qryCadSubGrupodata_cadastro: TDateField;
    qryCsClassificacao: TZReadOnlyQuery;
    qryCsClassificacaoidclassificacao: TIntegerField;
    qryCsClassificacaoativo: TBooleanField;
    qryCsClassificacaodata_cadastro: TDateField;
    qryCsClassificacaodescricao: TStringField;
    qryCadClassificacao: TZQuery;
    qryCadClassificacaoidclassificacao: TIntegerField;
    qryCadClassificacaoativo: TBooleanField;
    qryCadClassificacaodata_cadastro: TDateField;
    qryCadClassificacaodescricao: TStringField;
    DSqryCsClassificacao: TDataSource;
    DSqryCadClassificacao: TDataSource;
    qryCsProdutoFornecedor: TZReadOnlyQuery;
    DSqryCsProdutoFornecedor: TDataSource;
    qryCsProdutoFornecedoridprodutofornecedor: TIntegerField;
    qryCsProdutoFornecedoridproduto: TIntegerField;
    qryCsProdutoFornecedoridfornecedor: TIntegerField;
    qryCsProdutoFornecedordata_cadastro: TDateField;
    ProcScripts: TZSQLProcessor;
    qryCsProdutoFornecedorcalc_nome_razaosocial: TStringField;
    qryCsProdutoFornecedorcalc_nome_nomefantasia: TStringField;
    qryCadLocalizacaocalc_nome_produtodescricao: TStringField;
    qryCadLocalizacaocalc_nome_unidadeestoque: TStringField;
    qryCsUnidade: TZReadOnlyQuery;
    qryCadUnidade: TZQuery;
    DSqryCsUnidade: TDataSource;
    DSqryCadUnidade: TDataSource;
    qryCsUnidadeidunidade: TIntegerField;
    qryCsUnidadedescricao: TStringField;
    qryCsUnidadeabreviacao: TStringField;
    qryCadUnidadeidunidade: TIntegerField;
    qryCadUnidadedescricao: TStringField;
    qryCadUnidadeabreviacao: TStringField;
    qryCsUnidadedata_cadastro: TDateField;
    qryCadUnidadedata_cadastro: TDateField;
    qryCsUnidadetipo: TSmallintField;
    qryCadUnidadetipo: TSmallintField;
    qryCsUnidadecalc_nome_tipo: TStringField;
    DSqryCsPreco: TDataSource;
    DSqryCadPreco: TDataSource;
    qryCsProdutoativo: TBooleanField;
    qryCsProdutodata_cadastro: TDateField;
    qryCsProdutodescricao: TStringField;
    qryCsProdutodescricao_reduzida: TStringField;
    qryCsProdutoidgrupo: TIntegerField;
    qryCsProdutoidsubgrupo: TIntegerField;
    qryCsProdutoidfornecedor: TIntegerField;
    qryCsProdutounidade_compra: TStringField;
    qryCsProdutoidclassificacao: TIntegerField;
    qryCsProdutoidlocalizacao: TIntegerField;
    qryCsProdutost: TIntegerField;
    qryCsProdutoecf: TIntegerField;
    qryCsProdutoperc_ipi: TFloatField;
    qryCsProdutoperc_frete: TFloatField;
    qryCsProdutovl_frete: TFloatField;
    qryCsProdutosaldo_minimo: TFloatField;
    qryCsProdutopeso_bruto: TFloatField;
    qryCsProdutopeso_liquido: TFloatField;
    qryCsProdutounidade_venda: TStringField;
    qryCsProdutoperc_comissao: TFloatField;
    qryCsProdutovl_comissao: TFloatField;
    qryCsProdutoperc_desconto: TFloatField;
    qryCsProdutovl_desconto: TFloatField;
    qryCsProdutoperc_pis: TFloatField;
    qryCsProdutoperc_cofins: TFloatField;
    qryCsProdutoperc_tva: TFloatField;
    qryCsProdutoperc_icms_interno: TFloatField;
    qryCsProdutoperc_icms_externo: TFloatField;
    qryCsProdutoperc_icms_substituicao: TFloatField;
    qryCadprodutoativo: TBooleanField;
    qryCadprodutodata_cadastro: TDateField;
    qryCadprodutodescricao: TStringField;
    qryCadprodutodescricao_reduzida: TStringField;
    qryCadprodutoidgrupo: TIntegerField;
    qryCadprodutoidsubgrupo: TIntegerField;
    qryCadprodutoidfornecedor: TIntegerField;
    qryCadprodutounidade_compra: TStringField;
    qryCadprodutoidclassificacao: TIntegerField;
    qryCadprodutoidlocalizacao: TIntegerField;
    qryCadprodutost: TIntegerField;
    qryCadprodutoecf: TIntegerField;
    qryCadprodutoperc_ipi: TFloatField;
    qryCadprodutoperc_frete: TFloatField;
    qryCadprodutovl_frete: TFloatField;
    qryCadprodutosaldo_minimo: TFloatField;
    qryCadprodutopeso_bruto: TFloatField;
    qryCadprodutopeso_liquido: TFloatField;
    qryCadprodutounidade_venda: TStringField;
    qryCadprodutoperc_comissao: TFloatField;
    qryCadprodutovl_comissao: TFloatField;
    qryCadprodutoperc_desconto: TFloatField;
    qryCadprodutovl_desconto: TFloatField;
    qryCadprodutoperc_pis: TFloatField;
    qryCadprodutoperc_cofins: TFloatField;
    qryCadprodutoperc_tva: TFloatField;
    qryCadprodutoperc_icms_interno: TFloatField;
    qryCadprodutoperc_icms_externo: TFloatField;
    qryCadprodutoperc_icms_substituicao: TFloatField;
    qryCadprodutocalc_nome_grupo: TStringField;
    qryCadprodutocalc_nome_subgrupo: TStringField;
    qryCadprodutocalc_nome_fornecedor: TStringField;
    qryCadprodutocalc_nome_classificacao: TStringField;
    qryCsProdutoperc_custo_fixo: TFloatField;
    qryCsProdutoperc_outros_impostos: TFloatField;
    qryCadprodutoperc_custo_fixo: TFloatField;
    qryCadprodutoperc_outros_impostos: TFloatField;
    qryCsProdutovl_custo_fixo: TFloatField;
    qryCadprodutovl_custo_fixo: TFloatField;
    qryCadprodutocalc_preco_atacado: TFloatField;
    qryCadprodutocalc_preco_varejo: TFloatField;
    qryCadprodutocalc_saldo_atual: TFloatField;
    qryCsProdutocalc_saldo_atual: TFloatField;
    qryCadprodutoreferencia: TStringField;
    qryCsProdutoreferencia: TStringField;
    qryCsUsuario: TZReadOnlyQuery;
    qryCsUsuarioidusuario: TIntegerField;
    qryCsUsuarioativo: TBooleanField;
    qryCsUsuariodata_cadastro: TDateField;
    qryCsUsuarionome: TStringField;
    qryCsUsuariologin: TStringField;
    qryCsUsuariosenha: TStringField;
    DSqryCsUsuario: TDataSource;
    qryCadUsuario: TZQuery;
    qryCadUsuarioidusuario: TIntegerField;
    qryCadUsuarioativo: TBooleanField;
    qryCadUsuariodata_cadastro: TDateField;
    qryCadUsuarionome: TStringField;
    qryCadUsuariologin: TStringField;
    qryCadUsuariosenha: TStringField;
    DSqryCadUsuario: TDataSource;
    qryCsLocalizacao: TZReadOnlyQuery;
    qryCsSequenciador: TZReadOnlyQuery;
    qryCsLocalizacaoidlocalizacao: TIntegerField;
    qryCsLocalizacaoativo: TBooleanField;
    qryCsLocalizacaodata_cadastro: TDateField;
    qryCsLocalizacaocorredor: TStringField;
    qryCsLocalizacaoestante: TStringField;
    qryCsLocalizacaoprateleira: TStringField;
    qryCsLocalizacaobandeja: TStringField;
    qryCsLocalizacaoidunidadeestoque: TIntegerField;
    qryCsLocalizacaoidproduto: TIntegerField;
    qryCsLocalizacaocalc_produto_descricao: TStringField;
    qryCsProdutoidproduto: TLargeintField;
    qryCadprodutoidproduto: TLargeintField;
    qryCsLocalizacaocalc_nome_unidadeestoque: TStringField;
    EstProcSequenciador: TZStoredProc;
    qryCsMovimentoEstoque: TZReadOnlyQuery;
    qryCadMovimentoEstoque: TZQuery;
    DSqryCsMovimentoEstoque: TDataSource;
    DSqryCadMovimentoEstoque: TDataSource;
    qryCadPreco: TZQuery;
    qryCadPrecoidpreco: TIntegerField;
    qryCadPrecoativo: TBooleanField;
    qryCadPrecodata_cadastro: TDateField;
    qryCadPrecotipo: TSmallintField;
    qryCadPrecoidproduto: TIntegerField;
    qryCadPrecopreco_custo: TFloatField;
    qryCadPrecopreco_venda: TFloatField;
    qryCadPrecopreco_sugerido: TFloatField;
    qryCadPrecoperc_margem_lucro: TFloatField;
    qryCadPrecoperc_icms_interno: TFloatField;
    qryCadPrecoperc_icms_externo: TFloatField;
    qryCadPrecoperc_icms_substituicao: TFloatField;
    qryCadPrecoperc_ipi: TFloatField;
    qryCadPrecoperc_tva: TFloatField;
    qryCadPrecoperc_pis: TFloatField;
    qryCadPrecoperc_cofins: TFloatField;
    qryCadPrecoperc_outros_impostos: TFloatField;
    qryCadPrecoperc_comissao: TFloatField;
    qryCadPrecoperc_desconto: TFloatField;
    qryCadPrecoperc_frete: TFloatField;
    qryCadPrecoperc_custo_fixo: TFloatField;
    qryCadPrecovl_margem_lucro: TFloatField;
    qryCadPrecovl_comissao: TFloatField;
    qryCadPrecovl_desconto: TFloatField;
    qryCadPrecovl_frete: TFloatField;
    qryCadPrecovl_custo_fixo: TFloatField;
    qryCsPreco: TZReadOnlyQuery;
    qryCsPrecoidpreco: TIntegerField;
    qryCsPrecoativo: TBooleanField;
    qryCsPrecodata_cadastro: TDateField;
    qryCsPrecotipo: TSmallintField;
    qryCsPrecoidproduto: TIntegerField;
    qryCsPrecopreco_custo: TFloatField;
    qryCsPrecopreco_venda: TFloatField;
    qryCsPrecopreco_sugerido: TFloatField;
    qryCsPrecoperc_margem_lucro: TFloatField;
    qryCsPrecoperc_icms_interno: TFloatField;
    qryCsPrecoperc_icms_externo: TFloatField;
    qryCsPrecoperc_icms_substituicao: TFloatField;
    qryCsPrecoperc_ipi: TFloatField;
    qryCsPrecoperc_tva: TFloatField;
    qryCsPrecoperc_pis: TFloatField;
    qryCsPrecoperc_cofins: TFloatField;
    qryCsPrecoperc_outros_impostos: TFloatField;
    qryCsPrecoperc_comissao: TFloatField;
    qryCsPrecoperc_desconto: TFloatField;
    qryCsPrecoperc_frete: TFloatField;
    qryCsPrecoperc_custo_fixo: TFloatField;
    qryCsPrecovl_margem_lucro: TFloatField;
    qryCsPrecovl_comissao: TFloatField;
    qryCsPrecovl_desconto: TFloatField;
    qryCsPrecovl_frete: TFloatField;
    qryCsPrecovl_custo_fixo: TFloatField;
    qryCsOperacaoEstoque: TZReadOnlyQuery;
    qryCadOperacaoEstoque: TZQuery;
    qryCsOperacaoEstoqueidoperacao_estoque: TIntegerField;
    qryCsOperacaoEstoqueativo: TBooleanField;
    qryCsOperacaoEstoquedata_cadastro: TDateField;
    qryCsOperacaoEstoquedescricao: TStringField;
    qryCadOperacaoEstoqueidoperacao_estoque: TIntegerField;
    qryCadOperacaoEstoqueativo: TBooleanField;
    qryCadOperacaoEstoquedata_cadastro: TDateField;
    qryCadOperacaoEstoquedescricao: TStringField;
    DSqryCsOperacaoEstoque: TDataSource;
    DSqryCadOperacaoEstoque: TDataSource;
    qryCsMovimentoEstoqueativo: TBooleanField;
    qryCsMovimentoEstoquedata_cadastro: TDateTimeField;
    qryCsMovimentoEstoqueidunidade_estoque_origem: TIntegerField;
    qryCsMovimentoEstoqueidunidade_estoque_destino: TIntegerField;
    qryCsMovimentoEstoqueidoperacao_estoque: TIntegerField;
    qryCsMovimentoEstoqueidfornecedor: TIntegerField;
    qryCsMovimentoEstoquesolicitante: TStringField;
    qryCsMovimentoEstoqueidusuario: TIntegerField;
    qryCadMovimentoEstoqueativo: TBooleanField;
    qryCadMovimentoEstoquedata_cadastro: TDateTimeField;
    qryCadMovimentoEstoqueidunidade_estoque_origem: TIntegerField;
    qryCadMovimentoEstoqueidunidade_estoque_destino: TIntegerField;
    qryCadMovimentoEstoqueidoperacao_estoque: TIntegerField;
    qryCadMovimentoEstoqueidfornecedor: TIntegerField;
    qryCadMovimentoEstoquesolicitante: TStringField;
    qryCadMovimentoEstoqueidusuario: TIntegerField;
    qryCsMovimentoEstoqueItens: TZReadOnlyQuery;
    qryCadMovimentoEstoqueItens: TZQuery;
    DSqryCsMovimentoEstoqueItens: TDataSource;
    DSqryCadMovimentoEstoqueItens: TDataSource;
    qryCsMovimentoEstoquecalc_nome_fornecedor: TStringField;
    qryCadMovimentoEstoquecalc_nome_fornecedor: TStringField;
    qryCsMovimentoEstoqueidmovimento_estoque: TIntegerField;
    qryCadMovimentoEstoqueidmovimento_estoque: TIntegerField;
    qryCsMovimentoEstoquetipo: TSmallintField;
    qryCadMovimentoEstoquetipo: TSmallintField;
    qryCsMovimentoEstoqueprocessado: TBooleanField;
    qryCadMovimentoEstoqueprocessado: TBooleanField;
    qryCsParametros: TZReadOnlyQuery;
    DSqryCsParametros: TDataSource;
    qryCsParametrosidparametro: TIntegerField;
    qryCsParametrosativo: TBooleanField;
    qryCsParametrosdescricao: TStringField;
    qryCsParametrosvalor: TStringField;
    qryCadParametros: TZQuery;
    qryCsModulos: TZReadOnlyQuery;
    qryCadModulos: TZQuery;
    DSqryCadParametros: TDataSource;
    DSqryCsModulos: TDataSource;
    DSqryCadModulos: TDataSource;
    qryCsParametrosidmodulo: TIntegerField;
    qryCsParametrosdata_cadastro: TDateTimeField;
    qryCadParametrosidparametro: TIntegerField;
    qryCadParametrosativo: TBooleanField;
    qryCadParametrosdescricao: TStringField;
    qryCadParametrosidmodulo: TIntegerField;
    qryCadParametrosvalor: TStringField;
    qryCadParametrosdata_cadastro: TDateTimeField;
    qryCsModulosidmodulo: TIntegerField;
    qryCsModulosativo: TBooleanField;
    qryCsModulosdescricao: TStringField;
    qryCsModulosdata_cadastro: TDateTimeField;
    qryCadModulosidmodulo: TIntegerField;
    qryCadModulosativo: TBooleanField;
    qryCadModulosdescricao: TStringField;
    qryCadModulosdata_cadastro: TDateTimeField;
    qryCsParametroscalc_descricao_modulo: TStringField;
    qryCsMovimentoEstoqueItensidmovimento_estoque_itens: TIntegerField;
    qryCsMovimentoEstoqueItensidmovimento_estoque: TIntegerField;
    qryCsMovimentoEstoqueItensidproduto: TIntegerField;
    qryCsMovimentoEstoqueItensdescricao: TStringField;
    qryCsMovimentoEstoqueItensreferencia: TStringField;
    qryCsMovimentoEstoqueItensunidade: TStringField;
    qryCsMovimentoEstoqueItensquantidade: TFloatField;
    qryCsMovimentoEstoqueItenspreco_unitario: TFloatField;
    qryCsMovimentoEstoqueItenscalc_total: TCurrencyField;
    qryCadMovimentoEstoqueItensidmovimento_estoque_itens: TIntegerField;
    qryCadMovimentoEstoqueItensidmovimento_estoque: TIntegerField;
    qryCadMovimentoEstoqueItensidproduto: TIntegerField;
    qryCadMovimentoEstoqueItensdescricao: TStringField;
    qryCadMovimentoEstoqueItensreferencia: TStringField;
    qryCadMovimentoEstoqueItensunidade: TStringField;
    qryCadMovimentoEstoqueItensquantidade: TFloatField;
    qryCadMovimentoEstoqueItenspreco_unitario: TFloatField;
    qryCadMovimentoEstoqueItenscalc_total: TCurrencyField;
    qryCsSequenciadorid: TIntegerField;
    procedure qryCadClienteBeforeDelete(DataSet: TDataSet);
    procedure qryCadClienteBeforePost(DataSet: TDataSet);
    procedure qryCadGrupoBeforeDelete(DataSet: TDataSet);
    procedure qryCadGrupoBeforePost(DataSet: TDataSet);
    procedure qryCsGrupoBeforeOpen(DataSet: TDataSet);
    procedure qryCadSubGrupoBeforeDelete(DataSet: TDataSet);
    procedure qryCadSubGrupoBeforePost(DataSet: TDataSet);
    procedure qryCsSubGrupoBeforeOpen(DataSet: TDataSet);
    procedure qryCsSubGrupoCalcFields(DataSet: TDataSet);
    procedure qryCadFornecedorBeforeDelete(DataSet: TDataSet);
    procedure qryCadFornecedorBeforePost(DataSet: TDataSet);
    procedure qryCadprodutoCalcFields(DataSet: TDataSet);
    procedure qryCsProdutoCalcFields(DataSet: TDataSet);
    procedure qryCsLocalizacaoCalcFields(DataSet: TDataSet);
    procedure qryCadprodutoBeforeDelete(DataSet: TDataSet);
    procedure qryCadLocalizacaoBeforeDelete(DataSet: TDataSet);
    procedure qryCadUnidadeEstoqueBeforeDelete(DataSet: TDataSet);
    procedure qryCadprodutoBeforePost(DataSet: TDataSet);
    procedure qryCadLocalizacaoBeforePost(DataSet: TDataSet);
    procedure qryCadUnidadeEstoqueBeforePost(DataSet: TDataSet);
    procedure qryCadClassificacaoBeforeDelete(DataSet: TDataSet);
    procedure qryCadClassificacaoBeforePost(DataSet: TDataSet);
    procedure qryCsUnidadeCalcFields(DataSet: TDataSet);
    procedure qryCadUnidadeBeforeDelete(DataSet: TDataSet);
    procedure qryCadUnidadeBeforePost(DataSet: TDataSet);
    procedure qryCadprodutoAfterInsert(DataSet: TDataSet);
    procedure qryCadUsuarioBeforeDelete(DataSet: TDataSet);
    procedure qryCadPrecoBeforePost(DataSet: TDataSet);
    procedure qryCadMovimentoEstoqueAfterInsert(DataSet: TDataSet);
    procedure qryCadOperacaoEstoqueBeforeDelete(DataSet: TDataSet);
    procedure qryCadOperacaoEstoqueBeforePost(DataSet: TDataSet);
    procedure qryCadMovimentoEstoqueBeforeDelete(DataSet: TDataSet);
    procedure qryCadMovimentoEstoqueBeforePost(DataSet: TDataSet);
    procedure qryCadMovimentoEstoqueItensCalcFields(DataSet: TDataSet);
    procedure qryCadModulosBeforeDelete(DataSet: TDataSet);
    procedure qryCadModulosBeforePost(DataSet: TDataSet);
    procedure qryCadParametrosBeforeDelete(DataSet: TDataSet);
    procedure qryCadParametrosBeforePost(DataSet: TDataSet);
    procedure qryCadMovimentoEstoqueItensBeforePost(DataSet: TDataSet);
    procedure qryCadMovimentoEstoqueItensBeforeInsert(DataSet: TDataSet);
    procedure qryCadMovimentoEstoqueItensAfterInsert(DataSet: TDataSet);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BancoDeDados: TBancoDeDados;

implementation
uses UCadCliente, UCadFornecedor, UCadUnidadeEstoque, UCadGrupo, UCadSubGrupo,
      UCadProduto, UCadLocalizacao, UCadClassficacao, UCadOperacaoEstoque, UFuncoes;
{$R *.dfm}

procedure TBancoDeDados.qryCadClassificacaoBeforeDelete(DataSet: TDataSet);
begin
  if (MessageDlg('Deseja Excluir o registro?',mtWarning,[mbYes,mbNo],0) = mrNo) then
    Abort;
end;

procedure TBancoDeDados.qryCadClassificacaoBeforePost(DataSet: TDataSet);
begin
  if not (qryCadClassificacaodescricao.Value <> '') then
    begin
      MessageDlg('Informe uma Descrição para a Classificação.',mtWarning,[mbOK],0);
      Abort;
    end;
end;

procedure TBancoDeDados.qryCadClienteBeforeDelete(DataSet: TDataSet);
begin
  if (MessageDlg('Deseja Excluir o registro?',mtWarning,[mbYes,mbNo],0) = mrNo) then
    Abort;
end;

procedure TBancoDeDados.qryCadClienteBeforePost(DataSet: TDataSet);
begin
  if not (qryCadClientenome.Value <> '') then
    begin
      MessageDlg('Informe um nome para o Cliente',mtWarning,[mbOK],0);
      Abort;
    end;
end;

procedure TBancoDeDados.qryCadFornecedorBeforeDelete(DataSet: TDataSet);
begin
  if (MessageDlg('Deseja Excluir o registro?',mtWarning,[mbYes,mbNo],0) = mrNo) then
    Abort;
end;

procedure TBancoDeDados.qryCadFornecedorBeforePost(DataSet: TDataSet);
begin
  if not (qryCadFornecedorrazao_social.Value <> '') then
    begin
      MessageDlg('Informe a Razão Social do Fornecedor',mtWarning,[mbOK],0);
      Abort;
    end;
end;

procedure TBancoDeDados.qryCadGrupoBeforeDelete(DataSet: TDataSet);
begin
  if (MessageDlg('Deseja Excluir o registro?',mtWarning,[mbYes,mbNo],0) = mrNo) then
    Abort;
end;

procedure TBancoDeDados.qryCadGrupoBeforePost(DataSet: TDataSet);
begin
  if not (qryCadGruponome.Value <> '') then
    begin
      MessageDlg('Informe um nome para o Grupo',mtWarning,[mbOK],0);
      Abort;
    end;
end;

procedure TBancoDeDados.qryCadLocalizacaoBeforeDelete(DataSet: TDataSet);
begin
  if (MessageDlg('Deseja Excluir o registro?',mtWarning,[mbYes,mbNo],0) = mrNo) then
    Abort;
end;

procedure TBancoDeDados.qryCadLocalizacaoBeforePost(DataSet: TDataSet);
begin
  if not (qryCadLocalizacaoidproduto.Value > 0) then
    begin
      MessageDlg('Informe um Codigo para o Produto.',mtWarning,[mbOK],0);
      Abort;
    end;
end;
procedure TBancoDeDados.qryCadModulosBeforeDelete(DataSet: TDataSet);
begin
  if (MessageDlg('Deseja Excluir o registro?',mtWarning,[mbYes,mbNo],0) = mrNo) then
    Abort;
end;

procedure TBancoDeDados.qryCadModulosBeforePost(DataSet: TDataSet);
begin
  if not (qryCadModulosDescricao.Value <> '') then
    begin
      MessageDlg('Informe uma Descrição para o Modulo.',mtWarning,[mbOK],0);
      Abort;
    end;
end;

procedure TBancoDeDados.qryCadMovimentoEstoqueAfterInsert(DataSet: TDataSet);
begin
  qryCadMovimentoEstoqueidmovimento_estoque.Value := GeraSequenciador(qryCsSequenciador,'lanmovimento_estoque','idmovimento_estoque');
end;

procedure TBancoDeDados.qryCadMovimentoEstoqueBeforeDelete(DataSet: TDataSet);
begin
  if (MessageDlg('Deseja Excluir o registro?',mtWarning,[mbYes,mbNo],0) = mrNo) then
    Abort
  else
    begin
      ProcScripts.Script.Text := 'delete from lanmovimento_estoque_itens where idmovimento_estoque = ' +
        IntToStr(qryCadMovimentoEstoqueidmovimento_estoque.Value) + ';';
      ProcScripts.Execute;
    end;
end;

procedure TBancoDeDados.qryCadMovimentoEstoqueBeforePost(DataSet: TDataSet);
begin
  if not (qryCadMovimentoEstoqueidoperacao_estoque.Value > 0) then
    begin
      MessageDlg('Informe uma Operação de Estoque.',mtWarning,[mbOK],0);
      Abort;
    end
  else
    if (qryCadMovimentoEstoquetipo.IsNull) then
      begin
        MessageDlg('Informe um Tipo de Movimento de Estoque.',mtWarning,[mbOK],0);
        Abort;
      end;
  if (TipoOperacao = toInsere) then
    begin
      try
        GravaSequenciador(Conexao, 'lanmovimento_estoque', 'idmovimento_estoque', qryCadMovimentoEstoqueidmovimento_estoque.Value);
      except
        MessageDlg('Falha ao tentar gravar o numero seuquencial.'+#13+
            ' A operação será cancelada.',mtWarning,[mbOK],0);
        Abort;
      end;
    end;
end;

procedure TBancoDeDados.qryCadMovimentoEstoqueItensAfterInsert(
  DataSet: TDataSet);
begin
   qryCadMovimentoEstoqueItensquantidade.Value := 1;
end;

procedure TBancoDeDados.qryCadMovimentoEstoqueItensBeforeInsert(
  DataSet: TDataSet);
begin
  if not (qryCadMovimentoEstoque.State in [dsEdit, dsInsert]) then
    qryCadMovimentoEstoque.Edit;
  qryCadMovimentoEstoque.Post;
end;

procedure TBancoDeDados.qryCadMovimentoEstoqueItensBeforePost(
  DataSet: TDataSet);
begin
  qryCadMovimentoEstoqueItensidmovimento_estoque.Value := qryCadMovimentoEstoqueidmovimento_estoque.Value;
  if not ((qryCadMovimentoEstoqueItensidproduto.Value > 0)) then
    begin
      MessageDlg('Informe um Produto.',mtWarning,[mbOK],0);
      Abort;
    end;
end;

procedure TBancoDeDados.qryCadMovimentoEstoqueItensCalcFields(
  DataSet: TDataSet);
begin
  if (qryCadMovimentoEstoqueItenspreco_unitario.Value > 0) then
    qryCadMovimentoEstoqueItenscalc_total.Value := (qryCadMovimentoEstoqueItensquantidade.Value * qryCadMovimentoEstoqueItenspreco_unitario.Value)
  else
    qryCadMovimentoEstoqueItenscalc_total.Value := 0;
end;

procedure TBancoDeDados.qryCadOperacaoEstoqueBeforeDelete(DataSet: TDataSet);
begin
  if (MessageDlg('Deseja Excluir o registro?',mtWarning,[mbYes,mbNo],0) = mrNo) then
    Abort;
end;

procedure TBancoDeDados.qryCadOperacaoEstoqueBeforePost(DataSet: TDataSet);
begin
  if not (qryCadOperacaoEstoquedescricao.Value <> '') then
    begin
      MessageDlg('Informe uma Descrição para a Operação de Estoque.',mtWarning,[mbOK],0);
      Abort;
    end;
end;

procedure TBancoDeDados.qryCadParametrosBeforeDelete(DataSet: TDataSet);
begin
  if (MessageDlg('Deseja Excluir o registro?',mtWarning,[mbYes,mbNo],0) = mrNo) then
    Abort;
end;

procedure TBancoDeDados.qryCadParametrosBeforePost(DataSet: TDataSet);
begin
  if not (qryCadParametrosDescricao.Value <> '') then
    begin
      MessageDlg('Informe uma Descrição para o Modulo.',mtWarning,[mbOK],0);
      Abort;
    end
  else
    if not (qryCadParametrosidmodulo.Value > 0)  then
      begin
        MessageDlg('Informe uma Descrição para o Modulo.',mtWarning,[mbOK],0);
        Abort;
      end;    
end;

procedure TBancoDeDados.qryCadPrecoBeforePost(DataSet: TDataSet);
begin
  if not (qryCadPrecoidproduto.Value > 0) then
    begin
      MessageDlg('Erro ao gerar o preço do produto.',mtWarning,[mbOK],0);
      Abort;
    end;
end;

procedure TBancoDeDados.qryCadprodutoAfterInsert(DataSet: TDataSet);
begin
  qryCadprodutoidproduto.Value := GeraSequenciador(qryCsSequenciador, 'cadproduto', 'idproduto');
end;

procedure TBancoDeDados.qryCadprodutoBeforeDelete(DataSet: TDataSet);
begin
  if (MessageDlg('Deseja Excluir o registro?',mtWarning,[mbYes,mbNo],0) = mrNo) then
    Abort;
end;

procedure TBancoDeDados.qryCadprodutoBeforePost(DataSet: TDataSet);
begin
  if not (qryCadProdutodescricao.Value <> '') then
    begin
      MessageDlg('Informe uma Descrição para o Produto.',mtWarning,[mbOK],0);
      Abort;
    end
  else
    if (TipoOperacao = toInsere) then
      begin
        try
          GravaSequenciador(Conexao, 'cadproduto', 'idproduto', qryCadProdutoidproduto.Value);
        except
          MessageDlg('Falha ao tentar gravar o numero seuquencial.'+#13+
              ' A operação será cancelada.',mtWarning,[mbOK],0);
          Abort;
        end;
      end;
end;

procedure TBancoDeDados.qryCadprodutoCalcFields(DataSet: TDataSet);
begin
  qryCadProdutocalc_saldo_atual.value := 0;
  with qryCsPreco do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from cadpreco where idproduto = '+
        IntToStr(BancoDeDados.qryCadprodutoidproduto.Value));
      Open;
    end;
  if not (qryCsPreco.IsEmpty) then
    begin
      case qryCsPrecotipo.Value of
        0: qryCadprodutocalc_preco_atacado.Value := qryCsPrecoPRECO_VENDA.Value;
        1: qryCadprodutocalc_preco_varejo.Value := qryCsPrecoPRECO_VENDA.Value;
      end;
    end;  
end;

procedure TBancoDeDados.qryCadSubGrupoBeforeDelete(DataSet: TDataSet);
begin
  if (MessageDlg('Deseja Excluir o registro?',mtWarning,[mbYes,mbNo],0) = mrNo) then
    Abort;
end;

procedure TBancoDeDados.qryCadSubGrupoBeforePost(DataSet: TDataSet);
begin
  if not (qryCadSubGruponome.Value <> '') then
    begin
      MessageDlg('Informe um nome para o SubGrupo',mtWarning,[mbOK],0);
      Abort;
    end;
end;
procedure TBancoDeDados.qryCadUnidadeBeforeDelete(DataSet: TDataSet);
begin
  if (MessageDlg('Deseja Excluir o registro?',mtWarning,[mbYes,mbNo],0) = mrNo) then
    Abort;
end;

procedure TBancoDeDados.qryCadUnidadeBeforePost(DataSet: TDataSet);
begin
  if not (qryCadUnidadeabreviacao.Value <> '') then
    begin
      MessageDlg('Informe uma Abreviação para esta Unidade.',mtWarning,[mbOK],0);
      Abort;
    end;
end;

procedure TBancoDeDados.qryCadUnidadeEstoqueBeforeDelete(DataSet: TDataSet);
begin
  if (MessageDlg('Deseja Excluir o registro?',mtWarning,[mbYes,mbNo],0) = mrNo) then
    Abort;
end;

procedure TBancoDeDados.qryCadUnidadeEstoqueBeforePost(DataSet: TDataSet);
begin
  if not (qryCadUnidadeEstoquenome.Value <> '') then
    begin
      MessageDlg('Informe um Nome para a Unidade de Estoque.',mtWarning,[mbOK],0);
      Abort;
    end;
end;

procedure TBancoDeDados.qryCadUsuarioBeforeDelete(DataSet: TDataSet);
begin
  if (MessageDlg('Deseja Excluir o registro?',mtWarning,[mbYes,mbNo],0) = mrNo) then
    Abort;
end;

procedure TBancoDeDados.qryCsGrupoBeforeOpen(DataSet: TDataSet);
begin
  if (BancoDeDados.qryCadGrupo.State in [dsInsert]) then
    BancoDeDados.qryCadGrupo.Cancel
  else
    if (BancoDeDados.qryCadGrupo.State in [dsEdit]) then
      BancoDeDados.qryCadGrupo.Post;
end;

procedure TBancoDeDados.qryCsLocalizacaoCalcFields(DataSet: TDataSet);
begin
  if (qryCsLocalizacaoidProduto.Value > 0) then
    begin
      with qryCsProduto do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from cadproduto where idproduto = '+IntToStr(qryCsLocalizacaoidproduto.Value));
          Open;
        end;
      qryCsLocalizacaocalc_produto_descricao.Value := qryCsProdutodescricao.Value;
    end;
end;

procedure TBancoDeDados.qryCsProdutoCalcFields(DataSet: TDataSet);
begin
  qryCsProdutocalc_saldo_atual.value := 0;
end;

procedure TBancoDeDados.qryCsSubGrupoBeforeOpen(DataSet: TDataSet);
begin
  if (BancoDeDados.qryCadSubGrupo.State in [dsInsert]) then
    BancoDeDados.qryCadSubGrupo.Cancel
  else
    if (BancoDeDados.qryCadSubGrupo.State in [dsEdit]) then
      BancoDeDados.qryCadSubGrupo.Post;
end;

procedure TBancoDeDados.qryCsSubGrupoCalcFields(DataSet: TDataSet);
begin
  with qryCsGrupo do
    begin
        Close;
        SQL.Clear;
        SQL.Add('select * from cadgrupo where idgrupo = '+IntToStr(qryCsSubGrupoidgrupo.Value));
        Open;
    end;
  qryCsSubGrupocalcnome_grupo.Value := qryCsGruponome.Value;
end;

procedure TBancoDeDados.qryCsUnidadeCalcFields(DataSet: TDataSet);
begin
  if (qryCsUnidadetipo.Value = 0) then
    qryCsUnidadecalc_nome_tipo.Value := 'Compra'
  else
    qryCsUnidadecalc_nome_tipo.Value := 'Venda';
end;

end.
