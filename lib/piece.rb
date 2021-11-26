class Piece
  def initialize(**opts)
    @color = opts[:color]
    @board = opts[:board]
  end

  def move_valid?(start:, goal:, board:, player:)
    !board.same_color_at_square?(square: goal, color: color) &&
      local_move_valid?(start: start, goal: goal)
  end

  def local_move_valid?

  end
end