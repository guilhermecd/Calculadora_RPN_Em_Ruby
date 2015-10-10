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

require './binarytree'
include BinaryTree
	
	@root = Node.new()
	$exp = []
	print "Write the  expression: "
	expression = gets

	k = @root.verify_expression(expression)
	print "The expression is valid: "
	puts k
	root = @root.add
	puts "The node tree are:"
	@root.show(root)
	qtd_node = @root.size_tree(root)
	print "Quantity the node: "
	puts qtd_node
	nodeLeaves = @root.node_leaves(root)
	print "The leaves are correct:" 
	puts nodeLeaves
	Result = @root.result
	print "Result: " 
	puts Result
	
