class Chess
  def initialize(player_class = HumanPlayer, current_player_index = 0, board = default_board)
    @player_class = player_class
    @players = players_setup
    @current_player_index = current_player_index
    @board = board
  end

  def play_game
    until game_over?
      get_move => { piece:, start:, goal: }
      @board.make_move(piece: piece, start: start, goal: goal)
    end
    game_over
  end

  def select_piece
    loop do
      position = get_position_from_player
      piece = piece_from_position
      return piece
    end
  end

  def current_player
    @players[current_player_index]
  end

  def players_setup
    [player_class.new, player_class.new]
  end

  def switch_current_player
    @current_player_index = 1 - @current_player_index
  end
end
