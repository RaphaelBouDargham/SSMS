--                 FUNÇÕES MATEMÁTICAS

SELECT *
FROM Sales.SalesOrderDetail;

SELECT *
FROM Sales.SalesOrderHeader

SELECT SubTotal, ROUND(SubTotal, 2) AS Arredondamento
FROM Sales.SalesOrderHeader