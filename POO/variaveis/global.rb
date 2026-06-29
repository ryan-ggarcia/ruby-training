# Variavel Local M ou m (declaração de letra minúscula ou sublinhada): Pode ser acessada apenas onde foi criada. Dentro de um metodo, dentro de uma classe
# Varivale global $: Pode ser acessada em qualquer lugar do programa. Não muito utilizada por conta da sua visbilidade e possíbilitando
# de inúmeras alterações
# Variavel de classe @@: Pode ser acessada em todo lugar da classe onde foi declarada e seu valor é compartilhado para todos 
# Variavel de instancia @: Semelhante a variavel de clase, mas ela não é compartilhada com toda a classe

# Ela pode ser alterada/acessada em qualquer lugar da aplicação
class Bar
  def foo
    $global = 0
    puts $global
  end
end

class Baz
  def qux
    $global += 1
    puts $global
  end
end

bar = Bar.new
baz = Baz.new

bar.foo
baz.qux
puts $global

$global = 120
puts $global