SELECT f.id_fornecedor, ps.nome, e.logradouro
FROM produto p
INNER JOIN fornece f
ON p.id = f.id_produto
INNER JOIN pessoa ps
ON ps.id = f.id_fornecedor
INNER JOIN endereco e
ON e.id_pessoa = f.id_fornecedor
WHERE p.validade = (SELECT MAX(validade) FROM produto)