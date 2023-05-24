--  =======================================   SUBQUERIES 11/03/23   =========================================

--Montar um relatório de todos os produtos cadastrados que tem o preço acima da média

SELECT AVG(ListPrice)
FROM Production.Product;

SELECT *
FROM Production.Product
WHERE ListPrice > (SELECT AVG(ListPrice) FROM Production.Product);

--Saber o nome dos funcionários que tem o cargo de 'Desing Engineer'

SELECT *
FROM Person.Person

SELECT *
FROM HumanResources.Employee
WHERE JobTitle = 'Design Engineer';

SELECT FirstName
FROM Person.Person
WHERE BusinessEntityID IN (SELECT BusinessEntityID FROM HumanResources.Employee WHERE JobTitle = 'Design Engineer');

SELECT P.FirstName, HE.JobTitle
FROM Person.Person P JOIN HumanResources.Employee HE
ON P.BusinessEntityID = HE.BusinessEntityID
WHERE HE.JobTitle = 'Design Engineer';

--Encontrar todos os endereços que estão no estado de 'Alberta', pode trazer todas informações.

SELECT *
FROM Person.Address;

SELECT *
FROM Person.StateProvince;

SELECT PA.*, PS.*
FROM Person.Address PA JOIN Person.StateProvince PS
ON PS.StateProvinceID = PA.StateProvinceID
WHERE PS.Name = 'Alberta';

SELECT *
FROM Person.Address
WHERE StateProvinceID IN (SELECT StateProvinceID FROM Person.StateProvince WHERE Name = 'Alberta');

--=========================================== 12/03/23 DATEPAAAAAAART ====================================================

SELECT SalesOrderID, DATEPART(month, OrderDate) Mês
FROM Sales.SalesOrderHeader;

SELECT *
FROM Sales.SalesOrderHeader;

SELECT AVG(TotalDue) as Media, DATEPART(MONTH, OrderDate) as Mes
FROM Sales.SalesOrderHeader
GROUP BY DATEPART(MONTH, OrderDate)
ORDER BY Mes;

--Encontrar uma tabela que tenha informação de data e extrair mês e ano da coluna usando o DATEPART.

SELECT *
FROM Sales.SalesOrderDetail;

SELECT DATEPART(MONTH, ModifiedDate) Mes,
		DATEPART(YEAR, ModifiedDate) Ano
FROM Sales.SalesOrderDetail;

--                                    MANIPULAÇÃO DE STRING 

SELECT CONCAT(FirstName,' ',LastName) "Nome e Sobrenome"
FROM Person.Person;

SELECT UPPER(FirstName), LOWER(LastName)
FROM Person.Person

SELECT LEN(FirstName) Contagem, FirstName
FROM Person.Person;

SELECT FirstName, SUBSTRING(FirstName,1,3)
FROM Person.Person;

SELECT ProductNumber, REPLACE(ProductNumber, '-', '#') AS Substituição
FROM Production.Product;

--EXERCÍCIOS - REPETICÇÕES

SELECT *
FROM Person.Address

SELECT CONCAT(AddressLine1,' ', City) "Endereço e Cidade"
FROM Person.Address

SELECT UPPER(City)
FROM Person.Address

SELECT LEN(City), City
FROM Person.Address;

SELECT SUBSTRING(City,1,2) Extração, City
FROM Person.Address

SELECT *
FROM Person.Password

SELECT REPLACE(PasswordSalt, '=', '-')
FROM Person.Password