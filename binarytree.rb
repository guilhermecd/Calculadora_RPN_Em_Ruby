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

module BinaryTree
	class Node
		attr_accessor :left, :right, :data
		$expression = Array.new
		$src = Array.new
		$i = 0

		#initialize viriable
		def initialize left = nil, right = nil, data = nil
			@data = data
  			@left = left 
   			@right = right
		end

		#create tree pre-fixa
		def add
			t = $expression[$i]
			$i = $i + 1
			node = Node.new()
			node.data = t
			if t == "+" || t == "-" || t == "*" || t == "/" 
				node.left = add
				node.right = add
			else
				node.left = nil
				node.right = nil
			end
    			return node;
		end
		
		#print all node
		def show (node) 
			if !node.nil?
				puts "(#{node.data})"
				show (node.left)
				show (node.right)
			end
		end

		#Returns the number of nodes of the tree
		def size_tree (node)
			if node.left == nil && node.right == nil
				return 1
			else
				return 1 + size_tree(node.left) + size_tree(node.right)
			end
		end
		
		#retorna the result od expression
		def result
			i = 0
			b = ""
			while i < $src.length
				b.concat($src[i])
				i = i + 1
			end
			print "Expression created: "
			puts b
			k = eval(b)
		return k
		end

		#Checks whether the sheets are all numerals and assembles the srcinal expression
		def node_leaves(node)
			if $invalid == FALSE
				return $invalid
			end
			if node.left == nil && node.right == nil
				$src << node.data
				num = node.data.to_i
				if num == 0 && node.data
					return FALSE
				end 
			else
				node_leaves(node.left)
				$src << node.data
				node_leaves(node.right)

			end
		return TRUE
		end


		# Checks the expression is valid
		def verify_expression(expression)
			i = 0
			qtd_simb = 0 
			qtd_num = 0
			digit = expression[0].to_i

			if digit != 0 || expression[0] == "0"
				$invalid = FALSE
				return FALSE
			end 

			while i < expression.length + (-1)
				digit = expression[i].to_i
				if digit == 0 && expression[i] == '+' ||expression[i] == "-" || expression[i] == "*" || expression[i] == "/" || expression[i] == " " 
					if expression[i] != " "
						$expression << expression[i]
						qtd_simb = qtd_simb + 1 
					end
				elsif digit >= 1 || digit <= 9 || expression[i] == "0"
					$expression << expression[i]
					qtd_num = qtd_num +1
				end 
			i = i + 1
			end

			if qtd_num == qtd_simb + 1
				$invalid = TRUE
				return TRUE
			else
				$invalid = FALSE
				return FALSE
			end
		end
	end
end
