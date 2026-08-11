# YAML em Ruby: Configuração e Serialização

> **Última atualização:** Agosto de 2026 | Ruby 4.0+

## 📖 O que é YAML?

<cite index="95-1">YAML (rhymes with 'camel') é um formato de serialização de dados simples e legível por máquina, projetado para legibilidade humana e interação com linguagens de script como Perl e Python. YAML é otimizado para serialização de dados, formatação estruturada, arquivos de configuração, arquivos de log e filtragem de Internet.</cite>

**YAML = "YAML Ain't Markup Language"** 😄

---

## 🎯 Quando Usar YAML

✅ **Use YAML para:**
- Arquivos de configuração
- Dados de teste
- Arquivos de tradução (i18n)
- Armazenamento de dados estruturados
- Configuração do banco de dados (Rails)

❌ **Evite YAML para:**
- Dados que mudam frequentemente
- Acesso muito rápido (use banco de dados)
- Estruturas muito complexas (use JSON)

---

## 📊 Tabela: YAML vs JSON vs Ruby Hash

| Aspecto | YAML | JSON | Ruby Hash |
|---------|------|------|-----------|
| **Legibilidade** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Indentação** | Significativa | Não | Não |
| **Comentários** | ✅ Sim | ❌ Não | ✅ Sim |
| **Tipos** | Múltiplos | Básicos | Múltiplos |
| **Performance** | Lento | Rápido | N/A |
| **Uso em Rails** | ✅ Padrão | ⚠️ Limitado | ✅ Nativo |

---

## 🔧 Sintaxe Básica YAML

### Dados Simples

```yaml
# Strings
nome: João Silva
email: joao@example.com
mensagem: "Olá, mundo!"

# Números
idade: 30
altura: 1.75
negativos: -42

# Booleanos
ativo: true
deletado: false
nulo: null
ou_nulo:  # Mesmo que null

# Arrays
frutas:
  - Maçã
  - Banana
  - Laranja

# Alternativa (inline)
numeros: [1, 2, 3, 4, 5]

# Hashes
pessoa:
  nome: Maria
  idade: 25
  profissao: Engenheira
```

### Estruturas Avançadas

```yaml
# Âncoras e Aliases (reutilizar dados)
defaults: &defaults
  timeout: 30
  retries: 3
  ssl: true

development:
  <<: *defaults           # Herda defaults
  database: dev_db
  
production:
  <<: *defaults           # Herda defaults  
  database: prod_db

# Resultado:
# development: { timeout: 30, retries: 3, ssl: true, database: dev_db }
# production: { timeout: 30, retries: 3, ssl: true, database: prod_db }
```

---

## 💻 Trabalhando com YAML em Ruby

### Carregando YAML

```ruby
require 'yaml'

# De um arquivo
config = YAML.load_file('config.yml')
config[:database][:host]  # => "localhost"

# De uma string
yaml_string = %{
  nome: João
  idade: 30
}
dados = YAML.load(yaml_string)
dados[:nome]  # => "João"
```

### Salvando para YAML

```ruby
require 'yaml'

dados = {
  nome: "Maria",
  idade: 28,
  habilidades: ["Ruby", "Rails", "JavaScript"]
}

# Escrever em arquivo
File.write('pessoas.yml', YAML.dump(dados))

# Resultado no arquivo:
# ---
# :nome: Maria
# :idade: 28
# :habilidades:
# - Ruby
# - Rails
# - JavaScript
```

### Rails: Configuração Database

```yaml
# config/database.yml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development:
  <<: *default
  database: myapp_development

test:
  <<: *default
  database: myapp_test

production:
  <<: *default
  database: myapp_production
  username: <%= ENV['DB_USERNAME'] %>
  password: <%= ENV['DB_PASSWORD'] %>
  host: <%= ENV['DB_HOST'] %>
```

### Exemplo Prático Completo

```ruby
# config/app_settings.yml
app:
  name: "Minha Aplicação"
  version: "1.0.0"
  
email:
  server: smtp.gmail.com
  port: 587
  enable_tls: true

features:
  notificacoes: true
  analytics: true
  modo_manutencao: false

limites:
  max_upload_mb: 10
  taxa_requisicoes: 100
```

```ruby
# config/application.rb
class ApplicationConfig
  SETTINGS = YAML.load_file(
    File.join(Rails.root, 'config', 'app_settings.yml')
  )
  
  def self.app_name
    SETTINGS['app']['name']
  end
  
  def self.feature_enabled?(feature)
    SETTINGS['features'][feature.to_s]
  end
end

# Usando:
ApplicationConfig.app_name                   # => "Minha Aplicação"
ApplicationConfig.feature_enabled?(:notificacoes)  # => true
```

---

## ⚠️ Segurança com YAML

### O Problema

```ruby
# PERIGOSO - permitir execução de código arbitrário!
YAML.load(usuario_input)  # ❌ NUNCA faça isso

# Exemplo de ataque:
malicioso = "--- !ruby/object:Gem::Installer
i: x
--- !ruby/object:Gem::SpecFetcher
i: y"

YAML.load(malicioso)  # Pode executar código! 😱
```

### A Solução

```ruby
# ✅ SEGURO - apenas tipos básicos
YAML.safe_load(usuario_input)

# Ou permitir classes específicas
YAML.safe_load(
  usuario_input,
  permitted_classes: [Symbol, Date, Time],
  permitted_symbols: [:a, :b, :c]
)

# ✅ RECOMENDADO para Rails
YAML.load_file('config.yml')  # Seguro em arquivos
```

---

## 📚 Mapa Conceitual: YAML em Ruby

```
┌─────────────────────────────┐
│      Arquivo YAML           │
│  config.yml / data.yml      │
└────────────┬────────────────┘
             │
             │ YAML.load_file()
             │
             ▼
┌─────────────────────────────┐
│   Ruby Hash/Array/Object    │
│   (em memória)              │
└────────────┬────────────────┘
             │
   ┌─────────┴──────────┐
   │                    │
   ▼                    ▼
YAML.dump()      Usar dados
   │              da aplicação
   │
   ▼
Salvar arquivo
```

---

## 🚀 Exemplo Real: Sistema de Configuração

```ruby
# config/settings.yml
database:
  host: localhost
  port: 5432
  timeout: 30

api:
  github:
    base_url: https://api.github.com
    timeout: 10
  
  openai:
    base_url: https://api.openai.com
    timeout: 30

storage:
  type: s3
  bucket: meu-bucket
  region: us-east-1

features:
  dark_mode: true
  beta_features: false
```

```ruby
# app/services/config_service.rb
class ConfigService
  @@settings = nil
  
  def self.settings
    @@settings ||= YAML.load_file(
      Rails.root.join('config', 'settings.yml')
    )
  end
  
  def self.get(path)
    keys = path.split('.')
    value = settings
    
    keys.each do |key|
      value = value[key]
      return nil if value.nil?
    end
    
    value
  end
end

# Uso:
ConfigService.get('database.host')      # => "localhost"
ConfigService.get('api.github.timeout') # => 10
ConfigService.get('features.dark_mode') # => true
```

---

## 🔍 Diferenças: YAML vs JSON vs Ruby

```yaml
# YAML (config.yml)
database:
  host: localhost
  port: 5432
  ssl: true
  # Comentário
```

```json
{
  "database": {
    "host": "localhost",
    "port": 5432,
    "ssl": true
  }
}
```

```ruby
# Ruby Hash
{
  database: {
    host: "localhost",
    port: 5432,
    ssl: true
  }
}
```

---

## ✅ Boas Práticas

1. **Use YAML para configurações estáticas**
   ```ruby
   # ✅ Bom
   CONFIG = YAML.load_file('config.yml')
   ```

2. **Nunca use YAML.load com entrada do usuário**
   ```ruby
   # ❌ Ruim
   user_data = YAML.load(params[:data])
   
   # ✅ Bom
   user_data = YAML.safe_load(params[:data])
   ```

3. **Use indentação consistente (2 espaços)**
   ```yaml
   # ✅ Bom
   pessoa:
     nome: João
     idade: 30
   
   # ❌ Ruim (mistura 2 e 4 espaços)
   pessoa:
       nome: João
     idade: 30
   ```

4. **Documente âncoras e aliases**
   ```yaml
   # Configuração padrão para todos os ambientes
   defaults: &defaults
     timeout: 30
     retries: 3
   
   development:
     <<: *defaults
   ```

---

## 📊 Métodos YAML Essenciais

| Método | Descrição | Exemplo |
|--------|-----------|---------|
| `YAML.load_file(path)` | Carrega arquivo YAML | `YAML.load_file('config.yml')` |
| `YAML.load(string)` | Carrega string YAML | `YAML.load('name: João')` |
| `YAML.safe_load(string)` | Carrega com segurança | `YAML.safe_load(input)` |
| `YAML.dump(object)` | Converte para YAML | `YAML.dump(hash)` |
| `YAML.dump(object, file)` | Salva em arquivo | `File.write('f.yml', YAML.dump(h))` |

---

## 🔄 Comparação com JavaScript

```ruby
# Ruby
require 'yaml'
config = YAML.load_file('config.yml')
puts config[:database][:host]
```

```javascript
// JavaScript
const yaml = require('js-yaml');
const fs = require('fs');
const config = yaml.load(fs.readFileSync('config.yml', 'utf8'));
console.log(config.database.host);
```

---

## 📚 Referências

- Ruby Official: YAML Module
- GeeksforGeeks: How to parse YAML in Ruby
- MojoAuth: Parse and Generate YAML with Ruby
- CloudBees: Creating Configuration Objects in Ruby
- Discourse Blog: YAML Comment Preservation (2026)
- WebCrunch: Using YAML with Ruby on Rails
