require_relative "../lib/board"
require_relative "../lib/node"
require_relative "../lib/node_tree"

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
        expect(cells[36].root.symbol).to eq("\u26d4")
      end
    end

    context "on row already filled with some symbols" do

      before do
        board.update_board(1, "\u26d4")
        board.update_board(1, "\u26dD")
        board.update_board(1, "\u26d4")
      end

      it "updates first empty row element" do
        cells = board.cells
        expect(cells[22].root.symbol).to eq("\u26d4")
      end

      it "and its children nodes are correctly set" do
        cells = board.cells
        expect(cells[22].root.child6.root.id).to eq(29)
      end

      it "having those children node_trees a reciprocal relation" do
        cells = board.cells
        child = cells[22].root.child6.root
        expect(child.child5.root.id).to eq(22)
      end
    end

    context "on filled up row" do
      before do
        6.times {board.update_board(1, "\u26d4")}
      end

      it "it does nothing" do
        board.update_board(1, "\u26dD") # update board with different marker
        cells = board.cells
        expect(cells[1].root.symbol).to_not eq("\u26dD")
      end
    end
  end

  context "#largest_component" do
      
    context "when board is initialized" do
      it "returns 0" do
        expect(board.largest_component("\u2666")).to eq(0)
      end
    end

    context "4 bottom left horizontal win for symbol 1" do

      before do
        for i in [1,2,3,4] do
          board.update_board(i, "\u2666")
        end
      end

      it "returns 4" do
        expect(board.largest_component("\u2666")).to eq(4)
      end
    end

    context "4 vertical win on leftmost column for symbol 1" do
      it "returns 4" do
        4.times {board.update_board(1, "\u2666")}
        expect(board.largest_component("\u2666")).to eq(4)
      end
    end

  end

  describe "#game_over?" do

    context "when board is initialized" do
      xit "returns false" do
        expect(board.game_over?).to_not be_game_over
      end
    end

    context "4 bottom left horizontal win for symbol 1" do
      xit "returns true" do
        for i in [1,2,3,4] do
          board.update_board(i, "\u26d6")
          expect(board.game_over?).to be_game_over
        end
      end
    end

    context "4 vertical win on leftmost column for symbol 1" do
      xit "returns true" do
        4.times {board.update_board(1, "\u26d6")}
        expect(board.game_over?).to be_game_over
      end
    end

    context "4 diagonal win starting on leftmost column and row for symbol 1" do

      before do
        board.update_board(1, "\u26d6")
        board.update_board(2, "\u26dD")
        board.update_board(2, "\u26d6")
        2.times {board.update_board(3, "\u26dD")}
        board.update_board(3, "\u26d6")
        3.times {board.update_board(3, "\u26dD")}
        board.update_board(3, "\u26dD")
      end

      xit "returns true" do
        expect(board.game_over?).to be_game_over
      end
    end
  end

end