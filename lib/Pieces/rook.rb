require_relative '../moves'

class Rook
  def local_move_valid?(start:, goal:)
    Moves.vertical(start: start, goal: goal) ||
      Moves.horizontal(start: start, goal: goal)
  end
end