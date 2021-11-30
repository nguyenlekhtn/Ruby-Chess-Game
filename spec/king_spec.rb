require_relative '../lib/Pieces/king'
require_relative 'piece_interface_spec'
require_relative 'piece_subclass_spec'


describe King do
  it_behaves_like 'PieceInterface'
  it_behaves_like 'PieceSubclass'
end