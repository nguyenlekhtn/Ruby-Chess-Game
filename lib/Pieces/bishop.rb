class Bishop < Piece
  def local_move_valid?(start:, goal:)
    @board.same_cross?(start: start, goal: goal) && 
      @board.empty_square_between?(start: start, goal: goal, direction: cross)
  end
end