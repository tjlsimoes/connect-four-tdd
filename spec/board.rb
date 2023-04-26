require_relative "../lib/connect_four_board"

describe Board do
	context "when board is initialized" do
		subject(:board) { described_class.new }

		it "cells instance variable has 43 elements" do
			cells = board.instance_variable_get(:@cells)
			expect( cells.length ).to eq(43)
		end

		it "cells instance variable is made up of \'  \'" do
			cells = board.instance_variable_get(:@cells)
			cells.all? { |value| value == " " }
		end

	end
end