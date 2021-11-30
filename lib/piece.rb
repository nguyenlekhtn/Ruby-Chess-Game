class Piece
  attr_reader :color, :board, :start

  def initialize(**opts)
    @color = opts[:color]
    @board = opts[:board]
    @start = opts[:start]
    post_initialize
  end

  def move_valid?(goal)
    (board.at(goal)[:empty?] || board.at(goal)[:value].color != @color) &&
      local_move_valid?(start: start, goal: goal)
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

  def post_initialize; end
end
