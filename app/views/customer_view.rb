class CustomerView
  def ask_for(stuff)
    puts "#{stuff} please?"
    return gets.chomp
  end

  def display_list(customers)
    customers.each do |customer|
      puts "#{customer.id}. #{customer.name} : #{customer.address}"
    end
  end
end
