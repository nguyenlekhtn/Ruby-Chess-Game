require_relative '../lib/board'

shared_examples 'PieceSubclass' do |_parameter|
  let(:board) { instance_double(Board) }
  let(:piece) { described_class.new(color: 'white', board:, start: [0, 0]) }

  it 'respond to local_move_valid?' do
    expect(piece).to respond_to(:local_move_valid?)
  end

  it 'respond to post_initialize' do
    expect(piece).to respond_to(:post_initialize)
  end
end
