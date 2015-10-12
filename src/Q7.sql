SELECT f.id, p.nome, t.telefone
FROM FORNECEDOR f
INNER JOIN pessoa p
ON p.id = f.id
INNER JOIN telefone t
ON t.id_pessoa = f.id
WHERE f.cnpj = '64.464.805/0001-79'
UNION
SELECT c.id, p.nome, t.telefone
FROM cliente c
INNER JOIN pessoa p
ON p.id = c.id
INNER JOIN telefone t
ON t.id_pessoa = c.id
INNER JOIN fisica f
ON f.id = p.id
WHERE f.cpf = '150.928.717-50';

