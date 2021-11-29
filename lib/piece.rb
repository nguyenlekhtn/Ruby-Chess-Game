class Piece
  def initialize(**opts)
    @color = opts[:color]
    @board = opts[:board]
    @start = opts[:start]
  end

  def move_valid?(goal)
    (@board.at(goal)[:empty?] || @board.at(goal)[:value].color != @color) &&
      local_move_valid?(start: @start, goal: goal)
  end

  def local_move_valid?
    true
  end

  def to(goal)
    @start = goal
  end

  def remove
    @start = nil
  end
end
