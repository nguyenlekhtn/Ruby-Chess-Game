class King < Piece
  def local_move_valid?(start:, goal:)
    Moves.x_by_n(num: 1, start: start, goal: goal) && Moves.y_by_n(num: 0, start: start, goal: goal) ||
      Moves.x_by_n(num: 0, start: start, goal: goal) && Moves.y_by_n(num: 1, start: start, goal: goal) ||
      Moves.x_by_n(num: 1, start: start, goal: goal) && Moves.y_by_n(num: 1, start: start, goal: goal)
  end
end