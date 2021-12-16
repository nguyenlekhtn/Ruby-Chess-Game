class Chess
  def initialize(**opts)
    @player_class = opts[:player_class] || Player
    @active_color = opts[:active_color] || 'white'
    @full_move = opts[:full_move] || 0
    @half_move_clock = opts[:half_move] || 0
    @board = opts[:board] || Board.new
    @players = { 'black' => player_class.new('black'), 'white' => player_class.new('white') }
  end

  def play(move = Move.new(current_player))
    move.play
  end

  def end_move
    increase_half_moves
    increase full_moves if current_player.color == 'black'
    close_game if game_over?
    switch_current_player
  end

  def save; end

  private

  def switch_active_color
    @active_color = @active_color == 'white' ? 'black' : 'white'
  end

  def increase_full_move
    @full_move += 1
  end

  def increase_half_move_clock
    @half_move_clock += 1
  end

  def reset_half_move_clock
    @half_move_clock = 0
  end

  def player_input
    loop do
      start_location, goal_location = current_player.get_start_and_goal_locations
      info = get_info_from_locations(start_location, goal_location)
      return info if info

      put 'Invalid start location or goal location'
    end
  end

  def get_info_from_locations(start, goal)
    return nil if @board.at(start)[:empty?] || @board.color_at_location != @active_color

    piece = @board.piece_at_location(start)
    return nil if piece.move_valid?(goal: goal)

    start_xy = @board.location_to_xy(start)
    goal_xy = @board.location_to_xy(goal)

    { piece: piece, start: start_xy, goal: goal_xy }
  end
  
  def current_player
    @players[@active_color]
  end
end
