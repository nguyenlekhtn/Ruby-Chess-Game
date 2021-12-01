module Diagonal
  def diagonal(start:, goal:)
    x0, y0 = start
    x1, y1 = goal
    (x0 - x1).abs == (y0 - y1).abs && diagonal_squares_inside_empty?(start: start, goal: goal)
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
    @board.all_empty?(*squares_between)
  end
end