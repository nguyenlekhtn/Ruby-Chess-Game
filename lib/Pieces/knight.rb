class Knight < Piece
  def post_initialize
    @type = 'knight'
  end

  def local_move_valid?(start:, goal:)
    Moves.x_by_n(num: 1, start: start, goal: goal) && Moves.y_by_n(num: 2, start: start, goal: goal) ||
      Moves.x_by_n(num: 2, start: start, goal: goal) && Moves.y_by_n(num: 1, start: start, goal: goal)
  end
end
