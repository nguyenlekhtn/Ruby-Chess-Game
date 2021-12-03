module Moves
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
end
