require 'pry'
require './lib/node.rb'

class BinarySearchTree
  attr_reader :root_node, :node

  def initialize
    @root_node = nil
  end

  def insert(score, title)
    @node = Node.new(score, title)
    if @root_node == nil
      @root_node = @node
    end
  end

end

binding.pry
