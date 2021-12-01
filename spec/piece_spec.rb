require_relative 'piece_interface_spec'
require_relative '../lib/piece'

describe Piece do
  it_behaves_like 'PieceInterface'

  describe 'move_valid?' do
    let(:board) { instance_double(Board) }
    subject(:piece_move) { described_class.new(color: 'white', board: board) }

    context 'when goal.x is out of range' do
      it 'return false' do
        goal = [-1, 0]
        expect(piece_move.move_valid?(goal)).to eq(false)
      end
    end

    context 'when goal.y is out of range' do
      it 'return false' do
        goal = [0, 8]
        expect(piece_move.move_valid?(goal)).to eq(false)
      end
    end

    context 'when no piece at goal while other condition satisfied' do
      let(:goal) { double('goal') }

      before do
        allow(board).to receive(:empty_at?).with(goal).and_return(true)
        allow(piece_move).to receive(:local_move_valid?).and_return(true)
        allow(piece_move).to receive(:in_range?).with(goal).and_return(true)
      end

      it 'returns true' do
        expect(piece_move.move_valid?(goal)).to eq(true)
      end
    end

    context 'when piece at goal has a different color while other condition satisfied' do
      let(:goal) { double('goal') }

      before do
        allow(board).to receive(:empty_at?).with(goal).and_return(false)
        allow(board).to receive(:color_at).with(goal).and_return('black')
        allow(piece_move).to receive(:local_move_valid?).and_return(true)
        allow(piece_move).to receive(:in_range?).with(goal).and_return(true)
      end

      it 'returns true' do
        expect(piece_move.move_valid?(goal)).to eq(true)
      end
    end

    context 'when piece at goal has the same color while other condition satisfied' do
      let(:goal) { double('goal') }

      before do
        allow(board).to receive(:empty_at?).with(goal).and_return(false)
        allow(board).to receive(:color_at).with(goal).and_return('white')
        allow(piece_move).to receive(:local_move_valid?).and_return(true)
        allow(piece_move).to receive(:in_range?).with(goal).and_return(true)
      end

      it 'returns false' do
        expect(piece_move.move_valid?(goal)).to eq(false)
      end
    end
  end
end