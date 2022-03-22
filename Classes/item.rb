require 'date'

class Item
<<<<<<< HEAD
  attr_accessor :archived, :author
=======
  attr_accessor :archived, :label
>>>>>>> f213d159998e12576ecc63bd7be36eaa4224fcac

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
