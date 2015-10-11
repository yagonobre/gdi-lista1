SELECT DISTINCT p.nome, c.placacarro
FROM pessoa p, cliente c, xepa x
WHERE p.id = c.id
AND p.id = x.id_cliente
AND x.periodo BETWEEN '08-01-2015' AND '10-31-2015';