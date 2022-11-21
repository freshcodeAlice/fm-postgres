
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


/*    */

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