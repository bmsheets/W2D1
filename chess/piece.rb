class Piece

  attr_reader :color

  def initialize(position, board, color = :black)
    @position = position
    @board = board
    @color = color
  end

  def to_s
    "p"
  end
end

class NullPiece < Piece
  #include Singleton

  def initialize
  end

  def to_s
    " "
  end
end
