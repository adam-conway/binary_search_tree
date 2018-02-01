require 'pry'
require './lib/node'

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

  def depth_of(score)
    if include?(score)
      current_node = @root
      current_node = traverse_tree(score, current_node)
      current_node.depth
    else
      nil
    end
  end

  def max(current_node = @root)
    if current_node.right_node.nil?
      {current_node.title => current_node.score}
    else
      max(current_node.right_node)
    end
  end

  def min(current_node = @root)
    if current_node.left_node.nil?
      {current_node.title => current_node.score}
    else
      min(current_node.left_node)
    end
  end

  def sort(current_node = @root, array = [])
    if !current_node.left_node.nil?
      sort(current_node.left_node, array)
    end
    array << {current_node.title => current_node.score}
    if !current_node.right_node.nil?
      sort(current_node.right_node, array)
    end
    array
  end

  def load(filename)
    insertions = 0
    File.open(filename).each do |line|
      line = line.strip
      insert(line.split(", ")[0].to_i, line.split(", ")[1])
      insertions += 1
    end
    insertions
  end

  def health(depth, current_node = @root, array = [])
    if current_node.depth == depth
      array << build_health_array(current_node)
    end
    if !current_node.left_node.nil?
      health(depth, current_node.left_node, array)
    end
    if !current_node.right_node.nil?
      health(depth, current_node.right_node, array)
    end
    array
  end

  def number_nodes(current_node)
    sort(current_node).length
  end

  def percent_nodes(current_node)
    current_nodes = sort(current_node).length
    total_nodes = sort(@root).length
    percent = current_nodes.to_f / total_nodes.to_f
    (percent * 100).to_i
  end

  def build_health_array(current_node)
    [current_node.score,
     number_nodes(current_node),
     percent_nodes(current_node)]
  end

  def leaves(current_node = @root, barren = 0)
    barren += leaves(current_node.left_node) if !current_node.left_node.nil?
    barren += leaves(current_node.right_node) if !current_node.right_node.nil?
    barren += 1 if no_children_nodes(current_node)
    barren
  end

  def no_children_nodes(current_node)
    true if current_node.left_node.nil? && current_node.right_node.nil?
  end

  def height(depth = 0)
    if health(depth) == []
      depth - 1
    else
      height(depth + 1)
    end
  end

end
