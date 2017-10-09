class Piece
  def initialize
  end

  def to_s
    "p"
  end
end

class NullPiece < Piece
  def initialize
    super
  end

  def to_s
    " "
  end
end
