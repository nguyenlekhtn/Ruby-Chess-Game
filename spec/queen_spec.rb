require_relative '../lib/Pieces/queen'
require_relative 'piece_interface_spec'
require_relative 'piece_subclass_spec'

describe Queen do
  it_behaves_like 'PieceInterface'
  it_behaves_like 'PieceSubclass'

  describe 'local_move_valid?' do
    let(:board) { instance_double(Board) }
    subject(:queen) { described_class.new(board:) }

    context 'when goal is in same horizontal line and no piece is in between' do
      before do
        allow(board).to receive(:all_empty?).and_return(true)
      end

      it 'returns true' do
        start = [1, 1]
        goal = [1, 4]
        expect(queen.local_move_valid?(start:, goal:)).to be true
      end
    end

    context 'when goal is in same vertical line and no piece is in between' do
      before do
        allow(board).to receive(:all_empty?).and_return(true)
      end

      it 'returns true' do
        start = [1, 1]
        goal = [3, 1]
        expect(queen.local_move_valid?(start:, goal:)).to be true
      end
    end

    context 'when goal is in same diagonal line and no piece is in between' do
      before do
        allow(board).to receive(:all_empty?).and_return(true)
      end

      it 'returns true' do
        start = [1, 1]
        goal = [2, 2]
        expect(queen.local_move_valid?(start:, goal:)).to be true
      end
    end

    context 'when goal is in same diagonal line and there are pieces in between' do
      before do
        allow(board).to receive(:all_empty?).and_return(false)
      end

      it 'returns false' do
        start = [1, 1]
        goal = [2, 2]
        expect(queen.local_move_valid?(start:, goal:)).to be false
      end
    end

    context 'when goal is not in the same horizontal, vertical or diagonal line' do
      it 'returns false' do
        start = [1, 1]
        goal = [2, 3]
        expect(queen.local_move_valid?(start:, goal:)).to be false
      end
    end
  end
end
