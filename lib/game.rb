
require_relative 'display.rb'

# Logic to play the game

class Game
  include Display
  attr_reader :first_player, :second_player, :board, :current_player

  def initialize
    @board = Board.new
    @first_player = Player.new("Player 1", "\u26d4")
    @second_player = Player.new("Player 2", "\u26dD")
    @current_player = first_player
  end

  def play
    puts intro_msg
    board.show
    player_turns
  end

  private

  def player_turns
    @current_player = first_player
    until board.full?
      turn(current_player)
      break if board.game_over?

      @current_player = switch_current_player
    end
  end

  def switch_current_player
    if current_player == first_player
      second_player
    else
      first_player
    end
  end
end