SELECT f.cpf, id_cliente, quantidade 
FROM (SELECT id_cliente, COUNT(*) as quantidade 
		FROM xepa
 		GROUP BY id_cliente ORDER BY id_cliente) x
INNER JOIN cliente c
ON x.id_cliente = c.id
INNER JOIN fisica f
ON f.id = c.id_funcionario
WHERE x.quantidade = (SELECT MAX(qtd)
						FROM (SELECT COUNT(*) AS qtd
							FROM xepa
 							GROUP BY id_cliente)) ;