class Genre
  attr_reader :id, :name, :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def self.convert_to_json(data)
    genres = []
    data.each do |genre|
      genres << { id: genre.id, name: genre.name }
    end
    genres
  end

  def self.convert_to_obj(data)
    genres = []
    data.each do |genre|
      genres << Genre.new(genre['name'])
    end
    genres
  end
end
