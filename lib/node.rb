# Node that every symbol input is meant to be.

class Node
  attr_reader :id
  attr_accessor :child1, :child2,:child3, 
                :child4, :child5,:child6, 
                :child7, :child8
                
  def initialize(number)
    @id = number
    @child1 = nil
    @child2 = nil
    @child3 = nil
    @child4 = nil
    @child5 = nil
    @child6 = nil
    @child7 = nil
    @child8 = nil
  end

  def children
    [child1, child2, child3, child4,
        child5, child6, child7, child8]
  end
end