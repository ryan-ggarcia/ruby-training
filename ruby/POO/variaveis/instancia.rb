# Variavel Local M ou m (declaração de letra minúscula ou sublinhada): Pode ser acessada apenas onde foi criada. Dentro de um metodo, dentro de uma classe
# Varivale global $: Pode ser acessada em qualquer lugar do programa. Não muito utilizada por conta da sua visbilidade e possíbilitando
# de inúmeras alterações
# Variavel de classe @@: Pode ser acessada em todo lugar da classe onde foi declarada e seu valor é compartilhado para todos 
# Variavel de instancia @: Semelhante a variavel de clase, mas ela não é compartilhada com toda as instancias

class User
  def add name
    @user_name = name
    puts "Usuário cadastrado!"
    saudacao
  end
  def saudacao
    puts "Seja bem vindo #{@user_name}!"
  end
end

user = User.new
user.add('Ryan')
