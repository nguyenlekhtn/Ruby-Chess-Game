require_relative '../diagonal'
require_relative '../piece'

class Bishop < Piece
  include Diagonal

  def local_move_valid?(start:, goal:)
    diagonal(start:, goal:)
  end
end
