--___________________________________________________________________09.03.23______________________________________________________________
--Quais nomes no sistema  tem ocorr�ncia maior que 10 vezes?

SELECT *
FROM Person.Person;

SELECT FirstName, COUNT(FirstName) AS Contagem
FROM Person.Person
GROUP BY FirstName
HAVING COUNT(FirstName) > '20';

-- Quais produtos que no total de vendas est�o entre 162k a 500k?

SELECT TOP 10 *
FROM Sales.SalesOrderDetail;

SELECT ProductID, SUM(LineTotal) AS Total
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) BETWEEN '162000' AND '500000'

--Quais nomes no sistema tem ocorr�ncia maior que 10 vezes, por�m somente onde o t�tulo � 'Mr.'

SELECT FirstName, COUNT(FirstName) AS Contagem
FROM Person.Person
WHERE Title = 'MR.'
GROUP BY FirstName
HAVING COUNT(FirstName) > '10';

--Estamos querendo identificar as provinccias(StateProvinceID) com maior n�mero de cadastros no nosso sistema,
--ent�o � preciso encontrar quais prov�ncias (stateProvinceID) est�o registradas no banco de dados mais que 1000 vezes

SELECT *
FROM Person.Address;

SELECT StateProvinceID, COUNT(StateProvinceID) AS Contagem
FROM Person.Address
GROUP BY StateProvinceID
HAVING COUNT(StateProvinceID) > '1000';

-- Quais produtos (ProductID) n�o est�o trazendo em m�dia no m�nimo 1 milh�o em total de vendas(LineTotal)

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

--Buscar os nomes dos produtos e as informa��es de suas subcategorias
--Pre�o do Produto (ListPrice), nome do produto e nome da subcategoria

SELECT *
FROM Production.Product;

SELECT *
FROM Production.ProductSubcategory;

SELECT PP.ListPrice AS Pre�o, PP.Name "Nome do Produto", PS.Name "Nome da Subcategoria"
FROM Production.Product PP
INNER JOIN Production.ProductSubcategory PS
ON PS.ProductCategoryID = PP.ProductSubcategoryID;

--Desafio > BusinessEntityID, Name, PhoneNameTypeID, PhoneNumber

SELECT *
FROM Person.PhoneNumberType;

SELECT TOP 10 *
FROM Person.PersonPhone;

SELECT PP.BusinessEntityID AS ID, PT.Name Nome, PT.PhoneNumberTypeID, PP.PhoneNumber N�meroTelefone
FROM Person.PhoneNumberType AS PT
INNER JOIN Person.PersonPhone PP
ON PT.PhoneNumberTypeID = PP.PhoneNumberTypeID;

SELECT TOP 10 *
FROM Person.StateProvince;

SELECT TOP 10 *
FROM Person.Address;

--Consultar AddressID, City, StateProvidenceID, Nome do Estado

SELECT TOP 10 PA.AddressID AS "ID Endere�o", PA.City Cidade, PA.StateProvinceID IDPersonAddress, SP.StateProvinceID IDPersonStateProvince, SP.Name
FROM Person.Address PA
INNER JOIN Person.StateProvince SP
ON SP.StateProvinceID = PA.StateProvinceID;

--Quais pessoas tem um cart�o de cr�dito registrado.

SELECT TOP 10 *
FROM Person.Person;

SELECT TOP 10 *
FROM Sales.PersonCreditCard;

SELECT *
FROM Person.Person AS P
LEFT JOIN Sales.PersonCreditCard PC
ON P.BusinessEntityID = PC.BusinessEntityID;

--INNER JOIN: 19.118 Pessoas com o Cart�o de cr�dito registrado.
--LEFT JOIN: 19972 Linhas

--Quantas pessoas n�o tem o cart�o de cr�dito registrado?

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