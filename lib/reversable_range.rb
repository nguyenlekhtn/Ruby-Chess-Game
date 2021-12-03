module ReversableRange
  def reversable_range(start, goal)
    return [] if start == goal

    start < goal ? (start + 1).upto(goal - 1) : (start - 1).downto(goal + 1)
  end
end