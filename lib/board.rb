
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

  def row(number)
    first_row_idx = [36, 29, 22, 15, 8, 1]
    second_row_idx = [37, 30, 23, 16, 9, 2]
    third_row_idx = [38, 31, 24, 17, 10, 3]
    fourth_row_idx = [39, 32, 25, 18, 11, 4]
    fifth_row_idx = [40, 33, 26, 19, 12, 5]
    sixth_row_idx = [41, 34, 27, 20, 13, 6]
    seventh_row_idx = [42, 35, 28, 21, 14, 7]

    case number
    when 1
      first_row_idx
    when 2
      second_row_idx
    when 3
      third_row_idx
    when 4
      fourth_row_idx
    when 5
      fifth_row_idx
    when 6
      sixth_row_idx
    when 7
      seventh_row_idx
    end
  end

  def valid_move?(number)
    row(number).any? { |value| cells[value] == " "}
  end

  def game_over?
    
  end

  def update_board(number, symbol)
    row_idxs = row(number)

    i = 0
    while i < row_idxs.length

      row_idx = row_idxs[i]

      if @cells[row_idx] == " "
        @cells[row_idx] = symbol
        break
      end

      i += 1
    end
  end
end