require_relative '../piece'
require_relative '../lateral'

class Rook < Piece
  include Lateral

  def local_move_valid?(start:, goal:)
    vertical(start: start, goal: goal) ||
      horizontal(start: start, goal: goal)
  end
end