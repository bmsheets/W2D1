require_relative 'piece'
require_relative 'board'

class Knight < Piece
  def initialize(position, board, color)
    super
  end

  def moves
    moves_arr = []

    (-2..2).each do |x|
      (-2..2).each do |y|
        next if x.abs == y.abs
        next if x == 0 || y == 0

        moves_arr << [x + @position.first, y + @position.last]
      end
    end

    moves_arr.select { |move| @board.valid_move?(move, color) }
  end

  def to_s
    "N"
  end
end
# 
# def test
#   board = Board.new
#   board.make_starting_grid
#   king = Knight.new([2, 0], board, :white)
#   puts king.moves.inspect
# end
# test
