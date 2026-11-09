# Ruby's `Self`: O Objeto Atual

> **Última atualização:** Agosto de 2026 | Ruby 4.0+

## 🎯 O que é `Self`?

<cite index="82-1">A palavra-chave self em Ruby especifica o contexto ou objeto atual em qualquer dado momento durante a execução do código. Ela serve como um mecanismo para identificar o objeto com o qual o código está trabalhando.</cite>

**Simples:** `self` é um **pronome pessoal** em Ruby que sempre se refere ao **objeto atual do contexto**.

---

## 📊 Comparação: `self` em Ruby vs `this` em JavaScript

| Aspecto | Ruby `self` | JavaScript `this` |
|---------|-----------|-------------------|
| **Definição** | Objeto dono do código atual | Contexto de execução |
| **Constância** | Sempre um objeto específico | Varia com chamada |
| **Em função** | Receptor do método | Depende de strict mode |
| **Em classe** | A classe sendo definida | O objeto/classe |
| **Previsibilidade** | Muito previsível | Pode ser confuso |
| **Bind** | Implícito | Pode exigir .bind() |

```javascript
// JavaScript - CONFUSO
function greet() {
  console.log(this); // undefined (strict) ou window (sloppy)
}

const obj = {
  name: "Alice",
  greet: function() {
    console.log(this.name); // "Alice" - mas isso pode mudar!
  }
};

obj.greet();              // "Alice"
const method = obj.greet;
method();                 // undefined or window!
```

```ruby
# Ruby - CLARO
class Person
  def greet
    puts self   # SEMPRE a instância Person
    puts self.class # Sempre a classe
  end
end

person = Person.new
person.greet # <Person:0x...>
```

---

## 🔍 As 3 Regras Principais para Determinar `Self`

### Regra 1️⃣: Contexto Top-Level (Fora de classes)

```ruby
puts self  # => main
puts self.class  # => Object

# Qualquer método definido aqui pertence a main
def meu_metodo
  puts self  # => main
end

meu_metodo
```

**Interpretação:** No nível superior de um script Ruby, `self` refere-se ao objeto `main`, que é uma instância de Object.

### Regra 2️⃣: Dentro de Definição de Classe/Módulo

```ruby
class Pessoa
  puts self  # => Pessoa (a classe sendo definida)
  
  def initialize(nome)
    @nome = nome
  end
  
  # Inside a class but outside methods = self is the class
  CLASS_ATTRIBUTE = "valor"
end

class Animal
  puts self  # => Animal
end
```

**Interpretação:** Dentro de uma classe mas FORA dos métodos, `self` refere-se à classe sendo definida.

### Regra 3️⃣: Dentro de Definição de Método

```ruby
class Pessoa
  def apresentar
    puts self        # => a instância (ex: #<Pessoa:0x...>)
    puts self.class  # => Pessoa
  end
end

pessoa = Pessoa.new
pessoa.apresentar  # self = pessoa
```

**Interpretação:** Dentro de um método de instância, `self` refere-se ao objeto receptor (a instância).

---

## 📚 Mapa Conceitual de `Self`

```
                         ┌──────────────────┐
                         │   self - Contexto│
                         └────────┬─────────┘
                                  │
                  ┌───────────────┼────────────────┐
                  │               │                │
           ┌──────▼──────┐ ┌─────▼──────┐ ┌──────▼──────┐
           │ Top-Level   │ │   Class    │ │   Instance │
           │   Context   │ │ Definition │ │   Method   │
           └──────┬──────┘ └─────┬──────┘ └──────┬──────┘
                  │              │                │
              self = main    self = Classe    self = objeto
              (Object)                          instância
```

---

## 💡 Casos de Uso Prático de `Self`

### Caso 1: Acessar Atributos de Instância

```ruby
class Veiculo
  def initialize(marca, modelo)
    @marca = marca
    @modelo = modelo
  end
  
  # Com self (explícito e claro)
  def info
    "#{self.marca} #{self.modelo}"
  end
  
  # Sem self (implícito, mas menos claro)
  def info_alt
    "#{marca} #{modelo}"  # Ruby procura getter methods
  end
  
  def marca
    @marca
  end
  
  def modelo
    @modelo
  end
end

carro = Veiculo.new("Toyota", "Corolla")
puts carro.info  # => "Toyota Corolla"
```

### Caso 2: Evitar Conflitos de Nome

```ruby
class Usuario
  def initialize(nome)
    @nome = nome
  end
  
  def definir_nome(nome)  # parâmetro 'nome' ou @nome?
    # Sem self: qual 'nome' você quer?
    # nome = "novo"  # Atribui ao parâmetro local
    
    # Com self: cristalino
    self.nome = "novo"  # Chama o setter
    self.nome = nome     # Atribui o parâmetro
  end
  
  def nome=(nome)
    @nome = nome
  end
  
  def nome
    @nome
  end
end
```

### Caso 3: Definir Métodos de Classe

```ruby
class Aplicacao
  # Método de instância
  def iniciar
    puts "App iniciando..."
  end
  
  # Método de classe - note self.método_classe
  def self.versao
    "1.0.0"
  end
  
  # Outra forma: class << self
  class << self
    def autor
      "João Silva"
    end
    
    def data_lancamento
      "2026-01-15"
    end
  end
end

app = Aplicacao.new
app.iniciar           # => "App iniciando..."

# Métodos de classe são chamados na classe
Aplicacao.versao      # => "1.0.0"
Aplicacao.autor       # => "João Silva"
```

### Caso 4: Retornar a Instância (para encadeamento)

```ruby
class StringBuilder
  def initialize
    @conteudo = ""
  end
  
  def adicionar(texto)
    @conteudo += texto
    self  # Retorna a instância para encadeamento
  end
  
  def maiuscula
    @conteudo = @conteudo.upcase
    self  # Permite continuar encadeando
  end
  
  def para_string
    @conteudo
  end
end

# Encadeamento (method chaining)
resultado = StringBuilder.new
  .adicionar("Olá")
  .adicionar(" ")
  .adicionar("Mundo")
  .maiuscula
  .para_string

puts resultado  # => "OLÁ MUNDO"
```

### Caso 5: Singleton Methods (Métodos em Objetos Individuais)

```ruby
# Método definido apenas neste objeto
string = "Olá"

def string.grito
  self.upcase + "!!!"  # self = este objeto string
end

puts string.grito  # => "OLÁ!!!"

outra_string = "Oi"
# outra_string.grito  # ❌ Erro - método não existe nela!
```

---

## 🚀 Contexto Mudando Dinamicamente

```ruby
class Relatorio
  def titulo
    "Relatório"
  end
  
  def processar
    puts self              # => #<Relatorio:0x...>
    
    # Passando self para outro método
    analisar(self)
  end
  
  def analisar(objeto)
    puts self              # => #<Relatorio:0x...> (ainda o mesmo)
    puts objeto            # => #<Relatorio:0x...>
    puts objeto == self    # => true
  end
end

relatorio = Relatorio.new
relatorio.processar
```

---

## ⚠️ Pegadinhas Comuns

### Pegadinha 1: Não é Necessário Usar `Self` para Variáveis Locais

```ruby
class Pessoa
  def iniciar(nome)
    # nome é uma variável LOCAL, não atributo
    nome = "valor"
    self.nome = "outro"  # isto SIM é um atributo (via setter)
  end
end
```

### Pegadinha 2: Métodos Sem Parênteses Podem Ser Confusos

```ruby
class Pessoa
  def saudacao
    "Olá"
  end
  
  def falar
    # Qual é 'saudacao'?
    # 1. Uma variável local?
    # 2. Um método de self?
    
    # Ruby assume:
    puts saudacao  # => "Olá" (método)
    
    # Ser explícito é melhor
    puts self.saudacao  # => "Olá" (cristalino)
  end
end
```

### Pegadinha 3: `Self` Muda em Blocos

```ruby
class Pessoa
  attr_accessor :nome
  
  def initialize(nome)
    @nome = nome
  end
  
  def processar_nomes(nomes)
    puts self  # => #<Pessoa:0x...>
    
    nomes.each do |nome|
      puts self  # => Ainda #<Pessoa:0x...> (self não muda!)
      puts nome  # => "João", "Maria", etc.
    end
  end
end
```

---

## 📊 Tabela Comparativa: Quando Usar `Self`

| Situação | Usar? | Exemplo |
|----------|-------|---------|
| Chamar método de instância | **Sim** | `self.saudacao` |
| Acessar variável local | **Não** | `nome` |
| Acessar atributo via getter | **Opcional** | `self.@nome` ou `nome` |
| Definir atributo via setter | **Sim** | `self.idade = 25` |
| Evitar conflito de nome | **Sim** | `self.valor = valor` |
| Método de classe | **Sim** | `def self.criar` |
| Passar a instância | **Sim** | `processar(self)` |

---

## 🔄 Comparação Prática: Ruby vs JavaScript

### Ruby

```ruby
class Conta
  attr_accessor :saldo
  
  def initialize(saldo)
    @saldo = saldo
  end
  
  def depositar(valor)
    self.saldo += valor
    self  # Retorna a conta para encadeamento
  end
  
  def self.criar_padrao
    self.new(0)  # self.new = Conta.new
  end
end

conta = Conta.criar_padrao
conta.depositar(100).depositar(50)
puts conta.saldo  # => 150
```

### JavaScript

```javascript
class Conta {
  constructor(saldo) {
    this.saldo = saldo;
  }
  
  depositar(valor) {
    this.saldo += valor;
    return this;  // Retorna para encadeamento
  }
  
  static criarPadrao() {
    return new this(0);  // this.constructor
  }
}

const conta = Conta.criarPadrao();
conta.depositar(100).depositar(50);
console.log(conta.saldo);  // => 150
```

---

## 🎓 Resumo das 3 Regras

| Contexto | `self` refere-se a | Exemplo |
|----------|-------------------|---------|
| **Top-level** | `main` (Object) | `puts self` na raiz |
| **Classe** | A classe | `puts self` em Class Foo |
| **Método** | O receptor (instância) | `def m; self; end` |

---

## ✅ Checklist Final

- [ ] Entendo que `self` é sempre um objeto
- [ ] Sei que `self` muda baseado no contexto
- [ ] Posso explicar as 3 regras de `self`
- [ ] Consigo usar `self` para métodos de classe
- [ ] Entendo quando `self` é necessário vs. opcional
- [ ] Reconheço `this` em JavaScript é diferente

---

## 📚 Referências

- Scaler Topics: Ruby self Class
- Ruby Self Keyword - Zetcode
- AlsoHelp: Ruby, the self keyword
- Honeybadger Developer Blog: Ruby self cheat sheet
- Dev.to: Self and This
- Sihui.io: Who are you? Self-awareness in Ruby
