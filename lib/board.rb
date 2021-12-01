class Board
  attr_reader :pieces

  def initialize(board_arr: default_board_arr)
    @board_arr = board_arr
    @pieces = pieces_init
  end

  def pieces_init
    pieces_location.each_with_object([]) do |(k, v), a|
      color = piece_color(k)
      piece_type = piece_type(k)
      v.each do |location|
        start = location_to_xy(location)
        piece = piece_type.new(color: color, board: self, start: start)
        a << piece
      end
    end
  end

  # def at(position)
  #   {
  #     :empty? => empty?(position),
  #     :value => get_piece_at_position(position),
  #     :remove => get_piece_at_position(position).remove
  #   }
  # end

  def all_empty?(*positions)
    positions.all? { |position| empty?(position) }
  end

  # def get_piece_at_position(position)
  #   pieces.find { |piece| piece.start == position }
  # end

  def empty_at?(position)
    pieces.none? { |piece| piece.start == position}
  end

  def color_at(position)
    pieces.find { |piece| piece.start == position }&.color
  end

  private

  def location_to_xy(location)
    raise 'Invalid locaiton' unless location_valid?(location)

    files = 'a'..'h'
    ranks = '1'..'8'
    column_index = files.find_index(location[0])
    row_index = ranks.find_index(location[1])
    [row_index, column_index]
  end

  def location_valid?(location)
    /^[a-h][1-8]$/.match?(location)
  end

  def pieces_location
    {
      'P' => ('a'..'h').map { |char| char + '2'},
      'R' => %w[a1 h1],
      'N' => %w[b1 g1],
      'B' => %w[c1 f1],
      'Q' => %w[d1],
      'K' => %w[e1],
      'p' => ('a'..'h').map { |char| char + '7'},
      'r' => %w[a8 h8],
      'n' => %w[b8 g8],
      'b' => %w[c8 f8],
      'q' => %w[d8],
      'k' => %w[e8]
    }
  end

  def piece_type(char)
    {
      'p' => Pawn,
      'r' => Rook,
      'n' => Knight,
      'b' => Bishop,
      'k' => King,
      'q' => Queen
    }[char]
  end

  def piece_color(char)
    char == char.upcase ? 'white' : 'black'
  end
end