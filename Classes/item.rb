require 'date'

class Item
  attr_accessor :archived, :label, :author, :id, :publish_date, :genre

  def initialize(publish_date, archived: false, id: nil)
    @genre = ''
    @author = ''
    @source = ''
    @label = ''
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
end
