class Player
  attr_reader :game, :color

  def initialize(**opts)
    @color = opts[:color]
    @game = opts[:game]
  end

  def player_input
    input = gets.chomp.downcase

    return input if /^([A-Z][1-8]){2}$/.match?(input)

    puts 'Invalid format'
  end

  def get_start_square(board)
    loop do
      start = player_input
      return start if board.square_has_same_color(color)

      puts 'Invalid start input'
    end
  end

  def get_goal_square(piece:, start:)
    loop do
      goal = player_input
      return goal if piece.movable?(start: start, goal: goal)

      puts 'Invalid goal input'
    end
  end

  def show_prompt_start_goal
    print <<~MSG
      Enter the location of your piece you want to move and location you want to move into

      Selection:\s
    MSG
  end
end
