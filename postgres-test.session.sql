
DROP TABLE users;


CREATE TABLE users(
    first_name varchar(64),
    last_name varchar(64),
    email text,
    gender varchar(30),
    is_subscribe boolean,
    birthday date,
    foot_size smallint,
    height numeric(3, 2)
);

INSERT INTO users VALUES ('Test', 'Testovich',  NULL, 'male',  NULL, '1990-01-20',  NULL, 2.10);

INSERT INTO users VALUES 
    ('Test1', ' ', 'mail', 'female', true, '1990-03-20', 30, 2.10),
    (' ', 'rewer', ' ', 'male', true, '1990-01-20', 15, 2.10),
    ('John', 'Doe', 'mail', 'male', true, '1990-01-20', 35, 2.10),
    (' ', ' ', 'mail', 'male', true, '1990-01-20', 35, 2.10);


INSERT INTO users VALUES (NULL, NULL,  NULL, NULL,  NULL, NULL,  NULL, NULL);