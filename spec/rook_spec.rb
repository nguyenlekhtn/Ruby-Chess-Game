require_relative '../lib/Pieces/rook'
require_relative 'piece_interface_spec'
require_relative 'piece_subclass_spec'

describe Rook do
  it_behaves_like 'PieceInterface'
  it_behaves_like 'PieceSubclass'
end