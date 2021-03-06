require_relative 'reversable_range'

module Diagonal
  include ReversableRange

  def diagonal(start:, goal:)
    x0, y0 = start
    x1, y1 = goal
    (x0 - x1).abs == (y0 - y1).abs && diagonal_squares_inside_empty?(start: start, goal: goal)
  end

  def diagonal_squares_inside_empty?(start:, goal:)
    x0, y0 = start
    x1, y1 = goal
    x_range = reversable_range(x0, x1)
    y_range = reversable_range(y0, y1)
    squares_between = x_range.zip(y_range)
    @board.all_empty?(*squares_between)
  end
end