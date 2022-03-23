require_relative './item'

class MusicAlbum < Item
  attr_reader :on_spotify, :id

  def initialize(*args, on_spotify)
    super(*args)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && on_spotify
  end

  def self.convert_to_json(data)
    music_albums = []
    data.each do |album|
    music_albums << { id: album.id, on_spotify: album.on_spotify, publish_date: album.publish_date }
    end
    music_albums
  end

  def self.convert_to_obj(data)
    music_albums = []
    data.each do |album|
    music_albums << MusicAlbum.new(album['publish_date'], id: album['id'], on_spotify: album['on_spotify'])
    end
    music_albums
  end
end
