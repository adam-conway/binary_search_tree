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

    # assert_equal @tree.current_node, @tree.root
  end

  def test_inserting_depth_1
    skip
    assert_equal @tree.root.movie_details.keys[0], 61
    assert_equal @tree.root.movie_details.values[0], "Bill & Ted's"
    assert_equal @tree.root.depth, 0
    assert_equal @tree.current_node.movie_details.keys[0], 16
    assert_equal tree.current_node.movie_details.values[0], "Johnny English"
    assert_equal 1, tree.current_node.depth
    assert_equal tree.current_node.movie_details.keys[0], 92
    assert_equal tree.current_node.movie_details.values[0], "Sharknado 3"
  end

  def test_inserting_depth_1
    skip
    assert_equal tree.root, tree.current_node
    assert_equal tree.root.movie_details.keys[0], 61
    assert_equal tree.root.movie_details.values[0], "Bill & Ted's"
    tree.insert(16, "Johnny English")
    assert_equal 1, tree.current_node.depth
    assert_equal tree.current_node.movie_details.keys[0], 16
    assert_equal tree.current_node.movie_details.values[0], "Johnny English"
    tree.insert(92, "Sharknado 3")
    assert_equal 1, tree.current_node.depth
    assert_equal tree.current_node.movie_details.keys[0], 92
    assert_equal tree.current_node.movie_details.values[0], "Sharknado 3"
  end

  def test_moving_or_inserting_left
  end

  def test_moving_or_inserting_right
  end
end
