require_relative '../lib/Pieces/knight'
require_relative 'piece_interface_spec'
require_relative 'piece_subclass_spec'

describe Knight do
  it_behaves_like 'PieceInterface'
  it_behaves_like 'PieceSubclass'
end

