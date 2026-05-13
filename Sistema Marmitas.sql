create  database sistema_marmitaria;

use sistema_marmitaria;

create table login (
	id int not null  primary key auto_increment,
	email varchar(255),
	senha varchar(255),
	nivel_acesso int not null
);

create table cliente (
	telefone varchar(255) primary key,
	nome varchar(255) not null,
	endereco varchar(255),
	pontoreferencia varchar(255),
	nascimento date
);

create table empresa (
	id int not null primary key auto_increment,
	nome varchar(255) not null,
	cnpj varchar(255),
	email varchar(255),
	telefone varchar(255),
	endereco varchar(255)
);

create table entregador (
	id int not null primary key auto_increment,
	id_empresa int,
	nome varchar(255) not null,
	cpf varchar(255),
	rg varchar(255),
	celular varchar(255),
	foreign key (id_empresa) references empresa(id)
);

create table marmita (
	id int not null primary key auto_increment,
	nome varchar(255)not null,
	descricao mediumtext,
	tamanho varchar(255),
	valor decimal(10,2)
);

create table pedido (
	id int not null primary key auto_increment,
	telefone_cliente varchar(255),
	id_entregador int,
	status varchar(255),
	taxa_entrega varchar(255),
	data datetime,
	foreign key(telefone_cliente) references cliente(telefone),
	foreign key(id_entregador) references entregador(id)
);

CREATE TABLE item_pedido (
    id_marmita INT,
    id_pedido INT,
    quantidade INT NOT NULL,
    
    PRIMARY KEY (id_marmita, id_pedido),
    
    FOREIGN KEY (id_marmita) REFERENCES marmita(id),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id)
);

alter table login
add constraint unique_email unique(email);

