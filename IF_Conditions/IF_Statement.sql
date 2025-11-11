CREATE TABLE employees
	(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    experience INT
    );
    
INSERT INTO employees (id,name,department,salary,experience)
VALUES
(1,"Alice","HR",50000,5),
(2,"Bob","Engineering",70000,8),
(3,"Charlie","HR",60000,3),
(4,"David","HR",45000,5),
(5,"Eve","Marketing",55000,4);

select * from employees;
------------------------------------------------------------------------------------------
-- If experience is more or ewual to 5 than experience level is senior otherwise Junior.
SELECT id,name,experience,
	IF(experience>=5,"Senior","Junior") AS experience_level
from employees;
------------------------------------------------------------------------------------------
-- Calculate the bonus to employees in the engineering department and a 5% bonus to Others. Display the bonus amount for each employee.
SELECT name,department,salary,
       IF(department = 'Engineering', (salary * 0.1) + salary, (salary * 0.05) + salary) AS Salary_with_Bonus
FROM employees;
------------------------------------------------------------------------------------------
-- Determine eligibility of promotion. If they have 5 or more year of experience and a salary of at least 50000.
SELECT name,department,salary,experience,
       IF(experience>=5 AND salary>=50000,"Eligible", "Not Eligible") AS Eligibility
FROM employees;
------------------------------------------------------------------------------------------
-- WAQ to determine if an employee's salary is above the average salary.Display "Above Average" otherwise below average.
select name,salary,
	if(salary>(select avg(salary) from employees),"Above Average","Below Average") as Average
from employees;