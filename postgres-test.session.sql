
DROP TABLE users;


CREATE TABLE users(
    first_name varchar(64),
    last_name varchar(64),
    email text
);


/*
char(5):'1234567' -> error, '12' -> '12   '
varchar(5): '1234567' -> error, '12' -> '12'

text -> max 1GB


*/