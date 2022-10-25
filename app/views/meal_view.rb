class MealView
  def ask_for(stuff)
    puts "#{stuff} please?"
    return gets.chomp
  end

  def display_list(meals)
    meals.each do |meal|
      puts "#{meal.id}. #{meal.name} (#{meal.price}$)"
    end
  end

  def ask_for_id
    puts "Quel ID ?"
    return gets.chomp.to_i
  end
end
