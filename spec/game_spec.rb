require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'

describe Game do
	subject(:game) { described_class.new }

	before do
		game.instance_variable_set(:@board, instance_double(Board))
	end

	describe "#play" do
		it "shows the board" do
			allow(game).to receive(:puts)
			expect(game.board).to receive(:show)
			game.play
		end
	end
end