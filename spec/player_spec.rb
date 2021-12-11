require_relative '../lib/chess'
require_relative '../lib/player'

describe Player do
  describe 'player_input' do
    let(:game) { instance_double(Chess) }
    subject(:player) { described_class.new(game: game)}

    context 'when input is out of range' do
      it 'sends player_input again' do
        input = 'A9A1'
        error_msg = 'Invalid input format'
        expect(player).to receive(:puts).with(error_msg)
        player.player_input(input)
      end
    end
  end
end