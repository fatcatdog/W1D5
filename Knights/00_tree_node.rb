class PolyTreeNode

  require 'byebug'
  attr_accessor :parent, :children, :value

  def initialize(new_node)
    @parent = nil
    @children = []
    @value= new_node
  end

  def parent
    @parent
  end

  def parent=(parent_node)
    # debugger
    @parent.children.delete(self) unless @parent.nil?
    @parent = parent_node
    return nil if parent_node.nil?

    parent_node.children << self unless parent_node.children.include?(self)
    # self.add_child

  end

  def add_child(child)
    @children.push(child)
    # @child.parent
    # self.children.push(self) unless @parent.children.include?(self)
    child.parent = self
  end

  def remove_child(child)
    raise "Exception" unless @children.include?(child)
    child.parent = nil
    @children.delete(child)
  end

  # def raise_error
  #   raise "ERROR"
  # end

  def children
    @children
  end

  def value
    @value
  end

  def dfs(target)
    if self.value == target
      return self
    else
      @children.each do |child|
        blah = child.dfs(target)
        return blah unless blah.nil?
      end
    end
    nil
  end

    # stack = [self]
    # return self if self.value == target
    #
    # until stack.empty?
    #   el = stack.pop
    #   if el.value == target
    #     return el
    #   else
    #     stack.push(el.children)
    #   end
    # end

  def bfs(target)
    queue = [self]
    # debugger
    until queue.empty?
      debugger
      el = queue.shift
      return el if el.value == target
      queue +=(el.children)
    end
    nil
  end
  # 
  # def transfer(knight)
  #   @knight = knight
  # end
  #
  # def chess_bfs(target)
  #   queue = [self]
  #   until queue.empty?
  #     el = queue.shift
  #     return el if el.value == target
  #     history << el
  #     el_children = el.produce_children
  #     queue += (el.children)
  #   end
  #   nil
  # end



end
