-- top 3 salary holders for the month of july, 2002

SELECT 
    e.emp_no,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    SUM(s.salary) AS total_salary,
    MONTH(s.from_date) AS salary_month,
    YEAR(s.from_date) AS salary_year
FROM 
    employees e
JOIN 
    salaries s ON e.emp_no = s.emp_no
WHERE 
    s.from_date >= '2002-07-01' AND s.from_date <= '2002-07-31' AND (s.to_date >= '2002-07-01' OR s.to_date IS NULL)
GROUP BY 
    e.emp_no, e.first_name, e.last_name, salary_month, salary_year
ORDER BY 
    total_salary DESC
LIMIT 10;



-- 8 th highest salary for the month of july, 2002

SELECT 
    e.emp_no,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    SUM(s.salary) AS total_salary,
    MONTH(s.from_date) AS salary_month,
    YEAR(s.from_date) AS salary_year
FROM 
    employees e
JOIN 
    salaries s ON e.emp_no = s.emp_no
WHERE 
    s.from_date >= '2002-07-01' AND s.from_date <= '2002-07-31' AND (s.to_date >= '2002-07-01' OR s.to_date IS NULL)
GROUP BY 
    e.emp_no, e.first_name, e.last_name, salary_month, salary_year
ORDER BY 
    total_salary DESC
LIMIT 1 OFFSET 7;


/* 
write an sql query that shows top 10 employees ranked based on their salaries for the month of july 2002 showing the details of employee name, salary month, salary year, employee designation, gender, department and joining date
*/

SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    MONTH(s.from_date) AS salary_month,
    YEAR(s.from_date) AS salary_year,
    t.title AS employee_designation,
    e.gender,
    d.dept_name AS department,
    e.hire_date AS joining_date
FROM 
    employees e
JOIN 
    salaries s ON e.emp_no = s.emp_no
JOIN 
    titles t ON e.emp_no = t.emp_no
JOIN 
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no
WHERE 
    s.from_date >= '2002-07-01' AND s.from_date <= '2002-07-31' AND (s.to_date >= '2002-07-01' OR s.to_date IS NULL)
    AND t.to_date = '9999-01-01'
    AND de.to_date = '9999-01-01'
ORDER BY 
    s.salary DESC
LIMIT 10;

/*
show me the total percentage of male and female employees in the company. show percentage values up to two decimal places.
*/

SELECT 
    gender,
    ROUND((COUNT(*) / (SELECT COUNT(*) FROM employees)) * 100, 2) AS percentage
FROM 
    employees
GROUP BY 
    gender;
    
-- show gender by departments with their percentage up to two decimal places
    
SELECT 
    d.dept_name AS department,
    e.gender,
    ROUND((COUNT(*) / (SELECT COUNT(*) FROM employees WHERE dept_emp.dept_no = d.dept_no)) * 100, 2) AS percentage
FROM 
    employees e
JOIN 
    dept_emp ON e.emp_no = dept_emp.emp_no
JOIN 
    departments d ON dept_emp.dept_no = d.dept_no
GROUP BY 
    department, gender;
    

-- show gender by departments with their percentage up to two decimal places (re-organised)
    
SELECT 
    d.dept_name AS department,
    ROUND((SUM(CASE WHEN e.gender = 'M' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS male_percentage,
    ROUND((SUM(CASE WHEN e.gender = 'F' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS female_percentage
FROM 
    employees e
JOIN 
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no
GROUP BY 
    department
ORDER BY
	female_percentage DESC;

-- show total experience of employees, their full name, employee id and their gender, and their experience in years.

SELECT 
    emp_no AS employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    gender,
--  DATEDIFF(CURDATE(), hire_date) / 365 AS experience_years
--  ROUND(DATEDIFF(CURDATE(), hire_date) / 365, 1) AS experience_years
    ROUND((DATEDIFF(CURDATE(), hire_date) / 365) + 0.5) AS experience_years
FROM 
    employees;

/*
find the median salary of males and females. 
there should be two columns in the output. one is gender another is salary_amount.
*/

SELECT 
    m.gender, ROUND(m.median_salary) AS median_salary
FROM
    (SELECT 
        'Male' AS gender, AVG(salary) AS median_salary
    FROM
        employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    WHERE
        e.gender = 'M'
    GROUP BY gender UNION ALL SELECT 
        'Female' AS gender, AVG(salary) AS median_salary
    FROM
        employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    WHERE
        e.gender = 'F'
    GROUP BY gender) AS m;


-- Retrieve the total number of employees in the company.

SELECT COUNT(*) AS Total_Employees
FROM employees;

-- Display the top 5 highest-paid employees in the company along with their names and salaries.

SELECT
CONCAT(first_name, ' ', last_name) AS employee_name,
MAX(s.salary) AS salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no
GROUP BY
employee_name 
ORDER BY
salary DESC
LIMIT 5;

/* Determine the employee with the highest total salary earned
in the month of July 2002, along with their name and total salary amount.
 */

SELECT
CONCAT(e.first_name, ' ', last_name) AS Employee_Name,
SUM(s.salary) AS Total_Salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE
s.from_date >= '2002-07-01' AND s.from_date <= '2002-07-31' AND (s.to_date>= '2002-07-01' OR s.to_date IS NULL)
GROUP BY
e.emp_no
ORDER BY
total_salary DESC
LIMIT 1;

/*
Retrieve the list of all departments and the number of employees in each department. 
If a department has no employees, display 0 as the count.
*/
SELECT 
d.dept_name, 
COUNT(de.emp_no) AS employee_count
FROM departments d
LEFT JOIN dept_emp de 
ON d.dept_no = de.dept_no
GROUP BY d.dept_name;

/*
List all employees and their salaries. 
If an employee does not have a salary record, display NULL for the salary.
*/

SELECT
CONCAT(e.first_name, " " , e.last_name) AS employee_name,
e.emp_no,
s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_no = s.emp_no;


/*
Retrieve the list of all departments and their managers' names. 
If a department does not have a manager, display "No Manager" as the manager's name.
*/
SELECT
d.dept_name,
COALESCE(CONCAT(e.first_name, " " , e.last_name), 'NO Manager') AS Manager_Name
FROM departments d
LEFT JOIN
dept_manager dm 
ON d.dept_no = dm.dept_no
LEFT JOIN
employees e
ON dm.emp_no = e.emp_no;


/*
List all employees along with the department they belong to. 
If an employee does not belong to any department, 
display "Unassigned" as the department name.
*/

SELECT
CONCAT(e.first_name, ' ', e.last_name) AS employee_Name,
COALESCE(d.dept_name, 'Unassigned') AS Department_Name
FROM employees e
LEFT JOIN dept_emp de
ON e.emp_no = de.emp_no
LEFT JOIN departments d
ON de.dept_no = d.dept_no;

/*
Retrieve the list of all employees and their managers' names. 
If an employee does not have a manager, display NULL for the manager's name.
*/

SELECT
CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
CONCAT(m.first_name, ' ', m.last_name) AS manager_name
FROM employees e
LEFT JOIN dept_emp de
ON e.emp_no = de.emp_no
LEFT JOIN dept_manager dm
ON de.dept_no = dm.dept_no
LEFT JOIN employees m
ON dm.emp_no = m.emp_no;


-- Total count of employees working under each manager with their department names

SELECT
CONCAT(m.first_name, ' ', m.last_name) AS manager_name,
d.dept_name AS department_name,
COUNT(e.emp_no) AS total_employee
FROM employees m
JOIN dept_manager dm
ON m.emp_no = dm.emp_no
JOIN departments d
ON dm.dept_no = d.dept_no
LEFT JOIN dept_emp de
ON d.dept_no = de.dept_no
LEFT JOIN employees e
ON de.emp_no = e.emp_no
GROUP BY
manager_name,
department_name;

/*
total count of each titles
*/

SELECT COUNT(title) AS title_count,
title
FROM titles
GROUP BY title;

/*
show male count and female count of each title
*/

SELECT t.title,
SUM(CASE WHEN e.gender = 'M' THEN 1 ELSE 0 END) AS Males,
SUM(CASE WHEN e.gender = 'F' THEN 1 ELSE 0 END) AS Females
FROM titles t
JOIN employees e
ON t.emp_no = e.emp_no
GROUP BY
t.title;

/*
List the department names along with the number of employees in each department.
*/

SELECT 
d.dept_name, 
COUNT(de.emp_no) AS employee_count
FROM departments d
LEFT JOIN dept_emp de
ON d.dept_no = de.dept_no
GROUP BY d.dept_name;

/*
Find duplicate data in "Salaries" table
*/

SELECT 
    CASE 
        WHEN COUNT(*) > 1 THEN NULL
        ELSE 'NULL'
    END AS duplicate_data
FROM 
    salaries
GROUP BY 
    emp_no, salary, from_date, to_date
HAVING 
    COUNT(*) > 1;


-- write a query that shows employee full name and their hiring year?

SELECT 
CONCAT(first_name, ' ', last_name) AS employee_name,
YEAR(hire_date) AS hiring_year
FROM employees;



/*
Retrieve the list of employees along with their titles and departments. 
Display the department name and the title of each employee. 
If an employee does not have a title or department assigned, display "No Title" or "No Department" respectively.
*/

SELECT DISTINCT
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    CASE 
        WHEN t.title IS NOT NULL THEN t.title
        ELSE 'No Title'
    END AS employee_title,
    CASE 
        WHEN d.dept_name IS NOT NULL THEN d.dept_name
        ELSE 'No Department'
    END AS employee_department
FROM 
    employees e
LEFT JOIN 
    titles t ON e.emp_no = t.emp_no
LEFT JOIN 
    dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN 
    departments d ON de.dept_no = d.dept_no;










