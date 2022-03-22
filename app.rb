require './Classes/music_album'
require './Classes/list_creator'
require './Classes/data'
require './Classes/game'

class App
  def initialize
    @music_albums = Data.read_from_file('music_albums.json')
    @genres = Data.read_from_file('genres.json')
    @games = Data.read_from_file('games.json')
    @authors = Data.read_from_file('authors.json')
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
      ListCreator.new.list_all('games', @games)
    when 4
      print 'Publish date: '
      publish_date = gets.chomp
      print 'Multiplayer [true/false]: '
      multiplayer = gets.chomp
      print 'Last played at: '
      last_played_at = gets.chomp
      @games << Game.new(publish_date, multiplayer, last_played_at)
      puts 'Success!'
    end
    start_menu
  end

  def music_option(answer)
    case answer
    when 5
      ListCreator.new.list_all('music_albums', @music_albums)
    when 6
      puts 'Select genre below'
      ListCreator.new.list_all('genres', @genres)
    end
  end

  def general_option(answer)
    case answer
    when 7
      puts "List all genres (e.g 'Comedy', 'Thriller')"
    when 8
      puts "List all labels (e.g. 'Gift', 'New')"
    when 9
      ListCreator.new.list_all('authors', @authors)
    when 10
      puts "List all sources (e.g. 'From a friend', 'Online shop')"
    when 11
      Data.save_to_file(@music_albums, 'music_albums.json')
      Data.save_to_file(@games, 'games.json')
      Data.save_to_file(@authors, 'authors.json')
      exit
    end
  end

  def run
    start_menu
  end
end
