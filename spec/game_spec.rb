require_relative '../lib/game'

describe Game do
  describe '#play_game' do
    subject(:game_object) { described_class.new(player_one, player_two, board_double) }
    let(:player_one) { double('Player', name: 'Viper') }
    let(:player_two) { double('Player', name: 'Fangs') }
    let(:board_double) { double('board') }

    context 'When game_over is true' do
      before do
        allow(board_double).to receive(:game_over).and_return(true)
      end

      it 'returns from play_game' do
        expect(board_double).to receive(:game_over).once
        game_object.play_game
      end
    end

    context 'When game_over is false and then true' do
      before do
        allow(board_double).to receive(:game_over).and_return(false, true)
      end

      it 'calls play_game_helper twice' do
        expect(board_double).to receive(:game_over).twice
        expect(game_object).to receive(:play_game_helper).twice
        game_object.play_game
      end
    end
  end
end
