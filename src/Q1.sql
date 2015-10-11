SELECT cep 
FROM pessoa p, endereco e 
WHERE p.id = e.id_pessoa 
AND p.nome LIKE '%A%';