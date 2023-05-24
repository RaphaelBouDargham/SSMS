CREATE TABLE PESSOAS (
ID INT Primary Key NOT NULL,
nome varchar (20) NOT NULL,
nacionalidade varchar (20) DEFAULT 'Brasil',
peso decimal (5,2),
altura decimal (3,2),
nascimento date,
sexo varchar (1),
profissao varchar (20)
);

SELECT *
FROM PESSOAS;