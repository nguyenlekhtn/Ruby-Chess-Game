class Piece
  def initialize(**opts)
    @color = opts[:color]
  end

  def move_valid?(start:, goal:, board:, player:)
    board.same_player_piece_at_square?(square: goal, player: player) &&
      local_move_valid?(start: start, goal: goal, board: board, player: player)
  end

  def local_move_valid?

  end
end