# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller)
    @running = true
    @meals_controller = meals_controller
    @customers_controller = customers_controller
  end

  def run
    while @running
      puts "Bienvenue sur Food Delivery"
      display_actions
      choice = gets.chomp.to_i
      actions(choice)
    end
  end

  private

  def actions(choice)
    case choice
    when 0 then @running = false
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @meals_controller.edit
    when 4 then @meals_controller.destroy
    when 5 then @customers_controller.add
    when 6 then @customers_controller.list
    else
      puts "Taper un chiffre entre 0 et 8"
    end
  end

  def display_actions
    puts "0. Quit :'( "
    puts "1. Ajouter un repas"
    puts "2. Lister tous les repas"
    puts "3. Modifier un repas"
    puts "4. Supprimer un repas"
    puts "5. Ajouter un client"
    puts "6. Lister tous les clients"
  end
end
