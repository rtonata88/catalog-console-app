class ListCreator
  def books; end

  def music_albums(music_albums)
    puts "\n \n"
    if music_albums.length.zero?
      puts 'No music albums to display'
    else
      music_albums.map { |album| puts "ID: #{album['id']}, On spotify: #{album['on_spotify']}" }
    end
    puts "\n \n"
  end

  def games(games_list)
    puts "\n \n"
    if games_list.length.zero?
      puts 'No games to display'
    else
      games_list.map { |game| puts "ID: #{game.id}, Multiplayer: #{game.multiplayer}" }
    end
    puts "\n \n"
  end

  def genres; end

  def labels; end

  def authors(authors_list)
    puts "\n \n"
    if authors_list.length.zero?
      puts 'No authors to display'
    else
      authors_list.map { |author| puts "First name: #{author['first_name']}, Last name: #{author['last_name']}" }
    end
    puts "\n \n"
  end

  def list_all(list_type, list_array)
    case list_type
    when 'books'
      books
    when 'music_albums'
      music_albums(list_array)
    when 'games'
      games(list_array)
    when 'genres'
      genres
    when 'labels'
      labels
    when 'authors'
      authors(list_array)
    end
  end
end
