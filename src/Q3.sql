SELECT c.id, t.telefone FROM comerciante c
INNER JOIN lote l
ON c.id = l.id_comerciante
INNER JOIN telefone t
ON t.id_pessoa = c.id
WHERE l.tempo = (SELECT MAX(tempo) 
					FROM lote); 