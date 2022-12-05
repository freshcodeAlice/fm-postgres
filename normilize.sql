-----Нормалізація БД-----

CREATE TABLE test(
    v1 char(13),
    v2 int
);

INSERT INTO test 
VALUES ('test', 1), ('abracadabra', 2), ('test', 1);

DELETE FROM test
WHERE v1 = 'test';

ALTER TABLE test
ADD CONSTRAINT "unique_check" UNIQUE(v1, v2);



------------


CREATE TABLE employees(
    id serial PRIMARY KEY,
    name varchar(200),
    department varchar(300),
    position varchar(300),
    car_aviability boolean
);


INSERT INTO employees (name, position, car_aviability)
VALUES
('John', 'HR', false),
('Jane', 'Sales', false),
('Jake', 'Developer', false),
('Andrew', 'driver', true);

---2NF

DROP TABLE employees;

CREATE TABLE positions (
    name varchar(300) PRIMARY KEY,
    department varchar(300),
    car_aviability boolean
);

INSERT INTO positions (name, car_aviability)
VALUES ('HR', false), ('Sales', false), ('Driver', true);

CREATE TABLE employees(
    id serial PRIMARY KEY,
    name varchar(200),
    position varchar(300) REFERENCES positions(name)
);

INSERT INTO employees (name, position) VALUES
('John', 'HR'), ('Jane', 'Sales'), ('Andrew', 'Driver');

INSERT INTO employees (name, position) VALUES
('Carl', 'Driver');


SELECT * FROM employees
JOIN positions ON employees.position = positions.name;