require_relative '../lateral'
require_relative '../piece'

class Pawn < Piece
  include Lateral
  attr_reader :moved

  def post_initialize(opts)
    @type = 'pawn'
    @moved = opts[:moved] || false
  end

  def local_move_valid?(start:, goal:)
    return true if @board.empty_at?(goal) && movable_by_color?(start, goal)

    return true if takable?(start, goal)

    false
  end

  private

  def movable_by_color?(start, goal)
    neighbours = move_forward_neighbours(start)
    neighbours.any? do |neighbour|
      distance_vertical = neighbour[0] - start[0]
      is_piece_between_if_move_2 = if distance_vertical.abs == 2
                                     vertical_squares_inside_empty?(start:, goal:)
                                   else
                                     true
                                   end
      neighbour == goal && is_piece_between_if_move_2
    end
  end

  def takable?(start, goal)
    take_pieces_squares(start).any? { |square| square == goal }
  end

  def take_pieces_squares(start)
    x0, y0 = start
    [[x0 + 1, move_forward_by_color(y0, 1)], [x0 - 1, move_forward_by_color(y0, 1)]].select do |position|
      in_range?(position)
    end
  end

  def move_forward_neighbours(start)
    x0, y0 = start
    range = [1]
    range += [2] unless @moved
    range.map { |num| [move_forward_by_color(x0, num), y0] }
  end

  def move_forward_by_color(num1, step)
    @color == 'white' ? num1 + step : num1 - step
  end
end
