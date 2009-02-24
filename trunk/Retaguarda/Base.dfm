object BancoDeDados: TBancoDeDados
  OldCreateOrder = False
  Height = 788
  Width = 750
  object Conexao: TZConnection
    Protocol = 'postgresql'
    HostName = 'localhost'
    Port = 5432
    Database = 'MASTERSOFT'
    User = 'postgres'
    Password = 'foxtro'
    AutoCommit = False
    Connected = True
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
      DisplayFormat = '0.00'
    end
    object qryCadprodutoperc_frete: TFloatField
      FieldName = 'perc_frete'
      DisplayFormat = '0.00'
    end
    object qryCadprodutoidclassificacao: TIntegerField
      FieldName = 'idclassificacao'
      DisplayFormat = '000000'
    end
    object qryCadprodutovl_frete: TFloatField
      FieldName = 'vl_frete'
      DisplayFormat = '0.00'
    end
    object qryCadprodutosaldo_minimo: TFloatField
      FieldName = 'saldo_minimo'
      DisplayFormat = '0.00'
    end
    object qryCadprodutopeso_bruto: TFloatField
      FieldName = 'peso_bruto'
      DisplayFormat = '0.00'
    end
    object qryCadprodutopeso_liquido: TFloatField
      FieldName = 'peso_liquido'
      DisplayFormat = '0.00'
    end
    object qryCadprodutounidade_venda: TStringField
      FieldName = 'unidade_venda'
      Size = 5
    end
    object qryCadprodutoperc_comissao: TFloatField
      DisplayLabel = '0.00'
      FieldName = 'perc_comissao'
      DisplayFormat = '0.00'
    end
    object qryCadprodutovl_comissao: TFloatField
      DisplayLabel = '0.00'
      FieldName = 'vl_comissao'
      DisplayFormat = '0.00'
    end
    object qryCadprodutoperc_desconto: TFloatField
      DisplayLabel = '0.00'
      FieldName = 'perc_desconto'
      DisplayFormat = '0.00'
    end
    object qryCadprodutovl_desconto: TFloatField
      DisplayLabel = '0.00'
      FieldName = 'vl_desconto'
      DisplayFormat = '0.00'
    end
    object qryCadprodutoperc_pis: TFloatField
      DisplayLabel = '0.00'
      FieldName = 'perc_pis'
      DisplayFormat = '0.00'
    end
    object qryCadprodutoperc_cofins: TFloatField
      DisplayLabel = '0.00'
      FieldName = 'perc_cofins'
      DisplayFormat = '0.00'
    end
    object qryCadprodutoperc_tva: TFloatField
      DisplayLabel = '0.00'
      FieldName = 'perc_tva'
      DisplayFormat = '0.00'
    end
    object qryCadprodutoperc_icms_interno: TFloatField
      DisplayLabel = '0.00'
      FieldName = 'perc_icms_interno'
      DisplayFormat = '0.00'
    end
    object qryCadprodutoperc_icms_externo: TFloatField
      DisplayLabel = '0.00'
      FieldName = 'perc_icms_externo'
      DisplayFormat = '0.00'
    end
    object qryCadprodutoperc_icms_substituicao: TFloatField
      DisplayLabel = '0.00'
      FieldName = 'perc_icms_substituicao'
      DisplayFormat = '0.00'
    end
    object qryCadprodutocalc_nome_grupo: TStringField
      DisplayLabel = '0.00'
      FieldKind = fkLookup
      FieldName = 'calc_nome_grupo'
      LookupDataSet = qryCsGrupo
      LookupKeyFields = 'idgrupo'
      LookupResultField = 'nome'
      KeyFields = 'idgrupo'
      Lookup = True
    end
    object qryCadprodutocalc_nome_subgrupo: TStringField
      DisplayLabel = '0.00'
      FieldKind = fkLookup
      FieldName = 'calc_nome_subgrupo'
      LookupDataSet = qryCsSubGrupo
      LookupKeyFields = 'idsubgrupo'
      LookupResultField = 'nome'
      KeyFields = 'idsubgrupo'
      Lookup = True
    end
    object qryCadprodutocalc_nome_fornecedor: TStringField
      DisplayLabel = '0.00'
      FieldKind = fkLookup
      FieldName = 'calc_nome_fornecedor'
      LookupDataSet = qryCsFornecedor
      LookupKeyFields = 'idfornecedor'
      LookupResultField = 'razao_social'
      KeyFields = 'idfornecedor'
      Lookup = True
    end
    object qryCadprodutocalc_nome_classificacao: TStringField
      DisplayLabel = '0.00'
      FieldKind = fkLookup
      FieldName = 'calc_nome_classificacao'
      LookupDataSet = qryCsClassificacao
      LookupKeyFields = 'idclassificacao'
      LookupResultField = 'descricao'
      KeyFields = 'idclassificacao'
      Lookup = True
    end
    object qryCadprodutoperc_custo_fixo: TFloatField
      DisplayLabel = '0.00'
      FieldName = 'perc_custo_fixo'
      DisplayFormat = '0.00'
    end
    object qryCadprodutoperc_outros_impostos: TFloatField
      DisplayLabel = '0.00'
      FieldName = 'perc_outros_impostos'
      DisplayFormat = '0.00'
    end
    object qryCadprodutovl_custo_fixo: TFloatField
      DisplayLabel = '0.00'
      FieldName = 'vl_custo_fixo'
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
    Left = 178
    Top = 158
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
    Left = 242
    Top = 118
  end
  object DSqryCadLocalizacao: TDataSource
    DataSet = qryCadLocalizacao
    Left = 242
    Top = 158
  end
  object qryCsUnidadeEstoque: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadunidade_estoque')
    Params = <>
    Left = 178
    Top = 206
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
    Left = 178
    Top = 254
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
    Left = 242
    Top = 206
  end
  object DSqryCadUnidadeEstoque: TDataSource
    DataSet = qryCadUnidadeEstoque
    Left = 242
    Top = 254
  end
  object qryCsClassificacao: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadclassificacao')
    Params = <>
    Left = 178
    Top = 302
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
    Left = 178
    Top = 350
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
    Left = 242
    Top = 302
  end
  object DSqryCadClassificacao: TDataSource
    DataSet = qryCadClassificacao
    Left = 242
    Top = 350
  end
  object qryCsProdutoFornecedor: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadproduto_fornecedor')
    Params = <>
    Left = 178
    Top = 72
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
    Left = 242
    Top = 72
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
    Left = 178
    Top = 392
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
    Left = 178
    Top = 440
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
    Left = 242
    Top = 392
  end
  object DSqryCadUnidade: TDataSource
    DataSet = qryCadUnidade
    Left = 242
    Top = 440
  end
  object DSqryCsPreco: TDataSource
    DataSet = qryCsPreco
    Left = 242
    Top = 496
  end
  object DSqryCadPreco: TDataSource
    DataSet = qryCadPreco
    Left = 242
    Top = 544
  end
  object qryCsUsuario: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadusuario')
    Params = <>
    Left = 181
    Top = 588
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
    Left = 245
    Top = 591
  end
  object qryCadUsuario: TZQuery
    Connection = Conexao
    BeforePost = qryCadUsuarioBeforePost
    BeforeDelete = qryCadUsuarioBeforeDelete
    SQL.Strings = (
      'select * from cadusuario')
    Params = <>
    Left = 181
    Top = 636
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
    Left = 245
    Top = 637
  end
  object qryCsLocalizacao: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadlocalizacao')
    Params = <>
    Left = 178
    Top = 116
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
  object qryCsSequenciador: TZReadOnlyQuery
    Connection = Conexao
    OnCalcFields = qryCsProdutoCalcFields
    SQL.Strings = (
      'select sequenciador('#39'cadbeneficiario'#39','#39'idbeneficiario'#39')as id')
    Params = <>
    Left = 101
    Top = 67
    object qryCsSequenciadorid: TIntegerField
      FieldName = 'id'
      ReadOnly = True
    end
  end
  object qryCsMovimentoEstoque: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from lanmovimento_estoque')
    Params = <>
    Left = 40
    Top = 592
    object qryCsMovimentoEstoqueativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCsMovimentoEstoquedata_cadastro: TDateTimeField
      FieldName = 'data_cadastro'
    end
    object qryCsMovimentoEstoqueidunidade_estoque_origem: TIntegerField
      FieldName = 'idunidade_estoque_origem'
      DisplayFormat = '000000'
    end
    object qryCsMovimentoEstoqueidunidade_estoque_destino: TIntegerField
      FieldName = 'idunidade_estoque_destino'
      DisplayFormat = '000000'
    end
    object qryCsMovimentoEstoqueidoperacao_estoque: TIntegerField
      FieldName = 'idoperacao_estoque'
      DisplayFormat = '000000'
    end
    object qryCsMovimentoEstoqueidfornecedor: TIntegerField
      FieldName = 'idfornecedor'
      DisplayFormat = '000000'
    end
    object qryCsMovimentoEstoquesolicitante: TStringField
      FieldName = 'solicitante'
      Size = 25
    end
    object qryCsMovimentoEstoqueidusuario: TIntegerField
      FieldName = 'idusuario'
      DisplayFormat = '000000'
    end
    object qryCsMovimentoEstoquecalc_nome_fornecedor: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nome_fornecedor'
      LookupDataSet = qryCsFornecedor
      LookupKeyFields = 'idfornecedor'
      LookupResultField = 'razao_social'
      KeyFields = 'idfornecedor'
      Lookup = True
    end
    object qryCsMovimentoEstoqueidmovimento_estoque: TIntegerField
      FieldName = 'idmovimento_estoque'
      DisplayFormat = '000000'
    end
    object qryCsMovimentoEstoquetipo: TSmallintField
      FieldName = 'tipo'
    end
    object qryCsMovimentoEstoqueprocessado: TBooleanField
      FieldName = 'processado'
    end
  end
  object qryCadMovimentoEstoque: TZQuery
    Connection = Conexao
    AfterInsert = qryCadMovimentoEstoqueAfterInsert
    BeforePost = qryCadMovimentoEstoqueBeforePost
    BeforeDelete = qryCadMovimentoEstoqueBeforeDelete
    SQL.Strings = (
      'select * from lanmovimento_estoque')
    Params = <>
    Left = 40
    Top = 640
    object qryCadMovimentoEstoqueativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCadMovimentoEstoquedata_cadastro: TDateTimeField
      FieldName = 'data_cadastro'
    end
    object qryCadMovimentoEstoqueidunidade_estoque_origem: TIntegerField
      FieldName = 'idunidade_estoque_origem'
      DisplayFormat = '000000'
    end
    object qryCadMovimentoEstoqueidunidade_estoque_destino: TIntegerField
      FieldName = 'idunidade_estoque_destino'
      DisplayFormat = '000000'
    end
    object qryCadMovimentoEstoqueidoperacao_estoque: TIntegerField
      FieldName = 'idoperacao_estoque'
      DisplayFormat = '000000'
    end
    object qryCadMovimentoEstoqueidfornecedor: TIntegerField
      FieldName = 'idfornecedor'
      DisplayFormat = '000000'
    end
    object qryCadMovimentoEstoquesolicitante: TStringField
      FieldName = 'solicitante'
      Size = 25
    end
    object qryCadMovimentoEstoqueidusuario: TIntegerField
      FieldName = 'idusuario'
      DisplayFormat = '000000'
    end
    object qryCadMovimentoEstoquecalc_nome_fornecedor: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nome_fornecedor'
      LookupDataSet = qryCsFornecedor
      LookupKeyFields = 'idfornecedor'
      LookupResultField = 'razao_social'
      KeyFields = 'idfornecedor'
      Lookup = True
    end
    object qryCadMovimentoEstoqueidmovimento_estoque: TIntegerField
      FieldName = 'idmovimento_estoque'
      DisplayFormat = '000000'
    end
    object qryCadMovimentoEstoquetipo: TSmallintField
      FieldName = 'tipo'
    end
    object qryCadMovimentoEstoqueprocessado: TBooleanField
      FieldName = 'processado'
    end
  end
  object DSqryCsMovimentoEstoque: TDataSource
    DataSet = qryCsMovimentoEstoque
    Left = 104
    Top = 592
  end
  object DSqryCadMovimentoEstoque: TDataSource
    DataSet = qryCadMovimentoEstoque
    Left = 104
    Top = 640
  end
  object qryCadPreco: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadpreco')
    Params = <>
    Left = 178
    Top = 544
    object qryCadPrecoidpreco: TIntegerField
      FieldName = 'idpreco'
      Required = True
    end
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
    end
    object qryCadPrecopreco_custo: TFloatField
      FieldName = 'preco_custo'
      DisplayFormat = ',0.00'
    end
    object qryCadPrecopreco_venda: TFloatField
      FieldName = 'preco_venda'
      DisplayFormat = ',0.00'
    end
    object qryCadPrecopreco_sugerido: TFloatField
      FieldName = 'preco_sugerido'
      DisplayFormat = ',0.00'
    end
    object qryCadPrecoperc_margem_lucro: TFloatField
      FieldName = 'perc_margem_lucro'
      DisplayFormat = '0.00'
    end
    object qryCadPrecoperc_icms_interno: TFloatField
      FieldName = 'perc_icms_interno'
      DisplayFormat = '0.00'
    end
    object qryCadPrecoperc_icms_externo: TFloatField
      FieldName = 'perc_icms_externo'
      DisplayFormat = '0.00'
    end
    object qryCadPrecoperc_icms_substituicao: TFloatField
      FieldName = 'perc_icms_substituicao'
      DisplayFormat = '0.00'
    end
    object qryCadPrecoperc_ipi: TFloatField
      FieldName = 'perc_ipi'
      DisplayFormat = '0.00'
    end
    object qryCadPrecoperc_tva: TFloatField
      FieldName = 'perc_tva'
      DisplayFormat = '0.00'
    end
    object qryCadPrecoperc_pis: TFloatField
      FieldName = 'perc_pis'
      DisplayFormat = '0.00'
    end
    object qryCadPrecoperc_cofins: TFloatField
      FieldName = 'perc_cofins'
      DisplayFormat = '0.00'
    end
    object qryCadPrecoperc_outros_impostos: TFloatField
      FieldName = 'perc_outros_impostos'
      DisplayFormat = '0.00'
    end
    object qryCadPrecoperc_comissao: TFloatField
      FieldName = 'perc_comissao'
      DisplayFormat = '0.00'
    end
    object qryCadPrecoperc_desconto: TFloatField
      FieldName = 'perc_desconto'
      DisplayFormat = '0.00'
    end
    object qryCadPrecoperc_frete: TFloatField
      FieldName = 'perc_frete'
      DisplayFormat = '0.00'
    end
    object qryCadPrecoperc_custo_fixo: TFloatField
      FieldName = 'perc_custo_fixo'
      DisplayFormat = '0.00'
    end
    object qryCadPrecovl_margem_lucro: TFloatField
      FieldName = 'vl_margem_lucro'
      DisplayFormat = ',0.00'
    end
    object qryCadPrecovl_comissao: TFloatField
      FieldName = 'vl_comissao'
      DisplayFormat = ',0.00'
    end
    object qryCadPrecovl_desconto: TFloatField
      FieldName = 'vl_desconto'
      DisplayFormat = ',0.00'
    end
    object qryCadPrecovl_frete: TFloatField
      FieldName = 'vl_frete'
      DisplayFormat = ',0.00'
    end
    object qryCadPrecovl_custo_fixo: TFloatField
      FieldName = 'vl_custo_fixo'
      DisplayFormat = ',0.00'
    end
  end
  object qryCsPreco: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadpreco')
    Params = <>
    DataSource = DSqryCadClassificacao
    Left = 178
    Top = 488
    object qryCsPrecoidpreco: TIntegerField
      FieldName = 'idpreco'
      Required = True
    end
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
    end
    object qryCsPrecopreco_custo: TFloatField
      FieldName = 'preco_custo'
      DisplayFormat = ',0.00'
    end
    object qryCsPrecopreco_venda: TFloatField
      FieldName = 'preco_venda'
      DisplayFormat = ',0.00'
    end
    object qryCsPrecopreco_sugerido: TFloatField
      FieldName = 'preco_sugerido'
      DisplayFormat = ',0.00'
    end
    object qryCsPrecoperc_margem_lucro: TFloatField
      FieldName = 'perc_margem_lucro'
      DisplayFormat = '0.00'
    end
    object qryCsPrecoperc_icms_interno: TFloatField
      FieldName = 'perc_icms_interno'
      DisplayFormat = '0.00'
    end
    object qryCsPrecoperc_icms_externo: TFloatField
      FieldName = 'perc_icms_externo'
      DisplayFormat = '0.00'
    end
    object qryCsPrecoperc_icms_substituicao: TFloatField
      FieldName = 'perc_icms_substituicao'
      DisplayFormat = '0.00'
    end
    object qryCsPrecoperc_ipi: TFloatField
      FieldName = 'perc_ipi'
      DisplayFormat = '0.00'
    end
    object qryCsPrecoperc_tva: TFloatField
      FieldName = 'perc_tva'
      DisplayFormat = '0.00'
    end
    object qryCsPrecoperc_pis: TFloatField
      FieldName = 'perc_pis'
      DisplayFormat = '0.00'
    end
    object qryCsPrecoperc_cofins: TFloatField
      FieldName = 'perc_cofins'
      DisplayFormat = '0.00'
    end
    object qryCsPrecoperc_outros_impostos: TFloatField
      FieldName = 'perc_outros_impostos'
      DisplayFormat = '0.00'
    end
    object qryCsPrecoperc_comissao: TFloatField
      FieldName = 'perc_comissao'
      DisplayFormat = '0.00'
    end
    object qryCsPrecoperc_desconto: TFloatField
      FieldName = 'perc_desconto'
      DisplayFormat = '0.00'
    end
    object qryCsPrecoperc_frete: TFloatField
      FieldName = 'perc_frete'
      DisplayFormat = '0.00'
    end
    object qryCsPrecoperc_custo_fixo: TFloatField
      FieldName = 'perc_custo_fixo'
      DisplayFormat = '0.00'
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
  end
  object qryCsOperacaoEstoque: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadoperacao_estoque')
    Params = <>
    Left = 178
    Top = 688
    object qryCsOperacaoEstoqueidoperacao_estoque: TIntegerField
      FieldName = 'idoperacao_estoque'
      DisplayFormat = '000000'
    end
    object qryCsOperacaoEstoqueativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCsOperacaoEstoquedata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCsOperacaoEstoquedescricao: TStringField
      FieldName = 'descricao'
      Size = 25
    end
  end
  object qryCadOperacaoEstoque: TZQuery
    Connection = Conexao
    BeforePost = qryCadOperacaoEstoqueBeforePost
    BeforeDelete = qryCadOperacaoEstoqueBeforeDelete
    SQL.Strings = (
      'select * from cadoperacao_estoque')
    Params = <>
    Left = 178
    Top = 728
    object qryCadOperacaoEstoqueidoperacao_estoque: TIntegerField
      FieldName = 'idoperacao_estoque'
      DisplayFormat = '000000'
    end
    object qryCadOperacaoEstoqueativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCadOperacaoEstoquedata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCadOperacaoEstoquedescricao: TStringField
      FieldName = 'descricao'
      Size = 25
    end
  end
  object DSqryCsOperacaoEstoque: TDataSource
    DataSet = qryCsOperacaoEstoque
    Left = 242
    Top = 688
  end
  object DSqryCadOperacaoEstoque: TDataSource
    DataSet = qryCadOperacaoEstoque
    Left = 242
    Top = 728
  end
  object qryCsMovimentoEstoqueItens: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from lanmovimento_estoque_itens')
    Params = <>
    Left = 40
    Top = 688
    object qryCsMovimentoEstoqueItensidmovimento_estoque_itens: TIntegerField
      FieldName = 'idmovimento_estoque_itens'
      DisplayFormat = '000000'
    end
    object qryCsMovimentoEstoqueItensidmovimento_estoque: TIntegerField
      FieldName = 'idmovimento_estoque'
      Required = True
      DisplayFormat = '000000'
    end
    object qryCsMovimentoEstoqueItensidproduto: TIntegerField
      FieldName = 'idproduto'
      DisplayFormat = '000000'
    end
    object qryCsMovimentoEstoqueItensdescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object qryCsMovimentoEstoqueItensreferencia: TStringField
      FieldName = 'referencia'
      Size = 25
    end
    object qryCsMovimentoEstoqueItensunidade: TStringField
      FieldName = 'unidade'
      Size = 3
    end
    object qryCsMovimentoEstoqueItensquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = ',0.00'
    end
    object qryCsMovimentoEstoqueItenspreco_unitario: TFloatField
      FieldName = 'preco_unitario'
      DisplayFormat = ',0.00'
    end
    object qryCsMovimentoEstoqueItenscalc_total: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'calc_total'
      Calculated = True
    end
  end
  object qryCadMovimentoEstoqueItens: TZQuery
    Connection = Conexao
    OnCalcFields = qryCadMovimentoEstoqueItensCalcFields
    BeforeInsert = qryCadMovimentoEstoqueItensBeforeInsert
    AfterInsert = qryCadMovimentoEstoqueItensAfterInsert
    BeforePost = qryCadMovimentoEstoqueItensBeforePost
    SQL.Strings = (
      'select * from lanmovimento_estoque_itens')
    Params = <>
    Left = 40
    Top = 736
    object qryCadMovimentoEstoqueItensidmovimento_estoque_itens: TIntegerField
      FieldName = 'idmovimento_estoque_itens'
      DisplayFormat = '000000'
    end
    object qryCadMovimentoEstoqueItensidmovimento_estoque: TIntegerField
      FieldName = 'idmovimento_estoque'
      Required = True
      DisplayFormat = '000000'
    end
    object qryCadMovimentoEstoqueItensidproduto: TIntegerField
      FieldName = 'idproduto'
      DisplayFormat = '000000'
    end
    object qryCadMovimentoEstoqueItensdescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object qryCadMovimentoEstoqueItensreferencia: TStringField
      FieldName = 'referencia'
      Size = 25
    end
    object qryCadMovimentoEstoqueItensunidade: TStringField
      FieldName = 'unidade'
      Size = 3
    end
    object qryCadMovimentoEstoqueItensquantidade: TFloatField
      FieldName = 'quantidade'
      DisplayFormat = ',0.00'
    end
    object qryCadMovimentoEstoqueItenspreco_unitario: TFloatField
      FieldName = 'preco_unitario'
      DisplayFormat = ',0.00'
    end
    object qryCadMovimentoEstoqueItenscalc_total: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'calc_total'
      Calculated = True
    end
  end
  object DSqryCsMovimentoEstoqueItens: TDataSource
    DataSet = qryCsMovimentoEstoqueItens
    Left = 104
    Top = 688
  end
  object DSqryCadMovimentoEstoqueItens: TDataSource
    DataSet = qryCadMovimentoEstoqueItens
    Left = 104
    Top = 736
  end
  object qryCsParametros: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from parametros')
    Params = <>
    Left = 330
    Top = 165
    object qryCsParametrosidparametro: TIntegerField
      FieldName = 'idparametro'
      DisplayFormat = '000000'
    end
    object qryCsParametrosativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCsParametrosdescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object qryCsParametrosvalor: TStringField
      FieldName = 'valor'
      Size = 25
    end
    object qryCsParametrosidmodulo: TIntegerField
      FieldName = 'idmodulo'
    end
    object qryCsParametrosdata_cadastro: TDateTimeField
      FieldName = 'data_cadastro'
    end
    object qryCsParametroscalc_descricao_modulo: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_descricao_modulo'
      LookupDataSet = qryCsModulos
      LookupKeyFields = 'idmodulo'
      LookupResultField = 'descricao'
      KeyFields = 'idmodulo'
      Lookup = True
    end
  end
  object DSqryCsParametros: TDataSource
    DataSet = qryCsParametros
    Left = 394
    Top = 165
  end
  object qryCadParametros: TZQuery
    Connection = Conexao
    BeforePost = qryCadParametrosBeforePost
    BeforeDelete = qryCadParametrosBeforeDelete
    SQL.Strings = (
      'select * from parametros')
    Params = <>
    Left = 330
    Top = 213
    object qryCadParametrosidparametro: TIntegerField
      FieldName = 'idparametro'
      DisplayFormat = '000000'
    end
    object qryCadParametrosativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCadParametrosdescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object qryCadParametrosidmodulo: TIntegerField
      FieldName = 'idmodulo'
      DisplayFormat = '000000'
    end
    object qryCadParametrosvalor: TStringField
      FieldName = 'valor'
      Size = 25
    end
    object qryCadParametrosdata_cadastro: TDateTimeField
      FieldName = 'data_cadastro'
    end
  end
  object qryCsModulos: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from modulos')
    Params = <>
    Left = 330
    Top = 69
    object qryCsModulosidmodulo: TIntegerField
      FieldName = 'idmodulo'
      DisplayFormat = '000000'
    end
    object qryCsModulosativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCsModulosdescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object qryCsModulosdata_cadastro: TDateTimeField
      FieldName = 'data_cadastro'
    end
  end
  object qryCadModulos: TZQuery
    Connection = Conexao
    BeforePost = qryCadModulosBeforePost
    BeforeDelete = qryCadModulosBeforeDelete
    SQL.Strings = (
      'select * from modulos')
    Params = <>
    Left = 330
    Top = 117
    object qryCadModulosidmodulo: TIntegerField
      FieldName = 'idmodulo'
      DisplayFormat = '000000'
    end
    object qryCadModulosativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCadModulosdescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object qryCadModulosdata_cadastro: TDateTimeField
      FieldName = 'data_cadastro'
    end
  end
  object DSqryCadParametros: TDataSource
    DataSet = qryCadParametros
    Left = 394
    Top = 213
  end
  object DSqryCsModulos: TDataSource
    DataSet = qryCsModulos
    Left = 394
    Top = 69
  end
  object DSqryCadModulos: TDataSource
    DataSet = qryCadModulos
    Left = 394
    Top = 117
  end
  object qryCsVendedor: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadvendedor')
    Params = <>
    Left = 330
    Top = 261
    object qryCsVendedoridvendedor: TIntegerField
      FieldName = 'idvendedor'
      DisplayFormat = '000000'
    end
    object qryCsVendedorativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCsVendedortipo: TSmallintField
      FieldName = 'tipo'
    end
    object qryCsVendedoridusuario: TIntegerField
      FieldName = 'idusuario'
      DisplayFormat = '000000'
    end
    object qryCsVendedornome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryCsVendedorlogin: TStringField
      FieldName = 'login'
      Required = True
      Size = 10
    end
    object qryCsVendedorsenha: TStringField
      FieldName = 'senha'
      Size = 10
    end
    object qryCsVendedordata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCsVendedorcalc_nome_usuario: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nome_usuario'
      LookupDataSet = qryCsUsuario
      LookupKeyFields = 'idusuario'
      LookupResultField = 'nome'
      KeyFields = 'idusuario'
      Size = 150
      Lookup = True
    end
  end
  object qryCadVendedor: TZQuery
    Connection = Conexao
    AfterInsert = qryCadVendedorAfterInsert
    BeforePost = qryCadVendedorBeforePost
    BeforeDelete = qryCadVendedorBeforeDelete
    SQL.Strings = (
      'select * from cadvendedor')
    Params = <>
    Left = 330
    Top = 309
    object qryCadVendedoridvendedor: TIntegerField
      FieldName = 'idvendedor'
      DisplayFormat = '000000'
    end
    object qryCadVendedorativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCadVendedortipo: TSmallintField
      FieldName = 'tipo'
    end
    object qryCadVendedoridusuario: TIntegerField
      FieldName = 'idusuario'
      DisplayFormat = '000000'
    end
    object qryCadVendedornome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryCadVendedorlogin: TStringField
      FieldName = 'login'
      Required = True
      Size = 10
    end
    object qryCadVendedorsenha: TStringField
      FieldName = 'senha'
      Size = 10
    end
    object qryCadVendedordata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCadVendedorcalc_nome_usuario: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nome_usuario'
      LookupDataSet = qryCsUsuario
      LookupKeyFields = 'idusuario'
      LookupResultField = 'nome'
      KeyFields = 'idusuario'
      Size = 150
      Lookup = True
    end
  end
  object DSqryCsVendedor: TDataSource
    DataSet = qryCsVendedor
    Left = 394
    Top = 261
  end
  object DSqryCadVendedor: TDataSource
    DataSet = qryCadVendedor
    Left = 394
    Top = 309
  end
  object qryCsFormaPagamento: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadforma_pagamento')
    Params = <>
    Left = 330
    Top = 354
    object qryCsFormaPagamentoidforma_pagamento: TIntegerField
      FieldName = 'idforma_pagamento'
      DisplayFormat = '00000000'
    end
    object qryCsFormaPagamentoativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCsFormaPagamentodata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCsFormaPagamentodescricao: TStringField
      FieldName = 'descricao'
      Size = 40
    end
  end
  object qryCadFormaPagamento: TZQuery
    Connection = Conexao
    BeforePost = qryCadFormaPagamentoBeforePost
    BeforeDelete = qryCadFormaPagamentoBeforeDelete
    SQL.Strings = (
      'select * from cadforma_pagamento')
    Params = <>
    Left = 330
    Top = 398
    object qryCadFormaPagamentoidforma_pagamento: TIntegerField
      FieldName = 'idforma_pagamento'
    end
    object qryCadFormaPagamentoativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCadFormaPagamentodata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCadFormaPagamentodescricao: TStringField
      FieldName = 'descricao'
      Size = 40
    end
  end
  object DSqryCsFormaPagamento: TDataSource
    DataSet = qryCsFormaPagamento
    Left = 394
    Top = 355
  end
  object DSqryCadFormaPagamento: TDataSource
    DataSet = qryCadFormaPagamento
    Left = 394
    Top = 399
  end
  object qryCsVendedorFormaPagamento: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadforma_pagamento_vendedor')
    Params = <>
    Left = 175
    Top = 16
    object qryCsVendedorFormaPagamentoidformapagamento_vendedor: TIntegerField
      FieldName = 'idformapagamento_vendedor'
      Required = True
      DisplayFormat = '000000'
    end
    object qryCsVendedorFormaPagamentoidforma_pagamento: TIntegerField
      FieldName = 'idforma_pagamento'
      DisplayFormat = '000000'
    end
    object qryCsVendedorFormaPagamentoidvendedor: TIntegerField
      FieldName = 'idvendedor'
      DisplayFormat = '000000'
    end
    object qryCsVendedorFormaPagamentodata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCsVendedorFormaPagamentocalc_nome_forma_pagamento: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nome_forma_pagamento'
      LookupDataSet = qryCsFormaPagamento
      LookupKeyFields = 'idforma_pagamento'
      LookupResultField = 'descricao'
      KeyFields = 'idforma_pagamento'
      Lookup = True
    end
  end
  object DSqryCsVendedorFormaPagamento: TDataSource
    DataSet = qryCsVendedorFormaPagamento
    Left = 239
    Top = 16
  end
  object qryCsTipoDocumento: TZReadOnlyQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cadtipo_documento')
    Params = <>
    Left = 330
    Top = 446
    object qryCsTipoDocumentoidtipo_documento: TIntegerField
      FieldName = 'idtipo_documento'
      DisplayFormat = '000000'
    end
    object qryCsTipoDocumentoativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCsTipoDocumentodata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCsTipoDocumentodescricao: TStringField
      FieldName = 'descricao'
      Size = 40
    end
  end
  object qryCadTipoDocumento: TZQuery
    Connection = Conexao
    BeforePost = qryCadTipoDocumentoBeforePost
    BeforeDelete = qryCadTipoDocumentoBeforeDelete
    SQL.Strings = (
      'select * from cadtipo_documento')
    Params = <>
    Left = 329
    Top = 495
    object qryCadTipoDocumentoidtipo_documento: TIntegerField
      FieldName = 'idtipo_documento'
      DisplayFormat = '000000'
    end
    object qryCadTipoDocumentoativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCadTipoDocumentodata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCadTipoDocumentodescricao: TStringField
      FieldName = 'descricao'
      Size = 40
    end
  end
  object DSqryCsTipoDocumento: TDataSource
    DataSet = qryCsTipoDocumento
    Left = 394
    Top = 446
  end
  object DSqryCadTipoDocumento: TDataSource
    DataSet = qryCadTipoDocumento
    Left = 393
    Top = 495
  end
  object qryCsMovimentoCaixa: TZReadOnlyQuery
    Connection = Conexao
    OnCalcFields = qryCsMovimentoCaixaCalcFields
    SQL.Strings = (
      'select * from lanmovimento_caixa')
    Params = <>
    Left = 329
    Top = 543
    object qryCsMovimentoCaixaidmovimento_caixa: TIntegerField
      FieldName = 'idmovimento_caixa'
      DisplayFormat = '000000'
    end
    object qryCsMovimentoCaixacancelado: TBooleanField
      FieldName = 'cancelado'
    end
    object qryCsMovimentoCaixadata_lancamento: TDateTimeField
      FieldName = 'data_lancamento'
    end
    object qryCsMovimentoCaixatipo: TSmallintField
      FieldName = 'tipo'
    end
    object qryCsMovimentoCaixahistorico: TStringField
      FieldName = 'historico'
      Size = 100
    end
    object qryCsMovimentoCaixaidconta_origem: TIntegerField
      FieldName = 'idconta_origem'
      DisplayFormat = '000000'
    end
    object qryCsMovimentoCaixaidconta_destino: TIntegerField
      FieldName = 'idconta_destino'
      DisplayFormat = '000000'
    end
    object qryCsMovimentoCaixaentrada: TFloatField
      FieldName = 'entrada'
      DisplayFormat = ',0.00'
    end
    object qryCsMovimentoCaixasaida: TFloatField
      FieldName = 'saida'
      DisplayFormat = ',0.00'
    end
    object qryCsMovimentoCaixafixo: TBooleanField
      FieldName = 'fixo'
    end
    object qryCsMovimentoCaixaidusuario: TIntegerField
      FieldName = 'idusuario'
      DisplayFormat = '000000'
    end
    object qryCsMovimentoCaixaidtipo_lancamento: TIntegerField
      FieldName = 'idtipo_lancamento'
      DisplayFormat = '000000'
    end
    object qryCsMovimentoCaixaidcliente: TIntegerField
      FieldName = 'idcliente'
      EditFormat = '000000'
    end
    object qryCsMovimentoCaixacalc_nome_cliente: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nome_cliente'
      LookupDataSet = qryCsCliente
      LookupKeyFields = 'idcliente'
      LookupResultField = 'nome'
      KeyFields = 'idcliente'
      Lookup = True
    end
    object qryCsMovimentoCaixacalc_nome_tipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nome_tipo'
      Calculated = True
    end
    object qryCsMovimentoCaixaobservacao: TMemoField
      FieldName = 'observacao'
      BlobType = ftMemo
    end
  end
  object qryCadMovimentoCaixa: TZQuery
    Connection = Conexao
    OnCalcFields = qryCadMovimentoCaixaCalcFields
    BeforePost = qryCadMovimentoCaixaBeforePost
    BeforeDelete = qryCadMovimentoCaixaBeforeDelete
    SQL.Strings = (
      'select * from lanmovimento_caixa')
    Params = <>
    Left = 329
    Top = 591
    object qryCadMovimentoCaixaidmovimento_caixa: TIntegerField
      FieldName = 'idmovimento_caixa'
      DisplayFormat = '000000'
    end
    object qryCadMovimentoCaixacancelado: TBooleanField
      FieldName = 'cancelado'
    end
    object qryCadMovimentoCaixadata_lancamento: TDateTimeField
      FieldName = 'data_lancamento'
    end
    object qryCadMovimentoCaixatipo: TSmallintField
      FieldName = 'tipo'
    end
    object qryCadMovimentoCaixahistorico: TStringField
      FieldName = 'historico'
      Size = 100
    end
    object qryCadMovimentoCaixaidconta_origem: TIntegerField
      FieldName = 'idconta_origem'
      DisplayFormat = '000000'
    end
    object qryCadMovimentoCaixaidconta_destino: TIntegerField
      FieldName = 'idconta_destino'
      DisplayFormat = '000000'
    end
    object qryCadMovimentoCaixaentrada: TFloatField
      FieldName = 'entrada'
      DisplayFormat = ',0.00'
    end
    object qryCadMovimentoCaixasaida: TFloatField
      FieldName = 'saida'
      DisplayFormat = ',0.00'
    end
    object qryCadMovimentoCaixafixo: TBooleanField
      FieldName = 'fixo'
    end
    object qryCadMovimentoCaixaidusuario: TIntegerField
      FieldName = 'idusuario'
      DisplayFormat = '000000'
    end
    object qryCadMovimentoCaixaidtipo_lancamento: TIntegerField
      FieldName = 'idtipo_lancamento'
      DisplayFormat = '000000'
    end
    object qryCadMovimentoCaixaidcliente: TIntegerField
      FieldName = 'idcliente'
      DisplayFormat = '000000'
    end
    object qryCadMovimentoCaixacalc_nome_cliente: TStringField
      FieldKind = fkLookup
      FieldName = 'calc_nome_cliente'
      LookupDataSet = qryCsCliente
      LookupKeyFields = 'idcliente'
      LookupResultField = 'nome'
      KeyFields = 'idcliente'
      Lookup = True
    end
    object qryCadMovimentoCaixacalc_nome_tipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nome_tipo'
      Calculated = True
    end
    object qryCadMovimentoCaixaobservacao: TMemoField
      FieldName = 'observacao'
      BlobType = ftMemo
    end
  end
  object DSqryCsMovimentoCaixa: TDataSource
    DataSet = qryCsMovimentoCaixa
    Left = 393
    Top = 543
  end
  object DSqryCadMovimentoCaixa: TDataSource
    DataSet = qryCadMovimentoCaixa
    Left = 393
    Top = 591
  end
  object qryCsContaContabil: TZReadOnlyQuery
    Connection = Conexao
    OnCalcFields = qryCsContaContabilCalcFields
    SQL.Strings = (
      'select * from cadconta_contabil')
    Params = <>
    Left = 328
    Top = 637
    object qryCsContaContabilidconta_contabil: TIntegerField
      FieldName = 'idconta_contabil'
      DisplayFormat = '000000'
    end
    object qryCsContaContabildescricao: TStringField
      FieldName = 'descricao'
      Size = 40
    end
    object qryCsContaContabilativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCsContaContabildata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCsContaContabiltipo: TSmallintField
      FieldName = 'tipo'
    end
    object qryCsContaContabilcalc_nome_tipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nome_tipo'
      Calculated = True
    end
  end
  object qryCadContaContabil: TZQuery
    Connection = Conexao
    BeforePost = qryCadContaContabilBeforePost
    BeforeDelete = qryCadContaContabilBeforeDelete
    SQL.Strings = (
      'select * from cadconta_contabil')
    Params = <>
    Left = 328
    Top = 688
    object qryCadContaContabilidconta_contabil: TIntegerField
      FieldName = 'idconta_contabil'
      DisplayFormat = '000000'
    end
    object qryCadContaContabildescricao: TStringField
      FieldName = 'descricao'
      Size = 40
    end
    object qryCadContaContabilativo: TBooleanField
      FieldName = 'ativo'
    end
    object qryCadContaContabildata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCadContaContabiltipo: TSmallintField
      FieldName = 'tipo'
    end
  end
  object DSqryCsContaContabil: TDataSource
    DataSet = qryCsContaContabil
    Left = 392
    Top = 638
  end
  object DSqryCadContaContabil: TDataSource
    DataSet = qryCadContaContabil
    Left = 392
    Top = 686
  end
end
