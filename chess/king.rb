require_relative 'piece'
require_relative 'board'

class King < Piece
  def initialize(position, board, color)
    super
  end

  def moves
    moves = []
    (-1..1).each do |x_diff|
      (-1..1).each do |y_diff|
        next if x_diff == 0 && y_diff == 0
        x, y = @position
        moves << [x + x_diff, y + y_diff]
      end
    end
    moves.select { |move| @board.valid_move?(move, color) }
  end

  def to_s
    "K"
  end
end
# 
# def test
#   board = Board.new
#   board.make_starting_grid
#   king = King.new([1, 0], board, :white)
#   puts king.moves.inspect
# end
#
# test
