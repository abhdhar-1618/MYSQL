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








