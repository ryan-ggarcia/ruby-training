require_relative 'Inventory'
class Supermarket
  def self.menu
    puts("=====================================================\n")
    puts("=====================================================\n")
    puts("\n")
    puts("            WELCOME TO SUPERMARKET!\n")
    puts("\n")
    puts("=====================================================\n")
    puts("=====================================================\n")
    puts("\n")
    puts("            =============================")
    puts("            =            MENU           =\n")
    puts("            = 1- Add new product        =\n")
    puts("            = 2- View all products      =\n")
    puts("            = 3- Exit                   =\n")
    puts("            =============================\n")
    puts("\nChoose an option: ")
    option = gets.chomp
  end

  def main
    inventory = Inventory.new

    loop do
      menu = Supermarket.menu
      option = menu
      case option.to_i

      when 1
        inventory.add_product

      when 2
        inventory.read_products
      when 3
        break
      end
    end

  end
end

supermarket = Supermarket.new
supermarket.main