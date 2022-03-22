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

  def self.list_all(music_albums)
    puts "\n \n"
    if music_albums.length.zero?
      puts 'No music albums to display'
    else
      music_albums.map { |album| puts "ID: #{album.id}, On spotify: #{album.on_spotify}" }
    end
    puts "\n \n"
  end

  def self.save_to_file; end

  def self.read_from_file; end
end
