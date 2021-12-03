class Piece
  attr_reader :color, :board, :start

  def initialize(**opts)
    @color = opts[:color]
    @board = opts[:board]
    @start = opts[:start]
    post_initialize(opts)
  end

  def move_valid?(goal)
    in_range?(goal) && (board.empty_at?(goal) || board.color_at(goal) != @color) &&
      local_move_valid?(start: start, goal: goal)
  end

  def local_move_valid?(start:, goal:)
    true
  end

  def to(goal)
    @start = goal
  end

  def remove
    @start = nil
  end

  def post_initialize; end

  def in_range?(position)
    x, y = position
    x.between?(0, 7) && y.between?(0, 7)
  end

  private

end
