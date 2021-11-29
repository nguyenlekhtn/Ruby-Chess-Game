class Player
  def initialize(color)
    @color = color
  end

  def get_start_and_goal_locations
    loop do
      puts 'Please input the start location that contained the piece you want to move, and the location it should move into'
      puts 'Format: <start><goal>. Example: b1b2'
      input = gets.chomp.downcase
      return input if /([a-h][1-8]){2}/.match(input)

      puts 'Invalid input format'
    end
  end
end