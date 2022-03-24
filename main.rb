# ruby main.rb

require './app'
class Main
  def initialize
    app = App.new
    app.run
  end
end

Main.new
