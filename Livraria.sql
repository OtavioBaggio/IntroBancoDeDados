create database livraria;
use livraria;

create table Cliente(
    idCliente int auto_increment,
    tipo varchar(20) not null,
    cpf varchar(14),
    cnpj varchar(18),
    cep varchar(50) not null,
    nome varchar(45) not null,

    primary key(idCliente)
);

INSERT INTO Cliente (tipo, cpf, cnpj, cep, nome) 
VALUES 
("físico", "123456789", NULL, "12345-678", "Alexandre Zamberlan"),
("físico", "45333982", NULL, "98765-432", "Gui Scher");

select *
from Cliente;

create table Transportadora(
    idTransportadora int auto_increment,
    nome varchar(150) not null,
    cnpj varchar(18) not null,
    cep varchar(50) not null,
    
    primary key(idTransportadora)
);

INSERT INTO Transportadora (nome, cnpj, cep)
VALUES ("Amazon", "2514154", "226568");

select *
from Transportadora;

create table Editor(
    idEditor int auto_increment,
    nome varchar(150) not null,
    cidade varchar(50) not null,
    pais varchar(50) not null,

    primary key(idEditor)
);

INSERT INTO Editor (nome, cidade, pais)
VALUES ("Pearson", "Rio de Janeiro", "Brasil");

select *
from Editor;

create table Categoria (
    idCategoria int auto_increment,
    descricao varchar(250) not null,
    titulo varchar(100) not null,

    primary key(idCategoria)
);

INSERT INTO Categoria (descricao, titulo)
VALUES ("Livros técnicos de banco de dados", "Banco de Dados");

create table Autor(
    idAutor int auto_increment,
    nome varchar(150) not null,
    nacionalidade varchar(50) not null,
    biografia varchar(100) not null,
    nomeFantasia varchar(45),

    primary key(idAutor)
);

INSERT INTO Autor (nome, nacionalidade, biografia, nomeFantasia)
VALUES ("Jeff Kinney", "Inglês", "Escreveu Diário de um Banana", NULL);

select * 
from Autor;

create table Livro(
    idLivro int auto_increment,
    tituloLivro varchar(150) not null,
    descricao varchar(250) not null,
    ano date not null,
    preco decimal(5,2) not null,
    livroId int,

    primary key(idLivro),
    foreign key(livroId) references Editor(idEditor) on delete restrict
);

INSERT INTO Livro (tituloLivro, descricao, ano, preco, livroId)
VALUES ("Projeto de Banco de Dados", "Banco de Dados Básico", '2008-10-10', 150.00, 1);

select * 
from Livro;

create table Venda(
    idVenda int auto_increment,
    livroId int,
    clienteId int,
    
    numeroNotaFiscal varchar(45) not null,
    data datetime not null,
    valorTotal float not null,
    
    primary key(idVenda),
    foreign key(livroId) references Livro(idLivro) ON DELETE RESTRICT,
    foreign key(clienteId) references Cliente(idCliente) ON DELETE RESTRICT
);

INSERT INTO Venda (livroId, clienteId, numeroNotaFiscal, data, valorTotal)
VALUES (1, 1, "NF-8523", '2009-09-12 00:00:00', 90.78);

select * from Venda;

create table Entrega(
    numeroProtocolo int auto_increment,
    vendaId int,
    transportadorId int,
    meioEntrega varchar(45) not null,

    primary key(numeroProtocolo),
    foreign key(vendaId) references Venda(idVenda) ON DELETE RESTRICT, 
    foreign key(transportadorId) references Transportadora(idTransportadora) ON DELETE RESTRICT
);

INSERT INTO Entrega (vendaId, transportadorId, meioEntrega)
VALUES (1, 1, "Correios");

select *
from Entrega;

create table Livro_Categoria(
    livroCategoria int auto_increment,
    livroId int,
    categoriaId int,
    
    primary key(livroCategoria),
    foreign key(livroId) references Livro(idLivro) ON DELETE RESTRICT,
    foreign key(categoriaId) references Categoria(idCategoria) ON DELETE RESTRICT
);

INSERT INTO Livro_Categoria (livroId, categoriaId)
VALUES (1, 1);

create table Autor_Livro(
    autorLivro int auto_increment,
    livroId int,
    autorId int,
    
    primary key(autorLivro),
    foreign key(livroId) references Livro(idLivro) ON DELETE RESTRICT,
    foreign key(autorId) references Autor(idAutor) ON DELETE RESTRICT
);

INSERT INTO Autor_Livro (livroId, autorId)
VALUES (1, 1);

show tables;
