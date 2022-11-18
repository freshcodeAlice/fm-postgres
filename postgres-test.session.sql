
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


/*
char(5):'1234567' -> error, '12' -> '12   '
varchar(5): '1234567' -> error, '12' -> '12'

text -> max 1GB


*/