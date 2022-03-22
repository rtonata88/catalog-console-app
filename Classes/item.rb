require 'date'

class Item
  attr_accessor :archived

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @genre = ''
    @author = ''
    @source = ''
    @label = ''
    @publish_date = Date.parse(publish_date)
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
