# Ruby Gems: Pacotes e Dependências

> **Última atualização:** Agosto de 2026 | Ruby 4.0+ | RubyGems 3.7+

## 🎁 O que é um Gem?

<cite index="103-1">Gems são bibliotecas de código-fonte empacotadas que são modulares, independentes e facilmente reutilizáveis entre projetos. RubyGems é o repositório central de pacotes onde gems de terceiros e open source são compartilhadas.</cite>

**Simples:** Um gem é um **pacote reutilizável** de código Ruby.

---

## 📊 Gems vs Packages em Outras Linguagens

| Linguagem | Gerenciador | Nome | Arquivo |
|-----------|-------------|------|---------|
| Ruby | RubyGems | Gem | `gem.gemspec` |
| Python | Pip | Package | `setup.py` |
| JavaScript | npm/yarn | Package | `package.json` |
| JavaScript | pnpm | Package | `package.json` |
| Go | Go Modules | Module | `go.mod` |
| Rust | Cargo | Crate | `Cargo.toml` |

---

## 🚀 Instalando Gems

### Instalação Simples

```bash
# Instalar um gem
gem install rails

# Instalar versão específica
gem install rails --version 8.1.3

# Instalar múltiplos gems
gem install rails bundler rspec

# Listar gems instalados
gem list

# Desinstalar um gem
gem uninstall rails
```

### Verificar Versão do RubyGems

```bash
gem --version
# => 3.7.0 (ou superior em 2026)

gem environment
# Mostra caminho de instalação e configurações
```

---

## 📋 Gemfile: Declarar Dependências

Um `Gemfile` especifica quais gems seu projeto precisa.

```ruby
# Gemfile
source 'https://rubygems.org'

# Gems gerais
gem 'rails', '~> 8.1.3'
gem 'pg', '~> 1.5'                # PostgreSQL
gem 'puma', '~> 6.4'              # Web server
gem 'sass-rails', '~> 6.0'        # SCSS
gem 'webpacker', '~> 6.0'         # JavaScript bundler
gem 'redis', '~> 5.0'             # Cache store

# Gems de desenvolvimento
group :development, :test do
  gem 'rspec-rails', '~> 6.1'
  gem 'factory_bot_rails', '~> 6.4'
  gem 'faker', '~> 3.2'
  gem 'pry-rails'
end

# Gems apenas de desenvolvimento
group :development do
  gem 'rubocop', '~> 1.59', require: false
  gem 'rubocop-rails', '~> 2.23', require: false
  gem 'brakeman', '~> 8.0', require: false
end

# Gems apenas de teste
group :test do
  gem 'simplecov', '~> 0.22'
  gem 'webmock', '~> 3.19'
end

# Gems apenas de produção
group :production do
  gem 'sentry-rails', '~> 5.14'
  gem 'newrelic_rpm'
end
```

---

## 📌 Versioning: Especificar Versões

### Operadores de Versão

| Operador | Significado | Exemplo | Instala |
|----------|-------------|---------|---------|
| `=` | Exata | `'= 1.0.0'` | Apenas 1.0.0 |
| `>` | Maior | `'> 1.0.0'` | Qualquer > 1.0.0 |
| `<` | Menor | `'< 2.0.0'` | Qualquer < 2.0.0 |
| `>=` | Maior/igual | `'>= 1.0.0'` | 1.0.0+ |
| `<=` | Menor/igual | `'<= 2.0.0'` | Até 2.0.0 |
| `~>` | **Pessimistic** | `'~> 1.5.2'` | 1.5.2 até < 1.6.0 |
| `!= ` | Diferente | `'!= 2.0.0'` | Tudo menos 2.0.0 |

```ruby
# Exemplos práticos
gem 'rails', '~> 8.1'      # 8.1.0 até < 8.2.0 (RECOMENDADO)
gem 'rspec', '~> 3.12.0'   # 3.12.0 até < 3.13.0
gem 'devise'               # Última versão
gem 'old_gem', '= 1.0.0'   # Exatamente 1.0.0
```

---

## 🔧 Bundler: Gerenciar Dependências

### Instalando Dependências

```bash
# Instalar todas as gems do Gemfile
bundle install

# Ou mais sucintamente
bundle

# Apenas atualizar lock file sem instalar
bundle lock

# Atualizar gems para versões mais novas
bundle update
bundle update rails              # Apenas um gem
```

### Gemfile.lock

```
GEM
  remote: https://rubygems.org/
  specs:
    actioncable (8.1.3)
      actionpack (= 8.1.3)
    actionpack (8.1.3)
      actionview (= 8.1.3)
    rspec-rails (6.1.2)
      rspec-core (~> 3.12.0)
      rspec-expectations (~> 3.12.0)

PLATFORMS
  ruby
  x86_64-linux

DEPENDENCIES
  rails (~> 8.1.3)
  rspec-rails (~> 6.1)

BUNDLED WITH
   2.5.3
```

**O que é Gemfile.lock?**
- Arquivo **gerado automaticamente**
- Registra **versões exatas** instaladas
- Garante **consistência** em todos os ambientes
- **Sempre commit** no Git (aplicações)
- **Nunca commit** (para gems/libraries)

---

## 🎯 Gems Mais Populares (2026)

### Web & Framework

| Gem | Uso | Versão 2026 |
|-----|-----|------------|
| `rails` | Web framework | 8.1.3+ |
| `sinatra` | Micro-framework | 4.x |
| `hanami` | Web framework moderno | 2.x |

### Banco de Dados

| Gem | Uso | Versão 2026 |
|-----|-----|------------|
| `pg` | PostgreSQL | 1.5+ |
| `mysql2` | MySQL | 0.5+ |
| `sqlite3` | SQLite | 1.6+ |
| `mongoid` | MongoDB | 8.x |
| `redis` | Redis cache | 5.0+ |

### Testing

| Gem | Uso | Versão 2026 |
|-----|-----|------------|
| `rspec` | Testing framework | 3.12+ |
| `minitest` | Built-in testing | 5.20+ |
| `capybara` | Integration testing | 3.39+ |
| `factory_bot` | Fixtures | 6.4+ |

### API & Serialization

| Gem | Uso | Versão 2026 |
|-----|-----|------------|
| `activemodel-serializers-xml` | XML | 1.0+ |
| `jbuilder` | JSON responses | 2.12+ |
| `jsonapi-resources` | JSON:API | 0.10+ |

---

## 💻 Criando um Gem Próprio

### Estrutura de um Gem

```
meu_gem/
├── lib/
│   └── meu_gem/
│       └── version.rb
│       └── meu_gem.rb
├── spec/
│   └── spec_helper.rb
│   └── meu_gem_spec.rb
├── Gemfile
├── meu_gem.gemspec
├── LICENSE
├── README.md
└── Rakefile
```

### Gemspec Básico

```ruby
# meu_gem.gemspec
Gem::Specification.new do |spec|
  spec.name        = "meu_gem"
  spec.version     = MeuGem::VERSION
  spec.authors     = ["João Silva"]
  spec.email       = ["joao@example.com"]
  
  spec.summary     = "Uma breve descrição"
  spec.description = "Descrição mais longa do gem"
  spec.homepage    = "https://github.com/joao/meu_gem"
  spec.license     = "MIT"
  
  spec.files       = Dir.glob("lib/**/*")
  spec.test_files  = Dir.glob("spec/**/*")
  spec.executables = ["meu_gem"]
  
  # Dependências de runtime
  spec.add_dependency "rails", ">= 7.0"
  spec.add_dependency "redis", "~> 5.0"
  
  # Dependências de desenvolvimento
  spec.add_development_dependency "rspec", "~> 3.12"
  spec.add_development_dependency "rubocop", "~> 1.59"
end
```

### Publicar no RubyGems

```bash
# Criar conta em rubygems.org
gem signin

# Construir o gem
gem build meu_gem.gemspec

# Publicar
gem push meu_gem-0.1.0.gem
```

---

## 🔒 Segurança com Gems

### Auditar Dependências

```bash
# Verificar vulnerabilidades conhecidas
bundle audit

# Atualizar database de vulnerabilidades
bundle audit update
```

### Usar Bundler para Isolamento

```bash
# Executar comando com gems do Gemfile
bundle exec rails server
bundle exec rspec
bundle exec rake db:migrate
```

### Verificar Checksums

```ruby
# Gemfile
source 'https://rubygems.org'

gem 'rails', '8.1.3', checksum: 'abc123...'
```

---

## 📊 Mapa Conceitual: Gems em Ruby

```
┌─────────────────────────────┐
│      rubygems.org           │
│   (Repositório de Gems)     │
└────────────┬────────────────┘
             │
  gem install / bundle install
             │
             ▼
┌─────────────────────────────┐
│    Seu Computador           │
│    ~/.gem/ruby/X.X.X/gems   │
└────────────┬────────────────┘
             │
      Gemfile + Gemfile.lock
             │
             ▼
┌─────────────────────────────┐
│    Seu Projeto              │
│    (bundler.lock)           │
└────────────┬────────────────┘
             │
      bundle exec
             │
             ▼
      Sua Aplicação
```

---

## 🚀 Workflow Prático

```bash
# 1. Criar novo projeto Rails
rails new meu_projeto

# 2. Adicionar um gem
cd meu_projeto
bundle add devise

# Edita Gemfile e executa bundle install automaticamente
# Cria Gemfile.lock

# 3. Usar o gem no código
# app/models/user.rb
class User < ApplicationRecord
  devise :database_authenticatable
end

# 4. Atualizar gems
bundle update

# 5. Verificar segurança
bundle audit

# 6. Deploy
bundle install --deployment
bundle exec rails server
```

---

## ✅ Boas Práticas

1. **Sempre use bundler**
   ```bash
   bundle exec rails server  # ✅
   rails server              # ❌
   ```

2. **Commit Gemfile.lock**
   ```bash
   git add Gemfile Gemfile.lock
   ```

3. **Versione gems significativamente**
   ```ruby
   gem 'rails', '~> 8.1'    # ✅ Pessimistic
   gem 'rails'              # ❌ Sem versão
   gem 'rails', '8.1.0'     # ❌ Muito restritivo
   ```

4. **Separe gems por grupo**
   ```ruby
   group :development do
     gem 'rubocop'
   end
   ```

5. **Documento de dependências**
   ```ruby
   # Gem usado para autenticação
   gem 'devise', '~> 4.9'
   ```

---

## 📚 Referências

- RubyGems Official: rubygems.org
- RubyGems Guides: Basics and Command Reference
- Reintech: How to Use RubyGems Package Manager (2026)
- RubyLearning: Ruby Gems Guide
- DEV Community: A Definitive Guide to Ruby Gems
- Snyk: Ruby Gems Dependency Management
