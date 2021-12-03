require_relative '../moves'
require_relative '../piece'

class Knight < Piece
  include Moves

  def local_move_valid?(start:, goal:)
    (x_by_n(num: 1, start: start, goal: goal) && y_by_n(num: 2, start: start, goal: goal)) ||
      (x_by_n(num: 2, start: start, goal: goal) && y_by_n(num: 1, start: start, goal: goal))
  end
end
