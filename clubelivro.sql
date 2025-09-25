/* Criar a Tabela*/
CREATE SCHEMA Livros;

/* Criar a tabela Livros*/
CREATE TABLE LIVROS(
    ID_LIVRO INT NOT NULL,
    NOME_LIVRO VARCHAR(100) NOT NULL,
    AUTORIA VARCHAR(100) NOT NULL,
    EDITORA VARCHAR(100) NOT NULL,
    CATEGORIA VARCHAR(100) NOT NULL,
    PRECO DECIMAL(5,2) NOT NULL,
    
    PRIMARY KEY (ID_LIVRO)
)

/* CRIAR A TABLE ESTOQUE*/
CREATE TABLE ESTOQUE (
    ID_LIVRO INT NOT NULL,
    QTD_ESTOQUE INT NOT NULL,
 PRIMARY KEY (ID_LIVRO)
);

/*TABELA VENDAS*/
CREATE TABLE VENDAS (
    ID_PEDIDO INT NOT NULL,
    ID_VENDEDOR INT NOT NULL,
    ID_LIVRO INT NOT NULL,
    QTD_VENDIDA INT NOT NULL,
    DATA_VENDA DATE NOT NULL,
 PRIMARY KEY (ID_VENDEDOR,ID_PEDIDO)
);

/* TABELA VENDEDORES */
CREATE TABLE VENDEDORES (
    ID_VENDEDOR INT NOT NULL,
    NOME_VENDEDOR VARCHAR(255) NOT NULL,
 PRIMARY KEY (ID_VENDEDOR)
);

/*Cria uma integridade referencial entre as tabelas*/
Alter Table Vendas add constraint FK_Vendas_LIVROS
foreign key (ID_LIVRO)
REFERENCES LIVROS (ID_LIVRO)
on delete no action
on update no action;

Alter Table ESTOQUE add constraint FK_ESTOQUE_LIVROS
foreign key (ID_LIVRO)
 REFERENCES LIVRO (ID_LIVRO)
on delete no action
on update no action;

alter table vendas add constraint fk_vendas_vendedores
foreign key (ID_VENDEDOR)
references vendedores(ID_VENDEDOR)
on delete no action
on update no action  

/*Anula as FK's antes de cadastrar algo*/
set FOREIGN_KEY_CHECKS = 0;


/* Add Livros a tabela livros*/
Insert into livros values(
	1,
    "Percy Jackson e o Ladrão de Raios",
    "Rick Riordan",
    "Intrínseca",
    "Aventura",
    35.65
);

INSERT INTO LIVROS VALUES
(2, 'A Volta ao Mundo em 80 Dias', 'Júlio Verne', 'Principis', 'Aventura', 21.99),
(3, 'O Cortiço', 'Aluísio de Azevedo', 'Panda Books', 'Romance', 47.8),
(4, 'Dom Casmurro', 'Machado de Assis', 'Via Leitura', 'Romance', 19.90),
(5, 'Memórias Póstumas de Brás Cubas', 'Machado de Assis', 'Antofágica', 'Romance', 45),
(6, 'Quincas Borba', 'Machado de Assis', 'L&PM Editores', 'Romance', 48.5),
(7, 'Ícaro', 'Gabriel Pedrosa', 'Ateliê', 'Poesia', 36),
(8, 'Os Lusíadas', 'Luís Vaz de Camões', 'Montecristo', 'Poesia', 18.79),
(9, 'Outros Jeitos de Usar a Boca', 'Rupi Kaur', 'Planeta', 'Poesia', 34.8);

INSERT INTO VENDEDORES
VALUES
(1,'Paula Rabelo'),
(2,'Juliana Macedo'),
(3,'Roberto Barros'),
(4,'Barbara Jales');

INSERT INTO VENDAS
VALUES
(1, 3, 7, 1, '2020-11-02'),
(2, 4, 8, 2, '2020-11-02'),
(3, 4, 4, 3, '2020-11-02'),
(4, 1, 7, 1, '2020-11-03'),
(5, 1, 6, 3, '2020-11-03'),
(6, 1, 9, 2, '2020-11-04'),
(7, 4, 1, 3, '2020-11-04'),
(8, 1, 5, 2, '2020-11-05'),
(9, 1, 2, 1, '2020-11-05'),
(10, 3, 8, 2, '2020-11-11'),
(11, 1, 1, 4, '2020-11-11'),
(12, 2, 10, 10, '2020-11-11'),
(13, 1, 12, 5, '2020-11-18'),
(14, 2, 4, 1, '2020-11-25'),
(15, 3, 13, 2,'2021-01-05'),
(16, 4, 13, 1, '2021-01-05'),
(17, 4, 4, 3, '2021-01-06'),
(18, 2, 12, 2, '2021-01-06');

INSERT INTO ESTOQUE
VALUES
(1, 7),
(2, 10),
(3, 2),
(8, 4),
(10, 5),
(11, 3),
(12, 3);

/*Selecionar todos os itens de uma tabela*/
select * from livros;

/*Selecionar apenas um item especfico de uma tabela*/
select NOME_LIVRO from livros;

/* Colocar um apelido para uma coluna da tabela*/
select ID_LIVRO as "Código do Livro" from livros;

/*Seleciona todos os livros da categoria poesia*/
select * from livros
where CATEGORIA = "POESIA";

/* Seleciona todos os livros que sao da categoria Roamance
e tem preço < 48*/
select * from livros
where CATEGORIA = "ROMANCE" and PREÇO < 48;

/* Selecione todos os livros da categoria poesia que nao sao dos autores
Luís Vaz de Camões ou Autoria = "Gabriel Pedrosa
*/
select * from livros
where CATEGORIA = "POESIA" and 
Not (Autoria = "Luís Vaz de Camões" 
or Autoria = "Gabriel Pedrosa")
;

/* Seleção Distinta*/
select distinct id_Livro from vendas
where ID_VENDEDOR = 1 order by ID_LIVRO;

/* Deletar uma linha ou transação*/
Delete from Livros where ID_LIVRO = 8;
