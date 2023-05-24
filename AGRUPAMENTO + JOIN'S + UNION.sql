--___________________________________________________________________09.03.23______________________________________________________________
--Quais nomes no sistema  tem ocorrência maior que 10 vezes?

SELECT *
FROM Person.Person;

SELECT FirstName, COUNT(FirstName) AS Contagem
FROM Person.Person
GROUP BY FirstName
HAVING COUNT(FirstName) > '20';

-- Quais produtos que no total de vendas estão entre 162k a 500k?

SELECT TOP 10 *
FROM Sales.SalesOrderDetail;

SELECT ProductID, SUM(LineTotal) AS Total
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) BETWEEN '162000' AND '500000'

--Quais nomes no sistema tem ocorrência maior que 10 vezes, porém somente onde o título é 'Mr.'

SELECT FirstName, COUNT(FirstName) AS Contagem
FROM Person.Person
WHERE Title = 'MR.'
GROUP BY FirstName
HAVING COUNT(FirstName) > '10';

--Estamos querendo identificar as provinccias(StateProvinceID) com maior número de cadastros no nosso sistema,
--então é preciso encontrar quais províncias (stateProvinceID) estão registradas no banco de dados mais que 1000 vezes

SELECT *
FROM Person.Address;

SELECT StateProvinceID, COUNT(StateProvinceID) AS Contagem
FROM Person.Address
GROUP BY StateProvinceID
HAVING COUNT(StateProvinceID) > '1000';

-- Quais produtos (ProductID) não estão trazendo em média no mínimo 1 milhão em total de vendas(LineTotal)

SELECT *
FROM Sales.SalesOrderDetail;

SELECT ProductID, AVG(LineTotal) AS Media
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(LineTotal) < 10000000;

--___________________________________________________________INNER JOOOIN___________________________________________________________________

SELECT *
FROM Person.Person;

SELECT *
FROM Person.EmailAddress;

--Buscar BusinessEntityID, FirstName, LastName, E-mailAddress.

SELECT P.BusinessEntityID AS ID,
		P.FirstName Nome,
		P.LastName Sobrenome,
		Pe.EmailAddress "E-mail",
		Pe.BusinessEntityID ID
FROM Person.Person AS P
INNER JOIN Person.EmailAddress PE
ON Pe.BusinessEntityID = P.BusinessEntityID;

--Buscar os nomes dos produtos e as informações de suas subcategorias
--Preço do Produto (ListPrice), nome do produto e nome da subcategoria

SELECT *
FROM Production.Product;

SELECT *
FROM Production.ProductSubcategory;

SELECT PP.ListPrice AS Preço, PP.Name "Nome do Produto", PS.Name "Nome da Subcategoria"
FROM Production.Product PP
INNER JOIN Production.ProductSubcategory PS
ON PS.ProductCategoryID = PP.ProductSubcategoryID;

--Desafio > BusinessEntityID, Name, PhoneNameTypeID, PhoneNumber

SELECT *
FROM Person.PhoneNumberType;

SELECT TOP 10 *
FROM Person.PersonPhone;

SELECT PP.BusinessEntityID AS ID, PT.Name Nome, PT.PhoneNumberTypeID, PP.PhoneNumber NúmeroTelefone
FROM Person.PhoneNumberType AS PT
INNER JOIN Person.PersonPhone PP
ON PT.PhoneNumberTypeID = PP.PhoneNumberTypeID;

SELECT TOP 10 *
FROM Person.StateProvince;

SELECT TOP 10 *
FROM Person.Address;

--Consultar AddressID, City, StateProvidenceID, Nome do Estado

SELECT TOP 10 PA.AddressID AS "ID Endereço", PA.City Cidade, PA.StateProvinceID IDPersonAddress, SP.StateProvinceID IDPersonStateProvince, SP.Name
FROM Person.Address PA
INNER JOIN Person.StateProvince SP
ON SP.StateProvinceID = PA.StateProvinceID;

--Quais pessoas tem um cartão de crédito registrado.

SELECT TOP 10 *
FROM Person.Person;

SELECT TOP 10 *
FROM Sales.PersonCreditCard;

SELECT *
FROM Person.Person AS P
LEFT JOIN Sales.PersonCreditCard PC
ON P.BusinessEntityID = PC.BusinessEntityID;

--INNER JOIN: 19.118 Pessoas com o Cartão de crédito registrado.
--LEFT JOIN: 19972 Linhas

--Quantas pessoas não tem o cartão de crédito registrado?

-- ====================================================  LEFT JOOOIN  =========================================================

SELECT *
FROM Person.Person AS P
LEFT JOIN Sales.PersonCreditCard PC
ON PC.BusinessEntityID = P.BusinessEntityID
WHERE PC.BusinessEntityID is NULL;

--854 Pessoas.

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++      UNION       ++++++++++++++++++++++++++++++++++++++++++++++++++++

SELECT FirstName, LastName
FROM Person.Person
WHERE FirstName LIKE 'A%'
UNION
SELECT FirstName, LastName
FROM Person.Person
WHERE LastName LIKE '%A';