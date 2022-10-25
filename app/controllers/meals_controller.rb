require_relative "../views/meal_view"
require_relative "../models/meal"

class MealsController
  def initialize(repo)
    @repo = repo
    @view = MealView.new
  end

  def add
    # Demander à la view un name et un price et les stocker dans des variables
    name = @view.ask_for("Nom")
    price = @view.ask_for("Prix").to_i
    # Créer une nouvelle instance
    meal = Meal.new(name: name, price: price)
    # Demander un repository de le stocker
    @repo.create(meal)
  end

  def list
    display_list
  end

  def edit
    # afficher la liste des meals
    display_list
    # demander à la vie de demander un id et le stocker dans une variable
    id = @view.ask_for_id
    # Demander au repo de trouver l'instance avec un id donné
    meal = @repo.find(id)
    # Demander à l'user un nouvea nom
    name = @view.ask_for("Nom")
    # Si l'user n'a rien taper, j'attribue à la variable name la valeur de son name actuel
    name = meal.name if name == ""
    # Demander à l'user un nouveau prix
    price = @view.ask_for("Prix")
    # Si l'user n'a rien taper, j'attribue à la variable price la valeur de son price actuel, sinon je convertie le prix en integer
    if price == ""
      price = meal.price
    else
      price = price.to_i
    end
    # ou en version inline:
    # price = price == "" ? meal.price : price.to_i
    # Je change les valeurs de cette instance
    meal.name = name
    meal.price = price
    # Je demande au repo de sauvegarder les changements dans le csv
    @repo.update
    display_list
  end

  def destroy
    # Afficher tous les repas
    display_list
    # Demander à la vue quel id
    id = @view.ask_for_id
    # Demander au repo de supprimer une intance selon un id donné
    meal = @repo.find(id)
    @repo.delete(meal)
    # Afficher tous les repas
    display_list
  end


  private

  def display_list
    # demander au repo tous les meals
    meals = @repo.all
    # demander à la vue de les afficher
    @view.display_list(meals)
  end
end
