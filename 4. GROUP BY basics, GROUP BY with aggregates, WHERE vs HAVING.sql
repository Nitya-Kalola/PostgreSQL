CREATE TABLE employees3 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    role VARCHAR(50),
    salary INT
);

INSERT INTO employees3 VALUES
(1, 'Amit Sharma', 'Sales', 'Executive', 55000),
(2, 'Neha Patel', 'HR', 'Manager', 48000),
(3, 'Raj Verma', 'Sales', 'Executive', 62000),
(4, 'Ritika Singh', 'IT', 'Developer', 75000),
(5, 'Karan Mehta', 'Finance', 'Analyst', 68000),
(6, 'Rohit Iyer', 'Marketing', 'Executive', 52000),
(7, 'Anita Rao', 'HR', 'Recruiter', NULL),
(8, 'Rahul Das', 'Sales', 'Intern', 30000),
(9, 'Ramesh Kumar', 'Sales', 'Manager', 82000),
(10, 'Priya Shah', 'Marketing', 'Admin', 40000);

SELECT * FROM employees3;

-- 1) Count employees per department
SELECT department, COUNT(*) FROM employees3 GROUP BY department;

-- 2) Average salary per department
SELECT department, AVG(salary) FROM employees3 GROUP BY department;

-- 3) Total salary per department
SELECT department, SUM(salary) FROM employees3 GROUP BY department;

-- 4) Maximum salary per department
SELECT department, MAX(salary) FROM employees3 GROUP BY department;

-- 5) Minimum salary per department
SELECT department, MIN(salary) FROM employees3 GROUP BY department;

-- 6) Average salary per department excluding interns
SELECT department, AVG(salary) FROM employees3 WHERE role <> 'Intern' GROUP BY department;

-- 7) Total salary per department excluding HR
SELECT department, SUM(salary) FROM employees3 WHERE department <> 'HR' GROUP BY department;

-- 8) Count employees per department with salary NOT NULL
SELECT department, COUNT(*) FROM employees3 WHERE salary IS NOT NULL GROUP BY department;

-- 9) Departments with average salary > 60k
SELECT department, AVG(salary) AS avg_salary FROM employees3 GROUP BY department HAVING AVG(salary) > 60000;

-- 10) Departments with more than 2 employees
SELECT department, COUNT(*) FROM employees3 GROUP BY department HAVING COUNT(*) > 2;

-- 11) Departments where total salary > 150k
SELECT department, SUM(salary) FROM employees3 GROUP BY department HAVING SUM(salary) > 150000;

-- 12) Departments with at least one employee earning > 70k
SELECT department, MAX(salary) AS max_salary FROM employees3 GROUP BY department HAVING MAX(salary) > 70000;

-- 13) Department + role wise employee count
SELECT department, role, COUNT(*) FROM employees3 GROUP BY department, role;

-- 14) Department + role wise average salary
SELECT department, role, AVG(salary) FROM employees3 WHERE salary IS NOT NULL GROUP BY department, role;

-- 15) Department + role wise total salary
SELECT department, role, SUM(salary) FROM employees3 WHERE salary IS NOT NULL GROUP BY department, role;

-- 16) Roles that appear in more than one department
SELECT role, COUNT(DISTINCT department) FROM employees3 GROUP BY role HAVING COUNT(DISTINCT department) > 1;

-- 17) Average salary per department (excluding interns), show only departments with avg > 50k
SELECT department, AVG(salary) FROM employees3 WHERE role <> 'Intern' GROUP BY department HAVING AVG(salary) >  50000;

-- 18) Total salary per department, exclude Admin role, show only departments with total salary > 100k
SELECT department, SUM(salary) FROM employees3 WHERE role <> 'Admin' GROUP BY department HAVING SUM(salary) > 100000;

-- 19) Count employees per department, exclude NULL salaries, show only departments with count >= 2
SELECT department, COUNT(*) FROM employees3 WHERE salary IS NOT NULL GROUP BY department HAVING COUNT(*) >= 2;

/*
20) Why does this fail?

SELECT department, emp_name, AVG(salary)
FROM employees
GROUP BY department;
=> Because emp_name is Row-level data and in group by query it only takes group-level data.

21) Why can’t we use AVG(salary) in WHERE?
=> Because WHERE don't accept Aggregated value, it only used before aggregation.

22) Why does HAVING work but WHERE doesn’t for aggregates?
=> Because HAVING Support the Aggregated values like AVG, SUM, MIN or MAX or COUNT and WHERE doesn't.

23) What happens if a department has only NULL salaries and you do:
AVG(salary)
=> It gives NULL as an Output.

24) Why does GROUP BY always reduce rows?
=> Because It makes groups of specific categories and convert it into single row output.

*/