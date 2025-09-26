SELECT VENDEDOR,
COUNT (VENDEDOR) AS qnt_vendas,
SUM (VALOR) AS qnt_total
from vendas
GROUP BY Vendedor
ORDER BY qnt_total DESc;
