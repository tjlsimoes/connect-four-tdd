
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
end