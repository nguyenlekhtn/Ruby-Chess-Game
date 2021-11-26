class Pawn
  attr_reader :color

  def initialize(**opts)
    @color = opts[:color]
    @moved = false
  end

  def piece_valid?
    
  end

  def valid?(start:, goal:, player:)
    super(goal: goal, player: player) && 
  end
end
