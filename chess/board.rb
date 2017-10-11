require_relative 'piece'
require_relative 'pawn'
require_relative 'king'
require_relative 'queen'
require_relative 'rook'
require_relative 'bishop'
require_relative 'knight'


COL_MAP = {0 => :rook, 1 => :knight, 2 => :bishop,
3 => :queen, 4 => :king, 5 => :bishop, 6 => :knight, 7 => :rook}

class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    @null_piece = NullPiece.new
  end

  def make_starting_grid
    piece_rows = %w[0 1 6 7]

    @grid.length.times do |row|
      @grid.length.times do |col|
        pos = [row, col]
        if piece_rows.include?(row.to_s)
          self[pos] = make_piece(pos)
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

  def in_bounds?(pos)
    x, y = pos
    (0...8).cover?(x) && (0...8).cover?(y)
  end

  def empty_pos?(pos)
    self[pos].is_a?(NullPiece)
  end

  def is_capture?(pos, color)
    !empty_pos?(pos) && self[pos].color != color
  end

  def valid_move?(pos, color)
    in_bounds?(pos) && (empty_pos?(pos) || is_capture?(pos, color))
  end

  def make_piece(position)
    row, col = position
    color = origin_color(row)
    if [1, 6].include?(row)
      return Pawn.new(position, self, color)
    end
    case COL_MAP[col]
    when :rook
      return Rook.new(position, self, color)
    when :knight
      return Knight.new(position, self, color)
    when :bishop
      return Bishop.new(position, self, color)
    when :queen
      return Queen.new(position, self, color)
    when :king
      return King.new(position, self, color)
    end
  end

  def origin_color(row)
    if [0, 1].include?(row)
      :black
    else
      :white
    end
  end
end
