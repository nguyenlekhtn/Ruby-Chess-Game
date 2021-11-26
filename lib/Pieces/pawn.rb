class Pawn
  attr_reader :color

  def initialize(**opts)
    @color = opts[:color]
    @moved = false
  end

  def local_move_valid?(start:, goal:)
    range = @moved ? 1 : 2
    if 'color' == black
      
    end
  end
end
