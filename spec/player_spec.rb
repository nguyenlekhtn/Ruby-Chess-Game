require_relative '../lib/chess'
require_relative '../lib/player'

describe Player do
  describe 'player_input' do
    let(:game) { instance_double(Chess) }
    subject(:player) { described_class.new(game: game)}

    context 'when input is out-range' do
      it 'sends player_input again' do
        input = 'A8A1'
        expect(player).to receive(:player_input)
        player.player_input(input)
      end
    end
  end
end