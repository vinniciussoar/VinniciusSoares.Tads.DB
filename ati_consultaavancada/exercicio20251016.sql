--excA

SELECT
v.vendedor AS VENDAS,
v.produto,
c.cidade
FROM VENDAS v
INNER JOIN CLIENTES c
ON v.id_cliente = c.id_cliente;

--excB
SELECT
c.estado,
SUM(v.valor) AS total_vendas
FROM VENDAS v
INNER JOIN CLIENTES c
ON v.id_cliente = c.id_cliente
GROUP BY c.estado;

--excC
SELECT
c.cidade,
SUM(v.valor) AS total
FROM VENDAS v
INNER JOIN CLIENTES c
ON v.id_cliente = c.id_cliente
GROUP BY c.cidade
HAVING SUM(v.valor) > 2000;

--excD
SELECT
c.nome AS cliente,
v.categoria,
SUM(v.valor) AS total_categoria
FROM VENDAS v
JOIN CLIENTES c ON v.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome, v.categoria
HAVING SUM(v.valor) = (
SELECT MAX(total)
FROM (
SELECT SUM(v2.valor) AS total
FROM VENDAS v2
WHERE v2.id_cliente = c.id_cliente
GROUP BY v2.categoria
    )
);