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
    available = @spaces.clone
    available.delete("0")
    available.select { |space| space != 'x' && space != 'o' }
  end
end


class Player
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




    while board.available_space.count > 0
      puts "Your move. Enter 1-9 to play."
      player_move = gets.chomp

      if player_move == "q" #working!!
        break
      end

      if player_move.to_i > 9 || player_move.to_i <= 0
        puts "Illegal entry. Try again."
      elsif board.spaces[player_move.to_i] == "x" || board.spaces[player_move.to_i] == "o"
        puts "Illegal entry. Try again."
      else
        board.spaces[player_move.to_i] = "x"
        board.print_board

        move = computer_move(board)
        board.spaces[move] = "o"
        puts move
        board.print_board
      end

    end
    puts "Draw. You both lose."
  end

  def computer_move(board) #automated computer move - what to put?
    board.available_space.sample.to_i
  end


#  def show_final_score
#    puts @player.show_score
#    puts @computer.show_score
#  end




#puts comp wins, user wins, or draw
#check for three in a row

end
Game.new.start
