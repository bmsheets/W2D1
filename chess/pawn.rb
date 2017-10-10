require_relative 'piece'
require_relative 'board'

class Pawn < Piece
  def initialize(position, board, color)
    super
    @has_moved = false
    @ascending_rows = position.first == 1
  end

  def moves
    moves = []
    row, col = @position
    if @ascending_rows
      normal_move = [row + 1, col]
      double_move = [row + 2, col]
      left_capture = [row + 1, col - 1]
      right_capture = [row + 1, col + 1]
    else
      normal_move = [row - 1, col]
      double_move = [row - 2, col]
      left_capture = [row - 1, col - 1]
      right_capture = [row - 1, col + 1]
    end
    if @board.empty_pos?(normal_move) && @board.in_bounds?(normal_move)
      moves << normal_move
    end

    if @board.empty_pos?(double_move) && !@has_moved
      moves << double_move
    end

    if @board.is_capture?(left_capture, @color) && @board.in_bounds?(left_capture)
      moves << left_capture
    end

    if @board.is_capture?(right_capture, @color) && @board.in_bounds?(right_capture)
      moves << right_capture
    end

    moves
  end

  def to_s
    "P"
  end
end
# 
# def test
#   board = Board.new
#   board.make_starting_grid
#   pawn = Pawn.new([2, 0], board, :white)
#   puts pawn.moves.inspect
# end
#
# test
