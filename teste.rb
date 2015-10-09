# File:  test.rb

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

require_relative "binarytree"
require "test/unit"
include BinaryTree


class TestNode < Test::Unit::TestCase
	def test_simple
		$root = Node.new()
		assert_equal(TRUE, Node.new().verifica_expressao("+ - 5 9 5\n"), "Expressao não é valida") #+ - 5 6 * 4 7 resultado  27 qtd de nos 7
		raiz = $root.add()
		assert_equal(5, Node.new().size_tree(raiz), "A quantidade de nós está errada")
		assert_equal(TRUE, Node.new().node_leaves(raiz), "As folhas não são todas números")
		assert_equal(1,Node.new().result(), "O resultado está errado")
  	end
	
end
