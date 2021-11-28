module Moves
  def lateral(start:, goal:)
    x0, y0 = start
    x1, y1 = goal
    x0 == x1 || y0 == y1
  end

  def diagonal(start:, goal:)
    x0, y0 = start
    x1, y1 = goal
    (x0 - x1).abs = (y0 - y1).abs
  end

  def xByN(num::, start:, goal:)
    x0, y0 = start
    x1, y1 = goal
    (x0 - x1).abs = num
  end

  def yByN(num:, start:, goal:)
    x0, y0 = start
    x1, y1 = goal
    (y0 - y1).abs = num
  end
end