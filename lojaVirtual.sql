
create database lojaVirtual;

use lojaVirtual;


create table Clientes(
id_cliente int not null auto_increment primary key,
nome varchar(100)not null,
email varchar(100)not null,
telefone varchar(20)not null
);

create table Produtos(
id_produto int not null auto_increment primary key,
nome varchar(100) not null,
preco numeric(9,2) not null default 0,
estoque int not null

);



insert into Clientes (nome,email,telefone)values(
"Rodrigo","rrodovalho@gmail.com","(71)99268-5267"),
("Lucas","lucas2222@gmail.com","(71)98226-6487"),
("Rafael","rafaelgm@hotmail.com","(71)98222-4848"),
("Isaac","isaaclp@gmail.com","(71)98699-2334"),
("Anildo","anildosilva@senaicimatec.com","(71)98774-0101"
);

insert into Produtos (nome, preco, estoque)values(
"Camisa",50.00,60),
("Calça",69.90,80),
("Blusa",49.90,60),
("Meia",20.99,50),
("Bermuda",70.99,100
);


alter table Clientes 
add column data_cadastro datetime default now();

alter table Produtos
add column categoria varchar(50) not null;

update Produtos set Preco = 55.00 where id_produto = 1;



update Clientes set telefone = "(71)98874-5262" where id_cliente = 1;

delete from clientes  where id_cliente = 5;

delete from Produtos where id_produto = 4;

drop table Produtos;


select * from  produtos;







