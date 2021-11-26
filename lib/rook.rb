class Rook
  def local_move_valid?(start:, goal:)
    if board.same_rank?(start: start, goal: goal)
      direction = :rank
    elsif board.same_file?(start: start, goal: goal)
      direction = :file
    else
      return false
    end

    board.empty_square_between?(start: start, goal: goal, direction: direction)
  end
end