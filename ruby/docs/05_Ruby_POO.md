# POO em Ruby: Programação Orientada a Objetos

> **Última atualização:** Agosto de 2026 | Ruby 4.0+

## 🎯 O que é POO?

<cite index="111-1">Object-Oriented Programming (OOP) é como organizar seu código usando blocos de construção chamados "objetos". Esses objetos têm poderes especiais—podem armazenar informações e executar ações. Em Ruby, a POO é uma característica fundamental.</cite>

**Simples:** Você organiza código em **objetos** que têm **dados** e **comportamentos**.

---

## 🏗️ Os 4 Pilares da POO

### 1️⃣ Encapsulamento

```ruby
class ContaBancaria
  # Dados privados (encapsulados)
  @saldo = 0
  @titular = ""
  
  def initialize(titular, saldo_inicial)
    @titular = titular
    @saldo = saldo_inicial
  end
  
  # Interface pública
  def depositar(valor)
    @saldo += valor if valor > 0
  end
  
  def saldo
    @saldo
  end
  
  # Método privado (não acessível fora da classe)
  private
  
  def validar_saldo
    @saldo >= 0
  end
end

conta = ContaBancaria.new("João", 1000)
conta.depositar(500)
conta.saldo  # => 1500

# ❌ Não pode acessar direto
# conta.@saldo = 10000  # Erro!
```

### 2️⃣ Herança

<cite index="117-1">Herança permite que uma classe herde atributos e métodos de outra, promovendo reutilização de código e reduzindo redundância. Em Ruby, herança é implementada usando o símbolo <, onde a subclasse ganha acesso às propriedades e comportamentos da classe pai.</cite>

```ruby
# Classe Pai (Superclasse)
class Animal
  def initialize(nome)
    @nome = nome
  end
  
  def fazer_som
    "Som genérico"
  end
  
  def apresentar
    "#{@nome}: #{fazer_som}"
  end
end

# Classe Filha (Subclasse)
class Cachorro < Animal
  def fazer_som
    "Au au!"  # Sobrescreve o método pai
  end
  
  def trazer
    "#{@nome} está trazendo!"
  end
end

class Gato < Animal
  def fazer_som
    "Miau!"  # Sobrescreve o método pai
  end
  
  # Usa super para chamar método da classe pai
  def apresentar_completo
    "Gato: " + super
  end
end

# Usando
dog = Cachorro.new("Rex")
puts dog.apresentar           # => "Rex: Au au!"
puts dog.trazer               # => "Rex está trazendo!"

cat = Gato.new("Whiskers")
puts cat.apresentar_completo  # => "Gato: Whiskers: Miau!"
```

### 3️⃣ Polimorfismo

<cite index="109-1">Polimorfismo é um princípio fundamental da POO que permite que objetos de tipos diferentes sejam tratados como se pertencessem a uma superclasse comum ou compartilhassem uma interface comum.</cite>

```ruby
# Mesma mensagem, comportamentos diferentes
class Veiculo
  def acelerar
    raise NotImplementedError
  end
end

class Carro < Veiculo
  def acelerar
    "Carro acelerando: VROOOOM"
  end
end

class Bicicleta < Veiculo
  def acelerar
    "Bicicleta pedalando: choff choff"
  end
end

class Navio < Veiculo
  def acelerar
    "Navio avançando: whoooosh"
  end
end

# Polimorfismo em ação!
veiculos = [Carro.new, Bicicleta.new, Navio.new]

veiculos.each do |veiculo|
  puts veiculo.acelerar
end

# Resultado:
# Carro acelerando: VROOOOM
# Bicicleta pedalando: choff choff
# Navio avançando: whoooosh
```

### 4️⃣ Abstração

```ruby
# Classe abstrata (padrão em Ruby)
class Funcionario
  def initialize(nome, salario)
    @nome = nome
    @salario = salario
  end
  
  def calcular_bonus
    raise NotImplementedError, "Subclasses devem implementar"
  end
end

class Desenvolvedor < Funcionario
  def calcular_bonus
    @salario * 0.2  # 20%
  end
end

class Gerente < Funcionario
  def calcular_bonus
    @salario * 0.3  # 30%
  end
end

dev = Desenvolvedor.new("Maria", 5000)
puts dev.calcular_bonus  # => 1000

gerente = Gerente.new("João", 8000)
puts gerente.calcular_bonus  # => 2400
```

---

## 📊 Tabela: POO em Ruby vs JavaScript

| Conceito | Ruby | JavaScript |
|----------|------|-----------|
| **Classe** | `class` | `class` (ES6+) |
| **Herança** | `<` | `extends` |
| **Constructor** | `initialize` | `constructor()` |
| **Instância** | `ClassName.new` | `new ClassName()` |
| **Encapsulamento** | `private`, `protected` | `#private` (2022+) |
| **Método de Classe** | `def self.método` | `static método()` |
| **Super** | `super` | `super.método()` |
| **self** | `self` | `this` |

---

## 🔑 Conceitos Importantes

### Atributos

```ruby
class Pessoa
  # Declarar atributos
  attr_reader :nome          # Apenas leitura
  attr_writer :idade         # Apenas escrita
  attr_accessor :email       # Leitura e escrita
  
  def initialize(nome, idade, email)
    @nome = nome
    @idade = idade
    @email = email
  end
end

pessoa = Pessoa.new("Maria", 30, "maria@example.com")

puts pessoa.nome      # => "Maria" (reader)
pessoa.email = "novo@example.com"  # writer
puts pessoa.email     # => "novo@example.com"

# pessoa.idade = 31  # ❌ Erro - age não tem setter
```

### Visibilidade (Access Modifiers)

```ruby
class Bancario
  # Public - acessível de qualquer lugar
  def saldo_publico
    "Saldo: #{@saldo}"
  end
  
  # Protected - acessível só dentro da classe e subclasses
  protected
  
  def calcular_juros
    @saldo * 0.05
  end
  
  # Private - acessível só dentro da classe
  private
  
  def validar_senha(senha)
    # código de validação
  end
end
```

### Construtores e Inicialização

```ruby
class Usuario
  def initialize(nome, email)
    @nome = nome
    @email = email
    @criado_em = Time.now
  end
end

usuario = Usuario.new("João", "joao@example.com")
```

### Métodos de Classe vs Instância

```ruby
class Contador
  @@total = 0  # Variável de classe (compartilhada)
  
  def initialize
    @@total += 1
  end
  
  # Método de instância
  def info
    "Esta é uma instância"
  end
  
  # Método de classe
  def self.total
    @@total
  end
end

c1 = Contador.new
c2 = Contador.new
c3 = Contador.new

Contador.total  # => 3
```

---

## 🧩 Mapa Conceitual: Estrutura de uma Classe

```
┌──────────────────────────┐
│      Classe Pessoa       │
├──────────────────────────┤
│   ATRIBUTOS              │ Data/Estado
│   @nome                  │
│   @idade                 │
│   @email                 │
├──────────────────────────┤
│   MÉTODOS                │ Comportamentos
│   - initialize()         │
│   - apresentar()         │
│   - fazer_aniversario()  │
│   - private validar()    │
├──────────────────────────┤
│   CONSTANTES             │
│   MAXIMO_IDADE = 150     │
└──────────────────────────┘
```

---

## 💻 Exemplo Completo: Sistema de Biblioteca

```ruby
# Classe base
class Livro
  attr_accessor :titulo, :autor, :isbn
  
  def initialize(titulo, autor, isbn)
    @titulo = titulo
    @autor = autor
    @isbn = isbn
  end
  
  def resumo
    "#{@titulo} por #{@autor}"
  end
end

# Subclasse
class LivroFisico < Livro
  attr_accessor :paginas, :localizacao
  
  def initialize(titulo, autor, isbn, paginas, localizacao)
    super(titulo, autor, isbn)
    @paginas = paginas
    @localizacao = localizacao
  end
  
  def info_completa
    "#{resumo} (#{@paginas} páginas) - #{@localizacao}"
  end
end

class LivroDigital < Livro
  attr_accessor :formato, :tamanho_mb
  
  def initialize(titulo, autor, isbn, formato, tamanho_mb)
    super(titulo, autor, isbn)
    @formato = formato
    @tamanho_mb = tamanho_mb
  end
  
  def info_completa
    "#{resumo} (#{@formato}, #{@tamanho_mb}MB)"
  end
end

class Biblioteca
  def initialize(nome)
    @nome = nome
    @livros = []
  end
  
  def adicionar(livro)
    @livros << livro
  end
  
  def listar_todos
    @livros.each do |livro|
      puts livro.info_completa
    end
  end
  
  def buscar(titulo)
    @livros.find { |livro| livro.titulo.include?(titulo) }
  end
end

# Usar
bib = Biblioteca.new("Biblioteca Municipal")
bib.adicionar(LivroFisico.new("1984", "George Orwell", "123-456", 328, "Prateleira A1"))
bib.adicionar(LivroDigital.new("Sapiens", "Yuval Harari", "456-789", "PDF", 12.5))

bib.listar_todos
# => 1984 por George Orwell (328 páginas) - Prateleira A1
# => Sapiens por Yuval Harari (PDF, 12.5MB)
```

---

## 🎭 Modules (Mixins)

Quando você precisa de múltiplas "heranças":

```ruby
module Soador
  def voar
    "Estou voando!"
  end
end

module Nadador
  def nadar
    "Estou nadando!"
  end
end

class Pato
  include Soador
  include Nadador
end

pato = Pato.new
puts pato.voar   # => "Estou voando!"
puts pato.nadar  # => "Estou nadando!"
```

---

## ⚠️ Anti-patterns (O que evitar)

❌ **Não faça:**

```ruby
# 1. Classes muito grandes (God Object)
class Usuario
  # 500 linhas de código...
end

# 2. Muitos níveis de herança
class A < B < C < D < E
  # Difícil de manter
end

# 3. Violar encapsulamento
def mudar_saldo_direto(valor)
  conta.instance_variable_set(:@saldo, valor)  # NÃO!
end

# 4. Herança sem razão
class Carro < Veiculo < Objeto < BasicObject
  # Quando composição seria melhor
end
```

✅ **Faça:**

```ruby
# 1. Classes com responsabilidade única
class Usuario
  # Apenas operações de usuário
end

class UsuarioAutenticador
  # Apenas autenticação
end

# 2. Herança rasa
class Animal < Object
  # OK
end

# 3. Respeitar encapsulamento
class ContaBancaria
  def depositar(valor)
    @saldo += valor
  end
end

# 4. Prefira composição
class Carro
  def initialize(motor, rodas)
    @motor = motor
    @rodas = rodas
  end
end
```

---

## 📚 Resumo da Hierarquia de Classes em Ruby

```
BasicObject          # Classe mãe de tudo
    ↓
Object              # Classe base
    ↓
┌───┬────┬────────┐
│   │    │        │
Class Module String ...

Sua Classe → Animal → Cachorro
```

---

## ✅ Checklist Final de POO

- [ ] Entendo encapsulamento (public/private/protected)
- [ ] Consigo criar classes e subclasses
- [ ] Sei usar herança corretamente
- [ ] Entendo o que é polimorfismo
- [ ] Consigo usar Modules (mixins)
- [ ] Conheço `attr_accessor`, `attr_reader`, `attr_writer`
- [ ] Entendo a diferença entre método de classe e instância
- [ ] Consigo usar `super` para chamar método pai
- [ ] Reconheço quando usar composição vs herança

---

## 📚 Referências

- Medium: Understanding OOP in Ruby (Marwan Zaarab)
- Scaler Topics: Polymorphism in Ruby
- DEV Community: A Beginner's Guide to OOP in Ruby
- CodeSignal: Introduction to Polymorphism
- Thoughtbot: Back to Basics: Polymorphism and Ruby
- LaunchSchool: Object Model e Inheritance/Method Overriding
- Medium: OOP in Ruby - Encapsulation, Inheritance & Polymorphism
