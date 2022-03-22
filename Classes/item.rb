require 'date'

class Item
  attr_accessor :archived
  # rubocop:enable Metrics/ParameterLists
  def initialize(id, genre, author, source, label, publish_date, archived: false)
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
    
  end

  def can_be_archived?
    publish_date = Date.parse(@publish_date)
    today = Date.today
    today.year - publish_date.year > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end

item = Item.new(author: "Richard Chambula")
puts item.author
