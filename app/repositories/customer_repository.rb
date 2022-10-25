require 'csv'
require_relative '../models/customer'
require_relative "base_repository"

class CustomerRepository < BaseRepository
  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @elements << Customer.new(row)
    end
    super
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ["id", "name", "address"]
      @elements.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end
