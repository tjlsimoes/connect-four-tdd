require_relative "../lib/node"
require_relative "../lib/board"
require_relative "../lib/node_tree"

describe NodeTree do
  context "#build_tree" do

    context "when given an empty board of nodes" do
      subject(:node_tree) { described_class.new(36, "\u2666") }

      it "returns a node with children of value nil" do
        output = node_tree.root.children
        expect(output.compact).to eq([])
      end
    end

    context "when given a non-empty board of to be children nodes" do
      let(:board) { Board.new }

      before do
        board.update_board(2, NodeTree.new(37, "\u26dD"))
      end

      subject(:node_tree) { described_class.new(36, "\u2666", board) }

      it "does not return a node with all children of value nil" do
        output = node_tree.root.children
        expect(output.compact).to_not eq([])
      end

      it "expected children are not nil values" do
        output = node_tree.root.child7.root.id
        expect(output).to eq(37)
      end

      it "two-way relation is defined betwen Nodes" do
        root_node = node_tree.root
        child_node = node_tree.root.child7.root
        expect(child_node.child8.id).to eq(root_node.id)
      end
    end

  end
end