require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree.rb'

class BinarySearchTreeTest < Minitest::Test

  def test_new_binary_search_tree_creation
    tree = BinarySearchTree.new
    assert_instance_of BinarySearchTree, tree
    assert_nil tree.root_node
  end

  def test_inserting_nodes_in_tree
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_instance_of Node, tree.node
    assert tree.root_node, tree.node
  end
end
