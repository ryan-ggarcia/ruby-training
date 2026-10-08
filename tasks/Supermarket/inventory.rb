require "./product.rb"
require "./category"
class Inventory
  attr_reader :inventory, :capacity_max

  def initialize
    @inventory = []
    @capacity_max = 0
  end
  def find_by(cod)
    product = @inventory.find do |inv|
      inv.cod == cod
    end

    if product != nil
      puts product
    else
      puts "Not find"
    end
  end
  def add_product()
    if @capacity_max <= 10
      loop do
        puts("Enter the product cod\n")
        cod = gets.chomp.to_i
        puts("Enter the product name: \n")
        name = gets.chomp
        puts("Enter the product price: \n")
        price = gets.chomp.to_f
        puts("Enter the product quantity: \n")
        quantity = gets.chomp.to_i
        puts("Enter the product category: \n")
        category = gets.chomp

        if(cod.to_i.negative? || name.to_s.empty? || price.to_f.negative? || quantity.to_i.negative? || category.to_s.empty?)
          puts("Error... not fold")
          break
        end

        product = Product.new(cod, name, price, quantity, Category.new(category), true)
        @inventory << product
        @capacity_max += 1

        puts("Do wish to add more products? Y | N")
        op = gets.chomp

        if(op.upcase == "N")
          break
        end

      end
    end
  end

  def read_products
    @inventory.each do |inv|
      puts(inv)
      puts("--------------------------")
    end
  end
end

