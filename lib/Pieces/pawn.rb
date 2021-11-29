class Pawn
  attr_reader :color

  def initialize(**opts)
    @color = opts[:color]
    @moved = false
  end

  def local_move_valid?(start:, goal:)
    return true if @board.at(start)[:empty] && movable_by_color?(start: start, goal: goal)

    return true if takable?(start: start, goal: goal)

    false
  end

  private

  def movable_by_color?(start:, goal:)
    neighbours = move_forward_neighbours(start)
    neighbours.any? { |neighbour| neighbour == goal && Moves.vertical_squares_inside_empty?(start: start, goal: goal) }
  end

  def takable?(start:, goal:)
    @board.at(goal)[:value].color != @color && take_pieces_squares(start: start).any? { |square| square == goal }
  end

  def move_forward_by_color(num1, step)
    @color == 'white' ? num1 + step : num1 - step
  end

  def move_forward_neighbours(start:)
    x0, y0 = start
    range = @moved ? [1] : [1, 2]
    range.map { |num| [x0, move_forward_by_color(y0, num)] }
  end

  def take_pieces_squares(start:)
    x0, y0 = start
    [[x0 + 1, move_forward_by_color(y0, 1)], [x0 - 1, move_forward_by_color(y0, 1)]]
  end
end
