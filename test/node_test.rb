require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node.rb'

class NodeTest < Minitest::Test

  def test_node_class_initializes_with_correct_variables
    node_1 = Node.new(61, "Jumanji")
    node_2 = Node.new(16, "Johnny English")

    assert_instance_of Node, node_1
    assert_instance_of Node, node_2
    assert_equal "Jumanji", node_1.title
    assert_equal "Johnny English", node_2.title
    assert_equal 61, node_1.score
    assert_equal 16, node_2.score
    assert_equal 0, node_1.depth
    assert_equal 0, node_2.depth
  end

  def test_node_accepts_left_and_right_nodes
    node_1 = Node.new(61, "Jumanji")

    assert_nil node_1.left_node
    assert_nil node_1.right_node

    node_2 = Node.new(42, "Adam is great")
    node_3 = Node.new(78, "Sleepless in Seattle")
    node_1.left_node = node_2
    node_1.right_node = node_3

    assert_equal node_1.left_node, node_2
    assert_equal node_1.right_node, node_3
  end

end
