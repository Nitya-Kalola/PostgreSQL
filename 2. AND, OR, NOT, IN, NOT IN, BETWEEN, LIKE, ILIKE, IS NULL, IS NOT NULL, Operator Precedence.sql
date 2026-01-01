CREATE TABLE employees1 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    role VARCHAR(50),
    salary INT
);

INSERT INTO employees1 VALUES
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

SELECT * FROM employees1;

-- 1) Show all employees from Sales.
SELECT * FROM employees1 WHERE department = 'Sales';

-- 2) Show employees earning more than 50,000.
SELECT * FROM employees1 WHERE salary>50000;

-- 3) Show employees earning exactly 40000.
SELECT * FROM employees1 WHERE salary = 40000;

-- 4) Show employees whose salary is NULL.
SELECT * FROM employees1 WHERE salary IS NULL;

-- 5) Show employees whose department is NULL.
SELECT * FROM employees1 WHERE department IS NULL;

-- 6) Employees from Sales AND salary > 60000.
SELECT * FROM employees1 WHERE department = 'Sales' AND salary > 60000;

-- 7) Employees from Sales OR Marketing.
SELECT * FROM employees1 WHERE department IN ('Sales','Marketing');

-- 8) Employees from HR OR IT earning more than 50k
SELECT * FROM employees1 WHERE department IN ('HR','IT') AND salary > 50000;

-- 9) Employees NOT from HR.
SELECT * FROM employees1 WHERE department <> 'HR';

-- 10) Employees NOT interns.
SELECT * FROM employees1 WHERE role <> 'Intern';

-- 11) Employees from Sales, HR, or Marketing.
SELECT * FROM employees1 WHERE department IN ('Sales','HR','Marketing');

-- 12) Employees NOT from HR and Admin.
SELECT * FROM employees1 WHERE department <> 'HR' AND role <> 'Admin';

-- 13) Employees whose role is in ('Executive', 'Manager').
SELECT * FROM employees1 WHERE role IN ('Executive', 'Manager');

-- 14) Employees with salary between 40k and 70k.
SELECT * FROM employees1 WHERE salary BETWEEN 40000 AND 70000; -- 40000 & 70000 Both are Included.

-- 15) Employees with salary NOT between 50k and 80k.
SELECT * FROM employees1 WHERE salary NOT BETWEEN 50000 AND 80000; -- 40000 & 70000 Both are Excluded here.

-- 16) Employees earning between 30k and 50k.
SELECT * FROM employees1 WHERE salary BETWEEN 30000 AND 50000;

-- 17) Employees whose name starts with ‘R’.
SELECT * FROM employees1 WHERE emp_name LIKE 'R%';

-- 18) Employees whose name ends with ‘a’.
SELECT * FROM employees1 WHERE emp_name LIKE '%a';

-- 19) Employees whose name contains ‘it’.
SELECT * FROM employees1 WHERE emp_name LIKE '%it%'; 

-- 20) Case-insensitive search for names containing ‘raj’.
SELECT * FROM employees1 WHERE emp_name ILIKE '%raj%';

-- 21) Top 3 highest-paid employees.
SELECT * FROM employees1 WHERE salary IS NOT NULL ORDER BY salary DESC LIMIT 3;

-- 22) Bottom 2 lowest-paid employees (ignore NULLs).
SELECT * FROM employees1 WHERE salary IS NOT NULL ORDER BY salary LIMIT 2;

-- 23) Employees sorted by department, then salary DESC.
SELECT * FROM employees1 WHERE salary IS NOT NULL ORDER BY department, salary DESC;

-- 24) Show highest-paid Sales employee.
SELECT * FROM employees1 WHERE department = 'Sales' ORDER BY salary DESC LIMIT 1;

-- 25) Show unique departments.
SELECT DISTINCT department FROM employees1;

-- 26) Show unique roles.
SELECT DISTINCT role FROM employees1;

-- 27) Rename emp_name as employee and salary as income.
SELECT emp_name AS employee, salary AS income FROM employees1;

-- 28) Show departments list without duplicates, sorted alphabetically.
SELECT DISTINCT department FROM employees1 ORDER BY department;

/*
29) Why is this dangerous?
WHERE department = 'Sales' OR 'HR'

=> Cause it gives an Invalid Syntax error.

30) Why is this wrong?
WHERE salary BETWEEN 70000 AND 40000

=> Because Lower Bound(70000) of BETWEEN Operator is Greater than Upper Bound(40000).

31) What happens if you do:
ORDER BY salary DESC
& when salary has NULLs?

=> It Will Show NULL Value first as it consider the NULL Values as largest.

32) Why is IN preferred over multiple ORs?

=> Cause IN Improve the Readability & Reduce chance of getting Confused.
*/