# File:  test.rb

=begin
    Copyright (C) 2014, Guilherme Castro Diniz.

    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License as
    published by the Free Software Foundation (FSF); in version 2 of the
    license.

    This program is distributed in the hope that it can be useful,
    but WITHOUT ANY IMPLIED WARRANTY OF ADEQUAÇÂO TO ANY
    MARKET OR APPLICATION IN PARTICULAR. See the
    GNU General Public License for more details.
    <http://www.gnu.org/licenses/>
=end

require_relative "binarytree"
require "test/unit"
include BinaryTree


class TestNode < Test::Unit::TestCase
	def test_simple
		$root = Node.new()
		assert_equal(TRUE, Node.new().verify_expression("+ - 5 9 5\n"), "Expression is not valid!") #+ - 5 6 * 4 7 result  27 qtd de nos 7
		Root = $root.add()
		assert_equal(5, Node.new().size_tree(Root), "The number of nodes is wrong!")
		assert_equal(TRUE, Node.new().node_leaves(Root), "The sheets are not all numbers!")
		assert_equal(1,Node.new().result(), "The result is wrong!")
  	end
	
end
