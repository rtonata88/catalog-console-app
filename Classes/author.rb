require_relative './item'
# require_relative './game.rb'
class Author
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end
end

# TEST **** #
# game1 = Game.new('2000-01-01', true, '2010-01-01')
# author1 = Author.new('richard', 'tonata')
# author1.add_item(game1)
# p game1.author.items
