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

/*Selecionar todos os itens de uma tabela*/
select * from livros;

/*Selecionar apenas um item especfico de uma tabela*/
select NOME_LIVRO from livros;

/* Colocar um apelido para uma coluna da tabela*/
select ID_LIVRO as "Código do Livro" from livros;

/**/
select * from livros
where CATEGORIA = "POESIA";