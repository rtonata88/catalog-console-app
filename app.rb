
class App
  def start_menu
    puts "Please choose an option by entering a number:\n
    1.- List all books
    2.- Add a book
    3.- List all movies
    4.- Add a movie
    5.- List of games
    6.- Add a game
    7.- List all music albums
    8.- Add a music album
    9.- List all genres (e.g 'Comedy', 'Thriller')
    10.- List all labels (e.g. 'Gift', 'New')
    11.- List all authors (e.g. 'Stephen King')
    12.- List all sources (e.g. 'From a friend', 'Online shop')
    13.- Exit "
   answer = gets.chomp.to_i
   options(answer)
  end 

  def options(answer)
    book_option(answer)
    movie_option(answer)
    game_option(answer)
    music_option(answer)
    general_option(answer)
  end

  def book_option(answer)
    case answer
    when 1
      puts "List all Books"
    when 2
      puts "Add book option"
    end
  end
  
  def movie_option(answer)
    case answer
    when 3
      puts "List all movies"
    when 4
      puts "Add a movie"
    end
  end

  def game_option(answer)
    case answer
    when 5
      puts "List all games"
    when 6
      puts "Add a game"
    end
  end

  def music_option(answer)
    case answer
    when 7
      puts "List all music albums"
    when 8
      puts "Add a music"
    end
  end

  def general_option(answer)
    case answer
    when  9 
      puts "List all genres (e.g 'Comedy', 'Thriller')"
    when 10 
      puts "List all labels (e.g. 'Gift', 'New')"
    when 11 
      puts "List all authors (e.g. 'Stephen King')"
    when 12 
     puts "List all sources (e.g. 'From a friend', 'Online shop')"
    else
      "Goodbye"
    end

  end 

  def run 
    start_menu
  end 

end