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




------------------


DROP TABLE employees;

DROP TABLE positions;


CREATE TABLE employees (
    id serial PRIMARY KEY,
    name varchar(200),
    department varchar(200),
    department_phone varchar(15)
);

INSERT INTO employees (name, department, department_phone) VALUES
('John Doe', 'HR', '23-12-15'),
('Jane Doe', 'Sales', '23-45-13'),
('Carl Moe', 'Developer', '45-67-89');

INSERT INTO employees (name, department, department_phone) VALUES
('Alex Kroe', 'Developer', '45-67-89');


CREATE TABLE departments (
    name varchar(200) PRIMARY KEY,
    phone_number varchar(15)
);

INSERT INTO departments VALUES 
('HR', '23-12-15'),
('Sales', '23-45-13'),
('Developer', '45-67-89');


ALTER TABLE employees
DROP COLUMN department_phone;


ALTER TABLE employees 
ADD FOREIGN KEY (department)
REFERENCES departments(name);


----------


CREATE TABLE students(
    id serial PRIMARY KEY,
    name varchar(30));

CREATE TABLE teachers(
    id serial PRIMARY KEY,
    name varchar(20),
    subject varchar(300) REFERENCES subjects(name)  ------<----
);

CREATE TABLE students_to_teachers(
    teacher_id int REFERENCES teachers(id),
    student_id int REFERENCES students(id),
    PRIMARY KEY (teacher_id, student_id)
);

INSERT INTO students_to_teachers VALUES
(1,1, 'biology'),
(1,2, 'biology'),
(2,1, 'math'),
(2,2, 'phisics'); ----- problem!


CREATE TABLE subjects (
    name varchar(300) PRIMARY KEY
);


------- Now:
INSERT INTO students_to_teachers VALUES
(1,1),
(1,2),
(2,1),
(2,2);

