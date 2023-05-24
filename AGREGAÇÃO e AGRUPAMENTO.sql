--_____________________________________________________________________07.03.23____________________________________________________________________________________

-- Desafio 1 > A equipe de Marketing precisa de fazer uma pesquisa sobre nomes mais comuns de seus Clientes, e precisa do nome e sobrenome de todos os clientes que estão
--cadastrados no sistema. > First name - Last name.

SELECT
firstname, lastname
from Person.Person;

SELECT distinct firstname
from Person.Person;

-- Desafio 2 > Quantos sobrenomes únicos temos na tabela Person.Person

SELECT COUNT(DISTINCT LastName)
FROM Person.Person;

SELECT *
FROM Production.Product;

-- Desafio 3 > A equipe de produção precisa do nome de todas as peças que pesam mais de 500kg porém não mais de 700kg para inspeção.

SELECT Name, Weight as Peso
FROM Production.Product
WHERE Weight > '500' and Weight <= '700';

-- Desafio 4 > Foi pedido pelo Marketing uma relação de todos os empregados(Employees) que são casados(single=solteiro, married=casado) e são assalariados(salaried).

SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'M' and SalariedFlag = 'True';

-- DESAFIO 5 > Um usuário chamado Peter Krebs está devendo um pagamento, consiga o E-mail dele para que possamos enviar uma cobrança.

SELECT *
FROM Person.Person
WHERE FirstName = 'Peter' and LastName = 'Krebs';

SELECT *
FROM Person.EmailAddress
WHERE BusinessEntityID = '26';

-- Primeiro JOIN no SQL Server > 

SELECT PP.FirstName, PP.LastName, PE.EmailAddress
FROM Person.Person PP JOIN Person.EmailAddress PE
ON PE.BusinessEntityID = PP.BusinessEntityID
WHERE PP.FirstName = 'Peter' and PP.LastName = 'Krebs';

-- Desafio > Saber quantos produtos temos cadastrados em nossa tabela de produtos (production.product)
-- Desafio > Quantos tamanhos de produtos temos cadastrados em nossa tabela (tamanhos únicos) (production.product)
-- Desafio > Quantos tamanhos diferentes de produtos temos em nossa tabela.

SELECT count(*) AS ContagemProdutos
FROM Production.Product;

SELECT COUNT(DISTINCT size) AS ContagemTamanhos
FROM Production.Product;

--______________________________________________________________________08/03/23_______________________________________________________________________________--

--Obter o ProductID dos 10 produtos mais caros cadastrados no sistema, listando do mais caro para o mais barato.

SELECT TOP 10 ProductID as ID, ListPrice as preco
FROM Production.Product
ORDER BY ListPrice desc;

--Obter o nome e número do produto dos produtos que tem o ProtuctID entre 1~4

SELECT TOP 4 name, ProductNumber
FROM Production.Product
ORDER BY ProductID asc;

SELECT *
FROM Person.Person
WHERE BusinessEntityID in ('2', '7', '13');

--DESAFIOS RESUMÃO
--Quantos produtos temos cadastrado no sistema que custam mais de 1500 dólares?

SELECT COUNT(ListPrice) as Contagem
FROM Production.Product
WHERE ListPrice > 1500;

-- Quantas pessoas temos com o sobrenome que inicia com a letra P?

SELECT COUNT(Lastname)
FROM Person.Person
WHERE LastName like 'P%';

-- Em quantas cidades únicas estão cadastrados nossos Clientes?

SELECT *
FROM Person.Address;

SELECT COUNT(DISTINCT City)
FROM Person.Address;

--Quais as cidades únicas temos cadastradas em nosso sistema?

SELECT DISTINCT(City) as CidadesDiferentes
FROM Person.Address
ORDER BY City;

--Quantos produtos vermelhos tem preço de 500 a 100 dólares?

SELECT *
FROM Production.Product;

SELECT COUNT(*)
FROM Production.Product
WHERE Color = 'Red'
AND ListPrice BETWEEN '500' AND '1000';

--Quantos produtos cadastrados tem a palavra 'road' no nome deles?

SELECT COUNT(*)
FROM Production.Product
WHERE Name LIKE '%road%';

SELECT TOP 10 *
FROM Sales.SalesOrderDetail;

SELECT TOP 10 SUM(LineTotal) as SOMA
FROM Sales.SalesOrderDetail;

SELECT TOP 10 MAX(Linetotal)
FROM Sales.SalesOrderDetail;

--Vamos dizer que eu quero saber quantos cada produto foi vendido até hoje

SELECT ProductID, COUNT(ProductID) as Contagem
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY COUNT(ProductID) ASC;

--Exemplo > Vamos dizer que eu quero saber quantos nomes de cada nome temos cadastrado em nosso banco de dados

SELECT FirstName, COUNT(FirstName) as Contagem
FROM Person.Person
GROUP BY FirstName;

--Exemplo > Na tabela production.product eu quero saber a média de preço para os produtos que são pratas(silver).

SELECT Color, AVG(Listprice) as media
FROM Production.Product
WHERE Color = 'Silver'
GROUP BY Color;

-- Quantas pessoas tem o mesmo Middle name agrupados por Middlename.

SELECT MiddleName, COUNT(FirstName) as Contagem
FROM Person.Person
GROUP BY MiddleName;

--Em média qual a quantidade(quantity) que cada produto é vendido na loja?

SELECT ProductID, AVG(OrderQty) as Media
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY Media ASC;

-- Quais foram as 10 vendas que no total tiveram os maiores valores de venda(LineTotal) por produto, do maior valor para o menor.

SELECT *
FROM Sales.SalesOrderDetail;

SELECT TOP 10 ProductID, SUM(LineTotal) AS Soma
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY Soma DESC;

-- Quantos produtos e qual a quantidade media de produtos temos cadastrados nas nossas ordem de serviço(WorkOrder), agrupados por ProductID.

SELECT *
FROM Production.WorkOrder;

SELECT ProductID,
		COUNT(ProductID) AS Contagem,
		AVG(OrderQty) AS Media
FROM Production.WorkOrder
GROUP BY ProductID;

--_______________________________________________________________________09.03.23_____________________________________________________________________________________

