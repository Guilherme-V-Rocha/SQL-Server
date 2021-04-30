USE LOCADORA
GO

CREATE TABLE  CLIENTE(
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY ,
	nome VARCHAR(55),
	cpf VARCHAR(15) NOT NULL,
	dataNascimento DATE NOT NULL,
	estado CHAR(2)NOT NULL,
	cidade VARCHAR(35) NOT NULL,
	cep VARCHAR(15) NOT NULL,
	logradouro VARCHAR(35) NOT NULL,
	numero VARCHAR(50) NOT NULL,
	bairro VARCHAR(20) NOT NULL
)
GO

CREATE TABLE CATEGORIA(
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	descricao VARCHAR(100) NOT NULL
)
GO

CREATE TABLE FILME(
	id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	categoriaId int NOT NULL,
	descricao varchar(100) NOT NULL,
	duracao int NOT NULL,
	valor numeric(10, 2) NOT NULL,
)
GO

CREATE TABLE FITA(
	id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	filmeId int NOT NULL,
	descricao varchar(100) NOT NULL,
	dataCompra date NOT NULL
)
GO

CREATE TABLE LOCACAO(
	clienteId int NOT NULL,
	fitaId int NOT NULL,
	dataLocacao datetime NOT NULL default GETDATE(),
)
GO

ALTER TABLE FILME
	ADD CONSTRAINT FK_FILME_CATEGORIA FOREIGN KEY(categoriaId) REFERENCES CATEGORIA(id)
GO

ALTER TABLE FITA
	ADD CONSTRAINT FK_FITA_FILME FOREIGN KEY(filmeId) REFERENCES FILME(id)
GO

ALTER TABLE LOCACAO
	ADD CONSTRAINT FK_LOCACAO_CLIENTE FOREIGN KEY(clienteId) REFERENCES CLIENTE(id)
GO

ALTER TABLE LOCACAO
	ADD CONSTRAINT FK_LOCACAO_FITA FOREIGN KEY(fitaId) REFERENCES FITA(id)
GO
ALTER TABLE LOCACAO
	ADD CONSTRAINT PK_locacao PRIMARY KEY (clienteId, fitaId, dataLocacao)
GO
ALTER TABLE CLIENTE
	ADD email VARCHAR(54) UNIQUE NOT NULL
GO

ALTER TABLE CLIENTE
	ADD telefone VARCHAR(54) NULL
GO

ALTER TABLE CLIENTE
	ADD celular VARCHAR(54) NOT NULL
GO

ALTER TABLE CLIENTE
	ADD ativo INT DEFAULT 1 NOT NULL
GO

CREATE INDEX IDX_CLIENTE 
	ON CLIENTE(cpf)
GO

INSERT INTO CATEGORIA(descricao) VALUES('Acao')
GO

INSERT INTO CATEGORIA(descricao) VALUES('Terror')
GO

INSERT INTO CATEGORIA(descricao) VALUES('Comedia')
GO

INSERT INTO CATEGORIA(descricao) VALUES('Drama')
GO

INSERT INTO CATEGORIA(descricao) VALUES('Ficcao Cientifica')
GO

/*ACAO*/
INSERT INTO FILME(categoriaId, descricao, duracao, valor) 
	VALUES(1,'Cassino Royale', 130, 15.00)
GO

INSERT INTO FILME(categoriaId, descricao, duracao, valor) 
	VALUES(1, 'A Hora do Rush', 120, 10.00)
GO

/*TERROR*/
INSERT INTO FILME(categoriaId, descricao, duracao, valor) 
	VALUES(2, 'IT a Coisa', 118, 10.00)
GO

INSERT INTO FILME(categoriaId, descricao, duracao, valor) 
	VALUES(2, 'Annabelle, a criação do mal ', 136, 15.00)
GO

/*COMEDIA*/
INSERT INTO FILME(categoriaId, descricao, duracao, valor)
	VALUES(3, 'As Branquelas', 120 , 10.00)
GO

INSERT INTO FILME(categoriaId, descricao, duracao, valor)
	VALUES(3, 'O Virgem de 40 anos ', 116, 10.00)
GO

/*DRAMA*/
INSERT INTO FILME(categoriaId, descricao, duracao, valor)
	VALUES(4, 'Segredo e Despedidas', 124, 15.00)
GO

INSERT INTO FILME(categoriaId, descricao, duracao, valor)
	VALUES(4, 'Antes que eu vá ', 134, 15.00)
GO

/*Ficcao Cientifica*/
INSERT INTO FILME(categoriaId, descricao, duracao, valor)
	VALUES(5, 'Jogos de Guerra', 130, 10.00)
GO

INSERT INTO FITA
    (filmeId , descricao , dataCompra)
VALUES
	(1, 'Fita 01', '2019-01-20'),
	(1, 'Fita 02', '2019-01-20'),
	(1, 'Fita 03', '2019-01-20'), --Ação: 1
	(2, 'Fita 01', '2019-05-20'),
	(2, 'Fita 02', '2019-05-20'),
	(2, 'Fita 03', '2019-05-20'),
	(2, 'Fita 04', '2019-05-20'),
	(2, 'Fita 05', '2019-05-20'), --Açao: 2
	(3, 'Fita 01', '2019-06-20'),
	(3, 'Fita 02', '2019-06-20'),
	(3, 'Fita 03', '2019-06-20'),
	(3, 'Fita 04', '2019-06-20'),
	(3, 'Fita 05', '2019-06-20'), --Terror: 3
	(4, 'Fita 01', '2019-07-20'), 
	(4, 'Fita 02', '2019-07-20'), 
	(4, 'Fita 03', '2019-07-20'), 
	(4, 'Fita 04', '2019-07-20'), --Terror: 4
	(5, 'Fita 01', '2019-05-20'), 
	(5, 'Fita 02', '2019-05-20'), 
	(5, 'Fita 03', '2019-05-20'), 
	(5, 'Fita 04', '2019-05-20'), --Comédia: 5
	(6, 'Fita 01', '2019-08-20'), 
	(6, 'Fita 02', '2019-08-20'), 
	(6, 'Fita 03', '2019-08-20'), 
	(6, 'Fita 04', '2019-08-20'), --Comédia: 6
	(7, 'Fita 01', '2019-05-20'), 
	(7, 'Fita 02', '2019-05-20'), 
	(7, 'Fita 03', '2019-05-20'), --Drama: 7
	(8, 'Fita 01', '2019-06-20'), 
	(8, 'Fita 02', '2019-06-20'), 
	(8, 'Fita 03', '2019-06-20'), 
	(8, 'Fita 04', '2019-06-20'), 
	(8, 'Fita 05', '2019-06-20'), --Drama: 8
	(9, 'Fita 01', '2019-07-20'), 
	(9, 'Fita 02', '2019-07-20'), 
	(9, 'Fita 03', '2019-07-20'), 
	(9, 'Fita 04', '2019-07-20')  --Ficção Científica: 9



INSERT INTO CLIENTE(nome, cpf, dataNascimento, email, estado, cidade, cep, logradouro, numero, bairro, telefone, celular) 
	VALUES('Pedro Alves', '623.372.140-79', '20/01/1990', 'pedro.alves@email.com', 'PR', 'Campo Mourão', '87300-000', 'Rua São Paulo', '18A', 'Centro', '(44)3518-0001', '(44)99989-0908')
GO

INSERT INTO CLIENTE(nome, cpf, dataNascimento, email, estado, cidade, cep, logradouro, numero, bairro, telefone, celular) 
	VALUES('Luciana Ribeiro', '343.780.060-49', '01/07/1992', 'luciana.ribeiro@email.com', 'PR', 'Campo Mourão', '87300-000', 'Rua João Bento', '1987', 'Jd Copacabana', '(44) 3518-7879', '(44) 98998-2528')
GO

INSERT INTO LOCACAO(clienteId, dataLocacao, fitaId) 
	VALUES(1, '10/12/2019 ', 26)
GO 

INSERT INTO LOCACAO(clienteId, dataLocacao, fitaId) 
	VALUES(1, '10/12/2019', 29)
GO

INSERT INTO LOCACAO(clienteId, dataLocacao, fitaId) 
	VALUES(1, '17/12/2019 ', 34)
GO

INSERT INTO LOCACAO(clienteId, dataLocacao, fitaId) 
	VALUES(1, '17/12/2019', 14)
GO

INSERT INTO LOCACAO(clienteId, dataLocacao, fitaId) 
	VALUES(1, '23/12/2019', 27)
GO

INSERT INTO LOCACAO(clienteId, dataLocacao, fitaId) 
	VALUES(2,'10/11/2019 ', 22)

INSERT INTO LOCACAO(clienteId, dataLocacao, fitaId) 
	VALUES(2,'10/11/2019 ', 18)
GO

INSERT INTO LOCACAO(clienteId, dataLocacao, fitaId) 
	VALUES(2,'17/11/2019 ', 9)
GO

INSERT INTO LOCACAO(clienteId, dataLocacao, fitaId) 
	VALUES(2,'17/11/2019', 4)
GO

INSERT INTO LOCACAO(clienteId, dataLocacao, fitaId) 
	VALUES(2,'30/11/2019 ', 34)
GO

INSERT INTO LOCACAO(clienteId, dataLocacao, fitaId) 
	VALUES(2,'30/11/2019 ', 1)
GO



SELECT  id AS 'COD. Categoria', 
		descricao AS 'Categoria' 
FROM CATEGORIA 


SELECT  id AS 'COD. FILME', 
		descricao AS 'Nome Filme', 
		duracao AS 'Tempo do Filme', 
		valor AS 'Valor do Filme' 
FROM FILME 


SELECT  
		id AS 'Cod. Cliente',
		nome AS 'Nome Cliente',
		email AS 'Contato E-mail', 
		telefone AS 'Contato Telefone', 
		celular AS 'Contato Celular' 
FROM CLIENTE


SELECT	nome AS 'Nome dos Cliente', 
		estado AS 'Estado', 
		cidade AS 'Cidade', 
		cep AS 'Cep', 
		logradouro AS 'Rua', 
		numero AS 'Numero da Casa', 
		bairro AS 'Bairro'
		FROM CLIENTE 
ORDER BY nome ASC
GO

SELECT *
	FROM CLIENTE
WHERE email = 'pedro.alves@email.com'
GO


SELECT	descricao AS 'Categoria'
		FROM CATEGORIA
ORDER BY descricao DESC

SELECT  descricao AS 'Categoria' 
		FROM CATEGORIA
WHERE descricao LIKE 'A%'

SELECT  id AS 'COD. Filme', 
		descricao AS 'Nome do Filme', 
		valor AS 'Valor do Filme' 
		FROM FILME
WHERE valor > 10.00


SELECT  id AS 'COD. Filme', 
		descricao AS 'Nome do Filme', 
		duracao AS 'Tempo do Filme' 
		FROM FILME
WHERE duracao <= 120

SELECT  id AS 'COD. Filme', 
		descricao AS 'Nome do Filme', 
		duracao AS 'Tempo do Filme' 
		FROM FILME
WHERE duracao > 130


SELECT  nome AS 'Nome Cliente', 
		cidade AS 'Cidade', 
		estado AS 'Estado' 
FROM CLIENTE


SELECT  
	*,
	dataCompra AS 'Fita Compradas 1 semestre de 2019' 
FROM	
	FITA
WHERE 
	dataCompra BETWEEN '2019/01/01' AND '2019/06/30'


SELECT  
	dataLocacao AS 'Locada em novembro de 2019'
FROM
	LOCACAO 
WHERE 
	dataLocacao BETWEEN '01/11/2019' AND '30/11/2019'

SELECT  dataCompra AS 'Fita comprada em Janeiro de 2019' 
		FROM FITA
WHERE dataCompra BETWEEN '01/01/2019' AND '31/01/2019'

SELECT  * 
		FROM CLIENTE
WHERE nome LIKE '%Alves%'


SELECT  * 
		FROM CLIENTE
WHERE cidade = 'Campo Mourão'


SELECT  *
		FROM CLIENTE
WHERE bairro = 'Centro' and cidade = 'Campo Mourão'


SELECT  *
		FROM CLIENTE
WHERE dataNascimento BETWEEN '1992/01/01' AND GETDATE()
ORDER BY nome ASC


SELECT	id AS 'Cod. Cliente',
		nome AS 'Nome Cliente',
		estado AS 'Estado', 
		cidade AS 'Cidade' 
		FROM CLIENTE
WHERE ativo = 1


UPDATE CLIENTE 
	SET ativo = 0
WHERE id = 2

SELECT  nome AS 'Nome Cliente', 
		cidade AS 'Cidade' 
		FROM CLIENTE
WHERE ativo = 0


ALTER TABLE LOCACAO
	ADD dataDevolucao DATETIME
GO

SELECT
	C.descricao AS 'Categoria',
	F.id AS 'Cod. Filme',
	F.descricao AS 'Nome Filme',
	F.valor AS 'Valor do Filme'
FROM 
	FILME F
	INNER JOIN CATEGORIA C
	ON F.categoriaId = C.id
GO

SELECT
	C.descricao AS 'Categoria',
	F.descricao AS 'Nome Filme',
	F.duracao AS 'Tempo do Filme',
	F.valor AS 'Valor do Filme'
FROM FILME F 
	JOIN CATEGORIA C
	ON F.categoriaId = C.id
WHERE C.descricao = 'Comedia'
GO

SELECT
	C.descricao AS 'Categoria',
	F.descricao AS 'Nome Filme',
	F.duracao AS 'Tempo do Filme',
	F.valor AS 'Valor do Filme',
	FI.descricao AS 'Descricao da Fita',
	FI.dataCompra AS 'Data compra da Fita'
FROM 
	FILME F 
	INNER JOIN FITA FI
	ON F.id = FI.Id
	INNER JOIN CATEGORIA C
	ON F.categoriaId = C.id
WHERE C.descricao = 'Drama' AND F.duracao < 120
GO

SELECT	
	C.descricao AS 'Categoria',
	F.descricao AS 'Nome Filme',
	FI.descricao AS 'Descricao da Fita'
FROM FILME F
	JOIN CATEGORIA C
	ON F.categoriaId = C.id
	JOIN FITA FI
	ON F.Id = FI.Id
	JOIN LOCACAO L
	ON FI.id = L.fitaId
	JOIN CLIENTE CL
	ON L.clienteId = CL.id
WHERE CL.ATIVO = 1
GO

SELECT C.id AS 'Cod. Cliente',
	   C.nome AS 'Nome Cliente',
	   C.cidade AS 'Cidade',
	   C.celular AS 'Celuluar',
	   C.email AS 'E-mail'
FROM 
	   CLIENTE C
	   JOIN LOCACAO L
	   ON C.id = L.clienteId
	   JOIN FITA FI
	   ON L.fitaId = FI.id
	   JOIN FILME F
	   ON FI.filmeId = F.id
	   JOIN CATEGORIA CA
	   ON F.categoriaId = CA.id
WHERE CA.descricao = 'Terror'
GO

SELECT CA.id AS 'Cod. Categoria',
	   CA.descricao AS 'Categoria'
FROM 
	   CATEGORIA CA
	   JOIN FILME F
	   ON F.categoriaId = CA.id
	   JOIN FITA FI
	   ON F.id = FI.filmeid
	   JOIN LOCACAO L
	   ON FI.Id = L.fitaId
	   JOIN CLIENTE C
	   ON L.clienteId = C.id
WHERE C.ativo = 0
GO

SELECT
	   C.id AS 'Cod. Cliente',
	   C.nome AS 'Nome Cliente'
FROM 
	   CLIENTE C
	   JOIN LOCACAO L
	   ON C.id = L.clienteId
GO


SELECT
	   C.id AS 'Cod. Cliente',
	   C.nome AS 'Nome Cliente'
FROM 
	   CLIENTE C
	   LEFT JOIN LOCACAO L
	   ON C.id = L.clienteId
WHERE L.dataLocacao IS NULL
GO

INSERT INTO CLIENTE(nome, cpf, dataNascimento, email, estado, cidade, cep, logradouro, numero, bairro, telefone, celular) 
	VALUES('Maria Eduarda', '000.00.140-79', '20/08/2005', 'Maria.Eduarda@email.com', 'PR', 'Campo Mourão', '87300-000', 'Rua São Bento', '20A', 'Centro', '(44)3522-0221', '(44)99999-0000')
GO

SELECT 
	CA.descricao AS 'Categoria',
	F.descricao AS 'Nome Filme',
	FI.descricao AS 'Descricao da Fita'
FROM  
	FILME F
	JOIN CATEGORIA CA
	ON F.categoriaId = CA.id
	JOIN FITA FI
	ON F.id = FI.filmeid
	LEFT JOIN LOCACAO L
	ON FI.id = L.fitaId
WHERE L.dataLocacao IS NULL
GO

SELECT
	L.fitaId AS 'Cod. Fita',
	f.descricao AS 'Nome Filme',
	L.dataLocacao AS 'Data Locacao'
FROM LOCACAO L
LEFT JOIN FITA FI
ON FI.id = L.fitaid
RIGHT JOIN FILME F
ON F.id = FI.filmeId
WHERE L.dataLocacao IS NULL

INSERT INTO FILME(categoriaId, descricao, duracao, valor) VALUES(1, 'Monster Hunter', 145, 35.00)
INSERT INTO FITA(filmeId, descricao, dataCompra) VALUES(10, 'Fita 01', '2020-12-25')


UPDATE LOCACAO
	SET dataDevolucao = '17/12/2019'
WHERE fitaId = 14;
UPDATE LOCACAO
	SET dataDevolucao = '17/12/2019'
WHERE fitaId = 26;
UPDATE LOCACAO
	SET dataDevolucao = '17/12/2019'
WHERE fitaId = 27;

UPDATE LOCACAO
	SET dataDevolucao = '01/12/2019'
WHERE fitaId = 1;
UPDATE LOCACAO
	SET dataDevolucao = '19/11/2019'
WHERE fitaId = 4;
UPDATE LOCACAO
	SET dataDevolucao = '19/11/2019'
WHERE fitaId = 9;
 

SELECT 
	clienteId AS 'Cod. Cliente', 
	COUNT(fitaId) AS 'Total Filme Locados' 
FROM 
	LOCACAO
GROUP BY 
	clienteId


SELECT 
	filmeid AS 'Cod. Filme',
	COUNT(id) AS 'Fita de cada Filme' 
FROM 
	FITA 
GROUP BY 
	filmeid


SELECT 
	C.id AS 'Cod. Categoria',
	C.descricao AS 'Categoria',
	COUNT(L.fitaId) AS 'Filme' 
FROM 
	LOCACAO L
	JOIN FITA FT
	ON FT.id = L.fitaId
	JOIN FILME FI
	ON FI.id = FT.filmeId
	JOIN CATEGORIA C
	ON C.id = FI.categoriaId
GROUP BY 
	C.descricao, C.id

SELECT
	FI.id AS 'Cod.Filme',
	FI.descricao as 'Filme',
	COUNT(FI.id) AS 'Filme Locados'
FROM LOCACAO L
	LEFT JOIN FITA FT
	ON FT.id = L.fitaId
	JOIN FILME FI
	ON FI.id = FT.filmeId
GROUP BY
	FI.descricao, FI.id
--FITA ID 14,26,27,29,34,1,4,9,18,22,34
--FILMEID  4, 7, 7, 8, 9,1,2,3, 5, 6, 9
--DESCRICAO 
/*			A Hora do Rush = 2
			ANANABELE = 4,
			ANTES QUE EU VA = 8
			AS BRANQUELAS = 5
			CASSINO ROYALE = 1,
			IT A COISA = 3
			JOGOS DE GUERRA = 9 X 2,
			O VIRGEMDE DE 40 ANOS = 6
			SEGREDO E DESPEDIDAS = 7 X 2, 
*/
SELECT 
	C.Id AS 'Cod. Cliente',
	AVG(FI.valor) AS 'Valor Medio'
FROM 
	LOCACAO L
	JOIN CLIENTE C
	ON C.id = L.clienteId
	JOIN FITA FT
	ON FT.id = L.fitaId
	JOIN FILME FI
	ON FI.id = FT.filmeId
GROUP BY
	C.Id

SELECT 
	C.id AS 'Cod. Categoria',
	C.descricao AS 'Categoria',
	AVG(FI.valor) AS 'Filme' 
FROM 
	LOCACAO L
	JOIN FITA FT
	ON FT.id = L.fitaId
	JOIN FILME FI
	ON FI.id = FT.filmeId
	JOIN CATEGORIA C
	ON C.id = FI.categoriaId
GROUP BY 
	C.descricao, C.id
SELECT 
	C.id AS 'Cod. Cliente',
	COUNT(L.fitaId) AS 'Precisa Devolver'
FROM 
	LOCACAO L
	JOIN CLIENTE C
	ON C.id = L.clienteId
	WHERE L.dataDevolucao IS NULL
GROUP BY
	C.id

SELECT
	C.id AS 'Cod. Cliente',
	L.dataLocacao,
	COUNT(L.fitaId) AS 'Locacoes por data' 
FROM 
	LOCACAO L
	JOIN CLIENTE C
	ON C.id = L.clienteId
GROUP BY
	C.id, L.dataLocacao
ORDER BY
	C.id

SELECT DISTINCT
	FI.descricao AS 'Filme Locado',
	L.dataLocacao AS 'Locado no mes de Novembro e Dezembro',
	COUNT(L.fitaId) AS 'Locacoes por data' 
FROM 
	LOCACAO L
	JOIN FITA FT
	ON FT.id = L.fitaId
	JOIN FILME FI
	ON FI.id = FT.filmeId
	WHERE L.dataLocacao BETWEEN '01/11/2019' AND '31/12/2019'
GROUP BY
	FI.descricao, L.dataLocacao


SELECT
	C.id AS 'Cod. Cliente',
	C.nome AS 'Nome Cliente',
	CASE
		WHEN C.ativo = 0 THEN 'Inativo'
		WHEN C.ativo = 1 THEN 'Ativo'
	END AS 'STATUS CLIENTE',
	COUNT(FI.id) AS 'Filme locado'
FROM 
	CLIENTE C
	JOIN LOCACAO L
	ON C.id = L.clienteId
	JOIN FITA FT
	ON FT.id = L.fitaId
	JOIN FILME FI
	ON FI.id = FT.filmeId
GROUP BY
	C.id, C.nome, C.ativo

SELECT 
	F.id AS 'Cod. Filme',
	F.descricao AS 'Nome filme',
	C.descricao AS 'Categoria',
	CASE
		WHEN valor < 15 THEN 'Valor abaixo de R$15.00'
		WHEN valor >= 15 AND valor <= 20 THEN 'Valor entre R$ 15,00 e R$ 20,00'
		WHEN valor > 20 THEN 'Valor acima de R$ 20,00'
	END AS 'Faixa de valor'
FROM 
	FILME F
	JOIN CATEGORIA C
	ON C.id = F.categoriaId

SELECT
	C.id AS 'Cod. Cliente',
	C.nome AS 'Nome cliente',
	CASE 
		WHEN C.ativo = 1 THEN 'Ativo'
		WHEN C.ativo = 0 THEN 'Inativo'
	END AS 'Status Cliente',
	SUM((FI.valor) * 1.10) 'Valor total'
FROM CLIENTE C
	JOIN LOCACAO L
	ON C.id = L.clienteId
	JOIN FITA FT
	ON FT.id = L.fitaId
	JOIN FILME FI
	ON FI.id = FT.filmeId
WHERE L.dataDevolucao IS NULL
GROUP BY
	C.id, C.nome, C.ativo

SELECT
	YEAR(dataLocacao) AS 'Ano',
	COUNT(L.fitaId) AS 'Numero de Locacao',
	CAST(AVG(FI.valor) AS DECIMAL(10,2)) AS 'Ticket Medio',
	CAST(MIN(FI.valor) AS DECIMAL(10,2)) AS 'Ticket Menor',
	CAST(MAX(FI.valor) AS DECIMAL(10,2)) AS 'Ticket Maior'
FROM LOCACAO L
	JOIN FITA FT
	ON FT.id = L.fitaId
	JOIN FILME FI
	ON FI.id = FT.filmeId
WHERE L.dataLocacao BETWEEN '01/01/2019' AND '31/12/2019'
GROUP BY
	YEAR(dataLocacao)

SELECT 
	C.id AS 'Cod. Cliente',
	C.nome AS 'Nome Cliente',
	COUNT(L.fitaId) AS 'Locacao'
FROM CLIENTE C
	JOIN LOCACAO L
	ON C.id = L.clienteId
GROUP BY
	C.id, C.nome
HAVING 
	COUNT(L.fitaId) > 5

SELECT 
	FI.id AS 'Cod. Filme',
	FI.descricao AS 'Nome Filme',
	COUNT(L.fitaId) AS 'Locacao'
FROM LOCACAO L
	JOIN FITA FT
	ON FT.id = L.fitaId
	JOIN FILME FI
	ON FI.id = FT.filmeId
GROUP BY
	FI.id, FI.descricao
HAVING
	COUNT(L.fitaId) > 1

SELECT
	C.id AS 'Cod. Categoria',
	C.descricao AS 'Categoria',
	COUNT(L.fitaId) AS 'Filme' 
FROM 
	LOCACAO L
	JOIN FITA FT
	ON FT.id = L.fitaId
	JOIN FILME FI
	ON FI.id = FT.filmeId
	JOIN CATEGORIA C
	ON C.id = FI.categoriaId
GROUP BY 
	C.descricao, C.id
HAVING 
	COUNT(L.fitaId) > 1

SELECT
    *
FROM
    filme f
WHERE
    f.id NOT IN(
        SELECT DISTINCT
            f.id
        FROM
            locacao l
            JOIN fita ft
                ON ft.id = l.fitaId
            JOIN filme f
                ON f.id = ft.filmeId	
    )

SELECT
    f.descricao as filme,
    (
        SELECT
            COUNT(*)
        FROM
            fita ft
        WHERE
            ft.filmeId = f.id
    ) as 'qtdeFitas'
FROM
    filme f

	
SELECT
    *
FROM
    locacao l
WHERE
    l.dataLocacao = (
        SELECT 
            MAX(dataLocacao) 
        FROM 
            locacao
    )


	
SELECT
    c.nome,
    lc.dtPrimeiraLocacao
FROM
    cliente c
    JOIN (
        SELECT
            clienteId,
            MIN(dataLocacao) as 'dtPrimeiraLocacao'
        FROM
           locacao l
        GROUP BY
           clienteId	
    ) as lc
        ON lc.clienteId = c.id

select * from categoria	
SELECT
    f.id,
    f.descricao as 'filme'
FROM
    filme f
	JOIN (
		SELECT
			c.descricao
		FROM
			categoria c
	) AS cat
	ON cat.id = f.categoriaId

SELECT * from categoria
select * from filme
	
SELECT
    f.id,
    f.descricao as 'filme',
	(
		SELECT
			C.descricao
		FROM
			CATEGORIA C
		WHERE
			C.id = f.categoriaId
	) AS 'Categoria'
FROM
    filme f