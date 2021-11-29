class Bishop < Piece
  def local_move_valid?(start:, goal:)
    Moves.diagonal(start: start, goal: goal)
  end
end
