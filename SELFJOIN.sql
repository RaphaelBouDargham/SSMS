--                                                          SELF JOIN
SELECT *
FROM Customers;

--                                           BUSCAR TODOS OS CLIENTES QUE MORAM NA MESMA REGIÃO/REIGÃO EM COMUM 


SELECT A.ContactName, A.Region, B.ContactName, B.Region
FROM Customers A, Customers B
WHERE A.Region = B.Region;

--                                    Encontrar (Nome e Data de Contratação) de todos os funcionários que foram contratados no mesmo ano.

SELECT *
FROM Employees;

SELECT A.FirstName Nome, B.FirstName Nome,
		A.HireDate, B.HireDate
FROM Employees A, Employees B
WHERE DATEPART(YEAR, A.HireDate) = DATEPART (YEAR, B.HireDate);

--                                      Buscar na tabela detalhe do pedido [Order Details] quais produtos tem o mesmo percentual de desconto

SELECT *
FROM [Order Details];

SELECT A.ProductID, B.ProductID, A.Discount, B.Discount
FROM [Order Details] A, [Order Details] B
WHERE A.Discount = B.Discount;

