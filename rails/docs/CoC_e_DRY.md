# Convenção por Configuração

Convenção sobre Configuração significa que a estrutura fornece decisões padrão sensatas.
Se seguir essas convenções estabelecidas, não escreverá nenhum código de configuração. Você só escreverá configuração quando seu aplicativo precisar se desviar das regras padrão.

Considere uma aplicação que armazena contas de usuários. No Rails voce define uma classe Ruby para representar o usuário

```` ruby

class User < ApplicationRecord
end

````

