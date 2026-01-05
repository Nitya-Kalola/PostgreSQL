CREATE TABLE emp (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT,
    manager_id INT,
    salary INT
);

CREATE TABLE dept (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO dept VALUES
(10, 'Sales'),
(20, 'HR'),
(30, 'Marketing'),
(40, 'Finance');

INSERT INTO emp VALUES
(1, 'Amit', 10, NULL, 50000),
(2, 'Neha', 20, 1, 40000),
(3, 'Raj', 10, 1, 60000),
(4, 'Kiran', NULL, 1, 45000),
(5, 'Sonal', 30, 3, 55000),
(6, 'Ravi', 50, 1, 70000);

SELECT * FROM dept;

SELECT * FROM emp;

-- 1) Show employee name with department name
SELECT e.emp_name, d.dept_name FROM emp e INNER JOIN dept d ON e.dept_id = d.dept_id;

-- 2) Show employees working in Sales department only
SELECT e.emp_name, d.dept_name FROM emp e INNER JOIN dept d ON e.dept_id = d.dept_id WHERE d.dept_name = 'Sales';

-- 3) Show employees whose department exists in department table
SELECT e.emp_name, d.dept_name FROM emp e INNER JOIN dept d ON e.dept_id = d. dept_id;

-- 4) Show all employees with their department name (even if missing)
SELECT e.emp_name, d.dept_name FROM emp e LEFT JOIN dept d ON e.dept_id = d.dept_id;

-- 5) Show employees who do not belong to any department
SELECT e.emp_name, d.dept_name FROM emp e LEFT JOIN dept d ON d.dept_id = e.dept_id WHERE d.dept_id IS NULL;

-- 6) Show employees whose department does not exist in departments table
SELECT e.emp_name, d.dept_name FROM emp e LEFT JOIN dept d ON d.dept_id = e.dept_id WHERE e.dept_id IS NOT NULL AND d.dept_id IS NULL;

-- 7) Show all departments with employee names
SELECT d.dept_name, e.emp_name FROM emp e RIGHT JOIN dept d ON d.dept_id = e.dept_id;

-- 8) Show departments that have no employees
SELECT d.dept_name, e.emp_name FROM emp e RIGHT JOIN dept d ON d.dept_id = e.dept_id WHERE e.emp_name IS NULL;

-- 9) Show all employees and all departments — matched or not
SELECT e.emp_name, d.dept_name FROM emp e FULL JOIN dept d ON d.dept_id = e.dept_id;

/*
10) Identify:

employees without departments

departments without employees
(single query)
*/
SELECT e.emp_name, d.dept_name FROM emp e FULL JOIN dept d ON d.dept_id = e.dept_id WHERE d.dept_name IS NULL OR e.emp_name IS NULL;

-- 11) Show employee name with manager name
SELECT e.emp_name, m.emp_name AS manager_name FROM emp e LEFT JOIN emp m ON e.manager_id = m.emp_id;

-- 12) Show employees who do not have a manager
SELECT e.emp_name, m.emp_name AS manager_name FROM emp e LEFT JOIN emp m ON e.manager_id =m.emp_id WHERE e.manager_id IS NULL;

-- 13) Show employees reporting to Amit
SELECT e.emp_name, m.emp_name AS manager_name FROM emp e LEFT JOIN emp m ON e.manager_id = m.emp_id WHERE m.emp_name = 'Amit';

/*
14) Show all employees with department name = 'Sales'
⚠️ Do NOT convert LEFT JOIN to INNER JOIN accidentally
*/
SELECT e.emp_name, d.dept_name FROM emp e LEFT JOIN dept d ON e.dept_id = d.dept_id WHERE d.dept_name = 'Sales';

-- 15) Show all employees, but show department name only for Sales (others should show NULL)
SELECT e.emp_name, d.dept_name FROM emp e LEFT JOIN dept d ON e.dept_id = d.dept_id AND d.dept_name = 'Sales';

-- 16) Show all possible employee–department combinations
SELECT e.emp_name, d.dept_name FROM emp e CROSS JOIN dept d;

-- 17) How many rows should the above query return? (answer in words)
-- => 24

-- 18) Show total salary per department name
SELECT d.dept_name, SUM(salary) FROM emp e RIGHT JOIN dept d ON d.dept_id = e.dept_id GROUP BY d.dept_name;

-- 19) Show department name with average salary, include departments even if they have no employees
SELECT d.dept_name, AVG(salary) FROM emp e RIGHT JOIN dept d ON d.dept_id = e.dept_id GROUP BY d.dept_name; 

-- 20) Show highest-paid salary per department name
SELECT d.dept_name, MAX(salary) FROM emp e RIGHT JOIN dept d ON d.dept_id = e.dept_id GROUP BY d.dept_name;

-- 21) Why does filtering in WHERE break a LEFT JOIN?
-- => Because WHERE runs after the JOIN and doesn’t care about preserving rows.

/*
22) Difference between:

ON e.dept_id = d.dept_id
vs
WHERE d.dept_id = e.dept_id
=> ON e.dept_id = d.dept_id controls how rows are matched during the JOIN; WHERE d.dept_id = e.dept_id filters rows after the JOIN and can remove NULLs, breaking OUTER JOINs.
*/

-- 23) What happens if you forget the ON condition in a JOIN?
-- => PostgreSQL does NOT allow you to forget the ON condition for INNER / LEFT / RIGHT / FULL JOIN. The query FAILS with an error.

-- 24) Why do analysts prefer LEFT JOIN over RIGHT JOIN?
-- => LEFT JOIN keeps the “primary dataset” on the left side — the table They are analyzing — and never drops its rows.