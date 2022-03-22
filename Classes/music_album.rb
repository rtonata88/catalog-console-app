require './item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(publish_date, archived, on_spotify, id: nil)
    super(publish_date, archived, id: id)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && on_spotify
  end
  
end