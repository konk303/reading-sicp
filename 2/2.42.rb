class Array
  def flatmap
    map { |l| l.map { |ll| yield ll } }.flatten
  end
end

class Queens
  attr_accessor :board_size

  def initialize(board_size)
    @board_size = board_size
    p queen_cols board_size
  end

  def queen_cols(k)
    if k == 0
      [empty_board]
    else
      queen_cols(k - 1).flatmap do |rest_of_queens|
        1.upto(board_size).map { |new_row| p new_row; adjoin_position new_row, k, rest_of_queens }
      end
    end
  end

  def empty_board
    []
  end

  def adjoin_position(row, col, roq)
    roq.dup << [col, row]
  end
end
