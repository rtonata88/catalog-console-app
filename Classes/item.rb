require 'date'

class Item
  attr_accessor :archived, :id, :publish_date
  attr_reader :label, :author, :genre

  def initialize(publish_date, archived: false, id: nil)
    @publish_date = Date.parse(publish_date)
    @archived = archived
    @id = id || Random.rand(1..1000)
  end

  def can_be_archived?
    Date.today - @publish_date > (365 * 10)
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end
end
