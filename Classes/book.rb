require_relative './item'
class Book < Item
  attr_accessor :cover_state, :publisher, :id

  def initialize(*args, publisher, cover_state)
    super(*args)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state.downcase == 'bad'
  end
end
