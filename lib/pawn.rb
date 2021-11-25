class Pawn
  attr_reader :color

  def initialize(**opts)
    @color = opts[:color]
    @moved = false
  end

  def neightbours(x, y, board)
    neightbours = []
    distance = moved == true ? 1 : 2
    neightbours << if black
                     [x, y + distance]
                   else
                     [x, y - distance]
                   end

    neightbours
  end
end
