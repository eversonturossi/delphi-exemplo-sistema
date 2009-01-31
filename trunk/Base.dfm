object BancoDeDados: TBancoDeDados
  OldCreateOrder = False
  Height = 722
  Width = 750
  object Conexao: TZConnection
    Protocol = 'postgresql'
    HostName = 'localhost'
    Port = 5432
    Database = 'MASTERSOFT'
    User = 'postgres'
    Password = 'foxtro'
    AutoCommit = False
    SQLHourGlass = True
    Left = 40
    Top = 16
  end
  object qryCsLogin: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadusuario')
    Params = <>
    Left = 40
    Top = 64
    object qryCsLoginidusuario: TIntegerField
      FieldName = 'idusuario'
      Required = True
      DisplayFormat = '000000'
    end
    object qryCsLoginlogin: TStringField
      FieldName = 'login'
      Required = True
      Size = 10
    end
    object qryCsLoginsenha: TStringField
      FieldName = 'senha'
      Required = True
      Size = 10
    end
  end
  object qryCsCliente: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadcliente')
    Params = <>
    Left = 40
    Top = 112
    object qryCsClienteidcliente: TIntegerField
      FieldName = 'idcliente'
      Required = True
    end
    object qryCsClienteativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCsClientetipo: TSmallintField
      FieldName = 'tipo'
    end
    object qryCsClientenome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 60
    end
    object qryCsClienterazao_social: TStringField
      FieldName = 'razao_social'
      Size = 60
    end
    object qryCsClientenome_fantasia: TStringField
      FieldName = 'nome_fantasia'
      Size = 60
    end
    object qryCsClienteendereco: TStringField
      FieldName = 'endereco'
      Size = 60
    end
    object qryCsClientenumero: TStringField
      FieldName = 'numero'
      Size = 10
    end
    object qryCsClientecomplemento: TStringField
      FieldName = 'complemento'
      Size = 25
    end
    object qryCsClientebairro: TStringField
      FieldName = 'bairro'
      Size = 40
    end
    object qryCsClientecidade: TStringField
      FieldName = 'cidade'
      Size = 40
    end
    object qryCsClienteestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryCsClientecep: TStringField
      FieldName = 'cep'
      Size = 8
    end
    object qryCsClientecaixa_postal: TStringField
      FieldName = 'caixa_postal'
      Size = 15
    end
    object qryCsClientetelefone_residencial: TStringField
      FieldName = 'telefone_residencial'
      Size = 25
    end
    object qryCsClientetelefone_comercial: TStringField
      FieldName = 'telefone_comercial'
      Size = 25
    end
    object qryCsClientetelefone_celular: TStringField
      FieldName = 'telefone_celular'
      Size = 25
    end
    object qryCsClientefax: TStringField
      FieldName = 'fax'
      Size = 25
    end
    object qryCsClienteemail: TStringField
      FieldName = 'email'
      Size = 40
    end
    object qryCsClientehomepage: TStringField
      FieldName = 'homepage'
      Size = 40
    end
    object qryCsClientecontato: TStringField
      FieldName = 'contato'
      Size = 40
    end
    object qryCsClienteinsc: TStringField
      FieldName = 'insc'
    end
    object qryCsClientecgc: TStringField
      FieldName = 'cgc'
      Size = 15
    end
    object qryCsClientecpf: TStringField
      FieldName = 'cpf'
      Size = 11
    end
    object qryCsClienterg: TStringField
      FieldName = 'rg'
      Size = 15
    end
    object qryCsClientetitulo_eleitor: TStringField
      FieldName = 'titulo_eleitor'
      Size = 15
    end
    object qryCsClientereservista_categoria: TStringField
      FieldName = 'reservista_categoria'
      Size = 10
    end
    object qryCsClientereservista_numero: TStringField
      FieldName = 'reservista_numero'
      Size = 15
    end
    object qryCsClientehabilitacao_numero: TStringField
      FieldName = 'habilitacao_numero'
      Size = 15
    end
    object qryCsClientehabilitacao_categoria: TStringField
      FieldName = 'habilitacao_categoria'
      Size = 2
    end
    object qryCsClientecarteira_trabalho: TStringField
      FieldName = 'carteira_trabalho'
      Size = 15
    end
    object qryCsClientesexo: TStringField
      FieldName = 'sexo'
      Size = 1
    end
    object qryCsClienteconjuge: TStringField
      FieldName = 'conjuge'
      Size = 60
    end
    object qryCsClientetipo_residencia: TSmallintField
      FieldName = 'tipo_residencia'
    end
    object qryCsClientetempo_residencia: TFloatField
      FieldName = 'tempo_residencia'
    end
    object qryCsClientevalor_aluguel: TFloatField
      FieldName = 'valor_aluguel'
    end
    object qryCsClientecartao_credido: TBooleanField
      FieldName = 'cartao_credido'
    end
    object qryCsClienteconta_bancaria: TBooleanField
      FieldName = 'conta_bancaria'
    end
    object qryCsClienteconta_numero: TStringField
      FieldName = 'conta_numero'
      Size = 15
    end
    object qryCsClienteconta_agencia: TStringField
      FieldName = 'conta_agencia'
      Size = 10
    end
    object qryCsClienteconta_operacao: TStringField
      FieldName = 'conta_operacao'
      Size = 5
    end
    object qryCsClientecobranca_informar: TBooleanField
      FieldName = 'cobranca_informar'
    end
    object qryCsClientecobranca_endereco: TStringField
      FieldName = 'cobranca_endereco'
      Size = 60
    end
    object qryCsClientecobranca_numero: TStringField
      FieldName = 'cobranca_numero'
      Size = 10
    end
    object qryCsClientecobranca_complemento: TStringField
      FieldName = 'cobranca_complemento'
      Size = 25
    end
    object qryCsClientecobranca_bairro: TStringField
      FieldName = 'cobranca_bairro'
      Size = 40
    end
    object qryCsClientecobranca_cidade: TStringField
      FieldName = 'cobranca_cidade'
      Size = 40
    end
    object qryCsClientecobranca_estado: TStringField
      FieldName = 'cobranca_estado'
      Size = 2
    end
    object qryCsClientecobranca_cep: TStringField
      FieldName = 'cobranca_cep'
      Size = 8
    end
    object qryCsClientecobranca_cxpostal: TStringField
      FieldName = 'cobranca_cxpostal'
      Size = 15
    end
    object qryCsClientedata_nascimento: TDateField
      FieldName = 'data_nascimento'
    end
    object qryCsClientedata_casamento: TDateField
      FieldName = 'data_casamento'
    end
    object qryCsClientedata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCsClienterg_uf: TStringField
      FieldName = 'rg_uf'
      Size = 2
    end
    object qryCsClienterg_orgao: TStringField
      FieldName = 'rg_orgao'
      Size = 10
    end
    object qryCsClientereferencia_comercial: TStringField
      FieldName = 'referencia_comercial'
      Size = 60
    end
    object qryCsClientereferencia_bancaria: TStringField
      FieldName = 'referencia_bancaria'
      Size = 60
    end
    object qryCsClientenaturalidade: TStringField
      FieldName = 'naturalidade'
      Size = 40
    end
    object qryCsClientenaturalidade_uf: TStringField
      FieldName = 'naturalidade_uf'
      Size = 2
    end
    object qryCsClientenacionalidade: TStringField
      FieldName = 'nacionalidade'
      Size = 40
    end
    object qryCsClienteescolaridade: TStringField
      FieldName = 'escolaridade'
      Size = 25
    end
    object qryCsClientedependentes: TIntegerField
      FieldName = 'dependentes'
    end
    object qryCsClientespc: TBooleanField
      FieldName = 'spc'
    end
    object qryCsClientespc_data: TDateField
      FieldName = 'spc_data'
    end
    object qryCsClienteserasa: TBooleanField
      FieldName = 'serasa'
    end
    object qryCsClienteserasa_data: TDateField
      FieldName = 'serasa_data'
    end
  end
  object DSqryCsCliente: TDataSource
    DataSet = qryCsCliente
    Left = 104
    Top = 112
  end
  object DSqryCadCliente: TDataSource
    DataSet = qryCadCliente
    Left = 104
    Top = 160
  end
  object qryCadCliente: TZQuery
    Connection = Conexao
    BeforePost = qryCadClienteBeforePost
    BeforeDelete = qryCadClienteBeforeDelete
    SQL.Strings = (
      'select * from cadcliente')
    Params = <>
    Left = 40
    Top = 160
    object qryCadClienteidcliente: TIntegerField
      FieldName = 'idcliente'
      Required = True
      DisplayFormat = '000000'
    end
    object qryCadClienteativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCadClientetipo: TSmallintField
      FieldName = 'tipo'
    end
    object qryCadClientenome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 60
    end
    object qryCadClienterazao_social: TStringField
      FieldName = 'razao_social'
      Size = 60
    end
    object qryCadClientenome_fantasia: TStringField
      FieldName = 'nome_fantasia'
      Size = 60
    end
    object qryCadClienteendereco: TStringField
      FieldName = 'endereco'
      Size = 60
    end
    object qryCadClientenumero: TStringField
      FieldName = 'numero'
      Size = 10
    end
    object qryCadClientecomplemento: TStringField
      FieldName = 'complemento'
      Size = 25
    end
    object qryCadClientebairro: TStringField
      FieldName = 'bairro'
      Size = 40
    end
    object qryCadClientecidade: TStringField
      FieldName = 'cidade'
      Size = 40
    end
    object qryCadClienteestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object qryCadClientecep: TStringField
      FieldName = 'cep'
      Size = 8
    end
    object qryCadClientecaixa_postal: TStringField
      FieldName = 'caixa_postal'
      Size = 15
    end
    object qryCadClientetelefone_residencial: TStringField
      FieldName = 'telefone_residencial'
      Size = 25
    end
    object qryCadClientetelefone_comercial: TStringField
      FieldName = 'telefone_comercial'
      Size = 25
    end
    object qryCadClientetelefone_celular: TStringField
      FieldName = 'telefone_celular'
      Size = 25
    end
    object qryCadClientefax: TStringField
      FieldName = 'fax'
      Size = 25
    end
    object qryCadClienteemail: TStringField
      FieldName = 'email'
      Size = 40
    end
    object qryCadClientehomepage: TStringField
      FieldName = 'homepage'
      Size = 40
    end
    object qryCadClientecontato: TStringField
      FieldName = 'contato'
      Size = 40
    end
    object qryCadClienteinsc: TStringField
      FieldName = 'insc'
    end
    object qryCadClientecgc: TStringField
      FieldName = 'cgc'
      Size = 15
    end
    object qryCadClientecpf: TStringField
      FieldName = 'cpf'
      Size = 11
    end
    object qryCadClienterg: TStringField
      FieldName = 'rg'
      Size = 15
    end
    object qryCadClientetitulo_eleitor: TStringField
      FieldName = 'titulo_eleitor'
      Size = 15
    end
    object qryCadClientereservista_categoria: TStringField
      FieldName = 'reservista_categoria'
      Size = 10
    end
    object qryCadClientereservista_numero: TStringField
      FieldName = 'reservista_numero'
      Size = 15
    end
    object qryCadClientehabilitacao_numero: TStringField
      FieldName = 'habilitacao_numero'
      Size = 15
    end
    object qryCadClientehabilitacao_categoria: TStringField
      FieldName = 'habilitacao_categoria'
      Size = 2
    end
    object qryCadClientecarteira_trabalho: TStringField
      FieldName = 'carteira_trabalho'
      Size = 15
    end
    object qryCadClientesexo: TStringField
      FieldName = 'sexo'
      Size = 1
    end
    object qryCadClienteconjuge: TStringField
      FieldName = 'conjuge'
      Size = 60
    end
    object qryCadClientetipo_residencia: TSmallintField
      FieldName = 'tipo_residencia'
    end
    object qryCadClientetempo_residencia: TFloatField
      FieldName = 'tempo_residencia'
    end
    object qryCadClientevalor_aluguel: TFloatField
      FieldName = 'valor_aluguel'
    end
    object qryCadClientecartao_credido: TBooleanField
      FieldName = 'cartao_credido'
    end
    object qryCadClienteconta_bancaria: TBooleanField
      FieldName = 'conta_bancaria'
    end
    object qryCadClienteconta_numero: TStringField
      FieldName = 'conta_numero'
      Size = 15
    end
    object qryCadClienteconta_agencia: TStringField
      FieldName = 'conta_agencia'
      Size = 10
    end
    object qryCadClienteconta_operacao: TStringField
      FieldName = 'conta_operacao'
      Size = 5
    end
    object qryCadClientecobranca_informar: TBooleanField
      FieldName = 'cobranca_informar'
    end
    object qryCadClientecobranca_endereco: TStringField
      FieldName = 'cobranca_endereco'
      Size = 60
    end
    object qryCadClientecobranca_numero: TStringField
      FieldName = 'cobranca_numero'
      Size = 10
    end
    object qryCadClientecobranca_complemento: TStringField
      FieldName = 'cobranca_complemento'
      Size = 25
    end
    object qryCadClientecobranca_bairro: TStringField
      FieldName = 'cobranca_bairro'
      Size = 40
    end
    object qryCadClientecobranca_cidade: TStringField
      FieldName = 'cobranca_cidade'
      Size = 40
    end
    object qryCadClientecobranca_estado: TStringField
      FieldName = 'cobranca_estado'
      Size = 2
    end
    object qryCadClientecobranca_cep: TStringField
      FieldName = 'cobranca_cep'
      Size = 8
    end
    object qryCadClientecobranca_cxpostal: TStringField
      FieldName = 'cobranca_cxpostal'
      Size = 15
    end
    object qryCadClientedata_nascimento: TDateField
      FieldName = 'data_nascimento'
    end
    object qryCadClientedata_casamento: TDateField
      FieldName = 'data_casamento'
    end
    object qryCadClientedata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCadClienterg_uf: TStringField
      FieldName = 'rg_uf'
      Size = 2
    end
    object qryCadClienterg_orgao: TStringField
      FieldName = 'rg_orgao'
      Size = 10
    end
    object qryCadClientereferencia_comercial: TStringField
      FieldName = 'referencia_comercial'
      Size = 60
    end
    object qryCadClientereferencia_bancaria: TStringField
      FieldName = 'referencia_bancaria'
      Size = 60
    end
    object qryCadClientenaturalidade: TStringField
      FieldName = 'naturalidade'
      Size = 40
    end
    object qryCadClientenaturalidade_uf: TStringField
      FieldName = 'naturalidade_uf'
      Size = 2
    end
    object qryCadClientenacionalidade: TStringField
      FieldName = 'nacionalidade'
      Size = 40
    end
    object qryCadClienteescolaridade: TStringField
      FieldName = 'escolaridade'
      Size = 25
    end
    object qryCadClientedependentes: TIntegerField
      FieldName = 'dependentes'
    end
    object qryCadClientespc: TBooleanField
      FieldName = 'spc'
    end
    object qryCadClientespc_data: TDateField
      FieldName = 'spc_data'
    end
    object qryCadClienteserasa: TBooleanField
      FieldName = 'serasa'
    end
    object qryCadClienteserasa_data: TDateField
      FieldName = 'serasa_data'
    end
  end
  object qryCsGrupo: TZReadOnlyQuery
    Connection = Conexao
    BeforeOpen = qryCsGrupoBeforeOpen
    SQL.Strings = (
      'select * from cadgrupo')
    Params = <>
    Left = 40
    Top = 208
    object qryCsGrupoidgrupo: TIntegerField
      FieldName = 'idgrupo'
      Required = True
      DisplayFormat = '000000'
    end
    object qryCsGruponome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryCsGrupoativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCsGrupodata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
  end
  object DSqryCsGrupo: TDataSource
    DataSet = qryCsGrupo
    Left = 104
    Top = 208
  end
  object DSqryCadGrupo: TDataSource
    DataSet = qryCadGrupo
    Left = 104
    Top = 254
  end
  object qryCadGrupo: TZQuery
    Connection = Conexao
    BeforePost = qryCadGrupoBeforePost
    BeforeDelete = qryCadGrupoBeforeDelete
    SQL.Strings = (
      'select * from cadgrupo')
    Params = <>
    Left = 40
    Top = 256
    object qryCadGrupoidgrupo: TIntegerField
      FieldName = 'idgrupo'
      DisplayFormat = '000000'
    end
    object qryCadGruponome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryCadGrupoativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCadGrupodata_cadastro: TDateField
      FieldName = 'data_cadastro'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object qryCsSubGrupo: TZReadOnlyQuery
    Connection = Conexao
    BeforeOpen = qryCsSubGrupoBeforeOpen
    OnCalcFields = qryCsSubGrupoCalcFields
    SQL.Strings = (
      'select * from cadsubgrupo')
    Params = <>
    Left = 40
    Top = 304
    object qryCsSubGrupoidsubgrupo: TIntegerField
      FieldName = 'idsubgrupo'
      Required = True
      DisplayFormat = '000000'
    end
    object qryCsSubGruponome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryCsSubGrupoidgrupo: TIntegerField
      FieldName = 'idgrupo'
    end
    object qryCsSubGrupoativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCsSubGrupocalcnome_grupo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcnome_grupo'
      Calculated = True
    end
    object qryCsSubGrupodata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
  end
  object DSqryCsSubGrupo: TDataSource
    DataSet = qryCsSubGrupo
    Left = 104
    Top = 304
  end
  object qryCadSubGrupo: TZQuery
    Connection = Conexao
    BeforePost = qryCadSubGrupoBeforePost
    BeforeDelete = qryCadSubGrupoBeforeDelete
    SQL.Strings = (
      'select * from cadsubgrupo')
    Params = <>
    Left = 40
    Top = 352
    object qryCadSubGrupoidsubgrupo: TIntegerField
      FieldName = 'idsubgrupo'
      DisplayFormat = '000000'
    end
    object qryCadSubGruponome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryCadSubGrupoidgrupo: TIntegerField
      FieldName = 'idgrupo'
    end
    object qryCadSubGrupoativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCadSubGrupodata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
  end
  object DSqryCadSubGrupo: TDataSource
    DataSet = qryCadSubGrupo
    Left = 104
    Top = 352
  end
  object qryCsFornecedor: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadfornecedor')
    Params = <>
    Left = 40
    Top = 400
    object qryCsFornecedoridfornecedor: TIntegerField
      FieldName = 'idfornecedor'
      Required = True
      DisplayFormat = '000000'
    end
    object qryCsFornecedorativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCsFornecedorrazao_social: TStringField
      FieldName = 'razao_social'
      Size = 60
    end
    object qryCsFornecedornome_fantasia: TStringField
      FieldName = 'nome_fantasia'
      Size = 60
    end
    object qryCsFornecedorinsc: TStringField
      FieldName = 'insc'
      Size = 15
    end
    object qryCsFornecedorcgc: TStringField
      FieldName = 'cgc'
      Size = 15
    end
    object qryCsFornecedorcpf: TStringField
      FieldName = 'cpf'
      Size = 11
    end
    object qryCsFornecedorendereco: TStringField
      FieldName = 'endereco'
      Size = 60
    end
    object qryCsFornecedornumero: TStringField
      FieldName = 'numero'
      Size = 10
    end
    object qryCsFornecedorcomplemento: TStringField
      FieldName = 'complemento'
      Size = 25
    end
    object qryCsFornecedorbairro: TStringField
      FieldName = 'bairro'
      Size = 40
    end
    object qryCsFornecedorcidade: TStringField
      FieldName = 'cidade'
      Size = 40
    end
    object qryCsFornecedoruf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object qryCsFornecedorcep: TStringField
      FieldName = 'cep'
      Size = 8
    end
    object qryCsFornecedorcaixa_postal: TStringField
      FieldName = 'caixa_postal'
      Size = 15
    end
    object qryCsFornecedortelefone_residencial: TStringField
      FieldName = 'telefone_residencial'
      Size = 25
    end
    object qryCsFornecedortelefone_comercial: TStringField
      FieldName = 'telefone_comercial'
      Size = 25
    end
    object qryCsFornecedortelefone_celular: TStringField
      FieldName = 'telefone_celular'
      Size = 25
    end
    object qryCsFornecedortelefone_fax: TStringField
      FieldName = 'telefone_fax'
      Size = 25
    end
    object qryCsFornecedoremail: TStringField
      FieldName = 'email'
      Size = 40
    end
    object qryCsFornecedorhomepage: TStringField
      FieldName = 'homepage'
      Size = 40
    end
    object qryCsFornecedorcontato: TStringField
      FieldName = 'contato'
      Size = 40
    end
    object qryCsFornecedorlimite_compra: TFloatField
      FieldName = 'limite_compra'
    end
    object qryCsFornecedordata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
  end
  object DSqryCsFornecedor: TDataSource
    DataSet = qryCsFornecedor
    Left = 104
    Top = 401
  end
  object qryCadFornecedor: TZQuery
    Connection = Conexao
    BeforePost = qryCadFornecedorBeforePost
    BeforeDelete = qryCadFornecedorBeforeDelete
    SQL.Strings = (
      'select * from cadfornecedor')
    Params = <>
    Left = 40
    Top = 448
    object qryCadFornecedoridfornecedor: TIntegerField
      FieldName = 'idfornecedor'
      DisplayFormat = '000000'
    end
    object qryCadFornecedorativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCadFornecedorrazao_social: TStringField
      FieldName = 'razao_social'
      Size = 60
    end
    object qryCadFornecedornome_fantasia: TStringField
      FieldName = 'nome_fantasia'
      Size = 60
    end
    object qryCadFornecedorinsc: TStringField
      FieldName = 'insc'
      Size = 15
    end
    object qryCadFornecedorcgc: TStringField
      FieldName = 'cgc'
      Size = 15
    end
    object qryCadFornecedorcpf: TStringField
      FieldName = 'cpf'
      Size = 11
    end
    object qryCadFornecedorendereco: TStringField
      FieldName = 'endereco'
      Size = 60
    end
    object qryCadFornecedornumero: TStringField
      FieldName = 'numero'
      Size = 10
    end
    object qryCadFornecedorcomplemento: TStringField
      FieldName = 'complemento'
      Size = 25
    end
    object qryCadFornecedorbairro: TStringField
      FieldName = 'bairro'
      Size = 40
    end
    object qryCadFornecedorcidade: TStringField
      FieldName = 'cidade'
      Size = 40
    end
    object qryCadFornecedoruf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object qryCadFornecedorcep: TStringField
      FieldName = 'cep'
      Size = 8
    end
    object qryCadFornecedorcaixa_postal: TStringField
      FieldName = 'caixa_postal'
      Size = 15
    end
    object qryCadFornecedortelefone_residencial: TStringField
      FieldName = 'telefone_residencial'
      Size = 25
    end
    object qryCadFornecedortelefone_comercial: TStringField
      FieldName = 'telefone_comercial'
      Size = 25
    end
    object qryCadFornecedortelefone_celular: TStringField
      FieldName = 'telefone_celular'
      Size = 25
    end
    object qryCadFornecedortelefone_fax: TStringField
      FieldName = 'telefone_fax'
      Size = 25
    end
    object qryCadFornecedoremail: TStringField
      FieldName = 'email'
      Size = 40
    end
    object qryCadFornecedorhomepage: TStringField
      FieldName = 'homepage'
      Size = 40
    end
    object qryCadFornecedorcontato: TStringField
      FieldName = 'contato'
      Size = 40
    end
    object qryCadFornecedorlimite_compra: TFloatField
      FieldName = 'limite_compra'
      DisplayFormat = ',0.00'
    end
    object qryCadFornecedordata_cadastro: TDateField
      FieldName = 'data_cadastro'
      DisplayFormat = '00/00/0000'
    end
    object qryCadFornecedortipo: TSmallintField
      FieldName = 'tipo'
    end
    object qryCadFornecedorpreferencial: TBooleanField
      FieldName = 'preferencial'
    end
    object qryCadFornecedorultima_compra: TDateField
      FieldName = 'ultima_compra'
      DisplayFormat = '00/00/0000'
    end
  end
  object DSqryCadFornecedor: TDataSource
    DataSet = qryCadFornecedor
    Left = 104
    Top = 448
  end
  object qryCsProduto: TZReadOnlyQuery
    Connection = Conexao
    OnCalcFields = qryCsProdutoCalcFields
    SQL.Strings = (
      'select * from cadproduto')
    Params = <>
    Left = 40
    Top = 496
    object qryCsProdutoativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCsProdutodata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCsProdutodescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object qryCsProdutodescricao_reduzida: TStringField
      FieldName = 'descricao_reduzida'
      Size = 25
    end
    object qryCsProdutoidgrupo: TIntegerField
      FieldName = 'idgrupo'
      DisplayFormat = '000000'
    end
    object qryCsProdutoidsubgrupo: TIntegerField
      FieldName = 'idsubgrupo'
      DisplayFormat = '000000'
    end
    object qryCsProdutoidfornecedor: TIntegerField
      FieldName = 'idfornecedor'
      DisplayFormat = '000000'
    end
    object qryCsProdutounidade_compra: TStringField
      FieldName = 'unidade_compra'
      Size = 5
    end
    object qryCsProdutoidclassificacao: TIntegerField
      FieldName = 'idclassificacao'
      DisplayFormat = '000000'
    end
    object qryCsProdutoidlocalizacao: TIntegerField
      FieldName = 'idlocalizacao'
      DisplayFormat = '000000'
    end
    object qryCsProdutost: TIntegerField
      FieldName = 'st'
    end
    object qryCsProdutoecf: TIntegerField
      FieldName = 'ecf'
    end
    object qryCsProdutoperc_ipi: TFloatField
      FieldName = 'perc_ipi'
      DisplayFormat = ',0.00 %'
    end
    object qryCsProdutoperc_frete: TFloatField
      FieldName = 'perc_frete'
      DisplayFormat = ',0.00 %'
    end
    object qryCsProdutovl_frete: TFloatField
      FieldName = 'vl_frete'
      DisplayFormat = ',0.00'
    end
    object qryCsProdutosaldo_minimo: TFloatField
      FieldName = 'saldo_minimo'
      DisplayFormat = ',0.00'
    end
    object qryCsProdutopeso_bruto: TFloatField
      FieldName = 'peso_bruto'
    end
    object qryCsProdutopeso_liquido: TFloatField
      FieldName = 'peso_liquido'
    end
    object qryCsProdutounidade_venda: TStringField
      FieldName = 'unidade_venda'
      Size = 5
    end
    object qryCsProdutoperc_comissao: TFloatField
      FieldName = 'perc_comissao'
      DisplayFormat = ',0.00 %'
    end
    object qryCsProdutovl_comissao: TFloatField
      FieldName = 'vl_comissao'
      DisplayFormat = ',0.00'
    end
    object qryCsProdutoperc_desconto: TFloatField
      FieldName = 'perc_desconto'
      DisplayFormat = ',0.00 %'
    end
    object qryCsProdutovl_desconto: TFloatField
      FieldName = 'vl_desconto'
      DisplayFormat = ',0.00'
    end
    object qryCsProdutoperc_pis: TFloatField
      FieldName = 'perc_pis'
      DisplayFormat = ',0.00 %'
    end
    object qryCsProdutoperc_cofins: TFloatField
      FieldName = 'perc_cofins'
      DisplayFormat = ',0.00 %'
    end
    object qryCsProdutoperc_tva: TFloatField
      FieldName = 'perc_tva'
      DisplayFormat = ',0.00 %'
    end
    object qryCsProdutoperc_icms_interno: TFloatField
      FieldName = 'perc_icms_interno'
      DisplayFormat = ',0.00 %'
    end
    object qryCsProdutoperc_icms_externo: TFloatField
      FieldName = 'perc_icms_externo'
      DisplayFormat = ',0.00 %'
    end
    object qryCsProdutoperc_icms_substituicao: TFloatField
      FieldName = 'perc_icms_substituicao'
      DisplayFormat = ',0.00 %'
    end
    object qryCsProdutoperc_custo_fixo: TFloatField
      FieldName = 'perc_custo_fixo'
      DisplayFormat = ',0.00 %'
    end
    object qryCsProdutoperc_outros_impostos: TFloatField
      FieldName = 'perc_outros_impostos'
      DisplayFormat = ',0.00 %'
    end
    object qryCsProdutovl_custo_fixo: TFloatField
      FieldName = 'vl_custo_fixo'
      DisplayFormat = ',0.00'
    end
    object qryCsProdutocalc_saldo_atual: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_saldo_atual'
      Calculated = True
    end
    object qryCsProdutoreferencia: TStringField
      FieldName = 'referencia'
      Size = 25
    end
    object qryCsProdutoidproduto: TLargeintField
      FieldName = 'idproduto'
      DisplayFormat = '000000'
    end
  end
  object qryCadproduto: TZQuery
    Connection = Conexao
    OnCalcFields = qryCadprodutoCalcFields
    AfterInsert = qryCadprodutoAfterInsert
    BeforePost = qryCadprodutoBeforePost
    BeforeDelete = qryCadprodutoBeforeDelete
    SQL.Strings = (
      'select * from cadproduto')
    Params = <>
    Left = 40
    Top = 544
    object qryCadprodutoativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCadprodutodata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCadprodutodescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object qryCadprodutodescricao_reduzida: TStringField
      FieldName = 'descricao_reduzida'
      Size = 25
    end
    object qryCadprodutoidgrupo: TIntegerField
      FieldName = 'idgrupo'
      DisplayFormat = '000000'
    end
    object qryCadprodutoidsubgrupo: TIntegerField
      FieldName = 'idsubgrupo'
      DisplayFormat = '000000'
    end
    object qryCadprodutoidfornecedor: TIntegerField
      FieldName = 'idfornecedor'
      DisplayFormat = '000000'
    end
    object qryCadprodutounidade_compra: TStringField
      FieldName = 'unidade_compra'
      Size = 5
    end
    object qryCadprodutoidlocalizacao: TIntegerField
      FieldName = 'idlocalizacao'
      DisplayFormat = '000000'
    end
    object qryCadprodutost: TIntegerField
      FieldName = 'st'
    end
    object qryCadprodutoecf: TIntegerField
      FieldName = 'ecf'
    end
    object qryCadprodutoperc_ipi: TFloatField
      FieldName = 'perc_ipi'
      DisplayFormat = ',0.00 %'
    end
    object qryCadprodutoperc_frete: TFloatField
      FieldName = 'perc_frete'
      DisplayFormat = ',0.00 %'
    end
    object qryCadprodutoidclassificacao: TIntegerField
      FieldName = 'idclassificacao'
      DisplayFormat = '000000'
    end
    object qryCadprodutovl_frete: TFloatField
      FieldName = 'vl_frete'
      DisplayFormat = ',0.00'
    end
    object qryCadprodutosaldo_minimo: TFloatField
      FieldName = 'saldo_minimo'
      DisplayFormat = ',0.00'
    end
    object qryCadprodutopeso_bruto: TFloatField
      FieldName = 'peso_bruto'
    end
    object qryCadprodutopeso_liquido: TFloatField
      FieldName = 'peso_liquido'
    end
    object qryCadprodutounidade_venda: TStringField
      FieldName = 'unidade_venda'
      Size = 5
    end
    object qryCadprodutoperc_comissao: TFloatField
      FieldName = 'perc_comissao'
      DisplayFormat = ',0.00 %'
    end
    object qryCadprodutovl_comissao: TFloatField
      FieldName = 'vl_comissao'
      DisplayFormat = ',0.00'
    end
    object qryCadprodutoperc_desconto: TFloatField
      FieldName = 'perc_desconto'
      DisplayFormat = ',0.00 %'
    end
    object qryCadprodutovl_desconto: TFloatField
      FieldName = 'vl_desconto'
      DisplayFormat = ',0.00'
    end
    object qryCadprodutoperc_pis: TFloatField
      FieldName = 'perc_pis'
      DisplayFormat = ',0.00 %'
    end
    object qryCadprodutoperc_cofins: TFloatField
      FieldName = 'perc_cofins'
      DisplayFormat = ',0.00 %'
    end
    object qryCadprodutoperc_tva: TFloatField
      FieldName = 'perc_tva'
      DisplayFormat = ',0.00 %'
    end
    object qryCadprodutoperc_icms_interno: TFloatField
      FieldName = 'perc_icms_interno'
      DisplayFormat = ',0.00 %'
    end
    object qryCadprodutoperc_icms_externo: TFloatField
      FieldName = 'perc_icms_externo'
      DisplayFormat = ',0.00 %'
    end
    object qryCadprodutoperc_icms_substituicao: TFloatField
      FieldName = 'perc_icms_substituicao'
      DisplayFormat = ',0.00 %'
    end
    object qryCadprodutocalc_nome_grupo: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nome_grupo'
      LookupDataSet = qryCsGrupo
      LookupKeyFields = 'idgrupo'
      LookupResultField = 'nome'
      KeyFields = 'idgrupo'
      Lookup = True
    end
    object qryCadprodutocalc_nome_subgrupo: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nome_subgrupo'
      LookupDataSet = qryCsSubGrupo
      LookupKeyFields = 'idsubgrupo'
      LookupResultField = 'nome'
      KeyFields = 'idsubgrupo'
      Lookup = True
    end
    object qryCadprodutocalc_nome_fornecedor: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nome_fornecedor'
      LookupDataSet = qryCsFornecedor
      LookupKeyFields = 'idfornecedor'
      LookupResultField = 'razao_social'
      KeyFields = 'idfornecedor'
      Lookup = True
    end
    object qryCadprodutocalc_nome_classificacao: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nome_classificacao'
      LookupDataSet = qryCsClassificacao
      LookupKeyFields = 'idclassificacao'
      LookupResultField = 'descricao'
      KeyFields = 'idclassificacao'
      Lookup = True
    end
    object qryCadprodutoperc_custo_fixo: TFloatField
      FieldName = 'perc_custo_fixo'
      DisplayFormat = ',0.00 %'
    end
    object qryCadprodutoperc_outros_impostos: TFloatField
      FieldName = 'perc_outros_impostos'
      DisplayFormat = ',0.00 %'
    end
    object qryCadprodutovl_custo_fixo: TFloatField
      FieldName = 'vl_custo_fixo'
      DisplayFormat = ',0.00'
    end
    object qryCadprodutocalc_preco_atacado: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_preco_atacado'
      Calculated = True
    end
    object qryCadprodutocalc_preco_varejo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_preco_varejo'
      Calculated = True
    end
    object qryCadprodutocalc_saldo_atual: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_saldo_atual'
      Calculated = True
    end
    object qryCadprodutoreferencia: TStringField
      FieldName = 'referencia'
      Size = 25
    end
    object qryCadprodutoidproduto: TLargeintField
      FieldName = 'idproduto'
      DisplayFormat = '000000'
    end
  end
  object DSqryCsProduto: TDataSource
    DataSet = qryCsProduto
    Left = 104
    Top = 496
  end
  object DSqryCadProduto: TDataSource
    DataSet = qryCadproduto
    Left = 104
    Top = 544
  end
  object qryCadLocalizacao: TZQuery
    Connection = Conexao
    BeforePost = qryCadLocalizacaoBeforePost
    BeforeDelete = qryCadLocalizacaoBeforeDelete
    SQL.Strings = (
      'select * from cadlocalizacao')
    Params = <>
    Left = 216
    Top = 56
    object qryCadLocalizacaoidlocalizacao: TIntegerField
      FieldName = 'idlocalizacao'
      DisplayFormat = '000000'
    end
    object qryCadLocalizacaoativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCadLocalizacaodata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCadLocalizacaocorredor: TStringField
      FieldName = 'corredor'
      Size = 5
    end
    object qryCadLocalizacaoestante: TStringField
      FieldName = 'estante'
      Size = 5
    end
    object qryCadLocalizacaoprateleira: TStringField
      FieldName = 'prateleira'
      Size = 5
    end
    object qryCadLocalizacaobandeja: TStringField
      FieldName = 'bandeja'
      Size = 5
    end
    object qryCadLocalizacaoidunidadeestoque: TIntegerField
      FieldName = 'idunidadeestoque'
      DisplayFormat = '000000'
    end
    object qryCadLocalizacaoidproduto: TIntegerField
      FieldName = 'idproduto'
      DisplayFormat = '000000'
    end
    object qryCadLocalizacaocalc_nome_produtodescricao: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nome_produtodescricao'
      LookupDataSet = qryCadproduto
      LookupKeyFields = 'idproduto'
      LookupResultField = 'descricao'
      KeyFields = 'idproduto'
      Lookup = True
    end
    object qryCadLocalizacaocalc_nome_unidadeestoque: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nome_unidadeestoque'
      LookupDataSet = qryCsUnidadeEstoque
      LookupKeyFields = 'idunidadeestoque'
      LookupResultField = 'nome'
      KeyFields = 'idunidadeestoque'
      Lookup = True
    end
  end
  object DSqryCsLocalizacao: TDataSource
    DataSet = qryCsLocalizacao
    Left = 280
    Top = 8
  end
  object DSqryCadLocalizacao: TDataSource
    DataSet = qryCadLocalizacao
    Left = 280
    Top = 56
  end
  object qryCsUnidadeEstoque: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadunidade_estoque')
    Params = <>
    Left = 216
    Top = 104
    object qryCsUnidadeEstoqueidunidadeestoque: TIntegerField
      FieldName = 'idunidadeestoque'
      Required = True
      DisplayFormat = '000000'
    end
    object qryCsUnidadeEstoqueativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCsUnidadeEstoquedata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCsUnidadeEstoquenome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object qryCsUnidadeEstoqueendereco: TStringField
      FieldName = 'endereco'
      Size = 60
    end
    object qryCsUnidadeEstoquenumero: TStringField
      FieldName = 'numero'
      Size = 10
    end
    object qryCsUnidadeEstoquecomplemento: TStringField
      FieldName = 'complemento'
      Size = 25
    end
    object qryCsUnidadeEstoquebairro: TStringField
      FieldName = 'bairro'
      Size = 40
    end
    object qryCsUnidadeEstoquecidade: TStringField
      FieldName = 'cidade'
      Size = 40
    end
    object qryCsUnidadeEstoqueuf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object qryCsUnidadeEstoquecep: TStringField
      FieldName = 'cep'
      Size = 8
    end
    object qryCsUnidadeEstoqueidentificador: TStringField
      FieldName = 'identificador'
      Size = 5
    end
  end
  object qryCadUnidadeEstoque: TZQuery
    Connection = Conexao
    BeforePost = qryCadUnidadeEstoqueBeforePost
    BeforeDelete = qryCadUnidadeEstoqueBeforeDelete
    SQL.Strings = (
      'select * from cadunidade_estoque')
    Params = <>
    Left = 216
    Top = 152
    object qryCadUnidadeEstoqueidunidadeestoque: TIntegerField
      FieldName = 'idunidadeestoque'
      DisplayFormat = '000000'
    end
    object qryCadUnidadeEstoqueativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCadUnidadeEstoquedata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCadUnidadeEstoquenome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object qryCadUnidadeEstoqueendereco: TStringField
      FieldName = 'endereco'
      Size = 60
    end
    object qryCadUnidadeEstoquenumero: TStringField
      FieldName = 'numero'
      Size = 10
    end
    object qryCadUnidadeEstoquecomplemento: TStringField
      FieldName = 'complemento'
      Size = 25
    end
    object qryCadUnidadeEstoquebairro: TStringField
      FieldName = 'bairro'
      Size = 40
    end
    object qryCadUnidadeEstoquecidade: TStringField
      FieldName = 'cidade'
      Size = 40
    end
    object qryCadUnidadeEstoqueuf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object qryCadUnidadeEstoquecep: TStringField
      FieldName = 'cep'
      Size = 8
    end
    object qryCadUnidadeEstoqueidentificador: TStringField
      FieldName = 'identificador'
      Size = 5
    end
  end
  object DSqryCsUnidadeEstoque: TDataSource
    DataSet = qryCsUnidadeEstoque
    Left = 280
    Top = 104
  end
  object DSqryCadUnidadeEstoque: TDataSource
    DataSet = qryCadUnidadeEstoque
    Left = 280
    Top = 152
  end
  object qryCsClassificacao: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadclassificacao')
    Params = <>
    Left = 216
    Top = 200
    object qryCsClassificacaoidclassificacao: TIntegerField
      FieldName = 'idclassificacao'
      Required = True
      DisplayFormat = '000000'
    end
    object qryCsClassificacaoativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCsClassificacaodata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCsClassificacaodescricao: TStringField
      FieldName = 'descricao'
      Size = 25
    end
  end
  object qryCadClassificacao: TZQuery
    Connection = Conexao
    BeforePost = qryCadClassificacaoBeforePost
    BeforeDelete = qryCadClassificacaoBeforeDelete
    SQL.Strings = (
      'select * from cadclassificacao')
    Params = <>
    Left = 216
    Top = 248
    object qryCadClassificacaoidclassificacao: TIntegerField
      FieldName = 'idclassificacao'
      DisplayFormat = '000000'
    end
    object qryCadClassificacaoativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCadClassificacaodata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCadClassificacaodescricao: TStringField
      FieldName = 'descricao'
      Size = 25
    end
  end
  object DSqryCsClassificacao: TDataSource
    DataSet = qryCsClassificacao
    Left = 280
    Top = 200
  end
  object DSqryCadClassificacao: TDataSource
    DataSet = qryCadClassificacao
    Left = 280
    Top = 248
  end
  object qryCsProdutoFornecedor: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadproduto_fornecedor')
    Params = <>
    Left = 216
    Top = 288
    object qryCsProdutoFornecedoridprodutofornecedor: TIntegerField
      FieldName = 'idprodutofornecedor'
      Required = True
      DisplayFormat = '000000'
    end
    object qryCsProdutoFornecedoridproduto: TIntegerField
      FieldName = 'idproduto'
      DisplayFormat = '000000'
    end
    object qryCsProdutoFornecedoridfornecedor: TIntegerField
      FieldName = 'idfornecedor'
      DisplayFormat = '000000'
    end
    object qryCsProdutoFornecedordata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCsProdutoFornecedorcalc_nome_razaosocial: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nome_razaosocial'
      LookupDataSet = qryCsFornecedor
      LookupKeyFields = 'idfornecedor'
      LookupResultField = 'razao_social'
      KeyFields = 'idfornecedor'
      Lookup = True
    end
    object qryCsProdutoFornecedorcalc_nome_nomefantasia: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nome_nomefantasia'
      LookupDataSet = qryCsFornecedor
      LookupKeyFields = 'idfornecedor'
      LookupResultField = 'nome_fantasia'
      KeyFields = 'idfornecedor'
      Lookup = True
    end
  end
  object DSqryCsProdutoFornecedor: TDataSource
    DataSet = qryCsProdutoFornecedor
    Left = 280
    Top = 288
  end
  object ProcScripts: TZSQLProcessor
    Params = <>
    Connection = Conexao
    Delimiter = ';'
    Left = 96
    Top = 16
  end
  object qryCsUnidade: TZReadOnlyQuery
    Connection = Conexao
    OnCalcFields = qryCsUnidadeCalcFields
    SQL.Strings = (
      'select * from cadunidade')
    Params = <>
    Left = 216
    Top = 344
    object qryCsUnidadeidunidade: TIntegerField
      FieldName = 'idunidade'
      Required = True
      DisplayFormat = '000000'
    end
    object qryCsUnidadedescricao: TStringField
      FieldName = 'descricao'
      Size = 25
    end
    object qryCsUnidadeabreviacao: TStringField
      FieldName = 'abreviacao'
      Size = 5
    end
    object qryCsUnidadedata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCsUnidadetipo: TSmallintField
      FieldName = 'tipo'
    end
    object qryCsUnidadecalc_nome_tipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nome_tipo'
      Calculated = True
    end
  end
  object qryCadUnidade: TZQuery
    Connection = Conexao
    BeforePost = qryCadUnidadeBeforePost
    BeforeDelete = qryCadUnidadeBeforeDelete
    SQL.Strings = (
      'select * from cadunidade')
    Params = <>
    Left = 216
    Top = 392
    object qryCadUnidadeidunidade: TIntegerField
      FieldName = 'idunidade'
      DisplayFormat = '000000'
    end
    object qryCadUnidadedescricao: TStringField
      FieldName = 'descricao'
      Size = 25
    end
    object qryCadUnidadeabreviacao: TStringField
      FieldName = 'abreviacao'
      Size = 5
    end
    object qryCadUnidadedata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCadUnidadetipo: TSmallintField
      FieldName = 'tipo'
    end
  end
  object DSqryCsUnidade: TDataSource
    DataSet = qryCsUnidade
    Left = 280
    Top = 344
  end
  object DSqryCadUnidade: TDataSource
    DataSet = qryCadUnidade
    Left = 280
    Top = 392
  end
  object qryCsPreco: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadpreco')
    Params = <>
    Left = 216
    Top = 447
    object qryCsPrecoativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCsPrecodata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCsPrecotipo: TSmallintField
      FieldName = 'tipo'
    end
    object qryCsPrecoidproduto: TIntegerField
      FieldName = 'idproduto'
      DisplayFormat = '000000'
    end
    object qryCsPrecopreco_custo: TFloatField
      FieldName = 'preco_custo'
      DisplayFormat = ',0.00'
    end
    object qryCsPrecoperc_margem_lucro: TFloatField
      FieldName = 'perc_margem_lucro'
      DisplayFormat = ',0.00 %'
    end
    object qryCsPrecoperc_icms_interno: TFloatField
      FieldName = 'perc_icms_interno'
      DisplayFormat = ',0.00 %'
    end
    object qryCsPrecoperc_icms_externo: TFloatField
      FieldName = 'perc_icms_externo'
      DisplayFormat = ',0.00 %'
    end
    object qryCsPrecoperc_icms_substituicao: TFloatField
      FieldName = 'perc_icms_substituicao'
      DisplayFormat = ',0.00 %'
    end
    object qryCsPrecoperc_ipi: TFloatField
      FieldName = 'perc_ipi'
      DisplayFormat = ',0.00 %'
    end
    object qryCsPrecoperc_tva: TFloatField
      FieldName = 'perc_tva'
      DisplayFormat = ',0.00 %'
    end
    object qryCsPrecoperc_pis: TFloatField
      FieldName = 'perc_pis'
      DisplayFormat = ',0.00 %'
    end
    object qryCsPrecoperc_cofins: TFloatField
      FieldName = 'perc_cofins'
      DisplayFormat = ',0.00 %'
    end
    object qryCsPrecoperc_outros_impostos: TFloatField
      FieldName = 'perc_outros_impostos'
      DisplayFormat = ',0.00 %'
    end
    object qryCsPrecoperc_comissao: TFloatField
      FieldName = 'perc_comissao'
      DisplayFormat = ',0.00 %'
    end
    object qryCsPrecoperc_desconto: TFloatField
      FieldName = 'perc_desconto'
      DisplayFormat = ',0.00 %'
    end
    object qryCsPrecoperc_frete: TFloatField
      FieldName = 'perc_frete'
      DisplayFormat = ',0.00 %'
    end
    object qryCsPrecoperc_custo_fixo: TFloatField
      FieldName = 'perc_custo_fixo'
      DisplayFormat = ',0.00 %'
    end
    object qryCsPrecovl_margem_lucro: TFloatField
      FieldName = 'vl_margem_lucro'
      DisplayFormat = ',0.00'
    end
    object qryCsPrecovl_comissao: TFloatField
      FieldName = 'vl_comissao'
      DisplayFormat = ',0.00'
    end
    object qryCsPrecovl_desconto: TFloatField
      FieldName = 'vl_desconto'
      DisplayFormat = ',0.00'
    end
    object qryCsPrecovl_frete: TFloatField
      FieldName = 'vl_frete'
      DisplayFormat = ',0.00'
    end
    object qryCsPrecovl_custo_fixo: TFloatField
      FieldName = 'vl_custo_fixo'
      DisplayFormat = ',0.00'
    end
    object qryCsPrecopreco_sugerido: TFloatField
      FieldName = 'preco_sugerido'
      DisplayFormat = ',0.00'
    end
    object qryCsPrecopreco_venda: TFloatField
      FieldName = 'preco_venda'
      DisplayFormat = ',0.00'
    end
    object qryCsPrecoidpreco: TLargeintField
      FieldName = 'idpreco'
      Required = True
      DisplayFormat = '000000'
    end
  end
  object qryCadPreco: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadpreco')
    Params = <>
    Left = 216
    Top = 496
    object qryCadPrecoativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCadPrecodata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCadPrecotipo: TSmallintField
      FieldName = 'tipo'
    end
    object qryCadPrecoidproduto: TIntegerField
      FieldName = 'idproduto'
      DisplayFormat = '000000'
    end
    object qryCadPrecopreco_custo: TFloatField
      FieldName = 'preco_custo'
      DisplayFormat = 'R$ ,0.00'
    end
    object qryCadPrecoperc_margem_lucro: TFloatField
      FieldName = 'perc_margem_lucro'
      DisplayFormat = ',0.00 %'
    end
    object qryCadPrecoperc_icms_interno: TFloatField
      FieldName = 'perc_icms_interno'
      DisplayFormat = ',0.00 %'
    end
    object qryCadPrecoperc_icms_externo: TFloatField
      FieldName = 'perc_icms_externo'
      DisplayFormat = ',0.00 %'
    end
    object qryCadPrecoperc_icms_substituicao: TFloatField
      FieldName = 'perc_icms_substituicao'
      DisplayFormat = ',0.00 %'
    end
    object qryCadPrecoperc_ipi: TFloatField
      FieldName = 'perc_ipi'
      DisplayFormat = ',0.00 %'
    end
    object qryCadPrecoperc_tva: TFloatField
      FieldName = 'perc_tva'
      DisplayFormat = ',0.00 %'
    end
    object qryCadPrecoperc_pis: TFloatField
      FieldName = 'perc_pis'
      DisplayFormat = ',0.00 %'
    end
    object qryCadPrecoperc_cofins: TFloatField
      FieldName = 'perc_cofins'
      DisplayFormat = ',0.00 %'
    end
    object qryCadPrecoperc_outros_impostos: TFloatField
      FieldName = 'perc_outros_impostos'
      DisplayFormat = ',0.00 %'
    end
    object qryCadPrecoperc_comissao: TFloatField
      FieldName = 'perc_comissao'
      DisplayFormat = ',0.00 %'
    end
    object qryCadPrecoperc_desconto: TFloatField
      FieldName = 'perc_desconto'
      DisplayFormat = ',0.00 %'
    end
    object qryCadPrecoperc_frete: TFloatField
      FieldName = 'perc_frete'
      DisplayFormat = ',0.00 %'
    end
    object qryCadPrecoperc_custo_fixo: TFloatField
      FieldName = 'perc_custo_fixo'
      DisplayFormat = ',0.00 %'
    end
    object qryCadPrecovl_margem_lucro: TFloatField
      FieldName = 'vl_margem_lucro'
      DisplayFormat = 'R$ ,0.00'
    end
    object qryCadPrecovl_comissao: TFloatField
      FieldName = 'vl_comissao'
      DisplayFormat = 'R$ ,0.00'
    end
    object qryCadPrecovl_desconto: TFloatField
      FieldName = 'vl_desconto'
      DisplayFormat = 'R$ ,0.00'
    end
    object qryCadPrecovl_frete: TFloatField
      FieldName = 'vl_frete'
      DisplayFormat = 'R$ ,0.00'
    end
    object qryCadPrecovl_custo_fixo: TFloatField
      FieldName = 'vl_custo_fixo'
      DisplayFormat = 'R$ ,0.00'
    end
    object qryCadPrecopreco_sugerido: TFloatField
      FieldName = 'preco_sugerido'
      DisplayFormat = 'R$ ,0.00'
    end
    object qryCadPrecopreco_venda: TFloatField
      FieldName = 'preco_venda'
      DisplayFormat = 'R$ ,0.00'
    end
    object qryCadPrecoidpreco: TLargeintField
      FieldName = 'idpreco'
      Required = True
      DisplayFormat = '000000'
    end
  end
  object DSqryCsPreco: TDataSource
    DataSet = qryCsPreco
    Left = 280
    Top = 448
  end
  object DSqryCadPreco: TDataSource
    DataSet = qryCadPreco
    Left = 280
    Top = 496
  end
  object qryCsUsuario: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadusuario')
    Params = <>
    Left = 219
    Top = 540
    object qryCsUsuarioidusuario: TIntegerField
      FieldName = 'idusuario'
      DisplayFormat = '000000'
    end
    object qryCsUsuarioativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCsUsuariodata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCsUsuarionome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryCsUsuariologin: TStringField
      FieldName = 'login'
      Size = 10
    end
    object qryCsUsuariosenha: TStringField
      FieldName = 'senha'
      Size = 10
    end
  end
  object DSqryCsUsuario: TDataSource
    DataSet = qryCsUsuario
    Left = 283
    Top = 543
  end
  object qryCadUsuario: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadusuario')
    Params = <>
    Left = 219
    Top = 588
    object qryCadUsuarioidusuario: TIntegerField
      FieldName = 'idusuario'
      DisplayFormat = '000000'
    end
    object qryCadUsuarioativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCadUsuariodata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCadUsuarionome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryCadUsuariologin: TStringField
      FieldName = 'login'
      Size = 10
    end
    object qryCadUsuariosenha: TStringField
      FieldName = 'senha'
      Size = 10
    end
  end
  object DSqryCadUsuario: TDataSource
    DataSet = qryCadUsuario
    Left = 283
    Top = 589
  end
  object qryCsLocalizacao: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadlocalizacao')
    Params = <>
    Left = 216
    Top = 14
    object qryCsLocalizacaoidlocalizacao: TIntegerField
      FieldName = 'idlocalizacao'
      Required = True
      DisplayFormat = '000000'
    end
    object qryCsLocalizacaoativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCsLocalizacaodata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCsLocalizacaocorredor: TStringField
      FieldName = 'corredor'
      Size = 5
    end
    object qryCsLocalizacaoestante: TStringField
      FieldName = 'estante'
      Size = 5
    end
    object qryCsLocalizacaoprateleira: TStringField
      FieldName = 'prateleira'
      Size = 5
    end
    object qryCsLocalizacaobandeja: TStringField
      FieldName = 'bandeja'
      Size = 5
    end
    object qryCsLocalizacaoidunidadeestoque: TIntegerField
      FieldName = 'idunidadeestoque'
      DisplayFormat = '000000'
    end
    object qryCsLocalizacaoidproduto: TIntegerField
      FieldName = 'idproduto'
      DisplayFormat = '000000'
    end
    object qryCsLocalizacaocalc_produto_descricao: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_produto_descricao'
      LookupDataSet = qryCsProduto
      LookupKeyFields = 'idproduto'
      LookupResultField = 'descricao'
      KeyFields = 'idproduto'
      Lookup = True
    end
    object qryCsLocalizacaocalc_nome_unidadeestoque: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nome_unidadeestoque'
      LookupDataSet = qryCsUnidadeEstoque
      LookupKeyFields = 'idunidadeestoque'
      LookupResultField = 'nome'
      KeyFields = 'idunidadeestoque'
      Lookup = True
    end
  end
  object qryCs: TZReadOnlyQuery
    Connection = Conexao
    OnCalcFields = qryCsProdutoCalcFields
    SQL.Strings = (
      'select * from cadproduto')
    Params = <>
    Left = 152
    Top = 13
  end
  object DataSource1: TDataSource
    DataSet = qryCs
    Left = 104
    Top = 589
  end
  object ZQuery1: TZQuery
    Connection = Conexao
    OnCalcFields = qryCadprodutoCalcFields
    AfterInsert = qryCadprodutoAfterInsert
    BeforePost = qryCadprodutoBeforePost
    BeforeDelete = qryCadprodutoBeforeDelete
    SQL.Strings = (
      'select * from cadproduto')
    Params = <>
    Left = 40
    Top = 637
    object IntegerField9: TIntegerField
      FieldName = 'idproduto'
      DisplayFormat = '000000'
    end
    object BooleanField2: TBooleanField
      FieldName = 'ativo'
    end
    object DateField2: TDateField
      FieldName = 'data_cadastro'
    end
    object StringField6: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object StringField7: TStringField
      FieldName = 'descricao_reduzida'
      Size = 25
    end
    object IntegerField10: TIntegerField
      FieldName = 'idgrupo'
      DisplayFormat = '000000'
    end
    object IntegerField11: TIntegerField
      FieldName = 'idsubgrupo'
      DisplayFormat = '000000'
    end
    object IntegerField12: TIntegerField
      FieldName = 'idfornecedor'
      DisplayFormat = '000000'
    end
    object StringField8: TStringField
      FieldName = 'unidade_compra'
      Size = 5
    end
    object IntegerField13: TIntegerField
      FieldName = 'idlocalizacao'
      DisplayFormat = '000000'
    end
    object IntegerField14: TIntegerField
      FieldName = 'st'
    end
    object IntegerField15: TIntegerField
      FieldName = 'ecf'
    end
    object FloatField21: TFloatField
      FieldName = 'perc_ipi'
      DisplayFormat = ',0.00 %'
    end
    object FloatField22: TFloatField
      FieldName = 'perc_frete'
      DisplayFormat = ',0.00 %'
    end
    object IntegerField16: TIntegerField
      FieldName = 'idclassificacao'
      DisplayFormat = '000000'
    end
    object FloatField23: TFloatField
      FieldName = 'vl_frete'
      DisplayFormat = ',0.00'
    end
    object FloatField24: TFloatField
      FieldName = 'saldo_minimo'
      DisplayFormat = ',0.00'
    end
    object FloatField25: TFloatField
      FieldName = 'peso_bruto'
    end
    object FloatField26: TFloatField
      FieldName = 'peso_liquido'
    end
    object StringField9: TStringField
      FieldName = 'unidade_venda'
      Size = 5
    end
    object FloatField27: TFloatField
      FieldName = 'perc_comissao'
      DisplayFormat = ',0.00 %'
    end
    object FloatField28: TFloatField
      FieldName = 'vl_comissao'
      DisplayFormat = ',0.00'
    end
    object FloatField29: TFloatField
      FieldName = 'perc_desconto'
      DisplayFormat = ',0.00 %'
    end
    object FloatField30: TFloatField
      FieldName = 'vl_desconto'
      DisplayFormat = ',0.00'
    end
    object FloatField31: TFloatField
      FieldName = 'perc_pis'
      DisplayFormat = ',0.00 %'
    end
    object FloatField32: TFloatField
      FieldName = 'perc_cofins'
      DisplayFormat = ',0.00 %'
    end
    object FloatField33: TFloatField
      FieldName = 'perc_tva'
      DisplayFormat = ',0.00 %'
    end
    object FloatField34: TFloatField
      FieldName = 'perc_icms_interno'
      DisplayFormat = ',0.00 %'
    end
    object FloatField35: TFloatField
      FieldName = 'perc_icms_externo'
      DisplayFormat = ',0.00 %'
    end
    object FloatField36: TFloatField
      FieldName = 'perc_icms_substituicao'
      DisplayFormat = ',0.00 %'
    end
    object StringField10: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nome_grupo'
      LookupDataSet = qryCsGrupo
      LookupKeyFields = 'idgrupo'
      LookupResultField = 'nome'
      KeyFields = 'idgrupo'
      Lookup = True
    end
    object StringField11: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nome_subgrupo'
      LookupDataSet = qryCsSubGrupo
      LookupKeyFields = 'idsubgrupo'
      LookupResultField = 'nome'
      KeyFields = 'idsubgrupo'
      Lookup = True
    end
    object StringField12: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nome_fornecedor'
      LookupDataSet = qryCsFornecedor
      LookupKeyFields = 'idfornecedor'
      LookupResultField = 'razao_social'
      KeyFields = 'idfornecedor'
      Lookup = True
    end
    object StringField13: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nome_classificacao'
      LookupDataSet = qryCsClassificacao
      LookupKeyFields = 'idclassificacao'
      LookupResultField = 'descricao'
      KeyFields = 'idclassificacao'
      Lookup = True
    end
    object FloatField37: TFloatField
      FieldName = 'perc_custo_fixo'
      DisplayFormat = ',0.00 %'
    end
    object FloatField38: TFloatField
      FieldName = 'perc_outros_impostos'
      DisplayFormat = ',0.00 %'
    end
    object FloatField39: TFloatField
      FieldName = 'vl_custo_fixo'
      DisplayFormat = ',0.00'
    end
    object FloatField40: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_preco_atacado'
      Calculated = True
    end
    object FloatField41: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_preco_varejo'
      Calculated = True
    end
    object FloatField42: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_saldo_atual'
      Calculated = True
    end
    object StringField14: TStringField
      FieldName = 'referencia'
      Size = 25
    end
  end
  object DataSource2: TDataSource
    DataSet = ZQuery1
    Left = 104
    Top = 637
  end
end
