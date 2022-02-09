-- Solution to Exercise 1
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


-- Solution to Exercise 2
SELECT * FROM penguins
WHERE (island in ('Biscoe', 'Dream')) AND (body_mass_g BETWEEN 3000 AND 3500) AND (NOT sex = 'Male');


-- Solution to Exercise 3
SELECT island, COUNT(species) AS count, AVG(bill_length_mm) as avg_bill_length
FROM penguins
GROUP BY island
HAVING avg_bill_length > 40
ORDER BY count DESC;