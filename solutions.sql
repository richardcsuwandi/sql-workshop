-- Create a database
CREATE DATABASE IF NOT EXISTS demo;

-- Show existing databases
SHOW DATABASES;

-- Use the created database
USE demo;

-- Create an employee table
CREATE TABLE IF NOT EXISTS employee (
	emp_id INT,
    emp_name VARCHAR(15),
    emp_age INT
);

-- Inserting values to the employee table
INSERT INTO employee 
VALUES (1, 'Bob', 30);

INSERT INTO employee 
VALUES (2, 'Jack', 25);

INSERT INTO employee 
VALUES 
	(3, 'Alice', 20),
    (4, 'Thomas', 28),
    (5, 'Dan', 23)
;

INSERT INTO employee (emp_id, emp_name)
VALUES (6, 'Ronald'); # emp_age -> NULL

-- Display the table
SELECT * FROM employee;

-- Exercise 1
USE demo;

CREATE TABLE IF NOT EXISTS students (
	student_ID INT,
    student_name VARCHAR(25),
    major VARCHAR(25)
);

INSERT INTO students 
VALUES
	(101, 'Alice', 'Accounting'),
    (102, 'Bob', 'Bioinformatics'),
    (103, 'Chris', 'Computer Science'),
    (104, 'Dave', 'Data Science'),
    (105, 'Ellen', 'Economics');
    
SELECT * FROM students;

-- Display the penguins table
SELECT * FROM penguins;

-- Select distinct values
SELECT DISTINCT species, island, body_mass_g FROM penguins;

-- Using WHERE
SELECT * FROM penguins
WHERE island = 'Torgersen';

SELECT * FROM penguins
WHERE body_mass_g > 4000; # Replace with <, <=, >=, =, !=

-- Using BETWEEN
SELECT * FROM penguins
WHERE body_mass_g BETWEEN 4000 AND 4500; # [4000, 4500]

-- Using IN
SELECT * FROM penguins
WHERE island IN ('Torgersen', 'Dream');

-- Using AND,OR,NOT
SELECT * FROM penguins
WHERE NOT (island = 'Torgersen') AND body_mass_g > 4000;

-- Exercise 2
SELECT * FROM penguins
WHERE (island IN ('Biscoe', 'Dream')) AND (body_mass_g BETWEEN 3000 AND 3500) AND NOT sex = 'Male';

-- Aggregate functions
-- COUNT()
SELECT COUNT(species) FROM penguins;

-- AVG()
SELECT AVG(body_mass_g) FROM penguins;

-- SUM()
SELECT SUM(body_mass_g) FROM penguins;

-- MIN() or MAX()
SELECT MIN(body_mass_g) FROM penguins;
SELECT MAX(body_mass_g) FROM penguins;

-- GROUP BY
SELECT species, AVG(body_mass_g) FROM penguins
GROUP BY species;

SELECT island, COUNT(species) FROM penguins
GROUP BY island;

-- HAVING
SELECT species, AVG(body_mass_g) FROM penguins
GROUP BY species
HAVING AVG(body_mass_g) > 5000;

-- ORDER BY
SELECT * FROM penguins
ORDER BY flipper_length_mm DESC; # add DESC to sort in descending order

SELECT * FROM penguins
ORDER BY species;

SELECT * FROM penguins
ORDER BY species, flipper_length_mm DESC;

-- Exercise 3
SELECT island, COUNT(species), AVG(bill_length_mm) FROM penguins
GROUP BY island
HAVING AVG(bill_length_mm) > 40
ORDER BY COUNT(species) DESC;