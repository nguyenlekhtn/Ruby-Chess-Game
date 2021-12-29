require_relative '../piece'
require_relative '../lateral'
require_relative '../diagonal'

class Queen < Piece
  include Lateral
  include Diagonal

  def local_move_valid?(start:, goal:)
    vertical(start:, goal:) ||
      horizontal(start:, goal:) ||
      diagonal(start:, goal:)
  end
end
