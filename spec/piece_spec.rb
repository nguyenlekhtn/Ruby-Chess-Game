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

    context 'when no piece at goal while other conditions satisfied' do
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

    context 'when piece at goal has a different color while other conditions satisfied' do
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

    context 'when piece at goal has the same color while other conditions satisfied' do
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

    context 'when local move not valid while other conditions satisfied' do
      let(:goal) { double('goal') }

      before do
        allow(board).to receive(:empty_at?).with(goal).and_return(true)
        allow(piece_move).to receive(:in_range?).with(goal).and_return(true)
        allow(piece_move).to receive(:local_move_valid?).with(start: piece_move.start, goal: goal).and_return(false)
      end

      it 'returns false' do
        expect(piece_move.move_valid?(goal)).to eq(false)
      end
    end

    context 'when local move valid while other conditions satisfied' do
      let(:goal) { double('goal') }

      before do
        allow(board).to receive(:empty_at?).with(goal).and_return(true)
        allow(piece_move).to receive(:in_range?).with(goal).and_return(true)
        allow(piece_move).to receive(:local_move_valid?).with(start: piece_move.start, goal: goal).and_return(true)
      end

      it 'returns true' do
        expect(piece_move.move_valid?(goal)).to eq(true)
      end
    end
  end


  describe 'to' do
    subject(:piece_to) { described_class.new(start: [1, 1]) }

    it 'change start to the given argument' do
      expect { piece_to.to([2, 2]) }.to change { piece_to.start }.from([1,1]).to([2, 2] )
    end
  end

  describe 'remove' do
    subject(:piece_remove) { described_class.new(start: [1, 1]) }

    it 'change start to nil' do
      expect { piece_remove.remove }.to change { piece_remove.start }.from([1,1]).to(nil)
    end
  end
end