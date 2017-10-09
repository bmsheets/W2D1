require_relative "cursor"
require_relative "board"
require "colorize"

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    system ('clear')

    8.times do |x|
      8.times do |y|
        pos = [x, y]
        if pos == @cursor.cursor_pos
          print @board[pos].to_s.colorize(:red) + ' '
        else
          print @board[pos].to_s + ' '
        end
      end
      puts ''
    end
  end

  def test_render
    while true
      render
      @cursor.get_input
    end
  end
end

def test
  board = Board.new
  board.make_starting_grid
  display = Display.new(board)
  display.test_render
end

test
