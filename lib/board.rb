class Board
  def initialize(board_arr: default_board_arr)
    @board_arr = board_arr
    @piece_list = pieces_init 
  end

  def make_move(goal:, start:, piece:, special_move: nil)
    # copy value from start to goal
   start_value = get_value(square: start)
   set_value(square: goal, value: start_value)
  end

  def player_piece_in_square?(player:, square:)
    player
  end

  def 

  def default_board_arr
    %w[
      ROOK KNIGHT BISHOP QUEEN KING BISHOP KNIGHT ROOK
      PAWN PAWN PAWN PAWN PAWN PAWN PAWN PAWN
      EMPTY EMPTY EMPTY EMPTY EMPTY EMPTY EMPTY EMPTY
      EMPTY EMPTY EMPTY EMPTY EMPTY EMPTY EMPTY EMPTY
      EMPTY EMPTY EMPTY EMPTY EMPTY EMPTY EMPTY EMPTY
      EMPTY EMPTY EMPTY EMPTY EMPTY EMPTY EMPTY EMPTY
      PAWN PAWN PAWN PAWN PAWN PAWN PAWN PAWN
      ROOK KNIGHT BISHOP QUEEN KING BISHOP KNIGHT ROOK
    ]
  end

  def pieces_init
    {
      
    }
  end
end