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
