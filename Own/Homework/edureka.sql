-- LEFT JOIN

SELECT *
FROM Project
LEFT JOIN Employee ON Project.EmpID = Employee.EmpID;

-- RIGHT JOIN

SELECT *
FROM Employee
RIGHT JOIN Project ON Employee.EmpID = Project.EmpID;


-- inner join

SELECT *
FROM Employee
INNER JOIN Project ON Employee.EmpID = Project.EmpID;



-- Retrieve all columns from the Employee table.
SELECT * FROM employee;

-- Retrieve the distinct ages of employees from the Employee table.(Employee name optional)

SELECT DISTINCT EmpFname, EmpLname, Age
FROM employee;

-- Retrieve the total number of projects for each employee from the Project table.

SELECT DISTINCT EmpID, COUNT(ProjectID) AS NumProjects
FROM Project
GROUP BY EmpID;

-- Retrieve the details of projects starting after January 1, 2019, from the Project table.

SELECT *
FROM project
WHERE ProjectStartDate > '2019-01-01';

-- Retrieve the details of clients from the Client table whose age is greater than 25.

SELECT * FROM Client
WHERE Age > 25;

-- Retrieve the details of employees along with the number of projects they are assigned to.

SELECT e.*, COUNT(p.ProjectID) AS NumProjects
FROM Employee e
LEFT JOIN Project p ON e.EmpID = p.EmpID
GROUP BY e.EmpID;


SELECT table_name, table_rows
FROM information_schema.tables
WHERE table_schema = 'edureka';











