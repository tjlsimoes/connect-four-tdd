require_relative "../lib/board"

# Board tests.

describe Board do

	subject(:board) { described_class.new }

	context "when board is initialized" do
		it "cells instance variable has 43 elements" do
			cells = board.cells
			expect(cells.length).to eq(43)
		end

		it "cells instance variable is made up of nil values" do
			cells = board.cells
			check = cells.all? { |value| value == nil }
			expect(check).to eq true
		end

		it "cells instance variable is not made up of 9" do
			cells = board.cells
			check = cells.all? { |value| value == 9 }
			expect(check).to eq false
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
				new_cells = Array.new(43)
        new_cells[3..5] = "\u26d4"
        new_cells[6..8] = "\u26dD"

				board.instance_variable_set(:@cells, new_cells )
				expect(board).to_not be_full
			end
		end

		context "when board is full" do
			it "returns is full" do
				new_cells = Array.new(43)
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
					new_cells = Array.new(43)
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
					new_cells = Array.new(43)
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

	describe "#update_board" do

		context "when board is initialized" do
			it "updates last element on 1st row" do
				board.update_board(1, "\u26d4")
				cells = board.cells
				expect(cells[36]).to eq("\u26d4")
			end
		end

		context "on row already filled with some symbols" do

			before do
				new_cells = Array.new(43)
        new_cells[29] = "\u26d4"
        new_cells[36] = "\u26dD"
				board.instance_variable_set(:@cells, new_cells )
			end

			it "updates first empty row element" do
				board.update_board(1, "\u26d4")
				cells = board.cells
				expect(cells[22]).to eq("\u26d4")
			end
		end

		context "on filled up row" do
			before do
				new_cells = Array.new(43)
				[36, 29, 22, 15, 8, 1]. each do |idx|
					new_cells[idx] = "\u26d4"
				end
				board.instance_variable_set(:@cells, new_cells )
			end

			it "it does nothing" do
				board.update_board(1, "\u26dD") # update board with different marker
				cells = board.cells
				expect(cells[1]).to_not eq("\u26dD")
			end
		end
	end

end