require_relative 'piece'
require_relative 'slidingpiece'
require_relative 'board'

class Queen < Piece
  include SlidingPiece

  def initialize(position, board, color)
    super
  end

  def to_s
    "Q"
  end
end
# 
# def test
#   board = Board.new
#   board.make_starting_grid
#   queen = Queen.new([2, 0], board, :white)
#   puts queen.moves(true, true).inspect
# end
#
# test
