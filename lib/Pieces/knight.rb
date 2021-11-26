class Knight < Piece
  def local_move_valid?(start:, goal:)
    start_x, start_y = start
    neighbours = steps.map { |x, y| [start_x + x, start_y + y] } 
    neighbours.any? { |neighbour| neighbour == goal }
  end

  def steps
    [[1, -2], [1, 2], [-1, -2], [-1, 2], [-2, -1], [-2, 1], [2, -1], [2, 1]]
  end
end
