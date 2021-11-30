require_relative '../lib/Pieces/bishop'
require_relative 'piece_interface_spec'
require_relative 'piece_subclass_spec'

describe Bishop do
  it_behaves_like 'PieceInterface'
  it_behaves_like 'PieceSubclass'
end