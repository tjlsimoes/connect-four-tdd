
require_relative 'display.rb'

# Logic to play the game

class Game
  include Display
  attr_reader :first_player, :second_player, :board, :current_player

  def initialize
    @board = Board.new
    @first_player = Player.new("Player 1", "\u26d4")
    @second_player = Player.new("Player 2", "\u26dD")
    @current_player = nil
  end

  def play
    puts intro_msg
    board.show
  end

end