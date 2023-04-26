
# Connect-four board

class Board
  attr_reader :cells

  def initialize
    @cells = Array.new(43, " ")
  end

  def show
    puts <<-HEREDOC
      -----------------------------
      | #{cells[1]} | #{cells[2]} | #{cells[3]} | #{cells[4]} | #{cells[5]} | #{cells[6]} | #{cells[7]} |
      -----------------------------
      | #{cells[8]} | #{cells[9]} | #{cells[10]} | #{cells[11]} | #{cells[12]} | #{cells[13]} | #{cells[14]} |
      -----------------------------
      | #{cells[15]} | #{cells[16]} | #{cells[17]} | #{cells[18]} | #{cells[19]} | #{cells[20]} | #{cells[21]} |
      -----------------------------
      | #{cells[22]} | #{cells[23]} | #{cells[24]} | #{cells[25]} | #{cells[26]} | #{cells[27]} | #{cells[28]} |
      -----------------------------
      | #{cells[29]} | #{cells[30]} | #{cells[31]} | #{cells[32]} | #{cells[33]} | #{cells[34]} | #{cells[35]} |
      -----------------------------
      | #{cells[36]} | #{cells[37]} | #{cells[38]} | #{cells[39]} | #{cells[40]} | #{cells[41]} | #{cells[42]} |
      -----------------------------
      -----------------------------
      | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
      -----------------------------
    HEREDOC
  end

  def full?
    board_cells = @cells[1..42]

    board_cells.all? { |value| value != " " }
  end

  def valid_move?(number)
    first_row_idx = [1,8,15,22,29,36]
    second_row_idx = [2, 9, 16, 23, 30, 37]
    third_row_idx = [3, 10, 17, 24, 31, 38]
    fourth_row_idx = [4, 11, 18, 25, 32, 39]
    fifth_row_idx = [5, 12, 19, 26, 33, 40]
    sixth_row_idx = [6, 13, 20, 27, 34, 41]
    seventh_row_idx = [7, 14, 21, 28, 35, 42]

    case number
    when 1
      first_row_idx.any? { |value| cells[value] == " "}
    when 2
      second_row_idx.any? { |value| cells[value] == " "}
    when 3
      third_row_idx.any? { |value| cells[value] == " "}
    when 4
      fourth_row_idx.any? { |value| cells[value] == " "}
    when 5
      fifth_row_idx.any? { |value| cells[value] == " "}
    when 6
      sixth_row_idx.any? { |value| cells[value] == " "}
    when 7
      seventh_row_idx.any? { |value| cells[value] == " "}
    end

  end

  def loop_idx(array, symbol)
    i = 0
    while i < array.length do

      if board[array[i]] == " "
        update_board(number, symbol)
      end

      i += 1
    end
  end

  def game_over?
    
  end

  def update_board(number, symbol)

  end
end