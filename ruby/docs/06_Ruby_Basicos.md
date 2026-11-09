# Conceitos Básicos de Ruby: Sintaxe Fundamental

> **Última atualização:** Agosto de 2026 | Ruby 4.0+

## 🎯 O Que é Ruby?

Ruby é uma linguagem **dinâmica**, **interpretada**, **orientada a objetos** e **altamente expressiva**, focada em produtividade e simplicidade.

---

## 📊 Tabela: Ruby vs JavaScript - Conceitos Básicos

| Conceito | Ruby | JavaScript |
|----------|------|-----------|
| **Print** | `puts` | `console.log()` |
| **Comentário** | `#` | `//` ou `/* */` |
| **String interpolação** | `"#{var}"` | `` `${var}` `` |
| **Variável** | `var = value` | `let var = value` |
| **Tipo dinâmico** | ✅ Sim | ✅ Sim |
| **End de bloco** | `end` | `{}` |
| **Condicional** | `if/elsif/else` | `if/else if/else` |
| **Loop** | `while/for/each` | `while/for/forEach` |
| **True/False** | `true/false` | `true/false` |

---

## 🔤 Variáveis e Tipos de Dados

### Tipos Primitivos

```ruby
# Strings
nome = "João"
mensagem = 'Sem interpolação'
multilinha = <<~TEXT
  Texto com múltiplas
  linhas
  TEXT

# Números
inteiro = 42
negativo = -100
grande = 1_000_000    # Underscore para legibilidade

# Floats
decimal = 3.14
cientifico = 1.23e-2  # 0.0123

# Booleanos
verdadeiro = true
falso = false

# Nil (nulo)
vazio = nil

# Símbolos (identificadores únicos)
simbolo = :chave
```

### Nomes de Variáveis

```ruby
# ✅ VÁLIDOS
nome_usuario = "João"
_privado = 10
NUM = 50           # Constante
variavelLonga = 5  # Camel case não-idiomático

# ❌ INVÁLIDOS
2nome = "erro"     # Começa com número
nome-usuario = 10  # Hífen não permitido
classe = 5         # Palavra reservada
```

---

## 📐 Operadores

### Aritméticos

```ruby
# Básicos
10 + 5      # 15
10 - 5      # 5
10 * 5      # 50
10 / 5      # 2
10 % 3      # 1 (módulo)
2 ** 8      # 256 (exponenciação)

# Associação
resultado = 10 + 5 * 2  # 20 (multiplicação primeiro)
resultado = (10 + 5) * 2 # 30
```

### Comparação

```ruby
# Igualdade
5 == 5      # true
5 != 3      # true
"abc" == "abc"  # true

# Magnitude
5 > 3       # true
5 < 3       # false
5 >= 5      # true
5 <= 3      # false

# Spaceship operator (Ruby 3+)
1 <=> 2     # -1 (1 é menor)
2 <=> 2     # 0 (iguais)
3 <=> 2     # 1 (3 é maior)
```

### Lógicos

```ruby
true && true    # true (E)
true || false   # true (OU)
!true           # false (NÃO)

# Curto-circuito
5 > 3 && puts("Sim")   # Executa puts
5 < 3 || puts("Não")   # Executa puts
```

### String (Operadores)

```ruby
# Concatenação
"Olá" + " " + "Mundo"        # "Olá Mundo"
"Olá" << " " << "Mundo"      # "Olá Mundo"
"Olá" * 3                    # "OláOláOlá"

# Interpolação (melhor)
nome = "João"
"Olá, #{nome}!"              # "Olá, João!"
```

---

## 🔗 Strings em Profundidade

### Diferentes Delimitadores

```ruby
# Aspas duplas (com interpolação)
texto = "Olá #{5 + 3}"   # "Olá 8"

# Aspas simples (sem interpolação)
texto = 'Olá #{5 + 3}'   # "Olá #{5 + 3}"

# Percent notation
%w[maçã banana laranja]  # ["maçã", "banana", "laranja"]
%i[a b c]               # [:a, :b, :c]
%q{Sem interpolação}    # "Sem interpolação"
%Q{Com #{interpolacao}} # "Com interpolacao"

# Heredoc
texto = <<~TEXT
  Primeira linha
  Segunda linha
  TEXT
```

### Métodos Úteis de String

```ruby
texto = "Ruby é incrível"

# Tamanho
texto.length            # 14
texto.size              # 14

# Transformação
texto.upcase            # "RUBY É INCRÍVEL"
texto.downcase          # "ruby é incrível"
texto.capitalize        # "Ruby é incrível"
texto.reverse           # "lévircni é ybuR"

# Busca
texto.include?("Ruby")  # true
texto.start_with?("R")  # true
texto.end_with?("!")    # false

# Divisão
texto.split(" ")        # ["Ruby", "é", "incrível"]
"a,b,c".split(",")      # ["a", "b", "c"]

# Substituição
texto.gsub("Ruby", "Python")  # "Python é incrível"
texto.sub("Ruby", "Python")   # Apenas primeira ocorrência

# Limpeza
"  espaço  ".strip      # "espaço"
"  espaço  ".lstrip     # "espaço  "
"  espaço  ".rstrip     # "  espaço"
```

---

## 🎛️ Estruturas de Controle

### If/Elsif/Else

```ruby
idade = 20

if idade < 13
  puts "Criança"
elsif idade < 18
  puts "Adolescente"
elsif idade < 60
  puts "Adulto"
else
  puts "Idoso"
end

# Ternário
status = idade >= 18 ? "Adulto" : "Menor"

# Modificador (if no final)
puts "Aprovado!" if nota >= 7
puts "Reprovado!" unless nota >= 7
```

### Case/When

```ruby
dia = 3

case dia
when 1
  puts "Segunda"
when 2
  puts "Terça"
when 3
  puts "Quarta"
else
  puts "Outro dia"
end

# Com ranges
case idade
when 0..12
  puts "Criança"
when 13..17
  puts "Adolescente"
when 18..60
  puts "Adulto"
else
  puts "Idoso"
end
```

### Loops

```ruby
# While
contador = 0
while contador < 5
  puts contador
  contador += 1
end

# Until (oposto de while)
contador = 5
until contador == 0
  puts contador
  contador -= 1
end

# Loop infinito (cuidado!)
loop do
  puts "Infinito"
  break if condicao_parada
end

# For em range
for i in 1..5
  puts i
end

# Break e next
(1..10).each do |n|
  next if n % 2 == 0    # Pula pares
  break if n > 7        # Sai quando > 7
  puts n                # Imprime: 1, 3, 5, 7
end
```

---

## 📞 Métodos Básicos

### Definição

```ruby
# Simples
def saudacao
  "Olá"
end

# Com parâmetros
def somar(a, b)
  a + b
end

# Com valor padrão
def apresentar(nome, idade = 18)
  "#{nome} tem #{idade} anos"
end

# Múltiplos retornos
def coordenadas
  [10, 20]  # Array é retornado
end

x, y = coordenadas  # Desempacotamento

# Argumentos variáveis
def listar(*items)
  items.each { |item| puts item }
end

listar("A", "B", "C")

# Argumentos nomeados
def criar_usuario(nome:, email:, idade: 18)
  puts "Nome: #{nome}, Email: #{email}, Idade: #{idade}"
end

criar_usuario(nome: "João", email: "joao@example.com")
```

### Documentação com RDoc

```ruby
# Calcula a soma de dois números
#
# @param [Integer] a Primeiro número
# @param [Integer] b Segundo número
# @return [Integer] A soma de a e b
#
# @example
#   somar(3, 5)  # => 8
def somar(a, b)
  a + b
end
```

---

## 📊 Mapa Conceitual: Estrutura de um Script Ruby

```
┌────────────────────────────────┐
│    Script Ruby (arquivo.rb)    │
├────────────────────────────────┤
│  1. require/require_relative   │ Imports
│  2. Constantes                 │ CONFIG = ...
│  3. Definições de Classes      │ class MyClass
│  4. Definições de Métodos      │ def my_method
│  5. Código de Execução         │ result = my_method
│  6. Output                     │ puts result
└────────────────────────────────┘
```

---

## 🔍 Conversion (Tipo)

### Conversão Explícita

```ruby
# Para String
25.to_s               # "25"
3.14.to_s             # "3.14"
true.to_s             # "true"

# Para Integer
"42".to_i             # 42
"3.14".to_i           # 3 (trunca)
true.to_i             # 1
false.to_i            # 0

# Para Float
"3.14".to_f           # 3.14
42.to_f               # 42.0

# Para Symbol
"chave".to_sym        # :chave
:chave.to_s           # "chave"

# Método generic
Integer("42")         # 42 (lança erro se inválido)
Float("3.14")         # 3.14
String(42)            # "42"
```

### Conversão Implícita

```ruby
# Booleano em condicional
if "string"
  puts "Verdadeiro!"  # Executa (toda string é truthy)
end

if 0
  puts "Sim!"  # Executa (0 é truthy em Ruby!)
end

if false
  puts "Não"  # Não executa
end

if nil
  puts "Não"  # Não executa
end
```

---

## 🔍 Valores Truthy e Falsy

```ruby
# FALSY (apenas 2 valores)
false      # É falso
nil        # É nulo

# TRUTHY (tudo mais!)
true       # É verdadeiro
0          # Número zero é TRUTHY
""         # String vazia é TRUTHY
[]         # Array vazio é TRUTHY
{}         # Hash vazio é TRUTHY
:simbolo   # Símbolo é TRUTHY
```

---

## 💾 Constantes

```ruby
# Definir (por convenção, maiúsculas)
MAX_USUARIOS = 100
APP_VERSION = "1.0.0"
DATABASE_URL = "postgresql://..."

# Acessar
puts MAX_USUARIOS

# Mudar constante (gera warning)
MAX_USUARIOS = 200  # => warning: already initialized constant

# Constante em classe
class Aplicacao
  VERSION = "2.0"
  
  def versao
    VERSION  # Acessa constante de classe
  end
end
```

---

## 🎭 Convenções Ruby (Style Guide)

```ruby
# ✅ BOAS PRÁTICAS
def nome_do_metodo
  # snake_case
end

CONSTANTE = 42

class MinhaClasse
  # CamelCase
end

# ✅ Dois espaços para indentação
if verdadeiro
  puts "Indentado"
end

# ✅ Linha em branco entre métodos
def primeiro_metodo
  "resultado"
end

def segundo_metodo
  "outro resultado"
end

# ❌ MÁ PRÁTICA (evite)
def nomeDoMetodo; end      # CamelCase em método
def METODO_GRANDE; end     # MAIÚSCULAS em método
    puts "4 espaços"       # Mais de 2 espaços
```

---

## 📊 Resumo Rápido

| Conceito | Sintaxe | Exemplo |
|----------|---------|---------|
| **Comentário** | `#` | `# Isso é um comentário` |
| **String** | `""` ou `''` | `"Olá"` |
| **Número** | Sem aspas | `42` ou `3.14` |
| **Array** | `[]` | `[1, 2, 3]` |
| **Hash** | `{}` | `{a: 1, b: 2}` |
| **If** | `if/elsif/else/end` | `if x > 5; puts "Sim"; end` |
| **Método** | `def/end` | `def meu_metodo; end` |
| **Classe** | `class/end` | `class MinhaClasse; end` |
| **Símbolo** | `:` | `:chave` |
| **Range** | `..` ou `...` | `1..10` ou `1...10` |

---

## ✅ Checklist de Conceitos Básicos

- [ ] Consigo criar variáveis e atribuir valores
- [ ] Entendo a diferença entre `nil`, `false` e `true`
- [ ] Posso usar strings com interpolação
- [ ] Conheço os operadores aritméticos básicos
- [ ] Consigo escrever if/elsif/else
- [ ] Sei usar case/when
- [ ] Posso definir e chamar métodos
- [ ] Entendo loops (while, for, each)
- [ ] Sei converter tipos (to_i, to_s, to_f)
- [ ] Conheço algumas convenções Ruby

---

## 📚 Referências

- Ruby Official Documentation
- Ruby Guides: Basics
- The Odin Project: Ruby Basics
- Ruby Style Guide (RuboCop)
- Programming Ruby (Pickaxe Book)
