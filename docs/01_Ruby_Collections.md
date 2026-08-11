# Ruby Collections: Arrays, Hashes e Enumerable

> **Última atualização:** Agosto de 2026 | Ruby 4.0+

## 📚 O que são Collections?

Uma collection em Ruby é qualquer classe que representa um conjunto de valores ou elementos. <cite index="75-1">Ruby's Enumerable module é um dos recursos mais poderosos e frequentemente usados da linguagem. Ele fornece uma coleção de métodos para iteração, busca, transformação e agregação de dados.</cite>

**As três principais collections em Ruby:**
1. **Array** - Lista ordenada de elementos
2. **Hash** - Pares chave-valor
3. **Set** - Coleção de elementos únicos (da stdlib)

---

## 📊 Tabela Comparativa: Collections vs JavaScript

| Característica | Ruby Array | Ruby Hash | JavaScript Array | JavaScript Object |
|---|---|---|---|---|
| **Sintaxe** | `[1, 2, 3]` | `{a: 1, b: 2}` | `[1, 2, 3]` | `{a: 1, b: 2}` |
| **Indexação** | Numérica (0+) | Por chave | Numérica (0+) | Por chave |
| **Mutável** | Sim | Sim | Sim | Sim |
| **Métodos Integrados** | map, select, reduce | keys, values, each | map, filter, reduce | Object.keys() |
| **Tipo de elemento** | Qualquer tipo | Qualquer tipo | Qualquer tipo | Qualquer tipo |
| **Ordem garantida** | Sim (insertion) | Sim (Ruby 1.9+) | Sim (insertion) | Não garantido |

---

## 1️⃣ ARRAYS - Listas Ordenadas

### Conceito

Um array é uma coleção ordenada de elementos. <cite index="77-1">Arrays são um conjunto de métodos convenientes incluídos como parte de arrays. Existem padrões de iteração que você encontrará repetidamente como desenvolvedor.</cite>

### Criação e Acesso

```ruby
# Diferentes formas de criar arrays
numeros = [1, 2, 3, 4, 5]
misto = [1, "texto", 3.14, true, nil]
vazio = []

# Usando %w para array de strings (words)
frutas = %w[maçã banana laranja]  # => ["maçã", "banana", "laranja"]

# Acessando elementos
numeros[0]       # => 1 (primeiro elemento)
numeros[-1]      # => 5 (último elemento)
numeros[1..3]    # => [2, 3, 4] (slice)
numeros.first    # => 1
numeros.last     # => 5
```

### Comparação com JavaScript

```javascript
// JavaScript
const numeros = [1, 2, 3, 4, 5];
numeros[0];      // 1
numeros.at(-1);  // 5 (ES2022)
numeros.slice(1, 4); // [2, 3, 4]
numeros[0];      // primeiro
numeros.pop();   // último
```

### Métodos Essenciais

| Método | Descrição | Exemplo |
|--------|-----------|---------|
| `push` / `<<` | Adiciona ao final | `arr.push(6)` / `arr << 6` |
| `pop` | Remove do final | `arr.pop` => 6 |
| `shift` | Remove do início | `arr.shift` => 1 |
| `unshift` | Adiciona ao início | `arr.unshift(0)` |
| `length` / `size` | Tamanho | `arr.length` => 5 |
| `include?` | Contém elemento? | `arr.include?(3)` => true |
| `empty?` | Array vazio? | `arr.empty?` => false |
| `reverse` | Inverte ordem | `arr.reverse` |
| `sort` | Ordena | `arr.sort` |
| `uniq` | Remove duplicatas | `[1,2,2,3].uniq` => [1,2,3] |

```ruby
# Exemplos práticos
frutas = ["maçã", "banana", "laranja"]

frutas.push("morango")           # ["maçã", "banana", "laranja", "morango"]
frutas << "melancia"             # adiciona ao final (mesmo que push)
frutas.pop                       # Remove e retorna "melancia"
frutas.shift                     # Remove "maçã" do início
frutas.unshift("morango")        # Adiciona "morango" no início
frutas.length                    # 4
frutas.include?("banana")        # true
frutas.reverse                   # ["morango", "laranja", "banana", "maçã"]
```

---

## 2️⃣ HASHES - Pares Chave-Valor

### Conceito

Um hash é um dicionário de pares chave-valor. <cite index="94-1">YAML excels at managing complex data structures and references, a crucial feature for application configuration. Its support for anchors and aliases lets you define a data block once and reuse it elsewhere.</cite>

### Criação e Acesso

```ruby
# Sintaxe antiga (arrow/rocket)
usuario = {
  :nome => "João",
  :idade => 30,
  :email => "joao@example.com"
}

# Sintaxe moderna (label: value)
usuario = {
  nome: "João",
  idade: 30,
  email: "joao@example.com"
}

# Acessando valores
usuario[:nome]    # => "João"
usuario[:idade]   # => 30

# Verificando chaves
usuario.keys      # => [:nome, :idade, :email]
usuario.values    # => ["João", 30, "joao@example.com"]
usuario.has_key?(:nome)  # => true
usuario.key?(:nome)      # alias para has_key?
```

### Comparação com JavaScript

```javascript
// JavaScript
const usuario = {
  nome: "João",
  idade: 30,
  email: "joao@example.com"
};

usuario.nome;     // "João"
usuario["idade"]; // 30
Object.keys(usuario);    // ["nome", "idade", "email"]
Object.values(usuario);  // ["João", 30, "joao@example.com"]
"nome" in usuario;       // true
```

### Métodos Essenciais

| Método | Descrição | Exemplo |
|--------|-----------|---------|
| `[key]` | Acessa valor | `hash[:nome]` |
| `[key]=` | Atribui valor | `hash[:idade] = 31` |
| `keys` | Todas as chaves | `hash.keys` |
| `values` | Todos os valores | `hash.values` |
| `length` / `size` | Quantidade de pares | `hash.size` |
| `empty?` | Hash vazio? | `hash.empty?` |
| `has_key?` / `key?` | Chave existe? | `hash.key?(:nome)` |
| `has_value?` / `value?` | Valor existe? | `hash.value?("João")` |
| `delete` | Remove par | `hash.delete(:idade)` |
| `merge` | Combina hashes | `hash1.merge(hash2)` |
| `select` | Filtra pares | `hash.select { \|k,v\| v > 25 }` |

```ruby
# Exemplos práticos
config = {
  host: "localhost",
  port: 3000,
  ssl: false
}

config[:port]              # => 3000
config[:ssl] = true        # Modifica
config[:debug] = true      # Adiciona nova chave
config.delete(:ssl)        # Remove chave :ssl
config.keys                # => [:host, :port, :debug]
config.values              # => ["localhost", 3000, true]

# Iterando
config.each do |chave, valor|
  puts "#{chave}: #{valor}"
end

# Filtrando
numeros = {a: 1, b: 2, c: 3, d: 4}
pares = numeros.select { |_k, v| v.even? }  # => {b: 2, d: 4}
```

---

## 3️⃣ ENUMERABLE - O Poder das Collections

### Conceito

<cite index="76-1">O módulo Enumerable em Ruby é um dos recursos mais poderosos e frequentemente usados da linguagem. Fornece uma coleção rica de métodos de iteração, transformação, filtragem e agregação que funcionam em Arrays, Hashes, Ranges e qualquer classe personalizada.</cite>

### Os 4 Pilares do Enumerable

#### 🔄 **Iteração** - Percorrer elementos

```ruby
numeros = [1, 2, 3, 4, 5]

# each - iteração básica
numeros.each { |n| puts n }

# each_with_index - com índice
numeros.each_with_index do |num, idx|
  puts "#{idx}: #{num}"
end

# Resultado:
# 0: 1
# 1: 2
# 2: 3
# 3: 4
# 4: 5
```

#### 🔄 **Transformação** - Modificar elementos

```ruby
numeros = [1, 2, 3, 4, 5]

# map - transformar cada elemento
dobrados = numeros.map { |n| n * 2 }
# => [2, 4, 6, 8, 10]

# Comparação com JavaScript
// JavaScript
const dobrados = numeros.map(n => n * 2);
```

#### 🔍 **Filtragem** - Selecionar elementos

```ruby
numeros = [1, 2, 3, 4, 5, 6]

# select - filtrar elementos que atendem condição
pares = numeros.select { |n| n.even? }
# => [2, 4, 6]

# reject - oposto de select
impares = numeros.reject { |n| n.even? }
# => [1, 3, 5]

# Comparação com JavaScript
// JavaScript
const pares = numeros.filter(n => n % 2 === 0);
const impares = numeros.filter(n => n % 2 !== 0);
```

#### ➕ **Agregação** - Reduzir a um valor único

```ruby
numeros = [1, 2, 3, 4, 5]

# reduce / inject - agregar valores
soma = numeros.reduce(0) { |total, n| total + n }
# => 15

# Com símbolo (mais conciso)
produto = numeros.reduce(1, :*)
# => 120

# Comparação com JavaScript
// JavaScript
const soma = numeros.reduce((total, n) => total + n, 0);
const produto = numeros.reduce((acc, n) => acc * n, 1);
```

### Tabela de Métodos Enumerable

| Método | Tipo | Descrição | Retorno |
|--------|------|-----------|---------|
| `each` | Iteração | Itera sobre cada elemento | self |
| `map` / `collect` | Transformação | Transforma cada elemento | Novo array |
| `select` / `find_all` | Filtragem | Filtra elementos verdadeiros | Novo array |
| `reject` | Filtragem | Filtra elementos falsos | Novo array |
| `reduce` / `inject` | Agregação | Reduz a um valor único | Valor único |
| `first` | Seleção | Primeiros n elementos | Array |
| `last` | Seleção | Últimos n elementos | Array |
| `take` | Seleção | Primeiros n elementos | Array |
| `drop` | Seleção | Ignora primeiros n | Array |
| `count` | Contagem | Conta elementos | Integer |
| `any?` | Verificação | Algum elemento é verdadeiro? | Boolean |
| `all?` | Verificação | Todos elementos são verdadeiros? | Boolean |
| `include?` | Verificação | Contém elemento? | Boolean |
| `find` / `detect` | Busca | Encontra primeiro elemento | Elemento ou nil |
| `group_by` | Agrupamento | Agrupa por chave | Hash |
| `sort_by` | Ordenação | Ordena por critério | Novo array |

### Exemplos Práticos Avançados

```ruby
# Exemplo 1: Processamento de lista de compras
compras = [
  { item: "Maçã", preco: 2.5, quantidade: 3 },
  { item: "Banana", preco: 1.0, quantidade: 5 },
  { item: "Laranja", preco: 3.0, quantidade: 2 }
]

# Total gasto
total = compras.reduce(0) do |soma, produto|
  soma + (produto[:preco] * produto[:quantidade])
end
# => 20.5

# Itens caros (acima de 2)
caros = compras.select { |p| p[:preco] > 2 }
# => [{item: "Laranja", preco: 3.0, quantidade: 2}, ...]

# Nome de cada item
items = compras.map { |p| p[:item] }
# => ["Maçã", "Banana", "Laranja"]

# Exemplo 2: Operações em cadeia (chaining)
resultado = [1, 2, 3, 4, 5, 6]
  .select { |n| n.even? }      # [2, 4, 6]
  .map { |n| n * 2 }           # [4, 8, 12]
  .reduce(0, :+)               # 24
```

---

## 📊 Mapa Conceitual de Collections

```
                    ┌─────────────────────┐
                    │   Collections       │
                    │   (Enumerable)      │
                    └──────────┬──────────┘
                               │
                ┌──────────────┼──────────────┐
                │              │              │
           ┌────▼────┐   ┌────▼────┐   ┌────▼────┐
           │  Array  │   │  Hash   │   │   Set   │
           └────┬────┘   └────┬────┘   └────┬────┘
                │              │             │
          Métodos:        Métodos:      Métodos:
         - push/pop      - [key]=       - add
         - map/select    - keys/values  - delete
         - reduce        - merge        - include?
         - each          - each         - each
```

---

## 🚀 Lazy Evaluation - Processamento Eficiente

Para coleções grandes ou infinitas:

```ruby
# Sem lazy - processa tudo na memória
resultado = (1..1000000)
  .select { |n| n.even? }
  .map { |n| n * 2 }
  .first(5)
# => [2, 4, 6, 8, 10] ✅ Mas usa muita memória

# Com lazy - processa sob demanda
resultado = (1..1000000)
  .lazy
  .select { |n| n.even? }
  .map { |n| n * 2 }
  .first(5)
# => [2, 4, 6, 8, 10] ✅ Muito mais eficiente
```

---

## 💡 Boas Práticas

✅ **Faça:**
- Use `each` para efeitos colaterais
- Use `map` para transformar dados
- Use `select`/`reject` para filtrar
- Encadeie métodos quando apropriado
- Use `lazy` para coleções grandes

❌ **Evite:**
- Loops `for` manuais (use Enumerable)
- Modificar array enquanto itera (use `select`)
- Enumerable infinito sem `lazy`
- Métodos muito complexos em blocos

---

## 📚 Resumo Visual - Fluxo de Transformação

```
Array Original: [1, 2, 3, 4, 5, 6]
                    │
            select (n.even?)
                    │
             ▼ [2, 4, 6]
                    │
            map (n * 10)
                    │
             ▼ [20, 40, 60]
                    │
            reduce(:+)
                    │
             ▼ 120
```

---

## Referências

- RubyGuides: The Enumerable Module (2026)
- Ruby Learning: Ruby Enumerable Complete Guide
- The Odin Project: Basic Enumerable Methods
- Ruby References: Enumerable Module
- The Bastards Book of Ruby: Enumerables
