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

require './binarytree'
include BinaryTree
	
	@raiz = Node.new()
	$exp = []
	print "Digite uma expressao: "
	expressao = gets

	k = @raiz.verifica_expressao(expressao)
	print "A expressao é valida: "
	puts k
	raiz = @raiz.add
	puts "os nós da arvore são:"
	@raiz.show(raiz)
	qtd_node = @raiz.size_tree(raiz)
	print "Quantidade de nós: "
	puts qtd_node
	nos_folhas = @raiz.node_leaves(raiz)
	print "As folhas estão corretas:" 
	puts nos_folhas
	resultado = @raiz.result
	print "Resultado: " 
	puts resultado
	
