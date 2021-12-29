require_relative '../lib/Pieces/king'
require_relative 'piece_interface_spec'
require_relative 'piece_subclass_spec'

describe King do
  it_behaves_like 'PieceInterface'
  it_behaves_like 'PieceSubclass'

  describe 'local_move_valid?' do
    subject(:king) { described_class.new }
    let(:valid_start_goal?) { king.local_move_valid?(start:, goal:) }

    context 'if goal is right after start in ranks' do
      it 'returns true' do
        start = [1, 1]
        goal = [1, 2]
        expect(king.local_move_valid?(start:, goal:)).to be true
      end
    end

    context 'if goal is right before start in files' do
      it 'returns true' do
        start = [1, 1]
        goal = [0, 1]
        expect(king.local_move_valid?(start:, goal:)).to be true
      end
    end

    context 'when goal is upper right start' do
      it 'returns true' do
        start = [1, 1]
        goal = [0, 1]
        expect(king.local_move_valid?(start:, goal:)).to be true
      end
    end

    context 'if goal is in same ranks but distance = 2' do
      it 'returns false' do
        start = [3, 3]
        goal = [3, 5]
        expect(king.local_move_valid?(start:, goal:)).to be false
      end
    end

    context 'if goal is very far from goal' do
      it 'returns false' do
        start = [6, 6]
        goal = [2, 3]
        expect(king.local_move_valid?(start:, goal:)).to be false
      end
    end
  end
end
