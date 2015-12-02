class Array
  def flatmap
    map { |l| yield l }.flatten 1
  end
end

class Queens
  # Position = Struct.new :col, :row

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
    # rests << Position.new(col, row)
    rests << row
  end

  def safe?(current_c, positions)
    rests = positions.dup
    current_r = rests.pop
    rests.to_enum.with_index.all? do |rest, c|
      # diff = current.col - rest.col
      # rest.row != current.row &&
      #   rest.row != (current.row - diff) &&
      #   rest.row != (current.row + diff)
      c_diff = current_c - c.succ
      rest != current_r &&
        rest != (current_r - c_diff) &&
        rest != (current_r + c_diff)
    end
  end
end
