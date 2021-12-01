require_relative '../lib/Pieces/queen'
require_relative 'piece_interface_spec'
require_relative 'piece_subclass_spec'

describe Queen do
  it_behaves_like 'PieceInterface'
  it_behaves_like 'PieceSubclass'


  describe 'local_move_valid?' do
    let(:board) { instance_double(Board) }
    subject(:queen) { described_class.new(board: board) }

    context 'when goal is in same horizontal line' do
      before do
        allow(board).to receive(:all_empty?).with([1, 2], [1, 3]).and_return(true)
      end

      it 'returns true' do
        start = [1, 1]
        goal = [1, 4]
        expect(queen.local_move_valid?(start: start, goal: goal)).to be true
      end
    end

    context 'when goal is in same vertical line' do
      xit 'returns true' do
        start = [1, 1]
        goal = [3, 1]
        expect(queen.local_move_valid?(start: start, goal: goal)).to be true
      end
    end
  end
end