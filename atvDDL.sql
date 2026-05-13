create database aula0104;
use aula0104;



create table users (
    id_users int not null primary key auto_increment,
    name varchar(100) not null,
    email varchar(100) not null,
    password_hash varchar(100) not null,
    created_at timestamp default now(),
    phone varchar(100) not null
);

create table addresses (
    id_addresses int not null primary key auto_increment,
    id_users int not null,
    street varchar(100) not null,
    city varchar(100) not null,
    state varchar(100) not null,
    zip varchar(100) not null,
    type int not null,
    is_default timestamp default now(),
    constraint FK_addresses_users foreign key (id_users) references users(id_users)
);

create table shopping_cart(
    id_shopping int not null primary key auto_increment,
    id_users int not null,
    created_at timestamp default now(),
    updated_at timestamp default now(),
    constraint FK_shopping_cart_users foreign key(id_users) references users(id_users)
);


create table categories(
    id_categories int not null primary key auto_increment,
    name_categories varchar(100) not null,
    description varchar(100) not null,
    id_parent_categories int not null, -- Alterado para null para categorias principais
    constraint FK_categories_parent foreign key (id_parent_categories) references categories(id_categories)
);


create table products(
    id_products int not null primary key auto_increment,
    id_categories int not null,
    name_products varchar(100) not null,
    description_products varchar(100) not null,
    price decimal(10,2) not null, 
    stock int not null, 
    sku varchar(100) not null, 
    image_url varchar(255) not null,
    constraint FK_products_categories foreign key(id_categories) references categories(id_categories)
);

create table cart_items(
    id_cart_item int not null primary key auto_increment,
    id_shopping int not null,
    id_products int not null,
    quantity int not null,
    constraint FK_cart_items_shopping foreign key(id_shopping) references shopping_cart(id_shopping),
    constraint FK_cart_items_products foreign key(id_products) references products(id_products)
);

create table orders(
	id_orders int not null primary key auto_increment,
	id_users int not null,
    id_addresses int not null,
    order_date timestamp default now(),
    total_amount decimal(10,2) not null,
    status varchar(100) not null,
    constraint FK_orders_users foreign key(id_users) references users(id_users),
    constraint FK_orders_addresses foreign key(id_addresses) references addresses(id_addresses)
);

create table payments(
	id_payments int not null primary key auto_increment,
    id_orders int not null,
    payment_method varchar(100)not null,
    amount decimal (10,2) not null,
    payment_status decimal(10,2) not null,
    id_trasaction int not null,
    constraint FK_payments_orders foreign key(id_orders) references orders(id_orders)
);

create table order_items(
	id_order_items int not null primary key auto_increment,
    id_orders int not null,
    id_products int not null,
    quantity int not null,
    price_at_purchase int not null,
    constraint FK_order_item_orders foreign key(id_orders) references orders(id_orders),
    constraint FK_order_items_products foreign key(id_products) references products(id_products)
);


 alter table users
 add column cpf varchar (11) unique ;
 
drop table shopping_cart;

insert into users (name, email, password_hash, phone)
values('joao silva', 'joao@email.com','$454500bc','(71) 991915587');

insert into addresses (id_users, street, city,state,zip,type, is_default)
values(
	1,'Rua das flores 123','salvador','BA','01010-000',1,now());
    
INSERT INTO products (id_categories, name_products, description_products, price, stock, sku, image_url) 
VALUES (5, 'Fone Bluetooth G3', 'Fone com cancelamento de ruído', 299.90, 50, 'FONE-G3-001', 'url_da_imagem.jpg');

select * from categories;
insert into categories (id_categories, name_categories, description) 
VALUES (5, 'Eletrônicos', 'Produtos eletrônicos e gadgets');


SET SQL_SAFE_UPDATES = 0;
UPDATE products SET price = price * 1.10;
update products set stock = stock - 5 where id_products = 10;

update payments set payment_status = 1, amount = 150.00 where id_orders = 500;
update addresses set is_default = null where id_users = 3;


delete from cart_items where id_shopping in (select id_shopping from shopping_cart where created_at < '2024-01-01');
delete from shopping_cart where created_at < '2024-01-01';

delete from products where sku = 'OLD-123';

delete from orders where id_orders = 999;

insert into order_items (id_orders, id_products, quantity, price_at_purchase)
select 123, id_products, 1, price 
from products 
where id_products = 1;


