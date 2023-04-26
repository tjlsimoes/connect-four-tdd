require "./lib/connect_four.rb"


describe Game do

	let(:player1) {instance_double(HumanPlayer)}
	subject(:game) { Game.new }

	describe "#initial board" do
		it "returns an array of 43 elements" do
			initial_board = game.initial_board
			expect(initial_board.length).to eq(43)
		end

	end

end