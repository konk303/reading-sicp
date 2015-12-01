class Array
  def flatmap
    map { |l| yield l }.flatten 1
  end
end

class Queens
  Position = Struct.new :col, :row

  attr_accessor :board_size

  def initialize(board_size)
    @board_size = board_size
    p queen_cols board_size
  end

  def queen_cols(k)
    if k == 0
      [empty_board]
    else
      queen_cols(k - 1).flatmap { |rest_of_queens|
        1.upto(board_size).map { |new_row| adjoin_position new_row, k, rest_of_queens }
      }.select { |positions| safe? k, positions }
    end
  end

  def empty_board
    nil
  end

  def adjoin_position(row, col, roq)
    rests = case roq
            when nil
              []
            when Array
              roq.dup
            else
              [roq]
            end
    rests << Position.new(col, row)
  end

  def safe?(k, positions)
    rests = positions.dup
    current = rests.pop
    rests.all? do |rest|
      diff = current.col - rest.col
      rest.row != current.row &&
        rest.row != (current.row - diff) &&
        rest.row != (current.row + diff)
    end
  end
end
