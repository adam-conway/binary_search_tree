require 'pry'

class Node

  attr_reader :movie_details
  attr_accessor :left_node, :right_node

  def initialize(score, title)
    @movie_details = {score => title}
    @left_node = nil
    @right_node = nil
  end

end

# binding.pry
