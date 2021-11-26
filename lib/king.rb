class King
  def local_move_valid?(start:, goal:)
    start_x, start_y = start
    steps = [[1, -1],[1, 1], [-1, -1], [-1, 1], [0, 1], [0, -1], [-1, 0], [1, 0]]
    neighbours = steps.map { |x, y| [start_x + x, start_y + y] }
    neighbours.any? { |neighbour| neighbours == goal}
  end
end