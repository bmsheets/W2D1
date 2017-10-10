require_relative 'slidingpiece'
require_relative 'piece'
require_relative 'board'

class Rook < Piece
  include SlidingPiece

  def initialize(position, board, color)
    super
  end

  def to_s
    "R"
  end
end
#
# def test
#   board = Board.new
#   board.make_starting_grid
#   rook = Rook.new([2, 0], board, :black)
#   puts rook.moves(false, true).inspect
# end
#
# test
