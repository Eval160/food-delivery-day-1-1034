# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative 'router'
require_relative 'app/controllers/meals_controller'
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/customers_controller'
require_relative 'app/repositories/customer_repository'


customer_csv_file = File.join(__dir__, 'data/customers.csv')
customer_repo = CustomerRepository.new(customer_csv_file)
customers_controller = CustomersController.new(customer_repo)

meal_csv_file = File.join(__dir__, 'data/meals.csv')
meal_repo = MealRepository.new(meal_csv_file)
meals_controller = MealsController.new(meal_repo)
router = Router.new(meals_controller, customers_controller)
router.run
