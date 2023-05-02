# NodeTree that every symbol inserted on the board
# is meant to be.

class NodeTree
  attr_reader :root
  def initialize(id, symbol, board_nodes = Board.new)
    @board_nodes = board_nodes.cells
    @root = build_tree(id, symbol, @board_nodes)
  end

  def build_tree(id, symbol, board_nodes)
    return nil unless (1..42).include?(id)

    vars = [0, -8, 8, -6, 6, -7, 7, -1, 1]

    root_node = Node.new(id, symbol)

    i = 0
    while i < vars.length

      if !board_nodes[id + vars[i]].nil?
        case i
        when 1
          if !first_column?(root_node.id)
            root_node.child1 = board_nodes[id + vars[i]]
            board_nodes[id + vars[i]].root.child2 = self
          end
        when 2
          if !last_column?(root_node.id)
            root_node.child2 = board_nodes[id + vars[i]]
            board_nodes[id + vars[i]].root.child1 = self
          end
        when 3
          if !last_column?(root_node.id)
            root_node.child3 = board_nodes[id + vars[i]]
            board_nodes[id + vars[i]].root.child4 = self
          end
        when 4
          if !first_column?(root_node.id)
            root_node.child4 = board_nodes[id + vars[i]]
            board_nodes[id + vars[i]].root.child3 = self
          end
        when 5
          root_node.child5 = board_nodes[id + vars[i]]
          board_nodes[id + vars[i]].root.child6 = self
        when 6
          root_node.child6 = board_nodes[id + vars[i]]
          board_nodes[id + vars[i]].root.child5 = self
        when 7
          if !first_column?(root_node.id)
            root_node.child7 = board_nodes[id + vars[i]]
            board_nodes[id + vars[i]].root.child8 = self
          end
        when 8
          if !last_column?(root_node.id)
            root_node.child8 = board_nodes[id + vars[i]]
            board_nodes[id + vars[i]].root.child7 = self
          end
        end
      end
      i += 1
    end

    root_node
  end

  def first_column?(root_id)
    root_id % 7 == 1
  end

  def last_column?(root_id)
    root_id % 7 == 0
  end
end