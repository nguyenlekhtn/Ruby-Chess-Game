require_relative 'reversable_range'
Warning[:experimental] = false

module MoveLateralPiece
  # include ReversableRange

  # def same_vertical_line?(start, goal)
  #   start[:col] == goal[:col]
  # end

  # def same_horizontal_line?(start, goal)
  #   start[:row] == goal[:row]
  # end

  # def vertical_squares_inside_empty?(start, goal)
  #   start => { row: row_a, col: col_a }
  #   goal => { row: row_b, col: col_b }
  #   squares_between = reversable_range(row_a, row_b).map { |row| [row, col_a] }
  #   @board.all_empty?(*squares_between)
  # end

  # def horizontal_squares_inside_empty?(start, goal)
  #   start => { row: row_a, col: col_a }
  #   goal => { row: row_b, col: col_b }
  #   squares_between = reversable_range(col_a, col_b).map { |col| [row_a, col] }
  #   @board.all_empty?(*squares_between)
  # end

  def squares_in_same_column(col)
    0.upto(7).map { |row| [row, col] }
  end

  # def vertical_neighbors(current_pos)
  #   current_pos => { col:, row:}
  #   squares_in_same_column(col).reject { |square| square == current_pos }
  #                              .select { |square| vertical_squares_inside_empty?(current_pos, square) }
  # end

  # def horizontal_neighbors(current_pos)
  #   current_pos => { col:, row:}
  #   squares_in_same_row(row).reject { |square| square == current_pos }
  #                           .select { |square| horizontal_squares_inside_empty?(current_pos, square) }
  # end

  def vertical_moves_no_intervening(current)
    _, current_col = current
    squares_in_same_column(current_col).reject { _1 == current }
  end
end
