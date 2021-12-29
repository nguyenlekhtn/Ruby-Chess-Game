require_relative '../moves'
require_relative '../piece'

class Knight < Piece
  include Moves

  def local_move_valid?(start:, goal:)
    (x_by_n(num: 1, start:, goal:) && y_by_n(num: 2, start:, goal:)) ||
      (x_by_n(num: 2, start:, goal:) && y_by_n(num: 1, start:, goal:))
  end
end
