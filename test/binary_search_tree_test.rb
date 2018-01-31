require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree'

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
      49 => "Hannibal Buress: Animal Furnace",
      60 => "Bill & Ted's",
      17 => "Johnny English",
      93 => "Sharknado 3",
      43 => "Star Wars",
      79 => "Star Trek",
      6 => "Die Hard"
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
    assert_equal 49, @tree.root.score
    assert_equal "Hannibal Buress: Animal Furnace", @tree.root.title
  end

  def test_attaching_node_to_root
    assert_equal 16, @tree.root.left_node.score
    assert_equal "Johnny English", @tree.root.left_node.title
    assert_equal 92, @tree.root.right_node.score
    assert_equal "Sharknado 3", @tree.root.right_node.title

    setup_alternate

    assert_equal 17, @tree.root.left_node.score
    assert_equal "Johnny English", @tree.root.left_node.title
    assert_equal 60, @tree.root.right_node.score
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

  def test_include
    assert @tree.include?(50)
    assert @tree.include?(78)
    refute @tree.include?(1)
    refute @tree.include?(33)

    setup_alternate

    assert @tree.include?(17)
    assert @tree.include?(49)
    refute @tree.include?(4)
    refute @tree.include?(62)
  end

  def test_depth_of
    assert_equal 0, @tree.depth_of(61)
    assert_equal 1, @tree.depth_of(16)
    assert_equal 2, @tree.depth_of(5)
    assert_nil @tree.depth_of(4)

    setup_alternate

    assert_equal 0, @tree.depth_of(49)
    assert_equal 1, @tree.depth_of(60)
    assert_equal 2, @tree.depth_of(93)
    assert_nil @tree.depth_of(4)
  end

  def test_max
    assert_equal ({"Sharknado 3"=>92}), @tree.max

    setup_alternate

    assert_equal ({"Sharknado 3"=>93}), @tree.max
  end

  def test_min
    assert_equal ({"Die Hard"=>5}), @tree.min

    setup_alternate

    assert_equal ({"Die Hard"=>6}), @tree.min
  end

  def test_sort
    assert_equal ({"Die Hard"=>5}), @tree.sort[0]
    assert_equal ({"Sharknado 3"=>92}), @tree.sort[-1]
    assert_equal 7, @tree.sort.length

    setup_alternate

    assert_equal ({"Star Wars"=>43}), @tree.sort[2]
    assert_equal ({"Hannibal Buress: Animal Furnace"=>49}), @tree.sort[3]
    assert_equal 7, @tree.sort.length
  end

  def test_loading_via_txt_file
    tree = BinarySearchTree.new
    tree.load("./lib/movies.txt")

    assert_equal 71, tree.root.score
    assert_equal "Hannibal Buress: Animal Furnace", tree.root.title
    assert_equal 80, tree.root.right_node.score
    assert_equal ({"Cruel Intentions" => 0}), tree.min
    assert_equal ({"The Little Engine That Could" => 100}), tree.max
  end

  def test_health_method
    assert_equal [[61, 7, 100]], @tree.health(0)
    assert_equal [[16, 4, 57], [92, 2, 28]], @tree.health(1)
    assert_equal [[5, 1, 14], [50, 2, 28], [78, 1, 14]], @tree.health(2)
    assert_equal [[42, 1, 14]], @tree.health(3)

    setup_alternate

    assert_equal [[49, 7, 100]], @tree.health(0)
    assert_equal [[17, 3, 42], [60, 3, 42]], @tree.health(1)
    assert_equal [[6, 1, 14], [43, 1, 14], [93, 2, 28]], @tree.health(2)
  end

end
