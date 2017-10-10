module SlidingPiece
  def moves(diag, lateral)
    transforms = []
    moves = []
    if diag
      transforms += [[1, 1], [1, -1], [-1, 1], [-1, -1]]
    end
    if lateral
      transforms += [[1, 0], [0, 1], [-1, 0], [0, -1]]
    end
    transforms.each do |transform|
      x, y = @position
      next_pos = [x + transform.first, y + transform.last]
      while @board.empty_pos?(next_pos) && @board.in_bounds?(next_pos)
        moves << next_pos
        next_pos = [next_pos.first + transform.first, next_pos.last + transform.last]
      end
      if @board.in_bounds?(next_pos) && @board.is_capture?(next_pos, @color)
        moves << next_pos
      end
    end
    moves
  end
end
