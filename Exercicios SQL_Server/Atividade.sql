USE LOCADORA
GO


INSERT INTO categoria
	(descricao)
VALUES
	('Ação'),
	('Terror'),
	('Comédia'),
	('Drama'	),
	('Ficção Científica')

SELECT * FROM categoria

INSERT INTO filme	
	(categoriaId, descricao, duracao, valor)
VALUES
	(1, 'Cassino Royale', 130, 15.00), --Ação Cassino Royale 130min R$ 15,00 3 fitas (data compra 20/01/2019)
	(1, 'A Hora do Rush', 120, 10.00), --Açao A Hora do Rush 120min R$ 10,00 5 fitas (data compra 20/05/2019)
	(2, 'IT a Coisa', 118, 10.00), --Terror IT a Coisa 118min R$ 10,00 5 fitas (data compra 20/06/2019)
	(2, 'Annabelle, a criação do mal', 136, 15.00), --Terror Annabelle, a criação do mal 136min R$ 15,00 4 fitas (data compra 20/07/2019)
	(3, 'As Branquelas', 120, 10.00), --Comédia As Branquelas 120min R$ 10,00 4 fitas (data compra 20/05/2019)
	(3, 'O Virgem de 40 anos', 116, 10.00), --Comédia O Virgem de 40 anos 116min R$ 10,00 4 fitas (data compra 20/08/2019)
	(4, 'Segredo e Despedidas', 124, 15.00), --Drama Segredo e Despedidas 124min R$ 15,00 3 fitas (data compra 20/05/2019)
	(4, 'Antes que eu vá', 134, 15.00), --Drama Antes que eu vá 134min R$ 15,00 5 fitas (data compra 20/06/2019)
	(5, 'Jogos de Guerra', 130, 10.00) --Ficção Científica Jogos de Guerra 130min R$ 10,00 4 fitas (data compra 20/07/2019)

INSERT INTO cliente
	(nome, cpf, dataNascimento, logradouro, numero, bairro, cidade, estado, cep, email, telefone, celular)
VALUES
	('Pedro Alves', '62337214079', '1990-01-20', 'Rua São Paulo', '18A', 'Centro', 'Campo Mourão', 'Paraná', '87300-000', 'pedro.alves@email.com', '(44) 3518-0001', '(44) 99989-0908')

INSERT INTO cliente
	(nome, cpf, dataNascimento, logradouro, numero, bairro, cidade, estado, cep, email, telefone, celular)
VALUES
	('Luciana Ribeiro', '34378006049', '1992-07-01', 'Rua João Bento', '1987', 'Jd Copacabana', 'Campo Mourão', 'Paraná', '87300-000', 'luciana.ribeiro@email.com', '(44) 3518-7879', '(44) 98998-2528')


select * from filme

INSERT INTO fita
	(filmeId, descricao, dataCompra)
VALUES
	(1, 'Fita 01', '2019-01-20'),
	(1, 'Fita 02', '2019-01-20'),
	(1, 'Fita 03', '2019-01-20'), --Ação: #1 Cassino Royale 130min R$ 15,00 3 fitas (data compra 20/01/2019)
	(2, 'Fita 01', '2019-05-20'),
	(2, 'Fita 02', '2019-05-20'),
	(2, 'Fita 03', '2019-05-20'),
	(2, 'Fita 04', '2019-05-20'),
	(2, 'Fita 05', '2019-05-20'), --Açao: #2 A Hora do Rush 120min R$ 10,00 5 fitas (data compra 20/05/2019)
	(3, 'Fita 01', '2019-06-20'),
	(3, 'Fita 02', '2019-06-20'),
	(3, 'Fita 03', '2019-06-20'),
	(3, 'Fita 04', '2019-06-20'),
	(3, 'Fita 05', '2019-06-20'), --Terror: #3 IT a Coisa 118min R$ 10,00 5 fitas (data compra 20/06/2019)
	(4, 'Fita 01', '2019-07-20'), 
	(4, 'Fita 02', '2019-07-20'), 
	(4, 'Fita 03', '2019-07-20'), 
	(4, 'Fita 04', '2019-07-20'), --Terror: #4 Annabelle, a criação do mal 136min R$ 15,00 4 fitas (data compra 20/07/2019)
	(5, 'Fita 01', '2019-05-20'), 
	(5, 'Fita 02', '2019-05-20'), 
	(5, 'Fita 03', '2019-05-20'), 
	(5, 'Fita 04', '2019-05-20'), --Comédia: #5 As Branquelas 120min R$ 10,00 4 fitas (data compra 20/05/2019)
	(6, 'Fita 01', '2019-08-20'), 
	(6, 'Fita 02', '2019-08-20'), 
	(6, 'Fita 03', '2019-08-20'), 
	(6, 'Fita 04', '2019-08-20'), --Comédia: #6 O Virgem de 40 anos 116min R$ 10,00 4 fitas (data compra 20/08/2019)
	(7, 'Fita 01', '2019-05-20'), 
	(7, 'Fita 02', '2019-05-20'), 
	(7, 'Fita 03', '2019-05-20'), --Drama: #7 Segredo e Despedidas 124min R$ 15,00 3 fitas (data compra 20/05/2019)
	(8, 'Fita 01', '2019-06-20'), 
	(8, 'Fita 02', '2019-06-20'), 
	(8, 'Fita 03', '2019-06-20'), 
	(8, 'Fita 04', '2019-06-20'), 
	(8, 'Fita 05', '2019-06-20'), --Drama: #8 Antes que eu vá 134min R$ 15,00 5 fitas (data compra 20/06/2019)
	(9, 'Fita 01', '2019-07-20'), 
	(9, 'Fita 02', '2019-07-20'), 
	(9, 'Fita 03', '2019-07-20'), 
	(9, 'Fita 04', '2019-07-20')  --Ficção Científica: #9 Jogos de Guerra 130min R$ 10,00 4 fitas (data compra 20/07/2019)


SELECT
	ft.*,
	f.descricao as filme
FROM
	filme f
	join fita ft
		on ft.filmeId = f.id
WHERE
	ft.id = 29
		

INSERT INTO locacao
	(clienteId, fitaId, dataLocacao)
VALUES
	(1, 26, '10/12/2019'), --Locou em 10/12/2019 o filme Segredo e Despedidas
	(1, 29, '10/12/2019'), --Locou em 10/12/2019 o filme Antes que eu vá
	(1, 34, '17/12/2019'), --Locou em 17/12/2019 o filme Jogos de Guerra
	(1, 14, '17/12/2019'), --Locou em 17/12/2019 o filme Annabelle, a criação do mal
	(1, 27, '23/12/2019')  --Locou em 23/12/2019 o filme Segredo e Despedidas



INSERT INTO locacao
	(clienteId, fitaId, dataLocacao)
VALUES
	(2, 22, '10/11/2019'), --Locou em 10/11/2019 o filme O Virgem de 40 anos
	(2, 18, '10/11/2019'), --Locou em 10/11/2019 o filme As Branquelas
	(2, 9, '17/11/2019'), --Locou em 17/11/2019 o filme IT a Coisa
	(2, 4, '17/11/2019'), --Locou em 17/11/2019 o filme A Hora do Rush
	(2, 34, '30/11/2019'), --Locou em 30/11/2019 o filme Jogos de Guerra
	(2, 1, '30/11/2019')  --Locou em 30/11/2019 o filme Cassino Royale

SELECT * FROM locacao