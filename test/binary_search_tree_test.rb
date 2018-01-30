require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree.rb'

class BinarySearchTreeTest < Minitest::Test

  def setup
    @tree = BinarySearchTree.new
    @list_of_movies = {
      61 => "Bill & Ted's",
      16 => "Johnny English",
      92 => "Sharknado 3",
      50 => "Hannibal Buress: Animal Furnace",
      42 => "Star Wars",
      78 => "Star Trek",
      5 => "Die Hard"
    }
    @list_of_movies.each do |key, value|
      @tree.insert(key, value)
    end
  end

  def setup_alternate
    @tree = BinarySearchTree.new
    @list_of_movies = {
      50 => "Hannibal Buress: Animal Furnace",
      61 => "Bill & Ted's",
      16 => "Johnny English",
      92 => "Sharknado 3",
      42 => "Star Wars",
      78 => "Star Trek",
      5 => "Die Hard"
    }
    @list_of_movies.each do |key, value|
      @tree.insert(key, value)
    end
  end

  def test_new_binary_search_tree_creation
    tree = BinarySearchTree.new
    assert_instance_of BinarySearchTree, @tree
    assert_nil tree.root
  end

  def test_insert_setting_root_node
    assert_instance_of Node, @tree.root
    assert_equal 0, @tree.root.depth
    assert_equal 61, @tree.root.score
    assert_equal "Bill & Ted's", @tree.root.title
    setup_alternate
    assert_instance_of Node, @tree.root
    assert_equal 0, @tree.root.depth
    assert_equal 50, @tree.root.score
    assert_equal "Hannibal Buress: Animal Furnace", @tree.root.title
  end

  def test_attaching_node_to_root
    assert_equal 16, @tree.root.left_node.score
    assert_equal "Johnny English", @tree.root.left_node.title
    assert_equal 92, @tree.root.right_node.score
    assert_equal "Sharknado 3", @tree.root.right_node.title
    setup_alternate
    assert_equal 16, @tree.root.left_node.score
    assert_equal "Johnny English", @tree.root.left_node.title
    assert_equal 61, @tree.root.right_node.score
    assert_equal "Bill & Ted's", @tree.root.right_node.title
  end

  def test_returning_depth_of_node
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(50, "Up")
    assert_equal 1, tree.insert(61, "The Incredibles")
    assert_equal 1, tree.insert(32, "Fantasia")
    assert_equal 2, tree.insert(97, "Cars")
    assert_equal 3, tree.insert(99, "Cars 2")
  end

  def test_moving_or_inserting_right
  end

  def test_moving_or_inserting_left
  end

  def test_include_method
    assert @tree.include?(50)
    assert @tree.include?(78)
    refute @tree.include?(1)
    refute @tree.include?(33)
    setup_alternate
    assert @tree.include?(16)
    assert @tree.include?(50)
    refute @tree.include?(4)
    refute @tree.include?(62)
  end
end
