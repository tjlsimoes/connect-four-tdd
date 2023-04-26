require_relative "../lib/board"

# Board tests.

describe Board do

	subject(:board) { described_class.new }

	context "when board is initialized" do
		it "cells instance variable has 43 elements" do
			cells = board.cells
			expect( cells.length ).to eq(43)
		end

		it "cells instance variable is made up of \'  \'" do
			cells = board.cells
			cells.all? { |value| value == " " }
		end

	end

	describe "#full?" do

		context "when board is initialized" do
			it "is not full" do
				expect(board).to_not be_full
			end
		end

		context "when board is already modified but not full" do
			it "returns is not full" do
				new_cells = Array.new(43, " ")
        new_cells[3..5] = "\u26d4"
        new_cells[6..8] = "\u26dD"

				board.instance_variable_set(:@cells, new_cells )
				expect(board).to_not be_full
			end
		end

		context "when board is full" do
			it "returns is not full" do
				new_cells = Array.new(43, " ")
				new_cells[1..43] = "\u26d4"

				board.instance_variable_set(:@cells, new_cells )
				expect(board).to be_full
			end
		end
	end


	describe "#valid_move?" do
		context "checks that any of row positions is free" do

			context "with empty row" do
				it "returns true" do
					valid_move = board.valid_move?(1)
					expect(valid_move).to eq true
				end
			end

			context "with non-empty row" do

				before do
					new_cells = Array.new(43, " ")
					[1,8,15,22,29].each do |value|
						new_cells[value] = "\u26d4"
					end
					board.instance_variable_set(:@cells, new_cells )
				end

				it "returns true" do
					# valid_move = board.valid_move?(1)
					expect(board).to be_valid_move(1)
				end
			end

			context "with full row" do

				before do
					new_cells = Array.new(43, " ")
					[1,8,15,22,29,36].each do |value|
						new_cells[value] = "\u26d4"
					end
					board.instance_variable_set(:@cells, new_cells )
				end

				it "returns false" do
					# invalid_move = board.valid_move?(1)
					expect(board).to_not be_valid_move(1)
				end
			end
		end

	end


end