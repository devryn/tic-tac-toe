# Running the ruby script should start a game of tic-tac-toe to a win or draw, and then print the game's result.
# A draw occurs when no moves are left on the board and nobody has scored a win.
# Each turn, the user specifies their input by entering a number, and the program prints out a display of the resulting board.
# If the player chooses a number that is not inside the board then their input doesn't count and they need to pick again.
# The AI (computer player) chooses a random open square each time it is their turn.

class Board
  attr_accessor :spaces
  def initialize
    @spaces = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
  end

  def print_board
    puts
  puts  """  #{@spaces[1]} | #{@spaces[2]} | #{@spaces[3]}
  --+---+--
  #{@spaces[4]} | #{@spaces[5]} | #{@spaces[6]}
  --+---+--
  #{@spaces[7]} | #{@spaces[8]} | #{@spaces[9]}
    """
  end
  def available_space
  @spaces.map { |space| space != 'x' || space != 'o'}
  end
end


class Player
  attr_reader :name
  attr_accessor :markers

  def initialize(name)
    @name = name
  end
end


class Game
  def welcome
    puts
    puts "Welcome to Tic-Tac-Toe!"
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

def reset_screen
  sleep(0.1)
  system('clear')
end




    count = 0
    while count < 9
      puts "Your move. Enter 1-9 to play."
      player_move = gets.chomp

      if player_move == "q" #working!!
        break
      end

      if player_move.to_i > 9 || player_move.to_i <= 0
        puts "Illegal entry. Try again."
        player_move = gets.chomp
      else
        board.spaces[player_move.to_i] = "x"
        board.print_board

        move = computer_move.to_i #prints dup of board
        board.spaces[move.available_space] = "o"
        puts move
        board.print_board

        count +=1
      end
    end
  end

  def computer_move #automated computer move - what to put?
    ['1', '2', '3', '4', '5', '6', '7', '8', '9'].sample
  end


#  def show_final_score
#    puts @player.show_score
#    puts @computer.show_score
#  end




#end when board full
#puts comp wins, user wins, or draw
#check for three in a row
#cannot choose same space if taken

end
Game.new.start
