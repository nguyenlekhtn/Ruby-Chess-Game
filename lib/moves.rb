module Moves
  def vertical(start:, goal:)
    _x0, y0 = start
    _x1, y1 = goal
    y0 == y1
  end

  def horizontal(start:, goal:)
    x0, _y0 = start
    x1, _y1 = goal
    x0 == x1
  end

  def diagonal(start:, goal:)
    x0, y0 = start
    x1, y1 = goal
    (x0 - x1).abs == (y0 - y1).abs
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

  def forward_by_color(start:, goal:)
    x0, y0 = start
    x1, y1 = goal
    range = @moved ? [1] : [1, 2]
    case @color
    when 'white'
      neighbours = range.map { |num| [x0, y0 + num] }
    when 'black'
      neighbours = range.map { |num| [x0, y0 - num] }
    else
      raise 'Invalid Color'
    end
    neighbours.any? { |neighbour| neighbour == goal }
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

  def diagonal_squares_inside_empty?(start:, goal:)
    x0, y0 = start
    x1, y1 = goal
    x_range = x0 < x1 ? (x0 + 1).upto(x1 - 1) : (x0 + 1).downto(x1 - 1).to_a
    y_range = y0 < y1 ? (y0 + 1).upto(y1 - 1) : (y0 + 1).downto(y1 - 1).to_a
    squares_between = x_range.zip(y_range)
    @board.all_empty?(squares_between)
  end
end