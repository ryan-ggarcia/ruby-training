# criando hash
hash = Hash.new || hash = {}
# Atribundo valores
capitais = {:acre: 'Acre', :rio: "Rio"} || capitais[:acre] = 'acre'
            #^^                   ^^
            #chave                Valor
# Pegando apenas as CHEAVES do hash
capitais.keys
# Pegando apenas os VALORES do hash
capitais.values
# Deletar algum dado => infromar chave
capitais.delete(:acre)
# Para pegar qualquer valor do hash precisamos informar a chave
capitais[:acre]
# Quantidade de elementos dentro dele
capitais.size