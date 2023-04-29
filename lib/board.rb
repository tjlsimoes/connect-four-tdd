
# Connect-four board

class Board
  attr_reader :cells

  def initialize
    @cells = Array.new(43)
  end

  def show
    scells = @cells.map do |value|
      if value == nil
        ' '
      else
        value
      end

    end
    puts <<-HEREDOC
      -----------------------------
      | #{scells[1]} | #{scells[2]} | #{scells[3]} | #{scells[4]} | #{scells[5]} | #{scells[6]} | #{scells[7]} |
      -----------------------------
      | #{scells[8]} | #{scells[9]} | #{scells[10]} | #{scells[11]} | #{scells[12]} | #{scells[13]} | #{scells[14]} |
      -----------------------------
      | #{scells[15]} | #{scells[16]} | #{scells[17]} | #{scells[18]} | #{scells[19]} | #{scells[20]} | #{scells[21]} |
      -----------------------------
      | #{scells[22]} | #{scells[23]} | #{scells[24]} | #{scells[25]} | #{scells[26]} | #{scells[27]} | #{scells[28]} |
      -----------------------------
      | #{scells[29]} | #{scells[30]} | #{scells[31]} | #{scells[32]} | #{scells[33]} | #{scells[34]} | #{scells[35]} |
      -----------------------------
      | #{scells[36]} | #{scells[37]} | #{scells[38]} | #{scells[39]} | #{scells[40]} | #{scells[41]} | #{scells[42]} |
      -----------------------------
      -----------------------------
      | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
      -----------------------------
    HEREDOC
  end

  def full?
    board_cells = @cells[1..42]

    board_cells.all? { |value| value != nil }
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
    row(number).any? { |value| cells[value] == nil}
  end

  def game_over?
    
  end

  def update_board(number, symbol)
    row_idxs = row(number)

    i = 0
    while i < row_idxs.length

      row_idx = row_idxs[i]

      if @cells[row_idx] == nil
        @cells[row_idx] = symbol
        break
      end

      i += 1
    end
  end
end