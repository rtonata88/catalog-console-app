require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(*args, multiplayer, last_played_at)
    super(*args)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    return true if super && (Date.today - @last_played_at > (365 * 2))

    false
  end
end