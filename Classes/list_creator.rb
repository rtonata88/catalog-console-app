# rubocop:disable Metrics/CyclomaticComplexity
class ListCreator
  def self.list_all(list_type, list_array)
    case list_type
    when 'books'
      books
    when 'music_albums'
      music_albums(list_array)
    when 'movies'
      movies
    when 'games'
      games
    when 'genres'
      genres
    when 'labels'
      labels
    when 'authors'
      authors
    end
  end

  def books; end

  def music_albums(music_albums)
    puts "\n \n"
    if music_albums.length.zero?
      puts 'No music albums to display'
    else
      music_albums.map { |album| puts "ID: #{album.id}, On spotify: #{album.on_spotify}" }
    end
    puts "\n \n"
  end

  def movies; end

  def games; end

  def genres; end

  def labels; end

  def authors; end
end
# rubocop:enable Metrics/CyclomaticComplexity
