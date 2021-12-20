require_relative '../lib/Pieces/rook'
require_relative 'piece_interface_spec'
require_relative 'piece_subclass_spec'

describe Rook do
  it_behaves_like 'PieceInterface'
  it_behaves_like 'PieceSubclass'

  describe 'local_move_valid?' do
    let(:board) { instance_double(Board) }
    subject(:queen) { described_class.new(board: board) }

    context 'when goal is in same horizontal line and after start and no piece is in between' do
      before do
        allow(board).to receive(:all_empty?).and_return(true)
      end

      it 'returns true' do
        start = { row: 1, col: 2 }
        goal =  { row: 1, col: 4 }
        expect(queen.local_move_valid?(start: start, goal: goal)).to be true
      end
    end

    context 'when goal is in same horizontal line and before start and no piece is in betwen' do
      before do
        allow(board).to receive(:all_empty?).and_return(true)
      end

      it 'returns true' do
        start = { row: 3, col: 3 }
        goal =  { row: 3, col: 1}
        expect(queen.local_move_valid?(start: start, goal: goal)).to be true
      end
    end

    context 'when goal is in same vertical line and no piece is in between' do
      before do
        allow(board).to receive(:all_empty?).and_return(true)
      end

      it 'returns true' do
        start = { row: 1, col: 1 }
        goal =  { row: 3, col: 1}
        expect(queen.local_move_valid?(start: start, goal: goal)).to be true
      end
    end

    context 'when goal is in same diagonal line and there are no pieces in between' do
      before do
        allow(board).to receive(:all_empty?).and_return(true)
      end

      it 'returns false' do
        start = { row: 1, col: 1 }
        goal =  { row: 4, col: 4 }
        expect(queen.local_move_valid?(start: start, goal: goal)).to be false
      end
    end

    context 'when goal is not in the same line with start' do
      before do
        allow(board).to receive(:all_empty?).and_return(false)
      end

      it 'returns false' do
        start = { row: 3, col: 2 }
        goal = { row: 1, col: 6 }
        expect(queen.local_move_valid?(start: start, goal: goal)).to be false
      end
    end
  end
end