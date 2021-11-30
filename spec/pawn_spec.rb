require_relative '../lib/Pieces/pawn'
require_relative 'piece_interface_spec'
require_relative 'piece_subclass_spec'

describe Pawn do
  it_behaves_like 'PieceInterface'
  it_behaves_like 'PieceSubclass'
end
