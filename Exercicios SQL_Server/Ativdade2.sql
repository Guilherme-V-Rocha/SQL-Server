USE ATV_DQL
GO

CREATE TABLE TabelaA(
Nome varchar(50) NULL
)
go

CREATE TABLE TabelaB(
Nome varchar(50) NULL
)
go

INSERT INTO TabelaA VALUES('Fernanda')
INSERT INTO TabelaA VALUES('Josefa')
INSERT INTO TabelaA VALUES('Luiz')
INSERT INTO TabelaA VALUES('Fernando')

INSERT INTO TabelaB VALUES('Carlos')
INSERT INTO TabelaB VALUES('Manoel')
INSERT INTO TabelaB VALUES('Luiz')
INSERT INTO TabelaB VALUES('Fernando')

--a)Utilizando as tabelas A e B, crie um exemplo de consulta para a representação do INNER JOIN.
SELECT  A.Nome as 'NomeA',
		B.Nome as 'NomeB'
FROM 
	TabelaA A
	INNER JOIN TabelaB B
	ON A.Nome = B.Nome
GO

--b)Utilizando as tabelas A e B, crie um exemplo de consulta para a representação do LEFT JOIN.
SELECT  A.Nome as 'NomeA',
		B.Nome as 'NomeB'
FROM TabelaA A
	LEFT JOIN TabelaB B
	ON A.Nome = B.Nome
GO

--c)Utilizando as tabelas A e B, crie um exemplo de consulta para a representação do RIGHTJOIN.
SELECT  A.Nome as 'NomeA',
		B.Nome as 'NomeB'
FROM TabelaA A
	RIGHT JOIN TabelaB B
	ON A.Nome = B.Nome
GO


--d)Utilizando as tabelas A e B, crie um exemplo de consulta para a representação do OUTERJOIN.
SELECT  A.Nome as 'NomeA',
		B.Nome as 'NomeB'
FROM TabelaA A
	FULL OUTER JOIN TabelaB B
	ON A.Nome = B.Nome
GO

--e)Utilizando as tabelas A e B, crie um exemplo de consulta para a representação do LEFT EXCLUDING JOIN.
SELECT  A.Nome as 'NomeA',
		B.Nome as 'NomeB'
FROM TabelaA A
	LEFT JOIN TabelaB B
	ON A.Nome = B.Nome
WHERE B.Nome IS NULL
GO

--f)Utilizando as tabelas A e B, crie um exemplo de consulta para a representação do RIGHT EXCLUDING JOIN.
SELECT  A.Nome as 'NomeA',
		B.Nome as 'NomeB'
FROM TabelaA A
	RIGHT JOIN TabelaB B
	ON A.Nome = B.Nome
WHERE A.Nome IS  NULL
GO

--g)Utilizando as tabelas A e B, crie um exemplo de consulta para a representação do OUTEREXCLUDING JOIN.

SELECT  A.Nome as 'NomeA',
		B.Nome as 'NomeB'
FROM TabelaA A
	FULL OUTER JOIN TabelaB B
	ON A.Nome = B.Nome
WHERE A.Nome IS NULL OR B.Nome IS NULL
GO