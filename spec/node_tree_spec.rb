require_relative "../lib/node"
require_relative "../lib/board"
require_relative "../lib/node_tree"

describe NodeTree do
  context "#build_tree" do

    context "when given an empty board of nodes" do
      subject(:node_tree) { described_class.new(36) }

      it "returns a node with children of value nil" do
        output = node_tree.root.children
        expect(output.compact).to eq([])
      end
    end

    context "when given a non-empty board of nodes" do
      let(:board) { Board.new(true) }

      before do
        board.update_board(2, NodeTree.new(37))
      end

      subject(:node_tree) { described_class.new(36, board) }

      it "does not return a node with all children of value nil" do
        output = node_tree.root.children
        expect(output.compact).to_not eq([])
      end

      it "expected children are not nil values" do
        output = node_tree.root.child7.root.id
        expect(output).to eq(37)
      end
    end

  end
end