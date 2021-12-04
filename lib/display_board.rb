module DisplayBoard
  box = [2, 0, 12, 16, 20, 24, 44, 52, 28, 36, 60].map { |i| char(9472 + i).chr(Encoding::UTF_8) }
  vertical_line, horizontal_line, top_left, top_right, bottom_left, bottom_right, top_mid,
    bottom_mid, left_mid, right_mid, center = box
  horizontal_cell = horizontal_line * 3
  top_line = top_left + (horizontal_cell + top_mid) * 3 + top_right
  rows_line = left_mid + (horizontal_cell + center) * 3 + right_mid
  bottom_line = left_mid + (horizontal_cell + bottom_mid) * 3 + right_mid
  inside =  "%{piece} " + vertical_line
  piece_map = { 
    'king' => 0,
    'queen' => 1,
    'rook' => 2,
    'bishop' => 3,
    'knight' => 4,
    'pawn' => 5
  }
  color_map = {
    'white' => 9812,
    'black' => 9818
  }

  def piece_to_unicode(piece)
    return ' ' if piece.nil?

    (color_map[piece.color] + piece_map[piece.class.name.downcase]).chr(Encoding::UTF_8)
  end

  def board_row(pieces)
    remains = pieces.map { |piece| piece_to_unicode(piece) }.map { |code| code + vertical_line }.join
    vertical_line + remains
  end

  def pieces_array
    init_arr = Array.new(8) { Array.new(8) }
    @pieces.each_with_object(init_arr) do |piece, arr|
      arr[y_piece][x_piece] = piece
    end
  end

  def display_board
    puts top_line
    puts row(pieces_array[0])
    pieces_array[1..].each do |arr_row|
      puts rows_line
      puts board_row(arr_row)
    end
    puts bottom_line
  end
end