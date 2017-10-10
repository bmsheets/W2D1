require_relative 'piece'
require_relative "slidingpiece"
require_relative 'board'

class Bishop < Piece
  include SlidingPiece

  def initialize(position, board, color)
    super
  end

  def to_s
    "B"
  end
end
# 
# def test
#   board = Board.new
#   board.make_starting_grid
#   bishop = Bishop.new([2, 0], board, :black)
#   puts bishop.moves(true, false).inspect
# end
#
# test
