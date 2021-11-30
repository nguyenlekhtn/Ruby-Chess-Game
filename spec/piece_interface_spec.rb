require_relative '../lib/board.rb'

shared_examples 'PieceInterface' do |other_parameter|
  let(:board) { instance_double(Board) }
  let(:piece) { described_class.new(color: 'white', board: board, start: [0,0]) }

  it 'respond to color' do
    expect(piece).to respond_to(:color)
  end

  it 'respond to board' do
    expect(piece).to respond_to(:board)
  end

  it 'respond to start' do
    expect(piece).to respond_to(:start)
  end

  it 'respond to move_valid' do
    expect(piece).to respond_to(:move_valid?).with(1).argument
  end

  it 'respond to to' do
    expect(piece).to respond_to(:to).with(1).argument
  end

  it 'respond to remove' do
    expect(piece).to respond_to(:remove)
  end
end