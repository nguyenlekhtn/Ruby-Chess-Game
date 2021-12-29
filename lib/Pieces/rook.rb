require_relative '../piece'
require_relative '../lateral'

class Rook < Piece
  include MoveLateralPiece

  # def local_move_valid?(start, goal)
  #   (same_horizontal_line?(start, goal) &&
  #     horizontal_squares_inside_empty?(start, goal)) ||
  #     (same_vertical_line?(start, goal) &&
  #       vertical_squares_inside_empty?(start, goal))
  # end
end
