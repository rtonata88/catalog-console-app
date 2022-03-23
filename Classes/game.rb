require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :id

  def initialize(*args, multiplayer, last_played_at)
    super(*args)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    return true if super && (Date.today - @last_played_at > (365 * 2))

    false
  end

  def self.convert_to_json(data)
    games = []
    data.each do |game|
      games << { id: game.id, multiplayer: game.multiplayer, last_played_at: game.last_played_at,
                         publish_date: game.publish_date }
    end
    games
  end
end
