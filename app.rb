require './Classes/music_album'
require './Classes/list_creator'
require './Classes/data'

class App
  def initialize
    @music_albums = Data.read_from_file('music_albums.json')
    @genres = Data.read_from_file('genres.json')
  end

  def start_menu
    puts "Please choose an option by entering a number:\n
    1.- List all books
    2.- Add a book
    3.- List of games
    4.- Add a game
    5.- List all music albums
    6.- Add a music album
    7.- List all genres (e.g 'Comedy', 'Thriller')
    8.- List all labels (e.g. 'Gift', 'New')
    9.- List all authors (e.g. 'Stephen King')
    10.- List all sources (e.g. 'From a friend', 'Online shop')
    11.- Exit "
    answer = gets.chomp.to_i
    options(answer)
  end

  def options(answer)
    book_option(answer)
    game_option(answer)
    music_option(answer)
    general_option(answer)
  end

  def book_option(answer)
    case answer
    when 1
      puts 'List all Books'
    when 2
      puts 'Add book option'
    end
  end

  def game_option(answer)
    case answer
    when 3
      puts 'List all games'
    when 4
      puts 'Add a game'
    end
  end

  def music_option(answer)
    case answer
    when 5
      ListCreator.list_all('music_albums', @music_albums)
    when 6
      puts 'Select genre below'
      ListCreator.list_all('genres', @genres)
    end
  end

  def general_option(answer)
    case answer
    when 7
      puts "List all genres (e.g 'Comedy', 'Thriller')"
    when 8
      puts "List all labels (e.g. 'Gift', 'New')"
    when 9
      puts "List all authors (e.g. 'Stephen King')"
    when 10
      puts "List all sources (e.g. 'From a friend', 'Online shop')"
    else
      Data.save_to_file(@music_albums, 'music_albums.json')
    end
  end

  def run
    start_menu
  end
end
