CREATE TABLE employees2 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    role VARCHAR(50),
    salary INT
);

INSERT INTO employees2 VALUES
(1, 'Amit Sharma', 'Sales', 'Executive', 55000),
(2, 'Neha Patel', 'HR', 'Manager', 48000),
(3, 'Raj Verma', 'Sales', 'Executive', 62000),
(4, 'Ritika Singh', 'IT', 'Developer', 75000),
(5, 'Karan Mehta', 'Finance', 'Analyst', 68000),
(6, 'Rohit Iyer', 'Marketing', 'Executive', 52000),
(7, 'Anita Rao', 'HR', 'Recruiter', NULL),
(8, 'Rahul Das', NULL, 'Intern', 30000),
(9, 'Ramesh Kumar', 'Sales', 'Manager', 82000),
(10, 'Priya Shah', 'Marketing', 'Admin', 40000);

-- 1) Total number of employees
SELECT COUNT(*) FROM employees2;

-- 2) Count of employees whose salary is NOT NULL
SELECT COUNT(*) FROM employees2 WHERE salary IS NOT NULL;

-- 3) Count of employees in Sales department
SELECT COUNT(*) FROM employees2 WHERE department = 'Sales';

-- 4) Count of distinct departments
SELECT COUNT(DISTINCT department) FROM employees2;

-- 5) Count of employees excluding interns
SELECT COUNT(*) FROM employees2 WHERE role <> 'Intern';

-- 6) Total salary paid to all employees
SELECT SUM(salary) FROM employees2;

-- 7) Total salary paid to Sales department
SELECT SUM(salary) FROM employees2 WHERE department = 'Sales';

-- 8) Total salary paid excluding interns
SELECT SUM(salary) FROM employees2 WHERE role <> 'Intern';

-- 9) Total salary paid to employees whose salary is above 50k
SELECT SUM(salary) FROM employees2 WHERE salary>50000;

-- 10) Average salary of all employees
SELECT AVG(salary) FROM employees2;

-- 11) Average salary excluding NULL salaries
SELECT AVG(salary) FROM employees2 WHERE salary IS NOT NULL;

-- 12) Average salary of Sales department
SELECT AVG(salary) FROM employees2 WHERE department = 'Sales'; 

-- 13) Average salary excluding interns and admins
SELECT AVG(salary) FROM employees2 WHERE role NOT IN ('Intern','Admin');

-- 14) Lowest salary in the company
SELECT MIN(salary) FROM employees2;

-- 15) Highest salary in the company
SELECT MAX(salary) FROM employees2;

-- 16) Lowest salary in Marketing department
SELECT MIN(salary) FROM employees2 WHERE department = 'Marketing';

-- 17) Highest salary among Sales employees
SELECT MAX(salary) FROM employees2 WHERE department = 'Sales';

-- 18) Count of employees earning more than 60k
SELECT COUNT(*) FROM employees2 WHERE salary > 60000;

-- 19) Average salary of employees earning between 40k and 70k
SELECT AVG(salary) FROM employees2 WHERE salary BETWEEN 40000 AND 70000;

-- 20) Total salary paid to employees not in HR
SELECT SUM(salary) FROM employees2 WHERE department <> 'HR';

/*
21) Show:

total employees

average salary

maximum salary

minimum salary
*/
SELECT COUNT(*) AS total_employees, AVG(salary) AS avg_salary, MIN(salary) AS min_salary, MAX(salary) AS max_salary FROM employees2;

/*
22) Show:

count of employees with salary

total salary

average salary
*/
SELECT COUNT(salary) AS employees_with_salary, SUM(salary) AS total_salary, AVG(salary) AS average_salary FROM employees2;


/*
23) Why does COUNT(salary) give a different result than COUNT(*)?
=> COUNT(salary) counts only non-NULL values, while COUNT(*) counts all rows, including rows where salary is NULL.

24) Why does AVG(salary) ignore NULL values?
=> Cause By Considering that NOT-NULL values gives wrong average by Averaging all values.

25) Why is this query invalid?
SELECT emp_name, AVG(salary)
FROM employees;
=> Cause AVG gives single value and emp_names are row-level data, which contains data of multiple rows.

26) Why should filtering be done in WHERE before aggregation?
=> To filterout Some groups of data & Perform operations only on required data.

27) What business mistake happens if you average salaries including interns?
=> Stipend of intern is too low and by considering their stipend may lead to lower average value of company.
*/