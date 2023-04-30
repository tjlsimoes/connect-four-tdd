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
          root_node.child1 = board_nodes[id + vars[i]]
          board_nodes[id + vars[i]].root.child2 = root_node
        when 2
          root_node.child2 = board_nodes[id + vars[i]]
          board_nodes[id + vars[i]].root.child1 = root_node
        when 3
          root_node.child3 = board_nodes[id + vars[i]]
          board_nodes[id + vars[i]].root.child4 = root_node
        when 4
          root_node.child4 = board_nodes[id + vars[i]]
          board_nodes[id + vars[i]].root.child3 = root_node
        when 5
          root_node.child5 = board_nodes[id + vars[i]]
          board_nodes[id + vars[i]].root.child6 = root_node
        when 6
          root_node.child6 = board_nodes[id + vars[i]]
          board_nodes[id + vars[i]].root.child5 = root_node
        when 7
          root_node.child7 = board_nodes[id + vars[i]]
          board_nodes[id + vars[i]].root.child8 = root_node
        when 8
          root_node.child8 = board_nodes[id + vars[i]]
          board_nodes[id + vars[i]].root.child7 = root_node
        end
      end
      i += 1
    end

    root_node
  end
end