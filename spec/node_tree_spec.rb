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
        board.update_board(2, "\u26dD")
      end

      subject(:node_tree) { described_class.new(36, "\u2666", board) }

      it "does not return a node with all children of value nil" do
        output = node_tree.root.children
        expect(output.compact).to_not eq([])
      end

      it "expected children are not nil values" do
        output = node_tree.root.child8.root.id
        expect(output).to eq(37)
      end

      it "two-way relation is defined betwen NodeTrees" do
        root_node = node_tree.root
        child_node = node_tree.root.child8.root
        expect(child_node.child7.root.id).to eq(root_node.id)
      end
    end

    context "children nodes edge cases" do
      let(:board) { Board.new }
  
      context "-8 invalid child" do
        before do
          3.times {board.update_board(7, "\u2666")}
        end
    
        subject(:node_tree) { described_class.new(36, "\u2666", board) }
    
        it "does not update expected child" do
          output = node_tree.root.child1
          expect(output).to be_nil
        end
      end

      context "+8 invalid child" do
        before do
          board.update_board(1, "\u2666")
        end
    
        subject(:node_tree) { described_class.new(28, "\u2666", board) }
    
        it "does not update expected child" do
          output = node_tree.root.child2
          expect(output).to be_nil
        end
      end

      context "-6 invalid child" do
        before do
          board.update_board(1, "\u2666")
        end
    
        subject(:node_tree) { described_class.new(42, "\u2666", board) }
    
        it "does not update expected child" do
          output = node_tree.root.child3
          expect(output).to be_nil
        end
      end

      context "+6 invalid child" do
        before do
          board.update_board(7, "\u2666")
        end
    
        subject(:node_tree) { described_class.new(36, "\u2666", board) }
    
        it "does not update expected child" do
          output = node_tree.root.child4
          expect(output).to be_nil
        end
      end

      context "-1 invalid child" do
        before do
          2.times {board.update_board(7, "\u2666")}
        end
    
        subject(:node_tree) { described_class.new(36, "\u2666", board) }
    
        it "does not update expected child" do
          output = node_tree.root.child7
          expect(output).to be_nil
        end
      end

      context "+1 invalid child" do
        before do
          board.update_board(1, "\u2666")
        end
    
        subject(:node_tree) { described_class.new(35, "\u2666", board) }
    
        it "does not update expected child" do
          output = node_tree.root.child8
          expect(output).to be_nil
        end
      end

    end

  end
end