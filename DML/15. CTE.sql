CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    hire_date DATE
);

INSERT INTO employee (emp_id, name, department, salary, hire_date) VALUES
(1, 'Alice', 'HR', 40000, '2020-01-15'),
(2, 'Bob', 'Finance', 55000, '2019-03-10'),
(3, 'Charlie', 'IT', 60000, '2021-07-01'),
(4, 'David', 'Finance', 52000, '2022-02-20'),
(5, 'Eva', 'IT', 75000, '2018-11-11'),
(6, 'Frank', 'HR', 42000, '2021-05-05'),
(7, 'Grace', 'Finance', 58000, '2020-09-09'),
(8, 'Helen', 'IT', 67000, '2019-12-25'),
(9, 'Ian', 'HR', 45000, '2022-06-30'),
(10, 'Jack', 'Finance', 50000, '2023-01-01');

-- Write a query using a CTE to select all employees with salary greater than 55,000.
WITH salary_above as
(
SELECT * FROM employee WHERE salary>55000	
)
SELECT * FROM salary_above;

-- Use a CTE to calculate the average salary per department, then select departments with average salary above 50,000.
WITH avg_salary_dept as
(
SELECT department, AVG(salary) as avg_salary from employee GROUP BY department HAVING AVG(salary)>50000
)
SELECT * FROM avg_salary_dept;

-- Top 2 Employees by department

WITH top_2 AS
(
SELECT *, ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) as emp_rank FROM employee
)
SELECT * FROM top_2 WHERE emp_rank<=2;

-- Write a CTE that calculates total salary per department, and then use it to find which department has the maximum total salary.
WITH dept_total AS
(
SELECT DISTINCT department, SUM(salary) OVER(PARTITION BY department) as total_salary FROM employee ORDER BY total_salary DESC
)
SELECT department,total_salary FROM dept_total LIMIT 1;

-- Use a CTE to find employees hired before 2020, then select only those from the IT department.
WITH filter_emp AS
(
SELECT * FROM employee WHERE YEAR(hire_date)<2020 AND department="IT"
)
SELECT * FROM filter_emp;


WITH RECURSIVE num_count AS (
    SELECT 1 AS N
    UNION ALL
    SELECT N + 1
    FROM num_count
    WHERE N < 5
)
SELECT * FROM num_count;