require_relative 'reversable_range'
Warning[:experimental] = false

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

  def vertical_squares_inside_empty?(start, goal)
    start => { row: row_a, col: col_a }
    goal => { row: row_b, col: col_b }
    squares_between = reversable_range(row_a, row_b).map { |row| [row, col_a] }
    @board.all_empty?(*squares_between)
  end

  def horizontal_squares_inside_empty?(start, goal)
    start => { row: row_a, col: col_a }
    goal => { row: row_b, col: col_b }
    squares_between = reversable_range(col_a, col_b).map { |col| [row_a, col] }
    @board.all_empty?(*squares_between)
  end

  def squares_in_same_column(col)
    0.upto(7).map { |row| { row: row, col: col } }
  end

  def vertical_neighbors(current_pos)
    current_pos => { col:, row:}
    squares_in_same_column(col).reject { |square| square == current_pos }
                               .select { |square| vertical_squares_inside_empty?(current_pos, square) }
  end

  def squares_in_same_row(row)
    0.upto(7).map { |col| { row: row, col: col } }
  end

  def horizontal_neighbors(current_pos)
    current_pos => { col:, row:}
    squares_in_same_row(row).reject { |square| square == current_pos }
                            .select { |square| horizontal_squares_inside_empty?(current_pos, square) }
  end
end