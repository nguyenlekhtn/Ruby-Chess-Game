class Pawn
  attr_reader :color

  def initialize(**opts)
    @color = opts[:color]
    @moved = false
  end

  def local_move_valid?(start:, goal:)
    Moves.forward_by_color(start: start, goal: goal)
  end
end
