CREATE TABLE emp1 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT,
    salary INT,
    city VARCHAR(50)
);

CREATE TABLE dept1 (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);


INSERT INTO dept1 VALUES
(10, 'Sales', 'Mumbai'),
(20, 'HR', 'Delhi'),
(30, 'IT', 'Bangalore'),
(40, 'Marketing', 'Mumbai');

INSERT INTO emp1 VALUES
(1, 'Amit', 10, 60000, 'Mumbai'),
(2, 'Neha', 20, 45000, 'Delhi'),
(3, 'Raj', 10, 75000, 'Mumbai'),
(4, 'Kiran', 30, 80000, 'Bangalore'),
(5, 'Sonal', 30, 70000, 'Bangalore'),
(6, 'Ravi', 40, 50000, 'Mumbai'),
(7, 'Anita', 10, 60000, 'Mumbai'),
(8, 'Mohit', 20, NULL, 'Delhi');


SELECT * FROM dept1;

SELECT * FROM emp1;

-- 1) Employees earning more than company average salary
SELECT emp_name, salary FROM emp1 WHERE salary > (SELECT AVG(salary) FROM emp1);

-- 2) Employees earning less than the maximum salary
SELECT emp_name, salary FROM emp1 WHERE salary < (SELECT MAX(salary) FROM emp1);

-- 3) Employees whose salary equals the minimum salary
SELECT emp_name, salary FROM emp1 WHERE salary = (SELECT MIN(salary) FROM emp1);

-- 4) Employees working in departments located in Mumbai
SELECT e.emp_name, d.dept_name, d.location FROM emp1 e INNER JOIN dept1 d ON d.dept_id = e.dept_id WHERE d.location = 'Mumbai';

-- 5) Employees working in Sales or Marketing
SELECT e.emp_name, d.dept_name FROM emp1 e INNER JOIN dept1 d ON d.dept_id = e.dept_id WHERE d.dept_name IN ('Sales','Marketing'); 

-- 6) Employees whose salary matches any Sales employee salary
SELECT emp_name, salary FROM emp1 e WHERE EXISTS (SELECT 1 FROM emp1 s JOIN dept1 d ON s.dept_id = d.dept_id WHERE d.dept_name = 'Sales' AND s.salary = e.salary);

-- 7) Departments with total salary > 1,50,000
SELECT d.dept_name, SUM(e.salary) FROM emp1 e INNER JOIN dept1 d ON e.dept_id = d.dept_id GROUP BY d.dept_name HAVING SUM(e.salary) > 150000;

-- 8) Departments where average salary > company average
SELECT d.dept_name, AVG(e.salary) FROM emp1 e INNER JOIN dept1 d ON e.dept_id = d.dept_id GROUP BY d.dept_name HAVING AVG(e.salary) > (SELECT AVG(salary) FROM emp1);

-- 9) Employees earning more than department average
SELECT e.emp_name, e.salary, s.dept_avg_salary FROM emp1 e INNER JOIN (SELECT dept_id, AVG(salary) AS dept_avg_salary FROM emp1 GROUP BY dept_id) s ON s.dept_id = e.dept_id WHERE e.salary > s.dept_avg_salary;

-- 10) Show departments with: department name, average salary (then filter avg salary > 60k)
SELECT d.dept_name, AVG(e.salary) FROM emp1 e INNER JOIN dept1 d ON e.dept_id = d.dept_id GROUP BY d.dept_name HAVING AVG(e.salary) > 60000;

-- 11) Show departments with: department name, employee count, (then filter count ≥ 3)
SELECT d.dept_name, COUNT(*) FROM emp1 e INNER JOIN dept1 d ON e.dept_id = d.dept_id GROUP BY d.dept_name HAVING COUNT(*) >= 3;

-- 12) Employees working in departments located in Mumbai (use EXISTS)
SELECT e.emp_name, e.dept_id, e.city FROM emp1 e WHERE EXISTS (SELECT 1 FROM dept1 d WHERE d.dept_id = e.dept_id AND d.location = 'Mumbai');

-- 13) Employees who belong to any department (ignore invalid dept_id)
SELECT e.emp_name, e.dept_id FROM emp1 e WHERE EXISTS (SELECT 1 FROM dept1 d WHERE d.dept_id = e.dept_id);

-- 14) Departments that have at least one employee
SELECT d.dept_name FROM dept1 d WHERE EXISTS (SELECT 1 FROM emp1 e WHERE e.dept_id = d.dept_id);

-- 15) Employees who do NOT belong to any department
SELECT e.emp_name, e.dept_id FROM emp1 e WHERE NOT EXISTS (SELECT 1 FROM dept1 d WHERE d.dept_id = e.dept_id);

-- 16) Departments with no employees
SELECT d.dept_name FROM dept1 d WHERE NOT EXISTS (SELECT 1 FROM emp1 e WHERE e.dept_id = d.dept_id);

-- 17) Employees whose salary is NOT equal to any Sales salary
SELECT e.emp_name, e.salary FROM emp1 e WHERE NOT EXISTS (SELECT 1 FROM emp1 s JOIN dept1 d ON s.dept_id = d.dept_id WHERE d.dept_name = 'Sales' AND s.salary = e.salary);

-- 18) Why does this query FAIL? WHERE salary = (SELECT salary FROM employees WHERE dept_id = 10);
-- => Because the subquery returns multiple rows but '=' expects a single value.

-- 19) When would IN return wrong results due to NULLs?
-- => When the subquery result contains NULL, IN may return no rows because comparisons with NULL evaluate to UNKNOWN.

-- 20) Why is EXISTS usually safer than IN in production?
-- => EXISTS is safer because it is NULL-safe and only checks for row existence, while IN can return wrong results when the subquery contains NULL values.

-- 21) Why can subqueries be slower than joins?
-- => Correlated subqueries may execute once per row, while joins are usually optimized to run once.

/*
22) Why does this work?

SELECT *
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
=> Cause here subquery returns Only single value and can be used for logical operator.
*/