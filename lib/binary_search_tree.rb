require 'pry'
require './lib/node.rb'

class BinarySearchTree
  attr_reader :root, :depth, :current_node

  def initialize
    @root = nil
    @current_node = nil
    @depth = 0
  end

  def insert(score, title)
    if @root == nil
      @root = Node.new(score, title)
      @current_node = root
      depth
    else
      positional_node(score, title, current_node)
    end
  end

  def positional_node(score, title, current_node)
    if score < current_node.movie_details.keys[0]
      insert_or_move_left(score, title, current_node)
    else
      insert_or_move_right(score, title, current_node)
    end
  end

  def insert_or_move_left(score, title, current_node)
    if current_node.left_node == nil
      current_node.left_node = Node.new(score, title)
    else
      positional_node(score, title, current_node.left_node)
    end
  end

  def insert_or_move_right(score, title, current_node)
    if current_node.right_node == nil
      current_node.right_node = Node.new(score, title)
    else
      positional_node(score, title, current_node.right_node)
    end
  end

end

binding.pry
