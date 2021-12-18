class Move
  def initialize(player:, board:, game:)
    @player = player
    @game = game
  end

  def start
    from = player.get_from_square(board)
    piece = board.piece_at(from)
    to = player.get_to_square(piece: piece, from: from)
    board.move(from: from, to: to)
    game.end_move
  end
end