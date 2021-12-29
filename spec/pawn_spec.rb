require_relative '../lib/Pieces/pawn'
require_relative 'piece_interface_spec'
require_relative 'piece_subclass_spec'

describe Pawn do
  it_behaves_like 'PieceInterface'
  it_behaves_like 'PieceSubclass'

  describe 'local_move_valid?' do
    let(:board) { instance_double(Board) }
    let(:valid?) { pawn.local_move_valid?(start:, goal:) }

    context 'when pawn not moved and goal is 1 square from start and it is empty' do
      let(:color) { 'white' }
      subject(:pawn) { described_class.new(board:, color:) }

      it 'is valid' do
        start = [0, 0]
        goal = [1, 0]
        allow(board).to receive(:empty_at?).with(goal).and_return(true)
        expect(pawn.local_move_valid?(start:, goal:)).to be true
      end
    end

    context 'when pawn not moved and goal is 1 square from start and it is not empty' do
      let(:color) { 'black' }
      subject(:pawn) { described_class.new(board:, color:) }

      it 'is not valid' do
        start = [7, 0]
        goal = [5, 0]
        allow(board).to receive(:empty_at?).with(goal).and_return(false)
        expect(pawn.local_move_valid?(start:, goal:)).to be false
      end
    end

    context 'when pawn not moved and goal is 2 square from start and it is empty and there is nothing in between' do
      let(:color) { 'black' }
      subject(:pawn) { described_class.new(board:, color:) }

      it 'is valid' do
        start = [7, 0]
        goal = [5, 0]
        allow(board).to receive(:empty_at?).with(goal).and_return(true)
        allow(board).to receive(:all_empty?).with([6, 0]).and_return(true)
        expect(pawn.local_move_valid?(start:, goal:)).to be true
      end
    end

    context 'when pawn not moved and goal is 2 square from start, goal is empty but there is a piece in between' do
      let(:color) { 'black' }
      subject(:pawn) { described_class.new(board:, color:) }

      it 'is valid' do
        start = [7, 0]
        goal = [5, 0]
        allow(board).to receive(:empty_at?).with(goal).and_return(true)
        allow(board).to receive(:all_empty?).with([6, 0]).and_return(false)
        expect(pawn.local_move_valid?(start:, goal:)).to be false
      end
    end

    context 'when pawn moved and goal is 1 square from start and it is empty' do
      let(:color) { 'white' }
      subject(:pawn) { described_class.new(board:, color:, moved: true) }

      it 'is valid' do
        start = [0, 0]
        goal = [1, 0]
        allow(board).to receive(:empty_at?).with(goal).and_return(true)
        expect(pawn.local_move_valid?(start:, goal:)).to be true
      end
    end

    context 'when pawn moved and goal is 2 square from start and it is empty' do
      let(:color) { 'white' }
      subject(:pawn) { described_class.new(board:, color:, moved: true) }

      it 'is is not valid' do
        start = [0, 0]
        goal = [2, 0]
        allow(board).to receive(:empty_at?).with(goal).and_return(true)
        expect(pawn.local_move_valid?(start:, goal:)).to be false
      end
    end

    context 'when goal is 3 from x and 2 from y and it is empty' do
      let(:color) { 'white' }
      subject(:pawn) { described_class.new(board:, color:, moved: true) }

      it 'is is not valid' do
        start = [1, 0]
        goal = [4, 2]
        allow(board).to receive(:empty_at?).with(goal).and_return(true)
        expect(pawn.local_move_valid?(start:, goal:)).to be false
      end
    end

    context 'when goal is 5 from x and 2 from y and there is oppsite piece' do
      let(:color) { 'white' }
      subject(:pawn) { described_class.new(board:, color:, moved: true) }

      it 'is is not valid' do
        start = [1, 0]
        goal = [6, 2]
        allow(board).to receive(:empty_at?).with(goal).and_return(false)
        expect(pawn.local_move_valid?(start:, goal:)).to be false
      end
    end
  end
end
