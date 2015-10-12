SELECT p.nome, f.cargo, f.salario, t.telefone, e.uf, e.logradouro 
FROM funcionario f
INNER JOIN pessoa p
ON p.id = f.id
INNER JOIN telefone t
ON t.id_pessoa = p.id
INNER JOIN endereco e
ON e.id_pessoa = p.id
WHERE f.salario IN (SELECT MAX(salario) from funcionario);