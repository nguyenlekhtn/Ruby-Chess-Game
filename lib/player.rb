class Player
  def initialize
    
  end

  def get_start_square(board)
    loop do
      start = gets.chomp
      
      return start if board.player_piece_in_square?(player: self, square: start)
      
    end
  end

  def get_goal_square(valid_moves)
    loop do
      goal = gets.chomp
      return goal if valid_move.include? goal
    end
  end
end