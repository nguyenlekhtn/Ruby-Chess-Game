class Move
  def initialize(**opts)
    @player = opts[player]
    @game = opts[game]
    @valid_from = opts[valid_from]
    @valid_to = opts[valid_to]
  end

  def start
    from = player.get_from_square(board)
    piece = board.piece_at(from)
    to = player.get_to_square(piece: piece, from: from)
    board.move(from: from, to: to)
    game.end_move
  end
end
