class Knight
  def initialize(**opts)
    @color = opts[:color]
  end

  def neightbours(x, y)
    [
      [x + 2, y + 1],
      [x + 2, y - 1],
      [x - 2, y + 1],
      [x - 2, y - 1],
      [x - 1, y - 2],
      [x - 1, y + 2],
      [x + 1, y - 2],
      [x + 1, y + 2]
    ]
  end
end