require_relative '00_tree_node.rb'

class KnightPathFinder
  attr_accessor :grid, :starting_pos, :history, :current_node

  MOVES = [[-2,-1], [-2,1], [-1,-2], [-1,2], [1,-2], [1,2], [2,-1], [2,1]]
  def initialize(starting_pos)
    @history = []
    # @grid = Array.new {Array.new(8)}
    @starting_node = PolyTreeNode.new(starting_pos)
    @current_node = @starting_pos
  end

  # optional method to populate children relates every pair of tile to a history instance
  # def populate_children
  #   queue = [starting_node]
  #   until history.length == 64
  #     @starting_node.children
  #   end
  # end

  def find_path(ending_pos)
    chess_bfs(ending_pos)
    # x, y = @current_node.value
    # eligible_moves = MOVES.select {|i, j| eligible_space([(x + i), (y + j)]) }
    # eligible_moves.each do |shift|
    #   temp = PolyTreeNode.new([(x + shift[0]), (y + shift[1])])
    #   @current_node.add_child(temp)
    # end
  end

  def produce_children(node)
    x, y = node.value
    eligible_moves = MOVES.select {|i, j| eligible_space([(x + i), (y + j)]) }
    eligible_moves.each do |shift|
      temp = PolyTreeNode.new([(x + shift[0]), (y + shift[1])])
      node.add_child(temp)
    end
  end

  def eligible_space(coordinates)
    x,y = coordinates
    if ((x >= 0) && (y >= 0) && (x <= 7) && (y <= 7)) &&        !@history.include?([x,y])
      return true
    else
      return false
    end
  end

  def chess_bfs(target)
    # puts(@history)
    queue = [@starting_node]
    count = 0
    until queue.empty?
      puts(@history)
      el = queue.shift
      return el if el.value == target
      history << el.value
      debugger
      el_children = produce_children(el)
      queue += (el.children)
      count += 1
    end
    count
  end

end
