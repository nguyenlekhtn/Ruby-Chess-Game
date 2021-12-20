require_relative '../piece'
require_relative '../lateral'

class Rook < Piece
  include Lateral

  def local_move_valid?(start:, goal:)
    local_neighbors(start)
    local_neighbors(start).include?(goal)
  end

  def local_neighbors(current_location)
    vertical_neighbors(current_location) + horizontal_neighbors(current_location)
  end
end
