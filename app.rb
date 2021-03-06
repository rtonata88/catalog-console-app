require './Classes/music_album'
require './Classes/list_creator'
require './Classes/data'
require './Classes/book'
require './Classes/game'
require './Classes/author'
require './Classes/label'
require './Classes/genre'

class App
  def initialize
    @books = Book.convert_to_obj(Data.read_from_file('books.json'))
    @labels = Label.convert_to_obj(Data.read_from_file('labels.json'))
    @music_albums = MusicAlbum.convert_to_obj(Data.read_from_file('music_albums.json'))
    @genres = Genre.convert_to_obj(Data.read_from_file('genres.json'))
    @games = Game.convert_to_obj(Data.read_from_file('games.json'))
    @authors = Author.convert_to_obj(Data.read_from_file('authors.json'))
  end

  def start_menu
    puts "Please choose an option by entering a number:\n
    0.- List all books
    1.- Add a book
    2.- List of games
    3.- Add a game
    4.- List all music albums
    5.- Add a music album
    6.- List all genres (e.g 'Comedy', 'Thriller')
    7.- List all labels (e.g. 'Gift', 'New')
    8.- List all authors (e.g. 'Stephen King')
    9.- Exit "
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
    when 0
      ListCreator.new.list_all('books', @books)
    when 1
      puts "Creating a new book...\n\n"
      print 'What date was it published on? (YYYY-MM-DD) '
      publish_date = gets.chomp
      print 'Who was the Publisher?: '
      publisher = gets.chomp
      print 'What state is the cover in? '
      cover_state = gets.chomp
      @books << Book.new(publisher, cover_state, publish_date)
      puts 'Book created succesfully!!!'
      print 'Would you like to add a label [Y/N] '
      return unless answer_yes?

      add_label
    end
  end

  def answer_yes?
    answer = gets.chomp
    until %w[y yes n no true false].include?(answer.downcase)
      print 'Wrong option, please enter [Y/N] '
      answer = gets.chomp
    end
    %w[y yes true].include?(answer.downcase)
  end

  def add_label
    puts "What is the label's title? "
    title = gets.chomp
    puts "What is the label's color? "
    color = gets.chomp
    @labels << Label.new(title, color)
    puts 'Label created succesfully!!!'
  end

  def add_author(game)
    puts "What is the author's first name? "
    first_name = gets.chomp
    puts "What is the author's last name? "
    last_name = gets.chomp
    new_author = Author.new(first_name, last_name)
    @authors << new_author
    game.author = new_author
    puts 'Author created succesfully!!!'
  end

  def add_genre(album)
    puts 'What is the genre? '
    name = gets.chomp
    new_genre = Genre.new(name)
    @genres << new_genre
    album.genre = new_genre
    puts 'Genre created succesfully!!!'
  end

  def game_option(answer)
    case answer
    when 2
      ListCreator.new.list_all('games', @games)
    when 3
      puts 'Add a game'
      print 'Publish date (YYYY-MM-DD): '
      publish_date = gets.chomp
      print 'Multiplayer [true/false]: '
      multiplayer = gets.chomp
      print 'Last played at: '
      last_played_at = gets.chomp
      new_game = Game.new(multiplayer, last_played_at, publish_date)
      @games << new_game
      print 'Would you like to add an author [Y/N]: '
      return unless answer_yes?

      add_author(new_game)
      puts 'Success!'
    end
  end

  def music_option(answer)
    case answer
    when 4
      ListCreator.new.list_all('music_albums', @music_albums)
    when 5
      print 'On spotify[Y/N]: '
      on_spotify_input = gets.chomp.downcase
      on_spotify = (on_spotify_input == 'y')
      print 'Publish date (YYYY-MM-DD): '
      publish_date = gets.chomp
      new_album = MusicAlbum.new(publish_date, on_spotify)
      @music_albums << new_album
      print 'Would you like to add a genre [Y/N]: '
      return unless answer_yes?

      add_genre(new_album)
      puts 'Success!'
    end
  end

  def general_option(answer)
    case answer
    when 6
      ListCreator.new.list_all('genres', @genres)
    when 7
      ListCreator.new.list_all('labels', @labels)
    when 8
      ListCreator.new.list_all('authors', @authors)
    when 9
      Data.save_to_file(Label.convert_to_json(@labels), 'labels.json')
      Data.save_to_file(Book.convert_to_json(@books), 'books.json')
      Data.save_to_file(MusicAlbum.convert_to_json(@music_albums), 'music_albums.json')
      Data.save_to_file(Game.convert_to_json(@games), 'games.json')
      Data.save_to_file(Author.convert_to_json(@authors), 'authors.json')
      Data.save_to_file(Genre.convert_to_json(@genres), 'genres.json')
      exit
    end
    start_menu until answer == 9
  end

  def run
    start_menu
  end
end
