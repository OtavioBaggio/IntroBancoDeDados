DROP DATABASE editora_db;
CREATE DATABASE editora_db;
USE editora_db;

-- criando a tabela Autor
CREATE TABLE Autor (
	idAutor INT NOT NULL,
	nome VARCHAR(45) NOT NULL,
	
	PRIMARY KEY (idAutor)
);
-- Mostrar todas as tabelas da base de dados

-- criando a tabela Editora
CREATE TABLE Editora (
  idEditora INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  
  PRIMARY KEY (idEditora)
);

-- criando a tabela Genero
CREATE TABLE Genero (
  idGenero INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  
  PRIMARY KEY (idGenero)
);

-- criando a tabela Livro
CREATE TABLE Livro (
  idLivro INT NOT NULL,
  titulo VARCHAR(45) NOT NULL,
  preco DECIMAL(3) NULL,
  idEditora INT NOT NULL,
  idGenero INT NOT NULL,

  PRIMARY KEY (idLivro),

  INDEX fk_Livro_Editora_idx (idEditora ASC),
  INDEX fk_Livro_Genero_idx (idGenero ASC),

  CONSTRAINT fk_Livro_Editora
    FOREIGN KEY (idEditora)
    REFERENCES Editora (idEditora)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,

  CONSTRAINT fk_Livro_Genero
    FOREIGN KEY (idGenero)
    REFERENCES Genero (idGenero)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- criando a tabela Livro_Autor
CREATE TABLE Livro_Autor (
  idAutor INT NOT NULL,
  idLivro INT NOT NULL,
  
  PRIMARY KEY (idAutor, idLivro),
  INDEX fk_Autor_has_Livro_Livro_idx (idLivro ASC),
  INDEX fk_Autor_has_Livro_Autor_idx (idAutor ASC),
  
  CONSTRAINT fk_Autor_has_Livro_Autor
    FOREIGN KEY (idAutor)
    REFERENCES Autor (idAutor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,

  CONSTRAINT fk_Autor_has_Livro_Livro
    FOREIGN KEY (idLivro)
    REFERENCES Livro (idLivro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- criando a tabela Ranking
CREATE TABLE Ranking (
  idRanking INT NOT NULL,
  dataInicial DATE NOT NULL,
  dataFinal DATE NOT NULL,
  
  PRIMARY KEY (idRanking)
);


-- criando a tabela Ranking_Semanal
CREATE TABLE Ranking_Semanal (
  idRanking INT NOT NULL,
  idLivro INT NOT NULL,
  posicao DECIMAL(2) NULL,
  quantidadeSemanas DECIMAL(2) NULL,
  semanasConsecutivas DECIMAL(2) NULL,
  posicaoSemanaAnterior DECIMAL(2) NULL,
  
  PRIMARY KEY (idRanking, idLivro),
  INDEX fk_Ranking_has_Livro_Livro_idx (idLivro ASC),
  INDEX fk_Ranking_has_Livro_Ranking_idx (idRanking ASC),
  
  CONSTRAINT fk_Ranking_has_Livro_Ranking
    FOREIGN KEY (idRanking)
    REFERENCES Ranking (idRanking)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  
  CONSTRAINT fk_Ranking_has_Livro_Livro
    FOREIGN KEY (idLivro)
    REFERENCES Livro (idLivro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Mostrar todas as tabelas da base de dados

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES;	

-- Mostrar dados de uma tabela
SELECT *
FROM Autor;

-- INSERINDO DADOS NA TABELAS
-- inserindo dados na tabela Autor
insert into Autor values (1, 'Pedro');
insert into Autor values (2, 'Marcos');
insert into Autor values (3, 'Felipe');
insert into Autor values (4, 'Ana');
insert into Autor values (5, 'Maria');
insert into Autor values (6, 'Francisco');
insert into Autor values (7, 'Lucas');

select * from Autor;

-- inserindo dados na tabela Editora
insert into Editora values (1, 'Ática');
insert into Editora values (2, 'Makron Books');
insert into Editora values (3, 'Rocco');
insert into Editora values (4, 'Scipione');
insert into Editora values (5, 'Sagra Luzato');

select * from Editora;

-- inserindo dados na tabela Genero
insert into Genero values (1, 'Infantil');
insert into Genero values (2, 'Ficção');
insert into Genero values (3, 'Romance');
insert into Genero values (4, 'Auto-ajuda');
insert into Genero values (5, 'Negócios');
insert into Genero values (6, 'História');

select * from Genero;

ALTER TABLE Livro MODIFY COLUMN preco FLOAT NULL;

-- DROP TABLE Livro; usado para deletar toda a tabela
-- Deletar os dados de uma tabelas
DELETE FROM Livro;
DELETE FROM Livro_Autor;
DELETE FROM Ranking_Semanal;
-- fazer esses delete para poder mudar o preco do livro tem que inserir os dados novamente 

-- inserindo dados na tabela Livro
insert into Livro values (1, 'A', 25.30, 1, 1);
insert into Livro values (2, 'B', 32.45, 1, 4);
insert into Livro values (3, 'C', 122.00, 4, 2);
insert into Livro values (4, 'D', 100.99, 4, 3);
insert into Livro values (5, 'E', 16.16, 1, 5);
insert into Livro values (6, 'F', 4.56, 3, 1);
insert into Livro values (7, 'G', 85.20, 2, 5);
insert into Livro values (8, 'H', 89.90, 5, 5);
insert into Livro values (9, 'I', 63.36, 2, 2);
insert into Livro values (10, 'J', 41.40, 3, 3);
insert into Livro values (11, 'K', 200.30, 4, 6);
insert into Livro values (12, 'L', 99.99, 2, 4);

select * from Livro;

-- inserindo dados na tabela Livro_Autor
insert into Livro_Autor values (1, 1);
insert into Livro_Autor values (6, 1);
insert into Livro_Autor values (6, 2);
insert into Livro_Autor values (5, 3);
insert into Livro_Autor values (1, 3);
insert into Livro_Autor values (4, 3);
insert into Livro_Autor values (4, 4);
insert into Livro_Autor values (1, 5);
insert into Livro_Autor values (5, 6);
insert into Livro_Autor values (3, 6);
insert into Livro_Autor values (3, 7);
insert into Livro_Autor values (2, 8);
insert into Livro_Autor values (6, 9);
insert into Livro_Autor values (6, 10);
insert into Livro_Autor values (1, 10);
insert into Livro_Autor values (2, 11);
insert into Livro_Autor values (2, 12);

select * from Livro_Autor;

-- inserindo dados na tabela Ranking
insert into Ranking values (1, '20030817', '20030823');
insert into Ranking values (2, '20030824', '20030830');
insert into Ranking values (3, '20030831', '20030906');
insert into Ranking values (4, '20030907', '20030913');

select * from Ranking;

-- inserindo dados na tabela Ranking_Semanal
insert into Ranking_Semanal values (1,1,4,6,3,3);
insert into Ranking_Semanal values (2,1,5,7,3,4);
insert into Ranking_Semanal values (3,2,1,1,1,null);
insert into Ranking_Semanal values (4,2,1,2,2,1);
insert into Ranking_Semanal values (1,3,2,2,2,null);
insert into Ranking_Semanal values (2,3,2,3,3,2);
insert into Ranking_Semanal values (3,3,8,4,4,2);
insert into Ranking_Semanal values (4,3,10,5,5,8);
insert into Ranking_Semanal values (1,4,1,50,43,1);
insert into Ranking_Semanal values (2,5,1,1,1,null);
insert into Ranking_Semanal values (3,5,2,2,2,1);
insert into Ranking_Semanal values (4,5,9,3,3,2);
insert into Ranking_Semanal values (4,6,8,1,1,null);
insert into Ranking_Semanal values (3,7,5,1,1,null);
insert into Ranking_Semanal values (4,7,5,2,2,5);
insert into Ranking_Semanal values (1,8, 3,13,12,6);
insert into Ranking_Semanal values (2,8, 3, 14,13,3);
insert into Ranking_Semanal values (3,8,3,15,14,3);
insert into Ranking_Semanal values (4,8,4,16,15,3);
insert into Ranking_Semanal values (2,9,7,1,1,null);
insert into Ranking_Semanal values (3,9,7,2,2,7);
insert into Ranking_Semanal values (1,10,8,4,4,10);
insert into Ranking_Semanal values (2,10,9,5,5,8);
insert into Ranking_Semanal values (3,11,9,1,1,null);
insert into Ranking_Semanal values (1,12,6,3,2,6);

select * from Ranking_Semanal;
describe Ranking_Semanal;
-- CONSULTAS E OUTROS COMANDOS

-- Conta quantas tuplas/linhas há na tabela Ranking_Semanal
select count(*)
from Ranking_Semanal;

-- i. Mostre todos os autores cadastrados  
select * from autor;

-- ii. Mostre apenas os nomes dos autores  
select idAutor, nome
from autor;

-- iii. Mostre o nome e a identificação do autor, nesta ordem  
select nome, idAutor
from autor;

-- iv. Mostre o nome dos autores que aparecem na tabela Livro_Autor  
select Autor.nome
from Autor, Livro_Autor
where Autor.idAutor = Livro_Autor.idAutor;

-- v. Mostre o nome dos autores, sem repetição, presentes na tabela Livro_Autor  
select distinct Autor.nome
from Autor, Livro_Autor
where Autor.idAutor = Livro_Autor.idAutor;
	-- utilizando a função join:
select distinct Autor.nome
from Livro_Autor
INNER JOIN Autor ON Livro_Autor.idAutor=Autor.idAutor;

-- vi. Mostre os autores em ordem alfabética  
select nome
from Autor
order by nome;

-- vii. Mostre o título dos livros que são da editora Rocco (3) ou da editora Scipione (4)  
select Livro.titulo, Editora.nome
from Livro, Editora
where(Livro.idEditora = 3 or Livro.idEditora = 4) and Livro.idEditora = Editora.idEditora;

-- viii. Mostre, em ordem alfabética, os autores que começam com M  
select nome from Autor
where nome like 'M%'
order by nome;

-- ix. Mostre, em ordem alfabética, os autores que começam com L  
select nome from Autor
where nome like 'L%'
order by nome;

-- x. Mostre, em ordem alfabética, os autores que NÃO começam com L  
select nome from Autor
where nome not like 'L%'
order by nome;

-- xi. Mostre, em qualquer ordem, os autores que não começam com M  
select nome from Autor
where nome not like 'M%';

-- xii. Liste apenas os livros das editoras 1 OU 5  
select * from livro
where idEditora = 1 or idEditora = 5;

-- xiii. Mostre os livros infantis das editoras 1 e 5  
SELECT * FROM livro
WHERE idGenero = 'Infantil' AND (idEditora = 1 OR idEditora = 5);

-- xiv. Mostre os códigos e os títulos dos livros, com seus respectivos preços  
select Livro.idLivro, Livro.titulo
from Livro;

-- xv. Mostre os autores em ordem contrária à alfabética 
select nome
from Autor
order by nome desc;
 
-- xvi. Liste os livros, na ordem de preços do mais caro ao mais barato  
select Livro.preco
from Livro
order by preco desc;

-- xvii. Liste os livros, na ordem de preços do mais barato ao mais caro  
select Livro.preco
from Livro
order by preco;

-- xviii. Mostre apenas os livros de autoajuda, na ordem crescente de preço  
SELECT L.*
FROM Livro L
JOIN Genero G ON L.idGenero = G.idGenero
WHERE G.descricao = 'Auto-ajuda'
ORDER BY L.preco ASC;

-- xix. Mostre quantos autores estão cadastrados
select count(*) as total_autores
from Autor;

-- xx. Mostre os preços dos livros mais baratos e mais caros da editora 1  
select min(preco) as mais_barato, max(preco) as mais_caro
from livro
where idEditora = 1;

-- xxi. Liste a média de preços dos livros da editora 2  
select avg(preco) as media_preco
from livro
where idEditora = 2;

-- xxii. Mostre os livros com seus respectivos nomes de editoras e gêneros  
SELECT 
    L.titulo AS Livro,
    E.nome AS Editora,
    G.descricao AS Genero
FROM Livro L
JOIN Editora E ON L.idEditora = E.idEditora
JOIN Genero G ON L.idGenero = G.idGenero;

-- xxiii. Liste os livros, mostrando o título de cada um bem como o nome do autor  
SELECT 
    L.titulo AS Livro,
    A.nome AS Autor
FROM Livro L
JOIN Livro_Autor LA ON L.idLivro = LA.idLivro
JOIN Autor A ON LA.idAutor = A.idAutor;
 
-- xxv. Mostre o nome dos autores dos livros que estavam no ranking da semana de 24/08/2003 a 30/08/2003  
SELECT DISTINCT A.nome AS Autor
FROM Ranking R
JOIN Ranking_Semanal RS ON R.idRanking = RS.idRanking
JOIN Livro L ON RS.idLivro = L.idLivro
JOIN Livro_Autor LA ON L.idLivro = LA.idLivro
JOIN Autor A ON LA.idAutor = A.idAutor
WHERE R.dataInicial = '2003-08-24' AND R.dataFinal = '2003-08-30';



