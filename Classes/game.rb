require_relative './item.rb'

class Game < Item

    attr_accessor :multiplayer, :last_played_at
    
    def initialize(*args, multiplayer, last_played_at)
        super(*args)
        @multiplayer = multiplayer
        @last_played_at = Date.parse(last_played_at)
    end

    def can_be_archived?
        return true if super && (Date.today - @last_played_at > (365*2))
        return false
    end

end

# **TEST**
# game1 = Game.new('2021-01-01', true, '2020-01-01')
# p game1.can_be_archived?