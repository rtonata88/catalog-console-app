require 'date'

class Item
  attr_accessor :archived, :label, :author


  # rubocop:disable Metrics/ParameterLists
  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @genre = ''
    @author = ''
    @source = ''
    @label = ''
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  # rubocop:enable Metrics/ParameterLists
  def can_be_archived?
    return Date.today - @publish_date > (365*10)
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end
