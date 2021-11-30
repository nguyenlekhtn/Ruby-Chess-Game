class Bishop < Piece
  def post_initialize
    @type = 'bishop'
  end

  def local_move_valid?(start:, goal:)
    Moves.diagonal(start: start, goal: goal)
  end
end
