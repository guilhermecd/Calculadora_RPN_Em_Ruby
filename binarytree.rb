=begin
  Copyright (C) 2014, Guilherme Castro Diniz.

   Este programa é um software livre; você pode redistribui-lo e/ou
   modifica-lo dentro dos termos da Licença Pública Geral GNU como
   publicada pela Fundação do Software Livre (FSF); na versão 2 da
   Licença.

   Este programa é distribuído na esperança que possa ser  útil,
   mas SEM NENHUMA GARANTIA  implícita de ADEQUAÇÂO a qualquer
   MERCADO ou APLICAÇÃO EM PARTICULAR. Veja a
   Licença Pública Geral GNU para maiores detalhes.
   <http://www.gnu.org/licenses/>
=end

module BinaryTree
	class Node
		attr_accessor :left, :right, :data
		$expressao = Array.new
		$orig = Array.new
		$i = 0

		#inicializa as viriáveis
		def initialize left = nil, right = nil, data = nil
			@data = data
  			@left = left 
   			@right = right
		end

		#Monta a árvore pre_fixa
		def add
			t = $expressao[$i]
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
		
		#imprime todos o nós da arvore
		def show (node) 
			if !node.nil?
				puts "(#{node.data})"
				show (node.left)
				show (node.right)
			end
		end

		#retorna a quantidade nós que tem na arvore
		def size_tree (node)
			if node.left == nil && node.right == nil
				return 1
			else
				return 1 + size_tree(node.left) + size_tree(node.right)
			end
		end
		
		#retorna o resultado da expressao
		def result
			i = 0
			b = ""
			while i < $orig.length
				b.concat($orig[i])
				i = i + 1
			end
			print "Expressao montada: "
			puts b
			k = eval(b)
		return k
		end

		#verifica se as folhas são todas numeros e monta a expressao original
		def node_leaves(node)
			if $invalid == FALSE
				return $invalid
			end
			if node.left == nil && node.right == nil
				$orig << node.data
				num = node.data.to_i
				if num == 0 && node.data
					return FALSE
				end 
			else
				node_leaves(node.left)
				$orig << node.data
				node_leaves(node.right)

			end
		return TRUE
		end


		# verifica se a expressao é valida
		def verifica_expressao(expressao)
			i = 0
			qtd_simb = 0 
			qtd_num = 0
			digito = expressao[0].to_i

			if digito != 0 || expressao[0] == "0"
				$invalid = FALSE
				return FALSE
			end 

			while i < expressao.length + (-1)
				digito = expressao[i].to_i
				if digito == 0 && expressao[i] == '+' ||expressao[i] == "-" || expressao[i] == "*" || expressao[i] == "/" || expressao[i] == " " 
					if expressao[i] != " "
						$expressao << expressao[i]
						qtd_simb = qtd_simb + 1 
					end
				elsif digito >= 1 || digito <= 9 || expressao[i] == "0"
					$expressao << expressao[i]
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
