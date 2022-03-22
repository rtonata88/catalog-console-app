require_relative './item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(*args, on_spotify)
    super(*args)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && on_spotify
  end

  def self.list_all(music_albums)
    puts "\n \n"
    if music_albums.length.zero?
      puts 'No music albums to display'
    else
      music_albums.map { |album| puts "ID: #{album.id}, On spotify: #{album.on_spotify}" }
    end
    puts "\n \n"
  end
end
