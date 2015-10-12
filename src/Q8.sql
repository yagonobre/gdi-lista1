SELECT quantidade 
FROM produto p
INNER JOIN fornece f
ON f.id_produto = p.id
INNER JOIN endereco e
ON e.id_pessoa = f.id_fornecedor
INNER JOIN comerciante c
ON c.id = f.id_comerciante
WHERE e.uf = 'PR'
AND c.credito > 10000;
