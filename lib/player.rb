class Player
  attr_reader :game, :color

  def initialize(**opts)
    @color = opts[:color]
    @game = opts[:game]
  end

  def player_input(input = nil)
    show_prompt_start_goal

    input ||= gets.chomp.downcase

    return input if /([a-h][1-8]){2}/.match(input)
  end

  def play(board)
    start, goal = get_start_goal

  end

  def show_prompt_start_goal
    print <<~EOF
      Enter the location of your piece you want to move and location you want to move into

      Selection:\s
    EOF
  end
end