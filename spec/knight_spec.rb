require_relative '../lib/Pieces/knight'
require_relative 'piece_interface_spec'
require_relative 'piece_subclass_spec'

describe Knight do
  it_behaves_like 'PieceInterface'
  it_behaves_like 'PieceSubclass'

  describe 'local_move_valid?' do
    subject(:knight) { described_class.new }

    context 'when move 2 in x, 1 in y' do
      it 'returns true' do
        start = [3, 3]
        goal = [4, 5]
        expect(knight.local_move_valid?(start:, goal:)).to be true
      end
    end

    context 'when move 1 in x, -2 in y' do
      it 'returns true' do
        start = [3, 3]
        goal = [1, 4]
        expect(knight.local_move_valid?(start:, goal:)).to be true
      end
    end

    context 'when move 0 in x, 2 in y' do
      it 'returns false' do
        start = [3, 3]
        goal = [5, 3]
        expect(knight.local_move_valid?(start:, goal:)).to be false
      end
    end

    context 'when move 1 in x, 4 in y' do
      it 'returns false' do
        start = [3, 3]
        goal = [7, 4]
        expect(knight.local_move_valid?(start:, goal:)).to be false
      end
    end
  end
end
