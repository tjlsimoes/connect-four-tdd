# NodeTree that every symbol inserted on the board
# is meant to be.

class NodeTree
  attr_reader :root
  
  def initialize(id, board_nodes = Board.new(true))
    @board_nodes = board_nodes.cells
    @root = build_tree(id, @board_nodes)
  end

  def build_tree(id, board_nodes)
    return nil if !(1..42).include?(id)

    vars = [-8, 8, -6, 6, -7, 7, -1, 1]

    root_node = Node.new(id)

    i = 0
    while i < vars.length
      case i
      when 1
        root_node.child1 = board_nodes[id + vars[i]]
      when 2
        root_node.child2 = board_nodes[id + vars[i]]
      when 3
        root_node.child3 = board_nodes[id + vars[i]]
      when 4
        root_node.child4 = board_nodes[id + vars[i]]
      when 5
        root_node.child5 = board_nodes[id + vars[i]]
      when 6
        root_node.child6 = board_nodes[id + vars[i]]
      when 7
        root_node.child7 = board_nodes[id + vars[i]]
      when 8
        root_node.child8 = board_nodes[id + vars[i]]
      end
      i += 1
    end

    root_node
  end
end