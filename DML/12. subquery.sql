CREATE TABLE employee
	(
		emp_id INT PRIMARY KEY AUTO_INCREMENT,
        emp_name VARCHAR(50),
        dept_id INT,
        salary INT,
        age INT
    );
INSERT INTO employee(emp_name,dept_id,salary,age)
VALUES
	("John", 101,50000,28),
    ("Emma",101,65000,32),
    ("Raj",102,45000,26),
    ("Meera",103,70000,38),
    ("Ravi", 103, 52000, 30),
    ("Naina", 103,52000,29),
    ("Alex", 101, 58000, 31);
    
CREATE TABLE department
	(
		dept_id INT PRIMARY KEY,
        dept_name VARCHAR(50)
    );

INSERT INTO department(dept_id, dept_name)
VALUES
(101, "Sales"),
(102, "Marketing"),
(103, "Finance");

SELECT * FROM employee;
SELECT * FROM department;

-- FInd the employees whose salary is higher than the average salary
SELECT
	emp_name,
    salary,
    (SELECT AVG(salary) FROM employee) AS average_salary 
FROM employee
WHERE salary>
(SELECT AVG(salary) FROM employee);

-- Get the department name using subquery
SELECT 
    emp_name
    FROM employee
WHERE dept_id=(SELECT dept_id,dept_name FROM department WHERE dept_name="Sales");

-- Find the highest paid employee
SELECT
	emp_name,
    salary
FROM employee
WHERE salary=(SELECT MAX(salary) FROM employee);

-- Find employee older than the youngest employee
SELECT
	emp_name,
    age,
    (SELECT MIN(age) FROM employee) as youngest_emplooyee
FROM employee
WHERE age>(SELECT MIN(age) FROM employee);

-- Find employees whose salary is greater than the average salary
SELECT
	emp_name,
    salary,
    (SELECT AVG(salary) FROM employee) as average_salary
FROM employee
WHERE salary>(SELECT AVG(salary) FROM employee);

-- List employees who earn more than John
SELECT
	emp_name,
    salary,
    (SELECT salary FROM employee WHERE emp_name="John") as John_Salary
FROM employee
WHERE salary>(SELECT salary FROM employee WHERE emp_name="John");

-- Find employees in departments where the average salary is above 50000
SELECT dept_id,emp_name, salary
FROM employee
WHERE dept_id IN(
(SELECT
	dept_id
FROM employee
GROUP BY dept_id
having avg(salary)>50000));

-- FInd Employees whose salary is second highest
SELECT
	emp_name,
    salary
FROM employee
WHERE salary<(SELECT MAX(salary) FROM employee)
ORDER BY salary DESC
LIMIT 1;

-- Find employees in the same department as Emma
SELECT
	emp_name,
    dept_id
FROM employee
WHERE dept_id=(SELECT dept_id FROM employee WHERE emp_name="Emma");

-- List Departments that have nore than 2 employees.
SELECT 
	dept_name
FROM department
WHERE dept_id 
IN(SELECT dept_id FROM employee GROUP BY dept_id HAVING COUNT(dept_id)>2);

-- Find employees who earn more than every employee in marketing
SELECT
	emp_name,
    salary
FROM employee
WHERE salary>(SELECT MAX(salary) FROM employee WHERE dept_id=
(SELECT dept_id FROM department WHERE dept_name="Marketing"));

-- Find employees who earn the minimum salary in their department
SELECT e.dept_id, e.emp_name, e.salary
FROM employee e
WHERE e.salary = (
    SELECT MIN(salary)
    FROM employee
    WHERE dept_id = e.dept_id
);

-- Find employees whose salary is above the department average
SELECT emp_name,salary,dept_id
FROM employee e
WHERE salary>
(SELECT
	AVG(salary)
FROM employee
WHERE dept_id=e.dept_id);

-- List employees who are younger than emma
SELECT emp_name,age FROM employee WHERE age>
(SELECT age FROM employee WHERE emp_name="Emma");

-- Find employees who do not work in any department present in the department table.

-- Find top 2 highest salaries using subquery
select emp_name,salary from employee where salary<=
(SELECT MAX(salary) from employee);
