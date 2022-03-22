require 'date'

class Item
  attr_accessor :archived

  # rubocop:enable Metrics/ParameterLists
  #def initialize(id, genre, author, source, label, publish_date, archived: false)
  def initialize(*args)
    puts args[0]
    args[0].each do |key,value|
      singleton_class.class_eval { attr_accessor "#{key}" }
      eval("@#{key} = #{value}")
      end
    # @id = id
    # @genre = genre
    # @author = author
    # @source = source
    # @label = label
    # @publish_date = publish_date
    # @archived = archived
    
  end

  # rubocop:enable Metrics/ParameterLists
  def can_be_archived?
    publish_date = Date.parse(@publish_date)
    today = Date.today
    today.year - publish_date.year > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end