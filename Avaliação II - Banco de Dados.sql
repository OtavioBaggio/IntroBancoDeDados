use editora_db;
show tables;

insert into Genero values (1, "Infantil");
insert into Genero values (2, "Ficção");
insert into Genero values (3, "Romance");
insert into Genero values (4, "Auto-ajuda");
insert into Genero values (5, "Negócios");
insert into Genero values (6, "História");

select * from Genero;

insert into Editora values (1, "Ática");
insert into Editora values (2, "Makron Books");
insert into Editora values (3, "Rocco");
insert into Editora values (4, "Scipione");
insert into Editora values (5, "Sagra Luzato");

select * from Editora;

insert into Autor values (1, "Pedro");
insert into Autor values (2, "Marcos");
insert into Autor values (3, "Felipe");
insert into Autor values (4, "Ana");
insert into Autor values (5, "Maria");
insert into Autor values (6, "Francisco");
insert into Autor values (7, "Lucas");

select * from Autor;

insert into Livro values (1, "A", 25.30, 1, 1);
insert into Livro values (2, "B", 32.45, 1, 4);
insert into Livro values (3, "C", 122.00, 4, 2);
insert into Livro values (4, "D", 100.99, 4, 3);
insert into Livro values (5, "E", 16.16, 1, 5);
insert into Livro values (6, "F", 4.56, 3, 1);
insert into Livro values (7, "G", 85.20, 2, 5);
insert into Livro values (8, "H", 89.90, 5, 5);
insert into Livro values (9, "I", 63.36, 2, 2);
insert into Livro values (10, "J", 41.40, 3, 3);
insert into Livro values (11, "K", 200.30, 4, 6);
insert into Livro values (12, "L", 99.99, 2, 4);

select * from Livro;

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

insert into Ranking values (1, "20030817", "20030823");
insert into Ranking values (2, "20030824", "20030830");
insert into Ranking values (3, "20030831", "20030906");
insert into Ranking values (4, "20030907", "20030913");

select * from Ranking;

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

-- Conta quantas tuplas/linhas há na tabela Ranking_Semanal
select count(*)
from Ranking_Semanal;

-- 5.1) Selecione autores(nome) que escrevem livros do gênero Ficção:
SELECT DISTINCT a.nome
FROM Autor a
JOIN Livro_Autor la ON a.idAutor = la.idAutor
JOIN Livro l ON la.idLivro = l.idLivro
JOIN Genero g ON l.idGenero = g.idGenero
WHERE g.descricao = 'Ficção';

-- 5.2) Mostre as editoras (nome) que tem autores sob o contrato escrevendo no genero infantil:
SELECT DISTINCT e.nome
FROM Editora e 
JOIN Livro l ON e.idEditora = l.idEditora
JOIN Genero g ON l.idGenero = g.idGenero
JOIN Livro_Autor la ON l.idLivro = la.idLivro
JOIN Autor a ON la.idAutor = a.idAutor
WHERE g.descricao = 'Infantil';

-- 5.3) Mostre os livros e seus respectivos generos e editora que o autor Francisco tem escrito:
SELECT l.titulo, g.descricao AS genero, e.nome AS editora
FROM Autor a, Livro_Autor la, Livro l, Genero g, Editora e
WHERE a.idAutor = la.idAutor
  AND la.idLivro = l.idLivro
  AND l.idGenero = g.idGenero
  AND l.idEditora = e.idEditora
  AND a.nome = 'Francisco';
  
-- 5.4) Qual o autor que mais escreve livros? Mostre o nome do autor:
SELECT a.nome, COUNT(*) AS total
FROM Autor a, Livro_Autor la
WHERE a.idAutor = la.idAutor
GROUP BY a.nome
ORDER BY total DESC
LIMIT 1;

-- 5.5) Qual o genêro de livro mais publicado em todas as editoras?
SELECT g.descricao, COUNT(*) AS Publicacoes
FROM Livro l
JOIN Genero g ON l.idGenero = g.idGenero
GROUP BY g.idGenero
ORDER BY Publicacoes DESC
LIMIT 1;




