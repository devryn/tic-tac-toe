# Running the ruby script should start a game of tic-tac-toe to a win or draw, and then print the game's result.
# A draw occurs when no moves are left on the board and nobody has scored a win.
# Each turn, the user specifies their input by entering a number, and the program prints out a display of the resulting board.
# If the player chooses a number that is not inside the board then their input doesn't count and they need to pick again.
# The AI (computer player) chooses a random open square each time it is their turn.

class Board
  def initialize
    @response = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
  end

  def print_board
    puts
  puts  """    |   |
  --+---+--
    |   |
  --+---+--
    |   |
    """
  end
end


class Player
  attr_reader :name
  attr_accessor :markers

  def initialize(name)
    @name = name
  end

  def show_score
    "#{@name} plays #{@response}"
  end
end

class Game
  def welcome
    puts
    puts "Welcome to Tic-Tac-Toe"
    puts
  end

  def prompt(msg)
      print msg
      return gets.chomp
  end

  def start
    welcome

    name = prompt("What is your name? ")

    @player = Player.new(name)
    @computer = Player.new("ALMIGHTY COMPUTER")
    board = Board.new
    board.print_board

    player_move

    show_final_score
  end

  def show_board
  end

  def show_final_score
    puts @player.show_score
    puts @computer.show_score
  end
  def welcome
    puts
    puts "Welcome to Tic-Tac-Toe!"
    puts
  end

  def prompt(msg)
    print msg
      return gets.chomp
  end

  def player_move
    puts "Enter 1-9 for space 1-9"
    puts ">"
    gets.chomp
  end

  def computer_move

  end
end

Game.new.start
