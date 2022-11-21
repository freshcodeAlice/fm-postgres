
DROP TABLE users;


CREATE TABLE users(
    first_name varchar(64) NOT NULL CONSTRAINT first_name_not_empty CHECK (first_name != ''),
    last_name varchar(64) NOT NULL CHECK (last_name != ''),
    email text NOT NULL CHECK (email != '') UNIQUE,
    gender varchar(30),
    is_subscribe boolean NOT NULL,
    birthday date CHECK (birthday < current_date),
    foot_size smallint,
    height numeric(3, 2) CONSTRAINT too_high_user CHECK (height < 3.0)
);

INSERT INTO users VALUES ('Test', 'Testovich', 'lol', 'male', false, '1990-01-20',  NULL, 2.10);

INSERT INTO users VALUES 
    ('Test1', 'Test2', 'mail', 'female', true, '1990-03-20', 30, 2.10),
    ('Alex', 'rewer', 'mail', 'male', true, '1990-01-20', 15, 2.10),
    ('John', 'Doe', 'mail', 'male', true, '1990-01-20', 35, 2.10),
    ('Krok', 'Step', 'mail', 'male', true, '1990-01-20', 35, 2.10);

INSERT INTO users VALUES ('Spiderman', 'Parker', 'spi@mail', 'male', false, '2022-11-22', NULL, 2.10);


/*  primary key  */

DROP TABLE messages;


CREATE TABLE messages(
    id serial PRIMARY KEY,
    body text NOT NULL CHECK (body != ''),
    author varchar(256) NOT NULL CHECK (author != ''),
    created_at timestamp DEFAULT current_timestamp,
    is_read boolean DEFAULT false
);

INSERT INTO messages VALUES ('Hello text', 'Me');


INSERT INTO messages (author, body) VALUES 
('Me', 'Hello again'),
('Me', 'And again'),
('Me', 'And again');

INSERT INTO messages VALUES (
    2, 'Text', 'author'
);


/*   primary key on two column  */

CREATE TABLE a(
    b int,
    c int,
    CONSTRAINT "unique_pair" PRIMARY KEY (b,c)
);

INSERT INTO a VALUES 
(1,1),
(1,2),
(1,3), 
(2,2), 
(2,3);

INSERT INTO a VALUES (2,2);


/* ALTER */
DROP TABLE products;

CREATE TABLE products (
    id serial PRIMARY KEY,
    brand varchar(200) NOT NULL,
    model varchar(300) NOT NULL,
    description text,
    category varchar(200) NOT NULL,
    price numeric(10,2) NOT NULL CHECK (price > 0),
    discounted_price numeric(10,2) CHECK (discounted_price <= price)
);

INSERT INTO products (brand, model, category, price) VALUES 
('Samsung', 'S10', 'smartphones', 200),
('iPhone', '5', 'smartphones', 500),
('Realme', '6', 'smartphones', 100),
('LG', '5', 'tv', 300),
('Sony', '45', 'tv', 1000);


INSERT INTO products (brand, model, category, price) VALUES 
('Samsung', 'S11', 'smartphones', 200),
('iPhone', '6', 'smartphones', 500);


ALTER TABLE products
ADD COLUMN quantity int CHECK (quantity > 0);


ALTER TABLE products
ADD CONSTRAINT "unique_brand_model_pair" UNIQUE(brand, model);


ALTER TABLE products 
DROP CONSTRAINT "products_quantity_check";

ALTER TABLE products
ADD CONSTRAINT "products_quantity_check" CHECK (quantity >= 0);


/*
 ALTER TABLE products
 ALTER COLUMN quantity SET NOT NULL 

Не можемо оновити дані і встановити констрейн - дані в таблиці містять NULL

 */


/* Books task */


CREATE TABLE books (
    id serial PRIMARY KEY,
    author varchar(256),
    name varchar(256),
    year varchar(4),
    publisher varchar(256),
    category varchar(256),
    synopsys text,
    quantity int,
    status varchar(100)
);

ALTER TABLE books
ADD CONSTRAINT "quantity_more_zero" CHECK (quantity >= 0);

ALTER TABLE books
ADD CONSTRAINT "author_name_unique" CHECK (author != '' AND name != '') UNIQUE (author, name);

