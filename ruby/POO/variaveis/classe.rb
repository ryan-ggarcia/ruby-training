# Variavel Local M ou m (declaração de letra minúscula ou sublinhada): Pode ser acessada apenas onde foi criada. Dentro de um metodo, dentro de uma classe
# Varivale global $: Pode ser acessada em qualquer lugar do programa. Não muito utilizada por conta da sua visbilidade e possíbilitando
# de inúmeras alterações
# Variavel de classe @@: Pode ser acessada em todo lugar da classe onde foi declarada e seu valor é compartilhado para todos 
# Variavel de instancia @: Semelhante a variavel de clase, mas ela não é compartilhada com toda a classe

class User
  @@user_cont = 0
  def add name
    puts "Olá #{name} Seja bem vindo!"
    @@user_cont += 1
    puts @@user_cont
  end
end
# Mesmo tendo instancias diferentes a variavel persiste e pode ser alterada
user = User.new
user.add('Ryan')

user2 = User.new
user2.add("Murilo")

