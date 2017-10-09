require_relative 'piece'

class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    @null_piece = NullPiece.new
  end

  def make_starting_grid
    starting_pos = %w[0 1 6 7]

    @grid.length.times do |row|
      @grid.length.times do |col|
        pos = [row, col]
        if starting_pos.include?(row.to_s)
          self[pos] = Piece.new
        else
          self[pos] = @null_piece
        end
      end
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def move_piece(start_pos, end_pos)
    raise "No piece available." if self[start_pos].is_a?(NullPiece)
    #add in raise exception if end_pos not possible to move
    self[end_pos] = self[start_pos]
    self[start_pos] = @null_piece
  end

  def in_bounds(pos)
    x, y = pos
    (0...8).cover?(x) && (0...8).cover?(y)
  end
end
