require_relative '../moves'
require_relative '../piece'

class Queen < Piece
  def post_initialize
    @type = 'queen'
  end

  def local_move_valid?(start:, goal:)
    Moves.vertical(start: start, goal: goal) ||
      Moves.horizontal(start: start, goal: goal) ||
      Moves.diagonal(start: start, goal: goal)
  end
end
