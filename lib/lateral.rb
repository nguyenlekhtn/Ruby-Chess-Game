require_relative 'reversable_range'

module Lateral
  include ReversableRange
    
  def vertical(start:, goal:)
    _x0, y0 = start
    _x1, y1 = goal
    y0 == y1 && vertical_squares_inside_empty?(start: start, goal: goal)
  end

  def horizontal(start:, goal:)
    x0, _y0 = start
    x1, _y1 = goal
    x0 == x1 && horizontal_squares_inside_empty?(start: start, goal: goal)
  end

  def vertical_squares_inside_empty?(start:, goal:)
    x0, y0 = start
    x1, _y1 = goal
    squares_between = reversable_range(x0, x1).map { |x| [x, y0] }
    @board.all_empty?(*squares_between)
  end

  def horizontal_squares_inside_empty?(start:, goal:)
    x0, y0 = start
    _x1, y1 = goal
    squares_between = reversable_range(y0, y1).map { |y| [x0, y] }
    @board.all_empty?(*squares_between)
  end

end