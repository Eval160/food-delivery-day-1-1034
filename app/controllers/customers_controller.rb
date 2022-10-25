require_relative "../views/customer_view"
require_relative "../models/customer"

class CustomersController
  def initialize(repo)
    @repo = repo
    @view = CustomerView.new
  end

  def add
    # Demander à la view un name et une addresse et les stocker dans des variables
    name = @view.ask_for("Nom")
    address = @view.ask_for("Adresse")
    # Créer une nouvelle instance
    customer = Customer.new(name: name, address: address)
    # Demander un repository de le stocker
    @repo.create(customer)
  end

  def list
    # demander au repo tous les customers
    customers = @repo.all
    # demander à la vue de les afficher
    @view.display_list(customers)
  end

  def edit
    # afficher la liste des customers
    # demander à la vie de demander un id et le stocker dans une variable
    # Demander au repo de trouver l'instance avec un id donné
    # Demander à l'user un nouvea nom
    # Demander à l'user un nouveau prix
    # Changer les valeurs de cette instance
  end
end
