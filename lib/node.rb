require 'pry'

class Node
  attr_reader :score, :title
  attr_accessor :left_node, :right_node, :depth

  def initialize(score, title, depth=0)
    @score = score
    @title = title
    @left_node = nil
    @right_node = nil
    @depth = depth
  end
end
