require_relative '../lib/Pieces/bishop'
require_relative '../lib/board'
require_relative 'piece_interface_spec'
require_relative 'piece_subclass_spec'

describe Bishop do
  it_behaves_like 'PieceInterface'
  it_behaves_like 'PieceSubclass'

  describe 'local_move_valid?' do
    let(:board) { instance_double(Board) }
    subject(:bishop_local) { described_class.new(color: 'white', board: board, start: [0, 0]) }


    context 'when the start and goal is in a upright diagonal line and no piece is in between' do
      before do
        allow(board).to receive(:all_empty?).with([2, 2]).and_return(true)
      end
      it 'return true' do
        start = [1, 1]
        goal = [3, 3]
        expect(bishop_local.local_move_valid?(start: start, goal: goal)).to eq(true)
      end
    end
  end

end