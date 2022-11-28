SELECT * FROM users;

SELECT first_name, last_name FROM users;

SELECT first_name FROM users WHERE id < 1000;

SELECT first_name, last_name FROM users WHERE gender = 'male';


/*
Зробіть запит, щоб отримати всіх користувачів, які підписані на наші новини

*/

SELECT * FROM users WHERE is_subscribe;

SELECT * FROM users WHERE height IS NOT NULL;


/*
1. Вибрати всіх юзерів, в кого парний id

2. Вибрати всіх юзерів, в кого зріст більше 1.5

3. Вибрати всіх юзерів жіногочого роду, які підписані на наші новини

*/

--1

SELECT * FROM users WHERE id % 2 = 0;

--2

SELECT * FROM users WHERE height >= 1.5;

--3

SELECT * FROM users WHERE gender = 'female' AND is_subscribe;


--------------------//////////////////-------------------------

SELECT id FROM users
WHERE id = 33333333; --empty table


SELECT * FROM users
WHERE first_name = 'William';

---

SELECT * FROM users
WHERE first_name = 'William' OR first_name = 'Ava' OR first_name = 'Test';   --v1

SELECT * FROM users
WHERE first_name IN ('William', 'Ava', 'Test', 'Daniel'); --v2


-----

SELECT * FROM users
WHERE id > 2500 AND id < 2560; --v1

SELECT * FROM users
WHERE id BETWEEN 2500 AND 2560; --v2

/* Знайдіть всіх юзерів, id яких знаходиться у проміжку 50 до 100 */

SELECT * FROM users
WHERE id BETWEEN 50 AND 100;

--------------

SELECT * FROM users
WHERE first_name LIKE 'K%';

/*   

% - будь-яку кількість будь-яких символів
_ - 1 будь-який символ
*/

SELECT * FROM users
WHERE first_name LIKE '_____';


/* Знайдіть користувачів, в імені яких 3 літери */

SELECT * FROM users
WHERE first_name LIKE '___';

SELECT * FROM users
WHERE first_name LIKE '%a';



----------------------

ALTER TABLE users
ADD COLUMN weight int CHECK (weight !=0 );

UPDATE users
SET weight = 60;


UPDATE users
SET weight = 70
WHERE id BETWEEN 2500 AND 3000;

UPDATE users
SET weight = 80
WHERE id = 5;


/*
Є таблиця співробітників (employees)
В кожного є стовбець salary (зп), work_hours (кількість відпрацьованих за місяць годин)

Всім співробітникам, які відпрацювали за місяць більше 150 годин, збільшити зп на 20%

*/

UPDATE employees
SET salary = salary * 1.2
WHERE work_hours > 150;

-------


INSERT INTO users
(first_name, last_name, email, gender, birthday, is_subscribe) VALUES 
('Usertest', 'Test', 'ertert@sdfsdfsd', 'male', '1990-12-12', false) RETURNING id;


UPDATE users
SET weight = 100
WHERE id = 2541 
RETURNING *;

DELETE FROM users
WHERE id = 2541
RETURNING *;


SELECT * FROM users
WHERE id = 2541;