module Moves
  module_function

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

  def diagonal(start:, goal:)
    x0, y0 = start
    x1, y1 = goal
    (x0 - x1).abs == (y0 - y1).abs && diagonal_squares_inside_empty?(start: start, goal: goal)
  end

  def x_by_n(num:, start:, goal:)
    x0, _y0 = start
    x1, _y1 = goal
    (x0 - x1).abs == num
  end

  def y_by_n(num:, start:, goal:)
    _x0, y0 = start
    _x1, y1 = goal
    (y0 - y1).abs == num
  end

  def vertical_squares_inside_empty?(start:, goal:)
    x0, y0 = start
    _x1, y1 = goal
    squares_between = (y0 + 1..y1 - 1).map { |y| [x0, y] }
    @board.all_empty?(squares_between)
  end

  def horizontal_squares_inside_empty?(start:, goal:)
    x0, y0 = start
    x1, y1 = goal
    squares_between = (x0 + 1..x1 - 1).map { |x| [x, y0] }
    @board.all_empty?(squares_between)
  end

  def range_countdownable(start, goal)
    start < goal ? (start + 1).upto(goal - 1) : (start + 1).downto(goal - 1).to_a
  end

  def diagonal_squares_inside_empty?(start:, goal:)
    x0, y0 = start
    x1, y1 = goal
    x_range = range_countdownable(x0, x1)
    y_range = range_countdownable(y0, y1)
    squares_between = x_range.zip(y_range)
    @board.all_empty?(squares_between)
  end

end
