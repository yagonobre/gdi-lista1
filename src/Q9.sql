SELECT c.id, p.nome, e.cep, t.telefone
FROM cliente c
INNER JOIN pessoa p
ON p.id = c.id
INNER JOIN endereco e
ON e.id_pessoa = c.id
INNER JOIN telefone t
ON t.id_pessoa = c.id
WHERE c.id IN (SELECT id_cliente
				FROM produto
				INNER JOIN compra
				ON id = id_produto
				WHERE nome = 'Caixa de Laranja');