SELECT *
FROM VIDEO;

INSERT INTO VIDEO (VideoID, Nome, Visualizacoes, Likes, Dislikes, Duracao, CanalID)
VALUES ('1', 'Da Prova do Verdadeiro Amor', '10', '10', '1', '5', '1');

INSERT INTO VIDEO (VideoID, Nome, Duracao, CanalID)
VALUES ('2', 'Da calma que se deve consertar nos negicios', '5', '1'),
		('3', 'Exemplo', '5', '1');


INSERT INTO VIDEO (VideoID, Nome, Duracao, CanalID)
VALUES ('3', 'Exemplo', '5', '1')

DELETE FROM VIDEO
WHERE VideoID = '3';

SELECT * INTO TabelaNova
FROM VIDEO;

SELECT *
FROM TabelaNova;

INSERT INTO TabelaNova (VIDEOID, Nome, Duracao)
VALUES ('4', 'Sem Nome', '5')

SELECT *
FROM TabelaNova;

INSERT INTO Canal
VALUES ('1', 'Momento de inspiracao', '3', '2023-03-01');

UPDATE TabelaNova
SET Nome =	'Teste1',
	Visualizacoes = '1'
WHERE VideoID = 4



UPDATE TabelaNova
SET Nome = 'Teste3'
WHERE VideoID = 3 AND VideoID = 4;