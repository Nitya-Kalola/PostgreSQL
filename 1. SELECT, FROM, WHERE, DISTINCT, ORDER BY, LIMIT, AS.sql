CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary NUMERIC(10,2) NOT NULL
);

INSERT INTO employees (emp_id, emp_name, department, salary) VALUES
(1, 'Amit Sharma', 'Sales', 55000),
(2, 'Neha Patel', 'HR', 48000),
(3, 'Rahul Verma', 'Sales', 62000),
(4, 'Pooja Singh', 'IT', 75000),
(5, 'Karan Mehta', 'Finance', 68000),
(6, 'Sneha Iyer', 'Sales', 59000);

SELECT * FROM employees;

-- 1) Show all employees from Sales.
SELECT * FROM employees WHERE department = 'Sales';

-- 2) Show names and salaries sorted by highest salary.
SELECT emp_name, salary FROM employees ORDER BY salary DESC;

-- 3) Show top 2 highest-paid employees.
SELECT * FROM employees ORDER BY salary DESC LIMIT 2;

-- 4) Show unique departments.
SELECT DISTINCT department FROM employees;

-- 5) Rename salary column as income.
SELECT salary income FROM employees;

-- 6) Show all employees earning more than 50,000.
SELECT * FROM employees WHERE salary>50000;

-- 7) Show employees from HR department.
SELECT * FROM employees WHERE department = 'HR';

-- 8) Show employees who are not from Sales.
SELECT * FROM employees WHERE department <> 'Sales';

-- 9) Show employees earning exactly 60000.
SELECT * FROM employees WHERE salary = 60000;

-- 10) Show only names of all employees.
SELECT emp_name FROM employees;

-- 11) Show name and department of all employees.
SELECT emp_name, department FROM employees;

-- 12) Show name, salary, department (change column order).
SELECT department, emp_name, salary FROM employees;

-- 13) Show employees sorted by salary (low → high).
SELECT * FROM employees ORDER BY salary;

-- 14) Show employees sorted by name alphabetically.
SELECT * FROM employees ORDER BY emp_name;

-- 15) Show employees sorted by department, then salary (highest first).
SELECT * FROM employees ORDER BY department, salary DESC;

-- 16) Show top 1 highest-paid employee.
SELECT * FROM employees ORDER BY salary DESC LIMIT 1;

-- 17) Show top 3 lowest-paid employees.
SELECT * FROM employees ORDER BY salary LIMIT 3;

-- 18) Show first 2 employees alphabetically.
SELECT * FROM employees ORDER BY emp_name LIMIT 2;

-- 19) Show unique salaries.
SELECT DISTINCT salary FROM employees;

-- 20) Show unique department + salary combinations.
SELECT DISTINCT department, salary FROM employees;

-- 21) Rename emp_name as employee.
SELECT emp_name employee FROM employees;

-- 22) Rename department as dept.
SELECT department dept FROM employees;

-- 23) Rename salary as income and sort by it.
SELECT salary AS income FROM employees ORDER BY salary; -- Here we can use ORDER BY 1 also instead of ORDER BY salary as reference to First Column of Selected Columns which is here salary.

/*
24) What happens if you write:

SELECT *
FROM employees
LIMIT 2
ORDER BY salary DESC;
& Why is this WRONG?

=> It will give an Error. It is Wrong because the Order of Query is violated.

25) Is this valid?

SELECT emp_name employee, salary income
FROM employees;

=> Yes

26) Why is this wrong?

SELECT *
FROM employees
WHERE salary > '50000';

=> Because here 50000 is covered in '', while its data type is integer. So it considered as String.
*/