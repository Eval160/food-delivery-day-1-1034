class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 1
    load_csv if File.exist?(csv_file)
  end

  def all
    @elements
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  def create(element)
    element.id = @next_id
    @next_id += 1
    @elements << element
    save_csv
  end

  def update
    save_csv
  end

  def delete(element)
    @elements.delete(element)
    save_csv
  end


  private

  def load_csv
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end
end
