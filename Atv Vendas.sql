create database Vendas00;

use Vendas00;

create table loja(
	id_loja int not null auto_increment primary key,
    nome_loja varchar(100) not null,
    endereco varchar(40) not null
);

create table cliente(
 id_cliente int not null auto_increment primary key,
 nome_cliente varchar(100) not null,
 idade int null default 18
);

create table produto(
	id_produto int not null auto_increment primary key,
    nome_produto varchar(100) not null,
    marca varchar(40)not null,
    preco_unitario numeric(9,2)not null,
    custo_unitario numeric (9,2)not null
);

create  table vendas(
	id_venda int not null auto_increment primary key,
    id_loja int not null,
    id_cliente int not null,
    id_produto int not null,
    data_venda datetime null default now(),
    qtd_vendida int not null,
    
    constraint FK_loja foreign key(id_loja)
    references loja(id_loja),
    
    constraint FK_cliente foreign key(id_cliente)
    references cliente(id_cliente),
    
    constraint FK_produto foreign key(id_produto)
    references produto(id_produto)
);
