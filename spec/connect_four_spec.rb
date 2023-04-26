require "./lib/connect_four.rb"


describe Game do

	subject(:game) { Game.new }
	let(:player1) {HumanPlayer}
	describe "#initial board" do
		it "returns an array of 43 elements" do
			initial_board = Game.initial_board
			expect(initial_board.length).to eq(43)
		end

	end

end