class Player
  attr_reader :game, :color

  def initialize(**opts)
    @color = opts[:color]
    @game = opts[:game]
  end

  def player_input(input = nil)
    show_prompt_start_goal

    input ||= gets.chomp.downcase
    
    case input
    when /([a-h][1-8]){2}/
      start = input.slice(0, 2)
      goal = input.slice(2, 2)
      return { start: start, goal: goal }
    else
      puts 'Invalid input format'
      player_input
    end

  end

  def show_prompt_start_goal
    print <<~EOF
      Enter the location of your piece you want to move and location you want to move into

      Selection:\s
    EOF
  end
end