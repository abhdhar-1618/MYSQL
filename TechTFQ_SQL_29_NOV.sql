
/* Question:1.
From the given CARS table, delete the records where car details are duplicated (Delete duplicate data)?
Answer:1.*/


CREATE TABLE IF NOT EXISTS Cars (model_id INT PRIMARY KEY, model_name VARCHAR(100), color VARCHAR(100), brand VARCHAR(100));
TRUNCATE TABLE Cars;
INSERT INTO Cars (model_id, model_name, color, brand) VALUES ('1', 'Leaf', 'Black', 'Nissan');
INSERT INTO Cars (model_id, model_name, color, brand) VALUES ('2', 'Leaf', 'Black', 'Nissan');
INSERT INTO Cars (model_id, model_name, color, brand) VALUES ('3', 'Model S', 'Black', 'Tesla');
INSERT INTO Cars (model_id, model_name, color, brand) VALUES ('4', 'Model X', 'White', 'Tesla');
INSERT INTO Cars (model_id, model_name, color, brand) VALUES ('6', 'loniq 5', 'Black', 'Hyundai');
INSERT INTO Cars (model_id, model_name, color, brand) VALUES ('7', 'loniq 6', 'White', 'Hyundai');

SELECT * FROM Cars;

-- ANSWER QUERY

DELETE c1
FROM CARS c1
JOIN CARS c2 ON c1.model_name = c2.model_name
            AND c1.color = c2.color
            AND c1.brand = c2.brand
            AND c1.model_id > c2.model_id;

SELECT * FROM Cars;
/* This query uses a self-join on the CARS table 
(c1 and c2 are aliases for different instances of the same table) and 
deletes records from the CARS table where there are duplicates based on model_name, color, and brand. 
The condition c1.model_id > c2.model_id ensures that only one of the duplicate records is retained 
(the one with the higher model_id). Adjust the conditions in the ON clause based on 
your specific criteria for identifying duplicates. */

/* Question:2.

From the given employee table, display the highest and lowest salary corresponding to each department. 
Return the result corresponding to each employee record. (Display highest and lowest salary)

Answer:2.*/

CREATE TABLE employee (id INT PRIMARY KEY,name VARCHAR(50),dept VARCHAR(50),salary INT);

INSERT INTO employee VALUES
(1, 'Alex', 'Admin', 6500),
(2, 'Leo', 'Finance', 7500),
(3, 'Robin', 'IT', 2000),
(4, 'Ali', 'IT', 4000),
(5, 'Maria', 'IT', 6000),
(6, 'Alice', 'Admin', 5000),
(7, 'Sebastian', 'HR', 3000),
(8, 'Emma', 'Finance', 4000),
(9, 'John', 'HR', 4500),
(10, 'Kabir', 'IT', 8000);

-- ANSWER QUERY

SELECT
    id,
    name,
    dept,
    salary,
    (SELECT MAX(salary) FROM employee e2 WHERE e1.dept = e2.dept) AS max_salary,
    (SELECT MIN(salary) FROM employee e3 WHERE e1.dept = e3.dept) AS min_salary
FROM employee e1;

/* In this query:
MAX(salary) and MIN(salary) are used in subqueries to get the maximum and minimum salaries for each department.
e1.dept = e2.dept and e1.dept = e3.dept ensure that the subqueries are correlated to the main query based on the department.
The result set includes the original employee details along with the corresponding maximum and minimum 
salaries for their respective departments.*/









