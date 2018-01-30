require 'pry'
require './lib/node.rb'

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(score, title)
    depth = 0
    if @root == nil
      @root = Node.new(score, title, depth)
      root.depth
    else
      current_node = root
      positional_node(score, title, current_node, depth)
    end
  end

  def positional_node(score, title, current_node, depth)
    if score < current_node.score
      insert_or_move_left(score, title, current_node, depth)
    else
      insert_or_move_right(score, title, current_node, depth)
    end
  end

  def insert_or_move_left(score, title, current_node, depth)
    depth += 1
    if current_node.left_node == nil
      current_node.left_node = Node.new(score, title, depth)
      current_node.left_node.depth
    else
      positional_node(score, title, current_node.left_node, depth)
    end
  end

  def insert_or_move_right(score, title, current_node, depth)
    depth += 1
    if current_node.right_node == nil
      current_node.right_node = Node.new(score, title, depth)
      current_node.right_node.depth
    else
      positional_node(score, title, current_node.right_node, depth)
    end
  end

  def include?(score)
    if @root == nil
      false
    else
      current_node = @root
      if traverse_tree(score, current_node).nil?
        false
      else
        true
      end
    end
  end

  def traverse_tree(score, current_node)
    if score == current_node.score
      current_node
    elsif current_node.left_node.nil? && current_node.right_node.nil?
      nil
    elsif score < current_node.score
      traverse_tree(score, current_node.left_node)
    else
      traverse_tree(score, current_node.right_node)
    end
  end

end

# binding.pry
