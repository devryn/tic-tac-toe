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
  attr_reader :name
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

      if board.spaces[1] == 'x' && board.spaces[2] == 'x' && board.spaces[3] == 'x'
        puts "#{@player.name} wins! >:("
        break
      end

      if board.spaces[1] == 'x' && board.spaces[5] == 'x' && board.spaces[9] == 'x'
        puts "#{@player.name} wins! >:("
        break
      end

      if board.spaces[1] == 'x' && board.spaces[4] == 'x' && board.spaces[7] == 'x'
        puts "#{@player.name} wins! >:("
        break
      end

      if board.spaces[2] == 'x' && board.spaces[5] == 'x' && board.spaces[8] == 'x'
        puts "#{@player.name} wins! >:("
        break
      end

      if board.spaces[3] == 'x' && board.spaces[6] == 'x' && board.spaces[9] == 'x'
        puts "#{@player.name} wins! >:("
        break
      end

      if board.spaces[3] == 'x' && board.spaces[5] == 'x' && board.spaces[7] == 'x'
        puts "#{@player.name} wins! >:("
        break
      end

      if board.spaces[1] == 'o' && board.spaces[2] == 'o' && board.spaces[3] == 'o'
        puts "ALMIGHTY COMPUTER WINS >:)"
        break
      end

      if board.spaces[1] == 'o' && board.spaces[4] == 'o' && board.spaces[7] == 'o'
        puts "ALMIGHTY COMPUTER WINS >:)"
        break
      end

      if board.spaces[1] == 'o' && board.spaces[5] == 'o' && board.spaces[9] == 'o'
        puts "ALMIGHTY COMPUTER WINS >:)"
        break
      end

      if board.spaces[2] == 'o' && board.spaces[5] == 'o' && board.spaces[8] == 'o'
        puts "ALMIGHTY COMPUTER WINS >:)"
        break
      end

      if board.spaces[3] == 'o' && board.spaces[6] == 'o' && board.spaces[9] == 'o'
        puts "ALMIGHTY COMPUTER WINS >:)"
        break
      end

      if board.spaces[3] == 'o' && board.spaces[5] == 'o' && board.spaces[7] == 'o'
        puts "ALMIGHTY COMPUTER WINS >:)"
        break
      end

    end
    puts "Draw. You both lose!"
    break
  end

  def computer_move(board) #automated computer move - what to put?
    board.available_space.sample.to_i
  end



#puts comp wins, user wins, or draw
#check for three in a row

end
Game.new.start
