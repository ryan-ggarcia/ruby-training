class Mercado < Produto
  def add_product
    @@Product.push({name: @name,price:@price})
    puts "Produto #{@name} adicionado!"
  end
  def buy
    puts 'Digite o nome do produto:'
    nameProcuct = gets.chomp
    search = @@Product.select do |name,price|
      name[:name] == nameProcuct
    end
    puts search
  end
end